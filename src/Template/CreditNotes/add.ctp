<nav class="large-3 medium-4 columns" id="actions-sidebar">
    <ul class="side-nav">
        <li class="heading"><?= __('Actions') ?></li>
        <li><?= $this->Html->link(__('List Credit Notes'), ['action' => 'index']) ?></li>
        <li><?= $this->Html->link(__('List Companies'), ['controller' => 'Companies', 'action' => 'index']) ?></li>
        <li><?= $this->Html->link(__('New Company'), ['controller' => 'Companies', 'action' => 'add']) ?></li>
    </ul>
</nav>
<div class="creditNotes form large-9 medium-8 columns content">
    <?= $this->Form->create($creditNote) ?>
    <fieldset>
        <legend><?= __('Add Credit Note') ?></legend>
        <?php
            echo $this->Form->input('created_on');
            echo $this->Form->input('transaction_date');
            echo $this->Form->input('sales_acc_id');
            echo $this->Form->input('payment_mode');
            echo $this->Form->input('party_id');
            echo $this->Form->input('narration');
            echo $this->Form->input('amount');
            echo $this->Form->input('company_id', ['options' => $companies]);
            echo $this->Form->input('created_by');
        ?>
    </fieldset>
    <?= $this->Form->button(__('Submit')) ?>
    <?= $this->Form->end() ?>
</div>
