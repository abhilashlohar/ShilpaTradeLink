<nav class="large-3 medium-4 columns" id="actions-sidebar">
    <ul class="side-nav">
        <li class="heading"><?= __('Actions') ?></li>
        <li><?= $this->Html->link(__('List Payment Vouchers'), ['action' => 'index']) ?></li>
    </ul>
</nav>
<div class="paymentVouchers form large-9 medium-8 columns content">
    <?= $this->Form->create($paymentVoucher) ?>
    <fieldset>
        <legend><?= __('Add Payment Voucher') ?></legend>
        <?php
            echo $this->Form->input('created_on');
            echo $this->Form->input('paid_to');
			echo $this->Form->radio(
				'payment_mode',
				[
					['value' => 'Cheque', 'text' => 'Cheque'],
					['value' => 'Cash', 'text' => 'Cash'],
				]
			);
            echo $this->Form->input('cash_bank_account');
            echo $this->Form->input('narration');
        ?>
    </fieldset>
    <?= $this->Form->button(__('Submit')) ?>
    <?= $this->Form->end() ?>
</div>
