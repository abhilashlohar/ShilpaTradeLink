<nav class="large-3 medium-4 columns" id="actions-sidebar">
    <ul class="side-nav">
        <li class="heading"><?= __('Actions') ?></li>
        <li><?= $this->Html->link(__('New Payment Voucher'), ['action' => 'add']) ?></li>
    </ul>
</nav>
<div class="paymentVouchers index large-9 medium-8 columns content">
    <h3><?= __('Payment Vouchers') ?></h3>
    <table cellpadding="0" cellspacing="0">
        <thead>
            <tr>
                <th><?= $this->Paginator->sort('id') ?></th>
                <th><?= $this->Paginator->sort('created_on') ?></th>
                <th><?= $this->Paginator->sort('paid_to') ?></th>
                <th><?= $this->Paginator->sort('payment_mode') ?></th>
                <th><?= $this->Paginator->sort('cash_bank_account') ?></th>
                <th class="actions"><?= __('Actions') ?></th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($paymentVouchers as $paymentVoucher): ?>
            <tr>
                <td><?= $this->Number->format($paymentVoucher->id) ?></td>
                <td><?= h($paymentVoucher->created_on) ?></td>
                <td><?= $this->Number->format($paymentVoucher->paid_to) ?></td>
                <td><?= h($paymentVoucher->payment_mode) ?></td>
                <td><?= $this->Number->format($paymentVoucher->cash_bank_account) ?></td>
                <td class="actions">
                    <?= $this->Html->link(__('View'), ['action' => 'view', $paymentVoucher->id]) ?>
                    <?= $this->Html->link(__('Edit'), ['action' => 'edit', $paymentVoucher->id]) ?>
                    <?= $this->Form->postLink(__('Delete'), ['action' => 'delete', $paymentVoucher->id], ['confirm' => __('Are you sure you want to delete # {0}?', $paymentVoucher->id)]) ?>
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
