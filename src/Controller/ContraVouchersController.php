<?php
namespace App\Controller;

use App\Controller\AppController;

/**
 * ContraVouchers Controller
 *
 * @property \App\Model\Table\ContraVouchersTable $ContraVouchers
 */
class ContraVouchersController extends AppController
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
            'contain' => ['CashBankFroms','CashBankTos']
        ];
		
		$session = $this->request->session();
		$st_company_id = $session->read('st_company_id');
        $contraVouchers = $this->paginate($this->ContraVouchers->find()->where(['company_id'=>$st_company_id])->order(['transaction_date' => 'DESC']));

        $this->set(compact('contraVouchers'));
        $this->set('_serialize', ['contraVouchers']);
    }

    /**
     * View method
     *
     * @param string|null $id Contra Voucher id.
     * @return \Cake\Network\Response|null
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function view($id = null)
    {
		
		$this->viewBuilder()->layout('index_layout');
        $contraVoucher = $this->ContraVouchers->get($id, [
            'contain' => ['Companies','CashBankFroms','CashBankTos','Creator']
        ]);

        $this->set('contraVoucher', $contraVoucher);
        $this->set('_serialize', ['contraVoucher']);
    }
 
    /**
     * Add method
     *
     * @return \Cake\Network\Response|void Redirects on successful add, renders view otherwise.
     */
    public function add()
    {
		
		$this->viewBuilder()->layout('index_layout');
        $contraVoucher = $this->ContraVouchers->newEntity();
		$s_employee_id=$this->viewVars['s_employee_id'];
		$session = $this->request->session();
		$st_company_id = $session->read('st_company_id');
        
        if ($this->request->is('post')) {
			$last_ref_no=$this->ContraVouchers->find()->select(['voucher_no'])->where(['company_id' => $st_company_id])->order(['voucher_no' => 'DESC'])->first();
			if($last_ref_no){
				$contraVoucher->voucher_no=$last_ref_no->voucher_no+1;
			}else{
				$contraVoucher->voucher_no=1;
			}
            $contraVoucher = $this->ContraVouchers->patchEntity($contraVoucher, $this->request->data);
			$contraVoucher->created_by=$s_employee_id;
			$contraVoucher->transaction_date=date("Y-m-d",strtotime($contraVoucher->transaction_date));
			$contraVoucher->created_on=date("Y-m-d");
			$contraVoucher->company_id=$st_company_id;
			
			if ($this->ContraVouchers->save($contraVoucher)) {
				$ledger = $this->ContraVouchers->Ledgers->newEntity();
				$ledger->company_id=$st_company_id;
				$ledger->ledger_account_id = $contraVoucher->cash_bank_from;
				$ledger->debit = 0;
				$ledger->credit = $contraVoucher->amount;
				$ledger->voucher_id = $contraVoucher->id;
				$ledger->voucher_source = 'Contra Voucher';
				$ledger->transaction_date = $contraVoucher->transaction_date;
				$this->ContraVouchers->Ledgers->save($ledger);
				//Ledger posting for bankcash
				$ledger = $this->ContraVouchers->Ledgers->newEntity();
				$ledger->company_id=$st_company_id;
				$ledger->ledger_account_id = $contraVoucher->cash_bank_to;
				$ledger->debit =  $contraVoucher->amount;
				$ledger->credit = 0;
				$ledger->voucher_id = $contraVoucher->id;
				$ledger->voucher_source = 'Contra Voucher';
				$ledger->transaction_date = $contraVoucher->transaction_date;
				$this->ContraVouchers->Ledgers->save($ledger);
				$this->Flash->success(__('The Contra-Voucher:'.str_pad($contraVoucher->voucher_no, 4, '0', STR_PAD_LEFT)).' has been genereted.');
				return $this->redirect(['action' => 'view/'.$contraVoucher->id]);
			}
           else {
                $this->Flash->error(__('The contra voucher could not be saved. Please, try again.'));
            }
        }
		
		$vouchersReferences = $this->ContraVouchers->VouchersReferences->get(7, [
            'contain' => ['VoucherLedgerAccounts']
        ]);
		
		$where=[];
		foreach($vouchersReferences->voucher_ledger_accounts as $data){
			$where[]=$data->ledger_account_id;
		}
		if(sizeof($where)>0){
			$cashBankFroms = $this->ContraVouchers->CashBankFroms->find('list')->where(['cashBankFroms.id IN' => $where]);
		}
		else{
			$ErrorcashBankFroms='true';
		}
		
		$vouchersReferences = $this->ContraVouchers->VouchersReferences->get(8, [
            'contain' => ['VoucherLedgerAccounts']
        ]);
		$where=[];
		foreach($vouchersReferences->voucher_ledger_accounts as $data){
			  $where[]=$data->ledger_account_id;
		
		}
		if(sizeof($where)>0){
			$cashBankTos = $this->ContraVouchers->CashBankTos->find('list')->where(['cashBankTos.id IN' => $where]);
		}
		else{
			$ErrorcashBankTos='true';
		}
		
		
		$companies = $this->ContraVouchers->Companies->find('all');
        
        $this->set(compact('contraVoucher', 'cashBankFroms', 'cashBankTos','companies','ErrorcashBankTos','ErrorcashBankFroms'));
        $this->set('_serialize', ['contraVoucher']);
    }

    /**
     * Edit method
     *
     * @param string|null $id Contra Voucher id.
     * @return \Cake\Network\Response|void Redirects on successful edit, renders view otherwise.
     * @throws \Cake\Network\Exception\NotFoundException When record not found.
     */
    public function edit($id = null)
    {
		$this->viewBuilder()->layout('index_layout');
		$s_employee_id=$this->viewVars['s_employee_id'];
		$session = $this->request->session();
		$st_company_id = $session->read('st_company_id');
        
		$contraVoucher = $this->ContraVouchers->get($id, [
            'contain' => []
        ]);
        if ($this->request->is(['patch', 'post', 'put'])) {
            $contraVoucher = $this->ContraVouchers->patchEntity($contraVoucher, $this->request->data);
			
			$contraVoucher->edited_by=$s_employee_id;
			$contraVoucher->transaction_date=date("Y-m-d",strtotime($contraVoucher->transaction_date));
			$contraVoucher->edited_on=date("Y-m-d");
			$contraVoucher->company_id=$st_company_id;
			
            if ($this->ContraVouchers->save($contraVoucher)) 
			{
				$this->ContraVouchers->Ledgers->deleteAll(['voucher_id' => $contraVoucher->id, 'voucher_source' => 'Contra Voucher']);
				
				$ledger = $this->ContraVouchers->Ledgers->newEntity();
				$ledger->company_id=$st_company_id;
				$ledger->ledger_account_id = $contraVoucher->cash_bank_from;
				$ledger->debit = 0;
				$ledger->credit = $contraVoucher->amount;
				$ledger->voucher_id = $contraVoucher->id;
				$ledger->voucher_source = 'Contra Voucher';
				$ledger->transaction_date = $contraVoucher->transaction_date;
				$this->ContraVouchers->Ledgers->save($ledger);
				
				//Ledger posting for bankcash
				$ledger = $this->ContraVouchers->Ledgers->newEntity();
				$ledger->company_id=$st_company_id;
				$ledger->ledger_account_id = $contraVoucher->cash_bank_to;
				$ledger->debit =  $contraVoucher->amount;
				$ledger->credit = 0;
				$ledger->voucher_id = $contraVoucher->id;
				$ledger->voucher_source = 'Contra Voucher';
				$ledger->transaction_date = $contraVoucher->transaction_date;
				$this->ContraVouchers->Ledgers->save($ledger);
				
				$this->Flash->success(__('The contra voucher has been saved.'));
					return $this->redirect(['action' => 'view/'.$contraVoucher->id]);
			} else {
                $this->Flash->error(__('The contra voucher could not be saved. Please, try again.'));
            }
        }
		
		$vouchersReferences = $this->ContraVouchers->VouchersReferences->get(7, [
            'contain' => ['VoucherLedgerAccounts']
        ]);
		
		$where=[];
		foreach($vouchersReferences->voucher_ledger_accounts as $data){
			$where[]=$data->ledger_account_id;
		}

		$cashBankFroms = $this->ContraVouchers->CashBankFroms->find('list')->where(['cashBankFroms.id IN' => $where]);
		
			
		$vouchersReferences = $this->ContraVouchers->VouchersReferences->get(8, [
            'contain' => ['VoucherLedgerAccounts']
        ]);
		$where=[];
		foreach($vouchersReferences->voucher_ledger_accounts as $data){
			  $where[]=$data->ledger_account_id;
		
		}

		$cashBankTos = $this->ContraVouchers->CashBankTos->find('list')->where(['cashBankTos.id IN' => $where]);
		
		$companies = $this->ContraVouchers->Companies->find('all');
        
        $this->set(compact('contraVoucher', 'cashBankFroms', 'cashBankTos','companies'));
        $this->set('_serialize', ['contraVoucher']);
    }

    /**
     * Delete method
     *
     * @param string|null $id Contra Voucher id.
     * @return \Cake\Network\Response|null Redirects to index.
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function delete($id = null)
    {
        $this->request->allowMethod(['post', 'delete']);
        $contraVoucher = $this->ContraVouchers->get($id);
        if ($this->ContraVouchers->delete($contraVoucher)) {
            $this->Flash->success(__('The contra voucher has been deleted.'));
        } else {
            $this->Flash->error(__('The contra voucher could not be deleted. Please, try again.'));
        }

        return $this->redirect(['action' => 'index']);
    }
}
