<?php
namespace App\Model\Table;

use Cake\ORM\Query;
use Cake\ORM\RulesChecker;
use Cake\ORM\Table;
use Cake\Validation\Validator;

/**
 * ReceiptBreakups Model
 *
 * @property \Cake\ORM\Association\BelongsTo $ReceiptVouchers
 * @property \Cake\ORM\Association\BelongsTo $Invoices
 *
 * @method \App\Model\Entity\ReceiptBreakup get($primaryKey, $options = [])
 * @method \App\Model\Entity\ReceiptBreakup newEntity($data = null, array $options = [])
 * @method \App\Model\Entity\ReceiptBreakup[] newEntities(array $data, array $options = [])
 * @method \App\Model\Entity\ReceiptBreakup|bool save(\Cake\Datasource\EntityInterface $entity, $options = [])
 * @method \App\Model\Entity\ReceiptBreakup patchEntity(\Cake\Datasource\EntityInterface $entity, array $data, array $options = [])
 * @method \App\Model\Entity\ReceiptBreakup[] patchEntities($entities, array $data, array $options = [])
 * @method \App\Model\Entity\ReceiptBreakup findOrCreate($search, callable $callback = null)
 */
class PaymentBreakupsTable extends Table
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

        $this->table('payment_breakups');
        $this->displayField('id');
        $this->primaryKey('id');

        $this->belongsTo('PaymentVouchers', [
            'foreignKey' => 'payment_voucher_id',
            'joinType' => 'INNER'
        ]);
        $this->belongsTo('InvoiceBookings', [
            'foreignKey' => 'invoice_booking_id',
            'joinType' => 'INNER'
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
            ->allowEmpty('invoice_booking_id');
			
         $validator
            ->decimal('amount')
            ->requirePresence('amount', 'create')
            ->allowEmpty('amount');

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
        $rules->add($rules->existsIn(['payment_voucher_id'], 'PaymentVouchers'));

        return $rules;
    }
}
