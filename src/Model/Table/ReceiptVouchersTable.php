<?php
namespace App\Model\Table;

use Cake\ORM\Query;
use Cake\ORM\RulesChecker;
use Cake\ORM\Table;
use Cake\Validation\Validator;

/**
 * ReceiptVouchers Model
 *
 * @property \Cake\ORM\Association\BelongsTo $ReceivedFroms
 * @property \Cake\ORM\Association\BelongsTo $BankCashes
 *
 * @method \App\Model\Entity\ReceiptVoucher get($primaryKey, $options = [])
 * @method \App\Model\Entity\ReceiptVoucher newEntity($data = null, array $options = [])
 * @method \App\Model\Entity\ReceiptVoucher[] newEntities(array $data, array $options = [])
 * @method \App\Model\Entity\ReceiptVoucher|bool save(\Cake\Datasource\EntityInterface $entity, $options = [])
 * @method \App\Model\Entity\ReceiptVoucher patchEntity(\Cake\Datasource\EntityInterface $entity, array $data, array $options = [])
 * @method \App\Model\Entity\ReceiptVoucher[] patchEntities($entities, array $data, array $options = [])
 * @method \App\Model\Entity\ReceiptVoucher findOrCreate($search, callable $callback = null)
 */
class ReceiptVouchersTable extends Table
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

        $this->table('receipt_vouchers');
        $this->displayField('id');
        $this->primaryKey('id');

        $this->belongsTo('ReceivedFroms', [
			'className' => 'LedgerAccounts',
            'foreignKey' => 'received_from_id',
            'propertyName' => 'ReceivedFrom',
        ]);
		$this->belongsTo('BankCashes', [
			'className' => 'LedgerAccounts',
            'foreignKey' => 'bank_cash_id',
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
            ->requirePresence('narration', 'create')
            ->notEmpty('narration');

        $validator
            ->decimal('amount')
            ->requirePresence('amount', 'create')
            ->notEmpty('amount');

        $validator
            ->integer('created_by')
            ->requirePresence('created_by', 'create')
            ->notEmpty('created_by');

        $validator
            ->date('created_on')
            ->requirePresence('created_on', 'create')
            ->notEmpty('created_on');

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
        $rules->add($rules->existsIn(['received_from_id'], 'ReceivedFroms'));
        $rules->add($rules->existsIn(['bank_cash_id'], 'BankCashes'));

        return $rules;
    }
}
