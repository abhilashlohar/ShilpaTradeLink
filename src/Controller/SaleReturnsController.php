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
		$this->viewBuilder()->layout('index_layout');
        $this->paginate = [
            'contain' => ['Customers', 'SaleTaxes', 'Companies', 'SalesOrders', 'Employees', 'Transporters']
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
		
        if ($this->request->is('post')) {
			$ref_rows=$this->request->data['ref_rows'];
            $saleReturn = $this->SaleReturns->patchEntity($saleReturn, $this->request->data);
			foreach($saleReturn->sale_return_rows as $sale_return_row){   
				if($sale_return_row->item_serial_numbers){
					$item_serial_no=implode(",",$sale_return_row->item_serial_numbers );
					$sale_return_row->item_serial_number=$item_serial_no;
				}
					
			}
			
			$saleReturn->company_id=$invoice->company_id;
			$saleReturn->sr1=$invoice->in1;
			$last_sr_no=$this->SaleReturns->find()->select(['sr2'])->where(['company_id' => $st_company_id])->order(['sr2' => 'DESC'])->first();
			if($last_sr_no){
				$saleReturn->sr2=$last_sr_no->sr2+1;
			}else{
				$saleReturn->sr2=1;
			}
			$saleReturn->sr3=$invoice->in3;
			$saleReturn->sr4=$invoice->in4;
			//exit;
			 if ($this->SaleReturns->save($saleReturn)) {
				
				//GET CUSTOMER LEDGER-ACCOUNT-ID
				$c_LedgerAccount=$this->SaleReturns->LedgerAccounts->find()->where(['company_id'=>$st_company_id,'source_model'=>'Customers','source_id'=>$invoice->customer->id])->first();
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
				$ledger->debit = $saleReturn->total_after_pnf;
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

				$ledger->debit = $saleReturn->sale_tax_amount;

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
				$ledger->debit = $saleReturn->fright_amount;
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
				foreach($saleReturn->sale_return_rows as $sale_return_row){
					$query = $this->SaleReturns->Invoices->InvoiceRows->query();
						$query->update()
							->set(['sale_return_quantity'=>$sale_return_row->quantity])
							->where(['invoice_id' => $invoice->id])
							->execute();
					}
				 $saleReturn->check=array_filter($saleReturn->check);
					$i=0; 
					foreach($saleReturn->check as $sale_return_row){
				
						$item_id=$sale_return_row;
						$item_detail=$this->SaleReturns->ItemLedgers->find()->where(['item_id'=>$sale_return_row,'source_id'=>$invoice->id,'source_model != '=>'Sale Return','in_out'=>'In'])->first();
						//pr($item_detail); exit;
						$itemLedger = $this->SaleReturns->ItemLedgers->newEntity();
						$itemLedger->item_id = $item_id;
						$itemLedger->quantity = $saleReturn->sale_return_rows[$i]['quantity'];
						$itemLedger->source_model = 'Sale Return';
						$itemLedger->source_id = $saleReturn->id;
						$itemLedger->in_out = 'In';
						if(!$item_detail){
							$itemLedger->rate = 0;
						}else{
							$itemLedger->rate = $item_detail->rate;
						}
						$itemLedger->company_id = $invoice->company_id;
						$itemLedger->processed_on = date("Y-m-d");
						$this->SaleReturns->ItemLedgers->save($itemLedger);
						$i++;
					}
					
					$query = $this->SaleReturns->Invoices->query();
						$query->update()
							->set(['sale_return_status' => 'Yes','sale_return_id'=>$saleReturn->id])
							->where(['id' => $invoice->id])
							->execute();
					
								//Reference Number coding
					if(sizeof(@$ref_rows)>0){
						foreach($ref_rows as $ref_row){ 
							$ref_row=(object)$ref_row;
							
							if($ref_row->ref_type=='New Reference' or $ref_row->ref_type=='Advance Reference'){
								$query = $this->SaleReturns->ReferenceBalances->query();
								$query->insert(['ledger_account_id', 'reference_no', 'credit', 'debit'])
								->values([
									'ledger_account_id' => $c_LedgerAccount->id,
									'reference_no' => $ref_row->ref_no,
									'credit' => $ref_row->ref_amount,
									'debit' => 0
								]);
								$query->execute();
							}else{ 
								$ReferenceBalance=$this->SaleReturns->ReferenceBalances->find()->where(['ledger_account_id'=>$c_LedgerAccount->id,'reference_no'=>$ref_row->ref_no])->first();
								
								$ReferenceBalance=$this->SaleReturns->ReferenceBalances->get($ReferenceBalance->id);
								
								$ReferenceBalance->credit=$ReferenceBalance->credit+$ref_row->ref_amount;
								//pr($ReferenceBalance); exit;
								$this->SaleReturns->ReferenceBalances->save($ReferenceBalance);
							}
							$query = $this->SaleReturns->ReferenceDetails->query();
							$query->insert(['ledger_account_id', 'sale_return_id', 'reference_no', 'credit', 'debit', 'reference_type'])
							->values([
								'ledger_account_id' => $c_LedgerAccount->id,
								'sale_return_id' => $saleReturn->id,
								'reference_no' => $ref_row->ref_no,
								'credit' => $ref_row->ref_amount,
								'debit' => 0,
								'reference_type' => $ref_row->ref_type
							]);
						
							$query->execute();
						}
					}
				
				
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
		$session = $this->request->session();
		$st_company_id = $session->read('st_company_id');
		$this->viewBuilder()->layout('index_layout');
        $saleReturn = $this->SaleReturns->newEntity();
		$invoice_id=@(int)$this->request->query('invoice');
		$invoice = $this->SaleReturns->Invoices->get($invoice_id, [
            'contain' => ['SaleReturns'=> ['SaleReturnRows'],'InvoiceRows' => ['Items'=>['ItemSerialNumbers'=>function($q) use($invoice_id){
							return $q->where(['ItemSerialNumbers.Status' => 'Out','ItemSerialNumbers.invoice_id'=>$invoice_id]);
							},'ItemCompanies'=>function($q) use($st_company_id){
							return $q->where(['ItemCompanies.company_id' => $st_company_id]);
							}]],'SaleTaxes','Companies','Customers'=>['CustomerAddress'=> function ($q) {
						return $q
						->where(['CustomerAddress.default_address' => 1]);}],'Employees','SaleTaxes']
        ]);
		$c_LedgerAccount=$this->SaleReturns->LedgerAccounts->find()->where(['company_id'=>$st_company_id,'source_model'=>'Customers','source_id'=>$invoice->customer->id])->first();
		//pr($invoice); exit;
		$sale_return_id=$invoice->sale_return_id;
		$ReferenceDetails=$this->SaleReturns->ReferenceDetails->find()->where(['ledger_account_id'=>$c_LedgerAccount->id,'sale_return_id'=>$sale_return_id]);
		$sale_return_id=$invoice->sale_return_id;
		$saleReturn = $this->SaleReturns->get($sale_return_id, [
            'contain' => ['SaleReturnRows']
        ]);
        
        if ($this->request->is(['patch', 'post', 'put'])) {
            $saleReturn = $this->SaleReturns->patchEntity($saleReturn, $this->request->data);
			$ref_rows=$this->request->data['ref_rows'];
            $saleReturn = $this->SaleReturns->patchEntity($saleReturn, $this->request->data);
			foreach($saleReturn->sale_return_rows as $sale_return_row){   
				if($sale_return_row->item_serial_numbers){
					$item_serial_no=implode(",",$sale_return_row->item_serial_numbers );
					$sale_return_row->item_serial_number=$item_serial_no;
				}
					
			}

        if ($this->SaleReturns->save($saleReturn)) {

				
				$this->SaleReturns->Ledgers->deleteAll(['voucher_id' => $saleReturn->id, 'voucher_source' => 'Sale Return']);
				$this->SaleReturns->ItemLedgers->deleteAll(['source_id' => $saleReturn->id, 'source_model' => 'Sale Return','company_id'=>$st_company_id]);
				
				
				
				$c_LedgerAccount=$this->SaleReturns->LedgerAccounts->find()->where(['company_id'=>$st_company_id,'source_model'=>'Customers','source_id'=>$invoice->customer->id])->first();
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
				$ledger->debit = $saleReturn->total_after_pnf;
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
				$ledger->debit = $saleReturn->fright_amount;
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
					$ItemSerialNumbers=$this->SaleReturns->ItemSerialNumbers->find()->where(['sale_return_id'=>$saleReturn->id]);
					foreach($ItemSerialNumbers as $ItemSerialNumber){   
						$query = $this->SaleReturns->SaleReturnRows->ItemSerialNumbers->query();
								$query->update()
									->set(['status' => 'Out','sale_return_id'=>0])
									->where(['id' => $ItemSerialNumber->id,'invoice_id' => $invoice->id])
									->execute();
					
					}
				}
				foreach($saleReturn->sale_return_rows as $sale_return_row){
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
				foreach($saleReturn->sale_return_rows as $sale_return_row){
					$query = $this->SaleReturns->Invoices->InvoiceRows->query();
						$query->update()
							->set(['sale_return_quantity'=>$sale_return_row->quantity])
							->where(['invoice_id' => $invoice->id])
							->execute();
					}
				 $saleReturn->check=array_filter($saleReturn->check);
					$i=0; 
					foreach($saleReturn->check as $sale_return_row){
				
						$item_id=$sale_return_row;
						$item_detail=$this->SaleReturns->ItemLedgers->find()->where(['item_id'=>$sale_return_row,'source_id'=>$invoice->id,'source_model'=>'Invoices'])->first();
						$itemLedger = $this->SaleReturns->ItemLedgers->newEntity();
						$itemLedger->item_id = $item_id;
						$itemLedger->quantity = $saleReturn->sale_return_rows[$i]['quantity'];
						$itemLedger->source_model = 'Sale Return';
						$itemLedger->source_id = $saleReturn->id;
						$itemLedger->in_out = 'In';
						$itemLedger->rate = $item_detail->rate;
						$itemLedger->company_id = $invoice->company_id;
						$itemLedger->processed_on = date("Y-m-d");
						$this->SaleReturns->ItemLedgers->save($itemLedger);
						$i++;
					}
					
					$query = $this->SaleReturns->Invoices->query();
						$query->update()
							->set(['sale_return_status' => 'Yes','sale_return_id'=>$saleReturn->id])
							->where(['id' => $invoice->id])
							->execute();
					
					if(sizeof(@$ref_rows)>0){
						foreach($ref_rows as $ref_row){
							$ref_row=(object)$ref_row;

							$ReferenceDetail=$this->SaleReturns->ReferenceDetails->find()->where(['ledger_account_id'=>$c_LedgerAccount->id,'reference_no'=>$ref_row->ref_no,'sale_return_id'=>$saleReturn->id])->first();
							
							if($ReferenceDetail){ //pr($ref_row->ref_old_amount); exit;
								$ReferenceBalance=$this->SaleReturns->ReferenceBalances->find()->where(['ledger_account_id'=>$c_LedgerAccount->id,'reference_no'=>$ref_row->ref_no])->first();
								$ReferenceBalance=$this->SaleReturns->ReferenceBalances->get($ReferenceBalance->id);
								$ReferenceBalance->credit=$ReferenceBalance->credit-$ref_row->ref_old_amount+$ref_row->ref_amount;
								$this->SaleReturns->ReferenceBalances->save($ReferenceBalance);
								
								$ReferenceDetail=$this->SaleReturns->ReferenceDetails->find()->where(['ledger_account_id'=>$c_LedgerAccount->id,'reference_no'=>$ref_row->ref_no,'sale_return_id'=>$saleReturn->id])->first();
								
								$ReferenceDetail=$this->SaleReturns->ReferenceDetails->get($ReferenceDetail->id);
								$ReferenceDetail->credit=$ReferenceDetail->credit-$ref_row->ref_old_amount+$ref_row->ref_amount;
								$this->SaleReturns->ReferenceDetails->save($ReferenceDetail);
							}else{
								if($ref_row->ref_type=='New Reference' or $ref_row->ref_type=='Advance Reference'){
									$query = $this->SaleReturns->ReferenceBalances->query();
									$query->insert(['ledger_account_id', 'reference_no', 'credit', 'debit'])
									->values([
										'ledger_account_id' => $c_LedgerAccount->id,
										'reference_no' => $ref_row->ref_no,
										'credit' => $ref_row->ref_amount,
										'debit' => 0
									])
									->execute();
									
								}else{
									$ReferenceBalance=$this->SaleReturns->ReferenceBalances->find()->where(['ledger_account_id'=>$c_LedgerAccount->id,'reference_no'=>$ref_row->ref_no])->first();
									$ReferenceBalance=$this->SaleReturns->ReferenceBalances->get($ReferenceBalance->id);
									$ReferenceBalance->credit=$ReferenceBalance->credit+$ref_row->ref_amount;
									
									$this->SaleReturns->ReferenceBalances->save($ReferenceBalance);
								}
								

								$query = $this->SaleReturns->ReferenceDetails->query();
								$query->insert(['ledger_account_id', 'sale_return_id', 'reference_no', 'credit', 'debit', 'reference_type'])
								->values([
									'ledger_account_id' => $c_LedgerAccount->id,
									'sale_return_id' => $saleReturn->id,
									'reference_no' => $ref_row->ref_no,
									'credit' => $ref_row->ref_amount,
									'debit' => 0,
									'reference_type' => $ref_row->ref_type
								])
								->execute();
								
							}
						}
					}
					
				
                $this->Flash->success(__('The sale return has been saved.'));

                return $this->redirect(['action' => 'index']);

            } else { 
                $this->Flash->error(__('The sale return could not be saved. Please, try again.'));
            }
        }
		
		foreach($invoice->sale_return->sale_return_rows as $sale_return_row){
			if($sale_return_row->item_serial_number){
			@$ItemSerialNumber_In[$sale_return_row->item_id]= explode(",",$sale_return_row->item_serial_number);
			$ItemSerialNumber[$sale_return_row->item_id]=$this->SaleReturns->SaleReturnRows->ItemSerialNumbers->find()->where(['item_id'=>$sale_return_row->item_id,'status'=>'In','company_id'=>$st_company_id])->orWhere(['ItemSerialNumbers.invoice_id'=>$invoice->id,'item_id'=>$sale_return_row->item_id,'status'=>'Out','company_id'=>$st_company_id])->toArray();
			}
				
		}
		//pr($ItemSerialNumber); exit;
		
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
        $this->set(compact('saleReturn','ledger_account_details','ledger_account_details_for_fright','Transporter', 'financial_year_data','customers', 'saleTaxes', 'companies', 'salesOrders', 'employees', 'transporters', 'stLedgerAccounts','invoice','ItemSerialNumber','ReferenceDetails','c_LedgerAccount'));
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
	public function fetchRefNumbersEdit($received_from_id=null,$reference_no=null,$credit=null){
		$this->viewBuilder()->layout('');
		$ReferenceBalances=$this->SaleReturns->ReferenceBalances->find()->where(['ledger_account_id'=>$received_from_id]);
		$this->set(compact('ReferenceBalances', 'reference_no', 'credit'));
	}
	function deleteOneRefNumbers(){
		$old_received_from_id=$this->request->query['old_received_from_id'];
		$sale_return_id=$this->request->query['sale_return_id'];
		$old_ref=$this->request->query['old_ref'];
		$old_ref_type=$this->request->query['old_ref_type'];
		//pr($old_ref_type); exit;
		if($old_ref_type=="New Reference" || $old_ref_type=="Advance Reference"){
			$this->SaleReturns->ReferenceBalances->deleteAll(['ledger_account_id'=>$old_received_from_id,'reference_no'=>$old_ref]);
			$this->SaleReturns->ReferenceDetails->deleteAll(['ledger_account_id'=>$old_received_from_id,'reference_no'=>$old_ref]);
		}elseif($old_ref_type=="Against Reference"){
			$ReferenceDetail=$this->SaleReturns->ReferenceDetails->find()->where(['ledger_account_id'=>$old_received_from_id,'sale_return_id'=>$sale_return_id,'reference_no'=>$old_ref])->first();
			if(!empty($ReferenceDetail->credit)){
				$ReferenceBalance=$this->SaleReturns->ReferenceBalances->find()->where(['ledger_account_id' => $ReferenceDetail->ledger_account_id, 'reference_no' => $ReferenceDetail->reference_no])->first();
				$ReferenceBalance=$this->SaleReturns->ReferenceBalances->get($ReferenceBalance->id);
				$ReferenceBalance->credit=$ReferenceBalance->credit-$ReferenceDetail->credit;
				$this->SaleReturns->ReferenceBalances->save($ReferenceBalance);
			}elseif(!empty($ReferenceDetail->debit)){
				$ReferenceBalance=$this->SaleReturns->ReferenceBalances->find()->where(['ledger_account_id' => $ReferenceDetail->ledger_account_id, 'reference_no' => $ReferenceDetail->reference_no])->first();
				$ReferenceBalance=$this->SaleReturns->ReferenceBalances->get($ReferenceBalance->id);
				$ReferenceBalance->debit=$ReferenceBalance->debit-$ReferenceDetail->debit;
				$this->SaleReturns->ReferenceBalances->save($ReferenceBalance);
			}
			$RDetail=$this->SaleReturns->ReferenceDetails->get($ReferenceDetail->id);
			$this->SaleReturns->ReferenceDetails->delete($RDetail);
		}
		
		exit;
	}
}
