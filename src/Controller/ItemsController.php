<?php
namespace App\Controller;

use App\Controller\AppController;

/**
 * Items Controller
 *
 * @property \App\Model\Table\ItemsTable $Items
 */
class ItemsController extends AppController
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
            'contain' => ['ItemCategories','ItemGroups','ItemSubGroups','Units']
        ];
		
		$where=[];
		$item_name=$this->request->query('item_name');
		$item_category=$this->request->query('item_category');
		$item_group=$this->request->query('item_group');
		$item_subgroup=$this->request->query('item_subgroup');
		 
		$this->set(compact('item_name','item_category','item_group','item_subgroup'));
		
		if(!empty($item_name)){
			$where['Items.name LIKE']='%'.$item_name.'%';
		}
		
				if(!empty($item_category)){
			$where['ItemCategories.name LIKE']='%'.$item_category.'%';
		}
		
		if(!empty($item_group)){
			$where['ItemGroups.name LIKE']='%'.$item_group.'%';
		}
		
		
		if(!empty($item_subgroup)){
			$where['ItemSubGroups.name LIKE']='%'.$item_subgroup.'%';
		}
		
        $items = $this->paginate($this->Items->find()->where($where)->order(['Items.name' => 'ASC']));


        $this->set(compact('items'));
        $this->set('_serialize', ['items']);
    }

    /**
     * View method
     *
     * @param string|null $id Item id.
     * @return \Cake\Network\Response|null
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function view($id = null)
    {
        $item = $this->Items->get($id, [
            'contain' => [ 'Units', 'ItemUsedByCompanies']
        ]);

        $this->set('item', $item);
        $this->set('_serialize', ['item']);
    }

    /**
     * Add method
     *
     * @return \Cake\Network\Response|void Redirects on successful add, renders view otherwise.
     */
    public function add()
    {
		$this->viewBuilder()->layout('index_layout');
		$session = $this->request->session();
		$st_company_id = $session->read('st_company_id');
        $item = $this->Items->newEntity();
        if ($this->request->is('post')) {
            $item = $this->Items->patchEntity($item, $this->request->data);
			if ($this->Items->save($item)) {
				$item_id=$item->id;
				//pr($item_id); exit;
				$itemLedger = $this->Items->ItemLedgers->newEntity();
					$itemLedger->item_id = $item_id;
					$itemLedger->quantity = $item->ob_quantity;
					$itemLedger->company_id = $st_company_id;
					$itemLedger->source_model = 'Items';
					//$itemLedger->source_id = $grn->id;
					$itemLedger->in_out = 'In';
					$itemLedger->processed_on = date("Y-m-d");
					$this->Items->ItemLedgers->save($itemLedger);
					
				if($item->serial_number_enable=="1"){
					foreach($item->serial_numbers as $serial_number) {
						$ItemSerialNumber = $this->Items->ItemSerialNumbers->newEntity();
						$ItemSerialNumber->item_id = $item->id;
						$ItemSerialNumber->serial_no = $serial_number[0];
						$ItemSerialNumber->status = 'In';
						$ItemSerialNumber->master_item_id = $item->id;
						$this->Items->ItemSerialNumbers->save($ItemSerialNumber);
					}
				}
				
				
                $this->Flash->success(__('The item has been saved.'));

                return $this->redirect(['action' => 'index']);
            } else { pr($item); exit;
                $this->Flash->error(__('The item could not be saved. Please, try again.'));
            }
        }
		$ItemCategories = $this->Items->ItemCategories->find('list');
        $units = $this->Items->Units->find('list');
		$Companies = $this->Items->Companies->find('list');
		//$sources = $this->Items->Sources->find('list', ['Sources' => 200]);
        $this->set(compact('item','ItemCategories', 'units', 'Companies','sources'));
        $this->set('_serialize', ['item']);

    }

    /**
     * Edit method
     *
     * @param string|null $id Item id.
     * @return \Cake\Network\Response|void Redirects on successful edit, renders view otherwise.
     * @throws \Cake\Network\Exception\NotFoundException When record not found.
     */
    public function edit($id = null)
    {
		$this->viewBuilder()->layout('index_layout');
        $item = $this->Items->get($id, [
            'contain' => ['Companies']
        ]);
        if ($this->request->is(['patch', 'post', 'put'])) {
            $item = $this->Items->patchEntity($item, $this->request->data);
            if ($this->Items->save($item)) {
                $this->Flash->success(__('The item has been saved.'));

                return $this->redirect(['action' => 'index']);
            } else {
                $this->Flash->error(__('The item could not be saved. Please, try again.'));
            }
        }
		$ItemCategories = $this->Items->ItemCategories->find('list');
		$ItemGroups = $this->Items->ItemGroups->find('list')->where(['item_category_id'=>$item->item_category_id]);
		$ItemSubGroups = $this->Items->ItemSubGroups->find('list')->where(['item_group_id'=>$item->item_group_id]);
        $units = $this->Items->Units->find('list');
		$Companies = $this->Items->Companies->find('list');
		//$sources = $this->Items->Sources->find('list', ['Sources' => 200]);
        $this->set(compact('item','ItemCategories','ItemGroups','ItemSubGroups', 'units', 'Companies'));
        $this->set('_serialize', ['item']);
    }

    /**
     * Delete method
     *
     * @param string|null $id Item id.
     * @return \Cake\Network\Response|null Redirects to index.
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function delete($id = null)
    {
        $this->request->allowMethod(['post', 'delete']);
		$QuotationRowsexists = $this->Items->QuotationRows->exists(['item_id' => $id]);
		$SalesOrderRowsexists = $this->Items->SalesOrderRows->exists(['item_id' => $id]);
		$InvoiceRowsexists = $this->Items->InvoiceRows->exists(['item_id' => $id]);
		if(!$QuotationRowsexists and !$SalesOrderRowsexists and !$InvoiceRowsexists){
			$item = $this->Items->get($id);
			if ($this->Items->delete($item)) {
				$this->Flash->success(__('The item has been deleted.'));
			} else {
				$this->Flash->error(__('The item could not be deleted. Please, try again.'));
			}			
		}elseif($QuotationRowsexists){
			$this->Flash->error(__('Once the item has used in quotation, the item cannot be deleted.'));
		}elseif($SalesOrderRowsexists){
			$this->Flash->error(__('Once the item has used in sales-order, the item cannot be deleted.'));
		}elseif($InvoiceRowsexists){
			$this->Flash->error(__('Once the item has used in invoice, the item cannot be deleted.'));
		}
        

        return $this->redirect(['action' => 'index']);
    }
}
