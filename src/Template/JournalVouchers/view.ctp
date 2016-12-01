<nav class="large-3 medium-4 columns" id="actions-sidebar">
    <ul class="side-nav">
        <li class="heading"><?= __('Actions') ?></li>
        <li><?= $this->Html->link(__('Edit Journal Voucher'), ['action' => 'edit', $journalVoucher->id]) ?> </li>
        <li><?= $this->Form->postLink(__('Delete Journal Voucher'), ['action' => 'delete', $journalVoucher->id], ['confirm' => __('Are you sure you want to delete # {0}?', $journalVoucher->id)]) ?> </li>
        <li><?= $this->Html->link(__('List Journal Vouchers'), ['action' => 'index']) ?> </li>
        <li><?= $this->Html->link(__('New Journal Voucher'), ['action' => 'add']) ?> </li>
        <li><?= $this->Html->link(__('List Companies'), ['controller' => 'Companies', 'action' => 'index']) ?> </li>
        <li><?= $this->Html->link(__('New Company'), ['controller' => 'Companies', 'action' => 'add']) ?> </li>
    </ul>
</nav>
<div class="journalVouchers view large-9 medium-8 columns content">
    <h3><?= h($journalVoucher->id) ?></h3>
    <table class="vertical-table">
        <tr>
            <th><?= __('Payment Mode') ?></th>
            <td><?= h($journalVoucher->payment_mode) ?></td>
        </tr>
        <tr>
            <th><?= __('Company') ?></th>
            <td><?= $journalVoucher->has('company') ? $this->Html->link($journalVoucher->company->name, ['controller' => 'Companies', 'action' => 'view', $journalVoucher->company->id]) : '' ?></td>
        </tr>
        <tr>
            <th><?= __('Id') ?></th>
            <td><?= $this->Number->format($journalVoucher->id) ?></td>
        </tr>
        <tr>
            <th><?= __('Ledger1') ?></th>
            <td><?= $this->Number->format($journalVoucher->ledger1) ?></td>
        </tr>
        <tr>
            <th><?= __('Ledger2') ?></th>
            <td><?= $this->Number->format($journalVoucher->ledger2) ?></td>
        </tr>
        <tr>
            <th><?= __('Amount') ?></th>
            <td><?= $this->Number->format($journalVoucher->amount) ?></td>
        </tr>
        <tr>
            <th><?= __('Created By') ?></th>
            <td><?= $this->Number->format($journalVoucher->created_by) ?></td>
        </tr>
        <tr>
            <th><?= __('Created On') ?></th>
            <td><?= h($journalVoucher->created_on) ?></td>
        </tr>
        <tr>
            <th><?= __('Transaction Date') ?></th>
            <td><?= h($journalVoucher->transaction_date) ?></td>
        </tr>
    </table>
    <div class="row">
        <h4><?= __('Narration') ?></h4>
        <?= $this->Text->autoParagraph(h($journalVoucher->narration)); ?>
    </div>
</div>
