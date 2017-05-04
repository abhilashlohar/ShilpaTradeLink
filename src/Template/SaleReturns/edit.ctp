<nav class="large-3 medium-4 columns" id="actions-sidebar">
    <ul class="side-nav">
        <li class="heading"><?= __('Actions') ?></li>
        <li><?= $this->Form->postLink(
                __('Delete'),
                ['action' => 'delete', $saleReturn->id],
                ['confirm' => __('Are you sure you want to delete # {0}?', $saleReturn->id)]
            )
        ?></li>
        <li><?= $this->Html->link(__('List Sale Returns'), ['action' => 'index']) ?></li>
        <li><?= $this->Html->link(__('List Customers'), ['controller' => 'Customers', 'action' => 'index']) ?></li>
        <li><?= $this->Html->link(__('New Customer'), ['controller' => 'Customers', 'action' => 'add']) ?></li>
        <li><?= $this->Html->link(__('List Sale Taxes'), ['controller' => 'SaleTaxes', 'action' => 'index']) ?></li>
        <li><?= $this->Html->link(__('New Sale Tax'), ['controller' => 'SaleTaxes', 'action' => 'add']) ?></li>
        <li><?= $this->Html->link(__('List Companies'), ['controller' => 'Companies', 'action' => 'index']) ?></li>
        <li><?= $this->Html->link(__('New Company'), ['controller' => 'Companies', 'action' => 'add']) ?></li>
        <li><?= $this->Html->link(__('List Sales Orders'), ['controller' => 'SalesOrders', 'action' => 'index']) ?></li>
        <li><?= $this->Html->link(__('New Sales Order'), ['controller' => 'SalesOrders', 'action' => 'add']) ?></li>
        <li><?= $this->Html->link(__('List Employees'), ['controller' => 'Employees', 'action' => 'index']) ?></li>
        <li><?= $this->Html->link(__('New Employee'), ['controller' => 'Employees', 'action' => 'add']) ?></li>
        <li><?= $this->Html->link(__('List Transporters'), ['controller' => 'Transporters', 'action' => 'index']) ?></li>
        <li><?= $this->Html->link(__('New Transporter'), ['controller' => 'Transporters', 'action' => 'add']) ?></li>
        <li><?= $this->Html->link(__('List Sale Return Rows'), ['controller' => 'SaleReturnRows', 'action' => 'index']) ?></li>
        <li><?= $this->Html->link(__('New Sale Return Row'), ['controller' => 'SaleReturnRows', 'action' => 'add']) ?></li>
    </ul>
</nav>
<div class="saleReturns form large-9 medium-8 columns content">
    <?= $this->Form->create($saleReturn) ?>
    <fieldset>
        <legend><?= __('Edit Sale Return') ?></legend>
        <?php
            echo $this->Form->input('temp_limit');
            echo $this->Form->input('customer_id', ['options' => $customers]);
            echo $this->Form->input('customer_address');
            echo $this->Form->input('lr_no');
            echo $this->Form->input('terms_conditions');
            echo $this->Form->input('discount_type');
            echo $this->Form->input('total');
            echo $this->Form->input('pnf');
            echo $this->Form->input('pnf_type');
            echo $this->Form->input('pnf_per');
            echo $this->Form->input('total_after_pnf');
            echo $this->Form->input('sale_tax_per');
            echo $this->Form->input('sale_tax_id', ['options' => $saleTaxes]);
            echo $this->Form->input('sale_tax_amount');
            echo $this->Form->input('exceise_duty');
            echo $this->Form->input('ed_description');
            echo $this->Form->input('fright_amount');
            echo $this->Form->input('fright_text');
            echo $this->Form->input('grand_total');
            echo $this->Form->input('due_payment');
            echo $this->Form->input('date_created');
            echo $this->Form->input('company_id', ['options' => $companies]);
            echo $this->Form->input('process_status');
            echo $this->Form->input('sales_order_id', ['options' => $salesOrders]);
            echo $this->Form->input('in1');
            echo $this->Form->input('in2');
            echo $this->Form->input('in4');
            echo $this->Form->input('in3');
            echo $this->Form->input('customer_po_no');
            echo $this->Form->input('po_date');
            echo $this->Form->input('additional_note');
            echo $this->Form->input('employee_id', ['options' => $employees]);
            echo $this->Form->input('created_by');
            echo $this->Form->input('transporter_id', ['options' => $transporters]);
            echo $this->Form->input('discount_per');
            echo $this->Form->input('discount');
            echo $this->Form->input('form47');
            echo $this->Form->input('form49');
            echo $this->Form->input('status');
            echo $this->Form->input('inventory_voucher_status');
            echo $this->Form->input('payment_mode');
            echo $this->Form->input('fright_ledger_account');
            echo $this->Form->input('sales_ledger_account');
            echo $this->Form->input('st_ledger_account_id');
            echo $this->Form->input('pdf_font_size');
            echo $this->Form->input('delivery_description');
        ?>
    </fieldset>
    <?= $this->Form->button(__('Submit')) ?>
    <?= $this->Form->end() ?>
</div>
