<?php
namespace App\Controller;

use App\Controller\AppController;

/**
 * SalesOrders Controller
 *
 * @property \App\Model\Table\SalesOrdersTable $SalesOrders
 */
class SalesOrdersController extends AppController
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
		$where=[];
		$company_alise=$this->request->query('company_alise');
		$sales_order_no=$this->request->query('sales_order_no');
		$file=$this->request->query('file');
		$customer=$this->request->query('customer');
		$po_no=$this->request->query('po_no');
		$From=$this->request->query('From');
		$To=$this->request->query('To');
		$pull_request=$this->request->query('pull-request');
		$this->set(compact('sales_order_no','customer','po_no','product','From','To','company_alise','file','pull_request'));
		if(!empty($company_alise)){
			$where['SalesOrders.so1 LIKE']='%'.$company_alise.'%';
		}
		if(!empty($sales_order_no)){
			$where['SalesOrders.id']=$sales_order_no;
		}
		if(!empty($file)){
			$where['SalesOrders.so3 LIKE']='%'.$file.'%';
		}
		if(!empty($customer)){
			$where['Customers.customer_name LIKE']='%'.$customer.'%';
		}
		if(!empty($po_no)){
			$where['customer_po_no LIKE']='%'.$po_no.'%';
		}
		if(!empty($From)){
			$From=date("Y-m-d",strtotime($this->request->query('From')));
			$where['date >=']=$From;
		}
		if(!empty($To)){
			$To=date("Y-m-d",strtotime($this->request->query('To')));
			$where['date <=']=$To;
		}
        $this->paginate = [
            'contain' => ['Customers','Employees','Categories', 'Companies']
        ];
		
        $this->paginate = [
            'contain' => ['Customers']
        ];
		
		if($status==null or $status=='Pending'){
			$having=['total_rows >' => 0];
		}elseif($status=='Converted Into Invoice'){
			$having=['total_rows =' => 0];
		}
		$salesOrders=$this->paginate(
			$this->SalesOrders->find()->select(['total_rows' => 
				$this->SalesOrders->find()->func()->count('SalesOrderRows.id')])
				->leftJoinWith('SalesOrderRows', function ($q) {
					return $q->where(['SalesOrderRows.processed_quantity < SalesOrderRows.quantity']);
				})
				->group(['SalesOrders.id'])
				->autoFields(true)
				->having($having)
				->where($where)
				->order(['SalesOrders.id' => 'DESC'])
			);
		
        $this->set(compact('salesOrders','status'));
        $this->set('_serialize', ['salesOrders']);
		$this->set(compact('url'));
    }
	
	
	 public function exportExcel($status=null)
    {
		$this->viewBuilder()->layout('');
		$where=[];
		$company_alise=$this->request->query('company_alise');
		$sales_order_no=$this->request->query('sales_order_no');
		$file=$this->request->query('file');
		$customer=$this->request->query('customer');
		$po_no=$this->request->query('po_no');
		$From=$this->request->query('From');
		$To=$this->request->query('To');
		$pull_request=$this->request->query('pull-request');
		$this->set(compact('sales_order_no','customer','po_no','product','From','To','company_alise','file','pull_request'));
		if(!empty($company_alise)){
			$where['SalesOrders.so1 LIKE']='%'.$company_alise.'%';
		}
		if(!empty($sales_order_no)){
			$where['SalesOrders.id']=$sales_order_no;
		}
		if(!empty($file)){
			$where['SalesOrders.so3 LIKE']='%'.$file.'%';
		}
		if(!empty($customer)){
			$where['Customers.customer_name LIKE']='%'.$customer.'%';
		}
		if(!empty($po_no)){
			$where['customer_po_no LIKE']='%'.$po_no.'%';
		}
		if(!empty($From)){
			$From=date("Y-m-d",strtotime($this->request->query('From')));
			$where['date >=']=$From;
		}
		if(!empty($To)){
			$To=date("Y-m-d",strtotime($this->request->query('To')));
			$where['date <=']=$To;
		}
        $this->paginate = [
            'contain' => ['Customers','Employees','Categories', 'Companies']
        ];
		
        $this->paginate = [
            'contain' => ['Customers']
        ];
		
		if($status==null or $status=='Pending'){
			$having=['total_rows >' => 0];
		}elseif($status=='Converted Into Invoice'){
			$having=['total_rows =' => 0];
		}
		$salesOrders=$this->paginate(
			$this->SalesOrders->find()->select(['total_rows' => 
				$this->SalesOrders->find()->func()->count('SalesOrderRows.id')])
				->leftJoinWith('SalesOrderRows', function ($q) {
					return $q->where();
				})
				->group(['SalesOrders.id'])
				->autoFields(true)
				->having($having)
				->where($where)
				->order(['SalesOrders.id' => 'DESC'])
			);
		
        $this->set(compact('salesOrders','status'));
        $this->set('_serialize', ['salesOrders']);
    }
	
	
	

    /**
     * View method
     *
     * @param string|null $id Sales Order id.
     * @return \Cake\Network\Response|null
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function view($id = null)
    {
		$this->viewBuilder()->layout('index_layout');
        $salesOrder = $this->SalesOrders->get($id, [
            'contain' => ['Customers', 'Companies','Carrier','Courier','SalesOrderRows' => ['Items']]
        ]);
        $this->set('salesOrder', $salesOrder);
        $this->set('_serialize', ['salesOrder']);
    }
	
	public function pdf($id = null)
    {
		$this->viewBuilder()->layout('');
        $salesOrder = $this->SalesOrders->get($id, [
            'contain' => ['Customers', 'Companies','Carrier','Creator','Editor','Courier','Employees','SalesOrderRows' => ['Items'=>['Units']]]
        ]);

        $this->set('salesOrder', $salesOrder);
        $this->set('_serialize', ['salesOrder']);
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
		
		$quotation_id=@(int)$this->request->query('quotation');
		$quotation=array(); 
		$process_status='New';
		if(!empty($quotation_id)){
			$quotation = $this->SalesOrders->Quotations->get($quotation_id, [
				'contain' => ['QuotationRows' => ['Items']]
			]);
			$process_status='Pulled From Quotation';
		}
		$this->set(compact('quotation','process_status'));
		
        $salesOrder = $this->SalesOrders->newEntity();
        if ($this->request->is('post')) {
			
            $salesOrder = $this->SalesOrders->patchEntity($salesOrder, $this->request->data);
			
			$salesOrder->expected_delivery_date=date("Y-m-d",strtotime($salesOrder->expected_delivery_date)); 
			$salesOrder->po_date=date("Y-m-d",strtotime($salesOrder->po_date)); 
			$salesOrder->created_by=$s_employee_id; 
			
			
			$salesOrder->created_on=date("Y-m-d",strtotime($salesOrder->created_on));
			$salesOrder->edited_on=date("Y-m-d",strtotime($salesOrder->edited_on));
			
			$salesOrder->created_on_time= date('h:i:sa');
			$salesOrder->edited_on_time= date('h:i:sa');
			
            if ($this->SalesOrders->save($salesOrder)) {
				if(!empty($quotation_id)){
					$quotation->status='Converted Into Sales Order';
					$query = $this->SalesOrders->Quotations->query();
					$query->update()
						->set(['status' => 'Converted Into Sales Order'])
						->where(['id' => $quotation_id])
						->execute();
						
				}
				
                $this->Flash->success(__('The sales order has been saved.'));

                return $this->redirect(['action' => 'index']);
            } else {
                $this->Flash->error(__('The sales order could not be saved. Please, try again.'));
            }
        }
        $customers = $this->SalesOrders->Customers->find('all')->contain(['CustomerAddress'=>function($q){
			return $q
			->where(['CustomerAddress.default_address'=>1]);
		}]);
        $companies = $this->SalesOrders->Companies->find('all');
		$quotationlists = $this->SalesOrders->Quotations->find()->where(['status'=>'Pending'])->order(['Quotations.id' => 'DESC']);
		$items = $this->SalesOrders->Items->find('list');
		$transporters = $this->SalesOrders->Carrier->find('list');
		$employees = $this->SalesOrders->Employees->find('list', ['limit' => 200])->where(['dipartment_id' => 1]);
		$termsConditions = $this->SalesOrders->TermsConditions->find('all',['limit' => 200]);
		$SaleTaxes = $this->SalesOrders->SaleTaxes->find('all');
        $this->set(compact('salesOrder', 'customers', 'companies','quotationlists','items','transporters','termsConditions','serviceTaxs','exciseDuty','employees','SaleTaxes'));
        $this->set('_serialize', ['salesOrder']);
    }
	
	public function pullFromQuotation(){
		if ($this->request->is('post')) {
			$quotation_id=$this->request->data["quotation_id"];
            return $this->redirect(['action' => 'add?quotation='.$quotation_id]);
        }
	}

    /**
     * Edit method
     *
     * @param string|null $id Sales Order id.
     * @return \Cake\Network\Response|void Redirects on successful edit, renders view otherwise.
     * @throws \Cake\Network\Exception\NotFoundException When record not found.
     */
    public function edit($id = null)
    {
		$this->viewBuilder()->layout('index_layout');
        $salesOrder = $this->SalesOrders->get($id, [
            'contain' => ['SalesOrderRows' => ['Items']]
        ]);
		$s_employee_id=$this->viewVars['s_employee_id'];
		
        if ($this->request->is(['patch', 'post', 'put'])) {
            $salesOrder = $this->SalesOrders->patchEntity($salesOrder, $this->request->data);
			
			$salesOrder->expected_delivery_date=date("Y-m-d",strtotime($salesOrder->expected_delivery_date));
			$salesOrder->po_date=date("Y-m-d",strtotime($salesOrder->po_date)); 
			//$salesOrder->created_on=date("Y-m-d",strtotime($salesOrder->created_on));
			$salesOrder->date=date("Y-m-d",strtotime($salesOrder->date));
			$salesOrder->edited_by=$s_employee_id;
			$salesOrder->edited_on=date("Y-m-d");
			
			$salesOrder->edited_on_time= date('h:i:sa');
			
            if ($this->SalesOrders->save($salesOrder)) {
                $this->Flash->success(__('The sales order has been saved.'));

                return $this->redirect(['action' => 'index']);
            } else {
                $this->Flash->error(__('The sales order could not be saved. Please, try again.'));
            }
        }
        $customers = $this->SalesOrders->Customers->find('all')->contain(['CustomerAddress'=>function($q){
			return $q
			->where(['CustomerAddress.default_address'=>1]);
		}]);
        $companies = $this->SalesOrders->Companies->find('all', ['limit' => 200]);
		$quotationlists = $this->SalesOrders->Quotations->find()->where(['status'=>'Pending'])->order(['Quotations.id' => 'DESC']);
		$items = $this->SalesOrders->Items->find('list',['limit' => 200]);
		$transporters = $this->SalesOrders->Carrier->find('list', ['limit' => 200]);
		$employees = $this->SalesOrders->Employees->find('list', ['limit' => 200]);
		$termsConditions = $this->SalesOrders->TermsConditions->find('all',['limit' => 200]);
		$SaleTaxes = $this->SalesOrders->SaleTaxes->find('all');
        $this->set(compact('salesOrder', 'customers', 'companies','quotationlists','items','transporters','termsConditions','serviceTaxs','exciseDuty','employees','SaleTaxes'));
        $this->set('_serialize', ['salesOrder']);
    }

    /**
     * Delete method
     *
     * @param string|null $id Sales Order id.
     * @return \Cake\Network\Response|null Redirects to index.
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function delete($id = null)
    {
        $this->request->allowMethod(['post', 'delete']);
        $salesOrder = $this->SalesOrders->get($id);
        if ($this->SalesOrders->delete($salesOrder)) {
            $this->Flash->success(__('The sales order has been deleted.'));
        } else {
            $this->Flash->error(__('The sales order could not be deleted. Please, try again.'));
        }

        return $this->redirect(['action' => 'index']);
    }
}
