<nav class="large-3 medium-4 columns" id="actions-sidebar">
    <ul class="side-nav">
        <li class="heading"><?= __('Actions') ?></li>
        <li><?= $this->Html->link(__('Edit Receipt'), ['action' => 'edit', $receipt->id]) ?> </li>
        <li><?= $this->Form->postLink(__('Delete Receipt'), ['action' => 'delete', $receipt->id], ['confirm' => __('Are you sure you want to delete # {0}?', $receipt->id)]) ?> </li>
        <li><?= $this->Html->link(__('List Receipts'), ['action' => 'index']) ?> </li>
        <li><?= $this->Html->link(__('New Receipt'), ['action' => 'add']) ?> </li>
        <li><?= $this->Html->link(__('List Companies'), ['controller' => 'Companies', 'action' => 'index']) ?> </li>
        <li><?= $this->Html->link(__('New Company'), ['controller' => 'Companies', 'action' => 'add']) ?> </li>
        <li><?= $this->Html->link(__('List Receipt Rows'), ['controller' => 'ReceiptRows', 'action' => 'index']) ?> </li>
        <li><?= $this->Html->link(__('New Receipt Row'), ['controller' => 'ReceiptRows', 'action' => 'add']) ?> </li>
    </ul>
</nav>
<div class="receipts view large-9 medium-8 columns content">
    <h3><?= h($receipt->id) ?></h3>
    <table class="vertical-table">
        <tr>
            <th><?= __('Payment Mode') ?></th>
            <td><?= h($receipt->payment_mode) ?></td>
        </tr>
        <tr>
            <th><?= __('Company') ?></th>
            <td><?= $receipt->has('company') ? $this->Html->link($receipt->company->name, ['controller' => 'Companies', 'action' => 'view', $receipt->company->id]) : '' ?></td>
        </tr>
        <tr>
            <th><?= __('Cheque No') ?></th>
            <td><?= h($receipt->cheque_no) ?></td>
        </tr>
        <tr>
            <th><?= __('Id') ?></th>
            <td><?= $this->Number->format($receipt->id) ?></td>
        </tr>
        <tr>
            <th><?= __('Voucher No') ?></th>
            <td><?= $this->Number->format($receipt->voucher_no) ?></td>
        </tr>
        <tr>
            <th><?= __('Bank Cash Id') ?></th>
            <td><?= $this->Number->format($receipt->bank_cash_id) ?></td>
        </tr>
        <tr>
            <th><?= __('Created By') ?></th>
            <td><?= $this->Number->format($receipt->created_by) ?></td>
        </tr>
        <tr>
            <th><?= __('Edited By') ?></th>
            <td><?= $this->Number->format($receipt->edited_by) ?></td>
        </tr>
        <tr>
            <th><?= __('Created On') ?></th>
            <td><?= h($receipt->created_on) ?></td>
        </tr>
        <tr>
            <th><?= __('Transaction Date') ?></th>
            <td><?= h($receipt->transaction_date) ?></td>
        </tr>
        <tr>
            <th><?= __('Edited On') ?></th>
            <td><?= h($receipt->edited_on) ?></td>
        </tr>
    </table>
    <div class="related">
        <h4><?= __('Related Receipt Rows') ?></h4>
        <?php if (!empty($receipt->receipt_rows)): ?>
        <table cellpadding="0" cellspacing="0">
            <tr>
                <th><?= __('Id') ?></th>
                <th><?= __('Receipt Id') ?></th>
                <th><?= __('Received From Id') ?></th>
                <th><?= __('Amount') ?></th>
                <th><?= __('Narration') ?></th>
                <th class="actions"><?= __('Actions') ?></th>
            </tr>
            <?php foreach ($receipt->receipt_rows as $receiptRows): ?>
            <tr>
                <td><?= h($receiptRows->id) ?></td>
                <td><?= h($receiptRows->receipt_id) ?></td>
                <td><?= h($receiptRows->received_from_id) ?></td>
                <td><?= h($receiptRows->amount) ?></td>
                <td><?= h($receiptRows->narration) ?></td>
                <td class="actions">
                    <?= $this->Html->link(__('View'), ['controller' => 'ReceiptRows', 'action' => 'view', $receiptRows->id]) ?>
                    <?= $this->Html->link(__('Edit'), ['controller' => 'ReceiptRows', 'action' => 'edit', $receiptRows->id]) ?>
                    <?= $this->Form->postLink(__('Delete'), ['controller' => 'ReceiptRows', 'action' => 'delete', $receiptRows->id], ['confirm' => __('Are you sure you want to delete # {0}?', $receiptRows->id)]) ?>
                </td>
            </tr>
            <?php endforeach; ?>
        </table>
        <?php endif; ?>
    </div>
</div>
