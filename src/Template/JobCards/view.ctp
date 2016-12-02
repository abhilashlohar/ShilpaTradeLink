<nav class="large-3 medium-4 columns" id="actions-sidebar">
    <ul class="side-nav">
        <li class="heading"><?= __('Actions') ?></li>
        <li><?= $this->Html->link(__('Edit Job Card'), ['action' => 'edit', $jobCard->id]) ?> </li>
        <li><?= $this->Form->postLink(__('Delete Job Card'), ['action' => 'delete', $jobCard->id], ['confirm' => __('Are you sure you want to delete # {0}?', $jobCard->id)]) ?> </li>
        <li><?= $this->Html->link(__('List Job Cards'), ['action' => 'index']) ?> </li>
        <li><?= $this->Html->link(__('New Job Card'), ['action' => 'add']) ?> </li>
        <li><?= $this->Html->link(__('List Companies'), ['controller' => 'Companies', 'action' => 'index']) ?> </li>
        <li><?= $this->Html->link(__('New Company'), ['controller' => 'Companies', 'action' => 'add']) ?> </li>
        <li><?= $this->Html->link(__('List Customers'), ['controller' => 'Customers', 'action' => 'index']) ?> </li>
        <li><?= $this->Html->link(__('New Customer'), ['controller' => 'Customers', 'action' => 'add']) ?> </li>
        <li><?= $this->Html->link(__('List Sales Orders'), ['controller' => 'SalesOrders', 'action' => 'index']) ?> </li>
        <li><?= $this->Html->link(__('New Sales Order'), ['controller' => 'SalesOrders', 'action' => 'add']) ?> </li>
        <li><?= $this->Html->link(__('List Job Card Rows'), ['controller' => 'JobCardRows', 'action' => 'index']) ?> </li>
        <li><?= $this->Html->link(__('New Job Card Row'), ['controller' => 'JobCardRows', 'action' => 'add']) ?> </li>
    </ul>
</nav>
<div class="jobCards view large-9 medium-8 columns content">
    <h3><?= h($jobCard->id) ?></h3>
    <table class="vertical-table">
        <tr>
            <th><?= __('Company') ?></th>
            <td><?= $jobCard->has('company') ? $this->Html->link($jobCard->company->name, ['controller' => 'Companies', 'action' => 'view', $jobCard->company->id]) : '' ?></td>
        </tr>
        <tr>
            <th><?= __('Customer') ?></th>
            <td><?= $jobCard->has('customer') ? $this->Html->link($jobCard->customer->customer_name, ['controller' => 'Customers', 'action' => 'view', $jobCard->customer->id]) : '' ?></td>
        </tr>
        <tr>
            <th><?= __('Sales Order') ?></th>
            <td><?= $jobCard->has('sales_order') ? $this->Html->link($jobCard->sales_order->id, ['controller' => 'SalesOrders', 'action' => 'view', $jobCard->sales_order->id]) : '' ?></td>
        </tr>
        <tr>
            <th><?= __('Id') ?></th>
            <td><?= $this->Number->format($jobCard->id) ?></td>
        </tr>
        <tr>
            <th><?= __('Created By') ?></th>
            <td><?= $this->Number->format($jobCard->created_by) ?></td>
        </tr>
        <tr>
            <th><?= __('Created On') ?></th>
            <td><?= h($jobCard->created_on) ?></td>
        </tr>
    </table>
    <div class="related">
        <h4><?= __('Related Job Card Rows') ?></h4>
        <?php if (!empty($jobCard->job_card_rows)): ?>
        <table cellpadding="0" cellspacing="0">
            <tr>
                <th><?= __('Id') ?></th>
                <th><?= __('Job Card Id') ?></th>
                <th><?= __('Sales Order Row Id') ?></th>
                <th><?= __('Item Id') ?></th>
                <th><?= __('Quantity') ?></th>
                <th class="actions"><?= __('Actions') ?></th>
            </tr>
            <?php foreach ($jobCard->job_card_rows as $jobCardRows): ?>
            <tr>
                <td><?= h($jobCardRows->id) ?></td>
                <td><?= h($jobCardRows->job_card_id) ?></td>
                <td><?= h($jobCardRows->sales_order_row_id) ?></td>
                <td><?= h($jobCardRows->item_id) ?></td>
                <td><?= h($jobCardRows->quantity) ?></td>
                <td class="actions">
                    <?= $this->Html->link(__('View'), ['controller' => 'JobCardRows', 'action' => 'view', $jobCardRows->id]) ?>
                    <?= $this->Html->link(__('Edit'), ['controller' => 'JobCardRows', 'action' => 'edit', $jobCardRows->id]) ?>
                    <?= $this->Form->postLink(__('Delete'), ['controller' => 'JobCardRows', 'action' => 'delete', $jobCardRows->id], ['confirm' => __('Are you sure you want to delete # {0}?', $jobCardRows->id)]) ?>
                </td>
            </tr>
            <?php endforeach; ?>
        </table>
        <?php endif; ?>
    </div>
</div>
