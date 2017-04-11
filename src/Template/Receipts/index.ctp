<nav class="large-3 medium-4 columns" id="actions-sidebar">
    <ul class="side-nav">
        <li class="heading"><?= __('Actions') ?></li>
        <li><?= $this->Html->link(__('New Receipt'), ['action' => 'add']) ?></li>
        <li><?= $this->Html->link(__('List Companies'), ['controller' => 'Companies', 'action' => 'index']) ?></li>
        <li><?= $this->Html->link(__('New Company'), ['controller' => 'Companies', 'action' => 'add']) ?></li>
        <li><?= $this->Html->link(__('List Receipt Rows'), ['controller' => 'ReceiptRows', 'action' => 'index']) ?></li>
        <li><?= $this->Html->link(__('New Receipt Row'), ['controller' => 'ReceiptRows', 'action' => 'add']) ?></li>
    </ul>
</nav>
<div class="receipts index large-9 medium-8 columns content">
    <h3><?= __('Receipts') ?></h3>
    <table cellpadding="0" cellspacing="0">
        <thead>
            <tr>
                <th><?= $this->Paginator->sort('id') ?></th>
                <th><?= $this->Paginator->sort('voucher_no') ?></th>
                <th><?= $this->Paginator->sort('bank_cash_id') ?></th>
                <th><?= $this->Paginator->sort('created_by') ?></th>
                <th><?= $this->Paginator->sort('created_on') ?></th>
                <th><?= $this->Paginator->sort('payment_mode') ?></th>
                <th><?= $this->Paginator->sort('company_id') ?></th>
                <th><?= $this->Paginator->sort('transaction_date') ?></th>
                <th><?= $this->Paginator->sort('edited_by') ?></th>
                <th><?= $this->Paginator->sort('edited_on') ?></th>
                <th><?= $this->Paginator->sort('cheque_no') ?></th>
                <th class="actions"><?= __('Actions') ?></th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($receipts as $receipt): ?>
            <tr>
                <td><?= $this->Number->format($receipt->id) ?></td>
                <td><?= $this->Number->format($receipt->voucher_no) ?></td>
                <td><?= $this->Number->format($receipt->bank_cash_id) ?></td>
                <td><?= $this->Number->format($receipt->created_by) ?></td>
                <td><?= h($receipt->created_on) ?></td>
                <td><?= h($receipt->payment_mode) ?></td>
                <td><?= $receipt->has('company') ? $this->Html->link($receipt->company->name, ['controller' => 'Companies', 'action' => 'view', $receipt->company->id]) : '' ?></td>
                <td><?= h($receipt->transaction_date) ?></td>
                <td><?= $this->Number->format($receipt->edited_by) ?></td>
                <td><?= h($receipt->edited_on) ?></td>
                <td><?= h($receipt->cheque_no) ?></td>
                <td class="actions">
                    <?= $this->Html->link(__('View'), ['action' => 'view', $receipt->id]) ?>
                    <?= $this->Html->link(__('Edit'), ['action' => 'edit', $receipt->id]) ?>
                    <?= $this->Form->postLink(__('Delete'), ['action' => 'delete', $receipt->id], ['confirm' => __('Are you sure you want to delete # {0}?', $receipt->id)]) ?>
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
