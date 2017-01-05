<?php
namespace App\Controller;

use App\Controller\AppController;
use Cake\View\Helper\NumberHelper;
use Cake\View\Helper\HtmlHelper;

/**
 * Invoices Controller
 *
 * @property \App\Model\Table\InvoicesTable $Invoices
 */
class InvoicesController extends AppController
{

    /**
     * Index method
     *
     * @return \Cake\Network\Response|null
     */
    public function index()
    {
		$url=$this->request->here();
		$url=parse_url($url,PHP_URL_QUERY);
		$this->viewBuilder()->layout('index_layout');
		
		$session = $this->request->session();
		$st_company_id = $session->read('st_company_id');
		
		$where=[];
		$company_alise=$this->request->query('company_alise');
		$invoice_no=$this->request->query('invoice_no');
		$file=$this->request->query('file');
		$customer=$this->request->query('customer');
		$From=$this->request->query('From');
		$To=$this->request->query('To');
		$total_From=$this->request->query('total_From');
		$total_To=$this->request->query('total_To');
		$page=$this->request->query('page');
		$this->set(compact('ref_no','customer','total_From','total_To','From','To','page','invoice_no','company_alise','file'));
		if(!empty($company_alise)){
			$where['in1 LIKE']='%'.$company_alise.'%';
		}
		if(!empty($invoice_no)){
			$where['in2 LIKE']='%'.$invoice_no.'%';
		}
		if(!empty($file)){
			$where['in3 LIKE']='%'.$file.'%';
		}
		if(!empty($customer)){
			$where['Customers.customer_name LIKE']='%'.$customer.'%';
		}
		if(!empty($From)){
			$From=date("Y-m-d",strtotime($this->request->query('From')));
			$where['date_created >=']=$From;
		}
		if(!empty($To)){
			$To=date("Y-m-d",strtotime($this->request->query('To')));
			$where['date_created <=']=$To;
		}
		if(!empty($total_From)){
			$where['total_after_pnf >=']=$total_From;
		}
		if(!empty($total_To)){
			$where['total_after_pnf <=']=$total_To;
		}
        $this->paginate = [
            'contain' => ['Customers', 'Companies']
        ];
        $invoices = $this->paginate($this->Invoices->find()->where($where)->where(['company_id'=>$st_company_id])->order(['Invoices.id' => 'DESC']));
		
        $this->set(compact('invoices'));
        $this->set('_serialize', ['invoices']);
		$this->set(compact('url'));
    }
	
	public function DueInvoices($customer_id=null)
    {
		$this->viewBuilder()->layout('index_layout');
		$Customer=$this->Invoices->Customers->get($customer_id);
        $this->paginate = [
            'contain' => []
        ];
        $invoices = $this->paginate($this->Invoices->find()->where(['customer_id'=>$customer_id,'due_payment !='=>0])->order(['date_created' => 'ASC']));
		
        $this->set(compact('invoices','Customer'));
        $this->set('_serialize', ['invoices']);
		$this->set(compact('url'));
    }

	public function exportExcel()
	{
		
		$this->viewBuilder()->layout('');
		$where=[];
		$company_alise=$this->request->query('company_alise');
		$invoice_no=$this->request->query('invoice_no');
		$file=$this->request->query('file');
		$customer=$this->request->query('customer');
		$From=$this->request->query('From');
		$To=$this->request->query('To');
		$total_From=$this->request->query('total_From');
		$total_To=$this->request->query('total_To');
		$page=$this->request->query('page');
		$this->set(compact('ref_no','customer','total_From','total_To','From','To','page','invoice_no','company_alise','file'));
		if(!empty($company_alise)){
			$where['Invoices.in1 LIKE']='%'.$company_alise.'%';
		}
		if(!empty($invoice_no)){
			$where['Invoices.id']=$invoice_no;
		}
		if(!empty($file)){
			$where['Invoices.in3 LIKE']='%'.$file.'%';
		}
		if(!empty($customer)){
			$where['Customers.customer_name LIKE']='%'.$customer.'%';
		}
		if(!empty($From)){
			$From=date("Y-m-d",strtotime($this->request->query('From')));
			$where['date_created >=']=$From;
		}
		if(!empty($To)){
			$To=date("Y-m-d",strtotime($this->request->query('To')));
			$where['date_created <=']=$To;
		}
		if(!empty($total_From)){
			$where['total_after_pnf >=']=$total_From;
		}
		if(!empty($total_To)){
			$where['total_after_pnf <=']=$total_To;
		}
		$this->paginate = [
			'contain' => ['Customers', 'Companies']
		];
		$invoices = $this->paginate($this->Invoices->find()->where($where)->order(['Invoices.id' => 'DESC']));
		
		$this->set(compact('invoices'));
		$this->set('_serialize', ['invoices']);
	}
	
	
	
    /**
     * View method
     *
     * @param string|null $id Invoice id.
     * @return \Cake\Network\Response|null
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function view($id = null)
    {
		$this->viewBuilder()->layout('');
        $invoice = $this->Invoices->get($id, [
            'contain' => ['Customers', 'Companies', 'InvoiceRows' => ['Items']]
        ]);

        $this->set('invoice', $invoice);
        $this->set('_serialize', ['invoice']);
    }
	
	public function PendingItemForInventoryVoucher()
    {
		$this->viewBuilder()->layout('index_layout');
		$invoices=$this->paginate(
				$this->Invoices->InvoiceRows->find()->contain(['Invoices',
				'Items'=> function ($q) {
				return $q->where(['source !='=>'Purchessed']);
				}])
				->where(['inventory_voucher'=>'Pending'])
				->order(['InvoiceRows.id' => 'DESC'])
			);
	//pr($invoices); exit;
        $this->set('invoices', $invoices);
        $this->set('_serialize', ['invoice']);
    }
	
	
	
	
	
	
	
	public function pdf($id = null)
    {
		$this->viewBuilder()->layout('');
		
        $invoice = $this->Invoices->get($id, [
            'contain' => ['SaleTaxes','Customers','Employees','Transporters','Creator'=>['Designations'],'Companies'=> [
			'CompanyBanks'=> function ($q) {
				return $q
				->where(['CompanyBanks.default_bank' => 1]);
				}], 'InvoiceRows' => ['Items'=>['Units']]]
			]);
		
        $this->set('invoice', $invoice);
		
        $this->set('_serialize', ['invoice']);
    }
	
	
	public function confirm($id = null)
    {
		$this->viewBuilder()->layout('pdf_layout');
		$invoice = $this->Invoices->get($id, [
            'contain' => ['InvoiceRows']
			]);
		
		/*$qwer=array('orange', 'banana', 'apple', 'pineapple', 'strawberry');;
		$item = $qwer[ 3 ];
		$qwer[ 3 ] = $qwer[ 3 - 1 ];
		$qwer[ 3 - 1 ] = $item;
		
		pr($qwer);
		exit;*/
		
		
		if ($this->request->is(['patch', 'post', 'put'])) {
            foreach($this->request->data['invoice_rows'] as $invoice_row_id=>$value){
				$invoiceRow=$this->Invoices->InvoiceRows->get($invoice_row_id);
				$invoiceRow->height=$value["height"];
				$this->Invoices->InvoiceRows->save($invoiceRow);
			}
			return $this->redirect(['action' => 'confirm/'.$id]);
        }
		
		$this->set(compact('invoice','id'));
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
		$sales_order_id=@(int)$this->request->query('sales-order');
		$sales_order=array(); $process_status='New';
		if(!empty($sales_order_id)){
			$sales_order = $this->Invoices->SalesOrders->get($sales_order_id, [
				'contain' => [
						'SalesOrderRows.Items' => function ($q) {
						   return $q
								->where(['SalesOrderRows.quantity > SalesOrderRows.processed_quantity']);
						},'SalesOrderRows.SaleTaxes','Companies','Customers','Employees'
					]
			]);
			$process_status='Pulled From Sales-Order';
		}
				
	
		$this->set(compact('sales_order','process_status','sales_order_id'));
		
        $invoice = $this->Invoices->newEntity();
        if ($this->request->is('post')) {
			
		$invoice = $this->Invoices->patchEntity($invoice, $this->request->data);
			
			$last_in_no=$this->Invoices->find()->select(['in2'])->where(['company_id' => $sales_order->company_id])->order(['in2' => 'DESC'])->first();
			if($last_in_no){
				$invoice->in2=$last_in_no->in2+1;
			}else{
				$invoice->in2=1;
			}
			
			$invoice->in3=$sales_order->so3;
			$invoice->created_by=$s_employee_id;
			$invoice->company_id=$sales_order->company_id;
			$invoice->employee_id=$sales_order->employee_id;
			$invoice->customer_id=$sales_order->customer_id;
			$invoice->customer_po_no=$sales_order->customer_po_no;
			$invoice->po_date=date("Y-m-d",strtotime($sales_order->po_date)); 
			//pr($invoice->in3); exit;
			$invoice->date_created=date("Y-m-d");
			$invoice->due_payment=$invoice->grand_total;
		
            if ($this->Invoices->save($invoice)) {
				
				$ledger_grand=$invoice->grand_total;
				$ledger = $this->Invoices->Ledgers->newEntity();
				$ledger->ledger_account_id = $sales_order->customer->ledger_account_id;
				$ledger->debit = $invoice->grand_total;
				$ledger->credit = 0;
				$ledger->voucher_id = $invoice->id;
				$ledger->voucher_source = 'Invoice';
				$ledger->company_id = $invoice->company_id;
				$ledger->transaction_date = $invoice->date_created;
				
				if($ledger_grand>0)
				{
					$this->Invoices->Ledgers->save($ledger); 
				} 
				//Ledger posting for Account Reference
				$ledger_pnf=$invoice->total_after_pnf;
				$accountReferences=$this->Invoices->AccountReferences->get(1);
				$ledger = $this->Invoices->Ledgers->newEntity();
				$ledger->ledger_account_id = $accountReferences->ledger_account_id;
				$ledger->debit = 0;
				$ledger->credit = $invoice->total_after_pnf;
				$ledger->voucher_id = $invoice->id;
				$ledger->company_id = $invoice->company_id;
				$ledger->transaction_date = $invoice->date_created;
				$ledger->voucher_source = 'Invoice';
				if($ledger_pnf>0)
				{
					
					$this->Invoices->Ledgers->save($ledger); 
				}
				
				//Ledger posting for Sale Tax
				
				$SaleTaxe=$this->Invoices->SaleTaxes->get($invoice->sale_tax_id);
				
				$ledger_saletax=$invoice->sale_tax_amount;
				$ledger = $this->Invoices->Ledgers->newEntity();
				$ledger->ledger_account_id = $SaleTaxe->ledger_account_id;
				$ledger->debit = 0;
				$ledger->credit = $invoice->sale_tax_amount;
				$ledger->voucher_id = $invoice->id;
				$ledger->company_id = $invoice->company_id;
				$ledger->transaction_date = $invoice->date_created;
				$ledger->voucher_source = 'Invoice';
				if($ledger_saletax>0)
				{
					$this->Invoices->Ledgers->save($ledger); 
				}
				
				
				//Ledger posting for Fright Amount
				
				$ledger_fright= $invoice->fright_amount;
				$accountReferences=$this->Invoices->AccountReferences->get(3);
				$ledger = $this->Invoices->Ledgers->newEntity();
				$ledger->ledger_account_id = $accountReferences->ledger_account_id;
				$ledger->debit = 0;
				$ledger->credit = $invoice->fright_amount;
				$ledger->voucher_id = $invoice->id;
				$ledger->company_id = $invoice->company_id;
				$ledger->transaction_date = $invoice->date_created;
				$ledger->voucher_source = 'Invoice';
				if($ledger_fright>0)
				{
					$this->Invoices->Ledgers->save($ledger); 
				}
				
				if(!empty($sales_order_id)){
					$invoice->check=array_filter($invoice->check);
					$i=0; 
					foreach($invoice->check as $sales_order_row_id){
						$item_id=$invoice->invoice_rows[$i]['item_id'];
						$qty=$invoice->invoice_rows[$i]['quantity'];
						
						$SalesOrderRow = $this->Invoices->SalesOrderRows->get($sales_order_row_id);
						$SalesOrderRow->processed_quantity=$SalesOrderRow->processed_quantity+$qty;
						$this->Invoices->SalesOrderRows->save($SalesOrderRow);
						$i++;
						
						//Insert in Item Ledger//
						$itemLedger = $this->Invoices->ItemLedgers->newEntity();
						$itemLedger->item_id = $item_id;
						$itemLedger->quantity = $qty;
						$itemLedger->source_model = 'Invoices';
						$itemLedger->source_id = $invoice->id;
						$itemLedger->in_out = 'Out';
						$itemLedger->company_id = $invoice->company_id;
						$itemLedger->processed_on = date("Y-m-d");
						$this->Invoices->ItemLedgers->save($itemLedger);
						
					}
				}
                $this->Flash->success(__('The invoice has been saved.'));

                return $this->redirect(['action' => 'confirm/'.$invoice->id]);
            } else {
                $this->Flash->error(__('The invoice could not be saved. Please, try again.'));
            }
        }
		
		
		$salesOrders = $this->Invoices->SalesOrders->find()->select(['total_rows' => 
				$this->Invoices->SalesOrders->find()->func()->count('SalesOrderRows.id')])
				->leftJoinWith('SalesOrderRows', function ($q) {
					return $q->where(['SalesOrderRows.quantity > SalesOrderRows.processed_quantity']);
				})
				->group(['SalesOrders.id'])
				->autoFields(true)
				->having(['total_rows >' => 0]);
				
		$items = $this->Invoices->Items->find('list');
		$transporters = $this->Invoices->Transporters->find('list', ['limit' => 200]);
		$termsConditions = $this->Invoices->TermsConditions->find('all',['limit' => 200]);
		$SaleTaxes = $this->Invoices->SaleTaxes->find('all')->where(['freeze'=>0]);
		if(!empty($sales_order->customer_id)){
		$dueInvoicespay = $this->Invoices->find()->where(['customer_id'=>$sales_order->customer_id,'due_payment !='=>0]);
			$old_due_payment=0; foreach ($dueInvoicespay as $invoice_data){ 
				$old_due_payment+=$invoice_data->due_payment;
			}
		}
		$employees = $this->Invoices->Employees->find('list', ['limit' => 200]);
        $this->set(compact('invoice', 'customers', 'companies', 'salesOrders','items','transporters','termsConditions','serviceTaxs','exciseDuty','SaleTaxes','employees','dueInvoicespay','creditlimit','old_due_payment'));
        $this->set('_serialize', ['invoice']);
    }
	
	public function pullFromSalesOrder(){
		if ($this->request->is('post')) {
			$sales_order_id=$this->request->data["sales_order_id"];
            return $this->redirect(['action' => 'add?sales-order='.$sales_order_id]);
        }
	}

    /**
     * Edit method
     *
     * @param string|null $id Invoice id.
     * @return \Cake\Network\Response|void Redirects on successful edit, renders view otherwise.
     * @throws \Cake\Network\Exception\NotFoundException When record not found.
     */
    public function edit($id = null)
    {
		$this->viewBuilder()->layout('index_layout');
		
        $invoice = $this->Invoices->get($id, [
            'contain' => ['InvoiceRows'=>['Items'],'SalesOrders'=>['SalesOrderRows','Invoices'=>['InvoiceRows']],'Companies','Customers','Employees','SaleTaxes']
        ]);
		//pr($invoice); exit;
        if ($this->request->is(['patch', 'post', 'put'])) {
            $invoice = $this->Invoices->patchEntity($invoice, $this->request->data);
			
			$invoice->date_created=date("Y-m-d",strtotime($invoice->date_created));
			
			$invoice->company_id=$invoice->company_id;
			$invoice->employee_id=$invoice->employee_id;
			$invoice->customer_id=$invoice->customer_id;
			$invoice->customer_po_no=$invoice->customer_po_no;
			$invoice->po_date=date("Y-m-d",strtotime($invoice->po_date)); 
			$invoice->in3=$invoice->in3;
			$invoice->due_payment=$invoice->grand_total;
			//pr($invoice->in3); exit;
			
            if ($this->Invoices->save($invoice)) {
				
				$this->Invoices->Ledgers->deleteAll(['voucher_id' => $invoice->id, 'voucher_source' => 'Invoice']);
				$customer_ledger=$this->Invoices->Customers->get($invoice->company_id);
				
				$ledger_grand=$invoice->grand_total;
				$ledger = $this->Invoices->Ledgers->newEntity();
				$ledger->ledger_account_id = $customer_ledger->ledger_account_id;
				$ledger->debit = $invoice->grand_total;
				$ledger->credit = 0;
				$ledger->voucher_id = $invoice->id;
				$ledger->company_id = $invoice->company_id;
				$ledger->voucher_source = 'Invoice';
				$ledger->transaction_date = $invoice->date_created;
				
				if($ledger_grand>0)
				{
					$this->Invoices->Ledgers->save($ledger); 
				} 
				//Ledger posting for Account Reference
				$ledger_pnf=$invoice->total_after_pnf;
				$accountReferences=$this->Invoices->AccountReferences->get(1);
				$ledger = $this->Invoices->Ledgers->newEntity();
				$ledger->ledger_account_id = $accountReferences->ledger_account_id;
				$ledger->debit = 0;
				$ledger->credit = $invoice->total_after_pnf;
				$ledger->voucher_id = $invoice->id;
				$ledger->company_id = $invoice->company_id;
				$ledger->transaction_date = $invoice->date_created;
				$ledger->voucher_source = 'Invoice';
				if($ledger_pnf>0)
				{
					
					$this->Invoices->Ledgers->save($ledger); 
				}
				
				//Ledger posting for Sale Tax
				
				$SaleTaxe=$this->Invoices->SaleTaxes->get($invoice->sale_tax_id);
				
				$ledger_saletax=$invoice->sale_tax_amount;
				$ledger = $this->Invoices->Ledgers->newEntity();
				$ledger->ledger_account_id = $SaleTaxe->ledger_account_id;
				$ledger->debit = 0;
				$ledger->credit = $invoice->sale_tax_amount;
				$ledger->voucher_id = $invoice->id;
				$ledger->company_id = $invoice->company_id;
				$ledger->transaction_date = $invoice->date_created;
				$ledger->voucher_source = 'Invoice';
				if($ledger_saletax>0)
				{
					$this->Invoices->Ledgers->save($ledger); 
				}
				
				
				//Ledger posting for Fright Amount
				
				$ledger_fright= $invoice->fright_amount;
				$accountReferences=$this->Invoices->AccountReferences->get(3);
				$ledger = $this->Invoices->Ledgers->newEntity();
				$ledger->ledger_account_id = $accountReferences->ledger_account_id;
				$ledger->debit = 0;
				$ledger->credit = $invoice->fright_amount;
				$ledger->voucher_id = $invoice->id;
				$ledger->company_id = $invoice->company_id;
				$ledger->transaction_date = $invoice->date_created;
				$ledger->voucher_source = 'Invoice';
				if($ledger_fright>0)
				{
					$this->Invoices->Ledgers->save($ledger); 
				}
				
				$qq=0; foreach($invoice->invoice_rows as $invoice_rows){
					$salesorderrow=$this->Invoices->SalesOrderRows->find()->where(['sales_order_id'=>$invoice->sales_order_id,'item_id'=>$invoice_rows->item_id])->first();
					$salesorderrow->processed_quantity=$salesorderrow->processed_quantity-$invoice->getOriginal('invoice_rows')[$qq]->quantity+$invoice_rows->quantity;
					$this->Invoices->SalesOrderRows->save($salesorderrow);
				$qq++; }
                $this->Flash->success(__('The invoice has been saved.'));

                return $this->redirect(['action' => 'index']);
            } else {
                $this->Flash->error(__('The invoice could not be saved. Please, try again.'));
            }
        }
       $customers = $this->Invoices->Customers->find('all');
       $companies = $this->Invoices->Companies->find('all', ['limit' => 200]);
		
		$salesOrders = $this->Invoices->SalesOrders->find()->select(['total_rows' => 
				$this->Invoices->SalesOrders->find()->func()->count('SalesOrderRows.id')])
				->leftJoinWith('SalesOrderRows', function ($q) {
					return $q->where(['SalesOrderRows.quantity > SalesOrderRows.processed_quantity']);
				})
				->group(['SalesOrders.id'])
				->autoFields(true)
				->having(['total_rows >' => 0]);
		$dueInvoicespay = $this->Invoices->find()->where(['customer_id'=>$invoice->customer_id,'due_payment !='=>0]);
		
			$due_paisa=0; foreach ($dueInvoicespay as $invoice_data){ 
				$due_paisa+=$invoice_data->due_payment;
		}
		$old_due_payment=$due_paisa-$invoice->due_payment;
		//pr($old_due_payment); exit;
		//pr($invoice->due_payment); exit;
		//pr($old_due_payment); exit;
		
		//pr($old_due_payment); exit;
		//$dueInvoices = $this->Invoices->find()->where(['customer_id'=>$invoice->customer_id,'due_payment !='=>0]);
		$items = $this->Invoices->Items->find('list',['limit' => 200]);
		$transporters = $this->Invoices->Transporters->find('list', ['limit' => 200]);
		$termsConditions = $this->Invoices->TermsConditions->find('all',['limit' => 200]);
		$SaleTaxes = $this->Invoices->SaleTaxes->find('all')->where(['freeze'=>0]);
		$employees = $this->Invoices->Employees->find('list', ['limit' => 200]);
        $this->set(compact('invoice', 'customers', 'companies', 'salesOrders','old_due_payment','items','transporters','termsConditions','serviceTaxs','exciseDuty','SaleTaxes','employees','dueInvoices'));
        $this->set('_serialize', ['invoice']);
    }

    /**
     * Delete method
     *
     * @param string|null $id Invoice id.
     * @return \Cake\Network\Response|null Redirects to index.
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function delete($id = null)
    {
        $this->request->allowMethod(['post', 'delete']);
        $invoice = $this->Invoices->get($id);
        if ($this->Invoices->delete($invoice)) {
            $this->Flash->success(__('The invoice has been deleted.'));
        } else {
            $this->Flash->error(__('The invoice could not be deleted. Please, try again.'));
        }

        return $this->redirect(['action' => 'index']);
    }
	
	function RecentRecords($item_id=null,$customer_id=null){
		$this->viewBuilder()->layout('');
		if(!empty($item_id) and !empty($customer_id)){
			
			$item=$this->Invoices->Items->get($item_id);
			
			
			$customerIds=[]; $customer_text='';
			$customer=$this->Invoices->Customers->get($customer_id);
			if($customer->customer_group_id!=0){
				$customerGroup=$this->Invoices->CustomerGroups->get($customer->customer_group_id);
				$customer_text='Past Records of customer group - <b>'.$customerGroup->name.'</b>';
				$customers=$this->Invoices->Customers->find()->select(['id'])->where(['customer_group_id'=>$customer->customer_group_id]);
				foreach($customers as $data){
					$customerIds[]=$data->id;
				}
			}else{
				$customerIds=array($customer_id);
				 $customer_text='Past Records of customer - <b>'.$customer->customer_name.'</b>';
			}
			$Invoices=$this->Invoices->find()->where(['customer_id IN' => $customerIds])->matching(
					'InvoiceRows', function ($q) use($item_id) {
						return $q->where(['InvoiceRows.item_id' => $item_id]);
					}
				);
			//$this->set(compact('Invoices','customer_text','item'));
			$Number = new NumberHelper(new \Cake\View\View());
			$Html = new HtmlHelper(new \Cake\View\View());
			
			$html='<span style="font-size: 14px;">Minimum Selling Rate for Item <b>"'.$item->name.'"</b> : '. $Number->format($item->dynamic_cost*$item->minimum_selling_price_factor,[ 'places' => 2]).'</span><br/><br/>
			<div style="font-size: 14px;">'.$customer_text.'</div>
			<table class="table">
				<thead>
					<tr>
						<th>Sr. No.</th>
						<th>Invoice No.</th>
						<th>Invoice Date</th>
						<th>Last Selling Rate</th>
					</tr>
				</thead>
				<tbody>';
				$i=0; foreach($Invoices as $invoice):
				$html.='<tr>
						<td>'.h(++$i).'</td>
						<td>'.$Html->link(($invoice->in1.'/IN'.str_pad($invoice->id, 3, '0', STR_PAD_LEFT).'/'.$invoice->in3.'/'.$invoice->in4),'/Invoices/confirm/'.$invoice->id,array('target'=>'_blank')).'</td>
						<td>'.h(date('d-m-Y',strtotime($invoice->date_created))).'</td>
						<td>'.$Number->format($invoice->_matchingData['InvoiceRows']->rate,[ 'places' => 2]).'</td>
					</tr>';
				endforeach;
				$html.='</tbody>
			</table>';
			die(json_encode(array("html"=>$html,"minimum_selling_price"=>$item->dynamic_cost*$item->minimum_selling_price_factor)));
		}
	}
	
	function DueInvoicesForReceipt($received_from_id=null){
		$this->viewBuilder()->layout('');
		$session = $this->request->session();
		$st_company_id = $session->read('st_company_id');
		
		$Customer=$this->Invoices->Customers->find()->where(['ledger_account_id'=>$received_from_id])->first();
		if(!$Customer){ echo 'Select received from.'; exit; }
		$Invoices = $this->Invoices->find()->where(['company_id'=>$st_company_id,'customer_id'=>$Customer->id,'due_payment >'=>0]);
		 $this->set(compact('Invoices','Customer'));
	}
}
