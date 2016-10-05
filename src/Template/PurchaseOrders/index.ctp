<nav class="large-3 medium-4 columns" id="actions-sidebar">
    <ul class="side-nav">
        <li class="heading"><?= __('Actions') ?></li>
        <li><?= $this->Html->link(__('New Purchase Order'), ['action' => 'add']) ?></li>
        <li><?= $this->Html->link(__('List Companies'), ['controller' => 'Companies', 'action' => 'index']) ?></li>
        <li><?= $this->Html->link(__('New Company'), ['controller' => 'Companies', 'action' => 'add']) ?></li>
        <li><?= $this->Html->link(__('List Vendors'), ['controller' => 'Vendors', 'action' => 'index']) ?></li>
        <li><?= $this->Html->link(__('New Vendor'), ['controller' => 'Vendors', 'action' => 'add']) ?></li>
        <li><?= $this->Html->link(__('List Grns'), ['controller' => 'Grns', 'action' => 'index']) ?></li>
        <li><?= $this->Html->link(__('New Grn'), ['controller' => 'Grns', 'action' => 'add']) ?></li>
        <li><?= $this->Html->link(__('List Purchase Order Rows'), ['controller' => 'PurchaseOrderRows', 'action' => 'index']) ?></li>
        <li><?= $this->Html->link(__('New Purchase Order Row'), ['controller' => 'PurchaseOrderRows', 'action' => 'add']) ?></li>
    </ul>
</nav>
<div class="purchaseOrders index large-9 medium-8 columns content">
    <h3><?= __('Purchase Orders') ?></h3>
    <table cellpadding="0" cellspacing="0">
        <thead>
            <tr>
                <th><?= $this->Paginator->sort('id') ?></th>
                <th><?= $this->Paginator->sort('company_id') ?></th>
                <th><?= $this->Paginator->sort('vendor_id') ?></th>
                <th><?= $this->Paginator->sort('shipping_method') ?></th>
                <th><?= $this->Paginator->sort('shipping_terms') ?></th>
                <th><?= $this->Paginator->sort('delivery_date') ?></th>
                <th><?= $this->Paginator->sort('total') ?></th>
                <th><?= $this->Paginator->sort('po1') ?></th>
                <th><?= $this->Paginator->sort('po3') ?></th>
                <th><?= $this->Paginator->sort('po4') ?></th>
                <th class="actions"><?= __('Actions') ?></th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($purchaseOrders as $purchaseOrder): ?>
            <tr>
                <td><?= $this->Number->format($purchaseOrder->id) ?></td>
                <td><?= $purchaseOrder->has('company') ? $this->Html->link($purchaseOrder->company->name, ['controller' => 'Companies', 'action' => 'view', $purchaseOrder->company->id]) : '' ?></td>
                <td><?= $purchaseOrder->has('vendor') ? $this->Html->link($purchaseOrder->vendor->name, ['controller' => 'Vendors', 'action' => 'view', $purchaseOrder->vendor->id]) : '' ?></td>
                <td><?= h($purchaseOrder->shipping_method) ?></td>
                <td><?= $this->Number->format($purchaseOrder->shipping_terms) ?></td>
                <td><?= h($purchaseOrder->delivery_date) ?></td>
                <td><?= $this->Number->format($purchaseOrder->total) ?></td>
                <td><?= h($purchaseOrder->po1) ?></td>
                <td><?= h($purchaseOrder->po3) ?></td>
                <td><?= h($purchaseOrder->po4) ?></td>
                <td class="actions">
                    <?= $this->Html->link(__('View'), ['action' => 'view', $purchaseOrder->id]) ?>
                    <?= $this->Html->link(__('Edit'), ['action' => 'edit', $purchaseOrder->id]) ?>
                    <?= $this->Form->postLink(__('Delete'), ['action' => 'delete', $purchaseOrder->id], ['confirm' => __('Are you sure you want to delete # {0}?', $purchaseOrder->id)]) ?>
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
