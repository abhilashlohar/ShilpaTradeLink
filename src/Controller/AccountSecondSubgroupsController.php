<?php
namespace App\Controller;

use App\Controller\AppController;

/**
 * AccountSecondSubgroups Controller
 *
 * @property \App\Model\Table\AccountSecondSubgroupsTable $AccountSecondSubgroups
 */
class AccountSecondSubgroupsController extends AppController
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
            'contain' => ['AccountFirstSubgroups']
        ];
		
		$where=[];
		$name=$this->request->query('name');
		$Account_first_subgroup=$this->request->query('Account_first_subgroup');
		//echo $Account_group; exit;
		$this->set(compact('name','Account_first_subgroup'));
		
		if(!empty($name)){
			$where['AccountSecondSubgroups.name LIKE']='%'.$name.'%';
		}
		if(!empty($Account_first_subgroup)){
			$where['AccountFirstSubgroups.name LIKE']='%'.$Account_first_subgroup.'%';
		}
        $accountSecondSubgroups = $this->paginate($this->AccountSecondSubgroups);

        $this->set(compact('accountSecondSubgroups'));
        $this->set('_serialize', ['accountSecondSubgroups']);
    }

    /**
     * View method
     *
     * @param string|null $id Account Second Subgroup id.
     * @return \Cake\Network\Response|null
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function view($id = null)
    {
		$this->viewBuilder()->layout('index_layout');
        $accountSecondSubgroup = $this->AccountSecondSubgroups->get($id, [
            'contain' => ['AccountFirstSubgroups']
        ]);

        $this->set('accountSecondSubgroup', $accountSecondSubgroup);
        $this->set('_serialize', ['accountSecondSubgroup']);
    }

    /**
     * Add method
     *
     * @return \Cake\Network\Response|void Redirects on successful add, renders view otherwise.
     */
    public function add()
    {
		$this->viewBuilder()->layout('index_layout');
        $accountSecondSubgroup = $this->AccountSecondSubgroups->newEntity();
        if ($this->request->is('post')) {
            $accountSecondSubgroup = $this->AccountSecondSubgroups->patchEntity($accountSecondSubgroup, $this->request->data);
            if ($this->AccountSecondSubgroups->save($accountSecondSubgroup)) {
                $this->Flash->success(__('The account second subgroup has been saved.'));

                return $this->redirect(['action' => 'index']);
            } else {
                $this->Flash->error(__('The account second subgroup could not be saved. Please, try again.'));
            }
        }
        $accountFirstSubgroups = $this->AccountSecondSubgroups->AccountFirstSubgroups->find('list', ['limit' => 200]);
        $this->set(compact('accountSecondSubgroup', 'accountFirstSubgroups'));
        $this->set('_serialize', ['accountSecondSubgroup']);
    }

    /**
     * Edit method
     *
     * @param string|null $id Account Second Subgroup id.
     * @return \Cake\Network\Response|void Redirects on successful edit, renders view otherwise.
     * @throws \Cake\Network\Exception\NotFoundException When record not found.
     */
    public function edit($id = null)
    {
        $accountSecondSubgroup = $this->AccountSecondSubgroups->get($id, [
            'contain' => []
        ]);
        if ($this->request->is(['patch', 'post', 'put'])) {
            $accountSecondSubgroup = $this->AccountSecondSubgroups->patchEntity($accountSecondSubgroup, $this->request->data);
            if ($this->AccountSecondSubgroups->save($accountSecondSubgroup)) {
                $this->Flash->success(__('The account second subgroup has been saved.'));

                return $this->redirect(['action' => 'index']);
            } else {
                $this->Flash->error(__('The account second subgroup could not be saved. Please, try again.'));
            }
        }
        $accountFirstSubgroups = $this->AccountSecondSubgroups->AccountFirstSubgroups->find('list', ['limit' => 200]);
        $this->set(compact('accountSecondSubgroup', 'accountFirstSubgroups'));
        $this->set('_serialize', ['accountSecondSubgroup']);
    }

    /**
     * Delete method
     *
     * @param string|null $id Account Second Subgroup id.
     * @return \Cake\Network\Response|null Redirects to index.
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function delete($id = null)
    {
        $this->request->allowMethod(['post', 'delete']);
        $accountSecondSubgroup = $this->AccountSecondSubgroups->get($id);
        if ($this->AccountSecondSubgroups->delete($accountSecondSubgroup)) {
            $this->Flash->success(__('The account second subgroup has been deleted.'));
        } else {
            $this->Flash->error(__('The account second subgroup could not be deleted. Please, try again.'));
        }

        return $this->redirect(['action' => 'index']);
    }
}
