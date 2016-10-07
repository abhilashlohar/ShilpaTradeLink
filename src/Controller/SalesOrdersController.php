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
		$this->viewBuilder()->layout('index_layout');
        $this->paginate = [
            'contain' => ['Customers', 'Companies']
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
            'contain' => ['Customers', 'Companies','Carrier','Courier','Employees','SalesOrderRows' => ['Items']]
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
		
		$quotation_id=@(int)$this->request->query('quotation');
		$quotation=array(); $process_status='New';
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
			$salesOrder->date=date("Y-m-d",strtotime($salesOrder->date));
			$salesOrder->expected_delivery_date=date("Y-m-d",strtotime($salesOrder->expected_delivery_date));
			$salesOrder->po_date=date("Y-m-d",strtotime($salesOrder->po_date));
			
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
        $customers = $this->SalesOrders->Customers->find('list', ['limit' => 200]);
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
        if ($this->request->is(['patch', 'post', 'put'])) {
            $salesOrder = $this->SalesOrders->patchEntity($salesOrder, $this->request->data);
			$salesOrder->expected_delivery_date=date("Y-m-d",strtotime($salesOrder->expected_delivery_date));
			$salesOrder->po_date=date("Y-m-d",strtotime($salesOrder->po_date));
            if ($this->SalesOrders->save($salesOrder)) {
                $this->Flash->success(__('The sales order has been saved.'));

                return $this->redirect(['action' => 'index']);
            } else {
                $this->Flash->error(__('The sales order could not be saved. Please, try again.'));
            }
        }
        $customers = $this->SalesOrders->Customers->find('list', ['limit' => 200]);
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
