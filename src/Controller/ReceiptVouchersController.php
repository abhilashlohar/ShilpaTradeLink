<?php
namespace App\Controller;

use App\Controller\AppController;

/**
 * ReceiptVouchers Controller
 *
 * @property \App\Model\Table\ReceiptVouchersTable $ReceiptVouchers
 */
class ReceiptVouchersController extends AppController
{

    /**
     * Index method
     *
     * @return \Cake\Network\Response|null
     */
    public function index()
    {
        $this->paginate = [
            'contain' => ['ReceivedFroms', 'BankCashes']
        ];
        $receiptVouchers = $this->paginate($this->ReceiptVouchers);

        $this->set(compact('receiptVouchers'));
        $this->set('_serialize', ['receiptVouchers']);
    }

    /**
     * View method
     *
     * @param string|null $id Receipt Voucher id.
     * @return \Cake\Network\Response|null
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function view($id = null)
    {
        $receiptVoucher = $this->ReceiptVouchers->get($id, [
            'contain' => ['ReceivedFroms', 'BankCashes']
        ]);

        $this->set('receiptVoucher', $receiptVoucher);
        $this->set('_serialize', ['receiptVoucher']);
    }

    /**
     * Add method
     *
     * @return \Cake\Network\Response|void Redirects on successful add, renders view otherwise.
     */
    public function add()
    {
		$this->viewBuilder()->layout('index_layout');
        $receiptVoucher = $this->ReceiptVouchers->newEntity();
        if ($this->request->is('post')) {
            $receiptVoucher = $this->ReceiptVouchers->patchEntity($receiptVoucher, $this->request->data);
            if ($this->ReceiptVouchers->save($receiptVoucher)) {
                $this->Flash->success(__('The receipt voucher has been saved.'));

                return $this->redirect(['action' => 'index']);
            } else {
                $this->Flash->error(__('The receipt voucher could not be saved. Please, try again.'));
            }
        }
		$vouchersReferences = $this->ReceiptVouchers->VouchersReferences->get(3, [
            'contain' => ['VouchersReferencesGroups']
        ]);
		
		foreach($vouchersReferences->vouchers_references_groups as $data){
			$where[]=$data->account_group_id;
		}

		$receivedFroms = $this->ReceiptVouchers->ReceivedFroms->find('list')->contain(['AccountSecondSubgroups'=>['AccountFirstSubgroups'=>['AccountGroups' => function ($q) use($where) {
				   return $q
						->where(['AccountGroups.id IN'=>$where]);
				}]]]);
        $bankCashes = $this->ReceiptVouchers->BankCashes->find('list', ['limit' => 200]);
        $this->set(compact('receiptVoucher', 'receivedFroms', 'bankCashes'));
        $this->set('_serialize', ['receiptVoucher']);
    }

    /**
     * Edit method
     *
     * @param string|null $id Receipt Voucher id.
     * @return \Cake\Network\Response|void Redirects on successful edit, renders view otherwise.
     * @throws \Cake\Network\Exception\NotFoundException When record not found.
     */
    public function edit($id = null)
    {
        $receiptVoucher = $this->ReceiptVouchers->get($id, [
            'contain' => []
        ]);
        if ($this->request->is(['patch', 'post', 'put'])) {
            $receiptVoucher = $this->ReceiptVouchers->patchEntity($receiptVoucher, $this->request->data);
            if ($this->ReceiptVouchers->save($receiptVoucher)) {
                $this->Flash->success(__('The receipt voucher has been saved.'));

                return $this->redirect(['action' => 'index']);
            } else {
                $this->Flash->error(__('The receipt voucher could not be saved. Please, try again.'));
            }
        }
        $receivedFroms = $this->ReceiptVouchers->ReceivedFroms->find('list', ['limit' => 200]);
        $bankCashes = $this->ReceiptVouchers->BankCashes->find('list', ['limit' => 200]);
        $this->set(compact('receiptVoucher', 'receivedFroms', 'bankCashes'));
        $this->set('_serialize', ['receiptVoucher']);
    }

    /**
     * Delete method
     *
     * @param string|null $id Receipt Voucher id.
     * @return \Cake\Network\Response|null Redirects to index.
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function delete($id = null)
    {
        $this->request->allowMethod(['post', 'delete']);
        $receiptVoucher = $this->ReceiptVouchers->get($id);
        if ($this->ReceiptVouchers->delete($receiptVoucher)) {
            $this->Flash->success(__('The receipt voucher has been deleted.'));
        } else {
            $this->Flash->error(__('The receipt voucher could not be deleted. Please, try again.'));
        }

        return $this->redirect(['action' => 'index']);
    }
}
