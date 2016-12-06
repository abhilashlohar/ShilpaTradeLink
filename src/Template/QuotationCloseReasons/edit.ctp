<nav class="large-3 medium-4 columns" id="actions-sidebar">
    <ul class="side-nav">
        <li class="heading"><?= __('Actions') ?></li>
        <li><?= $this->Form->postLink(
                __('Delete'),
                ['action' => 'delete', $quotationCloseReason->id],
                ['confirm' => __('Are you sure you want to delete # {0}?', $quotationCloseReason->id)]
            )
        ?></li>
        <li><?= $this->Html->link(__('List Quotation Close Reasons'), ['action' => 'index']) ?></li>
    </ul>
</nav>
<div class="quotationCloseReasons form large-9 medium-8 columns content">
    <?= $this->Form->create($quotationCloseReason) ?>
    <fieldset>
        <legend><?= __('Edit Quotation Close Reason') ?></legend>
        <?php
            echo $this->Form->input('reasion');
        ?>
    </fieldset>
    <?= $this->Form->button(__('Submit')) ?>
    <?= $this->Form->end() ?>
</div>
