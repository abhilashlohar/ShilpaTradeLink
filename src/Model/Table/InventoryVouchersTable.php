<?php
namespace App\Model\Table;

use Cake\ORM\Query;
use Cake\ORM\RulesChecker;
use Cake\ORM\Table;
use Cake\Validation\Validator;

/**
 * InventoryVouchers Model
 *
 * @property \Cake\ORM\Association\BelongsTo $Invoices
 * @property \Cake\ORM\Association\BelongsTo $InvoiceRows
 * @property \Cake\ORM\Association\HasMany $InventoryVoucherRows
 *
 * @method \App\Model\Entity\InventoryVoucher get($primaryKey, $options = [])
 * @method \App\Model\Entity\InventoryVoucher newEntity($data = null, array $options = [])
 * @method \App\Model\Entity\InventoryVoucher[] newEntities(array $data, array $options = [])
 * @method \App\Model\Entity\InventoryVoucher|bool save(\Cake\Datasource\EntityInterface $entity, $options = [])
 * @method \App\Model\Entity\InventoryVoucher patchEntity(\Cake\Datasource\EntityInterface $entity, array $data, array $options = [])
 * @method \App\Model\Entity\InventoryVoucher[] patchEntities($entities, array $data, array $options = [])
 * @method \App\Model\Entity\InventoryVoucher findOrCreate($search, callable $callback = null)
 */
class InventoryVouchersTable extends Table
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

        $this->table('inventory_vouchers');
        $this->displayField('id');
        $this->primaryKey('id');
		$this->belongsTo('Items');
        $this->belongsTo('Invoices', [
            'foreignKey' => 'invoice_id',
            'joinType' => 'INNER'
        ]);
        $this->belongsTo('InvoiceRows', [
            'foreignKey' => 'invoice_row_id',
            'joinType' => 'INNER'
        ]);
        $this->hasMany('InventoryVoucherRows', [
            'foreignKey' => 'inventory_voucher_id',
			'saveStrategy' => 'replace'	
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
            ->requirePresence('iv1', 'create')
            ->notEmpty('iv1');

        $validator
            ->requirePresence('iv2', 'create')
            ->notEmpty('iv2');

        $validator
            ->requirePresence('iv3', 'create')
            ->notEmpty('iv3');

        $validator
            ->requirePresence('iv4', 'create')
            ->notEmpty('iv4');

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
        $rules->add($rules->existsIn(['invoice_id'], 'Invoices'));
        $rules->add($rules->existsIn(['invoice_row_id'], 'InvoiceRows'));

        return $rules;
    }
}
