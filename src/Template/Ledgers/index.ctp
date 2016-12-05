<nav class="large-3 medium-4 columns" id="actions-sidebar">
    <ul class="side-nav">
        <li class="heading"><?= __('Actions') ?></li>
        <li><?= $this->Html->link(__('New Ledger'), ['action' => 'add']) ?></li>
        <li><?= $this->Html->link(__('List Ledger Accounts'), ['controller' => 'LedgerAccounts', 'action' => 'index']) ?></li>
        <li><?= $this->Html->link(__('New Ledger Account'), ['controller' => 'LedgerAccounts', 'action' => 'add']) ?></li>
    </ul>
</nav>
<div class="ledgers index large-9 medium-8 columns content">
    <h3><?= __('Ledgers') ?></h3>
    <table cellpadding="0" cellspacing="0">
        <thead>
            <tr>
                <th><?= $this->Paginator->sort('id') ?></th>
                <th><?= $this->Paginator->sort('ledger_account_id') ?></th>
                <th><?= $this->Paginator->sort('debit') ?></th>
                <th><?= $this->Paginator->sort('credit') ?></th>
                <th><?= $this->Paginator->sort('voucher_id') ?></th>
                <th><?= $this->Paginator->sort('voucher_source') ?></th>
                <th class="actions"><?= __('Actions') ?></th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($ledgers as $ledger): ?>
            <tr>
                <td><?= $this->Number->format($ledger->id) ?></td>
                <td><?= $ledger->has('ledger_account') ? $this->Html->link($ledger->ledger_account->name, ['controller' => 'LedgerAccounts', 'action' => 'view', $ledger->ledger_account->id]) : '' ?></td>
                <td><?= $this->Number->format($ledger->debit) ?></td>
                <td><?= $this->Number->format($ledger->credit) ?></td>
                <td><?= $this->Number->format($ledger->voucher_id) ?></td>
                <td><?= h($ledger->voucher_source) ?></td>
                <td class="actions">
                    <?= $this->Html->link(__('View'), ['action' => 'view', $ledger->id]) ?>
                    <?= $this->Html->link(__('Edit'), ['action' => 'edit', $ledger->id]) ?>
                    <?= $this->Form->postLink(__('Delete'), ['action' => 'delete', $ledger->id], ['confirm' => __('Are you sure you want to delete # {0}?', $ledger->id)]) ?>
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
