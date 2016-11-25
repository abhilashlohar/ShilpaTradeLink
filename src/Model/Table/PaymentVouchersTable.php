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
       
		
		$this->belongsTo('Paidto', [
			'className' => 'LedgerAccounts',
			'foreignKey' => 'paid_to_id',
			'propertyName' => 'paidto',
		]);
		$this->belongsTo('Cashbank', [
			'className' => 'LedgerAccounts',
			'foreignKey' => 'cash_bank_account_id',
			'propertyName' => 'cashbank'
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
            ->date('created_on')
            ->requirePresence('created_on', 'create')
            ->notEmpty('created_on');

        $validator
            ->date('voucher_date')
            ->requirePresence('voucher_date', 'create')
            ->notEmpty('voucher_date');

        $validator
            ->integer('paid_to')
            ->requirePresence('paid_to', 'create')
            ->notEmpty('paid_to');

        $validator
            ->requirePresence('payment_mode', 'create')
            ->notEmpty('payment_mode');

        $validator
            ->integer('cash_bank_account')
            ->requirePresence('cash_bank_account', 'create')
            ->notEmpty('cash_bank_account');

        $validator
            ->requirePresence('narration', 'create')
            ->notEmpty('narration');

        return $validator;
    }
}
