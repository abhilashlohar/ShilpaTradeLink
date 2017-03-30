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
	
    public function add($to_be_send=null)
    {
		$to_be_send=json_decode($to_be_send);
		$to_be_send2=[];
		foreach($to_be_send as $item_id=>$qty){
			$Item=$this->PurchaseOrders->Items->get($item_id);
			$to_be_send2[$item_id]=['qty'=>$qty,'item_name'=>$Item->name];
		}
		
		$this->viewBuilder()->layout('index_layout');
		$s_employee_id=$this->viewVars['s_employee_id'];
		$session = $this->request->session();
		$st_company_id = $session->read('st_company_id');
		$Company = $this->PurchaseOrders->Companies->get($st_company_id);
		$st_year_id = $session->read('st_year_id');

       $SessionCheckDate = $this->FinancialYears->get($st_year_id);
       $fromdate1 = date("Y-m-d",strtotime($SessionCheckDate->date_from));   
       $todate1 = date("Y-m-d",strtotime($SessionCheckDate->date_to)); 
       $tody1 = date("Y-m-d");

       $fromdate = strtotime($fromdate1);
       $todate = strtotime($todate1); 
       $tody = strtotime($tody1);

      if($fromdate >= $tody || $todate <= $tody)
       {
       	   $chkdate = 'Not Found';
       }
       else
       {
       	  $chkdate = 'Found';
       }
	   
	   $Material_indent_id=@(int)$this->request->query('Material_indent');
	 
		$materialIndents=array(); 
		$process_status='New';
		if(!empty($Material_indent_id)){
			$materialIndents = $this->PurchaseOrders->MaterialIndents->get($Material_indent_id, [
					'contain' => ['MaterialIndentRows' => function ($q) {
						return $q->where(['MaterialIndentRows.required_quantity > MaterialIndentRows.processed_quantity'])->contain(['Items']);
					}]
				]);
			$process_status='Pulled From Material Indent';
			
		}
		if(!empty($material)){ 
			$material_items=array(); 
			$materials=json_decode($material);
			$material_items_for_purchases=[];
			$this->set(compact('material_items_for_purchases'));
		}
		
		
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
			$purchaseOrder->date_created=date("Y-m-d",strtotime($purchaseOrder->date_created));
			
			foreach($purchaseOrder->purchase_order_rows as $purchase_order_row){

				if($purchase_order_row->pull_status=="PULLED_FROM_MI"){
					$query = $this->PurchaseOrders->MaterialIndentRows->find()
					->where(['MaterialIndentRows.status'=>'Open','MaterialIndentRows.item_id'=>$purchase_order_row->item_id]);
					$MaterialIndentRows=$query->matching('MaterialIndents', function ($q) use($st_company_id){
						return $q->where(['MaterialIndents.company_id' => $st_company_id]);
					});
					
					$material_rows[$purchase_order_row->item_id]=[];
					foreach($MaterialIndentRows as $MaterialIndentRow){
						$material_rows[$purchase_order_row->item_id][strtotime($MaterialIndentRow->_matchingData['MaterialIndents']->created_on)]=['id'=>$MaterialIndentRow->id,'item_id'=>$MaterialIndentRow->item_id,'required_quantity'=>$MaterialIndentRow->required_quantity,'processed_quantity'=>$MaterialIndentRow->processed_quantity];
					}
				}
			}
			
			foreach($purchaseOrder->purchase_order_rows as $purchase_order_row){
				if($purchase_order_row->pull_status=="PULLED_FROM_MI"){
					$mi_rows=$material_rows[$purchase_order_row->item_id];
					ksort($mi_rows);
					$purchase_order_qty=$purchase_order_row->quantity;
					foreach($mi_rows as $mi_row){
						$mi_remaining_qty=$mi_row['required_quantity']-$mi_row['processed_quantity'];
						$reminder=$mi_remaining_qty-$purchase_order_qty;
						if($reminder>=0){
							
							$mi_row = $this->PurchaseOrders->MaterialIndentRows->get($mi_row['id']);
							$mi_row->processed_quantity=$mi_row->processed_quantity+$purchase_order_qty;
							$mi_row->status='Open';
							$this->PurchaseOrders->MaterialIndentRows->save($mi_row);
							break;
						}else{
							$mi_row = $this->PurchaseOrders->MaterialIndentRows->get($mi_row['id']);
							$mi_row->processed_quantity=$mi_row->processed_quantity+abs($mi_remaining_qty);
							$mi_row->status='Close';
							$this->PurchaseOrders->MaterialIndentRows->save($mi_row);
						}
						$purchase_order_qty=abs($reminder);
					}
				}
			}
			if ($this->PurchaseOrders->save($purchaseOrder)) {

                $this->Flash->success(__('The purchase order has been saved.'));

                return $this->redirect(['action' => 'index']);
            } else { 
                $this->Flash->error(__('The purchase order could not be saved. Please, try again.'));
            }
        }
		$filenames = $this->PurchaseOrders->Filenames->find('list', ['valueField' => function ($row) {
				return $row['file1'] . '-' . $row['file2'];
			},
			'keyField' => function ($row) {
				return $row['file1'] . '-' . $row['file2'];
			}])->where(['file1' => 'BE']);
        $vendor = $this->PurchaseOrders->Vendors->find()->order(['Vendors.company_name' => 'ASC']);
		$SaleTaxes = $this->PurchaseOrders->SaleTaxes->find('all')->where(['freeze'=>0]);
		$customers = $this->PurchaseOrders->Customers->find('all')->order(['Customers.customer_name' => 'ASC']);
		$items = $this->PurchaseOrders->PurchaseOrderRows->Items->find('list')->where(['source IN'=>['Purchessed','Purchessed/Manufactured']])->order(['Items.name' => 'ASC']);
		$transporters = $this->PurchaseOrders->Transporters->find('list')->order(['Transporters.transporter_name' => 'ASC']);
        $this->set(compact('purchaseOrder', 'materialIndents','Company', 'vendor','filenames','items','SaleTaxes','transporters','customers','chkdate','to_be_send2'));
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
            'contain' => ['PurchaseOrderRows'=>['Items']]
        ]);
		
		
		/*foreach($purchaseOrder->purchase_order_rows as $purchase_order_row_first){
			pr($purchase_order_row);
		} exit; */
		
        $Em = new FinancialYearsController;
        $financial_year_data = $Em->checkFinancialYear($purchaseOrder->date_created);


        if ($this->request->is(['patch', 'post', 'put'])) {
			
            $purchaseOrder = $this->PurchaseOrders->patchEntity($purchaseOrder, $this->request->data);
			$purchaseOrder->date_created=date("Y-m-d",strtotime($purchaseOrder->date_created));
			$purchaseOrder->delivery_date=date("Y-m-d",strtotime($purchaseOrder->delivery_date));
			$purchaseOrder->company_id=$st_company_id;
			foreach($purchaseOrder->purchase_order_rows as $purchase_order_row){
				
				pr($purchase_order_row);
			} exit;
			
			
			
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
		$vendor = $this->PurchaseOrders->Vendors->find()->order(['Vendors.company_name' => 'ASC']);
		$SaleTaxes = $this->PurchaseOrders->SaleTaxes->find('all')->where(['freeze'=>0]);
		$customers = $this->PurchaseOrders->Customers->find('all')->order(['Customers.customer_name' => 'ASC']);
		$items = $this->PurchaseOrders->PurchaseOrderRows->Items->find('list')->where(['source IN'=>['Purchessed','Purchessed/Manufactured']]);
		$transporters = $this->PurchaseOrders->Transporters->find('list')->order(['Transporters.transporter_name' => 'ASC']);
       
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
	
	public function customerFromFilename($filename=null){
		$this->viewBuilder()->layout('');
		$filename=explode('-',$filename);
		$Filename=$this->PurchaseOrders->Filenames->find()->where(['file1'=>$filename[0],'file2'=>$filename[1]])->first();
		
		$Customer=$this->PurchaseOrders->Customers->get($Filename->customer_id);
		
		$this->set(compact('Customer'));
	}

}
