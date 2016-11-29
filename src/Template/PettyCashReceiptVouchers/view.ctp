<nav class="large-3 medium-4 columns" id="actions-sidebar">
    <ul class="side-nav">
        <li class="heading"><?= __('Actions') ?></li>
        <li><?= $this->Html->link(__('Edit Petty Cash Receipt Voucher'), ['action' => 'edit', $pettyCashReceiptVoucher->id]) ?> </li>
        <li><?= $this->Form->postLink(__('Delete Petty Cash Receipt Voucher'), ['action' => 'delete', $pettyCashReceiptVoucher->id], ['confirm' => __('Are you sure you want to delete # {0}?', $pettyCashReceiptVoucher->id)]) ?> </li>
        <li><?= $this->Html->link(__('List Petty Cash Receipt Vouchers'), ['action' => 'index']) ?> </li>
        <li><?= $this->Html->link(__('New Petty Cash Receipt Voucher'), ['action' => 'add']) ?> </li>
    </ul>
</nav>
<div class="pettyCashReceiptVouchers view large-9 medium-8 columns content">
    <h3><?= h($pettyCashReceiptVoucher->id) ?></h3>
    <table class="vertical-table">
        <tr>
            <th><?= __('Id') ?></th>
            <td><?= $this->Number->format($pettyCashReceiptVoucher->id) ?></td>
        </tr>
        <tr>
            <th><?= __('Received From Id') ?></th>
            <td><?= $this->Number->format($pettyCashReceiptVoucher->received_from_id) ?></td>
        </tr>
        <tr>
            <th><?= __('Bank Cash Id') ?></th>
            <td><?= $this->Number->format($pettyCashReceiptVoucher->bank_cash_id) ?></td>
        </tr>
        <tr>
            <th><?= __('Amount') ?></th>
            <td><?= $this->Number->format($pettyCashReceiptVoucher->amount) ?></td>
        </tr>
        <tr>
            <th><?= __('Created By') ?></th>
            <td><?= $this->Number->format($pettyCashReceiptVoucher->created_by) ?></td>
        </tr>
        <tr>
            <th><?= __('Created On') ?></th>
            <td><?= h($pettyCashReceiptVoucher->created_on) ?></td>
        </tr>
    </table>
    <div class="row">
        <h4><?= __('Narration') ?></h4>
        <?= $this->Text->autoParagraph(h($pettyCashReceiptVoucher->narration)); ?>
    </div>
</div>
