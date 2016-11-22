<nav class="large-3 medium-4 columns" id="actions-sidebar">
    <ul class="side-nav">
        <li class="heading"><?= __('Actions') ?></li>
        <li><?= $this->Html->link(__('New Vouchers Reference'), ['action' => 'add']) ?></li>
        <li><?= $this->Html->link(__('List Vouchers References Groups'), ['controller' => 'VouchersReferencesGroups', 'action' => 'index']) ?></li>
        <li><?= $this->Html->link(__('New Vouchers References Group'), ['controller' => 'VouchersReferencesGroups', 'action' => 'add']) ?></li>
    </ul>
</nav>
<div class="vouchersReferences index large-9 medium-8 columns content">
    <h3><?= __('Vouchers References') ?></h3>
    <table cellpadding="0" cellspacing="0">
        <thead>
            <tr>
                <th><?= $this->Paginator->sort('id') ?></th>
                <th><?= $this->Paginator->sort('voucher_entity') ?></th>
                <th class="actions"><?= __('Actions') ?></th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($vouchersReferences as $vouchersReference): ?>
            <tr>
                <td><?= $this->Number->format($vouchersReference->id) ?></td>
                <td><?= h($vouchersReference->voucher_entity) ?></td>
                <td class="actions">
                    <?= $this->Html->link(__('View'), ['action' => 'view', $vouchersReference->id]) ?>
                    <?= $this->Html->link(__('Edit'), ['action' => 'edit', $vouchersReference->id]) ?>
                    <?= $this->Form->postLink(__('Delete'), ['action' => 'delete', $vouchersReference->id], ['confirm' => __('Are you sure you want to delete # {0}?', $vouchersReference->id)]) ?>
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
