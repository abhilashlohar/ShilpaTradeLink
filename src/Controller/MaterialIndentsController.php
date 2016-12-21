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
		
		$job_card_id=@(int)$this->request->query('job-cards');
		//pr($job_card_id); exit;
		if(!empty($job_card_id)){
			$jobCards = $this->MaterialIndents->JobCards->get($job_card_id, [
				'contain' => ['JobCardRows'=>['Items'],'Customers']
			]);
		}
		//pr($jobCards);exit;
		
		
        $materialIndent = $this->MaterialIndents->newEntity();
        if ($this->request->is('post')) {
            $materialIndent = $this->MaterialIndents->patchEntity($materialIndent, $this->request->data);
            if ($this->MaterialIndents->save($materialIndent)) {
                $this->Flash->success(__('The material indent has been saved.'));

                return $this->redirect(['action' => 'index']);
            } else {
                $this->Flash->error(__('The material indent could not be saved. Please, try again.'));
            }
        }
        $companies = $this->MaterialIndents->Companies->find('list', ['limit' => 200]);
        $items = $this->MaterialIndents->Items->find('list', ['limit' => 200]);
        //$jobCards = $this->MaterialIndents->JobCards->find('list', ['limit' => 200]);
        $this->set(compact('materialIndent', 'companies', 'jobCards','items'));
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
