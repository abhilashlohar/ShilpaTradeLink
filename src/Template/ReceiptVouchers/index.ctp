<nav class="large-3 medium-4 columns" id="actions-sidebar">
    <ul class="side-nav">
        <li class="heading"><?= __('Actions') ?></li>
        <li><?= $this->Html->link(__('New Receipt Voucher'), ['action' => 'add']) ?></li>
    </ul>
</nav>
<div class="receiptVouchers index large-9 medium-8 columns content">
    <h3><?= __('Receipt Vouchers') ?></h3>
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
            <?php foreach ($receiptVouchers as $receiptVoucher): ?>
            <tr>
                <td><?= $this->Number->format($receiptVoucher->id) ?></td>
                <td><?= $this->Number->format($receiptVoucher->received_from_id) ?></td>
                <td><?= $this->Number->format($receiptVoucher->bank_cash_id) ?></td>
                <td><?= $this->Number->format($receiptVoucher->amount) ?></td>
                <td><?= $this->Number->format($receiptVoucher->created_by) ?></td>
                <td><?= h($receiptVoucher->created_on) ?></td>
                <td class="actions">
                    <?= $this->Html->link(__('View'), ['action' => 'view', $receiptVoucher->id]) ?>
                    <?= $this->Html->link(__('Edit'), ['action' => 'edit', $receiptVoucher->id]) ?>
                    <?= $this->Form->postLink(__('Delete'), ['action' => 'delete', $receiptVoucher->id], ['confirm' => __('Are you sure you want to delete # {0}?', $receiptVoucher->id)]) ?>
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
