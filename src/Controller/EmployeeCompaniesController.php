<?php
namespace App\Controller;

use App\Controller\AppController;

/**
 * EmployeeCompanies Controller
 *
 * @property \App\Model\Table\EmployeeCompaniesTable $EmployeeCompanies
 */
class EmployeeCompaniesController extends AppController
{

    /**
     * Index method
     *
     * @return \Cake\Network\Response|null
     */
    public function index()
    {
        $this->paginate = [
            'contain' => ['Employees', 'Companies']
        ];
        $employeeCompanies = $this->paginate($this->EmployeeCompanies);

        $this->set(compact('employeeCompanies'));
        $this->set('_serialize', ['employeeCompanies']);
    }

    /**
     * View method
     *
     * @param string|null $id Employee Company id.
     * @return \Cake\Network\Response|null
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function view($id = null)
    {
        $employeeCompany = $this->EmployeeCompanies->get($id, [
            'contain' => ['Employees', 'Companies']
        ]);

        $this->set('employeeCompany', $employeeCompany);
        $this->set('_serialize', ['employeeCompany']);
    }

    /**
     * Add method
     *
     * @return \Cake\Network\Response|void Redirects on successful add, renders view otherwise.
     */
    public function add()
    {
        $employeeCompany = $this->EmployeeCompanies->newEntity();
        if ($this->request->is('post')) {
            $employeeCompany = $this->EmployeeCompanies->patchEntity($employeeCompany, $this->request->data);
            if ($this->EmployeeCompanies->save($employeeCompany)) {
                $this->Flash->success(__('The employee company has been saved.'));

                return $this->redirect(['action' => 'index']);
            } else {
                $this->Flash->error(__('The employee company could not be saved. Please, try again.'));
            }
        }
        $employees = $this->EmployeeCompanies->Employees->find('list', ['limit' => 200]);
        $companies = $this->EmployeeCompanies->Companies->find('list', ['limit' => 200]);
        $this->set(compact('employeeCompany', 'employees', 'companies'));
        $this->set('_serialize', ['employeeCompany']);
    }

    /**
     * Edit method
     *
     * @param string|null $id Employee Company id.
     * @return \Cake\Network\Response|void Redirects on successful edit, renders view otherwise.
     * @throws \Cake\Network\Exception\NotFoundException When record not found.
     */
    public function edit($id = null)
    {
        $employeeCompany = $this->EmployeeCompanies->get($id, [
            'contain' => []
        ]);
        if ($this->request->is(['patch', 'post', 'put'])) {
            $employeeCompany = $this->EmployeeCompanies->patchEntity($employeeCompany, $this->request->data);
            if ($this->EmployeeCompanies->save($employeeCompany)) {
                $this->Flash->success(__('The employee company has been saved.'));

                return $this->redirect(['action' => 'index']);
            } else {
                $this->Flash->error(__('The employee company could not be saved. Please, try again.'));
            }
        }
        $employees = $this->EmployeeCompanies->Employees->find('list', ['limit' => 200]);
        $companies = $this->EmployeeCompanies->Companies->find('list', ['limit' => 200]);
        $this->set(compact('employeeCompany', 'employees', 'companies'));
        $this->set('_serialize', ['employeeCompany']);
    }

    /**
     * Delete method
     *
     * @param string|null $id Employee Company id.
     * @return \Cake\Network\Response|null Redirects to index.
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function delete($id = null)
    {
        $this->request->allowMethod(['post', 'delete']);
        $employeeCompany = $this->EmployeeCompanies->get($id);
        if ($this->EmployeeCompanies->delete($employeeCompany)) {
            $this->Flash->success(__('The employee company has been deleted.'));
        } else {
            $this->Flash->error(__('The employee company could not be deleted. Please, try again.'));
        }

        return $this->redirect(['action' => 'index']);
    }
}
