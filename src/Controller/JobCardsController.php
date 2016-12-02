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
        $this->paginate = [
            'contain' => ['Companies', 'Customers', 'SalesOrders']
        ];
        $jobCards = $this->paginate($this->JobCards);

        $this->set(compact('jobCards'));
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
        $jobCard = $this->JobCards->get($id, [
            'contain' => ['Companies', 'Customers', 'SalesOrders', 'JobCardRows']
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
		$sales_order_id=@(int)$this->request->query('job');
		
		$sales_order=array(); $process_status='New';
		if(!empty($sales_order_id)){
			$sales_order = $this->JobCards->SalesOrders->get($sales_order_id, [
				'contain' => [
						'SalesOrderRows.Items' => function ($q) {
						   return $q
								->where(['SalesOrderRows.quantity > SalesOrderRows.processed_quantity']);
						},'Companies','Customers','Employees'
					]
			]);
			$process_status='Pulled From Sales-Order';
		}
		$this->set(compact('sales_order','process_status','sales_order_id'));
		
		$jobCard = $this->JobCards->newEntity();
        if ($this->request->is('post')) {
            $jobCard = $this->JobCards->patchEntity($jobCard, $this->request->data);
			pr($jobCard); exit;
            if ($this->JobCards->save($jobCard)) {
				
                $this->Flash->success(__('The job card has been saved.'));

                return $this->redirect(['action' => 'index']);
            } else {
                $this->Flash->error(__('The job card could not be saved. Please, try again.'));
            }
        }
		$items = $this->JobCards->Items->find('list');
        $companies = $this->JobCards->Companies->find('list', ['limit' => 200]);
        $customers = $this->JobCards->Customers->find('list', ['limit' => 200]);
        //$salesOrders = $this->JobCards->SalesOrders->find('list', ['limit' => 200]);
        $this->set(compact('jobCard', 'companies', 'customers', 'salesOrders','items'));
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
        $companies = $this->JobCards->Companies->find('list', ['limit' => 200]);
        $customers = $this->JobCards->Customers->find('list', ['limit' => 200]);
        $salesOrders = $this->JobCards->SalesOrders->find('list', ['limit' => 200]);
        $this->set(compact('jobCard', 'companies', 'customers', 'salesOrders'));
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
