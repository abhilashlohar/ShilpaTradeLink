<nav class="large-3 medium-4 columns" id="actions-sidebar">
    <ul class="side-nav">
        <li class="heading"><?= __('Actions') ?></li>
        <li><?= $this->Html->link(__('Edit Receipt Voucher'), ['action' => 'edit', $receiptVoucher->id]) ?> </li>
        <li><?= $this->Form->postLink(__('Delete Receipt Voucher'), ['action' => 'delete', $receiptVoucher->id], ['confirm' => __('Are you sure you want to delete # {0}?', $receiptVoucher->id)]) ?> </li>
        <li><?= $this->Html->link(__('List Receipt Vouchers'), ['action' => 'index']) ?> </li>
        <li><?= $this->Html->link(__('New Receipt Voucher'), ['action' => 'add']) ?> </li>
    </ul>
</nav>
<div class="receiptVouchers view large-9 medium-8 columns content">
    <h3><?= h($receiptVoucher->id) ?></h3>
    <table class="vertical-table">
        <tr>
            <th><?= __('Id') ?></th>
            <td><?= $this->Number->format($receiptVoucher->id) ?></td>
        </tr>
        <tr>
            <th><?= __('Received From Id') ?></th>
            <td><?= $this->Number->format($receiptVoucher->received_from_id) ?></td>
        </tr>
        <tr>
            <th><?= __('Bank Cash Id') ?></th>
            <td><?= $this->Number->format($receiptVoucher->bank_cash_id) ?></td>
        </tr>
        <tr>
            <th><?= __('Amount') ?></th>
            <td><?= $this->Number->format($receiptVoucher->amount) ?></td>
        </tr>
        <tr>
            <th><?= __('Created By') ?></th>
            <td><?= $this->Number->format($receiptVoucher->created_by) ?></td>
        </tr>
        <tr>
            <th><?= __('Created On') ?></th>
            <td><?= h($receiptVoucher->created_on) ?></td>
        </tr>
    </table>
    <div class="row">
        <h4><?= __('Narration') ?></h4>
        <?= $this->Text->autoParagraph(h($receiptVoucher->narration)); ?>
    </div>
</div>
