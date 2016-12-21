
<div class="jobCards index large-9 medium-8 columns content">
    <h3><?= __('Job Cards') ?></h3>
    <table cellpadding="0" cellspacing="0">
        <thead>
            <tr>
                <th><?= $this->Paginator->sort('id') ?></th>
                <th><?= $this->Paginator->sort('sales_order_id') ?></th>
                <th><?= $this->Paginator->sort('company_id') ?></th>
                <th><?= $this->Paginator->sort('created_by') ?></th>
                <th><?= $this->Paginator->sort('created_on') ?></th>
                <th class="actions"><?= __('Actions') ?></th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($jobCards as $jobCard): ?>
            <tr>
                <td><?= $this->Number->format($jobCard->id) ?></td>
                <td><?= $jobCard->has('sales_order') ? $this->Html->link($jobCard->sales_order->id, ['controller' => 'SalesOrders', 'action' => 'view', $jobCard->sales_order->id]) : '' ?></td>
                <td><?= $jobCard->has('company') ? $this->Html->link($jobCard->company->name, ['controller' => 'Companies', 'action' => 'view', $jobCard->company->id]) : '' ?></td>
                <td><?= $this->Number->format($jobCard->created_by) ?></td>
                <td><?= h($jobCard->created_on) ?></td>
                <td class="actions">
                    <?= $this->Html->link(__('View'), ['action' => 'view', $jobCard->id]) ?>
                    <?= $this->Html->link(__('Edit'), ['action' => 'edit', $jobCard->id]) ?>
                    <?= $this->Form->postLink(__('Delete'), ['action' => 'delete', $jobCard->id], ['confirm' => __('Are you sure you want to delete # {0}?', $jobCard->id)]) ?>
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
