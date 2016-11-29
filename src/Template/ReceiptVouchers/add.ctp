<nav class="large-3 medium-4 columns" id="actions-sidebar">
    <ul class="side-nav">
        <li class="heading"><?= __('Actions') ?></li>
        <li><?= $this->Html->link(__('List Receipt Vouchers'), ['action' => 'index']) ?></li>
    </ul>
</nav>
<div class="receiptVouchers form large-9 medium-8 columns content">
    <?= $this->Form->create($receiptVoucher) ?>
    <fieldset>
        <legend><?= __('Add Receipt Voucher') ?></legend>
        <?php
            echo $this->Form->input('received_from_id');
            echo $this->Form->input('bank_cash_id');
            echo $this->Form->input('narration');
            echo $this->Form->input('amount');
            echo $this->Form->input('created_by');
            echo $this->Form->input('created_on');
        ?>
    </fieldset>
    <?= $this->Form->button(__('Submit')) ?>
    <?= $this->Form->end() ?>
</div>
