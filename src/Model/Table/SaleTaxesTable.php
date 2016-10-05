<?php
namespace App\Model\Table;

use Cake\ORM\Query;
use Cake\ORM\RulesChecker;
use Cake\ORM\Table;
use Cake\Validation\Validator;

/**
 * SaleTaxes Model
 *
 * @method \App\Model\Entity\SaleTax get($primaryKey, $options = [])
 * @method \App\Model\Entity\SaleTax newEntity($data = null, array $options = [])
 * @method \App\Model\Entity\SaleTax[] newEntities(array $data, array $options = [])
 * @method \App\Model\Entity\SaleTax|bool save(\Cake\Datasource\EntityInterface $entity, $options = [])
 * @method \App\Model\Entity\SaleTax patchEntity(\Cake\Datasource\EntityInterface $entity, array $data, array $options = [])
 * @method \App\Model\Entity\SaleTax[] patchEntities($entities, array $data, array $options = [])
 * @method \App\Model\Entity\SaleTax findOrCreate($search, callable $callback = null)
 */
class SaleTaxesTable extends Table
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

        $this->table('sale_taxes');
        $this->displayField('tax_figure');
        $this->primaryKey('id');
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
            ->decimal('tax_figure')
            ->requirePresence('tax_figure', 'create')
            ->notEmpty('tax_figure');

        $validator
            ->requirePresence('description', 'create')
            ->notEmpty('description');

        return $validator;
    }
}
