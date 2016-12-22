<?php
namespace App\Controller;

use App\Controller\AppController;

/**
 * MaterialIndents Controller
 *
 * @property \App\Model\Table\MaterialIndentsTable $MaterialIndents
 */
class MaterialIndentsController extends AppController
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
            'contain' => ['Companies', 'JobCards']
        ];
        $materialIndents = $this->paginate($this->MaterialIndents);

        $this->set(compact('materialIndents'));
        $this->set('_serialize', ['materialIndents']);
    }

    /**
     * View method
     *
     * @param string|null $id Material Indent id.
     * @return \Cake\Network\Response|null
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function view($id = null)
    {
        $materialIndent = $this->MaterialIndents->get($id, [
            'contain' => ['Companies', 'JobCards', 'MaterialIndentRows']
        ]);

        $this->set('materialIndent', $materialIndent);
        $this->set('_serialize', ['materialIndent']);
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
		
		$job_card_id=@(int)$this->request->query('job-cards');
		//pr($job_card_id); exit;
		if(!empty($job_card_id)){
			$jobCards = $this->MaterialIndents->JobCards->get($job_card_id, [
				'contain' => ['JobCardRows'=> ['Items'],'Customers']
			]);
			
			$query = $this->MaterialIndents->ItemLedgers->find();
			$totalInCase = $query->newExpr()
				->addCase(
					$query->newExpr()->add(['in_out' => 'In']),
					$query->newExpr()->add(['quantity']),
					'integer'
				);
			$totalOutCase = $query->newExpr()
				->addCase(
					$query->newExpr()->add(['in_out' => 'Out']),
					$query->newExpr()->add(['quantity']),
					'integer'
				);

			$query->select([
				'total_in' => $query->func()->sum($totalInCase),
				'total_out' => $query->func()->sum($totalOutCase),'id','item_id'
			])
			->group('item_id');
			
			$current_stock=[];
			foreach($query as $data){
				$current_stock[$data->item_id]=['total_in'=>$data->total_in,'total_out'=>$data->total_out];
			} 
			
		}
		
		
		//pr($jobCards);exit;job-cards
		
		
        $materialIndent = $this->MaterialIndents->newEntity();
        if ($this->request->is('post')) {
			pr($this->request->data);
            $materialIndent = $this->MaterialIndents->patchEntity($materialIndent, $this->request->data);
			pr($materialIndent); exit;
			$materialIndent->created_by=$s_employee_id; 
			$materialIndent->job_card_id=$job_card_id;
			$materialIndent->created_on=date("Y-m-d");
			$materialIndent->company_id=$st_company_id;
			$materialIndent->required_date=date("Y-m-d",strtotime($materialIndent->required_date));  
			//pr($materialIndent->required_date); exit;
			
            if ($this->MaterialIndents->save($materialIndent)) {
                $this->Flash->success(__('The material indent has been saved.'));

                return $this->redirect(['action' => 'index']);
            } else { 
                $this->Flash->error(__('The material indent could not be saved. Please, try again.'));
            }pr($materialIndent); exit;
        }
		$last_mi_no=$this->MaterialIndents->find()->select(['mi2'])->where(['company_id' => $st_company_id])->order(['mi2' => 'DESC'])->first();
			if($last_mi_no){
				@$last_mi_no->mi2=$last_mi_no->mi2+1;
			}else{
				@$last_mi_no->mi2=1;
			}
		
        $companies = $this->MaterialIndents->Companies->find('list', ['limit' => 200]);
        $items = $this->MaterialIndents->Items->find('list', ['limit' => 200]);
        //$jobCards = $this->MaterialIndents->JobCards->find('list', ['limit' => 200]);
        $this->set(compact('materialIndent', 'companies', 'jobCards','items','current_stock','last_mi_no'));
        $this->set('_serialize', ['materialIndent']);
    }

    /**
     * Edit method
     *
     * @param string|null $id Material Indent id.
     * @return \Cake\Network\Response|void Redirects on successful edit, renders view otherwise.
     * @throws \Cake\Network\Exception\NotFoundException When record not found.
     */
    public function edit($id = null)
    {
        $materialIndent = $this->MaterialIndents->get($id, [
            'contain' => []
        ]);
        if ($this->request->is(['patch', 'post', 'put'])) {
            $materialIndent = $this->MaterialIndents->patchEntity($materialIndent, $this->request->data);
            if ($this->MaterialIndents->save($materialIndent)) {
                $this->Flash->success(__('The material indent has been saved.'));

                return $this->redirect(['action' => 'index']);
            } else {
                $this->Flash->error(__('The material indent could not be saved. Please, try again.'));
            }
        }
        $companies = $this->MaterialIndents->Companies->find('list', ['limit' => 200]);
        $jobCards = $this->MaterialIndents->JobCards->find('list', ['limit' => 200]);
        $this->set(compact('materialIndent', 'companies', 'jobCards'));
        $this->set('_serialize', ['materialIndent']);
    }

    /**
     * Delete method
     *
     * @param string|null $id Material Indent id.
     * @return \Cake\Network\Response|null Redirects to index.
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function delete($id = null)
    {
        $this->request->allowMethod(['post', 'delete']);
        $materialIndent = $this->MaterialIndents->get($id);
        if ($this->MaterialIndents->delete($materialIndent)) {
            $this->Flash->success(__('The material indent has been deleted.'));
        } else {
            $this->Flash->error(__('The material indent could not be deleted. Please, try again.'));
        }

        return $this->redirect(['action' => 'index']);
    }
}
