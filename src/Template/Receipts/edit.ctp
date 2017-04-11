<nav class="large-3 medium-4 columns" id="actions-sidebar">
    <ul class="side-nav">
        <li class="heading"><?= __('Actions') ?></li>
        <li><?= $this->Form->postLink(
                __('Delete'),
                ['action' => 'delete', $receipt->id],
                ['confirm' => __('Are you sure you want to delete # {0}?', $receipt->id)]
            )
        ?></li>
        <li><?= $this->Html->link(__('List Receipts'), ['action' => 'index']) ?></li>
        <li><?= $this->Html->link(__('List Companies'), ['controller' => 'Companies', 'action' => 'index']) ?></li>
        <li><?= $this->Html->link(__('New Company'), ['controller' => 'Companies', 'action' => 'add']) ?></li>
        <li><?= $this->Html->link(__('List Receipt Rows'), ['controller' => 'ReceiptRows', 'action' => 'index']) ?></li>
        <li><?= $this->Html->link(__('New Receipt Row'), ['controller' => 'ReceiptRows', 'action' => 'add']) ?></li>
    </ul>
</nav>
<div class="receipts form large-9 medium-8 columns content">
    <?= $this->Form->create($receipt) ?>
    <fieldset>
        <legend><?= __('Edit Receipt') ?></legend>
        <?php
            echo $this->Form->input('voucher_no');
            echo $this->Form->input('bank_cash_id');
            echo $this->Form->input('created_by');
            echo $this->Form->input('created_on');
            echo $this->Form->input('payment_mode');
            echo $this->Form->input('company_id', ['options' => $companies]);
            echo $this->Form->input('transaction_date');
            echo $this->Form->input('edited_by');
            echo $this->Form->input('edited_on');
            echo $this->Form->input('cheque_no');
        ?>
    </fieldset>
    <?= $this->Form->button(__('Submit')) ?>
    <?= $this->Form->end() ?>
</div>
