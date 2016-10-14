<?php
namespace App\Controller;

use App\Controller\AppController;

/**
 * Employees Controller
 *
 * @property \App\Model\Table\EmployeesTable $Employees
 */
class EmployeesController extends AppController
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
            'contain' => ['Departments']
        ];
        $employees = $this->paginate($this->Employees->find()->where(['deleted'=>'no']));

        $this->set(compact('employees'));
        $this->set('_serialize', ['employees']);
    }

    /**
     * View method
     *
     * @param string|null $id Employee id.
     * @return \Cake\Network\Response|null
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function view($id = null)
    {
        $employee = $this->Employees->get($id, [
            'contain' => ['Departments']
        ]);

        $this->set('employee', $employee);
        $this->set('_serialize', ['employee']);
    }

    /**
     * Add method
     *
     * @return \Cake\Network\Response|void Redirects on successful add, renders view otherwise.
     */
    public function add()
    {
		$this->viewBuilder()->layout('index_layout');
        $employee = $this->Employees->newEntity();
        if ($this->request->is('post')) {
            $employee = $this->Employees->patchEntity($employee, $this->request->data);
			
			$file = $this->request->data['signature'];
			$ext = substr(strtolower(strrchr($file['name'], '.')), 1); //get the extension
			$arr_ext = array('jpg', 'jpeg', 'png'); //set allowed extensions
			$setNewFileName = uniqid();
			
			$employee->signature=$setNewFileName. '.' . $ext;
			if (in_array($ext, $arr_ext)) {
				move_uploaded_file($file['tmp_name'], WWW_ROOT . '/signatures/' . $setNewFileName . '.' . $ext);
			}
			
            if ($this->Employees->save($employee)) {
                $this->Flash->success(__('The employee has been saved.'));

                return $this->redirect(['action' => 'index']);
            } else {
                $this->Flash->error(__('The employee could not be saved. Please, try again.'));
            }
        }
        $departments = $this->Employees->Departments->find('list')->where(['deleted'=>'no']);
		$designations = $this->Employees->Designations->find('list')->where(['deleted'=>'no']);
        $this->set(compact('employee', 'departments','designations'));
        $this->set('_serialize', ['employee']);
    }

    /**
     * Edit method
     *
     * @param string|null $id Employee id.
     * @return \Cake\Network\Response|void Redirects on successful edit, renders view otherwise.
     * @throws \Cake\Network\Exception\NotFoundException When record not found.
     */
    public function edit($id = null)
    {
		$this->viewBuilder()->layout('index_layout');
        $employee = $this->Employees->get($id, [
            'contain' => []
        ]);
        if ($this->request->is(['patch', 'post', 'put'])) {		
            $employee = $this->Employees->patchEntity($employee, $this->request->data);
			
			$file = $this->request->data['signature'];
			if(!empty($file['name'])){
				$ext = substr(strtolower(strrchr($file['name'], '.')), 1); //get the extension
				$arr_ext = array('png'); //set allowed extensions
				$setNewFileName = uniqid();
				
				$employee->signature=$setNewFileName. '.' . $ext;
				unlink(WWW_ROOT . '/signatures/' . $employee->getOriginal('signature'));
				if (in_array($ext, $arr_ext)) {
					move_uploaded_file($file['tmp_name'], WWW_ROOT . '/signatures/' . $setNewFileName . '.' . $ext);
				}
			}else{
				$employee->signature=$employee->getOriginal('signature');
			}
			
            if ($this->Employees->save($employee)) {
                $this->Flash->success(__('The employee has been saved.'));

                return $this->redirect(['action' => 'index']);
            } else {
                $this->Flash->error(__('The employee could not be saved. Please, try again.'));
            }
        }
        $departments = $this->Employees->Departments->find('list', ['limit' => 200]);
		$designations = $this->Employees->Designations->find('list', ['limit' => 200]);
        $this->set(compact('employee', 'departments','designations'));
        $this->set('_serialize', ['employee']);
    }

    /**
     * Delete method
     *
     * @param string|null $id Employee id.
     * @return \Cake\Network\Response|null Redirects to index.
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function delete($id = null)
    {
        $this->request->allowMethod(['post', 'delete']);
        $employee = $this->Employees->get($id);
		$employee->deleted='yes';
        if ($this->Employees->save($employee)) {
            $this->Flash->success(__('The employee has been deleted.'));
        } else {
            $this->Flash->error(__('The employee could not be deleted. Please, try again.'));
        }

        return $this->redirect(['action' => 'index']);
    }
}
