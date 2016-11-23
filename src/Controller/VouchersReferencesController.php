<?php
namespace App\Controller;

use App\Controller\AppController;

/**
 * VouchersReferences Controller
 *
 * @property \App\Model\Table\VouchersReferencesTable $VouchersReferences
 */
class VouchersReferencesController extends AppController
{

    /**
     * Index method
     *
     * @return \Cake\Network\Response|null
     */
    public function index()
    {
		
		$this->viewBuilder()->layout('index_layout');
        $vouchersReferences = $this->paginate($this->VouchersReferences->find()->contain(['VouchersReferencesGroups'=>['AccountGroups']]));
		
        $this->set(compact('vouchersReferences'));
        $this->set('_serialize', ['vouchersReferences']);
    }

    /**
     * View method
     *
     * @param string|null $id Vouchers Reference id.
     * @return \Cake\Network\Response|null
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function view($id = null)
    {
		
		$this->viewBuilder()->layout('index_layout');
        $vouchersReference = $this->VouchersReferences->get($id, [
            'contain' => ['VouchersReferencesGroups']
        ]);

        $this->set('vouchersReference', $vouchersReference);
        $this->set('_serialize', ['vouchersReference']);
    }

    /**
     * Add method
     *
     * @return \Cake\Network\Response|void Redirects on successful add, renders view otherwise.
     */
    public function add()
    {
		$this->viewBuilder()->layout('index_layout');
        $vouchersReference = $this->VouchersReferences->newEntity();
        if ($this->request->is('post')) {
            $vouchersReference = $this->VouchersReferences->patchEntity($vouchersReference, $this->request->data);
			
            if ($this->VouchersReferences->save($vouchersReference)) {
                $this->Flash->success(__('The vouchers reference has been saved.'));

                return $this->redirect(['action' => 'index']);
            } else {
                $this->Flash->error(__('The vouchers reference could not be saved. Please, try again.'));
            }
        }
        $this->set(compact('vouchersReference'));
        $this->set('_serialize', ['vouchersReference']);
    }

    /**
     * Edit method
     *
     * @param string|null $id Vouchers Reference id.
     * @return \Cake\Network\Response|void Redirects on successful edit, renders view otherwise.
     * @throws \Cake\Network\Exception\NotFoundException When record not found.
     */
    public function edit($id = null)
    {
		
		$this->viewBuilder()->layout('index_layout');
        $vouchersReference = $this->VouchersReferences->get($id, [
            'contain' => ['AccountGroups']
        ]);
        if ($this->request->is(['patch', 'post', 'put'])) {
            $vouchersReference = $this->VouchersReferences->patchEntity($vouchersReference, $this->request->data);
            if ($this->VouchersReferences->save($vouchersReference)) {
                $this->Flash->success(__('The vouchers reference has been saved.'));

                return $this->redirect(['action' => 'index']);
            } else {
                $this->Flash->error(__('The vouchers reference could not be saved. Please, try again.'));
            }
        }
		$AccountGroups = $this->VouchersReferences->AccountGroups->find('list');
        $this->set(compact('vouchersReference','AccountGroups'));
        $this->set('_serialize', ['vouchersReference']);
    }

    /**
     * Delete method
     *
     * @param string|null $id Vouchers Reference id.
     * @return \Cake\Network\Response|null Redirects to index.
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function delete($id = null)
    {
        $this->request->allowMethod(['post', 'delete']);
        $vouchersReference = $this->VouchersReferences->get($id);
        if ($this->VouchersReferences->delete($vouchersReference)) {
            $this->Flash->success(__('The vouchers reference has been deleted.'));
        } else {
            $this->Flash->error(__('The vouchers reference could not be deleted. Please, try again.'));
        }

        return $this->redirect(['action' => 'index']);
    }
}
