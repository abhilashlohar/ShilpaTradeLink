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
class ReceiptBreakupsTable extends Table
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

        $this->table('receipt_breakups');
        $this->displayField('id');
        $this->primaryKey('id');

        $this->belongsTo('ReceiptVouchers', [
            'foreignKey' => 'receipt_voucher_id',
            'joinType' => 'INNER'
        ]);
        $this->belongsTo('Invoices', [
            'foreignKey' => 'invoice_id',
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
            ->requirePresence('type', 'create')
            ->notEmpty('type');

        $validator
            ->requirePresence('new_ref_no', 'create')
            ->notEmpty('new_ref_no');

        $validator
            ->decimal('amount')
            ->requirePresence('amount', 'create')
            ->notEmpty('amount');

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
        $rules->add($rules->existsIn(['receipt_voucher_id'], 'ReceiptVouchers'));
        $rules->add($rules->existsIn(['invoice_id'], 'Invoices'));

        return $rules;
    }
}
