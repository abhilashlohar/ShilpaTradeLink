<?php
namespace App\Controller;
use App\Controller\AppController;

class LoginsController extends AppController
{
	
	public function initialize()
	{
		parent::initialize();
		$this->eventManager()->off($this->Csrf);
	}
	public function index()
    {
       $this->viewBuilder()->layout('login_layout');
	   
	   $login = $this->Logins->newEntity();
	   if ($this->request->is('post')) 
		{
			$username=$this->request->data["username"];
			$password=$this->request->data["password"];
			$query = $this->Logins->findAllByUsernameAndPassword($username, $password);
			$number = $query->count();
			foreach ($query as $row) {
				$login_id=$row["id"];
			}
			if($number==1 && !empty($login_id)){
				$this->request->session()->write('st_login_id',$login_id);
				return $this->redirect("/Dashboard");
			}
		}
		
		$this->set(compact('login'));
		$this->set('_serialize', ['login']);
    }
	
	public function logout()
	{
		$session = $this->request->session();
		$session->delete('st_login_id');
		return $this->redirect("/login");
	}
	
	public function add()
    {
		$this->viewBuilder()->layout('index_layout');
		$login = $this->Logins->newEntity();
		
        if ($this->request->is('post')) {
            $login = $this->Logins->patchEntity($login, $this->request->data);
            if ($this->Logins->save($login)) {
				$this->Flash->success(__('Login has been saved.'));
            } else {
                $this->Flash->error(__('The Login could not be saved. Please, try again.'));
            }
        }
		$employees = $this->Logins->Employees->find('list');
		$this->paginate = [
            'contain' => ['Employees']
        ];
		$Logins = $this->paginate($this->Logins);
        $this->set(compact('login','employees','Logins'));
        $this->set('_serialize', ['login']);
    }
	
}

