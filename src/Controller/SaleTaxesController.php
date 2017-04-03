<?php
namespace App\Controller;

use App\Controller\AppController;

/**
 * SaleTaxes Controller
 *
 * @property \App\Model\Table\SaleTaxesTable $SaleTaxes
 */
class SaleTaxesController extends AppController
{

    /**
     * Index method
     *
     * @return \Cake\Network\Response|null
     */
    public function index()
    {
		$this->viewBuilder()->layout('index_layout');
		
		$saleTax = $this->SaleTaxes->newEntity();
        if ($this->request->is('post')) {
            $saleTax = $this->SaleTaxes->patchEntity($saleTax, $this->request->data);
			
            if ($this->SaleTaxes->save($saleTax)) {
				
				foreach($saleTax->companies as $company){
					$LedgerAccount = $this->SaleTaxes->LedgerAccounts->newEntity();
					$LedgerAccount->account_second_subgroup_id=$saleTax->account_second_subgroup_id;
					$LedgerAccount->name=$saleTax->tax_figure;
					$LedgerAccount->alias='';
					$LedgerAccount->source_model='SaleTaxes';
					$LedgerAccount->source_id=$saleTax->id;
					$LedgerAccount->bill_to_bill_account='';
					$LedgerAccount->company_id=$company->id;
					$this->SaleTaxes->LedgerAccounts->save($LedgerAccount);
				}
			
				$this->Flash->success(__('The sale tax has been saved.'));
				return $this->redirect(['action' => 'index']);
			}else {
                $this->Flash->error(__('The sale tax could not be saved. Please, try again.'));
            }
        }
		$AccountCategories = $this->SaleTaxes->AccountCategories->find('list');
		$Companies = $this->SaleTaxes->Companies->find('list');
        $this->set(compact('saleTax','AccountCategories'));
        $this->set('_serialize', ['saleTax']);
		
        $saleTaxes = $this->paginate($this->SaleTaxes);

        $this->set(compact('saleTaxes','Companies'));
        $this->set('_serialize', ['saleTaxes']);
    }

    /**
     * View method
     *
     * @param string|null $id Sale Tax id.
     * @return \Cake\Network\Response|null
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function view($id = null)
    {
        $saleTax = $this->SaleTaxes->get($id, [
            'contain' => []
        ]);

        $this->set('saleTax', $saleTax);
        $this->set('_serialize', ['saleTax']);
    }

    /**
     * Add method
     *
     * @return \Cake\Network\Response|void Redirects on successful add, renders view otherwise.
     */
    public function add()
    {
        $saleTax = $this->SaleTaxes->newEntity();
        if ($this->request->is('post')) {
            $saleTax = $this->SaleTaxes->patchEntity($saleTax, $this->request->data);
            
			if ($this->SaleTaxes->save($saleTax)) 
			{
				
				$ledgerAccount = $this->SaleTaxes->LedgerAccounts->newEntity();
				$ledgerAccount->account_second_subgroup_id = $saleTax->account_second_subgroup_id;
				$ledgerAccount->name = 'SaleTax->'.$saleTax->tax_figure;
				$ledgerAccount->source_model = 'SaleTax';
				$ledgerAccount->source_id = $saleTax->id;
				if ($this->SaleTaxes->LedgerAccounts->save($ledgerAccount)) 
				{
					$this->Flash->success(__('The sale tax has been saved.'));
					return $this->redirect(['action' => 'index']);
				} 
			}else 
				{
					$this->Flash->error(__('The sale tax could not be saved. Please, try again.'));
				}
        }
		
		$AccountCategories = $this->SaleTaxes->AccountCategories->find('list');
        $this->set(compact('saleTax','AccountCategories'));
        $this->set('_serialize', ['saleTax']);
    }

    /**
     * Edit method
     *
     * @param string|null $id Sale Tax id.
     * @return \Cake\Network\Response|void Redirects on successful edit, renders view otherwise.
     * @throws \Cake\Network\Exception\NotFoundException When record not found.
     */
    public function edit($id = null)
    {
		$this->viewBuilder()->layout('index_layout');
		
        $saleTax = $this->SaleTaxes->get($id, [
            'contain' => ['Companies']
        ]);
        if ($this->request->is(['patch', 'post', 'put'])) {
            $saleTax = $this->SaleTaxes->patchEntity($saleTax, $this->request->data);
			
            if ($this->SaleTaxes->save($saleTax)) {
					$query = $this->SaleTaxes->LedgerAccounts->query();
					$query->update()
						->set(['account_second_subgroup_id' => $saleTax->account_second_subgroup_id])
						->where(['id' => $saleTax->ledger_account_id])
						->execute();
                $this->Flash->success(__('The sale tax has been saved.'));

                return $this->redirect(['action' => 'index']);
            } else {
                $this->Flash->error(__('The sale tax could not be saved. Please, try again.'));
            }
        }
		
		
		$AccountCategories = $this->SaleTaxes->AccountCategories->find('list');
		$AccountGroups = $this->SaleTaxes->AccountGroups->find('list');
		$AccountFirstSubgroups = $this->SaleTaxes->AccountFirstSubgroups->find('list');
		$AccountSecondSubgroups = $this->SaleTaxes->AccountSecondSubgroups->find('list');
		
		
		
        $this->set(compact('saleTax','AccountCategories','AccountGroups','AccountFirstSubgroups','AccountSecondSubgroups','Companies'));
        $this->set('_serialize', ['saleTax']);
    }

    /**
     * Delete method
     *
     * @param string|null $id Sale Tax id.
     * @return \Cake\Network\Response|null Redirects to index.
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function delete($id = null)
    {
		$this->request->allowMethod(['post', 'delete']);
		$SaleTaxquoteexists = $this->SaleTaxes->SalesOrderRows->exists(['sale_tax_id' => $id]);
		$SaleTaxinvExists =  $this->SaleTaxes->Invoices->exists(['sale_tax_id' => $id]);
		if((!$SaleTaxquoteexists) AND (!$SaleTaxinvExists)){
			$saleTax = $this->SaleTaxes->get($id);
			if ($this->SaleTaxes->delete($saleTax)) {
            $this->Flash->success(__('The sale tax has been deleted.'));
			} else {
            $this->Flash->error(__('The sale tax could not be deleted. Please, try again.'));
			}
		} else{
			$this->Flash->error(__('Once the sales order or invoice has generated with sale tax, the Sale tax cannot be deleted.'));
		}
         return $this->redirect(['action' => 'index']);
    }
}