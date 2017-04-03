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
		$where=[];
		$customer=$this->request->query('customer');
		$district=$this->request->query('district');
		$customer_seg=$this->request->query('customer_seg');
		$this->set(compact('customer','district','customer_seg'));
		if(!empty($customer)){
			$where['customer_name LIKE']='%'.$customer.'%';
		}
		if(!empty($district)){
			$where['districts.district LIKE']='%'.$district.'%';
		}
		if(!empty($customer_seg)){
			$where['customerSegs.name LIKE']='%'.$customer_seg.'%';
		}
        $this->paginate = [
            'contain' => ['Districts', 'CustomerSegs']
        ];
        $customers = $this->paginate($this->Customers->find()->where($where)->order(['Customers.customer_name' => 'ASC']));

		
		
		
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
            'contain' => ['Districts', 'CustomerSegs', 'CustomerContacts', 'Quotations','CustomerAddress']
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
		$session = $this->request->session();
		$st_company_id = $session->read('st_company_id');
        $customer = $this->Customers->newEntity();
        if ($this->request->is('post')) {
            $customer = $this->Customers->patchEntity($customer, $this->request->data);
			
			$billTobill=$customer->bill_to_bill_account;
			
			
            if ($this->Customers->save($customer)) {
				
				
				foreach($customer->companies as $data)
				{
				$ledgerAccount = $this->Customers->LedgerAccounts->newEntity();
				$ledgerAccount->account_second_subgroup_id = $customer->account_second_subgroup_id;
				$ledgerAccount->name = $customer->customer_name;
				$ledgerAccount->alias = $customer->alias;
				$ledgerAccount->bill_to_bill_account = $billTobill;
				$ledgerAccount->source_model = 'Customers';
				$ledgerAccount->source_id = $customer->id;
				$ledgerAccount->company_id = $data->id;
				$this->Customers->LedgerAccounts->save($ledgerAccount);
				}
				
				
            } else {
                $this->Flash->error(__('The customer could not be saved. Please, try again.'));
            }
			
        }
        $districts = $this->Customers->Districts->find('list')->order(['Districts.District' => 'ASC']);
        $companyGroups = $this->Customers->CompanyGroups->find('list', ['limit' => 200]);
		$CustomerGroups = $this->Customers->CustomerGroups->find('list')->order(['CustomerGroups.name' => 'ASC']);
        $customerSegs = $this->Customers->CustomerSegs->find('list')->order(['CustomerSegs.name' => 'ASC']);
		$employees = $this->Customers->Employees->find('list', ['limit' => 200])->where(['dipartment_id' => 1])->order(['Employees.name' => 'ASC']);
		
		$transporters = $this->Customers->Transporters->find('list')->order(['Transporters.transporter_name' => 'ASC']);
		$AccountCategories = $this->Customers->AccountCategories->find('list')->order(['AccountCategories.name' => 'ASC']);
		 $Companies = $this->Customers->Companies->find('list');
        $this->set(compact('customer', 'districts', 'companyGroups', 'customerSegs','employees','transporters','CustomerGroups','AccountCategories','Companies'));
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
			//pr(); exit;
            if ($this->Customers->save($customer)) {
				
				$query = $this->Customers->LedgerAccounts->query();
					$query->update()
						->set(['bill_to_bill_account' => $customer->bill_to_bill_account])
						->set(['account_second_subgroup_id' => $customer->account_second_subgroup_id])
						->where(['id' => $customer->ledger_account_id])
						->execute();
                $this->Flash->success(__('The customer has been saved.'));

                return $this->redirect(['action' => 'index']);
            } else {
                $this->Flash->error(__('The customer could not be saved. Please, try again.'));
            }
        }
        $districts = $this->Customers->Districts->find('list')->order(['Districts.District' => 'ASC']);
        $companyGroups = $this->Customers->CompanyGroups->find('list', ['limit' => 200]);
		$CustomerGroups = $this->Customers->CustomerGroups->find('list')->order(['CustomerGroups.name' => 'ASC']);
        $customerSegs = $this->Customers->CustomerSegs->find('list')->order(['CustomerSegs.name' => 'ASC']);
		$employees = $this->Customers->Employees->find('list', ['limit' => 200])->where(['dipartment_id' => 1])->order(['Employees.name' => 'ASC']);
		
		$transporters = $this->Customers->Transporters->find('list')->order(['Transporters.transporter_name' => 'ASC']);
		$AccountCategories = $this->Customers->AccountCategories->find('list');
		$AccountGroups = $this->Customers->AccountGroups->find('list');
		$AccountFirstSubgroups = $this->Customers->AccountFirstSubgroups->find('list');
		$AccountSecondSubgroups = $this->Customers->AccountSecondSubgroups->find('list');
		
        $this->set(compact('customer', 'districts', 'companyGroups', 'customerSegs','employees','transporters','CustomerGroups','AccountCategories','AccountGroups','AccountFirstSubgroups','AccountSecondSubgroups'));
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
		$Quotationsexists = $this->Customers->Quotations->exists(['customer_id' => $id]);
		$SalesOrdersexists = $this->Customers->SalesOrders->exists(['customer_id' => $id]);
		$Invoicesexists = $this->Customers->Invoices->exists(['customer_id' => $id]);
		$Filenamesexists = $this->Customers->Filenames->exists(['customer_id' => $id]);
		if(!$Quotationsexists and !$SalesOrdersexists and !$Invoicesexists and !$Filenamesexists){
			$customer = $this->Customers->get($id);
			if ($this->Customers->delete($customer)) {
				$this->Flash->success(__('The customer has been deleted.'));
			} else {
				$this->Flash->error(__('The customer could not be deleted. Please, try again.'));
			}
		}elseif($Quotationsexists){
			$this->Flash->error(__('Once the quotations has generated with customer, the customer cannot be deleted.'));
		}elseif($SalesOrdersexists){
			$this->Flash->error(__('Once the sales-order has generated with customer, the customer cannot be deleted.'));
		}elseif($Invoicesexists){
			$this->Flash->error(__('Once the invoice has generated with customer, the customer cannot be deleted.'));
		}elseif($Filenamesexists){
			$this->Flash->error(__('Once the File has generated with customer, the customer cannot be deleted.'));
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
		$result=json_encode(array('contact_person'=>$defaultContact->contact_person,'mobile'=>$defaultContact->mobile));
		die($result);
    }
	
	public function OverDueReport()
    {
		$this->viewBuilder()->layout('index_layout');
		
        $customers = $this->paginate($this->Customers->find());
        $ReferenceDetails = $this->Customers->ReferenceDetails->find()->toArray();
		//pr($customers); exit;

        $this->set(compact('customers','ReferenceDetails'));
        $this->set('_serialize', ['customers']);
    }
	
	public function CreditLimit($customer_id = null)
    {
		$this->viewBuilder()->layout('');
		
		$Customer = $this->Customers->get($customer_id);
		echo $Customer->credit_limit;
    }
	function AgstRefForPayment($customer_id=null){
		$this->viewBuilder()->layout('');
		$session = $this->request->session();
		$st_company_id = $session->read('st_company_id');
		
		$Customer=$this->Customers->find()->where(['Customers.id'=>$customer_id])->first();
		//pr($Customer); 
		$ReceiptVoucher=$this->Customers->ReceiptVouchers->find()->where(['received_from_id'=>$Customer->ledger_account_id,'advance_amount > '=>0.00])->toArray();
		//pr($ReceiptVoucher); exit;
		if(!$ReceiptVoucher){ echo 'Select paid to.'; exit; }
		$this->set(compact('Customer','ReceiptVoucher'));
	}	
	
}
