<?php
namespace App\Model\Table;

use Cake\ORM\Query;
use Cake\ORM\RulesChecker;
use Cake\ORM\Table;
use Cake\Validation\Validator;

/**
 * SaleReturns Model
 *
 * @property \Cake\ORM\Association\BelongsTo $Customers
 * @property \Cake\ORM\Association\BelongsTo $SaleTaxes
 * @property \Cake\ORM\Association\BelongsTo $Companies
 * @property \Cake\ORM\Association\BelongsTo $SalesOrders
 * @property \Cake\ORM\Association\BelongsTo $Employees
 * @property \Cake\ORM\Association\BelongsTo $Transporters
 * @property \Cake\ORM\Association\BelongsTo $StLedgerAccounts
 * @property \Cake\ORM\Association\HasMany $SaleReturnRows
 *
 * @method \App\Model\Entity\SaleReturn get($primaryKey, $options = [])
 * @method \App\Model\Entity\SaleReturn newEntity($data = null, array $options = [])
 * @method \App\Model\Entity\SaleReturn[] newEntities(array $data, array $options = [])
 * @method \App\Model\Entity\SaleReturn|bool save(\Cake\Datasource\EntityInterface $entity, $options = [])
 * @method \App\Model\Entity\SaleReturn patchEntity(\Cake\Datasource\EntityInterface $entity, array $data, array $options = [])
 * @method \App\Model\Entity\SaleReturn[] patchEntities($entities, array $data, array $options = [])
 * @method \App\Model\Entity\SaleReturn findOrCreate($search, callable $callback = null)
 */
class SaleReturnsTable extends Table
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
        $this->table('sale_returns');
        $this->displayField('id');
        $this->primaryKey('id');

        $this->belongsTo('Customers', [
            'foreignKey' => 'customer_id',
            'joinType' => 'INNER'
        ]);
        $this->belongsTo('SaleTaxes', [
            'foreignKey' => 'sale_tax_id',
            'joinType' => 'INNER'
        ]);
        $this->belongsTo('Companies', [
            'foreignKey' => 'company_id',
            'joinType' => 'INNER'
        ]);
        $this->belongsTo('SalesOrders', [
            'foreignKey' => 'sales_order_id',
            'joinType' => 'INNER'
        ]);
        $this->belongsTo('Employees', [
            'foreignKey' => 'employee_id',
            'joinType' => 'INNER'
        ]);
        $this->belongsTo('Transporters', [
            'foreignKey' => 'transporter_id',
            'joinType' => 'INNER'
        ]);
        $this->belongsTo('Invoices');
		$this->belongsTo('LedgerAccounts');
		$this->belongsTo('AccountReferences');
		$this->belongsTo('AccountFirstSubgroups');
		$this->belongsTo('AccountSecondSubgroups');

        $this->hasMany('SaleReturnRows', [
            'foreignKey' => 'sale_return_id'
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
            ->decimal('temp_limit')
            ->allowEmpty('temp_limit');

        $validator
            ->requirePresence('customer_address', 'create')
            ->notEmpty('customer_address');

        $validator
            ->requirePresence('lr_no', 'create')
            ->notEmpty('lr_no');

        $validator
            ->allowEmpty('terms_conditions');

        $validator
            ->boolean('discount_type')
            ->requirePresence('discount_type', 'create')
            ->notEmpty('discount_type');

        $validator
            ->decimal('total')
            ->requirePresence('total', 'create')
            ->notEmpty('total');

        $validator
            ->decimal('pnf')
            ->requirePresence('pnf', 'create')
            ->notEmpty('pnf');

        $validator
            ->boolean('pnf_type')
            ->requirePresence('pnf_type', 'create')
            ->notEmpty('pnf_type');

        $validator
            ->decimal('pnf_per')
            ->requirePresence('pnf_per', 'create')
            ->notEmpty('pnf_per');

        $validator
            ->decimal('total_after_pnf')
            ->requirePresence('total_after_pnf', 'create')
            ->notEmpty('total_after_pnf');

        $validator
            ->decimal('sale_tax_per')
            ->requirePresence('sale_tax_per', 'create')
            ->notEmpty('sale_tax_per');

        $validator
            ->decimal('sale_tax_amount')
            ->requirePresence('sale_tax_amount', 'create')
            ->notEmpty('sale_tax_amount');

        $validator
            ->decimal('exceise_duty')
            ->requirePresence('exceise_duty', 'create')
            ->notEmpty('exceise_duty');

        $validator
            ->requirePresence('ed_description', 'create')
            ->notEmpty('ed_description');

        $validator
            ->decimal('fright_amount')
            ->requirePresence('fright_amount', 'create')
            ->notEmpty('fright_amount');

        $validator
            ->requirePresence('fright_text', 'create')
            ->notEmpty('fright_text');

        $validator
            ->decimal('grand_total')
            ->requirePresence('grand_total', 'create')
            ->notEmpty('grand_total');

        $validator
            ->decimal('due_payment')
            ->requirePresence('due_payment', 'create')
            ->notEmpty('due_payment');

        $validator
            ->date('date_created')
            ->requirePresence('date_created', 'create')
            ->notEmpty('date_created');

        $validator
            ->requirePresence('process_status', 'create')
            ->notEmpty('process_status');

        $validator
            ->requirePresence('in1', 'create')
            ->notEmpty('in1');

        $validator
            ->integer('in2')
            ->requirePresence('in2', 'create')
            ->notEmpty('in2');

        $validator
            ->requirePresence('in4', 'create')
            ->notEmpty('in4');

        $validator
            ->requirePresence('in3', 'create')
            ->notEmpty('in3');

        $validator
            ->requirePresence('customer_po_no', 'create')
            ->notEmpty('customer_po_no');

        $validator
            ->date('po_date')
            ->requirePresence('po_date', 'create')
            ->notEmpty('po_date');

        $validator
            ->requirePresence('additional_note', 'create')
            ->notEmpty('additional_note');

        $validator
            ->integer('created_by')
            ->requirePresence('created_by', 'create')
            ->notEmpty('created_by');

        $validator
            ->decimal('discount_per')
            ->requirePresence('discount_per', 'create')
            ->notEmpty('discount_per');

        $validator
            ->decimal('discount')
            ->requirePresence('discount', 'create')
            ->notEmpty('discount');

        $validator
            ->requirePresence('form47', 'create')
            ->notEmpty('form47');

        $validator
            ->requirePresence('form49', 'create')
            ->notEmpty('form49');

        $validator
            ->requirePresence('status', 'create')
            ->notEmpty('status');

        $validator
            ->requirePresence('inventory_voucher_status', 'create')
            ->notEmpty('inventory_voucher_status');

        $validator
            ->requirePresence('payment_mode', 'create')
            ->notEmpty('payment_mode');

        $validator
            ->integer('fright_ledger_account')
            ->requirePresence('fright_ledger_account', 'create')
            ->notEmpty('fright_ledger_account');

        $validator
            ->integer('sales_ledger_account')
            ->requirePresence('sales_ledger_account', 'create')
            ->notEmpty('sales_ledger_account');

        $validator
            ->requirePresence('pdf_font_size', 'create')
            ->notEmpty('pdf_font_size');

        $validator
            ->requirePresence('delivery_description', 'create')
            ->notEmpty('delivery_description');

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
        $rules->add($rules->existsIn(['customer_id'], 'Customers'));
        $rules->add($rules->existsIn(['sale_tax_id'], 'SaleTaxes'));
        $rules->add($rules->existsIn(['company_id'], 'Companies'));
        $rules->add($rules->existsIn(['sales_order_id'], 'SalesOrders'));
        $rules->add($rules->existsIn(['employee_id'], 'Employees'));
        $rules->add($rules->existsIn(['transporter_id'], 'Transporters'));
        $rules->add($rules->existsIn(['st_ledger_account_id'], 'StLedgerAccounts'));

        return $rules;
    }
}
