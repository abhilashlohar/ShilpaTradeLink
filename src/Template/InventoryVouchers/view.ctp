<nav class="large-3 medium-4 columns" id="actions-sidebar">
    <ul class="side-nav">
        <li class="heading"><?= __('Actions') ?></li>
        <li><?= $this->Html->link(__('Edit Inventory Voucher'), ['action' => 'edit', $inventoryVoucher->id]) ?> </li>
        <li><?= $this->Form->postLink(__('Delete Inventory Voucher'), ['action' => 'delete', $inventoryVoucher->id], ['confirm' => __('Are you sure you want to delete # {0}?', $inventoryVoucher->id)]) ?> </li>
        <li><?= $this->Html->link(__('List Inventory Vouchers'), ['action' => 'index']) ?> </li>
        <li><?= $this->Html->link(__('New Inventory Voucher'), ['action' => 'add']) ?> </li>
        <li><?= $this->Html->link(__('List Invoices'), ['controller' => 'Invoices', 'action' => 'index']) ?> </li>
        <li><?= $this->Html->link(__('New Invoice'), ['controller' => 'Invoices', 'action' => 'add']) ?> </li>
        <li><?= $this->Html->link(__('List Invoice Rows'), ['controller' => 'InvoiceRows', 'action' => 'index']) ?> </li>
        <li><?= $this->Html->link(__('New Invoice Row'), ['controller' => 'InvoiceRows', 'action' => 'add']) ?> </li>
        <li><?= $this->Html->link(__('List Inventory Voucher Rows'), ['controller' => 'InventoryVoucherRows', 'action' => 'index']) ?> </li>
        <li><?= $this->Html->link(__('New Inventory Voucher Row'), ['controller' => 'InventoryVoucherRows', 'action' => 'add']) ?> </li>
    </ul>
</nav>
<div class="inventoryVouchers view large-9 medium-8 columns content">
    <h3><?= h($inventoryVoucher->id) ?></h3>
    <table class="vertical-table">
        <tr>
            <th><?= __('Invoice') ?></th>
            <td><?= $inventoryVoucher->has('invoice') ? $this->Html->link($inventoryVoucher->invoice->id, ['controller' => 'Invoices', 'action' => 'view', $inventoryVoucher->invoice->id]) : '' ?></td>
        </tr>
        <tr>
            <th><?= __('Invoice Row') ?></th>
            <td><?= $inventoryVoucher->has('invoice_row') ? $this->Html->link($inventoryVoucher->invoice_row->id, ['controller' => 'InvoiceRows', 'action' => 'view', $inventoryVoucher->invoice_row->id]) : '' ?></td>
        </tr>
        <tr>
            <th><?= __('Iv1') ?></th>
            <td><?= h($inventoryVoucher->iv1) ?></td>
        </tr>
        <tr>
            <th><?= __('Iv2') ?></th>
            <td><?= h($inventoryVoucher->iv2) ?></td>
        </tr>
        <tr>
            <th><?= __('Iv3') ?></th>
            <td><?= h($inventoryVoucher->iv3) ?></td>
        </tr>
        <tr>
            <th><?= __('Iv4') ?></th>
            <td><?= h($inventoryVoucher->iv4) ?></td>
        </tr>
        <tr>
            <th><?= __('Id') ?></th>
            <td><?= $this->Number->format($inventoryVoucher->id) ?></td>
        </tr>
    </table>
    <div class="related">
        <h4><?= __('Related Inventory Voucher Rows') ?></h4>
        <?php if (!empty($inventoryVoucher->inventory_voucher_rows)): ?>
        <table cellpadding="0" cellspacing="0">
            <tr>
                <th><?= __('Id') ?></th>
                <th><?= __('Inventory Voucher Id') ?></th>
                <th><?= __('Item Id') ?></th>
                <th><?= __('Quantity') ?></th>
                <th class="actions"><?= __('Actions') ?></th>
            </tr>
            <?php foreach ($inventoryVoucher->inventory_voucher_rows as $inventoryVoucherRows): ?>
            <tr>
                <td><?= h($inventoryVoucherRows->id) ?></td>
                <td><?= h($inventoryVoucherRows->inventory_voucher_id) ?></td>
                <td><?= h($inventoryVoucherRows->item_id) ?></td>
                <td><?= h($inventoryVoucherRows->quantity) ?></td>
                <td class="actions">
                    <?= $this->Html->link(__('View'), ['controller' => 'InventoryVoucherRows', 'action' => 'view', $inventoryVoucherRows->id]) ?>
                    <?= $this->Html->link(__('Edit'), ['controller' => 'InventoryVoucherRows', 'action' => 'edit', $inventoryVoucherRows->id]) ?>
                    <?= $this->Form->postLink(__('Delete'), ['controller' => 'InventoryVoucherRows', 'action' => 'delete', $inventoryVoucherRows->id], ['confirm' => __('Are you sure you want to delete # {0}?', $inventoryVoucherRows->id)]) ?>
                </td>
            </tr>
            <?php endforeach; ?>
        </table>
        <?php endif; ?>
    </div>
</div>
