<?php
namespace App\Controller;

use App\Controller\AppController;

/**
 * Vendors Controller
 *
 * @property \App\Model\Table\VendorsTable $Vendors
 */
class VendorsController extends AppController
{

    /**
     * Index method
     *
     * @return \Cake\Network\Response|null
     */
    public function index()
    {
		$this->viewBuilder()->layout('index_layout');
        $vendors = $this->paginate($this->Vendors);

        $this->set(compact('vendors'));
        $this->set('_serialize', ['vendors']);
    }

    /**
     * View method
     *
     * @param string|null $id Vendor id.
     * @return \Cake\Network\Response|null
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function view($id = null)
    {
        $vendor = $this->Vendors->get($id, [
            'contain' => []
        ]);

        $this->set('vendor', $vendor);
        $this->set('_serialize', ['vendor']);
    }

    /**
     * Add method
     *
     * @return \Cake\Network\Response|void Redirects on successful add, renders view otherwise.
     */
    public function add()
    {
		$this->viewBuilder()->layout('index_layout');
        $vendor = $this->Vendors->newEntity();
        if ($this->request->is('post')) {
            $vendor = $this->Vendors->patchEntity($vendor, $this->request->data);
			//pr($vendor); exit;	
			
            if ($this->Vendors->save($vendor))
			{
				$ledgerAccount = $this->Vendors->LedgerAccounts->newEntity();
				$ledgerAccount->account_second_subgroup_id = $vendor->account_second_subgroup_id;
				$ledgerAccount->name = $vendor->company_name;
				$ledgerAccount->source_model = 'Vendors';
				$ledgerAccount->source_id = $vendor->id;
				
				if ($this->Vendors->LedgerAccounts->save($ledgerAccount)) 
				{
					$id=$vendor->id;
					$vendor = $this->Vendors->get($id);
					$vendor->ledger_account_id=$ledgerAccount->id;
					$this->Vendors->save($vendor);
					$this->Flash->success(__('The vendor has been saved.'));
					return $this->redirect(['action' => 'index']);
				}
            } else 
				{
					$this->Flash->error(__('The vendor could not be saved. Please, try again.'));
				}
        }
		$ItemGroups = $this->Vendors->ItemGroups->find('list');
		$AccountCategories = $this->Vendors->AccountCategories->find('list');
        
        $this->set(compact('vendor','ItemGroups','AccountCategories'));
        $this->set('_serialize', ['vendor']);
    }

    /**
     * Edit method
     *
     * @param string|null $id Vendor id.
     * @return \Cake\Network\Response|void Redirects on successful edit, renders view otherwise.
     * @throws \Cake\Network\Exception\NotFoundException When record not found.
     */
    public function edit($id = null)
    {
		$this->viewBuilder()->layout('index_layout');
        $vendor = $this->Vendors->get($id, [
            'contain' => ['VendorContactPersons']
        ]);
        if ($this->request->is(['patch', 'post', 'put'])) {
            $vendor = $this->Vendors->patchEntity($vendor, $this->request->data);
            if ($this->Vendors->save($vendor)) {
				$query = $this->Vendors->LedgerAccounts->query();
					$query->update()
						->set(['account_second_subgroup_id' => $vendor->account_second_subgroup_id])
						->where(['id' => $vendor->ledger_account_id])
						->execute();
                $this->Flash->success(__('The vendor has been saved.'));
				return $this->redirect(['action' => 'index']);
            } else {
                $this->Flash->error(__('The vendor could not be saved. Please, try again.'));
            }
        }
		$ItemGroups = $this->Vendors->ItemGroups->find('list');
		$AccountCategories = $this->Vendors->AccountCategories->find('list');
		$AccountGroups = $this->Vendors->AccountGroups->find('list');
		$AccountFirstSubgroups = $this->Vendors->AccountFirstSubgroups->find('list');
		$AccountSecondSubgroups = $this->Vendors->AccountSecondSubgroups->find('list');
		
        $this->set(compact('vendor','ItemGroups','AccountCategories','AccountGroups','AccountFirstSubgroups','AccountSecondSubgroups'));
        $this->set('_serialize', ['vendor']);
    }

    /**
     * Delete method
     *
     * @param string|null $id Vendor id.
     * @return \Cake\Network\Response|null Redirects to index.
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function delete($id = null)
    {
        $this->request->allowMethod(['post', 'delete']);
        $vendor = $this->Vendors->get($id);
        if ($this->Vendors->delete($vendor)) {
            $this->Flash->success(__('The vendor has been deleted.'));
        } else {
            $this->Flash->error(__('The vendor could not be deleted. Please, try again.'));
        }

        return $this->redirect(['action' => 'index']);
    }
}
