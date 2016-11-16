<nav class="large-3 medium-4 columns" id="actions-sidebar">
    <ul class="side-nav">
        <li class="heading"><?= __('Actions') ?></li>
        <li><?= $this->Form->postLink(
                __('Delete'),
                ['action' => 'delete', $accountGroup->id],
                ['confirm' => __('Are you sure you want to delete # {0}?', $accountGroup->id)]
            )
        ?></li>
        <li><?= $this->Html->link(__('List Account Groups'), ['action' => 'index']) ?></li>
        <li><?= $this->Html->link(__('List Account Categories'), ['controller' => 'AccountCategories', 'action' => 'index']) ?></li>
        <li><?= $this->Html->link(__('New Account Category'), ['controller' => 'AccountCategories', 'action' => 'add']) ?></li>
        <li><?= $this->Html->link(__('List Account First Subgroups'), ['controller' => 'AccountFirstSubgroups', 'action' => 'index']) ?></li>
        <li><?= $this->Html->link(__('New Account First Subgroup'), ['controller' => 'AccountFirstSubgroups', 'action' => 'add']) ?></li>
    </ul>
</nav>
<div class="accountGroups form large-9 medium-8 columns content">
    <?= $this->Form->create($accountGroup) ?>
    <fieldset>
        <legend><?= __('Edit Account Group') ?></legend>
        <?php
            echo $this->Form->input('account_category_id', ['options' => $accountCategories]);
            echo $this->Form->input('name');
        ?>
    </fieldset>
    <?= $this->Form->button(__('Submit')) ?>
    <?= $this->Form->end() ?>
</div>
