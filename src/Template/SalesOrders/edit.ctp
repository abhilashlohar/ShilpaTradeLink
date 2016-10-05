<nav class="large-3 medium-4 columns" id="actions-sidebar">
    <ul class="side-nav">
        <li class="heading"><?= __('Actions') ?></li>
        <li><?= $this->Form->postLink(
                __('Delete'),
                ['action' => 'delete', $salesOrder->id],
                ['confirm' => __('Are you sure you want to delete # {0}?', $salesOrder->id)]
            )
        ?></li>
        <li><?= $this->Html->link(__('List Sales Orders'), ['action' => 'index']) ?></li>
        <li><?= $this->Html->link(__('List Customers'), ['controller' => 'Customers', 'action' => 'index']) ?></li>
        <li><?= $this->Html->link(__('New Customer'), ['controller' => 'Customers', 'action' => 'add']) ?></li>
        <li><?= $this->Html->link(__('List Companies'), ['controller' => 'Companies', 'action' => 'index']) ?></li>
        <li><?= $this->Html->link(__('New Company'), ['controller' => 'Companies', 'action' => 'add']) ?></li>
        <li><?= $this->Html->link(__('List Quotations'), ['controller' => 'Quotations', 'action' => 'index']) ?></li>
        <li><?= $this->Html->link(__('New Quotation'), ['controller' => 'Quotations', 'action' => 'add']) ?></li>
        <li><?= $this->Html->link(__('List Sales Order Rows'), ['controller' => 'SalesOrderRows', 'action' => 'index']) ?></li>
        <li><?= $this->Html->link(__('New Sales Order Row'), ['controller' => 'SalesOrderRows', 'action' => 'add']) ?></li>
    </ul>
</nav>
<div class="salesOrders form large-9 medium-8 columns content">
    <?= $this->Form->create($salesOrder) ?>
    <fieldset>
        <legend><?= __('Edit Sales Order') ?></legend>
        <?php
            echo $this->Form->input('customer_id', ['options' => $customers]);
            echo $this->Form->input('customer_address');
            echo $this->Form->input('subject');
            echo $this->Form->input('text');
            echo $this->Form->input('terms_conditions');
            echo $this->Form->input('total');
            echo $this->Form->input('date');
            echo $this->Form->input('company_id', ['options' => $companies]);
            echo $this->Form->input('process_status');
            echo $this->Form->input('quotation_id', ['options' => $quotations]);
        ?>
    </fieldset>
    <?= $this->Form->button(__('Submit')) ?>
    <?= $this->Form->end() ?>
</div>
