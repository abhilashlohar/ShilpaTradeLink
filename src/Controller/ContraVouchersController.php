<?php
namespace App\Controller;

use App\Controller\AppController;

/**
 * ContraVouchers Controller
 *
 * @property \App\Model\Table\ContraVouchersTable $ContraVouchers
 */
class ContraVouchersController extends AppController
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
            'contain' => ['CashBankFroms','CashBankTos']
        ];
        $contraVouchers = $this->paginate($this->ContraVouchers);

        $this->set(compact('contraVouchers'));
        $this->set('_serialize', ['contraVouchers']);
    }

    /**
     * View method
     *
     * @param string|null $id Contra Voucher id.
     * @return \Cake\Network\Response|null
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function view($id = null)
    {
		
		$this->viewBuilder()->layout('index_layout');
        $contraVoucher = $this->ContraVouchers->get($id, [
            'contain' => ['Companies','CashBankFroms','CashBankTos']
        ]);

        $this->set('contraVoucher', $contraVoucher);
        $this->set('_serialize', ['contraVoucher']);
    }

    /**
     * Add method
     *
     * @return \Cake\Network\Response|void Redirects on successful add, renders view otherwise.
     */
    public function add()
    {
		
		$this->viewBuilder()->layout('index_layout');
        $contraVoucher = $this->ContraVouchers->newEntity();
		$s_employee_id=$this->viewVars['s_employee_id'];
		
        if ($this->request->is('post')) {
            $contraVoucher = $this->ContraVouchers->patchEntity($contraVoucher, $this->request->data);
			$contraVoucher->created_by=$s_employee_id;
			$contraVoucher->transaction_date=date("Y-m-d",strtotime($contraVoucher->transaction_date));
			$contraVoucher->created_on=date("Y-m-d");
			if ($this->ContraVouchers->save($contraVoucher)) {
				$ledger = $this->ContraVouchers->Ledgers->newEntity();
				$ledger->ledger_account_id = $contraVoucher->cash_bank_from;
				$ledger->debit = $contraVoucher->amount;
				$ledger->credit = 0;
				$ledger->voucher_id = $contraVoucher->id;
				$ledger->voucher_source = 'Contra Voucher';
				$this->ContraVouchers->Ledgers->save($ledger);
				//Ledger posting for bankcash
				$ledger = $this->ContraVouchers->Ledgers->newEntity();
				$ledger->ledger_account_id = $contraVoucher->cash_bank_to;
				$ledger->debit = 0;
				$ledger->credit = $contraVoucher->amount;
				$ledger->voucher_id = $contraVoucher->id;
				$ledger->voucher_source = 'Contra Voucher';
				if ($this->ContraVouchers->Ledgers->save($ledger)) {
                $this->Flash->success(__('The contra voucher has been saved.'));
				return $this->redirect(['action' => 'index']);
				} 
			}
           else {
                $this->Flash->error(__('The contra voucher could not be saved. Please, try again.'));
            }
        }$vouchersReferences = $this->ContraVouchers->VouchersReferences->get(7, [
            'contain' => ['VouchersReferencesGroups']
        ]);
		
		$where=[];
		foreach($vouchersReferences->vouchers_references_groups as $data){
			$where[]=$data->account_group_id;
		}

		$cashBankFroms = $this->ContraVouchers->CashBankFroms->find('list')->contain(['AccountSecondSubgroups'=>['AccountFirstSubgroups'=>['AccountGroups' => function ($q) use($where) {
				   return $q
						->where(['AccountGroups.id IN'=>$where]);
				}]]]);
			
		$vouchersReferences = $this->ContraVouchers->VouchersReferences->get(8, [
            'contain' => ['VouchersReferencesGroups']
        ]);
		$where=[];
		foreach($vouchersReferences->vouchers_references_groups as $data){
			  $where[]=$data->account_group_id;
			//pr($where); exit;
		}

		$cashBankTos = $this->ContraVouchers->CashBankTos->find('list')->contain(['AccountSecondSubgroups'=>['AccountFirstSubgroups'=>['AccountGroups' => function ($q) use($where) {
				   return $q
						->where(['AccountGroups.id IN'=>$where]);
				}]]]);
		
       $companies = $this->ContraVouchers->Companies->find('all');
        
        $this->set(compact('contraVoucher', 'cashBankFroms', 'cashBankTos','companies'));
        $this->set('_serialize', ['contraVoucher']);
    }

    /**
     * Edit method
     *
     * @param string|null $id Contra Voucher id.
     * @return \Cake\Network\Response|void Redirects on successful edit, renders view otherwise.
     * @throws \Cake\Network\Exception\NotFoundException When record not found.
     */
    public function edit($id = null)
    {
        $contraVoucher = $this->ContraVouchers->get($id, [
            'contain' => []
        ]);
        if ($this->request->is(['patch', 'post', 'put'])) {
            $contraVoucher = $this->ContraVouchers->patchEntity($contraVoucher, $this->request->data);
            if ($this->ContraVouchers->save($contraVoucher)) {
                $this->Flash->success(__('The contra voucher has been saved.'));

                return $this->redirect(['action' => 'index']);
            } else {
                $this->Flash->error(__('The contra voucher could not be saved. Please, try again.'));
            }
        }
        $companies = $this->ContraVouchers->Companies->find('list', ['limit' => 200]);
        $this->set(compact('contraVoucher', 'companies'));
        $this->set('_serialize', ['contraVoucher']);
    }

    /**
     * Delete method
     *
     * @param string|null $id Contra Voucher id.
     * @return \Cake\Network\Response|null Redirects to index.
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function delete($id = null)
    {
        $this->request->allowMethod(['post', 'delete']);
        $contraVoucher = $this->ContraVouchers->get($id);
        if ($this->ContraVouchers->delete($contraVoucher)) {
            $this->Flash->success(__('The contra voucher has been deleted.'));
        } else {
            $this->Flash->error(__('The contra voucher could not be deleted. Please, try again.'));
        }

        return $this->redirect(['action' => 'index']);
    }
}
