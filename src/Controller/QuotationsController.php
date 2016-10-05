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

	public function initialize()
	{
		parent::initialize();
		$this->loadComponent('Csrf');
	}
    /**
     * Index method
     *
     * @return \Cake\Network\Response|null
     */
    public function index($status=null)
    {
		$this->viewBuilder()->layout('index_layout');
		$where=[];
		$ref_no=$this->request->query('ref_no');
		$customer=$this->request->query('customer');
		$salesman=$this->request->query('salesman');
		$product=$this->request->query('product');
		$From=$this->request->query('From');
		$To=$this->request->query('To');
		$page=$this->request->query('page');
		$this->set(compact('ref_no','customer','salesman','product','From','To','page'));
		if(!empty($ref_no)){
			$ref_no_arr=explode('/',$ref_no);
			if(!empty($ref_no_arr[0])){
				$where['qt1 LIKE']='%'.$ref_no_arr[0].'%';
			}
			if(!empty($ref_no_arr[2])){
				$where['qt3 LIKE']='%'.$ref_no_arr[2].'%';
			}
			if(!empty($ref_no_arr[3])){
				$where['qt4 LIKE']='%'.$ref_no_arr[3].'%';
			}
			
		}
		if(!empty($customer)){
			$where['customers.customer_name LIKE']='%'.$customer.'%';
		}
		if(!empty($salesman)){
			$where['employees.name LIKE']='%'.$salesman.'%';
		}
		if(!empty($product)){
			$where['categories.name LIKE']='%'.$product.'%';
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
            'contain' => ['Customers','Employees','Categories']
        ];
		if($status==null or $status=='Pending'){
			$where['status']='Pending';
		}elseif($status=='Converted Into Sales Order'){
			$where['status']='Converted Into Sales Order';
		}
		//pr($where); exit;
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
            'contain' => ['Customers','Companies','Employees','Categories','QuotationRows' => ['Items']]
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
            'contain' => ['Customers','Companies','Employees','Categories','QuotationRows' => ['Items'=>['Units']]]
        ]);

        $this->set('quotation', $quotation);
        $this->set('_serialize', ['quotation']);
    }

    /**
     * Add method
     *
     * @return \Cake\Network\Response|void Redirects on successful add, renders view otherwise.
     */
    public function add()
    {
		$this->viewBuilder()->layout('index_layout');
        $quotation = $this->Quotations->newEntity();
		
        if ($this->request->is('post')) {
			
			$this->request->data["finalisation_date"]=date("Y-m-d",strtotime($this->request->data["finalisation_date"]));
            $quotation = $this->Quotations->patchEntity($quotation, $this->request->data);
			$quotation->date=date('y-m-d');
			
            if ($this->Quotations->save($quotation)) {
                return $this->redirect(['action' => 'confirm/'.$quotation->id]);
            } else {
                $this->Flash->error(__('The quotation could not be saved. Please, try again.'));
            }
        }
        $customers = $this->Quotations->Customers->find('all');
		$companies = $this->Quotations->Companies->find('all',['limit' => 200]);
		$employees = $this->Quotations->Employees->find('list', ['limit' => 200])->where(['dipartment_id' => 1]);
		$Categories = $this->Quotations->Categories->find('treeList',['limit' => 200]);
		$items = $this->Quotations->Items->find('list',['limit' => 200]);
		$termsConditions = $this->Quotations->TermsConditions->find('all',['limit' => 200]);
		
        $this->set(compact('quotation', 'customers','companies','employees','Categories','items','termsConditions'));
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
		
        if ($this->request->is(['patch', 'post', 'put'])) {
            $quotation = $this->Quotations->patchEntity($quotation, $this->request->data);
			$quotation->finalisation_date=date("Y-m-d",strtotime($quotation->finalisation_date));
			$quotation->ref_no=$quotation->alias.'/'.$quotation->ref.'/'.$quotation->yr;
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
		$Categories = $this->Quotations->Categories->find('treeList',['limit' => 200]);
		$items = $this->Quotations->Items->find('list',['limit' => 200]);
		$termsConditions = $this->Quotations->TermsConditions->find('all',['limit' => 200]);
		
        $this->set(compact('quotation', 'customers','companies','employees','Categories','items','termsConditions'));
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
	
}
