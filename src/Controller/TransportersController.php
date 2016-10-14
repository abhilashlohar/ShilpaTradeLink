<?php
namespace App\Controller;

use App\Controller\AppController;

/**
 * Transporters Controller
 *
 * @property \App\Model\Table\TransportersTable $Transporters
 */
class TransportersController extends AppController
{

    /**
     * Index method
     *
     * @return \Cake\Network\Response|null
     */
    public function index()
    {
		$this->viewBuilder()->layout('index_layout');
		$transporter = $this->Transporters->newEntity();
		if ($this->request->is('post')) {
            $transporter = $this->Transporters->patchEntity($transporter, $this->request->data);
            if ($this->Transporters->save($transporter)) {
                $this->Flash->success(__('The transporter has been saved.'));

                return $this->redirect(['action' => 'index']);
            } else {
                $this->Flash->error(__('The transporter could not be saved. Please, try again.'));
            }
        }
        $this->set(compact('transporter'));
        $this->set('_serialize', ['transporter']);
		
        $transporters = $this->paginate($this->Transporters->find()->where(['deleted'=>'no']));

        $this->set(compact('transporters'));
        $this->set('_serialize', ['transporters']);
    }

    /**
     * View method
     *
     * @param string|null $id Transporter id.
     * @return \Cake\Network\Response|null
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function view($id = null)
    {
        $transporter = $this->Transporters->get($id, [
            'contain' => []
        ]);

        $this->set('transporter', $transporter);
        $this->set('_serialize', ['transporter']);
    }

    /**
     * Add method
     *
     * @return \Cake\Network\Response|void Redirects on successful add, renders view otherwise.
     */
    public function add()
    {
        $transporter = $this->Transporters->newEntity();
        if ($this->request->is('post')) {
            $transporter = $this->Transporters->patchEntity($transporter, $this->request->data);
            if ($this->Transporters->save($transporter)) {
                $this->Flash->success(__('The transporter has been saved.'));

                return $this->redirect(['action' => 'index']);
            } else {
                $this->Flash->error(__('The transporter could not be saved. Please, try again.'));
            }
        }
        $this->set(compact('transporter'));
        $this->set('_serialize', ['transporter']);
    }

    /**
     * Edit method
     *
     * @param string|null $id Transporter id.
     * @return \Cake\Network\Response|void Redirects on successful edit, renders view otherwise.
     * @throws \Cake\Network\Exception\NotFoundException When record not found.
     */
    public function edit($id = null)
    {
		$this->viewBuilder()->layout('index_layout');
        $transporter = $this->Transporters->get($id, [
            'contain' => []
        ]);
        if ($this->request->is(['patch', 'post', 'put'])) {
            $transporter = $this->Transporters->patchEntity($transporter, $this->request->data);
            if ($this->Transporters->save($transporter)) {
                $this->Flash->success(__('The transporter has been saved.'));

                return $this->redirect(['action' => 'index']);
            } else {
                $this->Flash->error(__('The transporter could not be saved. Please, try again.'));
            }
        }
        $this->set(compact('transporter'));
        $this->set('_serialize', ['transporter']);
    }

    /**
     * Delete method
     *
     * @param string|null $id Transporter id.
     * @return \Cake\Network\Response|null Redirects to index.
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function delete($id = null)
    {
        $this->request->allowMethod(['post', 'delete']);
        $transporter = $this->Transporters->get($id);
		$transporter->deleted='yes';
        if ($this->Transporters->save($transporter)) {
            $this->Flash->success(__('The transporter has been deleted.'));
        } else {
            $this->Flash->error(__('The transporter could not be deleted. Please, try again.'));
        }

        return $this->redirect(['action' => 'index']);
    }
}
