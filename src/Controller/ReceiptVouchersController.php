<?php
namespace App\Controller;

use App\Controller\AppController;

/**
 * ReceiptVouchers Controller
 *
 * @property \App\Model\Table\ReceiptVouchersTable $ReceiptVouchers
 */
class ReceiptVouchersController extends AppController
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
            'contain' => ['ReceivedFroms', 'BankCashes']
        ];
		
		$session = $this->request->session();
		$st_company_id = $session->read('st_company_id');
        $receiptVouchers = $this->paginate($this->ReceiptVouchers->find()->where(['company_id'=>$st_company_id])->order(['transaction_date' => 'DESC']));

        $this->set(compact('receiptVouchers'));
        $this->set('_serialize', ['receiptVouchers']);
    }

    /**
     * View method
     *
     * @param string|null $id Receipt Voucher id.
     * @return \Cake\Network\Response|null
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function view($id = null)
    {
		$this->viewBuilder()->layout('index_layout');
        $receiptVoucher = $this->ReceiptVouchers->get($id, [
            'contain' => ['ReceivedFroms', 'BankCashes','Companies','Creator','ReceiptBreakups'=>['Invoices']]
        ]);

        $this->set('receiptVoucher', $receiptVoucher);
        $this->set('_serialize', ['receiptVoucher']);
    }

    /**
     * Add method
     *
     * @return \Cake\Network\Response|void Redirects on successful add, renders view otherwise.
     */
	 
	public function fetchReferenceNo($ledger_account_id=null)
    {
		$this->viewBuilder()->layout('ajax_layout');
		echo $ledger_account_id;
		$ReferenceDetails=$this->ReceiptVouchers->ReferenceBalances->find()->where(['ledger_account_id' => $ledger_account_id])->toArray();
		$this->set(compact(['ReferenceDetails']));
	}
    public function add()
    {
		$this->viewBuilder()->layout('index_layout');
        $receiptVoucher = $this->ReceiptVouchers->newEntity();
		$s_employee_id=$this->viewVars['s_employee_id'];
		$session = $this->request->session();
		$st_company_id = $session->read('st_company_id');
		$st_year_id = $session->read('st_year_id');
		$financial_year = $this->ReceiptVouchers->FinancialYears->find()->where(['id'=>$st_year_id])->first();
        
        if ($this->request->is('post')) {
			//pr($this->request->data);
			//exit;
			$total_row=sizeof($this->request->data['reference_no']);
			for($row=0; $row<$total_row; $row++)
		    {
				////////////////  ReferenceDetails ////////////////////////////////
				$query1 = $this->ReceiptVouchers->ReferenceDetails->query();
				$query1->insert(['reference_no', 'ledger_account_id', 'credit', 'debit', 'reference_type'])
				->values([
					'ledger_account_id' => $this->request->data['received_from_id'],
					'reference_no' => $this->request->data['reference_no'][$row],
					'credit' => $this->request->data['credit'][$row],
					'reference_type' => $this->request->data['reference_type'][$row]
				])
				->execute();
				
				////////////////  ReferenceBalances ////////////////////////////////
				$query2 = $this->ReceiptVouchers->ReferenceBalances->query();
				$query2->insert(['reference_no', 'ledger_account_id', 'credit', 'debit'])
				->values([
					'reference_no' => $this->request->data['reference_no'][$row],
					'ledger_account_id' => $this->request->data['received_from_id'],
					'credit' => $this->request->data['credit'][$row],
				])
				->execute();
			}
			
			$last_ref_no=$this->ReceiptVouchers->find()->select(['voucher_no'])->where(['company_id' => $st_company_id])->order(['voucher_no' => 'DESC'])->first();
			if($last_ref_no){
				$receiptVoucher->voucher_no=$last_ref_no->voucher_no+1;
			}else{
				$receiptVoucher->voucher_no=1;
			}
				
            $receiptVoucher = $this->ReceiptVouchers->patchEntity($receiptVoucher, $this->request->data);
			$receiptVoucher->created_by=$s_employee_id;
			$receiptVoucher->transaction_date=date("Y-m-d",strtotime($receiptVoucher->transaction_date));
			$receiptVoucher->created_on=date("Y-m-d");
			$receiptVoucher->company_id=$st_company_id;
			
            if ($this->ReceiptVouchers->save($receiptVoucher)) {
				//Ledger posting for Received From Entity
				$ledger = $this->ReceiptVouchers->Ledgers->newEntity();
				$ledger->company_id=$st_company_id;
				$ledger->ledger_account_id = $receiptVoucher->bank_cash_id;
				$ledger->debit =$receiptVoucher->amount;
				$ledger->credit = 0;
				$ledger->voucher_id = $receiptVoucher->id;
				$ledger->voucher_source = 'Receipt Voucher';
				$ledger->transaction_date = $receiptVoucher->transaction_date;
				$this->ReceiptVouchers->Ledgers->save($ledger);
				
				//Ledger posting for bankcash
				$ledger = $this->ReceiptVouchers->Ledgers->newEntity();
				$ledger->company_id=$st_company_id;
				$ledger->ledger_account_id = $receiptVoucher->received_from_id;
				$ledger->debit = 0;
				$ledger->credit = $receiptVoucher->amount;
				$ledger->voucher_id = $receiptVoucher->id;
				$ledger->voucher_source = 'Receipt Voucher';
				$ledger->transaction_date = $receiptVoucher->transaction_date;
				$this->ReceiptVouchers->Ledgers->save($ledger); 
			
				$this->Flash->success(__('The Receipt-Voucher:'.str_pad($receiptVoucher->id, 4, '0', STR_PAD_LEFT)).' has been genereted.');
				return $this->redirect(['action' => 'view/'.$receiptVoucher->id]);
           
			} else {
                $this->Flash->error(__('The receipt voucher could not be saved. Please, try again.'));
            }
        }
		$vouchersReferences = $this->ReceiptVouchers->VouchersReferences->get(3, [
            'contain' => ['VoucherLedgerAccounts']
        ]);
		$where=[];
		foreach($vouchersReferences->voucher_ledger_accounts as $data){
			$where[]=$data->ledger_account_id;
		}
		if(sizeof($where)>0){
			$receivedFroms = $this->ReceiptVouchers->ReceivedFroms->find('list')->where(['ReceivedFroms.id IN' => $where]);
		}else{
			$ErrorreceivedFroms='true';
		}
				
		$vouchersReferences = $this->ReceiptVouchers->VouchersReferences->get(4, [
            'contain' => ['VoucherLedgerAccounts']
        ]);
		$where=[];
		foreach($vouchersReferences->voucher_ledger_accounts as $data){
			$where[]=$data->ledger_account_id;
		}
		if(sizeof($where)>0){
			$bankCashes = $this->ReceiptVouchers->BankCashes->find('list')->where(['BankCashes.id IN' => $where]);
		}else{
			$ErrorbankCashes='true';
		}
		
		
        $companies = $this->ReceiptVouchers->Companies->find('all');
		
		//pr($customers->bill_to_bill_account); exit;
		$Invoices = $this->ReceiptVouchers->Invoices->find()->where(['company_id'=>$st_company_id,'due_payment >'=>0]);		
        $this->set(compact('receiptVoucher', 'receivedFroms', 'bankCashes','companies','ErrorreceivedFroms','ErrorbankCashes','customers','financial_year'));
        $this->set('_serialize', ['receiptVoucher']);
    }

    /**
     * Edit method
     *
     * @param string|null $id Receipt Voucher id.
     * @return \Cake\Network\Response|void Redirects on successful edit, renders view otherwise.
     * @throws \Cake\Network\Exception\NotFoundException When record not found.
     */
    public function edit($id = null)
    {
    	


    	$this->viewBuilder()->layout('index_layout');
		$s_employee_id=$this->viewVars['s_employee_id'];
		$session = $this->request->session();
		$st_company_id = $session->read('st_company_id');
        $st_year_id = $session->read('st_year_id');
		$financial_year = $this->ReceiptVouchers->FinancialYears->find()->where(['id'=>$st_year_id])->first();
        $receiptVoucher = $this->ReceiptVouchers->get($id, [
            'contain' => []
        ]);

        

        $Em = new FinancialYearsController;
	    $financial_year_data = $Em->checkFinancialYear($receiptVoucher->transaction_date);
       


        if ($this->request->is(['patch', 'post', 'put'])) {
            $receiptVoucher = $this->ReceiptVouchers->patchEntity($receiptVoucher, $this->request->data);
			$receiptVoucher->edited_by=$s_employee_id;
				$receiptVoucher->transaction_date=date("Y-m-d",strtotime($receiptVoucher->transaction_date));
				$receiptVoucher->edited_on=date("Y-m-d");
				$receiptVoucher->company_id=$st_company_id;
			
            if ($this->ReceiptVouchers->save($receiptVoucher)) {
				
				//delete old data
				$this->ReceiptVouchers->Ledgers->deleteAll(['voucher_id' => $receiptVoucher->id, 'voucher_source' => 'Receipt Voucher']);
				//Ledger posting for Received From Entity
				$ledger = $this->ReceiptVouchers->Ledgers->newEntity();
				$ledger->company_id=$st_company_id;
				$ledger->ledger_account_id = $receiptVoucher->bank_cash_id;
				$ledger->debit =$receiptVoucher->amount;
				$ledger->credit = 0;
				$ledger->voucher_id = $receiptVoucher->id;
				$ledger->voucher_source = 'Receipt Voucher';
				$ledger->transaction_date = $receiptVoucher->transaction_date;
				$this->ReceiptVouchers->Ledgers->save($ledger);
				
				//Ledger posting for bankcash
				$ledger = $this->ReceiptVouchers->Ledgers->newEntity();
				$ledger->company_id=$st_company_id;
				$ledger->ledger_account_id = $receiptVoucher->received_from_id;
				$ledger->debit = 0;
				$ledger->credit = $receiptVoucher->amount;;
				$ledger->voucher_id = $receiptVoucher->id;
				$ledger->voucher_source = 'Receipt Voucher';
				$ledger->transaction_date = $receiptVoucher->transaction_date;
				$this->ReceiptVouchers->Ledgers->save($ledger);
                $this->Flash->success(__('The receipt voucher has been saved.'));
				return $this->redirect(['action' => 'view/'.$receiptVoucher->id]);
            } else {
                $this->Flash->error(__('The receipt voucher could not be saved. Please, try again.'));
            }
        }
		
		$vouchersReferences = $this->ReceiptVouchers->VouchersReferences->get(3, [
            'contain' => ['VoucherLedgerAccounts']
        ]);
		$where=[];
		foreach($vouchersReferences->voucher_ledger_accounts as $data){
			$where[]=$data->ledger_account_id;
		}
		$receivedFroms = $this->ReceiptVouchers->ReceivedFroms->find('list')->where(['ReceivedFroms.id IN' => $where]);
				
		$vouchersReferences = $this->ReceiptVouchers->VouchersReferences->get(4, [
            'contain' => ['VoucherLedgerAccounts']
        ]);
		$where=[];
		foreach($vouchersReferences->voucher_ledger_accounts as $data){
			$where[]=$data->ledger_account_id;
		}
		$bankCashes = $this->ReceiptVouchers->BankCashes->find('list')->where(['BankCashes.id IN' => $where]);
		
        $companies = $this->ReceiptVouchers->Companies->find('all');		
        $this->set(compact('receiptVoucher', 'receivedFroms', 'bankCashes','companies','financial_year','financial_year_data'));
        $this->set('_serialize', ['receiptVoucher']);
    }

    /**
     * Delete method
     *
     * @param string|null $id Receipt Voucher id.
     * @return \Cake\Network\Response|null Redirects to index.
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function delete($id = null)
    {
        $this->request->allowMethod(['post', 'delete']);
        $receiptVoucher = $this->ReceiptVouchers->get($id);
        if ($this->ReceiptVouchers->delete($receiptVoucher)) {
            $this->Flash->success(__('The receipt voucher has been deleted.'));
        } else {
            $this->Flash->error(__('The receipt voucher could not be deleted. Please, try again.'));
        }

        return $this->redirect(['action' => 'index']);
    }
}
