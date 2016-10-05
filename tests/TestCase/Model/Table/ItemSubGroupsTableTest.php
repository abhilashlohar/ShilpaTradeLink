<?php
namespace App\Test\TestCase\Model\Table;

use App\Model\Table\ItemSubGroupsTable;
use Cake\ORM\TableRegistry;
use Cake\TestSuite\TestCase;

/**
 * App\Model\Table\ItemSubGroupsTable Test Case
 */
class ItemSubGroupsTableTest extends TestCase
{

    /**
     * Test subject
     *
     * @var \App\Model\Table\ItemSubGroupsTable
     */
    public $ItemSubGroups;

    /**
     * Fixtures
     *
     * @var array
     */
    public $fixtures = [
        'app.item_sub_groups',
        'app.item_groups',
        'app.item_categories',
        'app.items'
    ];

    /**
     * setUp method
     *
     * @return void
     */
    public function setUp()
    {
        parent::setUp();
        $config = TableRegistry::exists('ItemSubGroups') ? [] : ['className' => 'App\Model\Table\ItemSubGroupsTable'];
        $this->ItemSubGroups = TableRegistry::get('ItemSubGroups', $config);
    }

    /**
     * tearDown method
     *
     * @return void
     */
    public function tearDown()
    {
        unset($this->ItemSubGroups);

        parent::tearDown();
    }

    /**
     * Test initialize method
     *
     * @return void
     */
    public function testInitialize()
    {
        $this->markTestIncomplete('Not implemented yet.');
    }

    /**
     * Test validationDefault method
     *
     * @return void
     */
    public function testValidationDefault()
    {
        $this->markTestIncomplete('Not implemented yet.');
    }

    /**
     * Test buildRules method
     *
     * @return void
     */
    public function testBuildRules()
    {
        $this->markTestIncomplete('Not implemented yet.');
    }
}
