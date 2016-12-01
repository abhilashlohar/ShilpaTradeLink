<nav class="large-3 medium-4 columns" id="actions-sidebar">
    <ul class="side-nav">
        <li class="heading"><?= __('Actions') ?></li>
        <li><?= $this->Html->link(__('New Contra Voucher'), ['action' => 'add']) ?></li>
        <li><?= $this->Html->link(__('List Companies'), ['controller' => 'Companies', 'action' => 'index']) ?></li>
        <li><?= $this->Html->link(__('New Company'), ['controller' => 'Companies', 'action' => 'add']) ?></li>
    </ul>
</nav>
<div class="contraVouchers index large-9 medium-8 columns content">
    <h3><?= __('Contra Vouchers') ?></h3>
    <table cellpadding="0" cellspacing="0">
        <thead>
            <tr>
                <th><?= $this->Paginator->sort('id') ?></th>
                <th><?= $this->Paginator->sort('created_on') ?></th>
                <th><?= $this->Paginator->sort('transaction_date') ?></th>
                <th><?= $this->Paginator->sort('cash_bank_from') ?></th>
                <th><?= $this->Paginator->sort('payment_mode') ?></th>
                <th><?= $this->Paginator->sort('cash_bank_to') ?></th>
                <th><?= $this->Paginator->sort('amount') ?></th>
                <th><?= $this->Paginator->sort('company_id') ?></th>
                <th><?= $this->Paginator->sort('created_by') ?></th>
                <th class="actions"><?= __('Actions') ?></th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($contraVouchers as $contraVoucher): ?>
            <tr>
                <td><?= $this->Number->format($contraVoucher->id) ?></td>
                <td><?= h($contraVoucher->created_on) ?></td>
                <td><?= h($contraVoucher->transaction_date) ?></td>
                <td><?= $this->Number->format($contraVoucher->cash_bank_from) ?></td>
                <td><?= h($contraVoucher->payment_mode) ?></td>
                <td><?= $this->Number->format($contraVoucher->cash_bank_to) ?></td>
                <td><?= $this->Number->format($contraVoucher->amount) ?></td>
                <td><?= $contraVoucher->has('company') ? $this->Html->link($contraVoucher->company->name, ['controller' => 'Companies', 'action' => 'view', $contraVoucher->company->id]) : '' ?></td>
                <td><?= $this->Number->format($contraVoucher->created_by) ?></td>
                <td class="actions">
                    <?= $this->Html->link(__('View'), ['action' => 'view', $contraVoucher->id]) ?>
                    <?= $this->Html->link(__('Edit'), ['action' => 'edit', $contraVoucher->id]) ?>
                    <?= $this->Form->postLink(__('Delete'), ['action' => 'delete', $contraVoucher->id], ['confirm' => __('Are you sure you want to delete # {0}?', $contraVoucher->id)]) ?>
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
