<nav class="large-3 medium-4 columns" id="actions-sidebar">
    <ul class="side-nav">
        <li class="heading"><?= __('Actions') ?></li>
        <li><?= $this->Html->link(__('Edit Grn'), ['action' => 'edit', $grn->id]) ?> </li>
        <li><?= $this->Form->postLink(__('Delete Grn'), ['action' => 'delete', $grn->id], ['confirm' => __('Are you sure you want to delete # {0}?', $grn->id)]) ?> </li>
        <li><?= $this->Html->link(__('List Grns'), ['action' => 'index']) ?> </li>
        <li><?= $this->Html->link(__('New Grn'), ['action' => 'add']) ?> </li>
        <li><?= $this->Html->link(__('List Purchase Orders'), ['controller' => 'PurchaseOrders', 'action' => 'index']) ?> </li>
        <li><?= $this->Html->link(__('New Purchase Order'), ['controller' => 'PurchaseOrders', 'action' => 'add']) ?> </li>
        <li><?= $this->Html->link(__('List Companies'), ['controller' => 'Companies', 'action' => 'index']) ?> </li>
        <li><?= $this->Html->link(__('New Company'), ['controller' => 'Companies', 'action' => 'add']) ?> </li>
        <li><?= $this->Html->link(__('List Grn Rows'), ['controller' => 'GrnRows', 'action' => 'index']) ?> </li>
        <li><?= $this->Html->link(__('New Grn Row'), ['controller' => 'GrnRows', 'action' => 'add']) ?> </li>
        <li><?= $this->Html->link(__('List Invoice Bookings'), ['controller' => 'InvoiceBookings', 'action' => 'index']) ?> </li>
        <li><?= $this->Html->link(__('New Invoice Booking'), ['controller' => 'InvoiceBookings', 'action' => 'add']) ?> </li>
    </ul>
</nav>
<div class="grns view large-9 medium-8 columns content">
    <h3><?= h($grn->id) ?></h3>
    <table class="vertical-table">
        <tr>
            <th><?= __('Purchase Order') ?></th>
            <td><?= $grn->has('purchase_order') ? $this->Html->link($grn->purchase_order->id, ['controller' => 'PurchaseOrders', 'action' => 'view', $grn->purchase_order->id]) : '' ?></td>
        </tr>
        <tr>
            <th><?= __('Company') ?></th>
            <td><?= $grn->has('company') ? $this->Html->link($grn->company->name, ['controller' => 'Companies', 'action' => 'view', $grn->company->id]) : '' ?></td>
        </tr>
        <tr>
            <th><?= __('Grn1') ?></th>
            <td><?= h($grn->grn1) ?></td>
        </tr>
        <tr>
            <th><?= __('Grn3') ?></th>
            <td><?= h($grn->grn3) ?></td>
        </tr>
        <tr>
            <th><?= __('Grn4') ?></th>
            <td><?= h($grn->grn4) ?></td>
        </tr>
        <tr>
            <th><?= __('Id') ?></th>
            <td><?= $this->Number->format($grn->id) ?></td>
        </tr>
        <tr>
            <th><?= __('Date Created') ?></th>
            <td><?= h($grn->date_created) ?></td>
        </tr>
        <tr>
            <th><?= __('Created By') ?></th>
            <td><?= h($grn->created_by) ?></td>
        </tr>
    </table>
    <div class="related">
        <h4><?= __('Related Grn Rows') ?></h4>
        <?php if (!empty($grn->grn_rows)): ?>
        <table cellpadding="0" cellspacing="0">
            <tr>
                <th><?= __('Id') ?></th>
                <th><?= __('Grn Id') ?></th>
                <th><?= __('Item Id') ?></th>
                <th><?= __('Quantity') ?></th>
                <th><?= __('Description') ?></th>
                <th class="actions"><?= __('Actions') ?></th>
            </tr>
            <?php foreach ($grn->grn_rows as $grnRows): ?>
            <tr>
                <td><?= h($grnRows->id) ?></td>
                <td><?= h($grnRows->grn_id) ?></td>
                <td><?= h($grnRows->item_id) ?></td>
                <td><?= h($grnRows->quantity) ?></td>
                <td><?= h($grnRows->description) ?></td>
                <td class="actions">
                    <?= $this->Html->link(__('View'), ['controller' => 'GrnRows', 'action' => 'view', $grnRows->id]) ?>
                    <?= $this->Html->link(__('Edit'), ['controller' => 'GrnRows', 'action' => 'edit', $grnRows->id]) ?>
                    <?= $this->Form->postLink(__('Delete'), ['controller' => 'GrnRows', 'action' => 'delete', $grnRows->id], ['confirm' => __('Are you sure you want to delete # {0}?', $grnRows->id)]) ?>
                </td>
            </tr>
            <?php endforeach; ?>
        </table>
        <?php endif; ?>
    </div>
    <div class="related">
        <h4><?= __('Related Invoice Bookings') ?></h4>
        <?php if (!empty($grn->invoice_bookings)): ?>
        <table cellpadding="0" cellspacing="0">
            <tr>
                <th><?= __('Id') ?></th>
                <th><?= __('Grn Id') ?></th>
                <th><?= __('Invoice No') ?></th>
                <th class="actions"><?= __('Actions') ?></th>
            </tr>
            <?php foreach ($grn->invoice_bookings as $invoiceBookings): ?>
            <tr>
                <td><?= h($invoiceBookings->id) ?></td>
                <td><?= h($invoiceBookings->grn_id) ?></td>
                <td><?= h($invoiceBookings->invoice_no) ?></td>
                <td class="actions">
                    <?= $this->Html->link(__('View'), ['controller' => 'InvoiceBookings', 'action' => 'view', $invoiceBookings->id]) ?>
                    <?= $this->Html->link(__('Edit'), ['controller' => 'InvoiceBookings', 'action' => 'edit', $invoiceBookings->id]) ?>
                    <?= $this->Form->postLink(__('Delete'), ['controller' => 'InvoiceBookings', 'action' => 'delete', $invoiceBookings->id], ['confirm' => __('Are you sure you want to delete # {0}?', $invoiceBookings->id)]) ?>
                </td>
            </tr>
            <?php endforeach; ?>
        </table>
        <?php endif; ?>
    </div>
</div>
