<?php
namespace App\Controller;

use App\Controller\AppController;

/**
 * ItemLedgers Controller
 *
 * @property \App\Model\Table\ItemLedgersTable $ItemLedgers
 */
class ItemLedgersController extends AppController
{

    /**
     * Index method
     *
     * @return \Cake\Network\Response|null
     */
    public function index($item_id=null)
    {
		$this->viewBuilder()->layout('index_layout');
        $this->paginate = [
            'contain' => ['Items']
        ];
        $itemLedgers = $this->paginate($this->ItemLedgers->find()->where(['item_id'=>$item_id])->order(['processed_on'=>'DESC']));

        $this->set(compact('itemLedgers'));
        $this->set('_serialize', ['itemLedgers']);
    }

    /**
     * View method
     *
     * @param string|null $id Item Ledger id.
     * @return \Cake\Network\Response|null
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function view($id = null)
    {
        $itemLedger = $this->ItemLedgers->get($id, [
            'contain' => ['Items', 'Sources', 'Companies']
        ]);

        $this->set('itemLedger', $itemLedger);
        $this->set('_serialize', ['itemLedger']);
    }

    /**
     * Add method
     *
     * @return \Cake\Network\Response|void Redirects on successful add, renders view otherwise.
     */
    public function add()
    {
        $itemLedger = $this->ItemLedgers->newEntity();
        if ($this->request->is('post')) {
            $itemLedger = $this->ItemLedgers->patchEntity($itemLedger, $this->request->data);
            if ($this->ItemLedgers->save($itemLedger)) {
                $this->Flash->success(__('The item ledger has been saved.'));

                return $this->redirect(['action' => 'index']);
            } else {
                $this->Flash->error(__('The item ledger could not be saved. Please, try again.'));
            }
        }
        $items = $this->ItemLedgers->Items->find('list', ['limit' => 200]);
        $sources = $this->ItemLedgers->Sources->find('list', ['limit' => 200]);
        $companies = $this->ItemLedgers->Companies->find('list', ['limit' => 200]);
        $this->set(compact('itemLedger', 'items', 'sources', 'companies'));
        $this->set('_serialize', ['itemLedger']);
    }

    /**
     * Edit method
     *
     * @param string|null $id Item Ledger id.
     * @return \Cake\Network\Response|void Redirects on successful edit, renders view otherwise.
     * @throws \Cake\Network\Exception\NotFoundException When record not found.
     */
    public function edit($id = null)
    {
        $itemLedger = $this->ItemLedgers->get($id, [
            'contain' => []
        ]);
        if ($this->request->is(['patch', 'post', 'put'])) {
            $itemLedger = $this->ItemLedgers->patchEntity($itemLedger, $this->request->data);
            if ($this->ItemLedgers->save($itemLedger)) {
                $this->Flash->success(__('The item ledger has been saved.'));

                return $this->redirect(['action' => 'index']);
            } else {
                $this->Flash->error(__('The item ledger could not be saved. Please, try again.'));
            }
        }
        $items = $this->ItemLedgers->Items->find('list', ['limit' => 200]);
        $sources = $this->ItemLedgers->Sources->find('list', ['limit' => 200]);
        $companies = $this->ItemLedgers->Companies->find('list', ['limit' => 200]);
        $this->set(compact('itemLedger', 'items', 'sources', 'companies'));
        $this->set('_serialize', ['itemLedger']);
    }

    /**
     * Delete method
     *
     * @param string|null $id Item Ledger id.
     * @return \Cake\Network\Response|null Redirects to index.
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function delete($id = null)
    {
        $this->request->allowMethod(['post', 'delete']);
        $itemLedger = $this->ItemLedgers->get($id);
        if ($this->ItemLedgers->delete($itemLedger)) {
            $this->Flash->success(__('The item ledger has been deleted.'));
        } else {
            $this->Flash->error(__('The item ledger could not be deleted. Please, try again.'));
        }

        return $this->redirect(['action' => 'index']);
    }

    public function stockReport(){
		$this->viewBuilder()->layout('index_layout');
        $session = $this->request->session();
        $st_company_id = $session->read('st_company_id');

       
		$query = $this->ItemLedgers->find();
		$totalInCase = $query->newExpr()
			->addCase(
				$query->newExpr()->add(['in_out' => 'In']),
				$query->newExpr()->add(['quantity']),
				'integer'
			);
		$totalOutCase = $query->newExpr()
			->addCase(
				$query->newExpr()->add(['in_out' => 'Out']),
				$query->newExpr()->add(['quantity']),
				'integer'
			);

		$query->select([
			'total_in' => $query->func()->sum($totalInCase),
			'total_out' => $query->func()->sum($totalOutCase),'id','item_id'
		])
		->group('item_id')
		->autoFields(true)
		->contain(['Items']);
        $itemLedgers = $this->paginate($query);
		
        $this->set(compact('itemLedgers'));
    }
}
