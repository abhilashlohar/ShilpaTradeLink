<nav class="large-3 medium-4 columns" id="actions-sidebar">
    <ul class="side-nav">
        <li class="heading"><?= __('Actions') ?></li>
        <li><?= $this->Form->postLink(
                __('Delete'),
                ['action' => 'delete', $inventoryVoucher->id],
                ['confirm' => __('Are you sure you want to delete # {0}?', $inventoryVoucher->id)]
            )
        ?></li>
        <li><?= $this->Html->link(__('List Inventory Vouchers'), ['action' => 'index']) ?></li>
        <li><?= $this->Html->link(__('List Invoices'), ['controller' => 'Invoices', 'action' => 'index']) ?></li>
        <li><?= $this->Html->link(__('New Invoice'), ['controller' => 'Invoices', 'action' => 'add']) ?></li>
        <li><?= $this->Html->link(__('List Invoice Rows'), ['controller' => 'InvoiceRows', 'action' => 'index']) ?></li>
        <li><?= $this->Html->link(__('New Invoice Row'), ['controller' => 'InvoiceRows', 'action' => 'add']) ?></li>
        <li><?= $this->Html->link(__('List Inventory Voucher Rows'), ['controller' => 'InventoryVoucherRows', 'action' => 'index']) ?></li>
        <li><?= $this->Html->link(__('New Inventory Voucher Row'), ['controller' => 'InventoryVoucherRows', 'action' => 'add']) ?></li>
    </ul>
</nav>
<div class="inventoryVouchers form large-9 medium-8 columns content">
    <?= $this->Form->create($inventoryVoucher) ?>
    <fieldset>
        <legend><?= __('Edit Inventory Voucher') ?></legend>
        <?php
            echo $this->Form->input('invoice_id', ['options' => $invoices]);
            echo $this->Form->input('invoice_row_id', ['options' => $invoiceRows]);
            echo $this->Form->input('iv1');
            echo $this->Form->input('iv2');
            echo $this->Form->input('iv3');
            echo $this->Form->input('iv4');
        ?>
    </fieldset>
    <?= $this->Form->button(__('Submit')) ?>
    <?= $this->Form->end() ?>
</div>
