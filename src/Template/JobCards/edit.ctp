<nav class="large-3 medium-4 columns" id="actions-sidebar">
    <ul class="side-nav">
        <li class="heading"><?= __('Actions') ?></li>
        <li><?= $this->Form->postLink(
                __('Delete'),
                ['action' => 'delete', $jobCard->id],
                ['confirm' => __('Are you sure you want to delete # {0}?', $jobCard->id)]
            )
        ?></li>
        <li><?= $this->Html->link(__('List Job Cards'), ['action' => 'index']) ?></li>
        <li><?= $this->Html->link(__('List Companies'), ['controller' => 'Companies', 'action' => 'index']) ?></li>
        <li><?= $this->Html->link(__('New Company'), ['controller' => 'Companies', 'action' => 'add']) ?></li>
        <li><?= $this->Html->link(__('List Customers'), ['controller' => 'Customers', 'action' => 'index']) ?></li>
        <li><?= $this->Html->link(__('New Customer'), ['controller' => 'Customers', 'action' => 'add']) ?></li>
        <li><?= $this->Html->link(__('List Sales Orders'), ['controller' => 'SalesOrders', 'action' => 'index']) ?></li>
        <li><?= $this->Html->link(__('New Sales Order'), ['controller' => 'SalesOrders', 'action' => 'add']) ?></li>
        <li><?= $this->Html->link(__('List Job Card Rows'), ['controller' => 'JobCardRows', 'action' => 'index']) ?></li>
        <li><?= $this->Html->link(__('New Job Card Row'), ['controller' => 'JobCardRows', 'action' => 'add']) ?></li>
    </ul>
</nav>
<div class="jobCards form large-9 medium-8 columns content">
    <?= $this->Form->create($jobCard) ?>
    <fieldset>
        <legend><?= __('Edit Job Card') ?></legend>
        <?php
            echo $this->Form->input('company_id', ['options' => $companies]);
            echo $this->Form->input('customer_id', ['options' => $customers]);
            echo $this->Form->input('sales_order_id', ['options' => $salesOrders]);
            echo $this->Form->input('created_by');
            echo $this->Form->input('created_on');
        ?>
    </fieldset>
    <?= $this->Form->button(__('Submit')) ?>
    <?= $this->Form->end() ?>
</div>
