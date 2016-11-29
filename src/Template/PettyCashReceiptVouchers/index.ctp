<nav class="large-3 medium-4 columns" id="actions-sidebar">
    <ul class="side-nav">
        <li class="heading"><?= __('Actions') ?></li>
        <li><?= $this->Html->link(__('New Petty Cash Receipt Voucher'), ['action' => 'add']) ?></li>
    </ul>
</nav>
<div class="pettyCashReceiptVouchers index large-9 medium-8 columns content">
    <h3><?= __('Petty Cash Receipt Vouchers') ?></h3>
    <table cellpadding="0" cellspacing="0">
        <thead>
            <tr>
                <th><?= $this->Paginator->sort('id') ?></th>
                <th><?= $this->Paginator->sort('received_from_id') ?></th>
                <th><?= $this->Paginator->sort('bank_cash_id') ?></th>
                <th><?= $this->Paginator->sort('amount') ?></th>
                <th><?= $this->Paginator->sort('created_by') ?></th>
                <th><?= $this->Paginator->sort('created_on') ?></th>
                <th class="actions"><?= __('Actions') ?></th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($pettyCashReceiptVouchers as $pettyCashReceiptVoucher): ?>
            <tr>
                <td><?= $this->Number->format($pettyCashReceiptVoucher->id) ?></td>
                <td><?= $this->Number->format($pettyCashReceiptVoucher->received_from_id) ?></td>
                <td><?= $this->Number->format($pettyCashReceiptVoucher->bank_cash_id) ?></td>
                <td><?= $this->Number->format($pettyCashReceiptVoucher->amount) ?></td>
                <td><?= $this->Number->format($pettyCashReceiptVoucher->created_by) ?></td>
                <td><?= h($pettyCashReceiptVoucher->created_on) ?></td>
                <td class="actions">
                    <?= $this->Html->link(__('View'), ['action' => 'view', $pettyCashReceiptVoucher->id]) ?>
                    <?= $this->Html->link(__('Edit'), ['action' => 'edit', $pettyCashReceiptVoucher->id]) ?>
                    <?= $this->Form->postLink(__('Delete'), ['action' => 'delete', $pettyCashReceiptVoucher->id], ['confirm' => __('Are you sure you want to delete # {0}?', $pettyCashReceiptVoucher->id)]) ?>
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
