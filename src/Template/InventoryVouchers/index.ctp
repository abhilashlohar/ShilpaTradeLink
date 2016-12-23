<nav class="large-3 medium-4 columns" id="actions-sidebar">
    <ul class="side-nav">
        <li class="heading"><?= __('Actions') ?></li>
        <li><?= $this->Html->link(__('New Inventory Voucher'), ['action' => 'add']) ?></li>
        <li><?= $this->Html->link(__('List Invoices'), ['controller' => 'Invoices', 'action' => 'index']) ?></li>
        <li><?= $this->Html->link(__('New Invoice'), ['controller' => 'Invoices', 'action' => 'add']) ?></li>
        <li><?= $this->Html->link(__('List Invoice Rows'), ['controller' => 'InvoiceRows', 'action' => 'index']) ?></li>
        <li><?= $this->Html->link(__('New Invoice Row'), ['controller' => 'InvoiceRows', 'action' => 'add']) ?></li>
        <li><?= $this->Html->link(__('List Inventory Voucher Rows'), ['controller' => 'InventoryVoucherRows', 'action' => 'index']) ?></li>
        <li><?= $this->Html->link(__('New Inventory Voucher Row'), ['controller' => 'InventoryVoucherRows', 'action' => 'add']) ?></li>
    </ul>
</nav>
<div class="inventoryVouchers index large-9 medium-8 columns content">
    <h3><?= __('Inventory Vouchers') ?></h3>
    <table cellpadding="0" cellspacing="0">
        <thead>
            <tr>
                <th><?= $this->Paginator->sort('id') ?></th>
                <th><?= $this->Paginator->sort('invoice_id') ?></th>
                <th><?= $this->Paginator->sort('invoice_row_id') ?></th>
                <th><?= $this->Paginator->sort('iv1') ?></th>
                <th><?= $this->Paginator->sort('iv2') ?></th>
                <th><?= $this->Paginator->sort('iv3') ?></th>
                <th><?= $this->Paginator->sort('iv4') ?></th>
                <th class="actions"><?= __('Actions') ?></th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($inventoryVouchers as $inventoryVoucher): ?>
            <tr>
                <td><?= $this->Number->format($inventoryVoucher->id) ?></td>
                <td><?= $inventoryVoucher->has('invoice') ? $this->Html->link($inventoryVoucher->invoice->id, ['controller' => 'Invoices', 'action' => 'view', $inventoryVoucher->invoice->id]) : '' ?></td>
                <td><?= $inventoryVoucher->has('invoice_row') ? $this->Html->link($inventoryVoucher->invoice_row->id, ['controller' => 'InvoiceRows', 'action' => 'view', $inventoryVoucher->invoice_row->id]) : '' ?></td>
                <td><?= h($inventoryVoucher->iv1) ?></td>
                <td><?= h($inventoryVoucher->iv2) ?></td>
                <td><?= h($inventoryVoucher->iv3) ?></td>
                <td><?= h($inventoryVoucher->iv4) ?></td>
                <td class="actions">
                    <?= $this->Html->link(__('View'), ['action' => 'view', $inventoryVoucher->id]) ?>
                    <?= $this->Html->link(__('Edit'), ['action' => 'edit', $inventoryVoucher->id]) ?>
                    <?= $this->Form->postLink(__('Delete'), ['action' => 'delete', $inventoryVoucher->id], ['confirm' => __('Are you sure you want to delete # {0}?', $inventoryVoucher->id)]) ?>
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
