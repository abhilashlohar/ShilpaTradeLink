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
    public function index($status=null)
    {
		$this->viewBuilder()->layout('index_layout');
		
		$session = $this->request->session();
		$st_company_id = $session->read('st_company_id');
        $this->paginate = [
            'contain' => ['PurchaseOrders', 'Companies','Vendors']
        ];
		$pull_request=$this->request->query('pull-request');

      
		$where=[];
		if($status==null or $status=='Pending'){
			$where['status']='Pending';
		}elseif($status=='Invoice-Booked'){
			$where['status']='Invoice-Booked';
		}
		
		$grns = $this->paginate($this->Grns->find()->where($where)->where(['Grns.company_id'=>$st_company_id]));
        $this->set(compact('grns','pull_request','status'));
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
		$this->viewBuilder()->layout('index_layout');
		$grn = $this->Grns->get($id, [
            'contain' => ['PurchaseOrders', 'Companies', 'GrnRows'=>['Items'], 'InvoiceBookings','Creator']
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
		}
		$this->set(compact('purchase_order'));
		$session = $this->request->session();
		$st_company_id = $session->read('st_company_id');
		 $grn = $this->Grns->newEntity();
        if ($this->request->is('post')) {
            $grn = $this->Grns->patchEntity($grn, $this->request->data);
			 $grn->vendor_id=$purchase_order->vendor_id;
			$last_grn_no=$this->Grns->find()->select(['grn2'])->where(['company_id' => $st_company_id])->order(['grn2' => 'DESC'])->first();
			if($last_grn_no){
				$grn->grn2=$last_grn_no->grn2+1;
			}else{
				$grn->grn2=1;
			}

			$grn->date_created=date("Y-m-d");
			$grn->purchase_order_id=$purchase_order_id;
			$grn->company_id=$st_company_id ;
			$grn->created_by=$this->viewVars['s_employee_id'];
			
			
            if ($this->Grns->save($grn)) {
					if(!empty($purchase_order_id)){
						$grn->check=array_filter($grn->check);
						$i=0; 
						
						foreach($grn->check as $purchase_order_row_id){
							$qty=$grn->grn_rows[$i]['quantity'];
							$item_id=$grn->grn_rows[$i]['item_id'];
							
							$PurchaseOrderRows = $this->Grns->PurchaseOrderRows->get($purchase_order_row_id);
							$PurchaseOrderRows->processed_quantity=$PurchaseOrderRows->processed_quantity+$qty;
							$this->Grns->PurchaseOrderRows->save($PurchaseOrderRows);
							$i++;
							
							//Insert in Item Ledger//
							$itemLedger = $this->Grns->ItemLedgers->newEntity();
							$itemLedger->item_id = $item_id;
							$itemLedger->quantity = $qty;
							$itemLedger->company_id = $grn->company_id;
							$itemLedger->source_model = 'Grns';
							$itemLedger->source_id = $grn->id;
							$itemLedger->in_out = 'In';
							$itemLedger->processed_on = date("Y-m-d");
							$this->Grns->ItemLedgers->save($itemLedger);
						} 
						
					} 
					
					$this->Flash->success(__('The grn has been saved.'));

					return $this->redirect(['action' => 'index']);
				} else {
					$this->Flash->error(__('The grn could not be saved. Please, try again.'));
				}
			}
		$items = $this->Grns->Items->find('list');
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
	
		$this->viewBuilder()->layout('index_layout');
			$grn = $this->Grns->get($id, [
				'contain' => [
						'Companies','Vendors','PurchaseOrders'=>['PurchaseOrderRows','Grns'=>['GrnRows']],'GrnRows'=>['Items']
					]
			]);
		
			if ($this->request->is(['patch', 'post', 'put'])) {
            $grn = $this->Grns->patchEntity($grn, $this->request->data);
				if ($this->Grns->save($grn)) {
					foreach($grn->grn_rows as $grn_row){
							$qty=$grn_row->quantity;
							$item_id=$grn_row->item_id;
							$query = $this->Grns->ItemLedgers->query();
							$query->update()
							->set(['quantity' => $qty])
							->where(['item_id' => $item_id, 'source_id' => $grn->id, 'source_model'=> 'Grns'])
							->execute();
					}
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
