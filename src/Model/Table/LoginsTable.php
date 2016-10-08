<?php
namespace App\Model\Table;

use Cake\ORM\Table;

class LoginsTable extends Table
{
    public function initialize(array $config)
    {
		$this->belongsTo('Employees', [
            'foreignKey' => 'employee_id',
            'joinType' => 'INNER'
        ]);
		
    }
	
	
}