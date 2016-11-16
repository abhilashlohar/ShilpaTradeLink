<nav class="large-3 medium-4 columns" id="actions-sidebar">
    <ul class="side-nav">
        <li class="heading"><?= __('Actions') ?></li>
        <li><?= $this->Html->link(__('Edit Invoice Booking'), ['action' => 'edit', $invoiceBooking->id]) ?> </li>
        <li><?= $this->Form->postLink(__('Delete Invoice Booking'), ['action' => 'delete', $invoiceBooking->id], ['confirm' => __('Are you sure you want to delete # {0}?', $invoiceBooking->id)]) ?> </li>
        <li><?= $this->Html->link(__('List Invoice Bookings'), ['action' => 'index']) ?> </li>
        <li><?= $this->Html->link(__('New Invoice Booking'), ['action' => 'add']) ?> </li>
        <li><?= $this->Html->link(__('List Grns'), ['controller' => 'Grns', 'action' => 'index']) ?> </li>
        <li><?= $this->Html->link(__('New Grn'), ['controller' => 'Grns', 'action' => 'add']) ?> </li>
    </ul>
</nav>
<div class="invoiceBookings view large-9 medium-8 columns content">
    <h3><?= h($invoiceBooking->id) ?></h3>
    <table class="vertical-table">
        <tr>
            <th><?= __('Grn') ?></th>
            <td><?= $invoiceBooking->has('grn') ? $this->Html->link($invoiceBooking->grn->id, ['controller' => 'Grns', 'action' => 'view', $invoiceBooking->grn->id]) : '' ?></td>
        </tr>
        <tr>
            <th><?= __('Invoice No') ?></th>
            <td><?= h($invoiceBooking->invoice_no) ?></td>
        </tr>
        <tr>
            <th><?= __('Id') ?></th>
            <td><?= $this->Number->format($invoiceBooking->id) ?></td>
        </tr>
        <tr>
            <th><?= __('Created On') ?></th>
            <td><?= h($invoiceBooking->created_on) ?></td>
        </tr>
    </table>
</div>
