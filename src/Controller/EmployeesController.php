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
    public function index($status=null)
    {
		$url=$this->request->here();
		 $url=parse_url($url,PHP_URL_QUERY);
		
		$this->viewBuilder()->layout('index_layout');
        $this->paginate = [
            'contain' => ['Departments','Designations']
        ];
		$where=[];
		$employee_name=$this->request->query('employee_name');
		$department_name=$this->request->query('department_name');
		
		$this->set(compact('employee_name','department_name'));
		if(!empty($employee_name)){
			$where['Employees.name LIKE']='%'.$employee_name.'%';
		}
		if(!empty($department_name)){
			$where['Departments.name LIKE']='%'.$department_name.'%';
		}
		$employees = $this->paginate($this->Employees->find()->where($where)->order(['Employees.name' => 'ASC']));


        $this->set(compact('employees','status'));
        $this->set('_serialize', ['employees']);
		$this->set(compact('url'));
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
		$this->viewBuilder()->layout('index_layout');
        $employee = $this->Employees->get($id, [
            'contain' => ['Departments','Designations','EmployeeContactPersons']
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
			$employee->dob=date("Y-m-d",strtotime($employee->dob));
			$employee->date_of_anniversary=date("Y-m-d",strtotime($employee->date_of_anniversary));
			$employee->join_date=date("Y-m-d",strtotime($employee->join_date));
			$employee->permanent_join_date=date("Y-m-d",strtotime($employee->permanent_join_date));
			$file = $this->request->data['signature'];
			$ext = substr(strtolower(strrchr($file['name'], '.')), 1); //get the extension
			$arr_ext = array('jpg', 'jpeg', 'png'); //set allowed extensions
			$setNewFileName = uniqid();
			$employee->signature=$setNewFileName. '.' . $ext;
			if (in_array($ext, $arr_ext)) {
				move_uploaded_file($file['tmp_name'], WWW_ROOT . '/signatures/' . $setNewFileName . '.' . $ext);
			}
			
            if ($this->Employees->save($employee)) {
				
				
				foreach($employee->companies as $data)
				{
					$ledgerAccount = $this->Employees->LedgerAccounts->newEntity();
					$ledgerAccount->account_second_subgroup_id = $employee->account_second_subgroup_id;
					$ledgerAccount->name = $employee->name;
					$ledgerAccount->source_model = 'Employees';
					$ledgerAccount->source_id = $employee->id;
					$ledgerAccount->company_id = $data->id;
					$this->Employees->LedgerAccounts->save($ledgerAccount)
				} 
			
				
					$this->Flash->success(__('The employee has been saved.'));
					return $this->redirect(['action' => 'index']);
				
			} else 
				{
                $this->Flash->error(__('The employee could not be saved. Please, try again.'));
				}
        }
        $departments = $this->Employees->Departments->find('list')->order(['Departments.name' => 'ASC']);
		$designations = $this->Employees->Designations->find('list')->order(['Designations.name' => 'ASC']);
		$AccountCategories = $this->Employees->AccountCategories->find('list')->order(['AccountCategories.name' => 'ASC']);
		$Companies = $this->Employees->Companies->find('list');
        $this->set(compact('employee', 'departments','designations','AccountCategories','Companies'));
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
            'contain' => ['EmployeeContactPersons','Companies']
        ]);
        if ($this->request->is(['patch', 'post', 'put'])) {		
            $employee = $this->Employees->patchEntity($employee, $this->request->data);
			$employee->dob=date("Y-m-d",strtotime($employee->dob));
			$employee->date_of_anniversary=date("Y-m-d",strtotime($employee->date_of_anniversary));
			$employee->join_date=date("Y-m-d",strtotime($employee->join_date));
			$employee->permanent_join_date=date("Y-m-d",strtotime($employee->permanent_join_date));
			
			$file = $this->request->data['signature'];
			if(!empty($file['name'])){
				$ext = substr(strtolower(strrchr($file['name'], '.')), 1); //get the extension
				$arr_ext = array('png'); //set allowed extensions
				$setNewFileName = uniqid();
				
				$employee->signature=$setNewFileName. '.' . $ext;
				@unlink(WWW_ROOT . '/signatures/' . $employee->getOriginal('signature'));
				if (in_array($ext, $arr_ext)) {
					move_uploaded_file($file['tmp_name'], WWW_ROOT . '/signatures/' . $setNewFileName . '.' . $ext);
				}
			}else{
				$employee->signature=$employee->getOriginal('signature');
			}
			
            if ($this->Employees->save($employee)) {
					$query = $this->Employees->LedgerAccounts->query();
					$query->update()
						->set(['account_second_subgroup_id' => $employee->account_second_subgroup_id])
						->where(['id' => $employee->ledger_account_id])
						->execute();
                $this->Flash->success(__('The employee has been saved.'));

                return $this->redirect(['action' => 'index']);
            } else {
                $this->Flash->error(__('The employee could not be saved. Please, try again.'));
            }
        }
        $departments = $this->Employees->Departments->find('list')->order(['Departments.name' => 'ASC']);
		$designations = $this->Employees->Designations->find('list')->order(['Designations.name' => 'ASC']);
		$AccountCategories = $this->Employees->AccountCategories->find('list')->order(['AccountCategories.name' => 'ASC']);
		$AccountGroups = $this->Employees->AccountGroups->find('list');
		$AccountFirstSubgroups = $this->Employees->AccountFirstSubgroups->find('list');
		$AccountSecondSubgroups = $this->Employees->AccountSecondSubgroups->find('list');
		$Companies = $this->Employees->Companies->find('list');
        $this->set(compact('employee', 'departments','designations','AccountCategories','AccountGroups','AccountFirstSubgroups','AccountSecondSubgroups','Companies'));
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
		$Quotationsexists = $this->Employees->Quotations->exists(['employee_id' => $id]);
		$SalesOrdersexists = $this->Employees->SalesOrders->exists(['employee_id' => $id]);
		$Invoicesexists = $this->Employees->Invoices->exists(['employee_id' => $id]);
		if(!$Quotationsexists){
			 $employee = $this->Employees->get($id);
			if ($this->Employees->delete($employee)) {
				$this->Flash->success(__('The employee has been deleted.'));
			} else {
				$this->Flash->error(__('The employee could not be deleted. Please, try again.'));
			}	
		}elseif($Quotationsexists){
			$this->Flash->error(__('Once the quotations has created with employees, the employees cannot be deleted.'));
		}elseif($SalesOrdersexists){
			$this->Flash->error(__('Once the sales-order has created with sales-order, the employees cannot be deleted.'));
		}elseif($Invoicesexists){
			$this->Flash->error(__('Once the sales-order has created with invoice, the employees cannot be deleted.'));
		}
       

        return $this->redirect(['action' => 'index']);
    }
}
