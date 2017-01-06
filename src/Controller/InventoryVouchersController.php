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
        $this->paginate = [
            'contain' => ['InventoryVoucherRows','InvoiceRows'=>['Items']]
        ];
        $inventoryVouchers = $this->paginate($this->InventoryVouchers->find()->order(['InventoryVouchers.id' => 'DESC']));

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
            'contain' => ['Companies','Invoices','Items','Creator','InvoiceRows','InventoryVoucherRows'=>['Items']]
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
		
		$jobcard_id=@(int)$this->request->query('jobcard');
		if(!empty($jobcard_id)){
			$jobCards = $this->InventoryVouchers->JobCards->get($jobcard_id, [
		'contain' => ['SalesOrders'=>['SalesOrderRows'=>['Items','JobCardRows'=>['Items']]],'Creator', 'Companies','Customers']
			]);
			//pr($salesOrder); exit;
		}
		$inventoryVoucher = $this->InventoryVouchers->newEntity();
		//pr($this->request->data); exit;
		$last_iv_no=$this->InventoryVouchers->find()->select(['iv2'])->order(['iv2' => 'DESC'])->first();
			if($last_iv_no){
				@$last_iv_no->iv2=$last_iv_no->iv2+1;
			}else{
				@$last_iv_no->iv2=1;
			}
		
        if ($this->request->is('post')) {
			
            
			//pr($inventoryVoucher->invoice_row_id); exit;
            if ($this->InventoryVouchers->save($inventoryVoucher)) {
				
				$InvoiceRow->inventory_voucher='Done';
				$this->InventoryVouchers->InvoiceRows->save($InvoiceRow);
                $this->Flash->success(__('The inventory voucher has been saved.'));

                return $this->redirect(['action' => 'index']);
            } else { //pr($inventoryVoucher); exit;
                $this->Flash->error(__('The inventory voucher could not be saved. Please, try again.'));
            }
        }
		
		
        $items = $this->InventoryVouchers->Items->find('list', ['limit' => 200]);
        //$invoiceRows = $this->InventoryVouchers->InvoiceRows->find('list', ['limit' => 200]);
        $this->set(compact('inventoryVoucher', 'jobCards','items','last_iv_no'));
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
        $inventoryVoucher = $this->InventoryVouchers->get($id, [
            'contain' => ['Items','Invoices','InventoryVoucherRows']
        ]);
        if ($this->request->is(['patch', 'post', 'put'])) {
            $inventoryVoucher = $this->InventoryVouchers->patchEntity($inventoryVoucher, $this->request->data);
            if ($this->InventoryVouchers->save($inventoryVoucher)) {
                $this->Flash->success(__('The inventory voucher has been saved.'));

                return $this->redirect(['action' => 'index']);
            } else {
                $this->Flash->error(__('The inventory voucher could not be saved. Please, try again.'));
            }
        }
		
        $invoices = $this->InventoryVouchers->Invoices->find('list', ['limit' => 200]);
        $items = $this->InventoryVouchers->Items->find('list', ['limit' => 200]);
        $this->set(compact('inventoryVoucher', 'invoices', 'invoiceRows','items'));
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
