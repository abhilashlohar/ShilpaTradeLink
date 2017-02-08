<?php
namespace App\Controller;

use App\Controller\AppController;

/**
 * InventoryVouchers Controller
 *
 * @property \App\Model\Table\InventoryVouchersTable $InventoryVouchers
 */
class InventoryVouchersController extends AppController
{

    /**
     * Index method
     *
     * @return \Cake\Network\Response|null
     */
    public function index()
    {
		$this->viewBuilder()->layout('index_layout');
		$session = $this->request->session();
		$st_company_id = $session->read('st_company_id');
        $this->paginate = [
            'contain' => ['InventoryVoucherRows']
        ];
        $inventoryVouchers = $this->paginate($this->InventoryVouchers->find()->where(['company_id'=>$st_company_id])->order(['InventoryVouchers.id' => 'DESC']));

        $this->set(compact('inventoryVouchers'));
        $this->set('_serialize', ['inventoryVouchers']);
    }

    /**
     * View method
     *
     * @param string|null $id Inventory Voucher id.
     * @return \Cake\Network\Response|null
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function view($id = null)
    {
		$this->viewBuilder()->layout('index_layout');
	   $inventoryVoucher = $this->InventoryVouchers->get($id, [
            'contain' =>  ['SalesOrders'=>['SalesOrderRows'=>['InventoryVoucherRows','Items'=>function ($q){
					return $q->where(['SalesOrderRows.source_type != ' => 'Purchessed','Items.source !='=>'Purchessed']);
				},'InventoryVoucherRows'=>['Items']]],'Creator', 'Companies']
        ]);
		
		 $this->set('inventoryVoucher', $inventoryVoucher);
        $this->set('_serialize', ['inventoryVoucher']);
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
		$invoice_id=@(int)$this->request->query('invoice');
		$item_id=@(int)$this->request->query('item_id');
		$invoice_data=$this->InventoryVouchers->Invoices->get($invoice_id);
		
		if(empty($item_id) && !empty($invoice_id)){
			$row=$this->InventoryVouchers->Invoices->get($invoice_id, [
				'contain' => ['InvoiceRows'=> function ($q) {
				return $q->where(['inventory_voucher_status '=>'Pending']);
				}]]);
			$invoice_row = $row->invoice_rows[0];
			$item_id=$invoice_row->item_id;
			$invoice_row_id=$invoice_row->id;
		}
		$item = $this->InventoryVouchers->Items->get($item_id);
 		$inventoryVouchers = $this->InventoryVouchers->InventoryVoucherRows->find()->where(['invoice_id'=>$invoice_id,'left_item_id'=>$item_id]);
			
			if($inventoryVouchers->count()==0){
				$Invoice = $this->InventoryVouchers->Invoices->get($invoice_id);
				$sales_order_id=$Invoice->sales_order_id;
				$SalesOrderRow=$this->InventoryVouchers->SalesOrderRows->find()->where(['sales_order_id'=>$sales_order_id,'item_id'=>$item_id])->first();
				$SalesOrderRowID=$SalesOrderRow->id;
				
				$JobCardRows=$this->paginate(
				$this->InventoryVouchers->JobCardRows->find()->contain(['Items'=>['ItemSerialNumbers'=>		function ($q) {  return $q
								->where(['ItemSerialNumbers.status' => 'In' ]); }]])
				->where(['sales_order_id'=>$sales_order_id,'sales_order_row_id'=>$SalesOrderRowID])
				);	 
 			}else{ 
				$InventoryVoucherRows=$this->paginate(
				$this->InventoryVouchers->InventoryVoucherRows->find()->contain(['Items'=>['ItemSerialNumbers'=>		function ($q) {  return $q
								->where(['ItemSerialNumbers.status' => 'In' ]); }]])
				->where(['invoice_id'=>$invoice_id,'left_item_id'=>$item_id])
				);
 			}
  		 $this->set(compact('JobCardRows','InventoryVoucherRows','item','invoice_row','row'));
		 $inventoryVoucher = $this->InventoryVouchers->newEntity();
         if ($this->request->is('post')) {
			$inventoryVoucher = $this->InventoryVouchers->patchEntity($inventoryVoucher, $this->request->data);
 				$inventoryVoucher->iv1=$invoice_data->in1;
 				$inventoryVoucher->iv3=$invoice_data->in3;
				$inventoryVoucher->iv4='16-17';
				$inventoryVoucher->invoice_id=$invoice_id;
				$inventoryVoucher->created_by=$s_employee_id; 
				$inventoryVoucher->company_id=$st_company_id;
 				foreach($inventoryVoucher->inventory_voucher_rows as $inventory_voucher_row){
					$inventory_voucher_row->invoice_id=$invoice_id;
					$inventory_voucher_row->left_item_id=$item_id;
				} 
		if ($this->InventoryVouchers->save($inventoryVoucher)) { 
				
				foreach($inventoryVoucher->inventory_voucher_rows as $inventory_voucher_row){
 					foreach($inventory_voucher_row->item_serial_numbers as $item_serial_number){
  					$query = $this->InventoryVouchers->ItemSerialNumbers->query();
						$query->update()
							->set(['status' => 'Out','inventory_voucher_id' => $inventory_voucher_row->inventory_voucher_id])
							->where(['id' => $item_serial_number])
							->execute();
					}
				}
 				$query = $this->InventoryVouchers->InvoiceRows->query();
				$query->update()
						->set(['inventory_voucher_status' => 'Done'])
						->where(['id' => $invoice_row_id])
						->execute();
 				$row=$this->InventoryVouchers->Invoices->get($invoice_id, [
						'contain' => ['InvoiceRows'=> function ($q) {
							return $q->where(['inventory_voucher_status '=>'Pending']);
							}]]);
							$total=sizeof($row->invoice_rows);
				if($total>0) {
						$invoice_row = $row->invoice_rows[0];
						$item_id=$invoice_row->item_id;
						$this->Flash->success(__('The inventory voucher has been saved.'));
						return $this->redirect(['action' => 'Add?Invoice='.$invoice_id.'&item_id='.$item_id]);
				} else {
						$this->Flash->success(__('The inventory voucher has been saved.'));
						return $this->redirect(['action' => 'Index']);
				}
		} }else {  
			$this->Flash->error(__('The inventory voucher could not be saved. Please, try again.'));
		}
    
		$items = $this->InventoryVouchers->Items->find('list')->where(['source IN'=>['Purchessed','Purchessed/Manufactured']]);
        //$invoiceRows = $this->InventoryVouchers->InvoiceRows->find('list', ['limit' => 200]);
        $this->set(compact('inventoryVoucher', 'Invoice','items','last_iv_no','job_card_data'));
        $this->set('_serialize', ['inventoryVoucher']);
    }

    /**
     * Edit method
     *
     * @param string|null $id Inventory Voucher id.
     * @return \Cake\Network\Response|void Redirects on successful edit, renders view otherwise.
     * @throws \Cake\Network\Exception\NotFoundException When record not found.
     */
    public function edit($id = null)
    { 	$this->viewBuilder()->layout('index_layout');
		$s_employee_id=$this->viewVars['s_employee_id'];
		$session = $this->request->session();
		$st_company_id = $session->read('st_company_id');
		$inventoryVoucher = $this->InventoryVouchers->get($id);
		$invoice_id=$inventoryVoucher->invoice_id;
		//pr($invoice_id); exit;
        $Invoice = $this->InventoryVouchers->Invoices->get($invoice_id, [
				'contain' => ['InvoiceRows'=>['Items'],'Creator', 'Companies','Customers']
			]);
		$inventoryVoucher = $this->InventoryVouchers->get($id, [
				'contain' => ['InventoryVoucherRows'=>['Items'],'Creator', 'Companies']
			]);
		//pr($Invoice); exit;
		//pr($inventoryVoucher->sales_order->sales_order_rows->inventory_voucher_rows[0]); exit;
        if ($this->request->is(['patch', 'post', 'put'])) {
            $inventoryVoucher = $this->InventoryVouchers->patchEntity($inventoryVoucher, $this->request->data);
			$inventoryVoucher->sales_order_id=$inventoryVoucher->sales_order_id;
			
            if ($this->InventoryVouchers->save($inventoryVoucher)) {
				//pr($inventoryVoucher->q); exit;
				$inventoryVoucher->iv1=$inventoryVoucher->iv1;
				$inventoryVoucher->iv2=$inventoryVoucher->iv2;
				$inventoryVoucher->iv3=$inventoryVoucher->iv3;
				$inventoryVoucher->iv4='16-17';
				$inventoryVoucher->invoice_id=$invoice_id;
				$inventoryVoucher->created_by=$s_employee_id; 
				$inventoryVoucher->company_id=$st_company_id;
				
				$query = $this->InventoryVouchers->ItemLedgers->query();
				$query->delete()
					->where(['ItemLedgers.source_id' => $inventoryVoucher->id,'source_model' =>'Inventory Voucher'])
					->execute();
						foreach($inventoryVoucher->inventory_voucher_rows as $inventory_voucher_row){
						$quantity=0;
						
						$itemLedger = $this->InventoryVouchers->ItemLedgers->newEntity();
						
						$itemLedger->item_id = $inventory_voucher_row->item_id;		
						//pr(); exit;
						$quantity=$inventoryVoucher->invoice_row_quantity*$inventory_voucher_row->quantity;
						$itemLedger->quantity = $quantity;
						$itemLedger->source_model = 'Inventory Voucher';
						$itemLedger->source_id = $inventory_voucher_row->inventory_voucher_id;
						$itemLedger->in_out = 'Out';
						$itemLedger->rate = '0.00';
						$itemLedger->company_id = $st_company_id;
						$itemLedger->processed_on = date("Y-m-d");
						//pr($itemLedger); exit;
						$this->InventoryVouchers->ItemLedgers->save($itemLedger);
						$results=$this->InventoryVouchers->ItemLedgers->find()->where(['ItemLedgers.item_id' => $inventory_voucher_row->item_id,'ItemLedgers.in_out' => 'In','company_id' => $st_company_id]); 
						
					foreach($results as $result){
						
						$items_with_rate[$inventory_voucher_row->sales_order_row_id]=@$items_with_rate[$inventory_voucher_row->sales_order_row_id]+($result->rate*$inventory_voucher_row->quantity);
					}
					}
					
					/* foreach($inventoryVoucher->sales_order->sales_order_rows as $sales_order_row ){
						$amount=$items_with_rate[$sales_order_row->id];
						$update_rate=$amount/$sales_order_row->quantity;
						
						$itemLedger = $this->InventoryVouchers->ItemLedgers->newEntity();	
						$itemLedger->item_id=$sales_order_row->item_id;
						$itemLedger->quantity =$sales_order_row->quantity;
						$itemLedger->source_model = 'Inventory Voucher';
						$itemLedger->source_id = $inventoryVoucher->id;
						$itemLedger->in_out = 'In';
						$itemLedger->rate = $update_rate;
						$itemLedger->company_id = $st_company_id;
						$itemLedger->processed_on = date("Y-m-d");
						$this->InventoryVouchers->ItemLedgers->save($itemLedger);
						
					}  */
					
				//pr($inventoryVoucher); exit;
                $this->Flash->success(__('The inventory voucher has been saved.'));
			

                return $this->redirect(['action' => 'index']);
            } else { 
                $this->Flash->error(__('The inventory voucher could not be saved. Please, try again.'));
            }
        }
        $items = $this->InventoryVouchers->Items->find('list')->where(['source IN'=>['Purchessed','Purchessed/Manufactured']]);
        $this->set(compact('inventoryVoucher', 'Invoice', 'invoiceRows','items'));
        $this->set('_serialize', ['inventoryVoucher']);
    }

    /**
     * Delete method
     *
     * @param string|null $id Inventory Voucher id.
     * @return \Cake\Network\Response|null Redirects to index.
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function delete($id = null)
    {
        $this->request->allowMethod(['post', 'delete']);
        $inventoryVoucher = $this->InventoryVouchers->get($id);
        if ($this->InventoryVouchers->delete($inventoryVoucher)) {
            $this->Flash->success(__('The inventory voucher has been deleted.'));
        } else {
            $this->Flash->error(__('The inventory voucher could not be deleted. Please, try again.'));
        }

        return $this->redirect(['action' => 'index']);
    }
}
