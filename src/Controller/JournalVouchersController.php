<?php
namespace App\Controller;

use App\Controller\AppController;

/**
 * JournalVouchers Controller
 *
 * @property \App\Model\Table\JournalVouchersTable $JournalVouchers
 */
class JournalVouchersController extends AppController
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
            'contain' => ['JournalVoucherRows']
        ];
		
        $journalVouchers = $this->paginate($this->JournalVouchers);

        $this->set('journalVoucher');
		$this->set(compact('journalVouchers'));
		$this->set('_serialize', ['journalVouchers']);
    }

    /**
     * View method
     *
     * @param string|null $id Journal Voucher id.
     * @return \Cake\Network\Response|null
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function view($id = null)
    {
		
		$this->viewBuilder()->layout('index_layout');
        $journalVoucher = $this->JournalVouchers->get($id, [
            'contain' => ['Companies','JournalVoucherRows'=>['LedgerAccounts'],'Companies','Creator']
        ]);

        $this->set('journalVoucher', $journalVoucher);
        $this->set('_serialize', ['journalVoucher']);
    }

    /**
     * Add method
     *
     * @return \Cake\Network\Response|void Redirects on successful add, renders view otherwise.
     */
    public function add()
    {
		
		$this->viewBuilder()->layout('index_layout');
        $journalVoucher = $this->JournalVouchers->newEntity();
		$s_employee_id=$this->viewVars['s_employee_id'];
		
        if ($this->request->is('post')) {
            $journalVoucher = $this->JournalVouchers->patchEntity($journalVoucher, $this->request->data);
			
			$journalVoucher->created_by=$s_employee_id;
			$journalVoucher->transaction_date=date("Y-m-d",strtotime($journalVoucher->transaction_date));
			$journalVoucher->created_on=date("Y-m-d");
			
			if ($this->JournalVouchers->save($journalVoucher)) {
				
                $this->Flash->success(__('The journal voucher has been saved.'));
				return $this->redirect(['action' => 'add']);
				} 
			
           else {
                $this->Flash->error(__('The journal voucher could not be saved. Please, try again.'));
            }
		}
		$vouchersReferences = $this->JournalVouchers->VouchersReferences->get(9, [
          'contain' => ['VouchersReferencesGroups']
        ]);
		//pr($vouchersReferences); exit;
		$where=[];
		foreach($vouchersReferences->vouchers_references_groups as $data){
			$where[]=$data->account_group_id;
		}

		$ledgers = $this->JournalVouchers->LedgerAccounts->find('list')->contain(['AccountSecondSubgroups'=>['AccountFirstSubgroups'=>['AccountGroups' => function ($q) use($where) {
				   return $q
						->where(['AccountGroups.id IN'=>$where]);
				}]]]);
			
		
		
       $companies = $this->JournalVouchers->Companies->find('all');
        
        $this->set(compact('journalVoucher', 'ledgers','companies'));
        $this->set('_serialize', ['journalVoucher']);
    }

    /**
     * Edit method
     *
     * @param string|null $id Journal Voucher id.
     * @return \Cake\Network\Response|void Redirects on successful edit, renders view otherwise.
     * @throws \Cake\Network\Exception\NotFoundException When record not found.
     */
    public function edit($id = null)
    {
        $journalVoucher = $this->JournalVouchers->get($id, [
            'contain' => []
        ]);
        if ($this->request->is(['patch', 'post', 'put'])) {
            $journalVoucher = $this->JournalVouchers->patchEntity($journalVoucher, $this->request->data);
            if ($this->JournalVouchers->save($journalVoucher)) {
                $this->Flash->success(__('The journal voucher has been saved.'));

                return $this->redirect(['action' => 'index']);
            } else {
                $this->Flash->error(__('The journal voucher could not be saved. Please, try again.'));
            }
        }
        $companies = $this->JournalVouchers->Companies->find('list', ['limit' => 200]);
        $this->set(compact('journalVoucher', 'companies'));
        $this->set('_serialize', ['journalVoucher']);
    }

    /**
     * Delete method
     *
     * @param string|null $id Journal Voucher id.
     * @return \Cake\Network\Response|null Redirects to index.
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function delete($id = null)
    {
        $this->request->allowMethod(['post', 'delete']);
        $journalVoucher = $this->JournalVouchers->get($id);
        if ($this->JournalVouchers->delete($journalVoucher)) {
            $this->Flash->success(__('The journal voucher has been deleted.'));
        } else {
            $this->Flash->error(__('The journal voucher could not be deleted. Please, try again.'));
        }

        return $this->redirect(['action' => 'index']);
    }
}
