<?php
namespace App\Controller;

use App\Controller\AppController;

/**
 * Quotations Controller
 *
 * @property \App\Model\Table\QuotationsTable $Quotations
 */
class QuotationsController extends AppController
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
		 
		 $copy_request=$this->request->query('copy-request');
		// pr ($copy_request);exit;
		
		$this->viewBuilder()->layout('index_layout');
		$where=[];
		$company_alise=$this->request->query('company_alise');
		$id=$this->request->query('id');
		//pr ($id); exit;
		$file=$this->request->query('file');
		$customer=$this->request->query('customer');
		$salesman=$this->request->query('salesman');
		$product=$this->request->query('product');
		$From=$this->request->query('From');
		$To=$this->request->query('To');
		$pull_request=$this->request->query('pull-request');
		$this->set(compact('id','customer','salesman','product','From','To','company_alise','file','pull_request'));
		if(!empty($company_alise)){
			$where['Quotations.qt1 LIKE']='%'.$company_alise.'%';
		}
		if(!empty($id)){
			$where['Quotations.id LIKE']='%'.$id;
			//pr($where);exit;
		}
		if(!empty($file)){
			$where['Quotations.qt3 LIKE']='%'.$file.'%';
		}
		if(!empty($customer)){
			$where['Customers.customer_name LIKE']='%'.$customer.'%';
		}
		if(!empty($salesman)){
			$where['Employees.name LIKE']='%'.$salesman.'%';
		}
		if(!empty($product)){
			$where['ItemGroups.name LIKE']='%'.$product.'%';
		}
		if(!empty($From)){
			$From=date("Y-m-d",strtotime($this->request->query('From')));
			$where['finalisation_date >=']=$From;
		}
		if(!empty($To)){
			$To=date("Y-m-d",strtotime($this->request->query('To')));
			$where['finalisation_date <=']=$To;
		}
        $this->paginate = [
            'contain' => ['Customers','Employees','ItemGroups']
        ];
		if($status==null or $status=='Pending'){
			$where['status']='Pending';
		}elseif($status=='Converted Into Sales Order'){
			$where['status']='Converted Into Sales Order';
		}elseif($status=='Closed'){
			$where['status']='Closed';
		}
		
        $quotations = $this->paginate($this->Quotations->find()->where($where)->order(['Quotations.id' => 'DESC']));
        $this->set(compact('quotations','status','copy_request'));
        $this->set('_serialize', ['quotations']);
		$this->set(compact('url'));
	
		 
    }
	
	 public function exportExcel($status=null)
    {
		
		$this->viewBuilder()->layout('');
		$where=[];
		$company_alise=$this->request->query('company_alise');
		$quotation_no=$this->request->query('quotation_no');
		$file=$this->request->query('file');
		$customer=$this->request->query('customer');
		$salesman=$this->request->query('salesman');
		$product=$this->request->query('product');
		$From=$this->request->query('From');
		$To=$this->request->query('To');
		$pull_request=$this->request->query('pull-request');
		$this->set(compact('quotation_no','customer','salesman','product','From','To','company_alise','file','pull_request'));
		if(!empty($company_alise)){
			$where['Quotations.qt1 LIKE']='%'.$company_alise.'%';
		}
		if(!empty($quotation_no)){
			$where['Quotations.id ']=$quotation_no;
		}
		if(!empty($file)){
			$where['Quotations.qt3 LIKE']='%'.$file.'%';
		}
		if(!empty($customer)){
			$where['Customers.customer_name LIKE']='%'.$customer.'%';
		}
		if(!empty($salesman)){
			$where['Employees.name LIKE']='%'.$salesman.'%';
		}
		if(!empty($product)){
			$where['ItemGroups.name LIKE']='%'.$product.'%';
		}
		if(!empty($From)){
			$From=date("Y-m-d",strtotime($this->request->query('From')));
			$where['finalisation_date >=']=$From;
		}
		if(!empty($To)){
			$To=date("Y-m-d",strtotime($this->request->query('To')));
			$where['finalisation_date <=']=$To;
		}
        $this->paginate = [
            'contain' => ['Customers','Employees','ItemGroups']
        ];
		if($status==null or $status=='Pending'){
			$where['status']='Pending';
		}elseif($status=='Converted Into Sales Order'){
			$where['status']='Converted Into Sales Order';
		}elseif($status=='Closed'){
			$where['status']='Closed';
		}
	
        $quotations = $this->paginate($this->Quotations->find()->where($where)->order(['Quotations.id' => 'DESC']));
        $this->set(compact('quotations','status'));
        $this->set('_serialize', ['quotations']);
    }
	
	
	
	public function ConvertedQuotation()
    {
		$this->viewBuilder()->layout('index_layout');
        $this->paginate = [
            'contain' => ['Customers']
        ];
        $quotations = $this->paginate($this->Quotations);
		$start = $this->Paginator->counter(array('format' => '%start%'));

        $this->set(compact('quotations'));
        $this->set('_serialize', ['quotations']);
    }

    /**
     * View method
     *
     * @param string|null $id Quotation id.
     * @return \Cake\Network\Response|null
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function view($id = null)
    {
		$this->viewBuilder()->layout('index_layout');
        $quotation = $this->Quotations->get($id, [
            'contain' => ['Customers','Companies','Employees','ItemGroups','QuotationRows' => ['Items']]
        ]);
		
		
		

        $this->set('quotation', $quotation);
	
        $this->set('_serialize', ['quotation']);
    }
	
	public function confirm($id = null)
    {
		$this->viewBuilder()->layout('pdf_layout');
		
        $this->set('id', $id);
    }
	
	public function email($id = null)
    {
		$this->viewBuilder()->layout('');
    }
	
	public function pdf($id = null)
    {
		$this->viewBuilder()->layout('');
        $quotation = $this->Quotations->get($id, [
            'contain' => ['Customers','Companies','Employees'=>['Designations'],'ItemGroups','Creator'=>['Designations'],'Editor'=>['Designations'],'QuotationRows' => ['Items'=>['Units']]]
        ]);

        $this->set('quotation', $quotation);
        $this->set('_serialize', ['quotation']);
    }

    /**
     * Add method
     *
     * @return \Cake\Network\Response|void Redirects on successful add, renders view otherwise.
     */
    public function add($id = null)
    {
		$this->viewBuilder()->layout('index_layout');
        $quotation = $this->Quotations->newEntity();
		
		 $copy=$this->request->query('copy');
		//pr ($copy); exit;
		
		$s_employee_id=$this->viewVars['s_employee_id'];
		
        if ($this->request->is('post')) {
			
            $quotation = $this->Quotations->patchEntity($quotation, $this->request->data);
			$quotation->created_by=$s_employee_id;
			$quotation->created_on=date("Y-m-d",strtotime($quotation->created_on));
			$quotation->finalisation_date=date("Y-m-d",strtotime($quotation->finalisation_date));
			
            if ($this->Quotations->save($quotation)) {
                return $this->redirect(['action' => 'confirm/'.$quotation->id]);
            } else {
                $this->Flash->error(__('The quotation could not be saved. Please, try again.'));
            }
        }
        $customers = $this->Quotations->Customers->find('all');
		$companies = $this->Quotations->Companies->find('all');
		$employees = $this->Quotations->Employees->find('list', ['limit' => 200])->where(['dipartment_id' => 1]);
		$ItemGroups = $this->Quotations->ItemGroups->find('list');
		$items = $this->Quotations->Items->find('list');
		$termsConditions = $this->Quotations->TermsConditions->find('all',['limit' => 200]);
		
        $this->set(compact('quotation', 'customers','companies','employees','ItemGroups','items','termsConditions'));
        $this->set('_serialize', ['quotation']);
    }

    /**
     * Edit method
     *
     * @param string|null $id Quotation id.
     * @return \Cake\Network\Response|void Redirects on successful edit, renders view otherwise.
     * @throws \Cake\Network\Exception\NotFoundException When record not found.
     */
    public function edit($id = null)
    {
		$this->viewBuilder()->layout('index_layout');
        $quotation = $this->Quotations->get($id, [
            'contain' => ['QuotationRows']
        ]);
		
		$s_employee_id=$this->viewVars['s_employee_id'];
		
        if ($this->request->is(['patch', 'post', 'put'])) {
        	$this->request->data["finalisation_date"]=date("Y-m-d",strtotime($this->request->data["finalisation_date"]));
            $quotation = $this->Quotations->patchEntity($quotation, $this->request->data);
			$quotation->created_on=date("Y-m-d",strtotime($quotation->created_on));
			$quotation->ref_no=$quotation->alias.'/'.$quotation->ref.'/'.$quotation->yr;
			$quotation->edited_by=$s_employee_id;
			$quotation->edited_on=date("Y-m-d");
			
            if ($this->Quotations->save($quotation)) {
                $this->Flash->success(__('The quotation has been saved.'));

                return $this->redirect(['action' => 'index']);
            } else {
                $this->Flash->error(__('The quotation could not be saved. Please, try again.'));
            }
        }
        $customers = $this->Quotations->Customers->find('all');
		$companies = $this->Quotations->Companies->find('all',['limit' => 200]);
		$employees = $this->Quotations->Employees->find('list', ['limit' => 200])->where(['dipartment_id' => 1]);
		$ItemGroups = $this->Quotations->ItemGroups->find('list');
		$items = $this->Quotations->Items->find('list',['limit' => 200]);
		$termsConditions = $this->Quotations->TermsConditions->find('all',['limit' => 200]);
		
        $this->set(compact('quotation', 'customers','companies','employees','ItemGroups','items','termsConditions'));
        $this->set('_serialize', ['quotation']);
    }

    /**
     * Delete method
     *
     * @param string|null $id Quotation id.
     * @return \Cake\Network\Response|null Redirects to index.
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function delete($id = null)
    {
        $this->request->allowMethod(['post', 'delete']);
        $quotation = $this->Quotations->get($id);
        if ($this->Quotations->delete($quotation)) {
            $this->Flash->success(__('The quotation has been deleted.'));
        } else {
            $this->Flash->error(__('The quotation could not be deleted. Please, try again.'));
        }

        return $this->redirect(['action' => 'index']);
    }
	
	public function close($id = null)
    {
        $this->request->allowMethod(['post', 'close']);
        $quotation = $this->Quotations->get($id);
		
		$quotation->status='Closed';
        if ($this->Quotations->save($quotation)) {
            $this->Flash->success(__('The quotation has been closed.'));
        } else {
            $this->Flash->error(__('The quotation could not be closed. Please, try again.'));
        }

        return $this->redirect(['action' => 'index']);
    }
	
}
