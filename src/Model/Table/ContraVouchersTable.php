<?php
namespace App\Model\Table;

use Cake\ORM\Query;
use Cake\ORM\RulesChecker;
use Cake\ORM\Table;
use Cake\Validation\Validator;

/**
 * ContraVouchers Model
 *
 * @property \Cake\ORM\Association\BelongsTo $Companies
 *
 * @method \App\Model\Entity\ContraVoucher get($primaryKey, $options = [])
 * @method \App\Model\Entity\ContraVoucher newEntity($data = null, array $options = [])
 * @method \App\Model\Entity\ContraVoucher[] newEntities(array $data, array $options = [])
 * @method \App\Model\Entity\ContraVoucher|bool save(\Cake\Datasource\EntityInterface $entity, $options = [])
 * @method \App\Model\Entity\ContraVoucher patchEntity(\Cake\Datasource\EntityInterface $entity, array $data, array $options = [])
 * @method \App\Model\Entity\ContraVoucher[] patchEntities($entities, array $data, array $options = [])
 * @method \App\Model\Entity\ContraVoucher findOrCreate($search, callable $callback = null)
 */
class ContraVouchersTable extends Table
{

    /**
     * Initialize method
     *
     * @param array $config The configuration for the Table.
     * @return void
     */
    public function initialize(array $config)
    {
        parent::initialize($config);

        $this->table('contra_vouchers');
        $this->displayField('id');
        $this->primaryKey('id');
		$this->belongsTo('VouchersReferences');
		$this->belongsTo('Ledgers');
        $this->belongsTo('Companies', [
            'foreignKey' => 'company_id',
            'joinType' => 'INNER'
        ]);
		$this->belongsTo('CashBankFroms', [
			'className' => 'LedgerAccounts',
            'foreignKey' => 'cash_bank_from',
            'propertyName' => 'CashBankFroms',
        ]);
		$this->belongsTo('CashBankTos', [
			'className' => 'LedgerAccounts',
            'foreignKey' => 'cash_bank_to',
            'propertyName' => 'CashBankTos',
        ]);
		$this->belongsTo('Creator', [
			'className' => 'Employees',
			'foreignKey' => 'created_by',
			'propertyName' => 'creator',
		]);
		 
    }

    /**
     * Default validation rules.
     *
     * @param \Cake\Validation\Validator $validator Validator instance.
     * @return \Cake\Validation\Validator
     */
    public function validationDefault(Validator $validator)
    {
        $validator
            ->integer('id')
            ->allowEmpty('id', 'create');

        
        $validator
            ->requirePresence('payment_mode', 'create')
            ->notEmpty('payment_mode');

        $validator
            ->requirePresence('narration', 'create')
            ->notEmpty('narration');

        $validator
            ->decimal('amount')
            ->requirePresence('amount', 'create')
            ->notEmpty('amount');

        $validator
            ->requirePresence('cash_bank_from', 'create')
            ->notEmpty('cash_bank_from');
		
		$validator
            ->requirePresence('cash_bank_to', 'create')
            ->notEmpty('cash_bank_to');
       
        return $validator;
    }

    /**
     * Returns a rules checker object that will be used for validating
     * application integrity.
     *
     * @param \Cake\ORM\RulesChecker $rules The rules object to be modified.
     * @return \Cake\ORM\RulesChecker
     */
    public function buildRules(RulesChecker $rules)
    {
        $rules->add($rules->existsIn(['company_id'], 'Companies'));

        return $rules;
    }
}
