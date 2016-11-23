<?php
namespace App\Controller;

use App\Controller\AppController;

/**
 * PaymentVouchers Controller
 *
 * @property \App\Model\Table\PaymentVouchersTable $PaymentVouchers
 */
class PaymentVouchersController extends AppController
{

    /**
     * Index method
     *
     * @return \Cake\Network\Response|null
     */
    public function index()
    {
		$this->viewBuilder()->layout('index_layout');
        $paymentVouchers = $this->paginate($this->PaymentVouchers);
		$this->set(compact('paymentVouchers'));
        $this->set('_serialize', ['paymentVouchers']);
    }

    /**
     * View method
     *
     * @param string|null $id Payment Voucher id.
     * @return \Cake\Network\Response|null
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function view($id = null)
    {
        $paymentVoucher = $this->PaymentVouchers->get($id, [
            'contain' => []
        ]);

        $this->set('paymentVoucher', $paymentVoucher);
        $this->set('_serialize', ['paymentVoucher']);
    }

    /**
     * Add method
     *
     * @return \Cake\Network\Response|void Redirects on successful add, renders view otherwise.
     */
    public function add()
    {
		$this->viewBuilder()->layout('index_layout');
        $paymentVoucher = $this->PaymentVouchers->newEntity();
        if ($this->request->is('post')) {
            $paymentVoucher = $this->PaymentVouchers->patchEntity($paymentVoucher, $this->request->data);
            if ($this->PaymentVouchers->save($paymentVoucher)) {
                $this->Flash->success(__('The payment voucher has been saved.'));

                return $this->redirect(['action' => 'index']);
            } else {
                $this->Flash->error(__('The payment voucher could not be saved. Please, try again.'));
            }
			
        }
        $this->set(compact('paymentVoucher','vouchersReferences'));
        $this->set('_serialize', ['paymentVoucher']);
    }

    /**
     * Edit method
     *
     * @param string|null $id Payment Voucher id.
     * @return \Cake\Network\Response|void Redirects on successful edit, renders view otherwise.
     * @throws \Cake\Network\Exception\NotFoundException When record not found.
     */
    public function edit($id = null)
    {
        $paymentVoucher = $this->PaymentVouchers->get($id, [
            'contain' => []
        ]);
        if ($this->request->is(['patch', 'post', 'put'])) {
            $paymentVoucher = $this->PaymentVouchers->patchEntity($paymentVoucher, $this->request->data);
            if ($this->PaymentVouchers->save($paymentVoucher)) {
                $this->Flash->success(__('The payment voucher has been saved.'));

                return $this->redirect(['action' => 'index']);
            } else {
                $this->Flash->error(__('The payment voucher could not be saved. Please, try again.'));
            }
        }
        $this->set(compact('paymentVoucher'));
        $this->set('_serialize', ['paymentVoucher']);
    }

    /**
     * Delete method
     *
     * @param string|null $id Payment Voucher id.
     * @return \Cake\Network\Response|null Redirects to index.
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function delete($id = null)
    {
        $this->request->allowMethod(['post', 'delete']);
        $paymentVoucher = $this->PaymentVouchers->get($id);
        if ($this->PaymentVouchers->delete($paymentVoucher)) {
            $this->Flash->success(__('The payment voucher has been deleted.'));
        } else {
            $this->Flash->error(__('The payment voucher could not be deleted. Please, try again.'));
        }

        return $this->redirect(['action' => 'index']);
    }
}
