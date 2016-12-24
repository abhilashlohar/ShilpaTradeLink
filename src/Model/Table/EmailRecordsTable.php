<?php
namespace App\Model\Table;

use Cake\ORM\Query;
use Cake\ORM\RulesChecker;
use Cake\ORM\Table;
use Cake\Validation\Validator;

/**
 * EmailRecords Model
 *
 * @property \Cake\ORM\Association\BelongsTo $Quotations
 *
 * @method \App\Model\Entity\EmailRecord get($primaryKey, $options = [])
 * @method \App\Model\Entity\EmailRecord newEntity($data = null, array $options = [])
 * @method \App\Model\Entity\EmailRecord[] newEntities(array $data, array $options = [])
 * @method \App\Model\Entity\EmailRecord|bool save(\Cake\Datasource\EntityInterface $entity, $options = [])
 * @method \App\Model\Entity\EmailRecord patchEntity(\Cake\Datasource\EntityInterface $entity, array $data, array $options = [])
 * @method \App\Model\Entity\EmailRecord[] patchEntities($entities, array $data, array $options = [])
 * @method \App\Model\Entity\EmailRecord findOrCreate($search, callable $callback = null)
 */
class EmailRecordsTable extends Table
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

        $this->table('email_records');
        $this->displayField('id');
        $this->primaryKey('id');

        $this->belongsTo('Quotations', [
            'foreignKey' => 'quotation_id',
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
            ->requirePresence('send_to', 'create')
            ->notEmpty('send_to');

        $validator
            ->requirePresence('subject', 'create')
            ->notEmpty('subject');

        $validator
            ->requirePresence('message', 'create')
            ->notEmpty('message');

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
        $rules->add($rules->existsIn(['quotation_id'], 'Quotations'));

        return $rules;
    }
}
