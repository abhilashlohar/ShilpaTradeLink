<nav class="large-3 medium-4 columns" id="actions-sidebar">
    <ul class="side-nav">
        <li class="heading"><?= __('Actions') ?></li>
        <li><?= $this->Html->link(__('Edit Receipt Effect'), ['action' => 'edit', $receiptEffect->id]) ?> </li>
        <li><?= $this->Form->postLink(__('Delete Receipt Effect'), ['action' => 'delete', $receiptEffect->id], ['confirm' => __('Are you sure you want to delete # {0}?', $receiptEffect->id)]) ?> </li>
        <li><?= $this->Html->link(__('List Receipt Effects'), ['action' => 'index']) ?> </li>
        <li><?= $this->Html->link(__('New Receipt Effect'), ['action' => 'add']) ?> </li>
        <li><?= $this->Html->link(__('List Receipt Vouchers'), ['controller' => 'ReceiptVouchers', 'action' => 'index']) ?> </li>
        <li><?= $this->Html->link(__('New Receipt Voucher'), ['controller' => 'ReceiptVouchers', 'action' => 'add']) ?> </li>
        <li><?= $this->Html->link(__('List Invoices'), ['controller' => 'Invoices', 'action' => 'index']) ?> </li>
        <li><?= $this->Html->link(__('New Invoice'), ['controller' => 'Invoices', 'action' => 'add']) ?> </li>
    </ul>
</nav>
<div class="receiptEffects view large-9 medium-8 columns content">
    <h3><?= h($receiptEffect->id) ?></h3>
    <table class="vertical-table">
        <tr>
            <th><?= __('Receipt Voucher') ?></th>
            <td><?= $receiptEffect->has('receipt_voucher') ? $this->Html->link($receiptEffect->receipt_voucher->id, ['controller' => 'ReceiptVouchers', 'action' => 'view', $receiptEffect->receipt_voucher->id]) : '' ?></td>
        </tr>
        <tr>
            <th><?= __('Invoice') ?></th>
            <td><?= $receiptEffect->has('invoice') ? $this->Html->link($receiptEffect->invoice->id, ['controller' => 'Invoices', 'action' => 'view', $receiptEffect->invoice->id]) : '' ?></td>
        </tr>
        <tr>
            <th><?= __('Id') ?></th>
            <td><?= $this->Number->format($receiptEffect->id) ?></td>
        </tr>
        <tr>
            <th><?= __('Amount') ?></th>
            <td><?= $this->Number->format($receiptEffect->amount) ?></td>
        </tr>
    </table>
</div>
