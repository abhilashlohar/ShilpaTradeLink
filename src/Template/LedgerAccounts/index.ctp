
<div class="ledgerAccounts index large-9 medium-8 columns content">
    <h3><?= __('Ledger Accounts') ?></h3>
    <table cellpadding="0" cellspacing="0">
        <thead>
            <tr>
                <th><?= $this->Paginator->sort('id') ?></th>
                <th><?= $this->Paginator->sort('account_second_subgroup_id') ?></th>
                <th><?= $this->Paginator->sort('name') ?></th>
                <th><?= $this->Paginator->sort('source_model') ?></th>
                <th><?= $this->Paginator->sort('source_id') ?></th>
                <th class="actions"><?= __('Actions') ?></th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($ledgerAccounts as $ledgerAccount): ?>
            <tr>
                <td><?= $this->Number->format($ledgerAccount->id) ?></td>
                <td><?= $ledgerAccount->has('account_second_subgroup') ? $this->Html->link($ledgerAccount->account_second_subgroup->name, ['controller' => 'AccountSecondSubgroups', 'action' => 'view', $ledgerAccount->account_second_subgroup->id]) : '' ?></td>
                <td><?= h($ledgerAccount->name) ?></td>
                <td><?= h($ledgerAccount->source_model) ?></td>
                <td><?= $ledgerAccount->has('source') ? $this->Html->link($ledgerAccount->source->name, ['controller' => 'Sources', 'action' => 'view', $ledgerAccount->source->id]) : '' ?></td>
                <td class="actions">
                    <?= $this->Html->link(__('View'), ['action' => 'view', $ledgerAccount->id]) ?>
                    <?= $this->Html->link(__('Edit'), ['action' => 'edit', $ledgerAccount->id]) ?>
                    <?= $this->Form->postLink(__('Delete'), ['action' => 'delete', $ledgerAccount->id], ['confirm' => __('Are you sure you want to delete # {0}?', $ledgerAccount->id)]) ?>
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
