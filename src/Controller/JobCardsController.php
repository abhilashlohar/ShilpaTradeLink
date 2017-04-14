<?php
namespace App\Controller;

use App\Controller\AppController;

/**
 * JobCards Controller
 *
 * @property \App\Model\Table\JobCardsTable $JobCards
 */
class JobCardsController extends AppController
{

    /**
     * Index method
     *
     * @return \Cake\Network\Response|null
     */
    public function index($status=null)
    {
		$this->viewBuilder()->layout('index_layout');
		$session = $this->request->session();
		$st_company_id = $session->read('st_company_id');
		if($status==null or $status=='Pending'){
			$where['status']='Pending';
		}elseif($status=='Closed'){
			$where['status']='Closed';
		}
		$inventory_voucher_status=$this->request->query('inventory_voucher');
		//pr($inventory_voucher_status); exit;
        $this->paginate = [
            'contain' => ['SalesOrders']
        ];
		if($inventory_voucher_status=='true'){
			$jobCards = $this->paginate($this->JobCards->find()->where(['status' => 'Pending','JobCards.company_id'=>$st_company_id]));
		}else{
			$jobCards = $this->paginate($this->JobCards->find()->where($where)->where(['JobCards.company_id'=>$st_company_id])->order(['JobCards.id' => 'DESC']));
		}
        $this->set(compact('jobCards','status'));
        $this->set('_serialize', ['jobCards']);
    }

    /**
     *   method
     *
     * @param string|null $id Job Card id.
     * @return \Cake\Network\Response|null
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function view($id = null)
    {
		$this->viewBuilder()->layout('index_layout');
        $jobCard = $this->JobCards->get($id, [
            'contain' => ['SalesOrders'=>['SalesOrderRows'=>['Items'=>function ($q){
					return $q->where(['SalesOrderRows.source_type != ' => 'Purchessed','Items.source !='=>'Purchessed']);
				},'JobCardRows'=>['Items']]],'Creator', 'Companies','Customers']
        ]);
        $this->set('jobCard', $jobCard);
        $this->set('_serialize', ['jobCard']);
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
		$session = $this->request->session();
		$st_company_id = $session->read('st_company_id');
		$sales_order_id=@(int)$this->request->query('sales-order');
		if(!empty($sales_order_id)){
			$salesOrder = $this->JobCards->SalesOrders->get($sales_order_id, [
				'contain' => ['Customers','SalesOrderRows'=>['Items'=>function ($q){
					return $q->where(['SalesOrderRows.source_type != ' => 'Purchessed','Items.source !='=>'Purchessed']);
				}]]
			]);
		}
		
		$last_jc_no=$this->JobCards->find()->select(['jc2'])->where(['company_id' => $st_company_id])->order(['jc2' => 'DESC'])->first();
			if($last_jc_no){
				@$last_jc_no->jc2=$last_jc_no->jc2+1;
			}else{
				@$last_jc_no->jc2=1;
			}
		$jobCard = $this->JobCards->newEntity();
        if ($this->request->is('post')) {
			$jobCard = $this->JobCards->patchEntity($jobCard, $this->request->data);
			
			$jobCard->required_date=date("Y-m-d",strtotime($jobCard->required_date)); 
			//pr($jobCard->required_date); exit;
			$jobCard->created_by=$s_employee_id; 
			$jobCard->sales_order_id=$sales_order_id;
			$jobCard->company_id=$st_company_id;
			$jobCard->customer_po_no=$jobCard->customer_po_no;
			$jobCard->created_on=date("Y-m-d");
			$jobCard->status='Pending';
			foreach($jobCard->job_card_rows as $job_card_row){
					$job_card_row->sales_order_id=$sales_order_id;
				}
			if ($this->JobCards->save($jobCard)) {
					$query = $this->JobCards->SalesOrders->query();
					$query->update()
						->set(['job_card_status' => 'Converted'])
						->where(['id' => $jobCard->sales_order_id])
						->execute();
                $this->Flash->success(__('The job card has been saved.'));

				return $this->redirect(['action' => 'view/'.$jobCard->id]);
            } else { 
                $this->Flash->error(__('The job card could not be saved. Please, try again.'));
            }
        }
		$items = $this->JobCards->Items->find('list')->where(['source IN'=>['Purchessed','Purchessed/Manufactured']])->order(['Items.name' => 'ASC'])->matching(
					'ItemCompanies', function ($q) use($st_company_id) {
						return $q->where(['ItemCompanies.company_id' => $st_company_id,'ItemCompanies.freeze' => 0]);
					}
				);
        $companies = $this->JobCards->Companies->find('list', ['limit' => 200]);
        $this->set(compact('jobCard', 'salesOrder', 'companies','items','customers','last_jc_no'));
        $this->set('_serialize', ['jobCard']);
    }

    /**
     * Edit method
     *
     * @param string|null $id Job Card id.
     * @return \Cake\Network\Response|void Redirects on successful edit, renders view otherwise.
     * @throws \Cake\Network\Exception\NotFoundException When record not found.
     */
    public function edit($id = null)
    {
		$this->viewBuilder()->layout('index_layout');
		$s_employee_id=$this->viewVars['s_employee_id'];
		$session = $this->request->session();
		$st_company_id = $session->read('st_company_id');
		
		$jobCard = $this->JobCards->get($id, [
            'contain' => ['SalesOrders'=>['SalesOrderRows'=>['Items'=>function ($q){
					return $q->where(['SalesOrderRows.source_type != ' => 'Purchessed','Items.source !='=>'Purchessed']);
				},'JobCardRows'=>['Items']]],'Creator', 'Companies','Customers']
        ]);
		
	
		$Em = new FinancialYearsController;
	    $financial_year_data = $Em->checkFinancialYear($jobCard->created_on);
				
        if ($this->request->is(['patch', 'post', 'put'])) {
            $jobCard = $this->JobCards->patchEntity($jobCard, $this->request->data);
			$jobCard->required_date=date("Y-m-d",strtotime($jobCard->required_date)); 
			$jobCard->created_by=$s_employee_id; 
			$jobCard->company_id=$st_company_id;
			$jobCard->customer_po_no=$jobCard->customer_po_no;
			
			$jobCard->created_on=date("Y-m-d");
			$jobCard->sales_order_id=$jobCard->sales_order->id;
			foreach($jobCard->job_card_rows as $job_card_row){
					$job_card_row->sales_order_id=$jobCard->sales_order_id;
				}
			
            if ($this->JobCards->save($jobCard)) {
				$query = $this->JobCards->SalesOrders->query();
					$query->update()
						->set(['job_card_status' => 'Converted'])
						->where(['id' => $jobCard->sales_order_id])
						->execute();
                $this->Flash->success(__('The job card has been saved.'));
				return $this->redirect(['action' => 'view/'.$jobCard->id]);
            } else { 
                $this->Flash->error(__('The job card could not be saved. Please, try again.'));
            }
        }
		
		$items = $this->JobCards->Items->find('list')->where(['source IN'=>['Purchessed','Purchessed/Manufactured']])->order(['Items.name' => 'ASC'])->matching(
					'ItemCompanies', function ($q) use($st_company_id) {
						return $q->where(['ItemCompanies.company_id' => $st_company_id,'ItemCompanies.freeze' => 0]);
					}
				);
        $this->set(compact('jobCard', 'salesOrders', 'companies','items','financial_year_data'));
        $this->set('_serialize', ['jobCard']);
    }

    /**
     * Delete method
     *
     * @param string|null $id Job Card id.
     * @return \Cake\Network\Response|null Redirects to index.
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function delete($id = null)
    {
        $this->request->allowMethod(['post', 'delete']);
        $jobCard = $this->JobCards->get($id);
        if ($this->JobCards->delete($jobCard)) {
            $this->Flash->success(__('The job card has been deleted.'));
        } else {
            $this->Flash->error(__('The job card could not be deleted. Please, try again.'));
        }
        return $this->redirect(['action' => 'index']);
    }
	
	public function PendingSalesorderForJobcard()
    {
		$this->viewBuilder()->layout('index_layout');
		$session = $this->request->session();
		$st_company_id = $session->read('st_company_id');
		
		$this->paginate = [
            'contain' => ['Customers','JobCards','SalesOrderRows'=>['Items'=>function ($q){
				return $q->where(['Items.source'=>'Purchessed/Manufactured']);
			}]]
        ];
		
		$SalesOrders=$this->paginate(
			$this->JobCards->SalesOrders->find()->select(['total_rows' => 
				$this->JobCards->SalesOrders->find()->func()->count('SalesOrderRows.id')])
					->matching(
						'SalesOrderRows.Items', function ($q) {
							return $q->where(['Items.source !='=>'Purchessed']);
						}
					)
					->group(['SalesOrders.id'])
					->autoFields(true)
					->having(['total_rows >' => 0])
					->where(['job_card_status'=>'Pending'])
					->where(['SalesOrders.company_id'=>$st_company_id])
					->order(['SalesOrders.id' => 'DESC'])
			);
			
		
	
		$this->set(compact('SalesOrders'));
        $this->set('_serialize', ['jobCard']);
    }
	public function PreAdd()
    {
		$this->viewBuilder()->layout('index_layout');
		$sales_order_id=$this->request->query('sales-order');
		$sales_order_id=$this->request->query('sales-order');
		
		$jobCard = $this->JobCards->SalesOrders->get($sales_order_id, [
            'contain' => ['Customers','SalesOrderRows'=>['Items'=>function ($q){
					return $q->where(['Items.source' => 'Purchessed/Manufactured']);
				}]]
        ]);
		
		if ($this->request->is(['patch', 'post', 'put'])) {
            $jobCard = $this->JobCards->patchEntity($jobCard, $this->request->data);
            if ($this->JobCards->save($jobCard)) {
					foreach($jobCard->sales_order_rows as $sales_order_row ){
						$query = $this->JobCards->SalesOrders->SalesOrderRows->query();
							$query->update()
							->set(['source_type' =>$sales_order_row['source_type']])
							->where(['id' => $sales_order_row['id']])
							->execute();
					} 
		
                $this->Flash->success(__('The job card has been saved.'));
                $this->redirect(['controller' =>'JobCards','action' => 'Add?Sales-Order='.$sales_order_id]);
            } else { 
                $this->Flash->error(__('The job card could not be saved. Please, try again.'));
            }
        }
        
        $this->set(compact('jobCard'));
        $this->set('_serialize', ['jobCards']);
	
	}
	public function PreEdit()
    {
		$this->viewBuilder()->layout('index_layout');
		$sales_order_id=$this->request->query('sales-order');
		$id=$this->request->query('job-card');
		
		$jobCard = $this->JobCards->SalesOrders->get($sales_order_id, [
            'contain' => ['Customers','SalesOrderRows'=>['Items'=>function ($q){
					return $q->where(['Items.source'=>'Purchessed/Manufactured']);
				}]]
        ]);
		
		
		if ($this->request->is(['patch', 'post', 'put'])) {
            $jobCard = $this->JobCards->patchEntity($jobCard, $this->request->data);
            if ($this->JobCards->save($jobCard)) {
				
					foreach($jobCard->sales_order_rows as $sales_order_row ){
						if($sales_order_row['source_type']=="Purchessed"){
							$this->JobCards->JobCardRows->deleteAll(['sales_order_row_id' => $sales_order_row['id']]);
						}
						$query = $this->JobCards->SalesOrders->SalesOrderRows->query();
							$query->update()
							->set(['source_type' =>$sales_order_row['source_type']])
							->where(['id' => $sales_order_row['id']])
							->execute();
					} 
		
                $this->Flash->success(__('The job card has been saved.'));
                $this->redirect(['controller' =>'JobCards','action' => 'Edit/'.$id]);
            } else { 
                $this->Flash->error(__('The job card could not be saved. Please, try again.'));
            }
        }
        
        $this->set(compact('jobCard'));
        $this->set('_serialize', ['jobCards']);
	
	}
	
	public function close($id = null)
    {
        $this->request->allowMethod(['post', 'delete']);
		$JobCard = $this->JobCards->get($id);
		$JobCard->status="Closed";
		if ($this->JobCards->save($JobCard)) {
			$this->Flash->success(__('The job card has closed.'));
		} else {
			$this->Flash->error(__('The job card could not be closed. Please, try again.'));
		}
		
        
        return $this->redirect(['action' => 'index']);
    }
}
