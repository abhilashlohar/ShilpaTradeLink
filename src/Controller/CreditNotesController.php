<?php
namespace App\Controller;

use App\Controller\AppController;

/**
 * CreditNotes Controller
 *
 * @property \App\Model\Table\CreditNotesTable $CreditNotes
 */
class CreditNotesController extends AppController
{

    /**
     * Index method
     *
     * @return \Cake\Network\Response|null
     */
    public function index()
    {
        $this->paginate = [
            'contain' => ['SalesAccs', 'Parties', 'Companies']
        ];
        $creditNotes = $this->paginate($this->CreditNotes);

        $this->set(compact('creditNotes'));
        $this->set('_serialize', ['creditNotes']);
    }

    /**
     * View method
     *
     * @param string|null $id Credit Note id.
     * @return \Cake\Network\Response|null
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function view($id = null)
    {
        $creditNote = $this->CreditNotes->get($id, [
            'contain' => ['SalesAccs', 'Parties', 'Companies']
        ]);

        $this->set('creditNote', $creditNote);
        $this->set('_serialize', ['creditNote']);
    }

    /**
     * Add method
     *
     * @return \Cake\Network\Response|void Redirects on successful add, renders view otherwise.
     */
    public function add()
    {
        $creditNote = $this->CreditNotes->newEntity();
        if ($this->request->is('post')) {
            $creditNote = $this->CreditNotes->patchEntity($creditNote, $this->request->data);
            if ($this->CreditNotes->save($creditNote)) {
                $this->Flash->success(__('The credit note has been saved.'));

                return $this->redirect(['action' => 'index']);
            } else {
                $this->Flash->error(__('The credit note could not be saved. Please, try again.'));
            }
        }
        $salesAccs = $this->CreditNotes->SalesAccs->find('list', ['limit' => 200]);
        $parties = $this->CreditNotes->Parties->find('list', ['limit' => 200]);
        $companies = $this->CreditNotes->Companies->find('list', ['limit' => 200]);
        $this->set(compact('creditNote', 'salesAccs', 'parties', 'companies'));
        $this->set('_serialize', ['creditNote']);
    }

    /**
     * Edit method
     *
     * @param string|null $id Credit Note id.
     * @return \Cake\Network\Response|void Redirects on successful edit, renders view otherwise.
     * @throws \Cake\Network\Exception\NotFoundException When record not found.
     */
    public function edit($id = null)
    {
        $creditNote = $this->CreditNotes->get($id, [
            'contain' => []
        ]);
        if ($this->request->is(['patch', 'post', 'put'])) {
            $creditNote = $this->CreditNotes->patchEntity($creditNote, $this->request->data);
            if ($this->CreditNotes->save($creditNote)) {
                $this->Flash->success(__('The credit note has been saved.'));

                return $this->redirect(['action' => 'index']);
            } else {
                $this->Flash->error(__('The credit note could not be saved. Please, try again.'));
            }
        }
        $salesAccs = $this->CreditNotes->SalesAccs->find('list', ['limit' => 200]);
        $parties = $this->CreditNotes->Parties->find('list', ['limit' => 200]);
        $companies = $this->CreditNotes->Companies->find('list', ['limit' => 200]);
        $this->set(compact('creditNote', 'salesAccs', 'parties', 'companies'));
        $this->set('_serialize', ['creditNote']);
    }

    /**
     * Delete method
     *
     * @param string|null $id Credit Note id.
     * @return \Cake\Network\Response|null Redirects to index.
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function delete($id = null)
    {
        $this->request->allowMethod(['post', 'delete']);
        $creditNote = $this->CreditNotes->get($id);
        if ($this->CreditNotes->delete($creditNote)) {
            $this->Flash->success(__('The credit note has been deleted.'));
        } else {
            $this->Flash->error(__('The credit note could not be deleted. Please, try again.'));
        }

        return $this->redirect(['action' => 'index']);
    }
}
