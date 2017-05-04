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
            'contain' => ['InvoiceRows' => ['Items'=>['ItemSerialNumbers'=>function($q) use($st_company_id){
							return $q->where(['ItemSerialNumbers.company_id' => $st_company_id]);
							},'ItemCompanies'=>function($q) use($st_company_id){
							return $q->where(['ItemCompanies.company_id' => $st_company_id]);
							}]],'SaleTaxes','Companies','Customers'=>['CustomerAddress'=> function ($q) {
						return $q
						->where(['CustomerAddress.default_address' => 1]);}],'Employees','SaleTaxes']
        ]);
	
        if ($this->request->is('post')) {
            $saleReturn = $this->SaleReturns->patchEntity($saleReturn, $this->request->data);
            if ($this->SaleReturns->save($saleReturn)) {
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
        $this->set(compact('saleReturn', 'customers', 'saleTaxes', 'companies', 'salesOrders', 'employees', 'transporters','invoice','Transporter','financial_year_data','ledger_account_details','ledger_account_details_for_fright'));
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
}
