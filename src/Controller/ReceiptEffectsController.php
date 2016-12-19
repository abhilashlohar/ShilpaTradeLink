<?php
namespace App\Controller;

use App\Controller\AppController;

/**
 * ReceiptEffects Controller
 *
 * @property \App\Model\Table\ReceiptEffectsTable $ReceiptEffects
 */
class ReceiptEffectsController extends AppController
{

    /**
     * Index method
     *
     * @return \Cake\Network\Response|null
     */
    public function index()
    {
        $this->paginate = [
            'contain' => ['ReceiptVouchers', 'Invoices']
        ];
        $receiptEffects = $this->paginate($this->ReceiptEffects);

        $this->set(compact('receiptEffects'));
        $this->set('_serialize', ['receiptEffects']);
    }

    /**
     * View method
     *
     * @param string|null $id Receipt Effect id.
     * @return \Cake\Network\Response|null
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function view($id = null)
    {
        $receiptEffect = $this->ReceiptEffects->get($id, [
            'contain' => ['ReceiptVouchers', 'Invoices']
        ]);

        $this->set('receiptEffect', $receiptEffect);
        $this->set('_serialize', ['receiptEffect']);
    }

    /**
     * Add method
     *
     * @return \Cake\Network\Response|void Redirects on successful add, renders view otherwise.
     */
    public function add()
    {
        $receiptEffect = $this->ReceiptEffects->newEntity();
        if ($this->request->is('post')) {
            $receiptEffect = $this->ReceiptEffects->patchEntity($receiptEffect, $this->request->data);
            if ($this->ReceiptEffects->save($receiptEffect)) {
                $this->Flash->success(__('The receipt effect has been saved.'));

                return $this->redirect(['action' => 'index']);
            } else {
                $this->Flash->error(__('The receipt effect could not be saved. Please, try again.'));
            }
        }
        $receiptVouchers = $this->ReceiptEffects->ReceiptVouchers->find('list', ['limit' => 200]);
        $invoices = $this->ReceiptEffects->Invoices->find('list', ['limit' => 200]);
        $this->set(compact('receiptEffect', 'receiptVouchers', 'invoices'));
        $this->set('_serialize', ['receiptEffect']);
    }

    /**
     * Edit method
     *
     * @param string|null $id Receipt Effect id.
     * @return \Cake\Network\Response|void Redirects on successful edit, renders view otherwise.
     * @throws \Cake\Network\Exception\NotFoundException When record not found.
     */
    public function edit($id = null)
    {
        $receiptEffect = $this->ReceiptEffects->get($id, [
            'contain' => []
        ]);
        if ($this->request->is(['patch', 'post', 'put'])) {
            $receiptEffect = $this->ReceiptEffects->patchEntity($receiptEffect, $this->request->data);
            if ($this->ReceiptEffects->save($receiptEffect)) {
                $this->Flash->success(__('The receipt effect has been saved.'));

                return $this->redirect(['action' => 'index']);
            } else {
                $this->Flash->error(__('The receipt effect could not be saved. Please, try again.'));
            }
        }
        $receiptVouchers = $this->ReceiptEffects->ReceiptVouchers->find('list', ['limit' => 200]);
        $invoices = $this->ReceiptEffects->Invoices->find('list', ['limit' => 200]);
        $this->set(compact('receiptEffect', 'receiptVouchers', 'invoices'));
        $this->set('_serialize', ['receiptEffect']);
    }

    /**
     * Delete method
     *
     * @param string|null $id Receipt Effect id.
     * @return \Cake\Network\Response|null Redirects to index.
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function delete($id = null)
    {
        $this->request->allowMethod(['post', 'delete']);
        $receiptEffect = $this->ReceiptEffects->get($id);
        if ($this->ReceiptEffects->delete($receiptEffect)) {
            $this->Flash->success(__('The receipt effect has been deleted.'));
        } else {
            $this->Flash->error(__('The receipt effect could not be deleted. Please, try again.'));
        }

        return $this->redirect(['action' => 'index']);
    }
}
