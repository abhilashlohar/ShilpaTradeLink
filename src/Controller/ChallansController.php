<?php
namespace App\Controller;

use App\Controller\AppController;

/**
 * Challans Controller
 *
 * @property \App\Model\Table\ChallansTable $Challans
 */
class ChallansController extends AppController
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
            'contain' => ['Customers', 'Companies', 'Invoices', 'Transporters','Vendors']
        ];
		$challans=$this->paginate($this->Challans->find()->where(['challan_type' => 'Returnable']));
        
        $this->set(compact('challans'));
        $this->set('_serialize', ['challans']);
    }
	 public function index2()
    {	
		$this->viewBuilder()->layout('index_layout');
        $this->paginate = [
            'contain' => ['Customers', 'Companies', 'Invoices', 'Transporters','Vendors']
        ];
		$challans=$this->paginate($this->Challans->find()->where(['challan_type' => 'Non Returnable']));
        
        $this->set(compact('challans'));
        $this->set('_serialize', ['challans']);
    }
    /**
     * View method
     *
     * @param string|null $id Challan id.
     * @return \Cake\Network\Response|null
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function view($id = null)
    {
        $challan = $this->Challans->get($id, [
            'contain' => ['Customers', 'Companies', 'Invoices', 'Transporters','Vendors']
        ]);

        $this->set('challan', $challan);
        $this->set('_serialize', ['challan']);
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
		$Company = $this->Challans->Companies->get($st_company_id);
		$challan = $this->Challans->newEntity();
       
		if ($this->request->is('post')) {
			
            $challan = $this->Challans->patchEntity($challan, $this->request->data);
			$type=$challan->challan_type;
			
			$last_ch_no_rt=$this->Challans->find()->select(['ch2'])->where(['company_id' => $st_company_id,'challan_type' => $type])->order(['ch2' => 'DESC'])->first();
			
			if($last_ch_no_rt){
				
				$challan->ch2=$last_ch_no_rt->ch2+1;
				
				
			}else{
				$challan->ch2=1;
			}
		
			$challan->created_by=$s_employee_id; 
			$challan->company_id=$st_company_id;
			$challan->created_on=date("Y-m-d",strtotime($challan->created_on));
			//pr($challan); exit;
            if ($this->Challans->save($challan)) {
                $this->Flash->success(__('The challan has been saved.'));

                  return $this->redirect(['action' => 'confirm/'.$challan->id]);
            } else {
                $this->Flash->error(__('The challan could not be saved. Please, try again.'));
            }
        }
        $customers = $this->Challans->Customers->find('all');
		$vendors = $this->Challans->Vendors->find('all');
        $companies = $this->Challans->Companies->find('all');
		$items = $this->Challans->Items->find('list');
        $invoices = $this->Challans->Invoices->find()->where(['company_id'=>$st_company_id]);
		$invoice_bookings = $this->Challans->InvoiceBookings->find('all');
        $transporters = $this->Challans->Transporters->find('list');
		$filenames = $this->Challans->Filenames->find('list', ['valueField' => function ($row) {
				return $row['file1'] . '-' . $row['file2'];
			},
			'keyField' => function ($row) {
				return $row['file1'] . '-' . $row['file2'];
			}]);
        $this->set(compact('challan', 'customers', 'Company', 'invoices', 'transporters','items','vendors','filenames','invoice_bookings'));
        $this->set('_serialize', ['challan']);
    }
    /**
     * Edit method
     *
     * @param string|null $id Challan id.
     * @return \Cake\Network\Response|void Redirects on successful edit, renders view otherwise.
     * @throws \Cake\Network\Exception\NotFoundException When record not found.
     */
    public function edit($id = null)
    {
		$this->viewBuilder()->layout('index_layout');
		$s_employee_id=$this->viewVars['s_employee_id'];

		$session = $this->request->session();
		$st_company_id = $session->read('st_company_id');
		
		
        $challan = $this->Challans->get($id, [
            'contain' => ['Companies','Invoices','Transporters','ChallanRows','Creator','Vendors']
        ]);
        if ($this->request->is(['patch', 'post', 'put'])) {
            $challan = $this->Challans->patchEntity($challan, $this->request->data);
			$challan->company_id=$st_company_id;
			$challan->created_by=$s_employee_id; 
			$challan->company_id=$st_company_id;
			$challan->created_on=date("Y-m-d",strtotime($challan->created_on));
            if ($this->Challans->save($challan)) {
				
                $this->Flash->success(__('The challan has been saved.'));

                return $this->redirect(['action' => 'index']);
            } else {
                $this->Flash->error(__('The challan could not be saved. Please, try again.'));
            }
        }
		$Company = $this->Challans->Companies->get($st_company_id);
		$customers = $this->Challans->Customers->find('all');
       // $companies = $this->Challans->Companies->find('all');
		$items = $this->Challans->Items->find('list');
        $invoices = $this->Challans->Invoices->find()->where(['company_id'=>$st_company_id]);
        $transporters = $this->Challans->Transporters->find('list');
        $this->set(compact('challan', 'customers', 'companies', 'invoices', 'transporters','items'));
	
        $this->set('_serialize', ['challan']);
    }

    /**
     * Delete method
     *
     * @param string|null $id Challan id.
     * @return \Cake\Network\Response|null Redirects to index.
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function delete($id = null)
    {
        $this->request->allowMethod(['post', 'delete']);
        $challan = $this->Challans->get($id);
        if ($this->Challans->delete($challan)) {
            $this->Flash->success(__('The challan has been deleted.'));
        } else {
            $this->Flash->error(__('The challan could not be deleted. Please, try again.'));
        }

        return $this->redirect(['action' => 'index']);
    }
	
	public function pdf($id = null)
    {
		$this->viewBuilder()->layout('');
         $challan = $this->Challans->get($id, [
            'contain' => ['Companies','Customers','Invoices','Transporters','ChallanRows','Creator','Vendors','InvoiceBookings']
			]);

        $this->set('challan', $challan);
        $this->set('_serialize', ['challan']);
    }
	
	public function confirm($id = null)
    {
		$this->viewBuilder()->layout('pdf_layout');
		
        $this->set('id', $id);
    }
}
