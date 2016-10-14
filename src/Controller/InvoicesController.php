<?php
namespace App\Controller;

use App\Controller\AppController;

/**
 * Invoices Controller
 *
 * @property \App\Model\Table\InvoicesTable $Invoices
 */
class InvoicesController extends AppController
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
		$invoice_no=$this->request->query('invoice_no');
		$customer=$this->request->query('customer');
		$From=$this->request->query('From');
		$To=$this->request->query('To');
		$total_From=$this->request->query('total_From');
		$total_To=$this->request->query('total_To');
		$page=$this->request->query('page');
		$this->set(compact('ref_no','customer','total_From','total_To','From','To','page'));
		if(!empty($invoice_no)){
			$invoice_no_arr=explode('/',$invoice_no);
			if(!empty($invoice_no_arr[0])){
				$where['in1 LIKE']='%'.$invoice_no_arr[0].'%';
			}
			if(!empty($invoice_no_arr[2])){
				$where['in3 LIKE']='%'.$invoice_no_arr[2].'%';
			}
			if(!empty($invoice_no_arr[3])){
				$where['in4 LIKE']='%'.$invoice_no_arr[3].'%';
			}
			
		}
		if(!empty($customer)){
			$where['customers.customer_name LIKE']='%'.$customer.'%';
		}
		if(!empty($From)){
			$From=date("Y-m-d",strtotime($this->request->query('From')));
			$where['date_created >=']=$From;
		}
		if(!empty($To)){
			$To=date("Y-m-d",strtotime($this->request->query('To')));
			$where['date_created <=']=$To;
		}
		if(!empty($total_From)){
			$where['total_after_pnf >=']=$total_From;
		}
		if(!empty($total_To)){
			$where['total_after_pnf <=']=$total_To;
		}
        $this->paginate = [
            'contain' => ['Customers', 'Companies']
        ];
        $invoices = $this->paginate($this->Invoices->find()->where($where)->order(['Invoices.id' => 'DESC']));
		
        $this->set(compact('invoices'));
        $this->set('_serialize', ['invoices']);
    }

    /**
     * View method
     *
     * @param string|null $id Invoice id.
     * @return \Cake\Network\Response|null
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function view($id = null)
    {
		$this->viewBuilder()->layout('index_layout');
        $invoice = $this->Invoices->get($id, [
            'contain' => ['Customers', 'Companies', 'InvoiceRows' => ['Items']]
        ]);

        $this->set('invoice', $invoice);
        $this->set('_serialize', ['invoice']);
    }
	
	public function pdf($id = null)
    {
		$this->viewBuilder()->layout('');
         $invoice = $this->Invoices->get($id, [
            'contain' => ['Customers','Employees', 'Companies'=> [
			'CompanyBanks'=> function ($q) {
				return $q
				->where(['CompanyBanks.default_bank' => 1]);
				}], 'InvoiceRows' => ['Items']]
			]);

        $this->set('invoice', $invoice);
        $this->set('_serialize', ['invoice']);
    }
	
	public function confirm($id = null)
    {
		$this->viewBuilder()->layout('pdf_layout');
		
        $this->set('id', $id);
    }

    /**
     * Add method
     *
     * @return \Cake\Network\Response|void Redirects on successful add, renders view otherwise.
     */
    public function add()
    {
		$this->viewBuilder()->layout('index_layout');
		
		$sales_order_id=@(int)$this->request->query('sales-order');
		
		$sales_order=array(); $process_status='New';
		if(!empty($sales_order_id)){
			$sales_order = $this->Invoices->SalesOrders->get($sales_order_id, [
				'contain' => [
						'SalesOrderRows.Items' => function ($q) {
						   return $q
								->where(['SalesOrderRows.quantity > SalesOrderRows.processed_quantity']);
						}
					]
			]);
			$process_status='Pulled From Sales-Order';
		}
		$this->set(compact('sales_order','process_status','sales_order_id'));
		
        $invoice = $this->Invoices->newEntity();
        if ($this->request->is('post')) {
            $invoice = $this->Invoices->patchEntity($invoice, $this->request->data);
			$invoice->date_created=date("Y-m-d",strtotime($invoice->date_created));
			//pr($invoice); exit;
            if ($this->Invoices->save($invoice)) {
				if(!empty($sales_order_id)){
					$invoice->check=array_filter($invoice->check);
					$i=0; 
					foreach($invoice->check as $sales_order_row_id){
						$qty=$invoice->invoice_rows[$i]['quantity'];
						
						$SalesOrderRow = $this->Invoices->SalesOrderRows->get($sales_order_row_id);
						$SalesOrderRow->processed_quantity=$SalesOrderRow->processed_quantity+$qty;
						$this->Invoices->SalesOrderRows->save($SalesOrderRow);
						$i++;
					}
				}
                $this->Flash->success(__('The invoice has been saved.'));

                return $this->redirect(['action' => 'confirm/'.$invoice->id]);
            } else {
                $this->Flash->error(__('The invoice could not be saved. Please, try again.'));
            }
        }
        $customers = $this->Invoices->Customers->find('list')->where(['deleted'=>'no']);
        $companies = $this->Invoices->Companies->find('all')->where(['deleted'=>'no']);
		
		$salesOrders = $this->Invoices->SalesOrders->find()->select(['total_rows' => 
				$this->Invoices->SalesOrders->find()->func()->count('SalesOrderRows.id')])
				->leftJoinWith('SalesOrderRows', function ($q) {
					return $q->where(['SalesOrderRows.quantity > SalesOrderRows.processed_quantity']);
				})
				->group(['SalesOrders.id'])
				->autoFields(true)
				->having(['total_rows >' => 0]);
				
		$items = $this->Invoices->Items->find('list')->where(['deleted'=>'no']);
		$transporters = $this->Invoices->Transporters->find('list', ['limit' => 200]);
		$termsConditions = $this->Invoices->TermsConditions->find('all',['limit' => 200]);
		$SaleTaxes = $this->Invoices->SaleTaxes->find('all');
		$employees = $this->Invoices->Employees->find('list', ['limit' => 200]);
        $this->set(compact('invoice', 'customers', 'companies', 'salesOrders','items','transporters','termsConditions','serviceTaxs','exciseDuty','SaleTaxes','employees'));
        $this->set('_serialize', ['invoice']);
    }
	
	public function pullFromSalesOrder(){
		if ($this->request->is('post')) {
			$sales_order_id=$this->request->data["sales_order_id"];
            return $this->redirect(['action' => 'add?sales-order='.$sales_order_id]);
        }
	}

    /**
     * Edit method
     *
     * @param string|null $id Invoice id.
     * @return \Cake\Network\Response|void Redirects on successful edit, renders view otherwise.
     * @throws \Cake\Network\Exception\NotFoundException When record not found.
     */
    public function edit($id = null)
    {
		$this->viewBuilder()->layout('index_layout');
		
        $invoice = $this->Invoices->get($id, [
            'contain' => ['InvoiceRows' => ['Items']]
        ]);
        if ($this->request->is(['patch', 'post', 'put'])) {
            $invoice = $this->Invoices->patchEntity($invoice, $this->request->data);
            if ($this->Invoices->save($invoice)) {
				
                $this->Flash->success(__('The invoice has been saved.'));

                return $this->redirect(['action' => 'index']);
            } else {
                $this->Flash->error(__('The invoice could not be saved. Please, try again.'));
            }
        }
       $customers = $this->Invoices->Customers->find('list', ['limit' => 200]);
       $companies = $this->Invoices->Companies->find('all', ['limit' => 200]);
		
		$salesOrders = $this->Invoices->SalesOrders->find()->select(['total_rows' => 
				$this->Invoices->SalesOrders->find()->func()->count('SalesOrderRows.id')])
				->leftJoinWith('SalesOrderRows', function ($q) {
					return $q->where(['SalesOrderRows.quantity > SalesOrderRows.processed_quantity']);
				})
				->group(['SalesOrders.id'])
				->autoFields(true)
				->having(['total_rows >' => 0]);
				
		$items = $this->Invoices->Items->find('list',['limit' => 200]);
		$transporters = $this->Invoices->Transporters->find('list', ['limit' => 200]);
		$termsConditions = $this->Invoices->TermsConditions->find('all',['limit' => 200]);
		$SaleTaxes = $this->Invoices->SaleTaxes->find('all');
		$employees = $this->Invoices->Employees->find('list', ['limit' => 200]);
        $this->set(compact('invoice', 'customers', 'companies', 'salesOrders','items','transporters','termsConditions','serviceTaxs','exciseDuty','SaleTaxes','employees'));
        $this->set('_serialize', ['invoice']);
    }

    /**
     * Delete method
     *
     * @param string|null $id Invoice id.
     * @return \Cake\Network\Response|null Redirects to index.
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function delete($id = null)
    {
        $this->request->allowMethod(['post', 'delete']);
        $invoice = $this->Invoices->get($id);
        if ($this->Invoices->delete($invoice)) {
            $this->Flash->success(__('The invoice has been deleted.'));
        } else {
            $this->Flash->error(__('The invoice could not be deleted. Please, try again.'));
        }

        return $this->redirect(['action' => 'index']);
    }
}
