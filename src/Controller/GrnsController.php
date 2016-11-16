<?php
namespace App\Controller;

use App\Controller\AppController;

/**
 * Grns Controller
 *
 * @property \App\Model\Table\GrnsTable $Grns
 */
class GrnsController extends AppController
{

    /**
     * Index method
     *
     * @return \Cake\Network\Response|null
     */
    public function index()
    {
        $this->paginate = [
            'contain' => ['PurchaseOrders', 'Companies']
        ];
        $grns = $this->paginate($this->Grns);

        $this->set(compact('grns'));
        $this->set('_serialize', ['grns']);
    }

    /**
     * View method
     *
     * @param string|null $id Grn id.
     * @return \Cake\Network\Response|null
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function view($id = null)
    {
        $grn = $this->Grns->get($id, [
            'contain' => ['PurchaseOrders', 'Companies', 'GrnRows', 'InvoiceBookings']
        ]);

        $this->set('grn', $grn);
        $this->set('_serialize', ['grn']);
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
		
		$purchase_order_id=@(int)$this->request->query('purchase-order');
		
		$purchase_order=array();
		
		if(!empty($purchase_order_id)){
			$purchase_order = $this->Grns->PurchaseOrders->get($purchase_order_id, [
				'contain' => [
						'PurchaseOrderRows.Items' => function ($q) {
						   return $q
								->where(['PurchaseOrderRows.quantity > PurchaseOrderRows.processed_quantity']);
						},'Companies','Vendors'
					]
			]);
			$process_status='Pulled From Purchase-Order';
		}
		$this->set(compact('purchase_order','sales_order_id'));
		
		
        $grn = $this->Grns->newEntity();
        if ($this->request->is('post')) {
            $grn = $this->Grns->patchEntity($grn, $this->request->data);
            if ($this->Grns->save($grn)) {
                $this->Flash->success(__('The grn has been saved.'));

                return $this->redirect(['action' => 'index']);
            } else {
                $this->Flash->error(__('The grn could not be saved. Please, try again.'));
            }
        }
		$items = $this->Grns->Items->find('all');
		$customers = $this->Grns->Customers->find('all');
        $companies = $this->Grns->Companies->find('all');
        $purchaseOrders = $this->Grns->PurchaseOrders->find('all');
		
        
        $this->set(compact('grn', 'purchaseOrders', 'companies','customers'));
        $this->set('_serialize', ['grn']);
    }

    /**
     * Edit method
     *
     * @param string|null $id Grn id.
     * @return \Cake\Network\Response|void Redirects on successful edit, renders view otherwise.
     * @throws \Cake\Network\Exception\NotFoundException When record not found.
     */
    public function edit($id = null)
    {
        $grn = $this->Grns->get($id, [
            'contain' => []
        ]);
        if ($this->request->is(['patch', 'post', 'put'])) {
            $grn = $this->Grns->patchEntity($grn, $this->request->data);
            if ($this->Grns->save($grn)) {
                $this->Flash->success(__('The grn has been saved.'));

                return $this->redirect(['action' => 'index']);
            } else {
                $this->Flash->error(__('The grn could not be saved. Please, try again.'));
            }
        }
        $purchaseOrders = $this->Grns->PurchaseOrders->find('list', ['limit' => 200]);
        $companies = $this->Grns->Companies->find('list', ['limit' => 200]);
        $this->set(compact('grn', 'purchaseOrders', 'companies'));
        $this->set('_serialize', ['grn']);
    }

    /**
     * Delete method
     *
     * @param string|null $id Grn id.
     * @return \Cake\Network\Response|null Redirects to index.
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function delete($id = null)
    {
        $this->request->allowMethod(['post', 'delete']);
        $grn = $this->Grns->get($id);
        if ($this->Grns->delete($grn)) {
            $this->Flash->success(__('The grn has been deleted.'));
        } else {
            $this->Flash->error(__('The grn could not be deleted. Please, try again.'));
        }

        return $this->redirect(['action' => 'index']);
    }
}
