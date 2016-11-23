<nav class="large-3 medium-4 columns" id="actions-sidebar">
    <ul class="side-nav">
        <li class="heading"><?= __('Actions') ?></li>
        <li><?= $this->Html->link(__('New Leave Type'), ['action' => 'add']) ?></li>
    </ul>
</nav>
<div class="leaveTypes index large-9 medium-8 columns content">
    <h3><?= __('Leave Types') ?></h3>
    <table cellpadding="0" cellspacing="0">
        <thead>
            <tr>
                <th><?= $this->Paginator->sort('id') ?></th>
                <th><?= $this->Paginator->sort('leave_name') ?></th>
                <th><?= $this->Paginator->sort('maximum_leave_in_month') ?></th>
                <th class="actions"><?= __('Actions') ?></th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($leaveTypes as $leaveType): ?>
            <tr>
                <td><?= $this->Number->format($leaveType->id) ?></td>
                <td><?= h($leaveType->leave_name) ?></td>
                <td><?= $this->Number->format($leaveType->maximum_leave_in_month) ?></td>
                <td class="actions">
                    <?= $this->Html->link(__('View'), ['action' => 'view', $leaveType->id]) ?>
                    <?= $this->Html->link(__('Edit'), ['action' => 'edit', $leaveType->id]) ?>
                    <?= $this->Form->postLink(__('Delete'), ['action' => 'delete', $leaveType->id], ['confirm' => __('Are you sure you want to delete # {0}?', $leaveType->id)]) ?>
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
