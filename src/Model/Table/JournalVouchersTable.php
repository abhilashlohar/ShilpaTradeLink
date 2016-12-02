<?php
namespace App\Model\Table;

use Cake\ORM\Query;
use Cake\ORM\RulesChecker;
use Cake\ORM\Table;
use Cake\Validation\Validator;

/**
 * JournalVouchers Model
 *
 * @property \Cake\ORM\Association\BelongsTo $Companies
 *
 * @method \App\Model\Entity\JournalVoucher get($primaryKey, $options = [])
 * @method \App\Model\Entity\JournalVoucher newEntity($data = null, array $options = [])
 * @method \App\Model\Entity\JournalVoucher[] newEntities(array $data, array $options = [])
 * @method \App\Model\Entity\JournalVoucher|bool save(\Cake\Datasource\EntityInterface $entity, $options = [])
 * @method \App\Model\Entity\JournalVoucher patchEntity(\Cake\Datasource\EntityInterface $entity, array $data, array $options = [])
 * @method \App\Model\Entity\JournalVoucher[] patchEntities($entities, array $data, array $options = [])
 * @method \App\Model\Entity\JournalVoucher findOrCreate($search, callable $callback = null)
 */
class JournalVouchersTable extends Table
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

        $this->table('journal_vouchers');
        $this->displayField('id');
        $this->primaryKey('id');
		$this->belongsTo('VouchersReferences');
		$this->belongsTo('Ledgers');
        $this->belongsTo('Companies', [
            'foreignKey' => 'company_id',
            'joinType' => 'INNER'
        ]);
		$this->belongsTo('Ledger1s', [
			'className' => 'LedgerAccounts',
            'foreignKey' => 'ledger1',
            'propertyName' => 'Ledger1s',
        ]);
		$this->belongsTo('Ledger2s', [
			'className' => 'LedgerAccounts',
            'foreignKey' => 'ledger2',
            'propertyName' => 'Ledger2s',
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
            ->integer('ledger1')
            ->requirePresence('ledger1', 'create')
            ->notEmpty('ledger1');

        $validator
            ->requirePresence('payment_mode', 'create')
            ->notEmpty('payment_mode');

        $validator
            ->integer('ledger2')
            ->requirePresence('ledger2', 'create')
            ->notEmpty('ledger2');

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
