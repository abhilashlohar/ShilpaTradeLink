<?php
namespace App\Controller;

use App\Controller\AppController;

/**
 * DebitNotes Controller
 *
 * @property \App\Model\Table\DebitNotesTable $DebitNotes
 */
class DebitNotesController extends AppController
{

    /**
     * Index method
     *
     * @return \Cake\Network\Response|null
     */
    public function index()
    {
        $this->paginate = [
            'contain' => ['PurchaseAccs', 'Parties', 'Companies']
        ];
        $debitNotes = $this->paginate($this->DebitNotes);

        $this->set(compact('debitNotes'));
        $this->set('_serialize', ['debitNotes']);
    }

    /**
     * View method
     *
     * @param string|null $id Debit Note id.
     * @return \Cake\Network\Response|null
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function view($id = null)
    {
        $debitNote = $this->DebitNotes->get($id, [
            'contain' => ['PurchaseAccs', 'Parties', 'Companies']
        ]);

        $this->set('debitNote', $debitNote);
        $this->set('_serialize', ['debitNote']);
    }

    /**
     * Add method
     *
     * @return \Cake\Network\Response|void Redirects on successful add, renders view otherwise.
     */
    public function add()
    {
        $debitNote = $this->DebitNotes->newEntity();
        if ($this->request->is('post')) {
            $debitNote = $this->DebitNotes->patchEntity($debitNote, $this->request->data);
            if ($this->DebitNotes->save($debitNote)) {
                $this->Flash->success(__('The debit note has been saved.'));

                return $this->redirect(['action' => 'index']);
            } else {
                $this->Flash->error(__('The debit note could not be saved. Please, try again.'));
            }
        }
        $purchaseAccs = $this->DebitNotes->PurchaseAccs->find('list', ['limit' => 200]);
        $parties = $this->DebitNotes->Parties->find('list', ['limit' => 200]);
        $companies = $this->DebitNotes->Companies->find('list', ['limit' => 200]);
        $this->set(compact('debitNote', 'purchaseAccs', 'parties', 'companies'));
        $this->set('_serialize', ['debitNote']);
    }

    /**
     * Edit method
     *
     * @param string|null $id Debit Note id.
     * @return \Cake\Network\Response|void Redirects on successful edit, renders view otherwise.
     * @throws \Cake\Network\Exception\NotFoundException When record not found.
     */
    public function edit($id = null)
    {
        $debitNote = $this->DebitNotes->get($id, [
            'contain' => []
        ]);
        if ($this->request->is(['patch', 'post', 'put'])) {
            $debitNote = $this->DebitNotes->patchEntity($debitNote, $this->request->data);
            if ($this->DebitNotes->save($debitNote)) {
                $this->Flash->success(__('The debit note has been saved.'));

                return $this->redirect(['action' => 'index']);
            } else {
                $this->Flash->error(__('The debit note could not be saved. Please, try again.'));
            }
        }
        $purchaseAccs = $this->DebitNotes->PurchaseAccs->find('list', ['limit' => 200]);
        $parties = $this->DebitNotes->Parties->find('list', ['limit' => 200]);
        $companies = $this->DebitNotes->Companies->find('list', ['limit' => 200]);
        $this->set(compact('debitNote', 'purchaseAccs', 'parties', 'companies'));
        $this->set('_serialize', ['debitNote']);
    }

    /**
     * Delete method
     *
     * @param string|null $id Debit Note id.
     * @return \Cake\Network\Response|null Redirects to index.
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function delete($id = null)
    {
        $this->request->allowMethod(['post', 'delete']);
        $debitNote = $this->DebitNotes->get($id);
        if ($this->DebitNotes->delete($debitNote)) {
            $this->Flash->success(__('The debit note has been deleted.'));
        } else {
            $this->Flash->error(__('The debit note could not be deleted. Please, try again.'));
        }

        return $this->redirect(['action' => 'index']);
    }
}
