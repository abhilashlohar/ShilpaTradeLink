<nav class="large-3 medium-4 columns" id="actions-sidebar">
    <ul class="side-nav">
        <li class="heading"><?= __('Actions') ?></li>
        <li><?= $this->Html->link(__('Edit Company'), ['action' => 'edit', $company->id]) ?> </li>
        <li><?= $this->Form->postLink(__('Delete Company'), ['action' => 'delete', $company->id], ['confirm' => __('Are you sure you want to delete # {0}?', $company->id)]) ?> </li>
        <li><?= $this->Html->link(__('List Companies'), ['action' => 'index']) ?> </li>
        <li><?= $this->Html->link(__('New Company'), ['action' => 'add']) ?> </li>
        <li><?= $this->Html->link(__('List Item Used By Companies'), ['controller' => 'ItemUsedByCompanies', 'action' => 'index']) ?> </li>
        <li><?= $this->Html->link(__('New Item Used By Company'), ['controller' => 'ItemUsedByCompanies', 'action' => 'add']) ?> </li>
    </ul>
</nav>
<div class="companies view large-9 medium-8 columns content">
    <h3><?= h($company->name) ?></h3>
    <table class="vertical-table">
        <tr>
            <th><?= __('Name') ?></th>
            <td><?= h($company->name) ?></td>
        </tr>
        <tr>
            <th><?= __('Id') ?></th>
            <td><?= $this->Number->format($company->id) ?></td>
        </tr>
    </table>
    <div class="related">
        <h4><?= __('Related Item Used By Companies') ?></h4>
        <?php if (!empty($company->item_used_by_companies)): ?>
        <table cellpadding="0" cellspacing="0">
            <tr>
                <th><?= __('Id') ?></th>
                <th><?= __('Item Id') ?></th>
                <th><?= __('Company Id') ?></th>
                <th class="actions"><?= __('Actions') ?></th>
            </tr>
            <?php foreach ($company->item_used_by_companies as $itemUsedByCompanies): ?>
            <tr>
                <td><?= h($itemUsedByCompanies->id) ?></td>
                <td><?= h($itemUsedByCompanies->item_id) ?></td>
                <td><?= h($itemUsedByCompanies->company_id) ?></td>
                <td class="actions">
                    <?= $this->Html->link(__('View'), ['controller' => 'ItemUsedByCompanies', 'action' => 'view', $itemUsedByCompanies->id]) ?>
                    <?= $this->Html->link(__('Edit'), ['controller' => 'ItemUsedByCompanies', 'action' => 'edit', $itemUsedByCompanies->id]) ?>
                    <?= $this->Form->postLink(__('Delete'), ['controller' => 'ItemUsedByCompanies', 'action' => 'delete', $itemUsedByCompanies->id], ['confirm' => __('Are you sure you want to delete # {0}?', $itemUsedByCompanies->id)]) ?>
                </td>
            </tr>
            <?php endforeach; ?>
        </table>
        <?php endif; ?>
    </div>
</div>
