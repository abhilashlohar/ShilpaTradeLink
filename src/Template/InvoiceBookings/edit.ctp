<nav class="large-3 medium-4 columns" id="actions-sidebar">
    <ul class="side-nav">
        <li class="heading"><?= __('Actions') ?></li>
        <li><?= $this->Form->postLink(
                __('Delete'),
                ['action' => 'delete', $invoiceBooking->id],
                ['confirm' => __('Are you sure you want to delete # {0}?', $invoiceBooking->id)]
            )
        ?></li>
        <li><?= $this->Html->link(__('List Invoice Bookings'), ['action' => 'index']) ?></li>
        <li><?= $this->Html->link(__('List Grns'), ['controller' => 'Grns', 'action' => 'index']) ?></li>
        <li><?= $this->Html->link(__('New Grn'), ['controller' => 'Grns', 'action' => 'add']) ?></li>
    </ul>
</nav>
<div class="invoiceBookings form large-9 medium-8 columns content">
    <?= $this->Form->create($invoiceBooking) ?>
    <fieldset>
        <legend><?= __('Edit Invoice Booking') ?></legend>
        <?php
            echo $this->Form->input('grn_id', ['options' => $grns]);
            echo $this->Form->input('invoice_no');
            echo $this->Form->input('created_on');
        ?>
    </fieldset>
    <?= $this->Form->button(__('Submit')) ?>
    <?= $this->Form->end() ?>
</div>
