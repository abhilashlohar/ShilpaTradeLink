<nav class="large-3 medium-4 columns" id="actions-sidebar">
    <ul class="side-nav">
        <li class="heading"><?= __('Actions') ?></li>
        <li><?= $this->Html->link(__('Edit Payment Voucher'), ['action' => 'edit', $paymentVoucher->id]) ?> </li>
        <li><?= $this->Form->postLink(__('Delete Payment Voucher'), ['action' => 'delete', $paymentVoucher->id], ['confirm' => __('Are you sure you want to delete # {0}?', $paymentVoucher->id)]) ?> </li>
        <li><?= $this->Html->link(__('List Payment Vouchers'), ['action' => 'index']) ?> </li>
        <li><?= $this->Html->link(__('New Payment Voucher'), ['action' => 'add']) ?> </li>
    </ul>
</nav>
<div class="paymentVouchers view large-9 medium-8 columns content">
    <h3><?= h($paymentVoucher->id) ?></h3>
    <table class="vertical-table">
        <tr>
            <th><?= __('Payment Mode') ?></th>
            <td><?= h($paymentVoucher->payment_mode) ?></td>
        </tr>
        <tr>
            <th><?= __('Id') ?></th>
            <td><?= $this->Number->format($paymentVoucher->id) ?></td>
        </tr>
        <tr>
            <th><?= __('Paid To') ?></th>
            <td><?= $this->Number->format($paymentVoucher->paid_to) ?></td>
        </tr>
        <tr>
            <th><?= __('Cash Bank Account') ?></th>
            <td><?= $this->Number->format($paymentVoucher->cash_bank_account) ?></td>
        </tr>
        <tr>
            <th><?= __('Created On') ?></th>
            <td><?= h($paymentVoucher->created_on) ?></td>
        </tr>
        <tr>
            <th><?= __('Voucher Date') ?></th>
            <td><?= h($paymentVoucher->voucher_date) ?></td>
        </tr>
    </table>
    <div class="row">
        <h4><?= __('Narration') ?></h4>
        <?= $this->Text->autoParagraph(h($paymentVoucher->narration)); ?>
    </div>
</div>
