<nav class="large-3 medium-4 columns" id="actions-sidebar">
    <ul class="side-nav">
        <li class="heading"><?= __('Actions') ?></li>
        <li><?= $this->Form->postLink(
                __('Delete'),
                ['action' => 'delete', $accountFirstSubgroup->id],
                ['confirm' => __('Are you sure you want to delete # {0}?', $accountFirstSubgroup->id)]
            )
        ?></li>
        <li><?= $this->Html->link(__('List Account First Subgroups'), ['action' => 'index']) ?></li>
        <li><?= $this->Html->link(__('List Account Groups'), ['controller' => 'AccountGroups', 'action' => 'index']) ?></li>
        <li><?= $this->Html->link(__('New Account Group'), ['controller' => 'AccountGroups', 'action' => 'add']) ?></li>
    </ul>
</nav>
<div class="accountFirstSubgroups form large-9 medium-8 columns content">
    <?= $this->Form->create($accountFirstSubgroup) ?>
    <fieldset>
        <legend><?= __('Edit Account First Subgroup') ?></legend>
        <?php
            echo $this->Form->input('account_group_id', ['options' => $accountGroups]);
            echo $this->Form->input('name');
        ?>
    </fieldset>
    <?= $this->Form->button(__('Submit')) ?>
    <?= $this->Form->end() ?>
</div>
