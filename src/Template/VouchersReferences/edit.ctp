<nav class="large-3 medium-4 columns" id="actions-sidebar">
    <ul class="side-nav">
        <li class="heading"><?= __('Actions') ?></li>
        <li><?= $this->Form->postLink(
                __('Delete'),
                ['action' => 'delete', $vouchersReference->id],
                ['confirm' => __('Are you sure you want to delete # {0}?', $vouchersReference->id)]
            )
        ?></li>
        <li><?= $this->Html->link(__('List Vouchers References'), ['action' => 'index']) ?></li>
        <li><?= $this->Html->link(__('List Vouchers References Groups'), ['controller' => 'VouchersReferencesGroups', 'action' => 'index']) ?></li>
        <li><?= $this->Html->link(__('New Vouchers References Group'), ['controller' => 'VouchersReferencesGroups', 'action' => 'add']) ?></li>
    </ul>
</nav>
<div class="vouchersReferences form large-9 medium-8 columns content">
    <?= $this->Form->create($vouchersReference) ?>
    <fieldset>
        <legend><?= __('Edit Vouchers Reference') ?></legend>
        <?php
            echo $this->Form->input('voucher_entity');
            echo $this->Form->input('description');
        ?>
    </fieldset>
    <?= $this->Form->button(__('Submit')) ?>
    <?= $this->Form->end() ?>
</div>
