<?php
namespace App\Controller;

use App\Controller\AppController;

/**
 * ReceiptVouchers Controller
 *
 * @property \App\Model\Table\ReceiptVouchersTable $ReceiptVouchers
 */
class ReceiptVouchersController extends AppController
{

    /**
     * Index method
     *
     * @return \Cake\Network\Response|null
     */
    public function index()
    {
		$this->viewBuilder()->layout('index_layout');
        $this->paginate = [
            'contain' => ['ReceivedFroms', 'BankCashes']
        ];
        $receiptVouchers = $this->paginate($this->ReceiptVouchers->find()->order(['transaction_date' => 'DESC']));

        $this->set(compact('receiptVouchers'));
        $this->set('_serialize', ['receiptVouchers']);
    }

    /**
     * View method
     *
     * @param string|null $id Receipt Voucher id.
     * @return \Cake\Network\Response|null
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function view($id = null)
    {
		$this->viewBuilder()->layout('index_layout');
        $receiptVoucher = $this->ReceiptVouchers->get($id, [
            'contain' => ['ReceivedFroms', 'BankCashes','Companies']
        ]);

        $this->set('receiptVoucher', $receiptVoucher);
        $this->set('_serialize', ['receiptVoucher']);
    }

    /**
     * Add method
     *
     * @return \Cake\Network\Response|void Redirects on successful add, renders view otherwise.
     */
    public function add()
    {
		$this->viewBuilder()->layout('index_layout');
        $receiptVoucher = $this->ReceiptVouchers->newEntity();
		$s_employee_id=$this->viewVars['s_employee_id'];
		$session = $this->request->session();
		$st_company_id = $session->read('st_company_id');
        
        if ($this->request->is('post')) {
            $receiptVoucher = $this->ReceiptVouchers->patchEntity($receiptVoucher, $this->request->data);
			$receiptVoucher->created_by=$s_employee_id;
			$receiptVoucher->transaction_date=date("Y-m-d",strtotime($receiptVoucher->transaction_date));
			$receiptVoucher->created_on=date("Y-m-d");
			$receiptVoucher->company_id=$st_company_id;
				
					
            if ($this->ReceiptVouchers->save($receiptVoucher)) {
				
				//Ledger posting for Received From Entity
				$ledger = $this->ReceiptVouchers->Ledgers->newEntity();
				$ledger->ledger_account_id = $receiptVoucher->bank_cash_id;
				$ledger->debit =$receiptVoucher->amount;
				$ledger->credit = 0;
				$ledger->voucher_id = $receiptVoucher->id;
				$ledger->voucher_source = 'Receipt Voucher';
				$ledger->transaction_date = $receiptVoucher->transaction_date;
				$this->ReceiptVouchers->Ledgers->save($ledger);
				
				//Ledger posting for bankcash
				$ledger = $this->ReceiptVouchers->Ledgers->newEntity();
				$ledger->ledger_account_id = $receiptVoucher->received_from_id;
				$ledger->debit = 0;
				$ledger->credit = $receiptVoucher->amount;;
				$ledger->voucher_id = $receiptVoucher->id;
				$ledger->voucher_source = 'Receipt Voucher';
				$ledger->transaction_date = $receiptVoucher->transaction_date;
				$this->ReceiptVouchers->Ledgers->save($ledger); 
				
				//Invoice Update 
				if($receiptVoucher->payment_process=="Against Reference Number"){
					
					$Customer=$this->ReceiptVouchers->Customers->find()->where(['ledger_account_id'=>$receiptVoucher->received_from_id])->first();
					
					$Invoices=$this->ReceiptVouchers->Invoices->find()->where(['due_payment !='=>0,'customer_id'=>$Customer->id])->order(['date_created'=>'ASC']);
					
					$remaining_amount=$receiptVoucher->amount;
					
					foreach($Invoices as $Invoice){
						$remaining_amount=$remaining_amount-$Invoice->due_payment;
						if($remaining_amount>=0){
							$Invoice=$this->ReceiptVouchers->Invoices->get($Invoice->id);
							$Invoice->due_payment=0;
							$this->ReceiptVouchers->Invoices->save($Invoice);
						}else{
							$Invoice=$this->ReceiptVouchers->Invoices->get($Invoice->id);
							$Invoice->due_payment=abs($remaining_amount);
							$this->ReceiptVouchers->Invoices->save($Invoice);
							break;
						}
					}
				} 
				$this->Flash->success(__('The Receipt-Voucher:'.str_pad($receiptVoucher->id, 4, '0', STR_PAD_LEFT)).' has been genereted.');
				return $this->redirect(['action' => 'index']);
			} else {
                $this->Flash->error(__('The receipt voucher could not be saved. Please, try again.'));
            }
        }
		$vouchersReferences = $this->ReceiptVouchers->VouchersReferences->get(3, [
            'contain' => ['VouchersReferencesGroups']
        ]);
		$where=[];
		foreach($vouchersReferences->vouchers_references_groups as $data){
			$where[]=$data->account_group_id;
		}
		$receivedFroms = $this->ReceiptVouchers->ReceivedFroms->find('list')->contain(['AccountSecondSubgroups'=>['AccountFirstSubgroups'=>['AccountGroups' => function ($q) use($where) {
				   return $q
						->where(['AccountGroups.id IN' => $where]);
				}]]]);
				
		$vouchersReferences = $this->ReceiptVouchers->VouchersReferences->get(4, [
            'contain' => ['VouchersReferencesGroups']
        ]);
		$where=[];
		foreach($vouchersReferences->vouchers_references_groups as $data){
			$where[]=$data->account_group_id;
		}
		$bankCashes = $this->ReceiptVouchers->BankCashes->find('list')->contain(['AccountSecondSubgroups'=>['AccountFirstSubgroups'=>['AccountGroups' => function ($q) use($where) {
				   return $q
						->where(['AccountGroups.id IN' => $where]);
				}]]]);
		
        $companies = $this->ReceiptVouchers->Companies->find('all');		
        $this->set(compact('receiptVoucher', 'receivedFroms', 'bankCashes','companies'));
        $this->set('_serialize', ['receiptVoucher']);
    }

    /**
     * Edit method
     *
     * @param string|null $id Receipt Voucher id.
     * @return \Cake\Network\Response|void Redirects on successful edit, renders view otherwise.
     * @throws \Cake\Network\Exception\NotFoundException When record not found.
     */
    public function edit($id = null)
    {
		$this->viewBuilder()->layout('index_layout');
		$s_employee_id=$this->viewVars['s_employee_id'];
		$session = $this->request->session();
		$st_company_id = $session->read('st_company_id');
        
        $receiptVoucher = $this->ReceiptVouchers->get($id, [
            'contain' => []
        ]);
        if ($this->request->is(['patch', 'post', 'put'])) {
            $receiptVoucher = $this->ReceiptVouchers->patchEntity($receiptVoucher, $this->request->data);
			$receiptVoucher->edited_by=$s_employee_id;
				$receiptVoucher->transaction_date=date("Y-m-d",strtotime($receiptVoucher->transaction_date));
				$receiptVoucher->edited_on=date("Y-m-d");
				$receiptVoucher->company_id=$st_company_id;
			
            if ($this->ReceiptVouchers->save($receiptVoucher)) {
				
				//delete old data
				$this->ReceiptVouchers->Ledgers->deleteAll(['voucher_id' => $receiptVoucher->id, 'voucher_source' => 'Receipt Voucher']);
				//Ledger posting for Received From Entity
				$ledger = $this->ReceiptVouchers->Ledgers->newEntity();
				$ledger->ledger_account_id = $receiptVoucher->bank_cash_id;
				$ledger->debit =$receiptVoucher->amount;
				$ledger->credit = 0;
				$ledger->voucher_id = $receiptVoucher->id;
				$ledger->voucher_source = 'Receipt Voucher';
				$ledger->transaction_date = $receiptVoucher->transaction_date;
				$this->ReceiptVouchers->Ledgers->save($ledger);
				
				//Ledger posting for bankcash
				$ledger = $this->ReceiptVouchers->Ledgers->newEntity();
				$ledger->ledger_account_id = $receiptVoucher->received_from_id;
				$ledger->debit = 0;
				$ledger->credit = $receiptVoucher->amount;;
				$ledger->voucher_id = $receiptVoucher->id;
				$ledger->voucher_source = 'Receipt Voucher';
				$ledger->transaction_date = $receiptVoucher->transaction_date;
				$this->ReceiptVouchers->Ledgers->save($ledger);
                $this->Flash->success(__('The receipt voucher has been saved.'));
				return $this->redirect(['action' => 'index']);
            } else {
                $this->Flash->error(__('The receipt voucher could not be saved. Please, try again.'));
            }
        }$vouchersReferences = $this->ReceiptVouchers->VouchersReferences->get(3, [
            'contain' => ['VouchersReferencesGroups']
        ]);
		$where=[];
		foreach($vouchersReferences->vouchers_references_groups as $data){
			$where[]=$data->account_group_id;
		}
		$receivedFroms = $this->ReceiptVouchers->ReceivedFroms->find('list')->contain(['AccountSecondSubgroups'=>['AccountFirstSubgroups'=>['AccountGroups' => function ($q) use($where) {
				   return $q
						->where(['AccountGroups.id IN' => $where]);
				}]]]);
				
		$vouchersReferences = $this->ReceiptVouchers->VouchersReferences->get(4, [
            'contain' => ['VouchersReferencesGroups']
        ]);
		$where=[];
		foreach($vouchersReferences->vouchers_references_groups as $data){
			$where[]=$data->account_group_id;
		}
		$bankCashes = $this->ReceiptVouchers->BankCashes->find('list')->contain(['AccountSecondSubgroups'=>['AccountFirstSubgroups'=>['AccountGroups' => function ($q) use($where) {
				   return $q
						->where(['AccountGroups.id IN' => $where]);
				}]]]);
		
        $companies = $this->ReceiptVouchers->Companies->find('all');		
        $this->set(compact('receiptVoucher', 'receivedFroms', 'bankCashes','companies'));
        $this->set('_serialize', ['receiptVoucher']);
    }

    /**
     * Delete method
     *
     * @param string|null $id Receipt Voucher id.
     * @return \Cake\Network\Response|null Redirects to index.
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function delete($id = null)
    {
        $this->request->allowMethod(['post', 'delete']);
        $receiptVoucher = $this->ReceiptVouchers->get($id);
        if ($this->ReceiptVouchers->delete($receiptVoucher)) {
            $this->Flash->success(__('The receipt voucher has been deleted.'));
        } else {
            $this->Flash->error(__('The receipt voucher could not be deleted. Please, try again.'));
        }

        return $this->redirect(['action' => 'index']);
    }
}
