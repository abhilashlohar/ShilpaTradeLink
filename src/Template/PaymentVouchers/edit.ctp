<nav class="large-3 medium-4 columns" id="actions-sidebar">
    <ul class="side-nav">
        <li class="heading"><?= __('Actions') ?></li>
        <li><?= $this->Form->postLink(
                __('Delete'),
                ['action' => 'delete', $paymentVoucher->id],
                ['confirm' => __('Are you sure you want to delete # {0}?', $paymentVoucher->id)]
            )
        ?></li>
        <li><?= $this->Html->link(__('List Payment Vouchers'), ['action' => 'index']) ?></li>
    </ul>
</nav>
<div class="paymentVouchers form large-9 medium-8 columns content">
    <?= $this->Form->create($paymentVoucher) ?>
    <fieldset>
        <legend><?= __('Edit Payment Voucher') ?></legend>
        <?php
            echo $this->Form->input('created_on');
            echo $this->Form->input('paid_to');
            echo $this->Form->input('payment_mode');
            echo $this->Form->input('cash_bank_account');
            echo $this->Form->input('narration');
        ?>
    </fieldset>
    <?= $this->Form->button(__('Submit')) ?>
    <?= $this->Form->end() ?>
</div>
