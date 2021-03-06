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
			//pr($customer); exit;
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
				$this->Flash->success(__('The Customer has been saved.'));
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

		$defaultAddress = $this->Customers->CustomerAddress->find()->where(['customer_id' => $id,'default_address' => 1])->first();
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
		$session = $this->request->session();
		$st_company_id = $session->read('st_company_id');
		//$customers = $this->paginate($this->Customers->find());
		
		$LedgerAccounts = $this->paginate($this->Customers->LedgerAccounts->find()
			->where(['LedgerAccounts.company_id'=>$st_company_id,'source_model'=>'Customers']));
        $ReferenceDetails = $this->Customers->ReferenceDetails->find()->toArray();
		//pr($customers->toArray()); exit;

        $this->set(compact('LedgerAccounts','ReferenceDetails'));
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

	public function EditCompany($customer_id=null)
    {
		$this->viewBuilder()->layout('index_layout');	
		$Companies = $this->Customers->Companies->find();
		
		$Company_array=[];
		$Company_array1=[];
		foreach($Companies as $Company){
			$customer_Company_exist= $this->Customers->CustomerCompanies->exists(['customer_id' => $customer_id,'company_id'=>$Company->id]);
			if($customer_Company_exist){
				$Company_array[$Company->id]='Yes';
				$Company_array1[$Company->id]=$Company->name;
			}else{
				$Company_array[$Company->id]='No';
				$Company_array1[$Company->id]=$Company->name;

			}
		}
		$customer_data= $this->Customers->get($customer_id);
		$this->set(compact('Companies','customer_Company','Company_array','customer_id','Company_array1','customer_data'));

	}
	
	public function CheckCompany($company_id=null,$customer_id=null)
    {
		$this->viewBuilder()->layout('index_layout');	

		 $this->request->allowMethod(['post', 'delete']);
		
		$customer_ledger= $this->Customers->LedgerAccounts->find()->where(['source_model' => 'Customers','source_id'=>$customer_id,'company_id'=>$company_id])->first();

		$ledgerexist = $this->Customers->Ledgers->exists(['ledger_account_id' => $customer_ledger->id]);
				
		if(!$ledgerexist){
			$customer_Company_dlt= $this->Customers->CustomerCompanies->find()->where(['CustomerCompanies.customer_id'=>$customer_id,'company_id'=>$company_id])->first();
			$customer_ledger_dlt= $this->Customers->LedgerAccounts->find()->where(['source_model' => 'Customers','source_id'=>$customer_id,'company_id'=>$company_id])->first();
			
			$VoucherLedgerAccountsexist = $this->Customers->VoucherLedgerAccounts->exists(['ledger_account_id' => $customer_ledger->id]);
			

			if($VoucherLedgerAccountsexist){
				$Voucherref = $this->Customers->VouchersReferences->find()->contain(['VoucherLedgerAccounts'])->where(['VouchersReferences.company_id'=>$company_id]);
				
				foreach($Voucherref as $Voucherref){
					foreach($Voucherref->voucher_ledger_accounts as $voucher_ledger_account){
							if($voucher_ledger_account->ledger_account_id==$customer_ledger->id){
								$this->Customers->VoucherLedgerAccounts->delete($voucher_ledger_account);
							}
					}
					
				}
				
			}
			$this->Customers->LedgerAccounts->delete($customer_ledger_dlt);
			$this->Customers->CustomerCompanies->delete($customer_Company_dlt);
			return $this->redirect(['action' => 'EditCompany/'.$customer_id]);
				
		}else{
			$this->Flash->error(__('Customer can not be remove from the company, as some trasanctions have done. '));
			return $this->redirect(['action' => 'EditCompany/'.$customer_id]);
		}
	}
	
	public function AddCompany($company_id=null,$customer_id=null)
    {
		$this->viewBuilder()->layout('index_layout');	
		//pr($company_id); 
		//pr($customer_id); exit;
		$CustomerCompany = $this->Customers->CustomerCompanies->newEntity();
		$CustomerCompany->company_id=$company_id;
		$CustomerCompany->customer_id=$customer_id;
		$this->Customers->CustomerCompanies->save($CustomerCompany);
		
		$customer_details= $this->Customers->get($customer_id);
		$ledgerAccount = $this->Customers->LedgerAccounts->newEntity();
		$ledgerAccount->account_second_subgroup_id = $customer_details->account_second_subgroup_id;
		$ledgerAccount->name = $customer_details->customer_name;
		$ledgerAccount->alias = $customer_details->alias;
		$ledgerAccount->bill_to_bill_account = $customer_details->bill_to_bill_account;
		$ledgerAccount->source_model = 'Customers';
		$ledgerAccount->source_id = $customer_details->id;
		$ledgerAccount->company_id = $company_id;
		$this->Customers->LedgerAccounts->save($ledgerAccount);
		
		return $this->redirect(['action' => 'EditCompany/'.$customer_id]);
	}
	
}
