<nav class="large-3 medium-4 columns" id="actions-sidebar">
    <ul class="side-nav">
        <li class="heading"><?= __('Actions') ?></li>
        <li><?= $this->Html->link(__('Edit Credit Note'), ['action' => 'edit', $creditNote->id]) ?> </li>
        <li><?= $this->Form->postLink(__('Delete Credit Note'), ['action' => 'delete', $creditNote->id], ['confirm' => __('Are you sure you want to delete # {0}?', $creditNote->id)]) ?> </li>
        <li><?= $this->Html->link(__('List Credit Notes'), ['action' => 'index']) ?> </li>
        <li><?= $this->Html->link(__('New Credit Note'), ['action' => 'add']) ?> </li>
        <li><?= $this->Html->link(__('List Companies'), ['controller' => 'Companies', 'action' => 'index']) ?> </li>
        <li><?= $this->Html->link(__('New Company'), ['controller' => 'Companies', 'action' => 'add']) ?> </li>
    </ul>
</nav>
<div class="creditNotes view large-9 medium-8 columns content">
    <h3><?= h($creditNote->id) ?></h3>
    <table class="vertical-table">
        <tr>
            <th><?= __('Payment Mode') ?></th>
            <td><?= h($creditNote->payment_mode) ?></td>
        </tr>
        <tr>
            <th><?= __('Company') ?></th>
            <td><?= $creditNote->has('company') ? $this->Html->link($creditNote->company->name, ['controller' => 'Companies', 'action' => 'view', $creditNote->company->id]) : '' ?></td>
        </tr>
        <tr>
            <th><?= __('Id') ?></th>
            <td><?= $this->Number->format($creditNote->id) ?></td>
        </tr>
        <tr>
            <th><?= __('Sales Acc Id') ?></th>
            <td><?= $this->Number->format($creditNote->sales_acc_id) ?></td>
        </tr>
        <tr>
            <th><?= __('Party Id') ?></th>
            <td><?= $this->Number->format($creditNote->party_id) ?></td>
        </tr>
        <tr>
            <th><?= __('Amount') ?></th>
            <td><?= $this->Number->format($creditNote->amount) ?></td>
        </tr>
        <tr>
            <th><?= __('Created By') ?></th>
            <td><?= $this->Number->format($creditNote->created_by) ?></td>
        </tr>
        <tr>
            <th><?= __('Created On') ?></th>
            <td><?= h($creditNote->created_on) ?></td>
        </tr>
        <tr>
            <th><?= __('Transaction Date') ?></th>
            <td><?= h($creditNote->transaction_date) ?></td>
        </tr>
    </table>
    <div class="row">
        <h4><?= __('Narration') ?></h4>
        <?= $this->Text->autoParagraph(h($creditNote->narration)); ?>
    </div>
</div>
