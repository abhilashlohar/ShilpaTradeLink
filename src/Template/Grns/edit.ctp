<nav class="large-3 medium-4 columns" id="actions-sidebar">
    <ul class="side-nav">
        <li class="heading"><?= __('Actions') ?></li>
        <li><?= $this->Form->postLink(
                __('Delete'),
                ['action' => 'delete', $grn->id],
                ['confirm' => __('Are you sure you want to delete # {0}?', $grn->id)]
            )
        ?></li>
        <li><?= $this->Html->link(__('List Grns'), ['action' => 'index']) ?></li>
        <li><?= $this->Html->link(__('List Purchase Orders'), ['controller' => 'PurchaseOrders', 'action' => 'index']) ?></li>
        <li><?= $this->Html->link(__('New Purchase Order'), ['controller' => 'PurchaseOrders', 'action' => 'add']) ?></li>
        <li><?= $this->Html->link(__('List Companies'), ['controller' => 'Companies', 'action' => 'index']) ?></li>
        <li><?= $this->Html->link(__('New Company'), ['controller' => 'Companies', 'action' => 'add']) ?></li>
        <li><?= $this->Html->link(__('List Grn Rows'), ['controller' => 'GrnRows', 'action' => 'index']) ?></li>
        <li><?= $this->Html->link(__('New Grn Row'), ['controller' => 'GrnRows', 'action' => 'add']) ?></li>
        <li><?= $this->Html->link(__('List Invoice Bookings'), ['controller' => 'InvoiceBookings', 'action' => 'index']) ?></li>
        <li><?= $this->Html->link(__('New Invoice Booking'), ['controller' => 'InvoiceBookings', 'action' => 'add']) ?></li>
    </ul>
</nav>
<div class="grns form large-9 medium-8 columns content">
    <?= $this->Form->create($grn) ?>
    <fieldset>
        <legend><?= __('Edit Grn') ?></legend>
        <?php
            echo $this->Form->input('date_created');
            echo $this->Form->input('purchase_order_id', ['options' => $purchaseOrders]);
            echo $this->Form->input('company_id', ['options' => $companies]);
            echo $this->Form->input('grn1');
            echo $this->Form->input('grn3');
            echo $this->Form->input('grn4');
            echo $this->Form->input('created_by');
        ?>
    </fieldset>
    <?= $this->Form->button(__('Submit')) ?>
    <?= $this->Form->end() ?>
</div>
