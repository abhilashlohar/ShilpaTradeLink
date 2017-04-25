<?php
namespace App\Controller;

use App\Controller\AppController;

/**
 * JournalVouchers Controller
 *
 * @property \App\Model\Table\JournalVouchersTable $JournalVouchers
 */
class JournalVouchersController extends AppController
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
            'contain' => ['JournalVoucherRows']
        ];
		$session = $this->request->session();
		$st_company_id = $session->read('st_company_id');
		
       $journalVouchers = $this->paginate($this->JournalVouchers->find()->where(['company_id'=>$st_company_id])->order(['transaction_date' => 'DESC']));

        $this->set('journalVoucher');
		$this->set(compact('journalVouchers'));
		$this->set('_serialize', ['journalVouchers']);
    }

    /**
     * View method
     *
     * @param string|null $id Journal Voucher id.
     * @return \Cake\Network\Response|null
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function view($id = null)
    {
		
		$this->viewBuilder()->layout('index_layout');
        $journalVoucher = $this->JournalVouchers->get($id, [
            'contain' => ['Companies','JournalVoucherRows'=>['LedgerAccounts'],'Companies','Creator']
        ]);

        $this->set('journalVoucher', $journalVoucher);
        $this->set('_serialize', ['journalVoucher']);
    }

    /**
     * Add method
     *
     * @return \Cake\Network\Response|void Redirects on successful add, renders view otherwise.
     */
    public function add()
    {
		
		$this->viewBuilder()->layout('index_layout');
        $journalVoucher = $this->JournalVouchers->newEntity();
		$s_employee_id=$this->viewVars['s_employee_id'];
		$session = $this->request->session();
		$st_company_id = $session->read('st_company_id');
        $st_year_id = $session->read('st_year_id');
		$financial_year = $this->JournalVouchers->FinancialYears->find()->where(['id'=>$st_year_id])->first();
    
		if ($this->request->is('post')) {
			$last_ref_no=$this->JournalVouchers->find()->select(['voucher_no'])->where(['company_id' => $st_company_id])->order(['voucher_no' => 'DESC'])->first();
			if($last_ref_no){
				$journalVoucher->voucher_no=$last_ref_no->voucher_no+1;
			}else{
				$journalVoucher->voucher_no=1;
			}
            $journalVoucher = $this->JournalVouchers->patchEntity($journalVoucher, $this->request->data);
			
			$journalVoucher->created_by=$s_employee_id;
			$journalVoucher->transaction_date=date("Y-m-d",strtotime($journalVoucher->transaction_date));
			$journalVoucher->created_on=date("Y-m-d");
			$journalVoucher->company_id=$st_company_id;
			
			if ($this->JournalVouchers->save($journalVoucher)) {
			
					foreach($journalVoucher->journal_voucher_rows as $journal_voucher_rows){
					
					$ledger = $this->JournalVouchers->Ledgers->newEntity();
					$ledger->ledger_account_id = $journal_voucher_rows->ledger_account_id;
					
					if($journal_voucher_rows->cr_dr=='Dr'){
						$ledger->debit = $journal_voucher_rows->amount;
						$ledger->credit = 0;
					}
					else {
						$ledger->debit = 0;
						$ledger->credit = $journal_voucher_rows->amount;
					}
					$ledger->company_id=$st_company_id;
					$ledger->voucher_id = $journalVoucher->id;
					$ledger->voucher_source = 'Journal Voucher';
					$ledger->transaction_date = $journalVoucher->created_on;
					$ledger->company_id = $st_company_id;
					//pr($ledger); exit;
					$this->JournalVouchers->Ledgers->save($ledger);
					}
					$this->Flash->success(__('The Journal-Voucher:'.str_pad($journalVoucher->voucher_no, 4, '0', STR_PAD_LEFT)).' has been genereted.');
					return $this->redirect(['action' => 'view/'.$journalVoucher->id]);
            
				} 
			
           else {
                $this->Flash->error(__('The journal voucher could not be saved. Please, try again.'));
            }
		}
		$vr=$this->JournalVouchers->VouchersReferences->find()->where(['company_id'=>$st_company_id,'module'=>'Journal Voucher','sub_entity'=>'Ledger'])->first();
		$JournalVoucherLedger=$vr->id;
		$vouchersReferences = $this->JournalVouchers->VouchersReferences->get($vr->id, [
          'contain' => ['VoucherLedgerAccounts']
        ]);
		//pr($vouchersReferences); exit;
		$where=[];
		foreach($vouchersReferences->voucher_ledger_accounts as $data){
			$where[]=$data->ledger_account_id;
		}
		if(sizeof($where)>0){
			$ledgers = $this->JournalVouchers->LedgerAccounts->find('list',
				['keyField' => function ($row) {
					return $row['id'];
				},
				'valueField' => function ($row) {
					if(!empty($row['alias'])){
						return  $row['name'] . ' (' . $row['alias'] . ')';
					}else{
						return $row['name'];
					}
					
				}])->where(['LedgerAccounts.id IN' => $where]);
		}
		else{
			$Errorledgers='true';
		}
		$companies = $this->JournalVouchers->Companies->find('all');
		
		$ReceivedFroms_selected='yes';
		if(sizeof($where)>0){
			$receivedFroms = $this->JournalVouchers->ReceivedFroms->find('list',
				['keyField' => function ($row) {
					return $row['id'];
				},
				'valueField' => function ($row) {
					if(!empty($row['alias'])){
						return  $row['name'] . ' (' . $row['alias'] . ')';
					}else{
						return $row['name'];
					}
					
				}])->where(['ReceivedFroms.id IN' => $where]);
		}else{
			$ReceivedFroms_selected='no';
		}
        
        $this->set(compact('journalVoucher', 'ledgers','companies','Errorledgers','financial_year','JournalVoucherLedger','receivedFroms','ReceivedFroms_selected'));
        $this->set('_serialize', ['journalVoucher']);
    }

    /**
     * Edit method
     *
     * @param string|null $id Journal Voucher id.
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
		$financial_year = $this->JournalVouchers->FinancialYears->find()->where(['id'=>$st_year_id])->first();
    
        $journalVoucher = $this->JournalVouchers->get($id, [
            'contain' => ['Companies','JournalVoucherRows'=>['LedgerAccounts'],'Companies','Creator']
        ]);

        $Em = new FinancialYearsController;
	    $financial_year_data = $Em->checkFinancialYear($journalVoucher->transaction_date);


        if ($this->request->is(['patch', 'post', 'put'])) {
            $journalVoucher = $this->JournalVouchers->patchEntity($journalVoucher, $this->request->data);
			$journalVoucher->edited_by=$s_employee_id;
			$journalVoucher->transaction_date=date("Y-m-d",strtotime($journalVoucher->transaction_date));
			$journalVoucher->edited_on=date("Y-m-d");
			$journalVoucher->company_id=$st_company_id;
			$journalVoucher->created_by = $journalVoucher -> created_by;
			$journalVoucher->created_on = $journalVoucher -> created_on;
            if ($this->JournalVouchers->save($journalVoucher)) {
				
				$this->JournalVouchers->Ledgers->deleteAll(['voucher_id' => $journalVoucher->id, 'voucher_source' => 'Journal Voucher']);
				
				foreach($journalVoucher->journal_voucher_rows as $journal_voucher_rows){
					$ledger = $this->JournalVouchers->Ledgers->newEntity();
					$ledger->ledger_account_id = $journal_voucher_rows->ledger_account_id;
					
					if($journal_voucher_rows->cr_dr=='Dr'){
						$ledger->debit = $journal_voucher_rows->amount;
						$ledger->credit = 0;
					}
					else {
						$ledger->debit = 0;
						$ledger->credit = $journal_voucher_rows->amount;
					}
					$ledger->company_id=$st_company_id;
					$ledger->voucher_id = $journalVoucher->id;
					$ledger->voucher_source = 'Journal Voucher';
					$ledger->transaction_date = $journalVoucher->created_on;
					$ledger->company_id = $st_company_id;
					//pr($ledger); exit;
					$this->JournalVouchers->Ledgers->save($ledger);
					}
					return $this->redirect(['action' => 'view/'.$journalVoucher->id]);
				} else {
                $this->Flash->error(__('The journal voucher could not be saved. Please, try again.'));
            }
        }
		
		$vr=$this->JournalVouchers->VouchersReferences->find()->where(['company_id'=>$st_company_id,'module'=>'Journal Voucher','sub_entity'=>'Ledger'])->first();
		$vouchersReferences = $this->JournalVouchers->VouchersReferences->get($vr->id, [
          'contain' => ['VoucherLedgerAccounts']
        ]);
		//pr($vouchersReferences); exit;
		$where=[];
		foreach($vouchersReferences->voucher_ledger_accounts as $data){
			$where[]=$data->ledger_account_id;
		}

		$ledgers = $this->JournalVouchers->LedgerAccounts->find('list',
				['keyField' => function ($row) {
					return $row['id'];
				},
				'valueField' => function ($row) {
					if(!empty($row['alias'])){
						return  $row['name'] . ' (' . $row['alias'] . ')';
					}else{
						return $row['name'];
					}
					
				}])->where(['LedgerAccounts.id IN' => $where]);
        $companies = $this->JournalVouchers->Companies->find('all');
        $this->set(compact('journalVoucher', 'companies','ledgers','financial_year','financial_year_data'));
        $this->set('_serialize', ['journalVoucher']);
    }

    /**
     * Delete method
     *
     * @param string|null $id Journal Voucher id.
     * @return \Cake\Network\Response|null Redirects to index.
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function delete($id = null)
    {
        $this->request->allowMethod(['post', 'delete']);
        $journalVoucher = $this->JournalVouchers->get($id);
        if ($this->JournalVouchers->delete($journalVoucher)) {
            $this->Flash->success(__('The journal voucher has been deleted.'));
        } else {
            $this->Flash->error(__('The journal voucher could not be deleted. Please, try again.'));
        }

        return $this->redirect(['action' => 'index']);
    }
	function checkRefNumberUnique($received_from_id,$i){
		$reference_no=$this->request->query['ref_rows'][$received_from_id][$i]['ref_no'];
		$ReferenceBalances=$this->JournalVouchers->ReferenceBalances->find()->where(['ledger_account_id'=>$received_from_id,'reference_no'=>$reference_no]);
		if($ReferenceBalances->count()==0){
			echo 'true';
		}else{
			echo 'false';
		}
		exit;
	}
}
