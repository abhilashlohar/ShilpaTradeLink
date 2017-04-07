<?php
namespace App\Controller;

use App\Controller\AppController;

/**
 * InvoiceBookings Controller
 *
 * @property \App\Model\Table\InvoiceBookingsTable $InvoiceBookings
 */
class InvoiceBookingsController extends AppController
{

    /**
     * Index method
     *
     * @return \Cake\Network\Response|null
     */
    public function index($status=null)
    {
		$this->viewBuilder()->layout('index_layout');
		$session = $this->request->session();
		$st_company_id = $session->read('st_company_id');
        $this->paginate = [
            'contain' => ['Grns']
        ];
		
		$invoiceBookings = $this->paginate($this->InvoiceBookings->find()->where(['InvoiceBookings.company_id'=>$st_company_id])->order(['InvoiceBookings.id' => 'DESC']));

        $this->set(compact('invoiceBookings','status'));
        $this->set('_serialize', ['invoiceBookings']);
    }

    /**
     * View method
     *
     * @param string|null $id Invoice Booking id.
     * @return \Cake\Network\Response|null
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function view($id = null)
    {
		$this->viewBuilder()->layout('index_layout');
        $invoiceBooking = $this->InvoiceBookings->get($id, [
            'contain' => ['InvoiceBookingRows'=>['Items'],'Creator','Companies']
        ]);

        $this->set('invoiceBooking', $invoiceBooking);
        $this->set('_serialize', ['invoiceBooking']);
    }

    /**
     * Add method
     *
     * @return \Cake\Network\Response|void Redirects on successful add, renders view otherwise.
     */
    public function add()
    {
		$this->viewBuilder()->layout('index_layout');
		$session = $this->request->session();
		$st_company_id = $session->read('st_company_id');
		$st_year_id = $session->read('st_year_id');

       $SessionCheckDate = $this->FinancialYears->get($st_year_id);
       $fromdate1 = date("Y-m-d",strtotime($SessionCheckDate->date_from));   
       $todate1 = date("Y-m-d",strtotime($SessionCheckDate->date_to)); 
       $tody1 = date("Y-m-d");

       $fromdate = strtotime($fromdate1);
       $todate = strtotime($todate1); 
       $tody = strtotime($tody1);

      if($fromdate > $tody || $todate < $tody)
       {
       	   $chkdate = 'Not Found';
       }
       else
       {
       	  $chkdate = 'Found';
       }

		$grn_id=@(int)$this->request->query('grn');
		$grn=array();
		if(!empty($grn_id)){
			$grn = $this->InvoiceBookings->Grns->get($grn_id, [
				'contain' => ['GrnRows'=>['Items'],'Companies','Vendors','PurchaseOrders'=>['PurchaseOrderRows']]
			]);
			if($grn->purchase_order->discount_type=='%'){
					$discount=($grn->purchase_order->total*$grn->purchase_order->discount)/100;
			}else{
				$discount=$grn->purchase_order->discount;
			}
			$excise_duty=$grn->purchase_order->excise_duty;
			$tot_sale_tax=(($grn->purchase_order->total-$discount)*$grn->purchase_order->sale_tax_per)/100;
			
			$vendor_id=$grn->vendor->id; 
			$v_LedgerAccount=$this->InvoiceBookings->LedgerAccounts->find()->where(['company_id'=>$st_company_id,'source_model'=>'Vendors','source_id'=>$vendor_id])->first();
			$vendor_ledger_acc_id=$v_LedgerAccount->id;
			
			
		}
		$last_ib_no=$this->InvoiceBookings->find()->select(['ib2'])->where(['company_id' => $st_company_id])->order(['ib2' => 'DESC'])->first();
		if($last_ib_no){
			@$last_ib_no->ib2=$last_ib_no->ib2+1;
		}else{
			@$last_ib_no->ib2=1;
			}
		$q=0; $item_total_rate=0;
		foreach ($grn->grn_rows as $grn_rows){
			$dis=($discount*$grn->purchase_order->purchase_order_rows[$q]->amount)/$grn->purchase_order->total;
			$item_discount=$dis/$grn->purchase_order->purchase_order_rows[$q]->quantity;
			$item_total_rate+=$grn->purchase_order->purchase_order_rows[$q]->amount-$dis;
			$q++;
		} 
		$this->set(compact('grn','last_ib_no','discount','tot_sale_tax','chkdate','item_total_rate','excise_duty'));
		$invoiceBooking = $this->InvoiceBookings->newEntity();
		if ($this->request->is('post')) { 
		$total_row=sizeof($this->request->data['reference_no']);
		
            $invoiceBooking = $this->InvoiceBookings->patchEntity($invoiceBooking, $this->request->data);
			
			$invoiceBooking->grn_id=$grn_id; 
			$invoiceBooking->created_on=date("Y-m-d");
			$invoiceBooking->company_id=$st_company_id;
			$invoiceBooking->supplier_date=date("Y-m-d",strtotime($invoiceBooking->supplier_date)); 
			$invoiceBooking->created_by=$this->viewVars['s_employee_id'];
			$invoiceBooking->due_payment=$invoiceBooking->total;
			//pr($invoiceBooking); exit;
			
			
			
            if ($this->InvoiceBookings->save($invoiceBooking)) {
			
				$i=0; 
				foreach($invoiceBooking->invoice_booking_rows as $invoice_booking_row)
				{
				$item_id=$invoice_booking_row->item_id;
				$rate=$invoice_booking_row->rate;
				$query = $this->InvoiceBookings->ItemLedgers->query();
				$query->update()
					->set(['rate' => $rate, 'rate_updated' => 'Yes'])
					->where(['item_id' => $item_id, 'source_id' => $grn_id, 'source_model'=> 'Grns'])
					->execute();
				
				$results=$this->InvoiceBookings->ItemLedgers->find()->where(['ItemLedgers.item_id' => $item_id,'ItemLedgers.in_out' => 'In','rate_updated' => 'Yes','company_id' => $st_company_id])->toArray(); 
				
				$j=0; $qty_total=0; $rate_total=0; $per_unit_cost=0;
				foreach($results as $result){
					$qty=$result->quantity;
					$rate=$result->rate;
					@$total_amount=$qty*$rate;
					$rate_total=$rate_total+$total_amount;
					$qty_total=$qty_total+$qty;
				$j++;
				}
				
				$per_unit_cost=$rate_total/$qty_total;
				$query1 = $this->InvoiceBookings->Items->ItemCompanies->query();
				$query1->update()
					->set(['dynamic_cost' => $per_unit_cost])
					->where(['company_id' => $st_company_id,'item_id'=>$item_id])
					->execute();
				$i++;
				}
				if(!empty($grn_id)){
					//$grn = $this->InvoiceBookings->Grns->get($grn_id);
					$grn = $this->InvoiceBookings->Grns->get($grn_id, [
								'contain' => ['GrnRows'=>['Items'],'Companies','Vendors','PurchaseOrders'=>['PurchaseOrderRows']]
							]);
					$grn->status='Invoice-Booked';
					$this->InvoiceBookings->Grns->save($grn);
				}
				$accountReferences = $this->InvoiceBookings->AccountReferences->get(2);
				
				//ledger posting for PURCHASE ACCOUNT
				$ledger = $this->InvoiceBookings->Ledgers->newEntity();
				$ledger->ledger_account_id = $invoiceBooking->purchase_ledger_account;
				$ledger->debit = $invoiceBooking->total;
				$ledger->credit = 0;
				$ledger->voucher_id = $invoiceBooking->id;
				$ledger->company_id = $invoiceBooking->company_id;
				$ledger->voucher_source = 'Invoice Booking';
				$ledger->transaction_date = $invoiceBooking->supplier_date;
				//pr($ledger); exit;
				$this->InvoiceBookings->Ledgers->save($ledger);
				
				//Ledger posting for SUPPLIER
				$c_LedgerAccount=$this->InvoiceBookings->LedgerAccounts->find()->where(['company_id'=>$st_company_id,'source_model'=>'Vendors','source_id'=>$grn->vendor_id])->first();
				
				$ledger = $this->InvoiceBookings->Ledgers->newEntity();
				$ledger->ledger_account_id = $c_LedgerAccount->id;
				$ledger->debit = 0;
				$ledger->credit =$invoiceBooking->total;
				$ledger->voucher_id = $invoiceBooking->id;
				$ledger->company_id = $invoiceBooking->company_id;
				$ledger->transaction_date = $invoiceBooking->supplier_date;
				$ledger->voucher_source = 'Invoice Booking';
				$this->InvoiceBookings->Ledgers->save($ledger);
				
				
				for($row=0; $row<$total_row; $row++)
				{
					////////////////  ReferenceDetails ////////////////////////////////
					$query1 = $this->InvoiceBookings->ReferenceDetails->query();
					$query1->insert(['reference_no', 'ledger_account_id', 'invoice_booking_id', 'credit', 'reference_type'])
					->values([
						'ledger_account_id' => $this->request->data['vendor_ledger_id'],
						'invoice_booking_id' => $invoiceBooking->id,
						'reference_no' => $this->request->data['reference_no'][$row],
						'credit' => $this->request->data['debit'][$row],
						'reference_type' => $this->request->data['reference_type'][$row]
					])
					->execute();
					//pr($query1)->toArray(); exit;
					////////////////  ReferenceBalances ////////////////////////////////
					if($this->request->data['reference_type'][$row]=='Against Reference')
					{
						$query2 = $this->InvoiceBookings->ReferenceBalances->query();
						$query2->update()
							->set(['credit' => $this->request->data['debit'][$row]])
							->where(['reference_no' => $this->request->data['reference_no'][$row],'ledger_account_id' => $this->request->data['vendor_ledger_id']])
							->execute();
					}
					else
					{
						$query2 = $this->InvoiceBookings->ReferenceBalances->query();
						$query2->insert(['reference_no', 'ledger_account_id', 'credit'])
						->values([
							'reference_no' => $this->request->data['reference_no'][$row],
							'ledger_account_id' => $this->request->data['vendor_ledger_id'],
							'credit' => $this->request->data['debit'][$row],
						])
						->execute();
					}
					
				}
				
				
                $this->Flash->success(__('The invoice booking has been saved.'));

                return $this->redirect(['action' => 'index']);
            } else {
                $this->Flash->error(__('The invoice booking could not be saved. Please, try again.'));
            }
        }
		
		
		$AccountReference= $this->InvoiceBookings->AccountReferences->get(2);
		$ledger_account_details = $this->InvoiceBookings->LedgerAccounts->find('list')->contain(['AccountSecondSubgroups'=>['AccountFirstSubgroups' => function($q) use($AccountReference){
			return $q->where(['AccountFirstSubgroups.id'=>$AccountReference->account_first_subgroup_id]);
		}]])->order(['LedgerAccounts.name' => 'ASC'])->where(['LedgerAccounts.company_id'=>$st_company_id]);
		//pr($ledger_account_details->toArray()); exit;
		
		$companies = $this->InvoiceBookings->Companies->find('all');
        $grns = $this->InvoiceBookings->Grns->find('list', ['limit' => 200]);
        $this->set(compact('invoiceBooking', 'grns','companies','ledger_account_details','vendor_ledger_acc_id'));
        $this->set('_serialize', ['invoiceBooking']);
    }

    /**
     * Edit method
     *
     * @param string|null $id Invoice Booking id.
     * @return \Cake\Network\Response|void Redirects on successful edit, renders view otherwise.
     * @throws \Cake\Network\Exception\NotFoundException When record not found.
     */
    public function edit($id = null)
    {
	$this->viewBuilder()->layout('index_layout');
	$session = $this->request->session();
	$invoice_booking_id=$id;
	$st_company_id = $session->read('st_company_id');
        $invoiceBooking = $this->InvoiceBookings->get($id, [
            'contain' => ['InvoiceBookingRows' => ['Items'],'Grns'=>['Companies','Vendors','GrnRows'=>['Items'],'PurchaseOrders'=>['PurchaseOrderRows']]]
        ]);
		
		$vendor_id=$invoiceBooking->grn->vendor->id; 
		$v_LedgerAccount=$this->InvoiceBookings->LedgerAccounts->find()->where(['company_id'=>$st_company_id,'source_model'=>'Vendors','source_id'=>$vendor_id])->first();
		$vendor_ledger_acc_id=$v_LedgerAccount->id;
		 
		$ReferenceDetails = $this->InvoiceBookings->ReferenceDetails->find()->where(['ledger_account_id'=>$vendor_ledger_acc_id,'invoice_booking_id'=>$id])->toArray();
		if(!empty($ReferenceDetails))
		{
			foreach($ReferenceDetails as $ReferenceDetail)
			{  //pr($ReferenceDetail->ledger_account_id); exit;
				$ReferenceBalances[] = $this->InvoiceBookings->ReferenceBalances->find()->where(['ledger_account_id'=>$ReferenceDetail->ledger_account_id,'reference_no'=>$ReferenceDetail->reference_no])->toArray();
			}
		}
		else{
			$ReferenceBalances='';
		}
		
		
		$Em = new FinancialYearsController;
	    $financial_year_data = $Em->checkFinancialYear($invoiceBooking->created_on);

		
        if ($this->request->is(['patch', 'post', 'put'])) {
            $invoiceBooking = $this->InvoiceBookings->patchEntity($invoiceBooking, $this->request->data);
			$invoiceBooking->supplier_date=date("Y-m-d",strtotime($invoiceBooking->supplier_date)); 

            if ($this->InvoiceBookings->save($invoiceBooking)) {
				$total_row=sizeof($this->request->data['reference_no']);
				
				$invoiceBookingId=$invoiceBooking->id;
				$grn_id=$invoiceBooking->grn_id;
				
				if(!empty($grn_id)){
					$grn = $this->InvoiceBookings->Grns->get($grn_id, [
					'contain' => ['GrnRows'=>['Items'],'Companies','Vendors','PurchaseOrders'=>['PurchaseOrderRows']]
					]);
				}
				$this->InvoiceBookings->Ledgers->deleteAll(['voucher_id' =>$invoiceBookingId, 'voucher_source' => 'Invoice Booking']);
				$i=0; 
				foreach($invoiceBooking->invoice_booking_rows as $invoice_booking_row)
				{
				$item_id=$invoice_booking_row->item_id;
				$rate=$invoice_booking_row->rate;
				$query = $this->InvoiceBookings->ItemLedgers->query();
				$query->update()
					->set(['rate' => $rate, 'rate_updated' => 'Yes'])
					->where(['item_id' => $item_id, 'source_id' => $grn_id, 'source_model'=> 'Grns'])
					->execute();
				$results=$this->InvoiceBookings->ItemLedgers->find()->where(['ItemLedgers.item_id' => $item_id,'ItemLedgers.in_out' => 'In','rate_updated' => 'Yes','company_id' => $st_company_id])->toArray(); 
				$j=0; $qty_total=0; $rate_total=0; $per_unit_cost=0;
				foreach($results as $result){
					$qty=$result->quantity;
					$rate=$result->rate;
					@$total_amount=$qty*$rate;
					$rate_total=$rate_total+$total_amount;
					$qty_total=$qty_total+$qty;
				$j++;
				}
				
				$per_unit_cost=$rate_total/$qty_total;
				$query1 = $this->InvoiceBookings->Items->query();
				$query1->update()
					->set(['dynamic_cost' => $per_unit_cost])
					->where(['id' => $item_id])
					->execute();
				$i++;
				}
				$accountReferences = $this->InvoiceBookings->AccountReferences->get(2);
				
				//ledger posting
				$ledger = $this->InvoiceBookings->Ledgers->newEntity();
				$ledger->ledger_account_id = $accountReferences->ledger_account_id;
				$ledger->debit = $invoiceBooking->total;
				$ledger->credit = 0;
				$ledger->voucher_id = $invoiceBooking->id;
				$ledger->voucher_source = 'Invoice Booking';
				$ledger->company_id = $invoiceBooking->company_id;
				$ledger->transaction_date = $invoiceBooking->supplier_date;
				$this->InvoiceBookings->Ledgers->save($ledger);
				
				
				//Ledger posting for bankcash
				$v_LedgerAccount=$this->InvoiceBookings->LedgerAccounts->find()->where(['company_id'=>$st_company_id,'source_model'=>'Vendors','source_id'=>$vendor_id])->first();
				
				$ledger = $this->InvoiceBookings->Ledgers->newEntity();
				//pr($grn->vendor->ledger_account_id); exit;
				$ledger->ledger_account_id = $v_LedgerAccount->id;
				//pr($ledger->ledger_account_id); exit;
				$ledger->debit = 0;
				$ledger->credit =$invoiceBooking->total;
				$ledger->voucher_id = $invoiceBooking->id;
				$ledger->transaction_date = $invoiceBooking->supplier_date;
				$ledger->company_id = $invoiceBooking->company_id;
				$ledger->voucher_source = 'Invoice Booking';
				$this->InvoiceBookings->Ledgers->save($ledger);
				
				for($row=0; $row<$total_row; $row++)
				{
					if(!empty($this->request->data['old_amount'][$row]))
					{				////////////////  ReferenceDetails ////////////////////////////////
				
				
						$query1 = $this->InvoiceBookings->ReferenceDetails->query();
						$query1->update()
						->set(['debit' => $this->request->data['debit'][$row]])
						->where([
							'ledger_account_id' => $this->request->data['vendor_ledger_id'],
							'invoice_booking_id' => $invoiceBooking->id,
							'reference_no' => $this->request->data['reference_no'][$row],
							'reference_type' => $this->request->data['reference_type'][$row]
						])
						->execute();
						
						////////////////  ReferenceBalances ////////////////////////////////
						if($this->request->data['reference_type'][$row]=='Against Reference')
						{
							
							$res=$this->InvoiceBookings->ReferenceBalances->find()->where(['reference_no' => $this->request->data['reference_no'][$row],'ledger_account_id' => $this->request->data['vendor_ledger_id']])->first();
							
							 $q=$res->debit-$this->request->data['old_amount'][$row]+ $this->request->data['debit'][$row];
							
							$query2 = $this->InvoiceBookings->ReferenceBalances->query();
							$query2->update()
								->set(['debit' => $q])
								->where(['reference_no' => $this->request->data['reference_no'][$row],'ledger_account_id' => $this->request->data['vendor_ledger_id']])
								->execute();
						}
						else
						{ 
							$query2 = $this->InvoiceBookings->ReferenceBalances->query();
							$query2->update()
							->set(['debit' => $this->request->data['debit'][$row]])
							->where([
								'reference_no' => $this->request->data['reference_no'][$row],
								'ledger_account_id' => $this->request->data['vendor_ledger_id']
							])
							->execute();
							
						}

					}
					else
					{
						////////////////  ReferenceDetails ////////////////////////////////
						$query1 = $this->InvoiceBookings->ReferenceDetails->query();
						$query1->insert(['reference_no', 'ledger_account_id', 'invoice_booking_id', 'debit', 'reference_type'])
						->values([
							'ledger_account_id' => $this->request->data['vendor_ledger_id'],
							'invoice_booking_id' => $invoiceBooking->id,
							'reference_no' => $this->request->data['reference_no'][$row],
							'debit' => $this->request->data['debit'][$row],
							'reference_type' => $this->request->data['reference_type'][$row]
						])
						->execute();
						
						////////////////  ReferenceBalances ////////////////////////////////
						if($this->request->data['reference_type'][$row]=='Against Reference')
						{
							$query2 = $this->InvoiceBookings->ReferenceBalances->query();
							$query2->update()
								->set(['debit' => $this->request->data['debit'][$row]])
								->where(['reference_no' => $this->request->data['reference_no'][$row],'ledger_account_id' => $this->request->data['vendor_ledger_id']])
								->execute();
						}
						else
						{
							$query2 = $this->InvoiceBookings->ReferenceBalances->query();
							$query2->insert(['reference_no', 'ledger_account_id', 'debit'])
							->values([
								'reference_no' => $this->request->data['reference_no'][$row],
								'ledger_account_id' => $this->request->data['vendor_ledger_id'],
								'debit' => $this->request->data['debit'][$row],
							])
							->execute();
						}
					}
					
				}
				
                $this->Flash->success(__('The invoice booking has been saved.'));

                return $this->redirect(['action' => 'index']);
            } else {
                $this->Flash->error(__('The invoice booking could not be saved. Please, try again.'));
            }
        }
        $grns = $this->InvoiceBookings->Grns->find('list', ['limit' => 200]);
		
        $this->set(compact('invoiceBooking','ReferenceDetails', 'grns','financial_year_data','ReferenceBalances','invoice_booking_id','vendor_ledger_acc_id'));
        $this->set('_serialize', ['invoiceBooking']);
    }

    /**
     * Delete method
     *
     * @param string|null $id Invoice Booking id.
     * @return \Cake\Network\Response|null Redirects to index.
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function delete($id = null)
    {
        $this->request->allowMethod(['post', 'delete']);
        $invoiceBooking = $this->InvoiceBookings->get($id);
        if ($this->InvoiceBookings->delete($invoiceBooking)) {
            $this->Flash->success(__('The invoice booking has been deleted.'));
        } else {
            $this->Flash->error(__('The invoice booking could not be deleted. Please, try again.'));
        }

        return $this->redirect(['action' => 'index']);
    }
	
	function DueInvoiceBookingsForPayment($paid_to_id=null){
		$this->viewBuilder()->layout('');
		$session = $this->request->session();
		$st_company_id = $session->read('st_company_id');
		
		$Vendor=$this->InvoiceBookings->Vendors->find()->where(['ledger_account_id'=>$paid_to_id])->first();
		if(!$Vendor){ echo 'Select paid to.'; exit; }
		$InvoiceBookings = $this->InvoiceBookings->find()->where(['company_id'=>$st_company_id,'vendor_id'=>$Vendor->id,'due_payment >'=>0]);
		 $this->set(compact('InvoiceBookings','Vendor'));
	}
	
	public function fetchReferenceNo($ledger_account_id=null)
    {
		$this->viewBuilder()->layout('ajax_layout');
		
		$ReferenceDetails=$this->InvoiceBookings->ReferenceBalances->find()->where(['ledger_account_id' => $ledger_account_id])->toArray();
		$this->set(compact(['ReferenceDetails']));
	}
	public function deleteReceiptRow($reference_type=null,$old_amount=null,$ledger_account_id=null,$invoice_booking_id=null,$reference_no=null)
    {
		
		$query1 = $this->InvoiceBookings->ReferenceDetails->query();
		$query1->delete()
		->where([
			'ledger_account_id' => $ledger_account_id,
			'invoice_booking_id' => $invoice_booking_id,
			'reference_no' => $reference_no,
			'reference_type' => $reference_type
		])
		->execute();
		
		if($reference_type=='Against Reference')
		{
			$res=$this->InvoiceBookings->ReferenceBalances->find()->where(['reference_no' => $reference_no,'ledger_account_id' => $ledger_account_id])->first();
			
			$q=$res->debit-$old_amount;
			
			$query2 = $this->InvoiceBookings->ReferenceBalances->query();
			$query2->update()
				->set(['debit' => $q])
				->where(['reference_no' => $reference_no,'ledger_account_id' => $ledger_account_id])
				->execute();
		}
		else
		{ 
			$query2 = $this->InvoiceBookings->ReferenceBalances->query();
			$query2->delete()
			->where([
				'reference_no' => $reference_no,
				'ledger_account_id' => $ledger_account_id
			])
			->execute();
			
		}
	}

}
