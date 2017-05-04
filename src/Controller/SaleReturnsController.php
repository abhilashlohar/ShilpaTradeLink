<?php
namespace App\Controller;

use App\Controller\AppController;

/**
 * SaleReturns Controller
 *
 * @property \App\Model\Table\SaleReturnsTable $SaleReturns
 */
class SaleReturnsController extends AppController
{

    /**
     * Index method
     *
     * @return \Cake\Network\Response|null
     */
    public function index()
    {
        $this->paginate = [
            'contain' => ['Customers', 'SaleTaxes', 'Companies', 'SalesOrders', 'Employees', 'Transporters', 'StLedgerAccounts']
        ];
        $saleReturns = $this->paginate($this->SaleReturns);

        $this->set(compact('saleReturns'));
        $this->set('_serialize', ['saleReturns']);
    }

    /**
     * View method
     *
     * @param string|null $id Sale Return id.
     * @return \Cake\Network\Response|null
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function view($id = null)
    {
        $saleReturn = $this->SaleReturns->get($id, [
            'contain' => ['Customers', 'SaleTaxes', 'Companies', 'SalesOrders', 'Employees', 'Transporters', 'StLedgerAccounts', 'SaleReturnRows']
        ]);

        $this->set('saleReturn', $saleReturn);
        $this->set('_serialize', ['saleReturn']);
    }

    /**
     * Add method
     *
     * @return \Cake\Network\Response|void Redirects on successful add, renders view otherwise.
     */
    public function add()
    {
		$session = $this->request->session();
		$st_company_id = $session->read('st_company_id');
		$this->viewBuilder()->layout('index_layout');
        $saleReturn = $this->SaleReturns->newEntity();
		$invoice_id=@(int)$this->request->query('invoice');
		$invoice = $this->SaleReturns->Invoices->get($invoice_id, [
            'contain' => ['InvoiceRows' => ['Items'=>['ItemSerialNumbers'=>function($q) use($invoice_id){
							return $q->where(['ItemSerialNumbers.Status' => 'Out','ItemSerialNumbers.invoice_id'=>$invoice_id]);
							},'ItemCompanies'=>function($q) use($st_company_id){
							return $q->where(['ItemCompanies.company_id' => $st_company_id]);
							}]],'SaleTaxes','Companies','Customers'=>['CustomerAddress'=> function ($q) {
						return $q
						->where(['CustomerAddress.default_address' => 1]);}],'Employees','SaleTaxes']
        ]);
		$c_LedgerAccount=$this->SaleReturns->LedgerAccounts->find()->where(['company_id'=>$st_company_id,'source_model'=>'Customers','source_id'=>$invoice->customer->id])->first();
		
		$ReferenceDetails=$this->SaleReturns->ReferenceDetails->find()->where(['ledger_account_id'=>$c_LedgerAccount->id,'invoice_id'=>$invoice->id]);
		//pr($ReferenceDetails->toArray()); exit;
        if ($this->request->is('post')) {
			
			$ref_rows=$this->request->data['ref_rows'];
            $saleReturn = $this->SaleReturns->patchEntity($saleReturn, $this->request->data);
			foreach($saleReturn->sale_return_rows as $sale_return_row){   
				if($sale_return_row->item_serial_numbers){
					$item_serial_no=implode(",",$sale_return_row->item_serial_numbers );
					$sale_return_row->item_serial_number=$item_serial_no;
				}
					
			}
			
			$discount=$invoice->discount;
				$pf=$invoice->pnf;
				$exciseDuty=$invoice->exceise_duty;
				$sale_tax=$invoice->sale_tax_amount;
				$fright=$invoice->fright_amount;
				$total_amt=0;
				foreach($saleReturn->sale_return_rows as $sale_return_row){
					$amt=$sale_return_row->amount;
					$total_amt=$total_amt+$amt;
					$item_serial_no=$sale_return_row->item_serial_number;
					$serial_no=explode(",",$item_serial_no);
					foreach($serial_no as $serial){
					pr($serial);exit;
					}
				}
		
			
			
			
            if ($this->SaleReturns->save($saleReturn)) {
				
				//GET CUSTOMER LEDGER-ACCOUNT-ID
				$c_LedgerAccount=$this->SaleReturns->LedgerAccounts->find()->where(['company_id'=>$st_company_id,'source_model'=>'Customers','source_id'=>$sales_order->customer->id])->first();
				$ledger_grand=$saleReturn->grand_total;
				$ledger = $this->SaleReturns->Ledgers->newEntity();
				$ledger->ledger_account_id = $c_LedgerAccount->id;
				$ledger->debit = 0;
				$ledger->credit =$saleReturn->grand_total;
				$ledger->voucher_id = $saleReturn->id;
				$ledger->voucher_source = 'Sale Return';
				$ledger->company_id = $invoice->company_id;
				$ledger->transaction_date = $saleReturn->date_created;
				if($ledger_grand>0)
				{
					$this->SaleReturns->Ledgers->save($ledger); 
				}
				
				//Ledger posting for Account Reference
				$ledger_pnf=$saleReturn->total_after_pnf;
				$ledger = $this->SaleReturns->Ledgers->newEntity();
				$ledger->ledger_account_id = $invoice->sales_ledger_account;
				$ledger->debit = $invoice->total_after_pnf;
				$ledger->credit = 0;
				$ledger->voucher_id = $saleReturn->id;
				$ledger->company_id = $invoice->company_id;
				$ledger->transaction_date = $saleReturn->date_created;
				$ledger->voucher_source = 'Sale Return';
				if($ledger_pnf>0)
				{
					$this->SaleReturns->Ledgers->save($ledger); 
				}
				
				//Ledger posting for Sale Tax
				$ledger_saletax=$invoice->sale_tax_amount;
				$ledger = $this->SaleReturns->Ledgers->newEntity();
				$ledger->ledger_account_id = $invoice->st_ledger_account_id;
				$ledger->debit = $invoice->sale_tax_amount;
				$ledger->credit = 0;
				$ledger->voucher_id = $saleReturn->id;
				$ledger->company_id = $invoice->company_id;
				$ledger->transaction_date = $saleReturn->date_created;
				$ledger->voucher_source = 'Sale Return';
				if($ledger_saletax>0)
				{
					$this->SaleReturns->Ledgers->save($ledger); 
				}
				//Ledger posting for Fright Amount
				$ledger_fright= $saleReturn->fright_amount;
				$ledger = $this->SaleReturns->Ledgers->newEntity();
				$ledger->ledger_account_id = $invoice->fright_ledger_account;
				$ledger->debit = $invoice->fright_amount;
				$ledger->credit =0; 
				$ledger->voucher_id = $saleReturn->id;
				$ledger->company_id = $invoice->company_id;
				$ledger->transaction_date = $saleReturn->date_created;
				$ledger->voucher_source = 'Sale Return';
				if($ledger_fright>0)
				{
					$this->SaleReturns->Ledgers->save($ledger); 
				}
				$discount=$invoice->discount;
				$pf=$invoice->pnf;
				$exciseDuty=$invoice->exceise_duty;
				$sale_tax=$invoice->sale_tax_amount;
				$fright=$invoice->fright_amount;
				$total_amt=0;
				foreach($saleReturn->sale_return_rows as $sale_return_row){
					$amt=$sale_return_row->amount;
					$total_amt=$total_amt+$amt;
					$item_serial_no=$sale_return_row->item_serial_number;
					$serial_no=explode(",",$item_serial_no);
					foreach($serial_no as $serial){
					$query = $this->SaleReturns->SaleReturnRows->ItemSerialNumbers->query();
						$query->update()
							->set(['status' => 'In','sale_return_id'=>$saleReturn->id])
							->where(['id' => $serial,'invoice_id' => $invoice->id])
							->execute();
					}
				}
				//Insert in Item Ledger//
						$itemLedger = $this->SaleReturns->ItemLedgers->newEntity();
						$itemLedger->item_id = $item_id;
						$itemLedger->quantity = $qty;
						$itemLedger->source_model = 'Sale Return';
						$itemLedger->source_id = $saleReturn->id;
						$itemLedger->in_out = 'In';
						$itemLedger->rate = $rate-$item_discount+$item_excise+$item_pf;
						$itemLedger->company_id = $invoice->company_id;
						$itemLedger->processed_on = date("Y-m-d");
						$this->SaleReturns->ItemLedgers->save($itemLedger);
				
				
                $this->Flash->success(__('The sale return has been saved.'));

                return $this->redirect(['action' => 'index']);
            } else {
                $this->Flash->error(__('The sale return could not be saved. Please, try again.'));
            }
        }
		$ledger_account_details = $this->SaleReturns->LedgerAccounts->get($invoice->sales_ledger_account);
		$ledger_account_details_for_fright = $this->SaleReturns->LedgerAccounts->get($invoice->fright_ledger_account);
		$Transporter = $this->SaleReturns->Transporters->get($invoice->transporter_id);

		
		
		$Em = new FinancialYearsController;
		$financial_year_data = $Em->checkFinancialYear($invoice->date_created);
        $customers = $this->SaleReturns->Customers->find('list', ['limit' => 200]);
        $saleTaxes = $this->SaleReturns->SaleTaxes->find('list', ['limit' => 200]);
        $companies = $this->SaleReturns->Companies->find('list', ['limit' => 200]);
        $salesOrders = $this->SaleReturns->SalesOrders->find('list', ['limit' => 200]);
        $employees = $this->SaleReturns->Employees->find('list', ['limit' => 200]);
        $transporters = $this->SaleReturns->Transporters->find('list', ['limit' => 200]);
        //$stLedgerAccounts = $this->SaleReturns->StLedgerAccounts->find('list', ['limit' => 200]);
        $this->set(compact('saleReturn', 'customers', 'saleTaxes', 'companies', 'salesOrders', 'employees', 'transporters','invoice','Transporter','financial_year_data','ledger_account_details','ledger_account_details_for_fright','c_LedgerAccount'));
        $this->set('_serialize', ['saleReturn']);
    }

    /**
     * Edit method
     *
     * @param string|null $id Sale Return id.
     * @return \Cake\Network\Response|void Redirects on successful edit, renders view otherwise.
     * @throws \Cake\Network\Exception\NotFoundException When record not found.
     */
    public function edit($id = null)
    {
        $saleReturn = $this->SaleReturns->get($id, [
            'contain' => []
        ]);
        if ($this->request->is(['patch', 'post', 'put'])) {
            $saleReturn = $this->SaleReturns->patchEntity($saleReturn, $this->request->data);
            if ($this->SaleReturns->save($saleReturn)) {
                $this->Flash->success(__('The sale return has been saved.'));

                return $this->redirect(['action' => 'index']);
            } else {
                $this->Flash->error(__('The sale return could not be saved. Please, try again.'));
            }
        }
        $customers = $this->SaleReturns->Customers->find('list', ['limit' => 200]);
        $saleTaxes = $this->SaleReturns->SaleTaxes->find('list', ['limit' => 200]);
        $companies = $this->SaleReturns->Companies->find('list', ['limit' => 200]);
        $salesOrders = $this->SaleReturns->SalesOrders->find('list', ['limit' => 200]);
        $employees = $this->SaleReturns->Employees->find('list', ['limit' => 200]);
        $transporters = $this->SaleReturns->Transporters->find('list', ['limit' => 200]);
        $stLedgerAccounts = $this->SaleReturns->StLedgerAccounts->find('list', ['limit' => 200]);
        $this->set(compact('saleReturn', 'customers', 'saleTaxes', 'companies', 'salesOrders', 'employees', 'transporters', 'stLedgerAccounts'));
        $this->set('_serialize', ['saleReturn']);
    }

    /**
     * Delete method
     *
     * @param string|null $id Sale Return id.
     * @return \Cake\Network\Response|null Redirects to index.
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function delete($id = null)
    {
        $this->request->allowMethod(['post', 'delete']);
        $saleReturn = $this->SaleReturns->get($id);
        if ($this->SaleReturns->delete($saleReturn)) {
            $this->Flash->success(__('The sale return has been deleted.'));
        } else {
            $this->Flash->error(__('The sale return could not be deleted. Please, try again.'));
        }

        return $this->redirect(['action' => 'index']);
    }
	function checkRefNumberUnique($received_from_id,$i){
		$reference_no=$this->request->query['ref_rows'][$i]['ref_no'];
		$ReferenceBalances=$this->SaleReturns->ReferenceBalances->find()->where(['ledger_account_id'=>$received_from_id,'reference_no'=>$reference_no]);
		if($ReferenceBalances->count()==0){
			echo 'true';
		}else{
			echo 'false';
		}
		exit;
	}
	public function fetchRefNumbers($ledger_account_id){
		$this->viewBuilder()->layout('');
		$ReferenceBalances=$this->SaleReturns->ReferenceBalances->find()->where(['ledger_account_id'=>$ledger_account_id]);
		$this->set(compact('ReferenceBalances','cr_dr'));
	}
}
