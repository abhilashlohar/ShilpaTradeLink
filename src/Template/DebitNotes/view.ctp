<nav class="large-3 medium-4 columns" id="actions-sidebar">
    <ul class="side-nav">
        <li class="heading"><?= __('Actions') ?></li>
        <li><?= $this->Html->link(__('Edit Debit Note'), ['action' => 'edit', $debitNote->id]) ?> </li>
        <li><?= $this->Form->postLink(__('Delete Debit Note'), ['action' => 'delete', $debitNote->id], ['confirm' => __('Are you sure you want to delete # {0}?', $debitNote->id)]) ?> </li>
        <li><?= $this->Html->link(__('List Debit Notes'), ['action' => 'index']) ?> </li>
        <li><?= $this->Html->link(__('New Debit Note'), ['action' => 'add']) ?> </li>
        <li><?= $this->Html->link(__('List Companies'), ['controller' => 'Companies', 'action' => 'index']) ?> </li>
        <li><?= $this->Html->link(__('New Company'), ['controller' => 'Companies', 'action' => 'add']) ?> </li>
    </ul>
</nav>
<div class="debitNotes view large-9 medium-8 columns content">
    <h3><?= h($debitNote->id) ?></h3>
    <table class="vertical-table">
        <tr>
            <th><?= __('Payment Mode') ?></th>
            <td><?= h($debitNote->payment_mode) ?></td>
        </tr>
        <tr>
            <th><?= __('Company') ?></th>
            <td><?= $debitNote->has('company') ? $this->Html->link($debitNote->company->name, ['controller' => 'Companies', 'action' => 'view', $debitNote->company->id]) : '' ?></td>
        </tr>
        <tr>
            <th><?= __('Id') ?></th>
            <td><?= $this->Number->format($debitNote->id) ?></td>
        </tr>
        <tr>
            <th><?= __('Purchase Acc Id') ?></th>
            <td><?= $this->Number->format($debitNote->purchase_acc_id) ?></td>
        </tr>
        <tr>
            <th><?= __('Party Id') ?></th>
            <td><?= $this->Number->format($debitNote->party_id) ?></td>
        </tr>
        <tr>
            <th><?= __('Amount') ?></th>
            <td><?= $this->Number->format($debitNote->amount) ?></td>
        </tr>
        <tr>
            <th><?= __('Created By') ?></th>
            <td><?= $this->Number->format($debitNote->created_by) ?></td>
        </tr>
        <tr>
            <th><?= __('Created On') ?></th>
            <td><?= h($debitNote->created_on) ?></td>
        </tr>
        <tr>
            <th><?= __('Transaction Date') ?></th>
            <td><?= h($debitNote->transaction_date) ?></td>
        </tr>
    </table>
    <div class="row">
        <h4><?= __('Narration') ?></h4>
        <?= $this->Text->autoParagraph(h($debitNote->narration)); ?>
    </div>
</div>
