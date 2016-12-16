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
        $this->paginate = [
            'contain' => ['Grns']
        ];
		
		$invoiceBookings = $this->paginate($this->InvoiceBookings);

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
            'contain' => ['Grns']
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
		
		
		$grn_id=@(int)$this->request->query('grn');
		
		$grn=array();
		if(!empty($grn_id)){
			$grn = $this->InvoiceBookings->Grns->get($grn_id, [
				'contain' => ['GrnRows'=>['Items'],'Companies','Vendors','PurchaseOrders'=>['PurchaseOrderRows']]
			]);
		}
		//pr($grn); exit;
		
		$this->set(compact('grn'));
		$invoiceBooking = $this->InvoiceBookings->newEntity();
		
        
		if ($this->request->is('post')) {
            $invoiceBooking = $this->InvoiceBookings->patchEntity($invoiceBooking, $this->request->data);
			$invoiceBooking->grn_id=$grn_id; 
			$invoiceBooking->created_on=date("Y-m-d");
			//pr($invoiceBooking); exit;
            if ($this->InvoiceBookings->save($invoiceBooking)) {
				if(!empty($grn_id)){
					//$grn = $this->InvoiceBookings->Grns->get($grn_id);
					$grn = $this->InvoiceBookings->Grns->get($grn_id, [
								'contain' => ['GrnRows'=>['Items'],'Companies','Vendors','PurchaseOrders'=>['PurchaseOrderRows']]
							]);
					$grn->status='Invoice-Booked';
					$this->InvoiceBookings->Grns->save($grn);
				}
				
				//Ledger Posting
				$accountReferences = $this->InvoiceBookings->AccountReferences->get(2);
				 $total=0; 
				 $sum=0;
				$q=0; 
				//pr($grn);exit;
				foreach ($grn->grn_rows as $grn_rows)
				{
					$sum=$grn_rows->quantity*$grn->purchase_order->purchase_order_rows[$q]->rate ;
					$q++; $total=$total+$sum; 
				}; 
				
				$ledger = $this->InvoiceBookings->Ledgers->newEntity();
				$ledger->ledger_account_id = $accountReferences->ledger_account_id;
				$ledger->debit = $total;
				$ledger->credit = 0;
				$ledger->voucher_id = $invoiceBooking->id;
				$ledger->voucher_source = 'Invoice Booking';
				$ledger->transaction_date = $invoiceBooking->created_on;
				$this->InvoiceBookings->Ledgers->save($ledger);
				
				//Ledger posting for bankcash
				
				$ledger = $this->InvoiceBookings->Ledgers->newEntity();
				//pr($grn->vendor->ledger_account_id); exit;
				$ledger->ledger_account_id = $grn->vendor->ledger_account_id;
				//pr($ledger->ledger_account_id); exit;
				$ledger->debit = 0;
				$ledger->credit = $total;
				$ledger->voucher_id = $invoiceBooking->id;
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
            'contain' => ['Grns'=>['Companies','Vendors','GrnRows'=>['Items'],'PurchaseOrders'=>['PurchaseOrderRows']]]
        ]);
		
		
        if ($this->request->is(['patch', 'post', 'put'])) {
            $invoiceBooking = $this->InvoiceBookings->patchEntity($invoiceBooking, $this->request->data);
            if ($this->InvoiceBookings->save($invoiceBooking)) {
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
}
