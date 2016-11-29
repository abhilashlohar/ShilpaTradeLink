<?php
namespace App\Controller;

use App\Controller\AppController;

/**
 * PettyCashReceiptVouchers Controller
 *
 * @property \App\Model\Table\PettyCashReceiptVouchersTable $PettyCashReceiptVouchers
 */
class PettyCashReceiptVouchersController extends AppController
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
            'contain' => ['ReceivedFroms', 'BankCashes']
        ];
        $pettyCashReceiptVouchers = $this->paginate($this->PettyCashReceiptVouchers);

        $this->set(compact('pettyCashReceiptVouchers'));
        $this->set('_serialize', ['pettyCashReceiptVouchers']);
    }

    /**
     * View method
     *
     * @param string|null $id Petty Cash Receipt Voucher id.
     * @return \Cake\Network\Response|null
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function view($id = null)
    {
        $pettyCashReceiptVoucher = $this->PettyCashReceiptVouchers->get($id, [
            'contain' => ['ReceivedFroms', 'BankCashes']
        ]);

        $this->set('pettyCashReceiptVoucher', $pettyCashReceiptVoucher);
        $this->set('_serialize', ['pettyCashReceiptVoucher']);
    }

    /**
     * Add method
     *
     * @return \Cake\Network\Response|void Redirects on successful add, renders view otherwise.
     */
    public function add()
    {
		$this->viewBuilder()->layout('index_layout');
        $pettyCashReceiptVoucher = $this->PettyCashReceiptVouchers->newEntity();
        if ($this->request->is('post')) {
            $pettyCashReceiptVoucher = $this->PettyCashReceiptVouchers->patchEntity($pettyCashReceiptVoucher, $this->request->data);
            if ($this->PettyCashReceiptVouchers->save($pettyCashReceiptVoucher)) {
                $this->Flash->success(__('The petty cash receipt voucher has been saved.'));

                return $this->redirect(['action' => 'index']);
            } else {
                $this->Flash->error(__('The petty cash receipt voucher could not be saved. Please, try again.'));
            }
        }
        $receivedFroms = $this->PettyCashReceiptVouchers->ReceivedFroms->find('list', ['limit' => 200]);
        $bankCashes = $this->PettyCashReceiptVouchers->BankCashes->find('list', ['limit' => 200]);
        $this->set(compact('pettyCashReceiptVoucher', 'receivedFroms', 'bankCashes'));
        $this->set('_serialize', ['pettyCashReceiptVoucher']);
    }

    /**
     * Edit method
     *
     * @param string|null $id Petty Cash Receipt Voucher id.
     * @return \Cake\Network\Response|void Redirects on successful edit, renders view otherwise.
     * @throws \Cake\Network\Exception\NotFoundException When record not found.
     */
    public function edit($id = null)
    {
        $pettyCashReceiptVoucher = $this->PettyCashReceiptVouchers->get($id, [
            'contain' => []
        ]);
        if ($this->request->is(['patch', 'post', 'put'])) {
            $pettyCashReceiptVoucher = $this->PettyCashReceiptVouchers->patchEntity($pettyCashReceiptVoucher, $this->request->data);
            if ($this->PettyCashReceiptVouchers->save($pettyCashReceiptVoucher)) {
                $this->Flash->success(__('The petty cash receipt voucher has been saved.'));

                return $this->redirect(['action' => 'index']);
            } else {
                $this->Flash->error(__('The petty cash receipt voucher could not be saved. Please, try again.'));
            }
        }
        $receivedFroms = $this->PettyCashReceiptVouchers->ReceivedFroms->find('list', ['limit' => 200]);
        $bankCashes = $this->PettyCashReceiptVouchers->BankCashes->find('list', ['limit' => 200]);
        $this->set(compact('pettyCashReceiptVoucher', 'receivedFroms', 'bankCashes'));
        $this->set('_serialize', ['pettyCashReceiptVoucher']);
    }

    /**
     * Delete method
     *
     * @param string|null $id Petty Cash Receipt Voucher id.
     * @return \Cake\Network\Response|null Redirects to index.
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function delete($id = null)
    {
        $this->request->allowMethod(['post', 'delete']);
        $pettyCashReceiptVoucher = $this->PettyCashReceiptVouchers->get($id);
        if ($this->PettyCashReceiptVouchers->delete($pettyCashReceiptVoucher)) {
            $this->Flash->success(__('The petty cash receipt voucher has been deleted.'));
        } else {
            $this->Flash->error(__('The petty cash receipt voucher could not be deleted. Please, try again.'));
        }

        return $this->redirect(['action' => 'index']);
    }
}
