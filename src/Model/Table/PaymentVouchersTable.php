<?php
namespace App\Model\Table;

use Cake\ORM\Query;
use Cake\ORM\RulesChecker;
use Cake\ORM\Table;
use Cake\Validation\Validator;

/**
 * PaymentVouchers Model
 *
 * @method \App\Model\Entity\PaymentVoucher get($primaryKey, $options = [])
 * @method \App\Model\Entity\PaymentVoucher newEntity($data = null, array $options = [])
 * @method \App\Model\Entity\PaymentVoucher[] newEntities(array $data, array $options = [])
 * @method \App\Model\Entity\PaymentVoucher|bool save(\Cake\Datasource\EntityInterface $entity, $options = [])
 * @method \App\Model\Entity\PaymentVoucher patchEntity(\Cake\Datasource\EntityInterface $entity, array $data, array $options = [])
 * @method \App\Model\Entity\PaymentVoucher[] patchEntities($entities, array $data, array $options = [])
 * @method \App\Model\Entity\PaymentVoucher findOrCreate($search, callable $callback = null)
 */
class PaymentVouchersTable extends Table
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

        $this->table('payment_vouchers');
        $this->displayField('id');
        $this->primaryKey('id');
		$this->belongsTo('VouchersReferences');
		$this->belongsTo('Ledgers');
		$this->belongsTo('Companies', [
            'foreignKey' => 'company_id',
            'joinType' => 'INNER'
        ]);
        $this->belongsTo('PaidTos', [
			'className' => 'LedgerAccounts',
            'foreignKey' => 'paid_to_id',
            'propertyName' => 'PaidTo',
        ]);
		$this->belongsTo('BankCashes', [
			'className' => 'LedgerAccounts',
            'foreignKey' => 'cash_bank_account_id',
            'propertyName' => 'BankCash',
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
            ->requirePresence('received_from_id','create')
            ->notEmpty('received_from_id');

        $validator
            ->requirePresence('payment_mode', 'create')
            ->notEmpty('payment_mode');

        $validator
            ->requirePresence('bank_cash_id', 'create')
            ->notEmpty('bank_cash_id');

        $validator
            ->requirePresence('narration', 'create')
            ->notEmpty('narration');
			
		$validator
            ->requirePresence('amount', 'create')
            ->notEmpty('amount');

        return $validator;
    }
}
