<nav class="large-3 medium-4 columns" id="actions-sidebar">
    <ul class="side-nav">
        <li class="heading"><?= __('Actions') ?></li>
        <li><?= $this->Html->link(__('New Receipt Effect'), ['action' => 'add']) ?></li>
        <li><?= $this->Html->link(__('List Receipt Vouchers'), ['controller' => 'ReceiptVouchers', 'action' => 'index']) ?></li>
        <li><?= $this->Html->link(__('New Receipt Voucher'), ['controller' => 'ReceiptVouchers', 'action' => 'add']) ?></li>
        <li><?= $this->Html->link(__('List Invoices'), ['controller' => 'Invoices', 'action' => 'index']) ?></li>
        <li><?= $this->Html->link(__('New Invoice'), ['controller' => 'Invoices', 'action' => 'add']) ?></li>
    </ul>
</nav>
<div class="receiptEffects index large-9 medium-8 columns content">
    <h3><?= __('Receipt Effects') ?></h3>
    <table cellpadding="0" cellspacing="0">
        <thead>
            <tr>
                <th><?= $this->Paginator->sort('id') ?></th>
                <th><?= $this->Paginator->sort('receipt_voucher_id') ?></th>
                <th><?= $this->Paginator->sort('invoice_id') ?></th>
                <th><?= $this->Paginator->sort('amount') ?></th>
                <th class="actions"><?= __('Actions') ?></th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($receiptEffects as $receiptEffect): ?>
            <tr>
                <td><?= $this->Number->format($receiptEffect->id) ?></td>
                <td><?= $receiptEffect->has('receipt_voucher') ? $this->Html->link($receiptEffect->receipt_voucher->id, ['controller' => 'ReceiptVouchers', 'action' => 'view', $receiptEffect->receipt_voucher->id]) : '' ?></td>
                <td><?= $receiptEffect->has('invoice') ? $this->Html->link($receiptEffect->invoice->id, ['controller' => 'Invoices', 'action' => 'view', $receiptEffect->invoice->id]) : '' ?></td>
                <td><?= $this->Number->format($receiptEffect->amount) ?></td>
                <td class="actions">
                    <?= $this->Html->link(__('View'), ['action' => 'view', $receiptEffect->id]) ?>
                    <?= $this->Html->link(__('Edit'), ['action' => 'edit', $receiptEffect->id]) ?>
                    <?= $this->Form->postLink(__('Delete'), ['action' => 'delete', $receiptEffect->id], ['confirm' => __('Are you sure you want to delete # {0}?', $receiptEffect->id)]) ?>
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
