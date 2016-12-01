<?php
namespace App\Controller;

use App\Controller\AppController;

/**
 * JournalVouchers Controller
 *
 * @property \App\Model\Table\JournalVouchersTable $JournalVouchers
 */
class JournalVouchersController extends AppController
{

    /**
     * Index method
     *
     * @return \Cake\Network\Response|null
     */
    public function index()
    {
        $this->paginate = [
            'contain' => ['Companies']
        ];
        $journalVouchers = $this->paginate($this->JournalVouchers);

        $this->set(compact('journalVouchers'));
        $this->set('_serialize', ['journalVouchers']);
    }

    /**
     * View method
     *
     * @param string|null $id Journal Voucher id.
     * @return \Cake\Network\Response|null
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function view($id = null)
    {
        $journalVoucher = $this->JournalVouchers->get($id, [
            'contain' => ['Companies']
        ]);

        $this->set('journalVoucher', $journalVoucher);
        $this->set('_serialize', ['journalVoucher']);
    }

    /**
     * Add method
     *
     * @return \Cake\Network\Response|void Redirects on successful add, renders view otherwise.
     */
    public function add()
    {
        $journalVoucher = $this->JournalVouchers->newEntity();
        if ($this->request->is('post')) {
            $journalVoucher = $this->JournalVouchers->patchEntity($journalVoucher, $this->request->data);
            if ($this->JournalVouchers->save($journalVoucher)) {
                $this->Flash->success(__('The journal voucher has been saved.'));

                return $this->redirect(['action' => 'index']);
            } else {
                $this->Flash->error(__('The journal voucher could not be saved. Please, try again.'));
            }
        }
        $companies = $this->JournalVouchers->Companies->find('list', ['limit' => 200]);
        $this->set(compact('journalVoucher', 'companies'));
        $this->set('_serialize', ['journalVoucher']);
    }

    /**
     * Edit method
     *
     * @param string|null $id Journal Voucher id.
     * @return \Cake\Network\Response|void Redirects on successful edit, renders view otherwise.
     * @throws \Cake\Network\Exception\NotFoundException When record not found.
     */
    public function edit($id = null)
    {
        $journalVoucher = $this->JournalVouchers->get($id, [
            'contain' => []
        ]);
        if ($this->request->is(['patch', 'post', 'put'])) {
            $journalVoucher = $this->JournalVouchers->patchEntity($journalVoucher, $this->request->data);
            if ($this->JournalVouchers->save($journalVoucher)) {
                $this->Flash->success(__('The journal voucher has been saved.'));

                return $this->redirect(['action' => 'index']);
            } else {
                $this->Flash->error(__('The journal voucher could not be saved. Please, try again.'));
            }
        }
        $companies = $this->JournalVouchers->Companies->find('list', ['limit' => 200]);
        $this->set(compact('journalVoucher', 'companies'));
        $this->set('_serialize', ['journalVoucher']);
    }

    /**
     * Delete method
     *
     * @param string|null $id Journal Voucher id.
     * @return \Cake\Network\Response|null Redirects to index.
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function delete($id = null)
    {
        $this->request->allowMethod(['post', 'delete']);
        $journalVoucher = $this->JournalVouchers->get($id);
        if ($this->JournalVouchers->delete($journalVoucher)) {
            $this->Flash->success(__('The journal voucher has been deleted.'));
        } else {
            $this->Flash->error(__('The journal voucher could not be deleted. Please, try again.'));
        }

        return $this->redirect(['action' => 'index']);
    }
}
