<nav class="large-3 medium-4 columns" id="actions-sidebar">
    <ul class="side-nav">
        <li class="heading"><?= __('Actions') ?></li>
        <li><?= $this->Html->link(__('List Vouchers References'), ['action' => 'index']) ?></li>
        <li><?= $this->Html->link(__('List Vouchers References Groups'), ['controller' => 'VouchersReferencesGroups', 'action' => 'index']) ?></li>
        <li><?= $this->Html->link(__('New Vouchers References Group'), ['controller' => 'VouchersReferencesGroups', 'action' => 'add']) ?></li>
    </ul>
</nav>
<div class="vouchersReferences form large-9 medium-8 columns content">
    <?= $this->Form->create($vouchersReference) ?>
    <fieldset>
        <legend><?= __('Add Vouchers Reference') ?></legend>
        <?php
            echo $this->Form->input('voucher_entity');
            echo $this->Form->input('description');
        ?>
    </fieldset>
    <?= $this->Form->button(__('Submit')) ?>
    <?= $this->Form->end() ?>
</div>
