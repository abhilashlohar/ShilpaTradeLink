<?php
namespace App\Controller;

use App\Controller\AppController;

/**
 * CreditNotes Controller
 *
 * @property \App\Model\Table\CreditNotesTable $CreditNotes
 */
class CreditNotesController extends AppController
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
            'contain' => ['PurchaseAccs', 'Parties', 'Companies']
        ];
        $creditNotes = $this->paginate($this->CreditNotes);

        $this->set(compact('creditNotes'));
        $this->set('_serialize', ['creditNotes']);
    }

    /**
     * View method
     *
     * @param string|null $id Credit Note id.
     * @return \Cake\Network\Response|null
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function view($id = null)
    {
		$this->viewBuilder()->layout('index_layout');
        $creditNote = $this->CreditNotes->get($id, [
            'contain' => ['PurchaseAccs', 'Parties', 'Companies']
        ]);

        $this->set('creditNote', $creditNote);
        $this->set('_serialize', ['creditNote']);
    }

    /**
     * Add method
     *
     * @return \Cake\Network\Response|void Redirects on successful add, renders view otherwise.
     */
    public function add()
    {
		
		$this->viewBuilder()->layout('index_layout');
        $creditNote = $this->CreditNotes->newEntity();
		$s_employee_id=$this->viewVars['s_employee_id'];
		$session = $this->request->session();
		$st_company_id = $session->read('st_company_id');
        
		 if ($this->request->is('post')) {
			$creditNote = $this->CreditNotes->patchEntity($creditNote, $this->request->data);
            $creditNote->created_by=$s_employee_id;
			$creditNote->transaction_date=date("Y-m-d",strtotime($creditNote->transaction_date));
			$creditNote->created_on=date("Y-m-d");
			$creditNote->company_id=$st_company_id;
			
			if ($this->CreditNotes->save($creditNote)) {
				$ledger = $this->CreditNotes->Ledgers->newEntity();
				$ledger->ledger_account_id = $creditNote->purchase_acc_id;
				$ledger->debit = 0;
				$ledger->credit = $creditNote->amount;
				$ledger->voucher_id = $creditNote->id;
				$ledger->voucher_source = 'Credit Note';
				$ledger->transaction_date = $creditNote->transaction_date;
				$this->CreditNotes->Ledgers->save($ledger);
				//Ledger posting for bankcash
				$ledger = $this->CreditNotes->Ledgers->newEntity();
				$ledger->ledger_account_id = $creditNote->party_id;
				$ledger->debit =  $creditNote->amount;
				$ledger->credit = 0;
				$ledger->voucher_id = $creditNote->id;
				$ledger->voucher_source = 'Credit Note';
				$ledger->transaction_date = $creditNote->transaction_date;
				$this->CreditNotes->Ledgers->save($ledger);
				
				$this->Flash->success(__('The Credit Notes:'.str_pad($creditNote->id, 4, '0', STR_PAD_LEFT)).' has been genereted.');
				return $this->redirect(['action' => 'view/'.$creditNote->id]);
            } else {
                $this->Flash->error(__('The credit note could not be saved. Please, try again.'));
            }
        }
       $vouchersReferences = $this->CreditNotes->VouchersReferences->get(12, [
            'contain' => ['VouchersReferencesGroups']
        ]);
		
		$where=[];
		foreach($vouchersReferences->vouchers_references_groups as $data){
			$where[]=$data->account_group_id;
		}

		$purchaseAccs = $this->CreditNotes->PurchaseAccs->find('list')->contain(['AccountSecondSubgroups'=>['AccountFirstSubgroups'=>['AccountGroups' => function ($q) use($where) {
				   return $q
						->where(['AccountGroups.id IN'=>$where]);
				}]]]);
			
		$vouchersReferences = $this->CreditNotes->VouchersReferences->get(13, [
            'contain' => ['VouchersReferencesGroups']
        ]);
		$where=[];
		foreach($vouchersReferences->vouchers_references_groups as $data){
			  $where[]=$data->account_group_id;
			//pr($where); exit;
		}

		$parties = $this->CreditNotes->Parties->find('list')->contain(['AccountSecondSubgroups'=>['AccountFirstSubgroups'=>['AccountGroups' => function ($q) use($where) {
				   return $q
						->where(['AccountGroups.id IN'=>$where]);
				}]]]);
		
		$companies = $this->CreditNotes->Companies->find('all');
        $this->set(compact('creditNote', 'purchaseAccs', 'parties', 'companies'));
        $this->set('_serialize', ['debitNote']);
 }

    /**
     * Edit method
     *
     * @param string|null $id Credit Note id.
     * @return \Cake\Network\Response|void Redirects on successful edit, renders view otherwise.
     * @throws \Cake\Network\Exception\NotFoundException When record not found.
     */
    public function edit($id = null)
    {
		
		$this->viewBuilder()->layout('index_layout');
		$s_employee_id=$this->viewVars['s_employee_id'];
		$session = $this->request->session();
		$st_company_id = $session->read('st_company_id');
        
        $creditNote = $this->CreditNotes->get($id, [
            'contain' => []
        ]);
        if ($this->request->is(['patch', 'post', 'put'])) {
            $creditNote = $this->CreditNotes->patchEntity($creditNote, $this->request->data);
			$creditNote->edited_by=$s_employee_id;
			$creditNote->transaction_date=date("Y-m-d",strtotime($creditNote->transaction_date));
			$creditNote->edited_on=date("Y-m-d");
			$creditNote->company_id=$st_company_id;
			
            if ($this->CreditNotes->save($creditNote)) {
				
				$this->CreditNotes->Ledgers->deleteAll(['voucher_id' => $creditNote->id, 'voucher_source' => 'Credit Note']);
				
				$ledger = $this->CreditNotes->Ledgers->newEntity();
				$ledger->ledger_account_id = $creditNote->purchase_acc_id;
				$ledger->debit = 0;
				$ledger->credit = $creditNote->amount;
				$ledger->voucher_id = $creditNote->id;
				$ledger->voucher_source = 'Credit Note';
				$ledger->transaction_date = $creditNote->transaction_date;
				$this->CreditNotes->Ledgers->save($ledger);
				//Ledger posting for bankcash
				$ledger = $this->CreditNotes->Ledgers->newEntity();
				$ledger->ledger_account_id = $creditNote->party_id;
				$ledger->debit =  $creditNote->amount;
				$ledger->credit = 0;
				$ledger->voucher_id = $creditNote->id;
				$ledger->voucher_source = 'Credit Note';
				$ledger->transaction_date = $creditNote->transaction_date;
				$this->CreditNotes->Ledgers->save($ledger);
				
                $this->Flash->success(__('The credit note has been saved.'));
				return $this->redirect(['action' => 'view/'.$creditNote->id]);
            } else {
                $this->Flash->error(__('The credit note could not be saved. Please, try again.'));
            }
        } $vouchersReferences = $this->CreditNotes->VouchersReferences->get(12, [
            'contain' => ['VouchersReferencesGroups']
        ]);
		
		$where=[];
		foreach($vouchersReferences->vouchers_references_groups as $data){
			$where[]=$data->account_group_id;
		}

		$purchaseAccs = $this->CreditNotes->PurchaseAccs->find('list')->contain(['AccountSecondSubgroups'=>['AccountFirstSubgroups'=>['AccountGroups' => function ($q) use($where) {
				   return $q
						->where(['AccountGroups.id IN'=>$where]);
				}]]]);
			
		$vouchersReferences = $this->CreditNotes->VouchersReferences->get(13, [
            'contain' => ['VouchersReferencesGroups']
        ]);
		$where=[];
		foreach($vouchersReferences->vouchers_references_groups as $data){
			  $where[]=$data->account_group_id;
			//pr($where); exit;
		}

		$parties = $this->CreditNotes->Parties->find('list')->contain(['AccountSecondSubgroups'=>['AccountFirstSubgroups'=>['AccountGroups' => function ($q) use($where) {
				   return $q
						->where(['AccountGroups.id IN'=>$where]);
				}]]]);
		
		$companies = $this->CreditNotes->Companies->find('all');
        $this->set(compact('creditNote', 'purchaseAccs', 'parties', 'companies'));
        $this->set('_serialize', ['debitNote']);
 
    }

    /**
     * Delete method
     *
     * @param string|null $id Credit Note id.
     * @return \Cake\Network\Response|null Redirects to index.
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function delete($id = null)
    {
        $this->request->allowMethod(['post', 'delete']);
        $creditNote = $this->CreditNotes->get($id);
        if ($this->CreditNotes->delete($creditNote)) {
            $this->Flash->success(__('The credit note has been deleted.'));
        } else {
            $this->Flash->error(__('The credit note could not be deleted. Please, try again.'));
        }

        return $this->redirect(['action' => 'index']);
    }
}
