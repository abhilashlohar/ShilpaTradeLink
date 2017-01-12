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
        $receiptVouchers = $this->paginate($this->ReceiptVouchers->find()->order(['transaction_date' => 'DESC']));

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
            'contain' => ['ReceivedFroms', 'BankCashes','Companies']
        ]);

        $this->set('receiptVoucher', $receiptVoucher);
        $this->set('_serialize', ['receiptVoucher']);
    }

    /**
     * Add method
     *
     * @return \Cake\Network\Response|void Redirects on successful add, renders view otherwise.
     */
    public function add()
    {
		$this->viewBuilder()->layout('index_layout');
        $receiptVoucher = $this->ReceiptVouchers->newEntity();
		$s_employee_id=$this->viewVars['s_employee_id'];
		$session = $this->request->session();
		$st_company_id = $session->read('st_company_id');
        
        if ($this->request->is('post')) {
			$receipt_breakups=[];
			foreach($this->request->data['invoice_record'] as $invoice_record){
					if(@$invoice_record['checkbox']){
					$receipt_breakups[]=['ref_type'=>'Agst Ref','new_ref_no'=>'','invoice_id'=>$invoice_record['invoice_id'],'amount'=>$invoice_record['invoice_amount']];
					
					
				}
			} 
			foreach($this->request->data['new_ref_record'] as $new_ref_record){
				$receipt_breakups[]=['ref_type'=>$new_ref_record['type'],'new_ref_no'=>@$new_ref_record['new_ref_no'],'invoice_id'=>0,'amount'=>$new_ref_record['amount']];
			}
			$this->request->data['receipt_breakups']=$receipt_breakups;
			
            $receiptVoucher = $this->ReceiptVouchers->patchEntity($receiptVoucher, $this->request->data);
			$receiptVoucher->created_by=$s_employee_id;
			$receiptVoucher->transaction_date=date("Y-m-d",strtotime($receiptVoucher->transaction_date));
			$receiptVoucher->created_on=date("Y-m-d");
			$receiptVoucher->company_id=$st_company_id;
            if ($this->ReceiptVouchers->save($receiptVoucher)) {
				//Ledger posting for Received From Entity
				$ledger = $this->ReceiptVouchers->Ledgers->newEntity();
				$ledger->ledger_account_id = $receiptVoucher->bank_cash_id;
				$ledger->debit =$receiptVoucher->amount;
				$ledger->credit = 0;
				$ledger->voucher_id = $receiptVoucher->id;
				$ledger->voucher_source = 'Receipt Voucher';
				$ledger->transaction_date = $receiptVoucher->transaction_date;
				$this->ReceiptVouchers->Ledgers->save($ledger);
				
				//Ledger posting for bankcash
				$ledger = $this->ReceiptVouchers->Ledgers->newEntity();
				$ledger->ledger_account_id = $receiptVoucher->received_from_id;
				$ledger->debit = 0;
				$ledger->credit = $receiptVoucher->amount;;
				$ledger->voucher_id = $receiptVoucher->id;
				$ledger->voucher_source = 'Receipt Voucher';
				$ledger->transaction_date = $receiptVoucher->transaction_date;
				$this->ReceiptVouchers->Ledgers->save($ledger); 
				
				//Invoice Update 
				$i=0;
				foreach($receiptVoucher->receipt_breakups as $data)
				{
					if($data->invoice_id>0){
					$invoice_id=$data->invoice_id;
					$amount=$data->amount;
					$Invoices=$this->ReceiptVouchers->Invoices->find()->where(['id'=>$invoice_id]);
					
					foreach($Invoices as $data1)
					{
					$due_payment=$data1->due_payment;
					}
					$remaining=$due_payment-$amount;
					$query = $this->ReceiptVouchers->Invoices->query();
					$query->update()
					->set(['due_payment' => $remaining])
					->where(['id' => $invoice_id])
					->execute();
					}
					$i++;
				}
			
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
		$Invoices = $this->ReceiptVouchers->Invoices->find()->where(['company_id'=>$st_company_id,'due_payment >'=>0]);		
        $this->set(compact('receiptVoucher', 'receivedFroms', 'bankCashes','companies','ErrorreceivedFroms','ErrorbankCashes'));
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
        
        $receiptVoucher = $this->ReceiptVouchers->get($id, [
            'contain' => []
        ]);
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
				$ledger->ledger_account_id = $receiptVoucher->bank_cash_id;
				$ledger->debit =$receiptVoucher->amount;
				$ledger->credit = 0;
				$ledger->voucher_id = $receiptVoucher->id;
				$ledger->voucher_source = 'Receipt Voucher';
				$ledger->transaction_date = $receiptVoucher->transaction_date;
				$this->ReceiptVouchers->Ledgers->save($ledger);
				
				//Ledger posting for bankcash
				$ledger = $this->ReceiptVouchers->Ledgers->newEntity();
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
        $this->set(compact('receiptVoucher', 'receivedFroms', 'bankCashes','companies'));
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
