<nav class="large-3 medium-4 columns" id="actions-sidebar">
    <ul class="side-nav">
        <li class="heading"><?= __('Actions') ?></li>
        <li><?= $this->Html->link(__('New Job Card'), ['action' => 'add']) ?></li>
        <li><?= $this->Html->link(__('List Companies'), ['controller' => 'Companies', 'action' => 'index']) ?></li>
        <li><?= $this->Html->link(__('New Company'), ['controller' => 'Companies', 'action' => 'add']) ?></li>
        <li><?= $this->Html->link(__('List Customers'), ['controller' => 'Customers', 'action' => 'index']) ?></li>
        <li><?= $this->Html->link(__('New Customer'), ['controller' => 'Customers', 'action' => 'add']) ?></li>
        <li><?= $this->Html->link(__('List Sales Orders'), ['controller' => 'SalesOrders', 'action' => 'index']) ?></li>
        <li><?= $this->Html->link(__('New Sales Order'), ['controller' => 'SalesOrders', 'action' => 'add']) ?></li>
        <li><?= $this->Html->link(__('List Job Card Rows'), ['controller' => 'JobCardRows', 'action' => 'index']) ?></li>
        <li><?= $this->Html->link(__('New Job Card Row'), ['controller' => 'JobCardRows', 'action' => 'add']) ?></li>
    </ul>
</nav>
<div class="jobCards index large-9 medium-8 columns content">
    <h3><?= __('Job Cards') ?></h3>
    <table cellpadding="0" cellspacing="0">
        <thead>
            <tr>
                <th><?= $this->Paginator->sort('id') ?></th>
                <th><?= $this->Paginator->sort('company_id') ?></th>
                <th><?= $this->Paginator->sort('customer_id') ?></th>
                <th><?= $this->Paginator->sort('sales_order_id') ?></th>
                <th><?= $this->Paginator->sort('created_by') ?></th>
                <th><?= $this->Paginator->sort('created_on') ?></th>
                <th class="actions"><?= __('Actions') ?></th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($jobCards as $jobCard): ?>
            <tr>
                <td><?= $this->Number->format($jobCard->id) ?></td>
                <td><?= $jobCard->has('company') ? $this->Html->link($jobCard->company->name, ['controller' => 'Companies', 'action' => 'view', $jobCard->company->id]) : '' ?></td>
                <td><?= $jobCard->has('customer') ? $this->Html->link($jobCard->customer->customer_name, ['controller' => 'Customers', 'action' => 'view', $jobCard->customer->id]) : '' ?></td>
                <td><?= $jobCard->has('sales_order') ? $this->Html->link($jobCard->sales_order->id, ['controller' => 'SalesOrders', 'action' => 'view', $jobCard->sales_order->id]) : '' ?></td>
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
