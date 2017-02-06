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
		$invoice_id=@(int)$this->request->query('Invoice');
		
		if(!empty($invoice_id)){
			$Invoice = $this->InventoryVouchers->Invoices->get($invoice_id, [
				'contain' => ['InvoiceRows'=>['Items'],'Creator', 'Companies','Customers','SalesOrders'=>['SalesOrderRows'=>['JobCardRows'=>['Items']]]]
			]);
		$job_card_data=[];
			foreach($Invoice->sales_order->sales_order_rows as $sales_order_row){
				$job_card_data[$sales_order_row->item_id]=$sales_order_row->job_card_rows;
			}
		}
		
		$last_iv_no=$this->InventoryVouchers->find()->select(['iv2'])->order(['iv2' => 'DESC'])->first();
			if($last_iv_no){
				@$last_iv_no->iv2=$last_iv_no->iv2+1;
			}else{
				@$last_iv_no->iv2=1;
			}
		
		$inventoryVoucher = $this->InventoryVouchers->newEntity();
        if ($this->request->is('post')) {
			$inventoryVoucher = $this->InventoryVouchers->patchEntity($inventoryVoucher, $this->request->data);
			//pr($inventoryVoucher); exit;
			$inventoryVoucher->iv1=$Invoice->in1;
			$inventoryVoucher->iv2=$last_iv_no->iv2;
			$inventoryVoucher->iv3=$Invoice->in3;
			$inventoryVoucher->iv4='16-17';
			$inventoryVoucher->invoice_id=$invoice_id;
			$inventoryVoucher->created_by=$s_employee_id; 
			$inventoryVoucher->company_id=$st_company_id;
			//pr($inventoryVoucher); exit;
            if ($this->InventoryVouchers->save($inventoryVoucher)) {
				//pr($inventoryVoucher); exit;
				$query = $this->InventoryVouchers->Invoices->query();
					$query->update()
						->set(['inventory_voucher_status' => 'Converted'])
						->where(['id' => $inventoryVoucher->invoice_id])
						->execute();
				
				$out_ar=[];
				foreach($inventoryVoucher->inventory_voucher_rows as $inventory_voucher_row){
					$item_id=$inventory_voucher_row->item_id;
					/*$result_ledgers=$this->InventoryVouchers->ItemLedgers->find()->where(['ItemLedgers.item_id' => $item_id,'ItemLedgers.in_out' => 'In','rate_updated' => 'Yes','company_id' => $st_company_id])->toArray(); 
			
					$j=0; $qty_total=0; $rate_total=0; $per_unit_cost=0;
					foreach($result_ledgers as $result_ledger){
						$qty=$result_ledger->quantity;
						$rate=$result_ledger->rate;
						@$total_amount=$qty*$rate;
						$rate_total=$rate_total+$total_amount;
						$qty_total=$qty_total+$qty;
						$j++;
					}
					$per_unit_cost=$rate_total/$qty_total;*/
					$Item=$this->InventoryVouchers->Items->get($item_id);
					$per_unit_cost=$Item->dynamic_cost;
					$quantity=0;
					$itemLedger = $this->InventoryVouchers->ItemLedgers->newEntity();
					$itemLedger->item_id = $inventory_voucher_row->item_id;		
					//pr(); exit;
					$quantity=$inventoryVoucher->invoice_row_quantity*$inventory_voucher_row->quantity;
					$itemLedger->quantity = $quantity;
					$itemLedger->source_model = 'Inventory Voucher';
					$itemLedger->source_id = $inventory_voucher_row->inventory_voucher_id;
					$itemLedger->in_out = 'Out';
					$itemLedger->rate = $per_unit_cost;
					$itemLedger->company_id = $st_company_id;
					$itemLedger->processed_on = date("Y-m-d");
					
					$this->InventoryVouchers->ItemLedgers->save($itemLedger);
					$results=$this->InventoryVouchers->ItemLedgers->find()->where(['ItemLedgers.item_id' => $inventory_voucher_row->item_id,'ItemLedgers.in_out' => 'In','company_id' => $st_company_id]); 
					
					foreach($results as $result){
					$items_with_rate[$inventory_voucher_row->sales_order_row_id]=@$items_with_rate[$inventory_voucher_row->sales_order_row_id]+($result->rate*$inventory_voucher_row->quantity);
					}
					
					$out_ar[$inventory_voucher_row->invoice_row_id]=@$out_ar[$inventory_voucher_row->invoice_row_id]+($per_unit_cost*$inventory_voucher_row->quantity);
				}
				
				/* foreach($out_ar as $key=>$val){
					$InvoiceRow=$this->InventoryVouchers->InvoiceRows->get($key);
					$itemLedger = $this->InventoryVouchers->ItemLedgers->newEntity();
					$itemLedger->item_id = $InvoiceRow->item_id;
					$itemLedger->quantity = $InvoiceRow->quantity;
					$itemLedger->source_model = 'Inventory Voucher';
					$itemLedger->source_id = $inventoryVoucher->id;
					$itemLedger->in_out = 'In';
					$itemLedger->rate = $val;
					$itemLedger->company_id = $st_company_id;
					$itemLedger->processed_on = date("Y-m-d");
					$this->InventoryVouchers->ItemLedgers->save($itemLedger);
				} */
				//pr($inventoryVoucher); exit;
					
			}
				$this->Flash->success(__('The inventory voucher has been saved.'));
				return $this->redirect(['action' => 'index']);
		} else { //pr($inventoryVoucher); exit;
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
				//pr($inventoryVoucher); exit;
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
