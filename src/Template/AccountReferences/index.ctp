<nav class="large-3 medium-4 columns" id="actions-sidebar">
    <ul class="side-nav">
        <li class="heading"><?= __('Actions') ?></li>
        <li><?= $this->Html->link(__('New Account Reference'), ['action' => 'add']) ?></li>
        <li><?= $this->Html->link(__('List Ledger Accounts'), ['controller' => 'LedgerAccounts', 'action' => 'index']) ?></li>
        <li><?= $this->Html->link(__('New Ledger Account'), ['controller' => 'LedgerAccounts', 'action' => 'add']) ?></li>
    </ul>
</nav>
<div class="accountReferences index large-9 medium-8 columns content">
    <h3><?= __('Account References') ?></h3>
    <table cellpadding="0" cellspacing="0">
        <thead>
            <tr>
                <th><?= $this->Paginator->sort('id') ?></th>
                <th><?= $this->Paginator->sort('entity_description') ?></th>
                <th><?= $this->Paginator->sort('ledger_account_id') ?></th>
                <th class="actions"><?= __('Actions') ?></th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($accountReferences as $accountReference): ?>
            <tr>
                <td><?= $this->Number->format($accountReference->id) ?></td>
                <td><?= h($accountReference->entity_description) ?></td>
                <td><?= $accountReference->has('ledger_account') ? $this->Html->link($accountReference->ledger_account->name, ['controller' => 'LedgerAccounts', 'action' => 'view', $accountReference->ledger_account->id]) : '' ?></td>
                <td class="actions">
                    <?= $this->Html->link(__('View'), ['action' => 'view', $accountReference->id]) ?>
                    <?= $this->Html->link(__('Edit'), ['action' => 'edit', $accountReference->id]) ?>
                    <?= $this->Form->postLink(__('Delete'), ['action' => 'delete', $accountReference->id], ['confirm' => __('Are you sure you want to delete # {0}?', $accountReference->id)]) ?>
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
