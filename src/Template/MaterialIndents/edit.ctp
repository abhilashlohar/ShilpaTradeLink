<nav class="large-3 medium-4 columns" id="actions-sidebar">
    <ul class="side-nav">
        <li class="heading"><?= __('Actions') ?></li>
        <li><?= $this->Form->postLink(
                __('Delete'),
                ['action' => 'delete', $materialIndent->id],
                ['confirm' => __('Are you sure you want to delete # {0}?', $materialIndent->id)]
            )
        ?></li>
        <li><?= $this->Html->link(__('List Material Indents'), ['action' => 'index']) ?></li>
        <li><?= $this->Html->link(__('List Companies'), ['controller' => 'Companies', 'action' => 'index']) ?></li>
        <li><?= $this->Html->link(__('New Company'), ['controller' => 'Companies', 'action' => 'add']) ?></li>
        <li><?= $this->Html->link(__('List Job Cards'), ['controller' => 'JobCards', 'action' => 'index']) ?></li>
        <li><?= $this->Html->link(__('New Job Card'), ['controller' => 'JobCards', 'action' => 'add']) ?></li>
        <li><?= $this->Html->link(__('List Material Indent Rows'), ['controller' => 'MaterialIndentRows', 'action' => 'index']) ?></li>
        <li><?= $this->Html->link(__('New Material Indent Row'), ['controller' => 'MaterialIndentRows', 'action' => 'add']) ?></li>
    </ul>
</nav>
<div class="materialIndents form large-9 medium-8 columns content">
    <?= $this->Form->create($materialIndent) ?>
    <fieldset>
        <legend><?= __('Edit Material Indent') ?></legend>
        <?php
            echo $this->Form->input('company_id', ['options' => $companies]);
            echo $this->Form->input('job_card_id', ['options' => $jobCards]);
            echo $this->Form->input('required_date');
            echo $this->Form->input('created_on');
            echo $this->Form->input('created_by');
        ?>
    </fieldset>
    <?= $this->Form->button(__('Submit')) ?>
    <?= $this->Form->end() ?>
</div>
