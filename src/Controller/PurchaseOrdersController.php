<?php
namespace App\Controller;

use App\Controller\AppController;

/**
 * PurchaseOrders Controller
 *
 * @property \App\Model\Table\PurchaseOrdersTable $PurchaseOrders
 */
class PurchaseOrdersController extends AppController
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
        $this->paginate = [
            'contain' => ['Companies', 'Vendors']
        ];
		$pull_request=$this->request->query('pull-request');
		
        //$purchaseOrders = $this->paginate($this->PurchaseOrders);
		
		if($status==null or $status=='Pending'){
			$having=['total_rows >' => 0];
		}elseif($status=='Converted-Into-GRN'){
			$having=['total_rows =' => 0];
		}
		
		$purchaseOrders=$this->paginate(
			$this->PurchaseOrders->find()->select(['total_rows' => 
				$this->PurchaseOrders->find()->func()->count('PurchaseOrderRows.id')])
				->leftJoinWith('PurchaseOrderRows', function ($q) {
					return $q->where(['PurchaseOrderRows.processed_quantity < PurchaseOrderRows.quantity']);
				})
				->group(['PurchaseOrders.id'])
				->autoFields(true)
				->having($having)
				->order(['PurchaseOrders.id' => 'DESC'])
			);

        $this->set(compact('purchaseOrders','pull_request','status'));
        $this->set('_serialize', ['purchaseOrders']);
		$this->set(compact('url'));
    }

    /**
     * View method
     *
     * @param string|null $id Purchase Order id.
     * @return \Cake\Network\Response|null
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function view($id = null)
    {
		$this->viewBuilder()->layout('index_layout');
        $purchaseOrder = $this->PurchaseOrders->get($id, [
            'contain' => ['Companies', 'Vendors', 'Grns', 'PurchaseOrderRows']
        ]);

        $this->set('purchaseOrder', $purchaseOrder);
        $this->set('_serialize', ['purchaseOrder']);
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
        $purchaseOrder = $this->PurchaseOrders->newEntity();
        if ($this->request->is('post')) {
			
            $purchaseOrder = $this->PurchaseOrders->patchEntity($purchaseOrder, $this->request->data);
			$purchaseOrder->delivery_date=date("Y-m-d",strtotime($purchaseOrder->delivery_date));
			$purchaseOrder->created_by=$s_employee_id; 
			$purchaseOrder->sale_tax_description=$purchaseOrder->sale_tax_description; 
			
			$purchaseOrder->date_created=date("Y-m-d",strtotime($purchaseOrder->date_created));
            if ($this->PurchaseOrders->save($purchaseOrder)) {
				//pr($purchaseOrder->discount_per);exit;
                $this->Flash->success(__('The purchase order has been saved.'));

                return $this->redirect(['action' => 'index']);
            } else {
                $this->Flash->error(__('The purchase order could not be saved. Please, try again.'));
            }
        }
        $companies = $this->PurchaseOrders->Companies->find();
		$filenames = $this->PurchaseOrders->Filenames->find('list', ['valueField' => function ($row) {
				return $row['file1'] . '-' . $row['file2'];
			},
			'keyField' => function ($row) {
				return $row['file1'] . '-' . $row['file2'];
			}])->where(['file1' => 'BE']);
        $vendors = $this->PurchaseOrders->Vendors->find('list');
		$SaleTaxes = $this->PurchaseOrders->SaleTaxes->find('all');
		
		$items = $this->PurchaseOrders->PurchaseOrderRows->Items->find('list');
		$transporters = $this->PurchaseOrders->Transporters->find('list');
        $this->set(compact('purchaseOrder', 'companies', 'vendors','filenames','items','SaleTaxes','transporters'));
        $this->set('_serialize', ['purchaseOrder']);
    }

    /**
     * Edit method
     *
     * @param string|null $id Purchase Order id.
     * @return \Cake\Network\Response|void Redirects on successful edit, renders view otherwise.
     * @throws \Cake\Network\Exception\NotFoundException When record not found.
     */
    public function edit($id = null)
    {
		$this->viewBuilder()->layout('index_layout');
		$s_employee_id=$this->viewVars['s_employee_id'];
        $purchaseOrder = $this->PurchaseOrders->get($id, [
            'contain' => ['PurchaseOrderRows']
        ]);
        if ($this->request->is(['patch', 'post', 'put'])) {
			
            $purchaseOrder = $this->PurchaseOrders->patchEntity($purchaseOrder, $this->request->data);
			$purchaseOrder->date_created=date("Y-m-d",strtotime($purchaseOrder->date_created));
			$purchaseOrder->delivery_date=date("Y-m-d",strtotime($purchaseOrder->delivery_date));
            if ($this->PurchaseOrders->save($purchaseOrder)) {
                $this->Flash->success(__('The purchase order has been saved.'));

                return $this->redirect(['action' => 'index']);
            } else {
                $this->Flash->error(__('The purchase order could not be saved. Please, try again.'));
            }
        }
		$companies = $this->PurchaseOrders->Companies->find();
		$filenames = $this->PurchaseOrders->Filenames->find('list', ['valueField' => function ($row) {
				return $row['file1'] . '-' . $row['file2'];
			},
			'keyField' => function ($row) {
				return $row['file1'] . '-' . $row['file2'];
			}])->where(['file1' => 'BE']);
		$vendors = $this->PurchaseOrders->Vendors->find('list');
		$SaleTaxes = $this->PurchaseOrders->SaleTaxes->find('all');
		$items = $this->PurchaseOrders->PurchaseOrderRows->Items->find('list');
		$transporters = $this->PurchaseOrders->Transporters->find('list');
       
        $this->set(compact('purchaseOrder', 'companies', 'vendors','filenames','SaleTaxes','transporters','items'));
        $this->set('_serialize', ['purchaseOrder']);
    }

    /**
     * Delete method
     *
     * @param string|null $id Purchase Order id.
     * @return \Cake\Network\Response|null Redirects to index.
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function delete($id = null)
    {
        $this->request->allowMethod(['post', 'delete']);
        $purchaseOrder = $this->PurchaseOrders->get($id);
        if ($this->PurchaseOrders->delete($purchaseOrder)) {
            $this->Flash->success(__('The purchase order has been deleted.'));
        } else {
            $this->Flash->error(__('The purchase order could not be deleted. Please, try again.'));
        }

        return $this->redirect(['action' => 'index']);
    }
	
		public function pdf($id = null)
    {
		$this->viewBuilder()->layout('');
         $purchaseOrder = $this->PurchaseOrders->get($id, [
            'contain' => ['Companies','Vendors','PurchaseOrderRows','Transporters','Creator']
			]);

        $this->set('purchaseOrder', $purchaseOrder);
        $this->set('_serialize', ['purchaseOrder']);
    }
	
	public function confirm($id = null)
    {
		$this->viewBuilder()->layout('pdf_layout');
		
        $this->set('id', $id);
    }

}
