<nav class="large-3 medium-4 columns" id="actions-sidebar">
    <ul class="side-nav">
        <li class="heading"><?= __('Actions') ?></li>
        <li><?= $this->Form->postLink(
                __('Delete'),
                ['action' => 'delete', $accountReference->id],
                ['confirm' => __('Are you sure you want to delete # {0}?', $accountReference->id)]
            )
        ?></li>
        <li><?= $this->Html->link(__('List Account References'), ['action' => 'index']) ?></li>
        <li><?= $this->Html->link(__('List Ledger Accounts'), ['controller' => 'LedgerAccounts', 'action' => 'index']) ?></li>
        <li><?= $this->Html->link(__('New Ledger Account'), ['controller' => 'LedgerAccounts', 'action' => 'add']) ?></li>
    </ul>
</nav>
<div class="accountReferences form large-9 medium-8 columns content">
    <?= $this->Form->create($accountReference) ?>
    <fieldset>
        <legend><?= __('Edit Account Reference') ?></legend>
        <?php
            echo $this->Form->input('entity_description');
            echo $this->Form->input('ledger_account_id', ['options' => $ledgerAccounts]);
        ?>
    </fieldset>
    <?= $this->Form->button(__('Submit')) ?>
    <?= $this->Form->end() ?>
</div>
