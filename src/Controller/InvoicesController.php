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
		$url=$this->request->here();
		$url=parse_url($url,PHP_URL_QUERY);
		$this->viewBuilder()->layout('index_layout');
		$where=[];
		$company_alise=$this->request->query('company_alise');
		$invoice_no=$this->request->query('invoice_no');
		$file=$this->request->query('file');
		$customer=$this->request->query('customer');
		$From=$this->request->query('From');
		$To=$this->request->query('To');
		$total_From=$this->request->query('total_From');
		$total_To=$this->request->query('total_To');
		$page=$this->request->query('page');
		$this->set(compact('ref_no','customer','total_From','total_To','From','To','page','invoice_no','company_alise','file'));
		if(!empty($company_alise)){
			$where['Invoices.in1 LIKE']='%'.$company_alise.'%';
		}
		if(!empty($invoice_no)){
			$where['Invoices.id']=$invoice_no;
		}
		if(!empty($file)){
			$where['Invoices.in3 LIKE']='%'.$file.'%';
		}
		if(!empty($customer)){
			$where['Customers.customer_name LIKE']='%'.$customer.'%';
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
		$this->set(compact('url'));
    }

	    public function exportExcel()
		{
			
			$this->viewBuilder()->layout('');
			$where=[];
			$company_alise=$this->request->query('company_alise');
			$invoice_no=$this->request->query('invoice_no');
			$file=$this->request->query('file');
			$customer=$this->request->query('customer');
			$From=$this->request->query('From');
			$To=$this->request->query('To');
			$total_From=$this->request->query('total_From');
			$total_To=$this->request->query('total_To');
			$page=$this->request->query('page');
			$this->set(compact('ref_no','customer','total_From','total_To','From','To','page','invoice_no','company_alise','file'));
			if(!empty($company_alise)){
				$where['Invoices.in1 LIKE']='%'.$company_alise.'%';
			}
			if(!empty($invoice_no)){
				$where['Invoices.id']=$invoice_no;
			}
			if(!empty($file)){
				$where['Invoices.in3 LIKE']='%'.$file.'%';
			}
			if(!empty($customer)){
				$where['Customers.customer_name LIKE']='%'.$customer.'%';
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
            'contain' => ['Customers','Employees','Transporters','Creator'=>['Designations'],'Companies'=> [
			'CompanyBanks'=> function ($q) {
				return $q
				->where(['CompanyBanks.default_bank' => 1]);
				}], 'InvoiceRows' => ['Items'=>['Units']]]
			]);

        $this->set('invoice', $invoice);
        $this->set('_serialize', ['invoice'=>['Units']]);
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
		
		$s_employee_id=$this->viewVars['s_employee_id'];
		
		$sales_order_id=@(int)$this->request->query('sales-order');
		
		$sales_order=array(); $process_status='New';
		if(!empty($sales_order_id)){
			$sales_order = $this->Invoices->SalesOrders->get($sales_order_id, [
				'contain' => [
						'SalesOrderRows.Items' => function ($q) {
						   return $q
								->where(['SalesOrderRows.quantity > SalesOrderRows.processed_quantity']);
						},'Companies'
					]
			]);
			$process_status='Pulled From Sales-Order';
		}
		$this->set(compact('sales_order','process_status','sales_order_id'));
		
        $invoice = $this->Invoices->newEntity();
        if ($this->request->is('post')) {
            $invoice = $this->Invoices->patchEntity($invoice, $this->request->data);
			
			$invoice->po_date=date("Y-m-d",strtotime($invoice->po_date));
			
			$invoice->created_by=$s_employee_id;
			$invoice->company_id=$sales_order->company_id;
			$invoice->date_created=date("Y-m-d");
			
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
        $customers = $this->Invoices->Customers->find('all');
        $companies = $this->Invoices->Companies->find('all');
		
		$salesOrders = $this->Invoices->SalesOrders->find()->select(['total_rows' => 
				$this->Invoices->SalesOrders->find()->func()->count('SalesOrderRows.id')])
				->leftJoinWith('SalesOrderRows', function ($q) {
					return $q->where(['SalesOrderRows.quantity > SalesOrderRows.processed_quantity']);
				})
				->group(['SalesOrders.id'])
				->autoFields(true)
				->having(['total_rows >' => 0]);
				
		$items = $this->Invoices->Items->find('list');
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
			$invoice->po_date=date("Y-m-d",strtotime($invoice->po_date));
			$invoice->date_created=date("Y-m-d",strtotime($invoice->date_created));
			
            if ($this->Invoices->save($invoice)) {
				$qq=0; foreach($invoice->invoice_rows as $invoice_rows){
					$salesorderrow=$this->Invoices->SalesOrderRows->find()->where(['sales_order_id'=>$invoice->sales_order_id,'item_id'=>$invoice_rows->item_id])->first();
					$salesorderrow->processed_quantity=$salesorderrow->processed_quantity-$invoice->getOriginal('invoice_rows')[$qq]->quantity+$invoice_rows->quantity;
					$this->Invoices->SalesOrderRows->save($salesorderrow);
				$qq++; }
                $this->Flash->success(__('The invoice has been saved.'));

                return $this->redirect(['action' => 'index']);
            } else {
                $this->Flash->error(__('The invoice could not be saved. Please, try again.'));
            }
        }
       $customers = $this->Invoices->Customers->find('all');
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
	
	function RecentRecords($item_id=null,$customer_id=null){
		$this->viewBuilder()->layout('');
		if(!empty($item_id) and !empty($customer_id)){
			
			$item=$this->Invoices->Items->get($item_id);
			
			
			$customerIds=[]; $customer_text='';
			$customer=$this->Invoices->Customers->get($customer_id);
			if($customer->customer_group_id!=0){
				$customerGroup=$this->Invoices->CustomerGroups->get($customer->customer_group_id);
				$customer_text='Recent Record for customer group - <b>'.$customerGroup->name.'</b>';
				$customers=$this->Invoices->Customers->find()->select(['id'])->where(['customer_group_id'=>$customer->customer_group_id]);
				foreach($customers as $data){
					$customerIds[]=$data->id;
				}
			}else{
				$customerIds=array($customer_id);
				 $customer_text='Recent Record for customer - <b>'.$customer->customer_name.'</b>';
			}
			$Invoices=$this->Invoices->find()->where(['customer_id IN' => $customerIds])->matching(
					'InvoiceRows', function ($q) use($item_id) {
						return $q->where(['InvoiceRows.item_id' => $item_id]);
					}
				);
			$this->set(compact('Invoices','customer_text','item'));
		}
	}
}
