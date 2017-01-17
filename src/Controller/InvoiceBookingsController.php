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
		
		$invoiceBookings = $this->paginate($this->InvoiceBookings->find()->where(['InvoiceBookings.company_id'=>$st_company_id]));

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
		$grn_id=@(int)$this->request->query('grn');
		$grn=array();
		if(!empty($grn_id)){
			$grn = $this->InvoiceBookings->Grns->get($grn_id, [
				'contain' => ['GrnRows'=>['Items'],'Companies','Vendors','PurchaseOrders'=>['PurchaseOrderRows']]
			]);
		}
		
		$last_ib_no=$this->InvoiceBookings->find()->select(['ib2'])->where(['company_id' => $st_company_id])->order(['ib2' => 'DESC'])->first();
			if($last_ib_no){
				@$last_ib_no->ib2=$last_ib_no->ib2+1;
			}else{
				@$last_ib_no->ib2=1;
			}

		
	 $this->set(compact('grn','last_ib_no'));
		$invoiceBooking = $this->InvoiceBookings->newEntity();
		if ($this->request->is('post')) {
            $invoiceBooking = $this->InvoiceBookings->patchEntity($invoiceBooking, $this->request->data);
			
			$invoiceBooking->grn_id=$grn_id; 
			$invoiceBooking->created_on=date("Y-m-d");
			$invoiceBooking->company_id=$st_company_id ;
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
					->set(['rate' => $rate])
					->where(['item_id' => $item_id, 'source_id' => $grn_id, 'source_model'=> 'Grns'])
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
				
				//ledger posting
				$ledger = $this->InvoiceBookings->Ledgers->newEntity();
				$ledger->ledger_account_id = $accountReferences->ledger_account_id;
				$ledger->debit = $invoiceBooking->total;
				$ledger->credit = 0;
				$ledger->voucher_id = $invoiceBooking->id;
				$ledger->company_id = $invoiceBooking->company_id;
				$ledger->voucher_source = 'Invoice Booking';
				$ledger->transaction_date = $invoiceBooking->created_on;
				$this->InvoiceBookings->Ledgers->save($ledger);
				
				//Ledger posting for bankcash
				
				$ledger = $this->InvoiceBookings->Ledgers->newEntity();
				$ledger->ledger_account_id = $grn->vendor->ledger_account_id;
				$ledger->debit = 0;
				$ledger->credit =$invoiceBooking->total;
				$ledger->voucher_id = $invoiceBooking->id;
				$ledger->company_id = $invoiceBooking->company_id;
				$ledger->transaction_date = $invoiceBooking->created_on;
				$ledger->voucher_source = 'Invoice Booking';
				$this->InvoiceBookings->Ledgers->save($ledger);
				
				
                $this->Flash->success(__('The invoice booking has been saved.'));

                return $this->redirect(['action' => 'index']);
            } else {
                $this->Flash->error(__('The invoice booking could not be saved. Please, try again.'));
            }
        }
		
		$companies = $this->InvoiceBookings->Companies->find('all');
        $grns = $this->InvoiceBookings->Grns->find('list', ['limit' => 200]);
        $this->set(compact('invoiceBooking', 'grns','companies'));
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
        $invoiceBooking = $this->InvoiceBookings->get($id, [
            'contain' => ['InvoiceBookingRows' => ['Items'],'Grns'=>['Companies','Vendors','GrnRows'=>['Items'],'PurchaseOrders'=>['PurchaseOrderRows']]]
        ]);
		
		
        if ($this->request->is(['patch', 'post', 'put'])) {
            $invoiceBooking = $this->InvoiceBookings->patchEntity($invoiceBooking, $this->request->data);
            if ($this->InvoiceBookings->save($invoiceBooking)) {
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
					->set(['rate' => $rate])
					->where(['item_id' => $item_id, 'source_id' => $grn_id, 'source_model'=> 'Grns'])
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
				$ledger->transaction_date = $invoiceBooking->created_on;
				$this->InvoiceBookings->Ledgers->save($ledger);
				
				
				//Ledger posting for bankcash
				
				$ledger = $this->InvoiceBookings->Ledgers->newEntity();
				//pr($grn->vendor->ledger_account_id); exit;
				$ledger->ledger_account_id = $grn->vendor->ledger_account_id;
				//pr($ledger->ledger_account_id); exit;
				$ledger->debit = 0;
				$ledger->credit =$invoiceBooking->total;
				$ledger->voucher_id = $invoiceBooking->id;
				$ledger->transaction_date = $invoiceBooking->created_on;
				$ledger->company_id = $invoiceBooking->company_id;
				$ledger->voucher_source = 'Invoice Booking';
				$this->InvoiceBookings->Ledgers->save($ledger);
				
                $this->Flash->success(__('The invoice booking has been saved.'));

                return $this->redirect(['action' => 'index']);
            } else {
                $this->Flash->error(__('The invoice booking could not be saved. Please, try again.'));
            }
        }
        $grns = $this->InvoiceBookings->Grns->find('list', ['limit' => 200]);
		
        $this->set(compact('invoiceBooking', 'grns'));
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

}
