<nav class="large-3 medium-4 columns" id="actions-sidebar">
    <ul class="side-nav">
        <li class="heading"><?= __('Actions') ?></li>
        <li><?= $this->Html->link(__('New Journal Voucher'), ['action' => 'add']) ?></li>
        <li><?= $this->Html->link(__('List Companies'), ['controller' => 'Companies', 'action' => 'index']) ?></li>
        <li><?= $this->Html->link(__('New Company'), ['controller' => 'Companies', 'action' => 'add']) ?></li>
    </ul>
</nav>
<div class="journalVouchers index large-9 medium-8 columns content">
    <h3><?= __('Journal Vouchers') ?></h3>
    <table cellpadding="0" cellspacing="0">
        <thead>
            <tr>
                <th><?= $this->Paginator->sort('id') ?></th>
                <th><?= $this->Paginator->sort('created_on') ?></th>
                <th><?= $this->Paginator->sort('transaction_date') ?></th>
                <th><?= $this->Paginator->sort('ledger1') ?></th>
                <th><?= $this->Paginator->sort('payment_mode') ?></th>
                <th><?= $this->Paginator->sort('ledger2') ?></th>
                <th><?= $this->Paginator->sort('amount') ?></th>
                <th><?= $this->Paginator->sort('company_id') ?></th>
                <th><?= $this->Paginator->sort('created_by') ?></th>
                <th class="actions"><?= __('Actions') ?></th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($journalVouchers as $journalVoucher): ?>
            <tr>
                <td><?= $this->Number->format($journalVoucher->id) ?></td>
                <td><?= h($journalVoucher->created_on) ?></td>
                <td><?= h($journalVoucher->transaction_date) ?></td>
                <td><?= $this->Number->format($journalVoucher->ledger1) ?></td>
                <td><?= h($journalVoucher->payment_mode) ?></td>
                <td><?= $this->Number->format($journalVoucher->ledger2) ?></td>
                <td><?= $this->Number->format($journalVoucher->amount) ?></td>
                <td><?= $journalVoucher->has('company') ? $this->Html->link($journalVoucher->company->name, ['controller' => 'Companies', 'action' => 'view', $journalVoucher->company->id]) : '' ?></td>
                <td><?= $this->Number->format($journalVoucher->created_by) ?></td>
                <td class="actions">
                    <?= $this->Html->link(__('View'), ['action' => 'view', $journalVoucher->id]) ?>
                    <?= $this->Html->link(__('Edit'), ['action' => 'edit', $journalVoucher->id]) ?>
                    <?= $this->Form->postLink(__('Delete'), ['action' => 'delete', $journalVoucher->id], ['confirm' => __('Are you sure you want to delete # {0}?', $journalVoucher->id)]) ?>
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
