<?php
namespace App\Controller;

use App\Controller\AppController;

/**
 * ItemSubGroups Controller
 *
 * @property \App\Model\Table\ItemSubGroupsTable $ItemSubGroups
 */
class ItemSubGroupsController extends AppController
{

    /**
     * Index method
     *
     * @return \Cake\Network\Response|null
     */
    public function index()
    {
		$this->viewBuilder()->layout('index_layout');
		$itemSubGroup = $this->ItemSubGroups->newEntity();
        if ($this->request->is('post')) {
            $itemSubGroup = $this->ItemSubGroups->patchEntity($itemSubGroup, $this->request->data);
            if ($this->ItemSubGroups->save($itemSubGroup)) {
                $this->Flash->success(__('The item sub group has been saved.'));

                return $this->redirect(['action' => 'index']);
            } else {
                $this->Flash->error(__('The item sub group could not be saved. Please, try again.'));
            }
        }
		$itemCategories = $this->ItemSubGroups->ItemCategories->find('list');
        $itemGroups = $this->ItemSubGroups->ItemGroups->find('list');
        $this->set(compact('itemSubGroup', 'itemGroups','itemCategories'));
        $this->set('_serialize', ['itemSubGroup']);
        $this->paginate = [
            'contain' => ['ItemGroups'=>['ItemCategories']]
        ];
        $itemSubGroups = $this->paginate($this->ItemSubGroups);

        $this->set(compact('itemSubGroups'));
        $this->set('_serialize', ['itemSubGroups']);
    }

    /**
     * View method
     *
     * @param string|null $id Item Sub Group id.
     * @return \Cake\Network\Response|null
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function view($id = null)
    {
        $itemSubGroup = $this->ItemSubGroups->get($id, [
            'contain' => ['ItemGroups', 'Items']
        ]);

        $this->set('itemSubGroup', $itemSubGroup);
        $this->set('_serialize', ['itemSubGroup']);
    }

    /**
     * Add method
     *
     * @return \Cake\Network\Response|void Redirects on successful add, renders view otherwise.
     */
    public function add()
    {
        $itemSubGroup = $this->ItemSubGroups->newEntity();
        if ($this->request->is('post')) {
            $itemSubGroup = $this->ItemSubGroups->patchEntity($itemSubGroup, $this->request->data);
            if ($this->ItemSubGroups->save($itemSubGroup)) {
                $this->Flash->success(__('The item sub group has been saved.'));

                return $this->redirect(['action' => 'index']);
            } else {
                $this->Flash->error(__('The item sub group could not be saved. Please, try again.'));
            }
        }
        $itemGroups = $this->ItemSubGroups->ItemGroups->find('list', ['limit' => 200]);
        $this->set(compact('itemSubGroup', 'itemGroups'));
        $this->set('_serialize', ['itemSubGroup']);
    }

    /**
     * Edit method
     *
     * @param string|null $id Item Sub Group id.
     * @return \Cake\Network\Response|void Redirects on successful edit, renders view otherwise.
     * @throws \Cake\Network\Exception\NotFoundException When record not found.
     */
    public function edit($id = null)
    {
		$this->viewBuilder()->layout('index_layout');
        $itemSubGroup = $this->ItemSubGroups->get($id, [
            'contain' => []
        ]);
        if ($this->request->is(['patch', 'post', 'put'])) {
            $itemSubGroup = $this->ItemSubGroups->patchEntity($itemSubGroup, $this->request->data);
            if ($this->ItemSubGroups->save($itemSubGroup)) {
                $this->Flash->success(__('The item sub group has been saved.'));

                return $this->redirect(['action' => 'index']);
            } else {
                $this->Flash->error(__('The item sub group could not be saved. Please, try again.'));
            }
        }
        $itemGroups = $this->ItemSubGroups->ItemGroups->find('list', ['limit' => 200]);
        $this->set(compact('itemSubGroup', 'itemGroups'));
        $this->set('_serialize', ['itemSubGroup']);
    }

    /**
     * Delete method
     *
     * @param string|null $id Item Sub Group id.
     * @return \Cake\Network\Response|null Redirects to index.
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function delete($id = null)
    {
        $this->request->allowMethod(['post', 'delete']);
		$Itemsexists = $this->ItemSubGroups->Items->exists(['item_sub_group_id' => $id]);
		if(!$Itemsexists){
			$itemSubGroup = $this->ItemSubGroups->get($id);
			if ($this->ItemSubGroups->delete($itemSubGroup)) {
				$this->Flash->success(__('The item sub group has been deleted.'));
			} else {
				$this->Flash->error(__('The item sub group could not be deleted. Please, try again.'));
			}
		}else{
			$this->Flash->error(__('Once the item has created with item sub group, the item sub group cannot be deleted.'));
		}
        

        return $this->redirect(['action' => 'index']);
    }
	
	public function ItemSubGroupDropdown($itemGroupId = null)
    {
        $this->viewBuilder()->layout('');
		$itemSubGroups = $this->ItemSubGroups->find('list')->where(['item_group_id'=>$itemGroupId]);
		$this->set(compact('itemSubGroups'));
    }
}
