<nav class="large-3 medium-4 columns" id="actions-sidebar">
    <ul class="side-nav">
        <li class="heading"><?= __('Actions') ?></li>
        <li><?= $this->Form->postLink(
                __('Delete'),
                ['action' => 'delete', $receiptEffect->id],
                ['confirm' => __('Are you sure you want to delete # {0}?', $receiptEffect->id)]
            )
        ?></li>
        <li><?= $this->Html->link(__('List Receipt Effects'), ['action' => 'index']) ?></li>
        <li><?= $this->Html->link(__('List Receipt Vouchers'), ['controller' => 'ReceiptVouchers', 'action' => 'index']) ?></li>
        <li><?= $this->Html->link(__('New Receipt Voucher'), ['controller' => 'ReceiptVouchers', 'action' => 'add']) ?></li>
        <li><?= $this->Html->link(__('List Invoices'), ['controller' => 'Invoices', 'action' => 'index']) ?></li>
        <li><?= $this->Html->link(__('New Invoice'), ['controller' => 'Invoices', 'action' => 'add']) ?></li>
    </ul>
</nav>
<div class="receiptEffects form large-9 medium-8 columns content">
    <?= $this->Form->create($receiptEffect) ?>
    <fieldset>
        <legend><?= __('Edit Receipt Effect') ?></legend>
        <?php
            echo $this->Form->input('receipt_voucher_id', ['options' => $receiptVouchers]);
            echo $this->Form->input('invoice_id', ['options' => $invoices]);
            echo $this->Form->input('amount');
        ?>
    </fieldset>
    <?= $this->Form->button(__('Submit')) ?>
    <?= $this->Form->end() ?>
</div>
