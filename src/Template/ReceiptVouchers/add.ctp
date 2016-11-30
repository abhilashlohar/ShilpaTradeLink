

<?php 
$myText = 'For more information
regarding our world-famous pastries and desserts.



<br/><br/><br/><br/><br/>
contact info@example.com';
echo $formattedText = $this->Text->autoParagraph($myText);
?>
<textarea class="wysihtml5 form-control" rows="6"></textarea>
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
