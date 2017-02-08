<?php
namespace App\Controller;

use App\Controller\AppController;

/**
 * FinancialYears Controller
 *
 * @property \App\Model\Table\FinancialYearsTable $FinancialYears
 */
class FinancialYearsController extends AppController
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

		$financialYear = $this->FinancialYears->newEntity();
        if ($this->request->is('post')) {
			//pr($this->request->data);
			//exit;
			$financialYear = $this->FinancialYears->patchEntity($financialYear, $this->request->data);
			
			$financialYear->company_id=$st_company_id;
			$financialYear->date_from=date("Y-m-d",strtotime($financialYear->date_from)); 
			$financialYear->date_to=date("Y-m-d",strtotime($financialYear->date_to));
			if ($this->FinancialYears->save($financialYear)) {
                $this->Flash->success(__('The financial year has been saved.'));

                return $this->redirect(['action' => 'index']);
            } else {
			
                $this->Flash->error(__('The financial year could not be saved. Please, try again.'));
            }
		}
			$this->set(compact('financialYear'));
			$this->set('_serialize', ['financialYear']);
		
			$this->paginate = [
				'contain' => ['Companies']
			];
			$financialYears = $this->paginate($this->FinancialYears->find()->where(['company_id'=>$st_company_id]));
			
			$this->set(compact('financialYears'));
			$this->set('_serialize', ['financialYears']);
    }

    /**
     * View method
     *
     * @param string|null $id Financial Year id.
     * @return \Cake\Network\Response|null
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function view($id = null)
    {
		$this->viewBuilder()->layout('index_layout');
		 
			$financialYear = $this->FinancialYears->get($id, [
            'contain' => ['Companies']
			]);

        $this->set('financialYear', $financialYear);
        $this->set('_serialize', ['financialYear']);
    }

    /**
     * Add method
     *
     * @return \Cake\Network\Response|void Redirects on successful add, renders view otherwise.
     */
    public function add()
    {
        $financialYear = $this->FinancialYears->newEntity();
			$session = $this->request->session();
			$st_company_id = $session->read('st_company_id');
		
        if ($this->request->is('post')) {
		
			$financialYear = $this->FinancialYears->patchEntity($financialYear, $this->request->data);
			$financialYear->company_id=$st_company_id;
			
            if ($this->FinancialYears->save($financialYear)) {
                $this->Flash->success(__('The financial year has been saved.'));

                return $this->redirect(['action' => 'index']);
            } else {
                $this->Flash->error(__('The financial year could not be saved. Please, try again.'));
            }
        }
        $companies = $this->FinancialYears->Companies->find('list', ['limit' => 200]);
        $this->set(compact('financialYear', 'companies'));
        $this->set('_serialize', ['financialYear']);
    }

    /**
     * Edit method
     *
     * @param string|null $id Financial Year id.
     * @return \Cake\Network\Response|void Redirects on successful edit, renders view otherwise.
     * @throws \Cake\Network\Exception\NotFoundException When record not found.
     */
    public function edit($id = null)
    {
		$this->viewBuilder()->layout('index_layout');
        $financialYear = $this->FinancialYears->get($id, [
            'contain' => []
        ]);
		$session = $this->request->session();
			$st_company_id = $session->read('st_company_id');
        if ($this->request->is(['patch', 'post', 'put'])) {
            $financialYear = $this->FinancialYears->patchEntity($financialYear, $this->request->data);
			$financialYear->company_id=$st_company_id;
			$financialYear->date_from=date("Y-m-d",strtotime($financialYear->date_from)); 
			$financialYear->date_to=date("Y-m-d",strtotime($financialYear->date_to));
            if ($this->FinancialYears->save($financialYear)) {
                $this->Flash->success(__('The financial year has been saved.'));

                return $this->redirect(['action' => 'index']);
            } else {
                $this->Flash->error(__('The financial year could not be saved. Please, try again.'));
            }
        }
        $companies = $this->FinancialYears->Companies->find('list', ['limit' => 200]);
        $this->set(compact('financialYear', 'companies'));
        $this->set('_serialize', ['financialYear']);
    }

    /**
     * Delete method
     *
     * @param string|null $id Financial Year id.
     * @return \Cake\Network\Response|null Redirects to index.
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function delete($id = null)
    {
        $this->request->allowMethod(['post', 'delete']);
        $financialYear = $this->FinancialYears->get($id);
        if ($this->FinancialYears->delete($financialYear)) {
            $this->Flash->success(__('The financial year has been deleted.'));
        } else {
            $this->Flash->error(__('The financial year could not be deleted. Please, try again.'));
        }

        return $this->redirect(['action' => 'index']);
    }
	
	public function selectCompanyYear($financialYear_id=null)
    {
		
			$this->viewBuilder()->layout('login_layout');
			$session = $this->request->session();
			$st_company_id = $session->read('st_company_id');
		
			if(!empty($financialYear_id)){
			$this->request->allowMethod(['post', 'delete']);
			$this->request->session()->write('st_year_id',$financialYear_id);
			return $this->redirect("/Dashboard");
			}
			$financialYears = $this->paginate($this->FinancialYears->find()->where(['company_id'=>$st_company_id]));
			
			$this->set(compact('financialYears'));
			$this->set('_serialize', ['financialYears']);
    }
}
