<nav class="large-3 medium-4 columns" id="actions-sidebar">
    <ul class="side-nav">
        <li class="heading"><?= __('Actions') ?></li>
        <li><?= $this->Html->link(__('Edit Contra Voucher'), ['action' => 'edit', $contraVoucher->id]) ?> </li>
        <li><?= $this->Form->postLink(__('Delete Contra Voucher'), ['action' => 'delete', $contraVoucher->id], ['confirm' => __('Are you sure you want to delete # {0}?', $contraVoucher->id)]) ?> </li>
        <li><?= $this->Html->link(__('List Contra Vouchers'), ['action' => 'index']) ?> </li>
        <li><?= $this->Html->link(__('New Contra Voucher'), ['action' => 'add']) ?> </li>
        <li><?= $this->Html->link(__('List Companies'), ['controller' => 'Companies', 'action' => 'index']) ?> </li>
        <li><?= $this->Html->link(__('New Company'), ['controller' => 'Companies', 'action' => 'add']) ?> </li>
    </ul>
</nav>
<div class="contraVouchers view large-9 medium-8 columns content">
    <h3><?= h($contraVoucher->id) ?></h3>
    <table class="vertical-table">
        <tr>
            <th><?= __('Payment Mode') ?></th>
            <td><?= h($contraVoucher->payment_mode) ?></td>
        </tr>
        <tr>
            <th><?= __('Company') ?></th>
            <td><?= $contraVoucher->has('company') ? $this->Html->link($contraVoucher->company->name, ['controller' => 'Companies', 'action' => 'view', $contraVoucher->company->id]) : '' ?></td>
        </tr>
        <tr>
            <th><?= __('Id') ?></th>
            <td><?= $this->Number->format($contraVoucher->id) ?></td>
        </tr>
        <tr>
            <th><?= __('Cash Bank From') ?></th>
            <td><?= $this->Number->format($contraVoucher->cash_bank_from) ?></td>
        </tr>
        <tr>
            <th><?= __('Cash Bank To') ?></th>
            <td><?= $this->Number->format($contraVoucher->cash_bank_to) ?></td>
        </tr>
        <tr>
            <th><?= __('Amount') ?></th>
            <td><?= $this->Number->format($contraVoucher->amount) ?></td>
        </tr>
        <tr>
            <th><?= __('Created By') ?></th>
            <td><?= $this->Number->format($contraVoucher->created_by) ?></td>
        </tr>
        <tr>
            <th><?= __('Created On') ?></th>
            <td><?= h($contraVoucher->created_on) ?></td>
        </tr>
        <tr>
            <th><?= __('Transaction Date') ?></th>
            <td><?= h($contraVoucher->transaction_date) ?></td>
        </tr>
    </table>
    <div class="row">
        <h4><?= __('Narration') ?></h4>
        <?= $this->Text->autoParagraph(h($contraVoucher->narration)); ?>
    </div>
</div>
