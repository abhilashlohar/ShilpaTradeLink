<?php
namespace App\Test\TestCase\Model\Table;

use App\Model\Table\ReceiptEffectsTable;
use Cake\ORM\TableRegistry;
use Cake\TestSuite\TestCase;

/**
 * App\Model\Table\ReceiptEffectsTable Test Case
 */
class ReceiptEffectsTableTest extends TestCase
{

    /**
     * Test subject
     *
     * @var \App\Model\Table\ReceiptEffectsTable
     */
    public $ReceiptEffects;

    /**
     * Fixtures
     *
     * @var array
     */
    public $fixtures = [
        'app.receipt_effects',
        'app.receipt_vouchers',
        'app.vouchers_references',
        'app.account_groups',
        'app.account_categories',
        'app.account_first_subgroups',
        'app.account_second_subgroups',
        'app.ledger_accounts',
        'app.customers',
        'app.districts',
        'app.company_groups',
        'app.companies',
        'app.item_used_by_companies',
        'app.company_banks',
        'app.quotations',
        'app.employees',
        'app.departments',
        'app.designations',
        'app.employee_contact_persons',
        'app.sales_orders',
        'app.filenames',
        'app.invoices',
        'app.customer_groups',
        'app.item_ledger',
        'app.items',
        'app.item_categories',
        'app.item_groups',
        'app.item_sub_groups',
        'app.units',
        'app.sources',
        'app.item_sources',
        'app.item_companies',
        'app.invoice_rows',
        'app.quotation_rows',
        'app.sales_order_rows',
        'app.sale_taxes',
        'app.ledgers',
        'app.terms_conditions',
        'app.transporters',
        'app.customer_address',
        'app.creator',
        'app.employee_companies',
        'app.account_references',
        'app.carrier',
        'app.courier',
        'app.tax_details',
        'app.editor',
        'app.quotation_close_reasons',
        'app.customer_segs',
        'app.customer_contacts',
        'app.vouchers_references_groups',
        'app.received_froms',
        'app.bank_cashes'
    ];

    /**
     * setUp method
     *
     * @return void
     */
    public function setUp()
    {
        parent::setUp();
        $config = TableRegistry::exists('ReceiptEffects') ? [] : ['className' => 'App\Model\Table\ReceiptEffectsTable'];
        $this->ReceiptEffects = TableRegistry::get('ReceiptEffects', $config);
    }

    /**
     * tearDown method
     *
     * @return void
     */
    public function tearDown()
    {
        unset($this->ReceiptEffects);

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
