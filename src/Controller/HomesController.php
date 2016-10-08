<?php
namespace App\Controller;

class HomesController extends AppController
{
	public function initialize()
	{
		$this->loadComponent('Flash');
		$session = $this->request->session();
		$st_login_id = $session->read('st_login_id');
		
		if(empty($st_login_id)){
			return $this->redirect("/login");
		}
	}

	

	public function index()
    {
       $this->viewBuilder()->layout('index_layout');
    }
}

