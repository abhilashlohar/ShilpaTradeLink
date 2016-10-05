<?php
namespace App\Controller;
use App\Controller\AppController;

class LoginsController extends AppController
{
	
	
	public function index()
    {
       $this->viewBuilder()->layout('login_layout');
	   
	   if ($this->request->is('post')) 
		{
			$username=$this->request->data["login_id"];
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
    }
	
	public function logout()
	{
		$session = $this->request->session();
		$session->delete('st_login_id');
		return $this->redirect("/login");
	}
	
	public function auth()
	{
		$session = $this->request->session();
		return $st_login_id = $session->read('st_login_id');
		if(empty($st_login_id)){
			return $this->redirect("/login");
		}
	}
	
}

