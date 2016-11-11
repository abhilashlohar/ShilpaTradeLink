<nav class="large-3 medium-4 columns" id="actions-sidebar">
    <ul class="side-nav">
        <li class="heading"><?= __('Actions') ?></li>
        <li><?= $this->Html->link(__('New Grn'), ['action' => 'add']) ?></li>
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
<div class="grns index large-9 medium-8 columns content">
    <h3><?= __('Grns') ?></h3>
    <table cellpadding="0" cellspacing="0">
        <thead>
            <tr>
                <th><?= $this->Paginator->sort('id') ?></th>
                <th><?= $this->Paginator->sort('date_created') ?></th>
                <th><?= $this->Paginator->sort('purchase_order_id') ?></th>
                <th><?= $this->Paginator->sort('company_id') ?></th>
                <th><?= $this->Paginator->sort('grn1') ?></th>
                <th><?= $this->Paginator->sort('grn3') ?></th>
                <th><?= $this->Paginator->sort('grn4') ?></th>
                <th><?= $this->Paginator->sort('created_by') ?></th>
                <th class="actions"><?= __('Actions') ?></th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($grns as $grn): ?>
            <tr>
                <td><?= $this->Number->format($grn->id) ?></td>
                <td><?= h($grn->date_created) ?></td>
                <td><?= $grn->has('purchase_order') ? $this->Html->link($grn->purchase_order->id, ['controller' => 'PurchaseOrders', 'action' => 'view', $grn->purchase_order->id]) : '' ?></td>
                <td><?= $grn->has('company') ? $this->Html->link($grn->company->name, ['controller' => 'Companies', 'action' => 'view', $grn->company->id]) : '' ?></td>
                <td><?= h($grn->grn1) ?></td>
                <td><?= h($grn->grn3) ?></td>
                <td><?= h($grn->grn4) ?></td>
                <td><?= h($grn->created_by) ?></td>
                <td class="actions">
                    <?= $this->Html->link(__('View'), ['action' => 'view', $grn->id]) ?>
                    <?= $this->Html->link(__('Edit'), ['action' => 'edit', $grn->id]) ?>
                    <?= $this->Form->postLink(__('Delete'), ['action' => 'delete', $grn->id], ['confirm' => __('Are you sure you want to delete # {0}?', $grn->id)]) ?>
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
