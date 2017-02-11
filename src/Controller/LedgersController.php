<?php
namespace App\Controller;

use App\Controller\AppController;

/**
 * Ledgers Controller
 *
 * @property \App\Model\Table\LedgersTable $Ledgers
 */
class LedgersController extends AppController
{

    /**
     * Index method
     *
     * @return \Cake\Network\Response|null
     */
    public function index()
    {
		$this->viewBuilder()->layout('index_layout');
		$where=[];
		$ledger=$this->request->query('ledger');
		$From=$this->request->query('From');
		$To=$this->request->query('To');
		$this->set(compact('ledger','From','To'));
		if(!empty($ledger)){
			$where['ledger_account_id']=$ledger;
		}
		if(!empty($From)){
			$From=date("Y-m-d",strtotime($this->request->query('From')));
			$where['transaction_date >=']=$From;
		}
		if(!empty($To)){
			$To=date("Y-m-d",strtotime($this->request->query('To')));
			$where['transaction_date <=']=$To;
		}
        $this->paginate = [
            'contain' => ['LedgerAccounts']
        ];
        $ledgers = $this->paginate($this->Ledgers->find()->where($where)->order(['Ledgers.transaction_date' => 'DESC']));
		
        $ledgerAccounts = $this->Ledgers->LedgerAccounts->find('list', ['limit' => 200]);
        $this->set(compact('ledgers','ledgerAccounts'));
        $this->set('_serialize', ['ledgers']);
    }

    /**
     * View method
     *
     * @param string|null $id Ledger id.
     * @return \Cake\Network\Response|null
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function view($id = null)
    {
        $ledger = $this->Ledgers->get($id, [
            'contain' => ['LedgerAccounts']
        ]);

        $this->set('ledger', $ledger);
        $this->set('_serialize', ['ledger']);
    }

    /**
     * Add method
     *
     * @return \Cake\Network\Response|void Redirects on successful add, renders view otherwise.
     */
    public function add()
    {
		
        $ledger = $this->Ledgers->newEntity();
        if ($this->request->is('post')) {
            $ledger = $this->Ledgers->patchEntity($ledger, $this->request->data);
            if ($this->Ledgers->save($ledger)) {
                $this->Flash->success(__('The ledger has been saved.'));

                return $this->redirect(['action' => 'index']);
            } else {
                $this->Flash->error(__('The ledger could not be saved. Please, try again.'));
            }
        }
        $ledgerAccounts = $this->Ledgers->LedgerAccounts->find('list', ['limit' => 200]);
        $this->set(compact('ledger', 'ledgerAccounts'));
        $this->set('_serialize', ['ledger']);
    }

    /**
     * Edit method
     *
     * @param string|null $id Ledger id.
     * @return \Cake\Network\Response|void Redirects on successful edit, renders view otherwise.
     * @throws \Cake\Network\Exception\NotFoundException When record not found.
     */
    public function edit($id = null)
    {
        $ledger = $this->Ledgers->get($id, [
            'contain' => []
        ]);
        if ($this->request->is(['patch', 'post', 'put'])) {
            $ledger = $this->Ledgers->patchEntity($ledger, $this->request->data);
            if ($this->Ledgers->save($ledger)) {
                $this->Flash->success(__('The ledger has been saved.'));

                return $this->redirect(['action' => 'index']);
            } else {
                $this->Flash->error(__('The ledger could not be saved. Please, try again.'));
            }
        }
        $ledgerAccounts = $this->Ledgers->LedgerAccounts->find('list', ['limit' => 200]);
        $this->set(compact('ledger', 'ledgerAccounts'));
        $this->set('_serialize', ['ledger']);
    }

    /**
     * Delete method
     *
     * @param string|null $id Ledger id.
     * @return \Cake\Network\Response|null Redirects to index.
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function delete($id = null)
    {
        $this->request->allowMethod(['post', 'delete']);
        $ledger = $this->Ledgers->get($id);
        if ($this->Ledgers->delete($ledger)) {
            $this->Flash->success(__('The ledger has been deleted.'));
        } else {
            $this->Flash->error(__('The ledger could not be deleted. Please, try again.'));
        }

        return $this->redirect(['action' => 'index']);
    }
	
	public function openingBalance()
    {
		$this->viewBuilder()->layout('index_layout');
        $ledger = $this->Ledgers->newEntity();
		
			
        if ($this->request->is('post')) {
			
			$total_row=sizeof($this->request->data['reference_no']);
			$financial_year_from=strtotime($this->viewVars['s_year_from']); 
			$financial_year_to=strtotime($this->viewVars['s_year_to']); 
			
		
		   for($row=0; $row<$total_row; $row++)
		   {
				$query = $this->Ledgers->query();
				$query->insert(['transaction_date', 'ledger_account_id', 'voucher_source', 'credit', 'debit'])
					->values([
						'transaction_date' => date('Y-m-d', strtotime($this->request->data['transaction_date'])),
						'ledger_account_id' => $this->request->data['ledger_account_id'],
						'voucher_source' => $this->request->data['voucher_source'],
						'credit' => $this->request->data['credit'][$row],
						'debit' => $this->request->data['debit'][$row]
					])
					->execute();
				
				$query1 = $this->Ledgers->ReferenceDetails->query();
				$query1->insert(['reference_no', 'ledger_account_id', 'financial_year_from', 'financial_year_to', 'credit', 'debit'])
					->values([
						'financial_year_from' => $financial_year_from,
						'financial_year_to' => $financial_year_to,
						'ledger_account_id' => $this->request->data['ledger_account_id'],
						'reference_no' => $this->request->data['reference_no'][$row],
						'credit' => $this->request->data['credit'][$row],
						'debit' => $this->request->data['debit'][$row]
					])
					->execute();
		   }
        }
		
		/*
		$query = $this->Ledgers->query();
			$query->insert(['reference_no','transaction_date', 'ledger_account_id', 'voucher_source', 'credit', 'debit','amount'])
				->values([
					'transaction_date' => date('Y-m-d', strtotime($this->request->data['transaction_date'])),
					'ledger_account_id' => $this->request->data['ledger_account_id'],
					'reference_no' => $this->request->data['reference_no'][0],
					'voucher_source' => $this->request->data['voucher_source'],
					'credit' => $this->request->data['credit'][0],
					'debit' => $this->request->data['debit'][0],
					'amount' => $this->request->data['amount'][0],
				])
				->execute();
		
		*/
        $ledgerAccounts = $this->Ledgers->LedgerAccounts->find('list', ['limit' => 200]);
        $this->set(compact('ledger', 'ledgerAccounts'));
        $this->set('_serialize', ['ledger']);
    }
	public function checkReferenceNo()
    {
		$reference_no=$this->request->query['reference_no'][0];
		$financial_year_from=strtotime($this->viewVars['s_year_from']); 
		$financial_year_to=strtotime($this->viewVars['s_year_to']);
		
		$ReferenceDetails=$this->Ledgers->ReferenceDetails->find()
		->where(['reference_no' => $reference_no,'financial_year_from'=>$financial_year_from,'financial_year_to'=>$financial_year_to])
		->count();
		
		if(empty($ReferenceDetails))
		{
			$output="true";
		}
		else
		{
			$output="false";
		}
		
		$this->response->body($output);
		return $this->response;
	}
}
