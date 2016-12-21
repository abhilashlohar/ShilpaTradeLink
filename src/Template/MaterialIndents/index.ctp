
<div class="materialIndents index large-9 medium-8 columns content">
    <h3><?= __('Material Indents') ?></h3>
    <table cellpadding="0" cellspacing="0">
        <thead>
            <tr>
                <th><?= $this->Paginator->sort('id') ?></th>
                <th><?= $this->Paginator->sort('company_id') ?></th>
                <th><?= $this->Paginator->sort('job_card_id') ?></th>
                <th><?= $this->Paginator->sort('required_date') ?></th>
                <th><?= $this->Paginator->sort('created_on') ?></th>
                <th><?= $this->Paginator->sort('created_by') ?></th>
                <th class="actions"><?= __('Actions') ?></th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($materialIndents as $materialIndent): ?>
            <tr>
                <td><?= $this->Number->format($materialIndent->id) ?></td>
                <td><?= $materialIndent->has('company') ? $this->Html->link($materialIndent->company->name, ['controller' => 'Companies', 'action' => 'view', $materialIndent->company->id]) : '' ?></td>
                <td><?= $materialIndent->has('job_card') ? $this->Html->link($materialIndent->job_card->id, ['controller' => 'JobCards', 'action' => 'view', $materialIndent->job_card->id]) : '' ?></td>
                <td><?= h($materialIndent->required_date) ?></td>
                <td><?= h($materialIndent->created_on) ?></td>
                <td><?= $this->Number->format($materialIndent->created_by) ?></td>
                <td class="actions">
                    <?= $this->Html->link(__('View'), ['action' => 'view', $materialIndent->id]) ?>
                    <?= $this->Html->link(__('Edit'), ['action' => 'edit', $materialIndent->id]) ?>
                    <?= $this->Form->postLink(__('Delete'), ['action' => 'delete', $materialIndent->id], ['confirm' => __('Are you sure you want to delete # {0}?', $materialIndent->id)]) ?>
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
