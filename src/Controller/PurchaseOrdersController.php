<?php
namespace App\Controller;

use App\Controller\AppController;

/**
 * PurchaseOrders Controller
 *
 * @property \App\Model\Table\PurchaseOrdersTable $PurchaseOrders
 */
class PurchaseOrdersController extends AppController
{

    /**
     * Index method
     *
     * @return \Cake\Network\Response|null
     */
    public function index($status=null)
    {
		$url=$this->request->here();
		$url=parse_url($url,PHP_URL_QUERY);
		$this->viewBuilder()->layout('index_layout');
        $this->paginate = [
            'contain' => ['Companies', 'Vendors']
        ];
		$pull_request=$this->request->query('pull-request');
		
		$session = $this->request->session();
		$st_company_id = $session->read('st_company_id');
		
        //$purchaseOrders = $this->paginate($this->PurchaseOrders);
		
		if($status==null or $status=='Pending'){
			$having=['total_rows >' => 0];
		}elseif($status=='Converted-Into-GRN'){
			$having=['total_rows =' => 0];
		}
		
		$purchaseOrders=$this->paginate(
			$this->PurchaseOrders->find()->select(['total_rows' => 
				$this->PurchaseOrders->find()->func()->count('PurchaseOrderRows.id')])
				->leftJoinWith('PurchaseOrderRows', function ($q) {
					return $q->where(['PurchaseOrderRows.processed_quantity < PurchaseOrderRows.quantity']);
				})
				->group(['PurchaseOrders.id'])
				->autoFields(true)
				->having($having)
				->where(['company_id'=>$st_company_id])
				->order(['PurchaseOrders.id' => 'DESC'])
			);

        $this->set(compact('purchaseOrders','pull_request','status'));
        $this->set('_serialize', ['purchaseOrders']);
		$this->set(compact('url'));
    }

    

    /**
     * View method
     *
     * @param string|null $id Purchase Order id.
     * @return \Cake\Network\Response|null
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function view($id = null)
    {
		$this->viewBuilder()->layout('index_layout');
        $purchaseOrder = $this->PurchaseOrders->get($id, [
            'contain' => ['Companies', 'Vendors', 'Grns', 'PurchaseOrderRows']
        ]);

        $this->set('purchaseOrder', $purchaseOrder);
        $this->set('_serialize', ['purchaseOrder']);
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
		$Company = $this->PurchaseOrders->Companies->get($st_company_id);
		
		//if(!empty($material)){ 
			$Employees=$this->PurchaseOrders->Employees->get($s_employee_id);
			$employee_name=$Employees->name; 
			$company=$this->PurchaseOrders->Companies->get($st_company_id);
			$company_name=$company->name;
			//$material_items=array(); 
			//$materials=json_decode($material);
			//echo $materials; exit;
			$material_items_for_purchases=[];
				//foreach($materials as $key=>$value){
				//$item=$this->PurchaseOrders->Items->get($key);
				//$item_name=$item->name;
				$material_items_for_purchases[]=array('item_name'=>'Kgn212','item_id'=>'144','quantity'=>'25','company_id'=>'25','employee_name'=>'pri','company_name'=>'STL','material_indent_id'=>'2');
				$material_items_for_purchases[]=array('item_name'=>'Kgn212','item_id'=>'144','quantity'=>'52','company_id'=>'25','employee_name'=>'Gopal','company_name'=>'GPL','material_indent_id'=>'3');
			//}
			//pr($material_items_for_purchase); exit;
			$this->set(compact('material_items_for_purchases'));
		//}
		
		
		//pr($Company); exit;
        $purchaseOrder = $this->PurchaseOrders->newEntity();
        if ($this->request->is('post')) {
			$last_po_no=$this->PurchaseOrders->find()->select(['po2'])->where(['company_id' => $st_company_id])->order(['po2' => 'DESC'])->first();
			if($last_po_no){
				$purchaseOrder->po2=$last_po_no->po2+1;
			}else{
				$purchaseOrder->po2=1;
			}
            $purchaseOrder = $this->PurchaseOrders->patchEntity($purchaseOrder, $this->request->data);
			
			$purchaseOrder->delivery_date=date("Y-m-d",strtotime($purchaseOrder->delivery_date));
			$purchaseOrder->created_by=$s_employee_id; 
			$purchaseOrder->company_id=$st_company_id;
			$purchaseOrder->sale_tax_description=$purchaseOrder->sale_tax_description; 
			//pr($purchaseOrder->material_to_be_transported);exit;
			$purchaseOrder->date_created=date("Y-m-d",strtotime($purchaseOrder->date_created));
			
            if ($this->PurchaseOrders->save($purchaseOrder)) {
				//pr($purchaseOrder); exit;
				
                $this->Flash->success(__('The purchase order has been saved.'));

                return $this->redirect(['action' => 'index']);
            } else { pr($purchaseOrder); exit;
                $this->Flash->error(__('The purchase order could not be saved. Please, try again.'));
            }
        }
       // $companies = $this->PurchaseOrders->Companies->find();
		$filenames = $this->PurchaseOrders->Filenames->find('list', ['valueField' => function ($row) {
				return $row['file1'] . '-' . $row['file2'];
			},
			'keyField' => function ($row) {
				return $row['file1'] . '-' . $row['file2'];
			}])->where(['file1' => 'BE']);
        $vendor = $this->PurchaseOrders->Vendors->find();
		$SaleTaxes = $this->PurchaseOrders->SaleTaxes->find('all')->where(['freeze'=>0]);
		$customers = $this->PurchaseOrders->Customers->find('all');
		$items = $this->PurchaseOrders->PurchaseOrderRows->Items->find('list')->where(['source IN'=>['Purchessed','Purchessed/Manufactured']]);
		$transporters = $this->PurchaseOrders->Transporters->find('list');
        $this->set(compact('purchaseOrder', 'Company', 'vendor','filenames','items','SaleTaxes','transporters','customers'));
        $this->set('_serialize', ['purchaseOrder']);
    }

    /**
     * Edit method
     *
     * @param string|null $id Purchase Order id.
     * @return \Cake\Network\Response|void Redirects on successful edit, renders view otherwise.
     * @throws \Cake\Network\Exception\NotFoundException When record not found.
     */
    public function edit($id = null)
    {
		$this->viewBuilder()->layout('index_layout');
		$s_employee_id=$this->viewVars['s_employee_id'];
		
		$session = $this->request->session();
		$st_company_id = $session->read('st_company_id');
		
        $purchaseOrder = $this->PurchaseOrders->get($id, [
            'contain' => ['PurchaseOrderRows']
        ]);

          $Em = new FinancialYearsController;
        $financial_year_data = $Em->checkFinancialYear($purchaseOrder->date_created);


        if ($this->request->is(['patch', 'post', 'put'])) {
			
            $purchaseOrder = $this->PurchaseOrders->patchEntity($purchaseOrder, $this->request->data);
			$purchaseOrder->date_created=date("Y-m-d",strtotime($purchaseOrder->date_created));
			$purchaseOrder->delivery_date=date("Y-m-d",strtotime($purchaseOrder->delivery_date));
			$purchaseOrder->company_id=$st_company_id;
            if ($this->PurchaseOrders->save($purchaseOrder)) {
                $this->Flash->success(__('The purchase order has been saved.'));

                return $this->redirect(['action' => 'index']);
            } else {
                $this->Flash->error(__('The purchase order could not be saved. Please, try again.'));
            }
        }
		$Company = $this->PurchaseOrders->Companies->get($st_company_id);
		//$companies = $this->PurchaseOrders->Companies->find();
		$filenames = $this->PurchaseOrders->Filenames->find('list', ['valueField' => function ($row) {
				return $row['file1'] . '-' . $row['file2'];
			},
			'keyField' => function ($row) {
				return $row['file1'] . '-' . $row['file2'];
			}])->where(['file1' => 'BE']);
		$vendor = $this->PurchaseOrders->Vendors->find();
		$SaleTaxes = $this->PurchaseOrders->SaleTaxes->find('all')->where(['freeze'=>0]);
		$customers = $this->PurchaseOrders->Customers->find('all');
		$items = $this->PurchaseOrders->PurchaseOrderRows->Items->find('list')->where(['source IN'=>['Purchessed','Purchessed/Manufactured']]);
		$transporters = $this->PurchaseOrders->Transporters->find('list');
       
        $this->set(compact('purchaseOrder', 'Company', 'vendor','filenames','customers','SaleTaxes','transporters','items','financial_year_data'));
        $this->set('_serialize', ['purchaseOrder']);
    }

    /**
     * Delete method
     *
     * @param string|null $id Purchase Order id.
     * @return \Cake\Network\Response|null Redirects to index.
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function delete($id = null)
    {
        $this->request->allowMethod(['post', 'delete']);
        $purchaseOrder = $this->PurchaseOrders->get($id);
        if ($this->PurchaseOrders->delete($purchaseOrder)) {
            $this->Flash->success(__('The purchase order has been deleted.'));
        } else {
            $this->Flash->error(__('The purchase order could not be deleted. Please, try again.'));
        }

        return $this->redirect(['action' => 'index']);
    }
	
		public function pdf($id = null)
    {
		$this->viewBuilder()->layout('');
         $purchaseOrder = $this->PurchaseOrders->get($id, [
            'contain' => ['Companies','Customers'=>['CustomerAddress'],'Vendors','PurchaseOrderRows'=> ['Items'=>['Units']],'Transporters','Creator']
			]);

        $this->set('purchaseOrder', $purchaseOrder);
        $this->set('_serialize', ['purchaseOrder']);
    }
	
	public function confirm($id = null)
    {
		$this->viewBuilder()->layout('pdf_layout');
			$purchaseOrder = $this->PurchaseOrders->get($id, [
            'contain' => ['PurchaseOrderRows']
			]);
		
		
			if ($this->request->is(['patch', 'post', 'put'])) {
				foreach($this->request->data['purchase_order_rows'] as $purchase_order_rows_id=>$value){
					$purchaseOrderRow=$this->PurchaseOrders->PurchaseOrderRows->get($purchase_order_rows_id);
					$purchaseOrderRow->height=$value["height"];
					$this->PurchaseOrders->PurchaseOrderRows->save($purchaseOrderRow);
			}
			return $this->redirect(['action' => 'confirm/'.$id]);
        }
		$this->set(compact('purchaseOrder','id'));
        $this->set('id', $id);
    }

}
