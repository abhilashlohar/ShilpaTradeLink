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
				$ledgerAccount = $this->SaleTaxes->LedgerAccounts->newEntity();
				$ledgerAccount->account_second_subgroup_id = $saleTax->account_second_subgroup_id;
				$ledgerAccount->name = 'SaleTax - '.$saleTax->tax_figure;
				$ledgerAccount->source_model = 'SaleTax';
				$ledgerAccount->source_id = $saleTax->id;
				if ($this->SaleTaxes->LedgerAccounts->save($ledgerAccount))					
				{
					$id=$saleTax->id;
					
					$saleTax = $this->SaleTaxes->get($id);
					
					$saleTax->ledger_account_id=$ledgerAccount->id;
					//pr($saleTax); exit;
					$this->SaleTaxes->save($saleTax);
					$this->Flash->success(__('The sale tax has been saved.'));
					return $this->redirect(['action' => 'index']);
				} 
			}
                 else {
                $this->Flash->error(__('The sale tax could not be saved. Please, try again.'));
            }
        }
		$AccountCategories = $this->SaleTaxes->AccountCategories->find('list');
        $this->set(compact('saleTax','AccountCategories'));
        $this->set('_serialize', ['saleTax']);
		
        $saleTaxes = $this->paginate($this->SaleTaxes);

        $this->set(compact('saleTaxes'));
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
            'contain' => []
        ]);
        if ($this->request->is(['patch', 'post', 'put'])) {
            $saleTax = $this->SaleTaxes->patchEntity($saleTax, $this->request->data);
            if ($this->SaleTaxes->save($saleTax)) {
                $this->Flash->success(__('The sale tax has been saved.'));

                return $this->redirect(['action' => 'index']);
            } else {
                $this->Flash->error(__('The sale tax could not be saved. Please, try again.'));
            }
        }
        $this->set(compact('saleTax'));
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
        $saleTax = $this->SaleTaxes->get($id);
        if ($this->SaleTaxes->delete($saleTax)) {
            $this->Flash->success(__('The sale tax has been deleted.'));
        } else {
            $this->Flash->error(__('The sale tax could not be deleted. Please, try again.'));
        }

        return $this->redirect(['action' => 'index']);
    }
}
