<nav class="large-3 medium-4 columns" id="actions-sidebar">
    <ul class="side-nav">
        <li class="heading"><?= __('Actions') ?></li>
        <li><?= $this->Form->postLink(
                __('Delete'),
                ['action' => 'delete', $challan->id],
                ['confirm' => __('Are you sure you want to delete # {0}?', $challan->id)]
            )
        ?></li>
        <li><?= $this->Html->link(__('List Challans'), ['action' => 'index']) ?></li>
        <li><?= $this->Html->link(__('List Customers'), ['controller' => 'Customers', 'action' => 'index']) ?></li>
        <li><?= $this->Html->link(__('New Customer'), ['controller' => 'Customers', 'action' => 'add']) ?></li>
        <li><?= $this->Html->link(__('List Companies'), ['controller' => 'Companies', 'action' => 'index']) ?></li>
        <li><?= $this->Html->link(__('New Company'), ['controller' => 'Companies', 'action' => 'add']) ?></li>
        <li><?= $this->Html->link(__('List Invoices'), ['controller' => 'Invoices', 'action' => 'index']) ?></li>
        <li><?= $this->Html->link(__('New Invoice'), ['controller' => 'Invoices', 'action' => 'add']) ?></li>
        <li><?= $this->Html->link(__('List Transporters'), ['controller' => 'Transporters', 'action' => 'index']) ?></li>
        <li><?= $this->Html->link(__('New Transporter'), ['controller' => 'Transporters', 'action' => 'add']) ?></li>
    </ul>
</nav>
<div class="challans form large-9 medium-8 columns content">
    <?= $this->Form->create($challan) ?>
    <fieldset>
        <legend><?= __('Edit Challan') ?></legend>
        <?php
            echo $this->Form->input('customer_id', ['options' => $customers]);
            echo $this->Form->input('company_id', ['options' => $companies]);
            echo $this->Form->input('invoice_id', ['options' => $invoices]);
            echo $this->Form->input('date');
            echo $this->Form->input('transporter_id', ['options' => $transporters]);
            echo $this->Form->input('lr_no');
            echo $this->Form->input('reference_detail');
            echo $this->Form->input('total');
            echo $this->Form->input('documents');
        ?>
    </fieldset>
    <?= $this->Form->button(__('Submit')) ?>
    <?= $this->Form->end() ?>
</div>
