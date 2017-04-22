<?php
namespace App\Controller;

use App\Controller\AppController;
use Cake\View\Helper\NumberHelper;
use Cake\View\Helper\HtmlHelper;

/**
 * Invoices Controller
 *
 * @property \App\Model\Table\InvoicesTable $Invoices
 */
class InvoicesController extends AppController
{

    /**
     * Index method
     *
     * @return \Cake\Network\Response|null
     */
    public function index($status=null)
    {
		$url=$this->request->here();
		$url=parse_url($url,PHP_URL_QUERY);
		$this->viewBuilder()->layout('index_layout');
		$inventory_voucher=$this->request->query('inventory_voucher');
		
		$session = $this->request->session();
		$st_company_id = $session->read('st_company_id');
		
		$where=[];
		$company_alise=$this->request->query('company_alise');
		$invoice_no=$this->request->query('invoice_no');
		$file=$this->request->query('file');
		$customer=$this->request->query('customer');
		$From=$this->request->query('From');
		$To=$this->request->query('To');
		$total_From=$this->request->query('total_From');
		$total_To=$this->request->query('total_To');
		$page=$this->request->query('page');
		$this->set(compact('ref_no','customer','total_From','total_To','From','To','page','invoice_no','company_alise','file','inventory_status'));
		if(!empty($company_alise)){
			$where['in1 LIKE']='%'.$company_alise.'%';
		}
		if(!empty($invoice_no)){
			$where['in2 LIKE']='%'.$invoice_no.'%';
		}
		if(!empty($file)){
			$where['in3 LIKE']='%'.$file.'%';
		}
		if(!empty($customer)){
			$where['Customers.customer_name LIKE']='%'.$customer.'%';
		}
		if(!empty($From)){
			$From=date("Y-m-d",strtotime($this->request->query('From')));
			$where['date_created >=']=$From;
		}
		if(!empty($To)){
			$To=date("Y-m-d",strtotime($this->request->query('To')));
			$where['date_created <=']=$To;
		}
		if(!empty($total_From)){
			$where['total_after_pnf >=']=$total_From;
		}
		if(!empty($total_To)){
			$where['total_after_pnf <=']=$total_To;
		}
	
        $this->paginate = [
            'contain' => ['Customers', 'Companies']
        ];
		
		if($inventory_voucher=='true'){
			$where['inventory_voucher_status']='Pending';
			
		}else{
			if($status=='Pending' || $status==''){
				$where['status']='';
			}
			elseif($status=='Cancel'){
				$where['status']='Cancel';
			}	
		}
		if($inventory_voucher=='true'){
			$invoices=[];
			$invoices_data=$this->paginate($this->Invoices->find()->contain(['InvoiceRows'=>['Items'=>function ($q) {
				return $q->where(['source !='=>'Purchessed']);
				}]])->where(['company_id'=>$st_company_id,'inventory_voucher_status'=>'Pending'])->order(['Invoices.id' => 'DESC']));
			
				foreach($invoices_data as $invoice){
					$sales_order_id=$invoice->sales_order_id;
					$invoice_rows=$invoice->invoice_rows;
						if(sizeof($invoice_rows)>0){
							foreach($invoice_rows as $invoice_row)
							{
								$SalesOrderRow=$this->Invoices->SalesOrderRows->find()->where(['sales_order_id'=>$sales_order_id,'item_id'=>$invoice_row->item_id])->first();
								if($invoice_row->item->source=='Purchessed/Manufactured'){ 
								
									if($SalesOrderRow->source_type=="Manufactured"){
									$invoices[]=$invoice; 
									}
								}
								elseif($invoice_row->item->source=='Assembled' or $invoice_row->item->source=='Manufactured'){
								
								$invoices[]=$invoice; 
								}
							}	
						}
					}
			}else{
			$invoices = $this->paginate($this->Invoices->find()->where($where)->where(['company_id'=>$st_company_id])->order(['Invoices.id' => 'DESC']));
		}
		
		$this->set(compact('invoices','status','inventory_voucher'));
        $this->set('_serialize', ['invoices']);
		$this->set(compact('url'));
    }
	
	public function DueInvoices($customer_id=null)
    {
		$this->viewBuilder()->layout('index_layout');
		$Customer=$this->Invoices->Customers->get($customer_id);
        $this->paginate = [
            'contain' => []
        ];
        $invoices = $this->paginate($this->Invoices->find()->where(['customer_id'=>$customer_id,'due_payment !='=>0])->order(['date_created' => 'ASC']));
		
        $this->set(compact('invoices','Customer'));
        $this->set('_serialize', ['invoices']);
		$this->set(compact('url'));
    }

	public function exportExcel()
	{
		
		$this->viewBuilder()->layout('');
		$where=[];
		$company_alise=$this->request->query('company_alise');
		$invoice_no=$this->request->query('invoice_no');
		$file=$this->request->query('file');
		$customer=$this->request->query('customer');
		$From=$this->request->query('From');
		$To=$this->request->query('To');
		$total_From=$this->request->query('total_From');
		$total_To=$this->request->query('total_To');
		$page=$this->request->query('page');
		$this->set(compact('ref_no','customer','total_From','total_To','From','To','page','invoice_no','company_alise','file'));
		if(!empty($company_alise)){
			$where['Invoices.in1 LIKE']='%'.$company_alise.'%';
		}
		if(!empty($invoice_no)){
			$where['Invoices.id']=$invoice_no;
		}
		if(!empty($file)){
			$where['Invoices.in3 LIKE']='%'.$file.'%';
		}
		if(!empty($customer)){
			$where['Customers.customer_name LIKE']='%'.$customer.'%';
		}
		if(!empty($From)){
			$From=date("Y-m-d",strtotime($this->request->query('From')));
			$where['date_created >=']=$From;
		}
		if(!empty($To)){
			$To=date("Y-m-d",strtotime($this->request->query('To')));
			$where['date_created <=']=$To;
		}
		if(!empty($total_From)){
			$where['total_after_pnf >=']=$total_From;
		}
		if(!empty($total_To)){
			$where['total_after_pnf <=']=$total_To;
		}
		$this->paginate = [
			'contain' => ['Customers', 'Companies']
		];
		$invoices = $this->paginate($this->Invoices->find()->where($where)->order(['Invoices.id' => 'DESC']));
		
		$this->set(compact('invoices'));
		$this->set('_serialize', ['invoices']);
	}
	
	 /**
     * View method
     *
     * @param string|null $id Invoice id.
     * @return \Cake\Network\Response|null
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    
	public function view($id = null)
    {
		$this->viewBuilder()->layout('');
        $invoice = $this->Invoices->get($id, [
            'contain' => ['Customers', 'Companies', 'InvoiceRows' => ['Items']]
        ]);
		

        $this->set('invoice', $invoice);
        $this->set('_serialize', ['invoice']);
    }
	
	public function PendingItemForInventoryVoucher()
    {
		$this->viewBuilder()->layout('index_layout');
		$invoices=$this->paginate(
				$this->Invoices->InvoiceRows->find()->contain(['Invoices',
				'Items'=> function ($q) {
				return $q->where(['source !='=>'Purchessed']);
				}])
				->where(['inventory_voucher'=>'Pending'])
				->order(['InvoiceRows.id' => 'DESC'])
			);
        $this->set('invoices', $invoices);
        $this->set('_serialize', ['invoice']);
    }
	
	public function pdf($id = null)
    {
		$this->viewBuilder()->layout('');
		
        $invoice = $this->Invoices->get($id, [
		'contain' => ['SaleTaxes',
					'Customers',
					'Employees','Transporters','Creator'=>['Designations'],
					'Companies'=> ['CompanyBanks'=> function ($q) {
						return $q
						->where(['CompanyBanks.default_bank' => 1]);}], 
					'InvoiceRows' => ['Items'=>['Units']]]
			]);
		//pr($invoice); exit;
        $this->set('invoice', $invoice);
		
        $this->set('_serialize', ['invoice']);
    }
	
	
	public function confirm($id = null)
    {
		$this->viewBuilder()->layout('pdf_layout');
		$invoice = $this->Invoices->get($id, [
            'contain' => ['InvoiceRows']
			]);
		
		if ($this->request->is(['patch', 'post', 'put'])) {
			
			if(!empty($this->request->data['pdf_font_size'])){
				$pdf_font_size=$this->request->data['pdf_font_size'];
				$query = $this->Invoices->query();
					$query->update()
						->set(['pdf_font_size' => $pdf_font_size])
						->where(['id' => $id])
						->execute();
			}
			
			if(!empty($this->request->data['invoice_rows'])){
				foreach($this->request->data['invoice_rows'] as $invoice_row_id=>$value){
					$invoiceRow=$this->Invoices->InvoiceRows->get($invoice_row_id);
					$invoiceRow->height=$value["height"];
					$this->Invoices->InvoiceRows->save($invoiceRow);
				}
			}
			return $this->redirect(['action' => 'confirm/'.$id]);
        }
		
		$this->set(compact('invoice','id'));
    }
	
	public function fetchReferenceNo($ledger_account_id=null)
    {
		$this->viewBuilder()->layout('ajax_layout');
	
		$ReferenceBalances=$this->Invoices->ReferenceBalances->find()->where(['ledger_account_id' => $ledger_account_id])->toArray();
		
		$this->set(compact(['ReferenceBalances']));
	}
	
	public function deleteReceiptRow($reference_type=null,$old_amount=null,$ledger_account_id=null,$invoice_id=null,$reference_no=null)
    {
		$reference_type=$this->request->query('reference_type');
		$old_amount=$this->request->query('old_amount');
		$ledger_account_id=(int)$this->request->query('ledger_account_id');
		$invoice_id=$this->request->query('invoice_id');
		$reference_no=$this->request->query('reference_no');
		
		
		$query1 = $this->Invoices->ReferenceDetails->query();
		$query1->delete()
		->where([
			'ledger_account_id' => $ledger_account_id,
			'invoice_id' => $invoice_id,
			'reference_no' => $reference_no,
			'reference_type' => $reference_type
		])
		->execute();
		
		if($reference_type=='Against Reference')
		{
			$res=$this->Invoices->ReferenceBalances->find()->where(['reference_no' => $reference_no,'ledger_account_id' => $ledger_account_id])->first();
			
			$q=$res->credit-$old_amount;
			
			$query2 = $this->Invoices->ReferenceBalances->query();
			$query2->update()
				->set(['credit' => $q])
				->where(['reference_no' => $reference_no,'ledger_account_id' => $ledger_account_id])
				->execute();
		}
		else
		{ 
			$query2 = $this->Invoices->ReferenceBalances->query();
			$query2->delete()
			->where([
				'reference_no' => $reference_no,
				'ledger_account_id' => $ledger_account_id
			])
			->execute();
			
		}
		echo 'Deleted';
		exit;
	
	}
    /**
     * Add method
     *
     * @return \Cake\Network\Response|void Redirects on successful add, renders view otherwise.
     */
    public function add()
    {
		$this->viewBuilder()->layout('index_layout');
		$s_employee_id=$this->viewVars['s_employee_id'];
		
		$session = $this->request->session();
		$st_company_id = $session->read('st_company_id');
		
		$sales_order_id=@(int)$this->request->query('sales-order');
		$sales_order=array(); $process_status='New';
		if(!empty($sales_order_id)){
			$sales_order = $this->Invoices->SalesOrders->get($sales_order_id, [
				'contain' => ['SalesOrderRows.Items' => function ($q) use($st_company_id) {
						   return $q
								->where(['SalesOrderRows.quantity > SalesOrderRows.processed_quantity'])
								->contain(['ItemSerialNumbers'=>function($q) use($st_company_id){
									return $q->where(['ItemSerialNumbers.status' => 'In','ItemSerialNumbers.company_id' => $st_company_id]); 
								},
								'ItemCompanies'=>function($q) use($st_company_id){
									return $q->where(['ItemCompanies.company_id' => $st_company_id]);
								}]);
						},'SalesOrderRows.SaleTaxes','Companies','Customers','Employees'
					]
			]);
			
			$c_LedgerAccount=$this->Invoices->LedgerAccounts->find()->where(['company_id'=>$st_company_id,'source_model'=>'Customers','source_id'=>$sales_order->customer->id])->first();
			//pr($sales_order); exit;
			
			$process_status='Pulled From Sales-Order';
			
			$sale_tax_ledger_accounts=[];
			foreach($sales_order->sales_order_rows as $sales_order_row){
				
				$st_LedgerAccount=$this->Invoices->LedgerAccounts->find()->where(['source_id'=>$sales_order_row->sale_tax->id,'source_model'=>'SaleTaxes','company_id'=>$st_company_id])->first();
				$sale_tax_ledger_accounts[$sales_order_row->sale_tax->id]=$st_LedgerAccount->id;
				//pr(['source_id'=>$sales_order_row->sale_tax->id,'source_model'=>'SaleTaxes','company_id'=>$st_company_id]); exit;
			}
		}

		$session = $this->request->session();
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



		$this->set(compact('sales_order','process_status','sales_order_id','chkdate'));
		
        $invoice = $this->Invoices->newEntity();
        if ($this->request->is('post')) {
		
		
		 $total_row=sizeof($this->request->data['reference_no']);
		
			$invoice = $this->Invoices->patchEntity($invoice, $this->request->data);
			foreach($invoice->invoice_rows as $invoice_row){
				if($invoice_row->item_serial_numbers){
					$item_serial_no=implode(",",$invoice_row->item_serial_numbers );
					$invoice_row->item_serial_number=$item_serial_no;
				}
			}			
			
			$last_in_no=$this->Invoices->find()->select(['in2'])->where(['company_id' => $sales_order->company_id])->order(['in2' => 'DESC'])->first();
			if($last_in_no){
				$invoice->in2=$last_in_no->in2+1;
			}else{
				$invoice->in2=1;
			}
			$invoice->in3=$sales_order->so3;
			$invoice->created_by=$s_employee_id;
			$invoice->company_id=$sales_order->company_id;
			$invoice->employee_id=$sales_order->employee_id;
			$invoice->customer_id=$sales_order->customer_id;
			$invoice->customer_po_no=$sales_order->customer_po_no;
			$invoice->po_date=date("Y-m-d",strtotime($sales_order->po_date)); 
			$invoice->date_created=date("Y-m-d");
			
			if($invoice->payment_mode=='New_ref'){
			$invoice->due_payment=$invoice->grand_total;
			}else{
				$invoice->due_payment=$invoice->grand_total-$invoice->total_amount_agst;
			}
			//pr($invoice); exit;
            if ($this->Invoices->save($invoice)) {
				
				//GET CUSTOMER LEDGER-ACCOUNT-ID
				$c_LedgerAccount=$this->Invoices->LedgerAccounts->find()->where(['company_id'=>$st_company_id,'source_model'=>'Customers','source_id'=>$sales_order->customer->id])->first();
				
				$ledger_grand=$invoice->grand_total;
				$ledger = $this->Invoices->Ledgers->newEntity();
				$ledger->ledger_account_id = $c_LedgerAccount->id;
				$ledger->debit = $invoice->grand_total;
				$ledger->credit = 0;
				$ledger->voucher_id = $invoice->id;
				$ledger->voucher_source = 'Invoice';
				$ledger->company_id = $invoice->company_id;
				$ledger->transaction_date = $invoice->date_created;
				
				if($ledger_grand>0)
				{
					$this->Invoices->Ledgers->save($ledger); 
				} 
				//Ledger posting for Account Reference
				$ledger_pnf=$invoice->total_after_pnf;
				//$accountReferences=$this->Invoices->AccountReferences->get(1);
				$ledger = $this->Invoices->Ledgers->newEntity();
				$ledger->ledger_account_id = $invoice->sales_ledger_account;
				$ledger->debit = 0;
				$ledger->credit = $invoice->total_after_pnf;
				$ledger->voucher_id = $invoice->id;
				$ledger->company_id = $invoice->company_id;
				$ledger->transaction_date = $invoice->date_created;
				$ledger->voucher_source = 'Invoice';
				if($ledger_pnf>0)
				{
					$this->Invoices->Ledgers->save($ledger); 
				}
				
				//Ledger posting for Sale Tax
				
				
				
				$ledger_saletax=$invoice->sale_tax_amount;
				$ledger = $this->Invoices->Ledgers->newEntity();
				$ledger->ledger_account_id = $invoice->st_ledger_account_id;
				$ledger->debit = 0;
				$ledger->credit = $invoice->sale_tax_amount;
				$ledger->voucher_id = $invoice->id;
				$ledger->company_id = $invoice->company_id;
				$ledger->transaction_date = $invoice->date_created;
				$ledger->voucher_source = 'Invoice';
				if($ledger_saletax>0)
				{
					$this->Invoices->Ledgers->save($ledger); 
				}
				
				
				//Ledger posting for Fright Amount
				
				$ledger_fright= $invoice->fright_amount;
				//$accountReferences=$this->Invoices->AccountReferences->get(3);
				$ledger = $this->Invoices->Ledgers->newEntity();
				$ledger->ledger_account_id = $invoice->fright_ledger_account;
				$ledger->debit = 0;
				$ledger->credit = $invoice->fright_amount;
				$ledger->voucher_id = $invoice->id;
				$ledger->company_id = $invoice->company_id;
				$ledger->transaction_date = $invoice->date_created;
				$ledger->voucher_source = 'Invoice';
				if($ledger_fright>0)
				{
					$this->Invoices->Ledgers->save($ledger); 
				}
				
				$discount=$invoice->discount;
				 $pf=$invoice->pnf;
				 $exciseDuty=$invoice->exceise_duty;
				 $sale_tax=$invoice->sale_tax_amount;
				 $fright=$invoice->fright_amount;
				 $total_amt=0;
				foreach($invoice->invoice_rows as $invoice_row){
					$amt=$invoice_row->amount;
					$total_amt=$total_amt+$amt;
					$item_serial_no=$invoice_row->item_serial_number;
					$serial_no=explode(",",$item_serial_no);
					foreach($serial_no as $serial){
					$query = $this->Invoices->InvoiceRows->ItemSerialNumbers->query();
						$query->update()
							->set(['status' => 'Out','invoice_id' => $invoice->id])
							->where(['id' => $serial])
							->execute();
					}
				}
				
				
				if(!empty($sales_order_id)){
					$invoice->check=array_filter($invoice->check);
					$i=0; 
					foreach($invoice->check as $sales_order_row_id){
						$item_id=$invoice->invoice_rows[$i]['item_id'];
						$qty=$invoice->invoice_rows[$i]['quantity'];
						$rate=$invoice->invoice_rows[$i]['rate'];
						$amount=$invoice->invoice_rows[$i]['amount'];
						$dis=$discount*$amount/$total_amt;
						$item_discount=$dis/$qty;
						$pnf=$pf*$amount/$total_amt;
						$item_pf=$pnf/$qty;
						$excise=$exciseDuty*$amount/$total_amt;
						$item_excise=$excise/$qty;
						$saletax=$sale_tax*$amount/$total_amt;
						$item_saletax=$saletax/$qty;
						$fr_amount=$fright*$amount/$total_amt;
						$item_fright=$fr_amount/$qty;
						
						
						$SalesOrderRow = $this->Invoices->SalesOrderRows->get($sales_order_row_id);
						$SalesOrderRow->processed_quantity=$SalesOrderRow->processed_quantity+$qty;
						$this->Invoices->SalesOrderRows->save($SalesOrderRow);
						$i++;
						
						//Insert in Item Ledger//
						$itemLedger = $this->Invoices->ItemLedgers->newEntity();
						$itemLedger->item_id = $item_id;
						$itemLedger->quantity = $qty;
						$itemLedger->source_model = 'Invoices';
						$itemLedger->source_id = $invoice->id;
						$itemLedger->in_out = 'Out';
						$itemLedger->rate = $rate-$item_discount+$item_excise+$item_pf;
						$itemLedger->company_id = $invoice->company_id;
						$itemLedger->processed_on = date("Y-m-d");
						
						
						$this->Invoices->ItemLedgers->save($itemLedger);
						
					}
					
					
				}
				for($row=0; $row<$total_row; $row++)
					{
						////////////////  ReferenceDetails ////////////////////////////////
						$query1 = $this->Invoices->ReferenceDetails->query();
						$query1->insert(['reference_no', 'ledger_account_id', 'invoice_id', 'credit', 'reference_type'])
						->values([
							'ledger_account_id' => $c_LedgerAccount->id,
							'invoice_id' => $invoice->id,
							'reference_no' => $this->request->data['reference_no'][$row],
							'credit' => $this->request->data['credit'][$row],
							'reference_type' => $this->request->data['reference_type'][$row]
						])
						->execute();
						
						////////////////  ReferenceBalances ////////////////////////////////
						if($this->request->data['reference_type'][$row]=='Against Reference')
						{
							$query2 = $this->Invoices->ReferenceBalances->query();
							$query2->update()
								->set(['credit' => $this->request->data['credit'][$row]])
								->where(['reference_no' => $this->request->data['reference_no'][$row],'ledger_account_id' => $sales_order->customer->ledger_account_id])
								->execute();
						}
						else
						{
							$query2 = $this->Invoices->ReferenceBalances->query();
							$query2->insert(['reference_no', 'ledger_account_id', 'credit'])
							->values([
								'reference_no' => $this->request->data['reference_no'][$row],
								'ledger_account_id' => $c_LedgerAccount->id,
								'credit' => $this->request->data['credit'][$row],
							])
							->execute();
						}
						
					}
                $this->Flash->success(__('The invoice has been saved.'));

                return $this->redirect(['action' => 'confirm/'.$invoice->id]);
            } else { //pr($invoice); exit;
                $this->Flash->error(__('The invoice could not be saved. Please, try again.'));
            }
        }
		
		
		$salesOrders = $this->Invoices->SalesOrders->find()->select(['total_rows' => 
		$this->Invoices->SalesOrders->find()->func()->count('SalesOrderRows.id')])
		->leftJoinWith('SalesOrderRows', function ($q) {
		return $q->where(['SalesOrderRows.quantity > SalesOrderRows.processed_quantity']);
		})
		->group(['SalesOrders.id'])
		->autoFields(true)
		->having(['total_rows >' => 0]);
		
		$items = $this->Invoices->Items->find('list');
		$transporters = $this->Invoices->Transporters->find('list', ['limit' => 200])->order(['Transporters.transporter_name' => 'ASC']);
		$termsConditions = $this->Invoices->TermsConditions->find('all',['limit' => 200]);
		$SaleTaxes = $this->Invoices->SaleTaxes->find('all')->where(['freeze'=>0]);
		
		if(!empty($sales_order->customer_id)){
			
		$customer_ledger = $this->Invoices->LedgerAccounts->find()->where(['LedgerAccounts.source_id'=>$sales_order->customer_id,'LedgerAccounts.source_model'=>'Customers'])->toArray();
		
		$customer_reference_details = $this->Invoices->ReferenceDetails->find()->where(['ReferenceDetails.ledger_account_id'=>$customer_ledger[0]->id])->toArray();
		$total_credit=0;
		$total_debit=0;
		$old_due_payment=0;
		foreach($customer_reference_details as $customer_reference_detail){
			if($customer_reference_detail->debit==0){
				$total_credit=$total_credit+$customer_reference_detail->credit;
			}
			else{
				$total_debit=$total_debit+$customer_reference_detail->debit;
			}
		}
				$old_due_payment=$total_credit-$total_debit;

		}
		//pr($old_due_payment); exit;	
		$AccountReference_for_sale= $this->Invoices->AccountReferences->get(1);
		$account_first_subgroup_id=$AccountReference_for_sale->account_first_subgroup_id;
		$AccountReference_for_fright= $this->Invoices->AccountReferences->get(3);
		$account_first_subgroup_id_for_fright=$AccountReference_for_fright->account_first_subgroup_id;
		//$ac_first_grp_id=$AccountReference->account_first_subgroup_id;
		//pr($AccountReference_for_sale); exit;
		
		$ledger_account_details = $this->Invoices->LedgerAccounts->find('list')->contain(['AccountSecondSubgroups'=>['AccountFirstSubgroups' => function($q) use($account_first_subgroup_id){
			return $q->where(['AccountFirstSubgroups.id'=>$account_first_subgroup_id]);
		}]])->order(['LedgerAccounts.name' => 'ASC'])->where(['LedgerAccounts.company_id'=>$st_company_id]);
		
		$ledger_account_details_for_fright = $this->Invoices->LedgerAccounts->find('list')->contain(['AccountSecondSubgroups'=>['AccountFirstSubgroups' => function($q) use($account_first_subgroup_id_for_fright){
			return $q->where(['AccountFirstSubgroups.id'=>$account_first_subgroup_id_for_fright]);
		}]])->where(['LedgerAccounts.company_id'=>$st_company_id])->order(['LedgerAccounts.name' => 'ASC']);
		
		$item_serial_no=$this->Invoices->ItemSerialNumbers->find('list', ['limit' => 200]);
		$employees = $this->Invoices->Employees->find('list', ['limit' => 200]);
        $this->set(compact('invoice', 'customers', 'companies', 'salesOrders','items','transporters','termsConditions','serviceTaxs','exciseDuty','SaleTaxes','employees','dueInvoicespay','creditlimit','old_due_payment','item_serial_no','ledger_account_details','ledger_account_details_for_fright','sale_tax_ledger_accounts','c_LedgerAccount'));
        $this->set('_serialize', ['invoice']);
    }
	
	public function pullFromSalesOrder(){
		if ($this->request->is('post')) {
			$sales_order_id=$this->request->data["sales_order_id"];
            return $this->redirect(['action' => 'add?sales-order='.$sales_order_id]);
        }
	}

    /**
     * Edit method
     *
     * @param string|null $id Invoice id.
     * @return \Cake\Network\Response|void Redirects on successful edit, renders view otherwise.
     * @throws \Cake\Network\Exception\NotFoundException When record not found.
     */
    public function edit($id = null)
    {
		$session = $this->request->session();
		$st_company_id = $session->read('st_company_id');
		
		$this->viewBuilder()->layout('index_layout');
		$invoice = $this->Invoices->get($id, [
            'contain' => ['ItemSerialNumbers','InvoiceRows','SalesOrders' => ['Invoices'=>['InvoiceRows'],'SalesOrderRows' => ['Items'=>['ItemSerialNumbers','ItemCompanies'=>function($q) use($st_company_id){
									return $q->where(['ItemCompanies.company_id' => $st_company_id]);
								}],'SaleTaxes']],'Companies','Customers'=>['CustomerAddress'=> function ($q) {
						return $q
						->where(['CustomerAddress.default_address' => 1]);}],'Employees','SaleTaxes']
        ]);
		
		//pr($invoice->sales_order->toArray()); exit;
		
		$c_LedgerAccount=$this->Invoices->LedgerAccounts->find()->where(['company_id'=>$st_company_id,'source_model'=>'Customers','source_id'=>$invoice->customer->id])->first();
			
		foreach($invoice->sales_order->sales_order_rows as $sales_order_row){
			foreach($sales_order_row->item->item_serial_numbers as $item_serial_number){
				$ItemSerialNumber2[$item_serial_number->item_id]=$this->Invoices->ItemSerialNumbers->find()->where(['item_id'=>$item_serial_number->item_id,'status'=>'In'])->toArray();
			}
		}
		
		$sale_tax_ledger_accounts=[];
			foreach($invoice->sales_order->sales_order_rows as $sales_order_row){
				$st_LedgerAccount=$this->Invoices->LedgerAccounts->find()->where(['source_id'=>$sales_order_row->sale_tax->id,'source_model'=>'SaleTaxes','company_id'=>$st_company_id])->first();
				$sale_tax_ledger_accounts[$sales_order_row->sale_tax->id]=$st_LedgerAccount->id;
			}	
		
		foreach($invoice->invoice_rows as $invoice_row){
			
			if($invoice_row->item_serial_number){
			@$ItemSerialNumber_In[$invoice_row->item_id]= explode(",",$invoice_row->item_serial_number);
			$ItemSerialNumber[$invoice_row->item_id]=$this->Invoices->ItemSerialNumbers->find()->where(['item_id'=>$invoice_row->item_id,'status'=>'In','company_id'=>$st_company_id])->orWhere(['ItemSerialNumbers.invoice_id'=>$invoice->id,'item_id'=>$invoice_row->item_id,'status'=>'Out','company_id'=>$st_company_id])->toArray();
			}
				
		}
		
		 $Em = new FinancialYearsController;
	     $financial_year_data = $Em->checkFinancialYear($invoice->date_created);
		$invoice_id=$id;
		
		$ReferenceDetails = $this->Invoices->ReferenceDetails->find()->where(['ledger_account_id'=>$c_LedgerAccount->id,'invoice_id'=>$invoice_id])->toArray();
		if(!empty($ReferenceDetails))
		{
			foreach($ReferenceDetails as $ReferenceDetail)
			{
				$ReferenceBalances[] = $this->Invoices->ReferenceBalances->find()->where(['ledger_account_id'=>$ReferenceDetail->ledger_account_id,'reference_no'=>$ReferenceDetail->reference_no])->toArray();
			}
		}
		else{
			$ReferenceBalances='';
		}
		

        if ($this->request->is(['patch', 'post', 'put'])){ 
			 $total_row=sizeof($this->request->data['reference_no']);
			
            $invoice = $this->Invoices->patchEntity($invoice, $this->request->data);
			$invoice->date_created=date("Y-m-d",strtotime($invoice->date_created));
			$invoice->company_id=$invoice->company_id;
			$invoice->employee_id=$invoice->employee_id;
			$invoice->customer_id=$invoice->customer_id;
			$invoice->customer_po_no=$invoice->customer_po_no;
			$invoice->po_date=date("Y-m-d",strtotime($invoice->po_date)); 
			$invoice->in3=$invoice->in3;
			$invoice->due_payment=$invoice->grand_total;
			
			if(@$ItemSerialNumber_In){
				foreach(@$ItemSerialNumber_In as $key=>$serial_no){
					
					foreach($serial_no as $data){
						$query = $this->Invoices->InvoiceRows->ItemSerialNumbers->query();
						$query->update()
							->set(['status' => 'In','invoice_id' => 0])
							->where(['id' => $data])
							->execute(); 
					}
				}
			}
			foreach($invoice->invoice_rows as $invoice_row){
				if($invoice_row->item_serial_numbers){
					$item_serial_no=implode(",",$invoice_row->item_serial_numbers );
					$invoice_row->item_serial_number=$item_serial_no;
				}
			}
			
			if ($this->Invoices->save($invoice)) {
				
				if($invoice->invoice_breakups){
					foreach($invoice->invoice_breakups as $invoice_breakup){
						$rec_id=$invoice_breakup->receipt_voucher_id;
						$receipt_amt =$invoice_breakup->receipt_amount-$invoice_breakup->amount;
						 
						$query = $this->Invoices->ReceiptVouchers->query();
						$query->update()
							->set(['advance_amount' => $receipt_amt])
							->where(['id' => $rec_id])
							->execute();
					}
				}
			
				$this->Invoices->Ledgers->deleteAll(['voucher_id' => $invoice->id, 'voucher_source' => 'Invoice']);
				
				if($invoice->inventory_voucher_status == 'Converted'){
				
				$InventoryVoucher = $this->Invoices->InventoryVouchers->find()->where(['invoice_id' => $invoice->id])->first();
				
				$this->Invoices->InventoryVouchers->ItemLedgers->deleteAll(['ItemLedgers.source_id' => $InventoryVoucher->id,'source_model'=>'Inventory Voucher']);
				$this->Invoices->InventoryVouchers->InventoryVoucherRows->deleteAll(['InventoryVoucherRows.inventory_voucher_id' => $InventoryVoucher->id]);
				$this->Invoices->InventoryVouchers->delete($InventoryVoucher);
				}
				
				$query = $this->Invoices->query();
					$query->update()
						->set(['inventory_voucher_status' => 'Pending'])
						->where(['id' => $id])
						->execute();
				//$customer_ledger=$this->Invoices->Customers->get($invoice->customer_id);
				$c_LedgerAccount=$this->Invoices->LedgerAccounts->find()->where(['company_id'=>$st_company_id,'source_model'=>'Customers','source_id'=>$invoice->customer_id])->first();
				$ledger_grand=$invoice->grand_total;
				$ledger = $this->Invoices->Ledgers->newEntity();
				$ledger->ledger_account_id = $c_LedgerAccount->id;
				$ledger->debit = $invoice->grand_total;
				$ledger->credit = 0;
				$ledger->voucher_id = $invoice->id;
				$ledger->company_id = $invoice->company_id;
				$ledger->voucher_source = 'Invoice';
				$ledger->transaction_date = $invoice->date_created;
				
				if($ledger_grand>0)
				{
					$this->Invoices->Ledgers->save($ledger); 
				} 
				//Ledger posting for Account Reference
				$ledger_pnf=$invoice->total_after_pnf;
				//$accountReferences=$this->Invoices->AccountReferences->get(1);
				$ledger = $this->Invoices->Ledgers->newEntity();
				$ledger->ledger_account_id = $invoice->sales_ledger_account;
				$ledger->debit = 0;
				$ledger->credit = $invoice->total_after_pnf;
				$ledger->voucher_id = $invoice->id;
				$ledger->company_id = $invoice->company_id;
				$ledger->transaction_date = $invoice->date_created;
				$ledger->voucher_source = 'Invoice';
				if($ledger_pnf>0)
				{
					
					$this->Invoices->Ledgers->save($ledger); 
				}
				
				//Ledger posting for Sale Tax
				
				
				
				$ledger_saletax=$invoice->sale_tax_amount;
				$ledger = $this->Invoices->Ledgers->newEntity();
				$ledger->ledger_account_id = $invoice->st_ledger_account_id;
				$ledger->debit = 0;
				$ledger->credit = $invoice->sale_tax_amount;
				$ledger->voucher_id = $invoice->id;
				$ledger->company_id = $invoice->company_id;
				$ledger->transaction_date = $invoice->date_created;
				$ledger->voucher_source = 'Invoice';
				if($ledger_saletax>0)
				{
					$this->Invoices->Ledgers->save($ledger); 
				}
				
				//Ledger posting for Fright Amount
				$ledger_fright= $invoice->fright_amount;
				//$accountReferences=$this->Invoices->AccountReferences->get(3);
				$ledger = $this->Invoices->Ledgers->newEntity();
				$ledger->ledger_account_id = $invoice->fright_ledger_account;
				$ledger->debit = 0;
				$ledger->credit = $invoice->fright_amount;
				$ledger->voucher_id = $invoice->id;
				$ledger->company_id = $invoice->company_id;
				$ledger->transaction_date = $invoice->date_created;
				$ledger->voucher_source = 'Invoice';
				
				if($ledger_fright>0)
				{
					$this->Invoices->Ledgers->save($ledger); 
				}
				$this->Invoices->ItemLedgers->deleteAll(['source_id' => $invoice->id, 'source_model'=> 'Invoices']);
				
				$qq=0; foreach($invoice->invoice_rows as $invoice_rows){
					$salesorderrow=$this->Invoices->SalesOrderRows->find()->where(['sales_order_id'=>$invoice->sales_order_id,'item_id'=>$invoice_rows->item_id])->first();
					$salesorderrow->processed_quantity=$salesorderrow->processed_quantity-@$invoice->getOriginal('invoice_rows')[$qq]->quantity+$invoice_rows->quantity;
					$this->Invoices->SalesOrderRows->save($salesorderrow);
					$qq++; 
				}
				
				$this->Invoices->ItemLedgers->deleteAll(['source_id' => $invoice->id, 'source_model'=> 'Invoices']);
				
				 $discount=$invoice->discount;
				 $pf=$invoice->pnf;
				 $exciseDuty=$invoice->exceise_duty;
				 $sale_tax=$invoice->sale_tax_amount;
				 $fright=$invoice->fright_amount;
				 $total_amt=0;
				foreach($invoice->invoice_rows as $invoice_row){
					$amt=$invoice_row->amount;
					$total_amt=$total_amt+$amt;
				
					$item_serial_no=$invoice_row->item_serial_number;
					$serial_no=explode(",",$item_serial_no);
					foreach($serial_no as $serial){
					$query = $this->Invoices->InvoiceRows->ItemSerialNumbers->query();
						$query->update()
							->set(['status' => 'Out','invoice_id' => $invoice->id])
							->where(['id' => $serial])
							->execute();
					}
				}
				$i=0; foreach($invoice->invoice_rows as $invoice_rows){
					
						$item_id=$invoice->invoice_rows[$i]['item_id'];
						$qty=$invoice->invoice_rows[$i]['quantity'];
						$rate=$invoice->invoice_rows[$i]['rate'];
						$amount=$invoice->invoice_rows[$i]['amount'];
						$dis=$discount*$amount/$total_amt;
						$item_discount=$dis/$qty;
						$pnf=$pf*$amount/$total_amt;
						$item_pf=$pnf/$qty;
						$excise=$exciseDuty*$amount/$total_amt;
						$item_excise=$excise/$qty;
						$saletax=$sale_tax*$amount/$total_amt;
						$item_saletax=$saletax/$qty;
						$fr_amount=$fright*$amount/$total_amt;
						$item_fright=$fr_amount/$qty;
						
						
						$itemLedger = $this->Invoices->ItemLedgers->newEntity();
						$itemLedger->item_id = $item_id;
						$itemLedger->quantity = $qty;
						$itemLedger->source_model = 'Invoices';
						$itemLedger->source_id = $invoice->id;
						$itemLedger->in_out = 'Out';
						$itemLedger->rate = $rate-$item_discount+$item_excise+$item_pf;
						$itemLedger->company_id = $invoice->company_id;
						$itemLedger->processed_on = date("Y-m-d");
						
						$this->Invoices->ItemLedgers->save($itemLedger);
						$i++;

				}
				for($row=0; $row<$total_row; $row++)
					{
						if(!empty($this->request->data['old_amount'][$row]))
						{				////////////////  ReferenceDetails ////////////////////////////////
					
					
							$query1 = $this->Invoices->ReferenceDetails->query();
							$query1->update()
							->set(['credit' => $this->request->data['credit'][$row]])
							->where([
								'ledger_account_id' => $c_LedgerAccount->id,
								'invoice_id' => $invoice->id,
								'reference_no' => $this->request->data['reference_no'][$row],
								'reference_type' => $this->request->data['reference_type'][$row]
							])
							->execute();
							
							////////////////  ReferenceBalances ////////////////////////////////
							if($this->request->data['reference_type'][$row]=='Against Reference')
							{
								
								$res=$this->Invoices->ReferenceBalances->find()->where(['reference_no' => $this->request->data['reference_no'][$row],'ledger_account_id' => $customer_ledger->ledger_account_id])->first();
								
								 $q=$res->credit-$this->request->data['old_amount'][$row]+ $this->request->data['credit'][$row];
								
								$query2 = $this->Invoices->ReferenceBalances->query();
								$query2->update()
									->set(['credit' => $q])
									->where(['reference_no' => $this->request->data['reference_no'][$row],'ledger_account_id' => $customer_ledger->ledger_account_id])
									->execute();
							}
							else
							{ 
								$query2 = $this->Invoices->ReferenceBalances->query();
								$query2->update()
								->set(['credit' => $this->request->data['credit'][$row]])
								->where([
									'reference_no' => $this->request->data['reference_no'][$row],
									'ledger_account_id' => $c_LedgerAccount->id
								])
								->execute();
								
							}

						}
						else
						{
							////////////////  ReferenceDetails ////////////////////////////////
							$query1 = $this->Invoices->ReferenceDetails->query();
							$query1->insert(['reference_no', 'ledger_account_id', 'invoice_id', 'credit', 'reference_type'])
							->values([
								'ledger_account_id' => $c_LedgerAccount->id,
								'invoice_id' => $invoice->id,
								'reference_no' => $this->request->data['reference_no'][$row],
								'credit' => $this->request->data['credit'][$row],
								'reference_type' => $this->request->data['reference_type'][$row]
							])
							->execute();
							
							////////////////  ReferenceBalances ////////////////////////////////
							if($this->request->data['reference_type'][$row]=='Against Reference')
							{
								$query2 = $this->Invoices->ReferenceBalances->query();
								$query2->update()
									->set(['credit' => $this->request->data['credit'][$row]])
									->where(['reference_no' => $this->request->data['reference_no'][$row],'ledger_account_id' => $customer_ledger->ledger_account_id])
									->execute();
							}
							else
							{
								$query2 = $this->Invoices->ReferenceBalances->query();
								$query2->insert(['reference_no', 'ledger_account_id', 'credit'])
								->values([
									'reference_no' => $this->request->data['reference_no'][$row],
									'ledger_account_id' => $c_LedgerAccount->id,
									'credit' => $this->request->data['credit'][$row],
								])
								->execute();
							}
						}
						
					}
				
                $this->Flash->success(__('The invoice has been saved.'));

                return $this->redirect(['action' => 'index']);
            } else { pr($invoice); exit;
                $this->Flash->error(__('The invoice could not be saved. Please, try again.'));
            }
        }
       $customers = $this->Invoices->Customers->find('all');
       $companies = $this->Invoices->Companies->find('all', ['limit' => 200]);
	   
		
		$salesOrders = $this->Invoices->SalesOrders->find()->select(['total_rows' => 
				$this->Invoices->SalesOrders->find()->func()->count('SalesOrderRows.id')])
				->leftJoinWith('SalesOrderRows', function ($q) {
					return $q->where(['SalesOrderRows.quantity > SalesOrderRows.processed_quantity']);
				})
				->group(['SalesOrders.id'])
				->autoFields(true)
				->having(['total_rows >' => 0]);
				
		$customer_ledger = $this->Invoices->LedgerAccounts->find()->where(['LedgerAccounts.source_id'=>$invoice->customer_id,'LedgerAccounts.source_model'=>'Customers'])->toArray();
		
		$customer_reference_details = $this->Invoices->ReferenceDetails->find()->where(['ReferenceDetails.ledger_account_id'=>$customer_ledger[0]->id])->toArray();
		//pr()
		$total_credit=0;
		$total_debit=0;
		$old_due_payment=0;
		foreach($customer_reference_details as $customer_reference_detail){
			if($customer_reference_detail->debit==0){
				$total_credit=$total_credit+$customer_reference_detail->credit;
			}
			else{
				$total_debit=$total_debit+$customer_reference_detail->debit;
			}
		}
		
		$temp_due_payment=$total_credit-$total_debit;
		$old_due_payment=$temp_due_payment-$invoice->grand_total;
		

		$AccountReference_for_sale= $this->Invoices->AccountReferences->get(1);
		$account_first_subgroup_id=$AccountReference_for_sale->account_first_subgroup_id;
		
		$AccountReference_for_fright= $this->Invoices->AccountReferences->get(3);
		$account_first_subgroup_id_for_fright=$AccountReference_for_fright->account_first_subgroup_id;
		$ledger_account_details = $this->Invoices->LedgerAccounts->find('list')->contain(['AccountSecondSubgroups'=>['AccountFirstSubgroups' => function($q) use($account_first_subgroup_id){
			return $q->where(['AccountFirstSubgroups.id'=>$account_first_subgroup_id]);
		}]])->order(['LedgerAccounts.name' => 'ASC'])->where(['LedgerAccounts.company_id'=>$st_company_id]);
		
		$ledger_account_details_for_fright = $this->Invoices->LedgerAccounts->find('list')->contain(['AccountSecondSubgroups'=>['AccountFirstSubgroups' => function($q) use($account_first_subgroup_id_for_fright){
			return $q->where(['AccountFirstSubgroups.id'=>$account_first_subgroup_id_for_fright]);
		}]])->order(['LedgerAccounts.name' => 'ASC'])->where(['LedgerAccounts.company_id'=>$st_company_id]);
		
		$items = $this->Invoices->Items->find('list');
		$transporters = $this->Invoices->Transporters->find('list');
		$termsConditions = $this->Invoices->TermsConditions->find('all');
		$SaleTaxes = $this->Invoices->SaleTaxes->find('all')->where(['freeze'=>0]);
		$employees = $this->Invoices->Employees->find('list');
        $this->set(compact('invoice_id','ReferenceDetails','ReferenceBalances','invoice', 'customers', 'companies', 'salesOrders','old_due_payment','items','transporters','termsConditions','serviceTaxs','exciseDuty','SaleTaxes','employees','dueInvoices','serial_no','ItemSerialNumber','SelectItemSerialNumber','ItemSerialNumber2','financial_year_data','ledger_account_details','ledger_account_details_for_fright','sale_tax_ledger_accounts','c_LedgerAccount'));
        $this->set('_serialize', ['invoice']);
    }

    /**
     * Delete method
     *
     * @param string|null $id Invoice id.
     * @return \Cake\Network\Response|null Redirects to index.
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function delete($id = null)
    {
        $this->request->allowMethod(['post', 'delete']);
        $invoice = $this->Invoices->get($id);
        if ($this->Invoices->delete($invoice)) {
            $this->Flash->success(__('The invoice has been deleted.'));
        } else {
            $this->Flash->error(__('The invoice could not be deleted. Please, try again.'));
        }

        return $this->redirect(['action' => 'index']);
    }
	
	function RecentRecords($item_id=null,$customer_id=null){
		$this->viewBuilder()->layout('');
		if(!empty($item_id) and !empty($customer_id)){
			
			$session = $this->request->session();
			$st_company_id = $session->read('st_company_id');
			
			$item = $this->Invoices->Items->get($item_id, [
				'contain' => ['ItemCompanies'=>function($q) use($st_company_id){
					return $q->where(['company_id'=>$st_company_id]);
				}]
			]);
			
			$customerIds=[]; $customer_text='';
			$customer=$this->Invoices->Customers->get($customer_id);
			if($customer->customer_group_id!=0){
				$customerGroup=$this->Invoices->CustomerGroups->get($customer->customer_group_id);
				$customer_text='Past Records of customer group - <b>'.$customerGroup->name.'</b>';
				$customers=$this->Invoices->Customers->find()->select(['id'])->where(['customer_group_id'=>$customer->customer_group_id]);
				foreach($customers as $data){
					$customerIds[]=$data->id;
				}
			}else{
				$customerIds=array($customer_id);
				 $customer_text='Past Records of customer - <b>'.$customer->customer_name.'</b>';
			}
			$Invoices=$this->Invoices->find()->where(['customer_id IN' => $customerIds])->matching(
					'InvoiceRows', function ($q) use($item_id) {
						return $q->where(['InvoiceRows.item_id' => $item_id]);
					}
				);
			//$this->set(compact('Invoices','customer_text','item'));
			$Number = new NumberHelper(new \Cake\View\View());
			$Html = new HtmlHelper(new \Cake\View\View());
			
			$html='<span style="font-size: 14px;">Minimum Selling Rate for Item <b>"'.$item->name.'"</b> : '. $Number->format($item->item_companies[0]->dynamic_cost*$item->item_companies[0]->minimum_selling_price_factor,[ 'places' => 2]).'</span><br/><br/>
			<div style="font-size: 14px;">'.$customer_text.'</div>
			<table class="table">
				<thead>
					<tr>
						<th>Sr. No.</th>
						<th>Invoice No.</th>
						<th>Invoice Date</th>
						<th>Last Selling Rate</th>
					</tr>
				</thead>
				<tbody>';
				$i=0; foreach($Invoices as $invoice):
				$html.='<tr>
						<td>'.h(++$i).'</td>
						<td>'.$Html->link(($invoice->in1.'/IN'.str_pad($invoice->id, 3, '0', STR_PAD_LEFT).'/'.$invoice->in3.'/'.$invoice->in4),'/Invoices/confirm/'.$invoice->id,array('target'=>'_blank')).'</td>
						<td>'.h(date('d-m-Y',strtotime($invoice->date_created))).'</td>
						<td>'.$Number->format($invoice->_matchingData['InvoiceRows']->rate,[ 'places' => 2]).'</td>
					</tr>';
				endforeach;
				$html.='</tbody>
			</table>';
			die(json_encode(array("html"=>$html,"minimum_selling_price"=>$item->item_companies[0]->dynamic_cost*$item->item_companies[0]->minimum_selling_price_factor)));
		}
	}
	
	function DueInvoicesForReceipt($received_from_id=null){
		$this->viewBuilder()->layout('');
		$session = $this->request->session();
		$st_company_id = $session->read('st_company_id');
		
		$Customer=$this->Invoices->Customers->find()->where(['ledger_account_id'=>$received_from_id])->first();
		if(!$Customer){ echo 'Select received from.'; exit; }
		$Invoices = $this->Invoices->find()->where(['company_id'=>$st_company_id,'customer_id'=>$Customer->id,'due_payment >'=>0]);
		 $this->set(compact('Invoices','Customer'));
	}
	
	function Cancel($id = null)
    {
        $invoice = $this->Invoices->get($id);
		
		$invoice->status='Cancel';
		$sales_order_id=$invoice->sales_order_id;
		
		/* $results=$this->Invoices->ItemLedgers->find()->where(['ItemLedgers.source_id' => $id,'source_model' => 'Invoices'])->toArray(); */
		
		$this->Invoices->ItemLedgers->deleteAll(['ItemLedgers.source_id' => $id,'source_model' => 'Invoices']);
		
		 if ($this->Invoices->save($invoice)) {
			 
			 
            $this->Flash->success(__('The invoice has been Cancel.'));
        } else {
            $this->Flash->error(__('The invoice could not be Cancel. Please, try again.'));
        }

        return $this->redirect(['action' => 'index']);
    }
	
	function AgstRefForPaymentEdit($in_id=null,$customer_id=null){
		$this->viewBuilder()->layout('');
		$session = $this->request->session();
		$st_company_id = $session->read('st_company_id');
		//$Customer=$this->Invoices->Customers->find()->where(['Customers.id'=>$customer_id])->first();
		$invoiceBreakups=$this->Invoices->InvoiceBreakups->find()->where(['InvoiceBreakups.invoice_id'=>$in_id])->toArray();
		
		//pr($Customer); 	//$ReceiptVoucher=$this->Invoices->ReceiptVouchers->find()->where(['received_from_id'=>$Customer->ledger_account_id,'advance_amount > '=>0.00])->toArray();
		//pr($ReceiptVoucher); exit;
		if(!$invoiceBreakups){ echo 'Select paid to.'; exit; }
		$this->set(compact('invoiceBreakups'));
	}
}
