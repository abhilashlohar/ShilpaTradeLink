<?php
namespace App\Controller;

use App\Controller\AppController;

/**
 * Customers Controller
 *
 * @property \App\Model\Table\CustomersTable $Customers
 */
class CustomersController extends AppController
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
            'contain' => ['Districts', 'CustomerSegs']
        ];
        $customers = $this->paginate($this->Customers);

        $this->set(compact('customers'));
        $this->set('_serialize', ['customers']);
    }

    /**
     * View method
     *
     * @param string|null $id Customer id.
     * @return \Cake\Network\Response|null
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function view($id = null)
    {
		$this->viewBuilder()->layout('index_layout');
        $customer = $this->Customers->get($id, [
            'contain' => ['Districts', 'CompanyGroups', 'CustomerSegs', 'CustomerContacts', 'Quotations']
        ]);

        $this->set('customer', $customer);
        $this->set('_serialize', ['customer']);
    }

    /**
     * Add method
     *
     * @return \Cake\Network\Response|void Redirects on successful add, renders view otherwise.
     */
    public function add()
    {
		$this->viewBuilder()->layout('index_layout');
        $customer = $this->Customers->newEntity();
        if ($this->request->is('post')) {
            $customer = $this->Customers->patchEntity($customer, $this->request->data);
			
            if ($this->Customers->save($customer)) {
				
                $this->Flash->success(__('The customer has been saved.'));
                return $this->redirect(['action' => 'index']);
            } else {
                $this->Flash->error(__('The customer could not be saved. Please, try again.'));
            }
			
        }
        $districts = $this->Customers->Districts->find('list', ['limit' => 200]);
        $companyGroups = $this->Customers->CompanyGroups->find('list', ['limit' => 200]);
		$CustomerGroups = $this->Customers->CustomerGroups->find('list', ['limit' => 200]);
        $customerSegs = $this->Customers->CustomerSegs->find('list', ['limit' => 200]);
		$employees = $this->Customers->Employees->find('list', ['limit' => 200])->where(['dipartment_id' => 1]);
		$transporters = $this->Customers->Transporters->find('list', ['limit' => 200]);
        $this->set(compact('customer', 'districts', 'companyGroups', 'customerSegs','employees','transporters','CustomerGroups'));
        $this->set('_serialize', ['customer']);
    }

    /**
     * Edit method
     *
     * @param string|null $id Customer id.
     * @return \Cake\Network\Response|void Redirects on successful edit, renders view otherwise.
     * @throws \Cake\Network\Exception\NotFoundException When record not found.
     */
    public function edit($id = null)
    {
		$this->viewBuilder()->layout('index_layout');
        $customer = $this->Customers->get($id, [
            'contain' => ['CustomerContacts','CustomerAddress']
        ]);
		
        if ($this->request->is(['patch', 'post', 'put'])) {
            $customer = $this->Customers->patchEntity($customer, $this->request->data);
            if ($this->Customers->save($customer)) {
                $this->Flash->success(__('The customer has been saved.'));

                return $this->redirect(['action' => 'index']);
            } else {
                $this->Flash->error(__('The customer could not be saved. Please, try again.'));
            }
        }
        $districts = $this->Customers->Districts->find('list', ['limit' => 200]);
        $companyGroups = $this->Customers->CompanyGroups->find('list', ['limit' => 200]);
        $customerSegs = $this->Customers->CustomerSegs->find('list', ['limit' => 200]);
		$employees = $this->Customers->Employees->find('list', ['limit' => 200])->where(['dipartment_id' => 1]);
		$transporters = $this->Customers->Transporters->find('list', ['limit' => 200]);
        $this->set(compact('customer', 'districts', 'companyGroups', 'customerSegs','employees','transporters'));
        $this->set('_serialize', ['customer']);
    }

    /**
     * Delete method
     *
     * @param string|null $id Customer id.
     * @return \Cake\Network\Response|null Redirects to index.
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function delete($id = null)
    {
        $this->request->allowMethod(['post', 'delete']);
        $customer = $this->Customers->get($id);
        if ($this->Customers->delete($customer)) {
            $this->Flash->success(__('The customer has been deleted.'));
        } else {
            $this->Flash->error(__('The customer could not be deleted. Please, try again.'));
        }

        return $this->redirect(['action' => 'index']);
    }
	
	
	
	public function addressList($id = null)
    {
		$this->viewBuilder()->layout('ajax_layout');
		
		if(empty($id)){
			echo 'Please Select Customer First.'; exit;
		}
        $customer = $this->Customers->get($id, [
            'contain' => ['CustomerAddress']
        ]);

        $this->set('customer', $customer);
        $this->set('_serialize', ['customer']);
    }
	
	public function defaultAddress($id = null)
    {
		$this->viewBuilder()->layout('');
		
		if(empty($id)){
			echo ''; exit;
		}
		$defaultAddress = $this->Customers->CustomerAddress->find('all')->where(['customer_id' => $id,'default_address' => 1])->first();
		echo $defaultAddress->address;
    }
	
	public function defaultContact($id = null)
    {
		$this->viewBuilder()->layout('');
		
		if(empty($id)){
			echo ''; exit;
		}
		$defaultContact = $this->Customers->CustomerContacts->find('all')->where(['customer_id' => $id,'default_contact' => 1])->first();
		echo $defaultContact->mobile;
    }
}
