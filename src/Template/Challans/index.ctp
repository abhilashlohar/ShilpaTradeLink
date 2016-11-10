<nav class="large-3 medium-4 columns" id="actions-sidebar">
    <ul class="side-nav">
        <li class="heading"><?= __('Actions') ?></li>
        <li><?= $this->Html->link(__('New Challan'), ['action' => 'add']) ?></li>
        <li><?= $this->Html->link(__('List Customers'), ['controller' => 'Customers', 'action' => 'index']) ?></li>
        <li><?= $this->Html->link(__('New Customer'), ['controller' => 'Customers', 'action' => 'add']) ?></li>
        <li><?= $this->Html->link(__('List Companies'), ['controller' => 'Companies', 'action' => 'index']) ?></li>
        <li><?= $this->Html->link(__('New Company'), ['controller' => 'Companies', 'action' => 'add']) ?></li>
        <li><?= $this->Html->link(__('List Invoices'), ['controller' => 'Invoices', 'action' => 'index']) ?></li>
        <li><?= $this->Html->link(__('New Invoice'), ['controller' => 'Invoices', 'action' => 'add']) ?></li>
        <li><?= $this->Html->link(__('List Transporters'), ['controller' => 'Transporters', 'action' => 'index']) ?></li>
        <li><?= $this->Html->link(__('New Transporter'), ['controller' => 'Transporters', 'action' => 'add']) ?></li>
    </ul>
</nav>
<div class="challans index large-9 medium-8 columns content">
    <h3><?= __('Challans') ?></h3>
    <table cellpadding="0" cellspacing="0">
        <thead>
            <tr>
                <th><?= $this->Paginator->sort('id') ?></th>
                <th><?= $this->Paginator->sort('customer_id') ?></th>
                <th><?= $this->Paginator->sort('company_id') ?></th>
                <th><?= $this->Paginator->sort('invoice_id') ?></th>
                <th><?= $this->Paginator->sort('date') ?></th>
                <th><?= $this->Paginator->sort('transporter_id') ?></th>
                <th><?= $this->Paginator->sort('lr_no') ?></th>
                <th><?= $this->Paginator->sort('reference_detail') ?></th>
                <th><?= $this->Paginator->sort('total') ?></th>
                <th><?= $this->Paginator->sort('documents') ?></th>
                <th class="actions"><?= __('Actions') ?></th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($challans as $challan): ?>
            <tr>
                <td><?= $this->Number->format($challan->id) ?></td>
                <td><?= $challan->has('customer') ? $this->Html->link($challan->customer->customer_name, ['controller' => 'Customers', 'action' => 'view', $challan->customer->id]) : '' ?></td>
                <td><?= $challan->has('company') ? $this->Html->link($challan->company->name, ['controller' => 'Companies', 'action' => 'view', $challan->company->id]) : '' ?></td>
                <td><?= $challan->has('invoice') ? $this->Html->link($challan->invoice->id, ['controller' => 'Invoices', 'action' => 'view', $challan->invoice->id]) : '' ?></td>
                <td><?= h($challan->date) ?></td>
                <td><?= $challan->has('transporter') ? $this->Html->link($challan->transporter->transporter_name, ['controller' => 'Transporters', 'action' => 'view', $challan->transporter->id]) : '' ?></td>
                <td><?= $this->Number->format($challan->lr_no) ?></td>
                <td><?= h($challan->reference_detail) ?></td>
                <td><?= $this->Number->format($challan->total) ?></td>
                <td><?= h($challan->documents) ?></td>
                <td class="actions">
                    <?= $this->Html->link(__('View'), ['action' => 'view', $challan->id]) ?>
                    <?= $this->Html->link(__('Edit'), ['action' => 'edit', $challan->id]) ?>
                    <?= $this->Form->postLink(__('Delete'), ['action' => 'delete', $challan->id], ['confirm' => __('Are you sure you want to delete # {0}?', $challan->id)]) ?>
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
