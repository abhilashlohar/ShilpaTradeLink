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
            'contain' => []
        ];
		$materialIndents = $this->paginate($this->MaterialIndents->find()->order(['MaterialIndents.id' => 'DESC']));
       

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
        $this->viewBuilder()->layout('index_layout');
		$materialIndent = $this->MaterialIndents->get($id, [
            'contain' => ['Companies','Creator',  'MaterialIndentRows'=>['Items']]
        ]);

        $this->set('materialIndent', $materialIndent);
        $this->set('_serialize', ['materialIndent']);
    }

    /**
     * Add method
     *
     * @return \Cake\Network\Response|void Redirects on successful add, renders view otherwise.
     */
    public function add($material=null)
    {
		$this->viewBuilder()->layout('index_layout');
		$s_employee_id=$this->viewVars['s_employee_id'];
		$session = $this->request->session();
		$st_company_id = $session->read('st_company_id');
		
		/* $material_items_for_purchase=[];
		$material_items_for_purchase[]=array('item_name'=>'Kgn212','item_id'=>'144','quantity'=>'25','company_id'=>'25','employee_name'=>'Gopal','company_name'=>'STL','material_indent_id'=>'2');
		$to=json_encode($material_items_for_purchase);
		$this->redirect(['controller'=>'PurchaseOrders','action' => 'add/'.$to.'']); */
		
		if(!empty($material)){
			$Employees=$this->MaterialIndents->Employees->get($s_employee_id);
			$employee_name=$Employees->name; 
			$company=$this->MaterialIndents->Companies->get($st_company_id);
			$company_name=$company->name;
			$material_items=array();
			$materials=json_decode($material);
			foreach($materials as $key=>$value){
				$item=$this->MaterialIndents->Items->get($key);
				$item_name=$item->name;
				$material_items[]=array('item_name'=>$item_name,'item_id'=>$key,'quantity'=>$value,'company_id'=>$st_company_id,'employee_name'=>$employee_name,'company_name'=>$company_name);
			}
			$this->set(compact('material_items'));
		}

		
		
		$materialIndent = $this->MaterialIndents->newEntity();
		
		$last_company_no=$this->MaterialIndents->find()->select(['mi_number'])->where(['company_id' => $st_company_id])->order(['mi_number' => 'DESC'])->first();
		if(!empty($last_company_no)){
			$materialIndent->mi_number=$last_company_no->mi_number+1;
		}else{
			$materialIndent->mi_number=1;
		}
		
        if ($this->request->is('post')) {
			
            $materialIndent = $this->MaterialIndents->patchEntity($materialIndent, $this->request->data);
			$materialIndent->created_by=$s_employee_id; 
			$materialIndent->created_on=date("Y-m-d");
			$materialIndent->company_id=$st_company_id;
			
            if ($this->MaterialIndents->save($materialIndent)) {
				//pr($materialIndent); exit;
				
				
                $this->Flash->success(__('The material indent has been saved.'));

                return $this->redirect(['action' => 'index']);
            } else { 
                $this->Flash->error(__('The material indent could not be saved. Please, try again.'));
            }
        }
		/* $last_mi_no=$this->MaterialIndents->find()->select(['mi2'])->where(['company_id' => $st_company_id])->order(['mi2' => 'DESC'])->first();
			if($last_mi_no){
				@$last_mi_no->mi2=$last_mi_no->mi2+1;
			}else{
				@$last_mi_no->mi2=1;
			} */
		
        $companies = $this->MaterialIndents->Companies->find('list', ['limit' => 200]);
        $items = $this->MaterialIndents->Items->find('list', ['limit' => 200]);
        //$jobCards = $this->MaterialIndents->JobCards->find('list', ['limit' => 200]);
        $this->set(compact('materialIndent', 'companies','items','current_stock'));
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
		$this->viewBuilder()->layout('index_layout');
		$s_employee_id=$this->viewVars['s_employee_id'];
		$session = $this->request->session();
		$st_company_id = $session->read('st_company_id');
		
        $materialIndent = $this->MaterialIndents->get($id, [
            'contain' => ['MaterialIndentRows'=>['Items']]
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
	
	public function report()
	{
		$this->viewBuilder()->layout('index_layout');
		$s_employee_id=$this->viewVars['s_employee_id'];
		$session = $this->request->session();
		$st_company_id = $session->read('st_company_id');
		$mi = $this->MaterialIndents->newEntity();
		
		if ($this->request->is('post')) {
			pr($this->request->data['selected_data']);
			exit;
 			$check=json_encode($this->request->data['selected_data']); 
			$this->redirect(['controller'=>'PurchaseOrders','action' => 'add/'.$check.'']);
		}
		
		$materialIndents=$this->MaterialIndents->find()->contain(['MaterialIndentRows'=>['Items']])->toArray();
		$this->set(compact('materialIndents','mi'));
	}
}
