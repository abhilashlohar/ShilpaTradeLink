<nav class="large-3 medium-4 columns" id="actions-sidebar">
    <ul class="side-nav">
        <li class="heading"><?= __('Actions') ?></li>
        <li><?= $this->Html->link(__('New Invoice Booking'), ['action' => 'add']) ?></li>
        <li><?= $this->Html->link(__('List Grns'), ['controller' => 'Grns', 'action' => 'index']) ?></li>
        <li><?= $this->Html->link(__('New Grn'), ['controller' => 'Grns', 'action' => 'add']) ?></li>
    </ul>
</nav>
<div class="invoiceBookings index large-9 medium-8 columns content">
    <h3><?= __('Invoice Bookings') ?></h3>
    <table cellpadding="0" cellspacing="0">
        <thead>
            <tr>
                <th><?= $this->Paginator->sort('id') ?></th>
                <th><?= $this->Paginator->sort('grn_id') ?></th>
                <th><?= $this->Paginator->sort('invoice_no') ?></th>
                <th><?= $this->Paginator->sort('created_on') ?></th>
                <th class="actions"><?= __('Actions') ?></th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($invoiceBookings as $invoiceBooking): ?>
            <tr>
                <td><?= $this->Number->format($invoiceBooking->id) ?></td>
                <td><?= $invoiceBooking->has('grn') ? $this->Html->link($invoiceBooking->grn->id, ['controller' => 'Grns', 'action' => 'view', $invoiceBooking->grn->id]) : '' ?></td>
                <td><?= h($invoiceBooking->invoice_no) ?></td>
                <td><?= h($invoiceBooking->created_on) ?></td>
                <td class="actions">
                    <?= $this->Html->link(__('View'), ['action' => 'view', $invoiceBooking->id]) ?>
                    <?= $this->Html->link(__('Edit'), ['action' => 'edit', $invoiceBooking->id]) ?>
                    <?= $this->Form->postLink(__('Delete'), ['action' => 'delete', $invoiceBooking->id], ['confirm' => __('Are you sure you want to delete # {0}?', $invoiceBooking->id)]) ?>
                </td>
            </tr>
            <?php endforeach; ?>
        </tbody>
    </table>
    <div class="paginator">
        <ul class="pagination">
            <?= $this->Paginator->prev('< ' . __('previous')) ?>
            <?= $this->Paginator->numbers() ?>
            <?= $this->Paginator->next(__('next') . ' >') ?>
        </ul>
        <p><?= $this->Paginator->counter() ?></p>
    </div>
</div>
