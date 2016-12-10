<?php
namespace App\Controller;

use App\Controller\AppController;

/**
 * DebitNotes Controller
 *
 * @property \App\Model\Table\DebitNotesTable $DebitNotes
 */
class DebitNotesController extends AppController
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
            'contain' => ['SalesAccs', 'Parties', 'Companies']
        ];
        $debitNotes = $this->paginate($this->DebitNotes->find()->order(['transaction_date' => 'DESC']));

        $this->set(compact('debitNotes'));
        $this->set('_serialize', ['debitNotes']);
    }

    /**
     * View method
     *
     * @param string|null $id Debit Note id.
     * @return \Cake\Network\Response|null
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function view($id = null)
    {
		
		$this->viewBuilder()->layout('index_layout');
        $debitNote = $this->DebitNotes->get($id, [
            'contain' => ['SalesAccs', 'Parties', 'Companies']
        ]);

        $this->set('debitNote', $debitNote);
        $this->set('_serialize', ['debitNote']);
    }

    /**
     * Add method
     *
     * @return \Cake\Network\Response|void Redirects on successful add, renders view otherwise.
     */
    public function add()
    {
		
		$this->viewBuilder()->layout('index_layout');
        $debitNote = $this->DebitNotes->newEntity();
		$s_employee_id=$this->viewVars['s_employee_id'];
		$session = $this->request->session();
		$st_company_id = $session->read('st_company_id');
        
        if ($this->request->is('post')) {
            $debitNote = $this->DebitNotes->patchEntity($debitNote, $this->request->data);
			
			$debitNote->created_by=$s_employee_id;
			$debitNote->transaction_date=date("Y-m-d",strtotime($debitNote->transaction_date));
			$debitNote->created_on=date("Y-m-d");
			$debitNote->company_id=$st_company_id;
			
            if ($this->DebitNotes->save($debitNote)) {
				$ledger = $this->DebitNotes->Ledgers->newEntity();
				$ledger->ledger_account_id = $debitNote->party_id;
				$ledger->debit = 0;
				$ledger->credit = $debitNote->amount;
				$ledger->voucher_id = $debitNote->id;
				$ledger->voucher_source = 'Debit Note';
				$ledger->transaction_date = $debitNote->transaction_date;
				$this->DebitNotes->Ledgers->save($ledger);
				//Ledger posting for bankcash
				$ledger = $this->DebitNotes->Ledgers->newEntity();
				$ledger->ledger_account_id = $debitNote->sales_acc_id;
				$ledger->debit =  $debitNote->amount;
				$ledger->credit = 0;
				$ledger->voucher_id = $debitNote->id;
				$ledger->voucher_source = 'Debit Note';
				$ledger->transaction_date = $debitNote->transaction_date;
				$this->DebitNotes->Ledgers->save($ledger);
				$this->Flash->success(__('The Debit Notes:'.str_pad($debitNote->id, 4, '0', STR_PAD_LEFT)).' has been genereted.');
				return $this->redirect(['action' => 'view/'.$debitNote->id]);
            } else {
                $this->Flash->error(__('The debit note could not be saved. Please, try again.'));
            }
        }
		$vouchersReferences = $this->DebitNotes->VouchersReferences->get(10, [
            'contain' => ['VouchersReferencesGroups']
        ]);
		
		$where=[];
		foreach($vouchersReferences->vouchers_references_groups as $data){
			$where[]=$data->account_group_id;
		}

		$salesAccs = $this->DebitNotes->SalesAccs->find('list')->contain(['AccountSecondSubgroups'=>['AccountFirstSubgroups'=>['AccountGroups' => function ($q) use($where) {
				   return $q
						->where(['AccountGroups.id IN'=>$where]);
				}]]]);
			
		$vouchersReferences = $this->DebitNotes->VouchersReferences->get(11, [
            'contain' => ['VouchersReferencesGroups']
        ]);
		$where=[];
		foreach($vouchersReferences->vouchers_references_groups as $data){
			  $where[]=$data->account_group_id;
			//pr($where); exit;
		}

		$parties = $this->DebitNotes->Parties->find('list')->contain(['AccountSecondSubgroups'=>['AccountFirstSubgroups'=>['AccountGroups' => function ($q) use($where) {
				   return $q
						->where(['AccountGroups.id IN'=>$where]);
				}]]]);
		
		$companies = $this->DebitNotes->Companies->find('all');
        $this->set(compact('debitNote', 'salesAccs', 'parties', 'companies'));
        $this->set('_serialize', ['debitNote']);
    }

    /**
     * Edit method
     *
     * @param string|null $id Debit Note id.
     * @return \Cake\Network\Response|void Redirects on successful edit, renders view otherwise.
     * @throws \Cake\Network\Exception\NotFoundException When record not found.
     */
    public function edit($id = null)
    {
		$this->viewBuilder()->layout('index_layout');
		$s_employee_id=$this->viewVars['s_employee_id'];
		$session = $this->request->session();
		$st_company_id = $session->read('st_company_id');
        
        $debitNote = $this->DebitNotes->get($id, [
            'contain' => []
        ]);
        if ($this->request->is(['patch', 'post', 'put'])) {
            $debitNote = $this->DebitNotes->patchEntity($debitNote, $this->request->data);
			$debitNote->edited_by=$s_employee_id;
			$debitNote->transaction_date=date("Y-m-d",strtotime($debitNote->transaction_date));
			$debitNote->edited_on=date("Y-m-d");
			$debitNote->company_id=$st_company_id;
			
            if ($this->DebitNotes->save($debitNote)) {
				
				$this->DebitNotes->Ledgers->deleteAll(['voucher_id' => $debitNote->id, 'voucher_source' => 'Debit Note']);
				
				$ledger = $this->DebitNotes->Ledgers->newEntity();
				$ledger->ledger_account_id = $debitNote->party_id;
				$ledger->debit = 0;
				$ledger->credit = $debitNote->amount;
				$ledger->voucher_id = $debitNote->id;
				$ledger->voucher_source = 'Debit Note';
				$ledger->transaction_date = $debitNote->transaction_date;
				$this->DebitNotes->Ledgers->save($ledger);
				//Ledger posting for bankcash
				$ledger = $this->DebitNotes->Ledgers->newEntity();
				$ledger->ledger_account_id = $debitNote->sales_acc_id;
				$ledger->debit =  $debitNote->amount;
				$ledger->credit = 0;
				$ledger->voucher_id = $debitNote->id;
				$ledger->voucher_source = 'Debit Note';
				$ledger->transaction_date = $debitNote->transaction_date;
				$this->DebitNotes->Ledgers->save($ledger);
                $this->Flash->success(__('The debit note has been saved.'));
				return $this->redirect(['action' => 'view/'.$debitNote->id]);
            } else {
                $this->Flash->error(__('The debit note could not be saved. Please, try again.'));
            }
        }
        
		$vouchersReferences = $this->DebitNotes->VouchersReferences->get(10, [
            'contain' => ['VouchersReferencesGroups']
        ]);
		
		$where=[];
		foreach($vouchersReferences->vouchers_references_groups as $data){
			$where[]=$data->account_group_id;
		}

		$salesAccs = $this->DebitNotes->SalesAccs->find('list')->contain(['AccountSecondSubgroups'=>['AccountFirstSubgroups'=>['AccountGroups' => function ($q) use($where) {
				   return $q
						->where(['AccountGroups.id IN'=>$where]);
				}]]]);
			
		$vouchersReferences = $this->DebitNotes->VouchersReferences->get(11, [
            'contain' => ['VouchersReferencesGroups']
        ]);
		$where=[];
		foreach($vouchersReferences->vouchers_references_groups as $data){
			  $where[]=$data->account_group_id;
			//pr($where); exit;
		}

		$parties = $this->DebitNotes->Parties->find('list')->contain(['AccountSecondSubgroups'=>['AccountFirstSubgroups'=>['AccountGroups' => function ($q) use($where) {
				   return $q
						->where(['AccountGroups.id IN'=>$where]);
				}]]]);
		
		$companies = $this->DebitNotes->Companies->find('all');
        $this->set(compact('debitNote', 'salesAccs', 'parties', 'companies'));
        $this->set('_serialize', ['debitNote']);
    }

    /**
     * Delete method
     *
     * @param string|null $id Debit Note id.
     * @return \Cake\Network\Response|null Redirects to index.
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function delete($id = null)
    {
        $this->request->allowMethod(['post', 'delete']);
        $debitNote = $this->DebitNotes->get($id);
        if ($this->DebitNotes->delete($debitNote)) {
            $this->Flash->success(__('The debit note has been deleted.'));
        } else {
            $this->Flash->error(__('The debit note could not be deleted. Please, try again.'));
        }

        return $this->redirect(['action' => 'index']);
    }
}
