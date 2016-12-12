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
		
		
		$session = $this->request->session();
		$st_company_id = $session->read('st_company_id');
		
		$this->viewBuilder()->layout('index_layout');
		$where=[];
		$company_id=$this->request->query('company_id');
		$qt2=$this->request->query('qt2');
		$file=$this->request->query('file');
		$customer=$this->request->query('customer');
		$salesman=$this->request->query('salesman');
		$product=$this->request->query('product');
		$From=$this->request->query('From');
		$To=$this->request->query('To');
		$q_dateFrom=$this->request->query('q_dateFrom');
		$q_dateTo=$this->request->query('q_dateTo');
		$pull_request=$this->request->query('pull-request');
		$this->set(compact('qt2','customer','salesman','product','From','To','q_dateFrom','q_dateTo','company_id','file','pull_request'));
		if(!empty($company_id)){
			$where['company_id']=$company_id;
		}
		if(!empty($qt2)){
			$where['qt2 LIKE']='%'.$qt2.'%';
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
		if(!empty($q_dateFrom)){
			$q_dateFrom=date("Y-m-d",strtotime($this->request->query('q_dateFrom')));
			$where['created_on >=']=$q_dateFrom;
		}
		if(!empty($q_dateTo)){
			$q_dateTo=date("Y-m-d",strtotime($this->request->query('q_dateTo')));
			$where['created_on <=']=$q_dateTo;
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
		//pr($where); exit;
        $quotations = $this->paginate($this->Quotations->find()->where($where)->where(['company_id'=>$st_company_id])->order(['Quotations.id' => 'DESC']));
		
		$companies = $this->Quotations->Companies->find('list');
		
		$closeReasons = $this->Quotations->QuotationCloseReasons->find('all',['limit' => 200]);
        $this->set(compact('quotations','status','copy_request','companies','closeReasons'));
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
		$quotation = $this->Quotations->get($id, [
            'contain' => ['QuotationRows']
			]);
		if ($this->request->is(['patch', 'post', 'put'])) {
            foreach($this->request->data['quotation_rows'] as $quotation_row_id=>$value){
				$quotationRow=$this->Quotations->QuotationRows->get($quotation_row_id);
				$quotationRow->height=$value["height"];
				$this->Quotations->QuotationRows->save($quotationRow);
			}
			return $this->redirect(['action' => 'confirm/'.$id]);
        }
		
		$this->set(compact('quotation','id'));
        
    }
	
	public function email($id = null)
    {
		$this->viewBuilder()->layout('');
    }
	
	public function pdf($id = null)
    {
		$this->viewBuilder()->layout('');
        $quotation = $this->Quotations->get($id, [
            'contain' => ['Customers'=>['CustomerContacts'=>function($q){
			return $q
			->where(['CustomerContacts.default_contact'=>1]);
		}],'Companies','Employees'=>['Designations'],'ItemGroups','Creator'=>['Designations'],'Editor'=>['Designations'],'QuotationRows' => ['Items'=>['Units']]]
        ]);
		//pr($quotation); exit;
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
        $copy=$this->request->query('copy');
		//pr ($copy); exit;
		
		$revision=$this->request->query('revision');
		
		$id=$this->request->query('copy');
		
		if(!empty($id)){
			$quotation = $this->Quotations->get($id, [
				'contain' => ['QuotationRows']
			]);
		}elseif(!empty($revision)){
			$quotation = $this->Quotations->get($revision, [
				'contain' => ['QuotationRows']
			]);
		}else{
			$quotation = $this->Quotations->newEntity();
		}
		
		$s_employee_id=$this->viewVars['s_employee_id'];
		$s_employee_id=$this->viewVars['s_employee_id'];
		
		$session = $this->request->session();
		$st_company_id = $session->read('st_company_id');
		$Company = $this->Quotations->Companies->get($st_company_id);
		
        if ($this->request->is(['patch', 'post', 'put'])) {
			$quotation = $this->Quotations->newEntity();
            $quotation = $this->Quotations->patchEntity($quotation, $this->request->data);
			$last_qt_no=$this->Quotations->find()->select(['qt2'])->where(['company_id' => $st_company_id])->order(['qt2' => 'DESC'])->first();
			if($last_qt_no){
				$quotation->qt2=$last_qt_no->qt2+1;
			}else{
				$quotation->qt2=1;
			}
			
			$quotation->created_by=$s_employee_id;
			$quotation->created_on=date("Y-m-d",strtotime($quotation->created_on));
			$quotation->finalisation_date=date("Y-m-d",strtotime($quotation->finalisation_date));
			$quotation->company_id=$st_company_id;
            if ($this->Quotations->save($quotation)) {
				
                return $this->redirect(['action' => 'confirm/'.$quotation->id]);
            } else {
                $this->Flash->error(__('The quotation could not be saved. Please, try again.'));
            }
        }
		$Filenames = $this->Quotations->Filenames->find()->where(['customer_id' => $quotation->customer_id]);
		//pr($Filenames->file1); exit;

		$copy=$this->request->query('copy');
        $customers = $this->Quotations->Customers->find('all');
		$companies = $this->Quotations->Companies->find('all');
		$employees = $this->Quotations->Employees->find('list', ['limit' => 200])->where(['dipartment_id' => 1]);
		$ItemGroups = $this->Quotations->ItemGroups->find('list');
		$items = $this->Quotations->Items->find('list');
		$items = $this->Quotations->Items->find('list')->where(['freeze'=>0])->matching(
					'ItemCompanies', function ($q) use($st_company_id) {
						return $q->where(['ItemCompanies.company_id' => $st_company_id]);
					}
				);
		$termsConditions = $this->Quotations->TermsConditions->find('all',['limit' => 200]);
		
        $this->set(compact('quotation', 'customers','companies','employees','Filenames','ItemGroups','items','termsConditions','copy','Company'));
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
		$session = $this->request->session();
		$st_company_id = $session->read('st_company_id');
		$Company = $this->Quotations->Companies->get($st_company_id);
		
        if ($this->request->is(['patch', 'post', 'put'])) {
        	$this->request->data["finalisation_date"]=date("Y-m-d",strtotime($this->request->data["finalisation_date"]));
            $quotation = $this->Quotations->patchEntity($quotation, $this->request->data);
			$quotation->created_by=$s_employee_id;
			$quotation->created_on=date("Y-m-d",strtotime($quotation->created_on));
			$quotation->finalisation_date=date("Y-m-d",strtotime($quotation->finalisation_date));
			$quotation->company_id=$st_company_id;
			
            if ($this->Quotations->save($quotation)) {
				//pr($quotation); exit;
                $this->Flash->success(__('The quotation has been saved.'));

                return $this->redirect(['action' => 'confirm/'.$quotation->id]);
            } else {
                $this->Flash->error(__('The quotation could not be saved. Please, try again.'));
            }
        }
		$Filenames = $this->Quotations->Filenames->find()->where(['customer_id' => $quotation->customer_id]);
        $customers = $this->Quotations->Customers->find('all');
		$companies = $this->Quotations->Companies->find('all',['limit' => 200]);
		$employees = $this->Quotations->Employees->find('list', ['limit' => 200])->where(['dipartment_id' => 1]);
		$ItemGroups = $this->Quotations->ItemGroups->find('list');
		$items = $this->Quotations->Items->find('list')->where(['freeze'=>0])->matching(
					'ItemCompanies', function ($q) use($st_company_id) {
						return $q->where(['ItemCompanies.company_id' => $st_company_id]);
					}
				);
		$termsConditions = $this->Quotations->TermsConditions->find('all',['limit' => 200]);
		
        $this->set(compact('quotation', 'customers','companies','employees','ItemGroups','items','termsConditions','Filenames'));
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
	
	public function close($id = null,$reason=null)
    {
        $quotation = $this->Quotations->get($id);
		$quotation_reason=$this->Quotations->QuotationCloseReasons->get($reason);
		$quotation->reason=$quotation_reason->reason;
		$quotation->status='Closed';
		$quotation->closing_date=date("Y-m-d");
		 if ($this->Quotations->save($quotation)) {
            $this->Flash->success(__('The quotation has been closed.'));
        } else {
            $this->Flash->error(__('The quotation could not be closed. Please, try again.'));
        }

        return $this->redirect(['action' => 'index']);
    }
	
		
	public function reopen($id = null)
    {
        $quotation = $this->Quotations->get($id);
		$quotation->reason='';
		$quotation->status='Pending';
		 if ($this->Quotations->save($quotation)) {
            $this->Flash->success(__('The quotation has been reopened.'));
        } else {
            $this->Flash->error(__('The quotation could not be Reopened. Please, try again.'));
        }

        return $this->redirect(['action' => 'index']);
    }
	
}
