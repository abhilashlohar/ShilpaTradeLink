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
    public function index()
    {
		$this->viewBuilder()->layout('index_layout');
        $this->paginate = [
            'contain' => ['SalesOrders', 'Companies']
        ];
        $jobCards = $this->paginate($this->JobCards);
		
		$material_indent=$this->request->query('material-indent');
		pr($material_indent); exit;
		if(!empty($material_indent)){
			$jobCard=$this->paginate(
				$this->JobCards->find()->contain(['JobCardRows'])
			);
		}

        $this->set(compact('jobCards','material_indent'));
        $this->set('_serialize', ['jobCards']);
    }

    /**
     * View method
     *
     * @param string|null $id Job Card id.
     * @return \Cake\Network\Response|null
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function view($id = null)
    {
		$this->viewBuilder()->layout('index_layout');
        $jobCard = $this->JobCards->get($id, [
            'contain' => ['SalesOrders', 'Companies', 'JobCardRows']
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
		//pr($st_company_id); exit;
		$sales_order_id=@(int)$this->request->query('Sales-Order');
		if(!empty($sales_order_id)){
			$salesOrder = $this->JobCards->SalesOrders->get($sales_order_id, [
				'contain' => ['Customers','SalesOrderRows'=>['Items'=>function ($q){
					return $q->where(['Items.source !='=>'Purchessed']);
				}]]
			]);
		}

		
        $jobCard = $this->JobCards->newEntity();
        if ($this->request->is('post')) {
			$jobCard = $this->JobCards->patchEntity($jobCard, $this->request->data);
			//pr($jobCard); exit;
			$jobCard->required_date=date("Y-m-d",strtotime($jobCard->required_date)); 
			$jobCard->created_by=$s_employee_id; 
			$jobCard->sales_order_id=$sales_order_id;
			$jobCard->company_id=$st_company_id;
			$jobCard->customer_id=$s_employee_id;
			$jobCard->customer_po_no=$jobCard->customer_po_no;
			$jobCard->created_on=date("Y-m-d");
			
			//pr($jobCard); exit;
			if ($this->JobCards->save($jobCard)) {
		
                $this->Flash->success(__('The job card has been saved.'));

                return $this->redirect(['action' => 'index']);
            } else { 
                $this->Flash->error(__('The job card could not be saved. Please, try again.'));
            }
        }
		

		//$customers = $this->JobCards->Customers->find('all');
		$items = $this->JobCards->Items->find('list');
        $companies = $this->JobCards->Companies->find('list', ['limit' => 200]);
        $this->set(compact('jobCard', 'salesOrder', 'companies','items','customers'));
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
        $jobCard = $this->JobCards->get($id, [
            'contain' => []
        ]);
        if ($this->request->is(['patch', 'post', 'put'])) {
            $jobCard = $this->JobCards->patchEntity($jobCard, $this->request->data);
            if ($this->JobCards->save($jobCard)) {
                $this->Flash->success(__('The job card has been saved.'));

                return $this->redirect(['action' => 'index']);
            } else {
                $this->Flash->error(__('The job card could not be saved. Please, try again.'));
            }
        }
        $salesOrders = $this->JobCards->SalesOrders->find('list', ['limit' => 200]);
        $companies = $this->JobCards->Companies->find('list', ['limit' => 200]);
        $this->set(compact('jobCard', 'salesOrders', 'companies'));
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
}
