<?php
namespace App\Controller;

use App\Controller\AppController;

/**
 * PaymentVouchers Controller
 *
 * @property \App\Model\Table\PaymentVouchersTable $PaymentVouchers
 */
class PaymentVouchersController extends AppController
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
            'contain' => ['PaidTos','BankCashes']
        ];
        $paymentVouchers = $this->paginate($this->PaymentVouchers);
		$this->set(compact('paymentVouchers'));
        $this->set('_serialize', ['paymentVouchers']);
    }

    /**
     * View method
     *
     * @param string|null $id Payment Voucher id.
     * @return \Cake\Network\Response|null
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function view($id = null)
    {
		
		$this->viewBuilder()->layout('index_layout');
        $paymentVoucher = $this->PaymentVouchers->get($id, [
            'contain' => ['PaidTos','BankCashes','Companies']
        ]);

        $this->set('paymentVoucher', $paymentVoucher);
        $this->set('_serialize', ['paymentVoucher']);
    }

    /**
     * Add method
     *
     * @return \Cake\Network\Response|void Redirects on successful add, renders view otherwise.
     */
    public function add()
    {
		$this->viewBuilder()->layout('index_layout');
        $paymentVoucher = $this->PaymentVouchers->newEntity();
        if ($this->request->is('post')) {
		
			$paymentVoucher = $this->PaymentVouchers->patchEntity($paymentVoucher, $this->request->data);
			$paymentVoucher->created_on=date("Y-m-d");
			$paymentVoucher->transaction_date=date("Y-m-d",strtotime($paymentVoucher->transaction_date));
			
			 if ($this->PaymentVouchers->save($paymentVoucher)) {
				
				//Ledger posting for paidto
				$ledger = $this->PaymentVouchers->Ledgers->newEntity();
				$ledger->ledger_account_id = $paymentVoucher->paid_to_id;
				$ledger->debit = $paymentVoucher->amount;
				$ledger->credit = 0;
				$ledger->voucher_id = $paymentVoucher->id;
				$ledger->voucher_source = 'Payment Voucher';
				$this->PaymentVouchers->Ledgers->save($ledger);
				//Ledger posting for bankcash
				$ledger = $this->PaymentVouchers->Ledgers->newEntity();
				$ledger->ledger_account_id = $paymentVoucher->cash_bank_account_id;
				$ledger->debit = 0;
				$ledger->credit = $paymentVoucher->amount;;
				$ledger->voucher_id = $paymentVoucher->id;
				$ledger->voucher_source = 'Payment Voucher';
				//$ledger[]=('ledger_account_id' = $paymentVoucher->cash_bank_account_id,'debit'=0,'credit'=$paymentVoucher->amount,'voucher_id'=$paymentVoucher->id,'voucher_source'='Payment Voucher';
				if ($this->PaymentVouchers->Ledgers->save($ledger)) {
                $this->Flash->success(__('The payment voucher has been saved.'));
				return $this->redirect(['action' => 'index']);
            } 
                $this->Flash->success(__('The payment voucher has been saved.'));
				return $this->redirect(['action' => 'index']);
            } else {
                $this->Flash->error(__('The payment voucher could not be saved. Please, try again.'));
            }
        }
		$vouchersReferences = $this->PaymentVouchers->VouchersReferences->get(1, [
            'contain' => ['VouchersReferencesGroups']
        ]);
		$where=[];
		foreach($vouchersReferences->vouchers_references_groups as $data){
			$where[]=$data->account_group_id;
		}
		$paidTos = $this->PaymentVouchers->PaidTos->find('list')->contain(['AccountSecondSubgroups'=>['AccountFirstSubgroups'=>['AccountGroups' => function ($q) use($where) {
				   return $q
						->where(['AccountGroups.id IN' => $where]);
				}]]]);
				
		$vouchersReferences = $this->PaymentVouchers->VouchersReferences->get(2, [
            'contain' => ['VouchersReferencesGroups']
        ]);
		$where=[];
		foreach($vouchersReferences->vouchers_references_groups as $data){
			$where[]=$data->account_group_id;
		}
		$bankCashes = $this->PaymentVouchers->BankCashes->find('list')->contain(['AccountSecondSubgroups'=>['AccountFirstSubgroups'=>['AccountGroups' => function ($q) use($where) {
				   return $q
						->where(['AccountGroups.id IN' => $where]);
				}]]]);
		
        $companies = $this->PaymentVouchers->Companies->find('all');		
        $this->set(compact('paymentVoucher', 'paidTos', 'bankCashes','companies'));
        $this->set('_serialize', ['paymentVoucher']);
    }

		
    /**
     * Edit method
     *
     * @param string|null $id Payment Voucher id.
     * @return \Cake\Network\Response|void Redirects on successful edit, renders view otherwise.
     * @throws \Cake\Network\Exception\NotFoundException When record not found.
     */
    public function edit($id = null)
    {
		
		$this->viewBuilder()->layout('index_layout');
        $paymentVoucher = $this->PaymentVouchers->get($id, [
            'contain' => ['PaidTos','BankCashes','Companies']
       
        ]);
        if ($this->request->is(['patch', 'post', 'put'])) {
            $paymentVoucher = $this->PaymentVouchers->patchEntity($paymentVoucher, $this->request->data);
			
			$paymentVoucher->created_on=date("Y-m-d",strtotime($paymentVoucher->created_on));
			$paymentVoucher->transaction_date=date("Y-m-d",strtotime($paymentVoucher->transaction_date));
			//$paymentVoucher->created_on=date("Y-m-d");
            if ($this->PaymentVouchers->save($paymentVoucher)) {
				$ledger = $this->PaymentVouchers->Ledgers->newEntity();
				$ledger[]=['ledger_account_id' => $paymentVoucher->paid_to_id,'debit'=>$paymentVoucher->amount,'credit'=>0,'voucher_id'=>$paymentVoucher->id,'voucher_source'=>'Payment Voucher'];
				pr($paymentVoucher->paid_to_id);
				exit;
				//$ledger[]=('ledger_account_id' = $paymentVoucher->cash_bank_account_id,'debit'=0,'credit'=$paymentVoucher->amount,'voucher_id'=$paymentVoucher->id,'voucher_source'='Payment Voucher';
				if ($this->PaymentVouchers->Ledgers->save($ledger)) {
                $this->Flash->success(__('The payment voucher has been saved.'));
				return $this->redirect(['action' => 'index']);
            } 
			} else {
                $this->Flash->error(__('The payment voucher could not be saved. Please, try again.'));
            }
        }
       $vouchersReferences = $this->PaymentVouchers->VouchersReferences->get(1, [
            'contain' => ['VouchersReferencesGroups']
        ]);
		$where=[];
		foreach($vouchersReferences->vouchers_references_groups as $data){
			$where[]=$data->account_group_id;
		}
		$paidTos = $this->PaymentVouchers->PaidTos->find('list')->contain(['AccountSecondSubgroups'=>['AccountFirstSubgroups'=>['AccountGroups' => function ($q) use($where) {
				   return $q
						->where(['AccountGroups.id IN' => $where]);
				}]]]);
				
		$vouchersReferences = $this->PaymentVouchers->VouchersReferences->get(2, [
            'contain' => ['VouchersReferencesGroups']
        ]);
		$where=[];
		foreach($vouchersReferences->vouchers_references_groups as $data){
			$where[]=$data->account_group_id;
		}
		$bankCashes = $this->PaymentVouchers->BankCashes->find('list')->contain(['AccountSecondSubgroups'=>['AccountFirstSubgroups'=>['AccountGroups' => function ($q) use($where) {
				   return $q
						->where(['AccountGroups.id IN' => $where]);
				}]]]);
		
        $companies = $this->PaymentVouchers->Companies->find('all');	
        $this->set(compact('paymentVoucher', 'paidTos', 'bankCashes','companies'));
        $this->set('_serialize', ['paymentVoucher']);
 
    }

    /**
     * Delete method
     *
     * @param string|null $id Payment Voucher id.
     * @return \Cake\Network\Response|null Redirects to index.
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function delete($id = null)
    {
        $this->request->allowMethod(['post', 'delete']);
        $paymentVoucher = $this->PaymentVouchers->get($id);
        if ($this->PaymentVouchers->delete($paymentVoucher)) {
            $this->Flash->success(__('The payment voucher has been deleted.'));
        } else {
            $this->Flash->error(__('The payment voucher could not be deleted. Please, try again.'));
        }

        return $this->redirect(['action' => 'index']);
    }
}
