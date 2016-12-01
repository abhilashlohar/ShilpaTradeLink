<nav class="large-3 medium-4 columns" id="actions-sidebar">
    <ul class="side-nav">
        <li class="heading"><?= __('Actions') ?></li>
        <li><?= $this->Form->postLink(
                __('Delete'),
                ['action' => 'delete', $journalVoucher->id],
                ['confirm' => __('Are you sure you want to delete # {0}?', $journalVoucher->id)]
            )
        ?></li>
        <li><?= $this->Html->link(__('List Journal Vouchers'), ['action' => 'index']) ?></li>
        <li><?= $this->Html->link(__('List Companies'), ['controller' => 'Companies', 'action' => 'index']) ?></li>
        <li><?= $this->Html->link(__('New Company'), ['controller' => 'Companies', 'action' => 'add']) ?></li>
    </ul>
</nav>
<div class="journalVouchers form large-9 medium-8 columns content">
    <?= $this->Form->create($journalVoucher) ?>
    <fieldset>
        <legend><?= __('Edit Journal Voucher') ?></legend>
        <?php
            echo $this->Form->input('created_on');
            echo $this->Form->input('transaction_date');
            echo $this->Form->input('ledger1');
            echo $this->Form->input('payment_mode');
            echo $this->Form->input('ledger2');
            echo $this->Form->input('narration');
            echo $this->Form->input('amount');
            echo $this->Form->input('company_id', ['options' => $companies]);
            echo $this->Form->input('created_by');
        ?>
    </fieldset>
    <?= $this->Form->button(__('Submit')) ?>
    <?= $this->Form->end() ?>
</div>
