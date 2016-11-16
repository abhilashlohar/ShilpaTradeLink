<nav class="large-3 medium-4 columns" id="actions-sidebar">
    <ul class="side-nav">
        <li class="heading"><?= __('Actions') ?></li>
        <li><?= $this->Form->postLink(
                __('Delete'),
                ['action' => 'delete', $accountSecondSubgroup->id],
                ['confirm' => __('Are you sure you want to delete # {0}?', $accountSecondSubgroup->id)]
            )
        ?></li>
        <li><?= $this->Html->link(__('List Account Second Subgroups'), ['action' => 'index']) ?></li>
        <li><?= $this->Html->link(__('List Account First Subgroups'), ['controller' => 'AccountFirstSubgroups', 'action' => 'index']) ?></li>
        <li><?= $this->Html->link(__('New Account First Subgroup'), ['controller' => 'AccountFirstSubgroups', 'action' => 'add']) ?></li>
    </ul>
</nav>
<div class="accountSecondSubgroups form large-9 medium-8 columns content">
    <?= $this->Form->create($accountSecondSubgroup) ?>
    <fieldset>
        <legend><?= __('Edit Account Second Subgroup') ?></legend>
        <?php
            echo $this->Form->input('account_first_subgroup_id', ['options' => $accountFirstSubgroups]);
            echo $this->Form->input('name');
        ?>
    </fieldset>
    <?= $this->Form->button(__('Submit')) ?>
    <?= $this->Form->end() ?>
</div>
