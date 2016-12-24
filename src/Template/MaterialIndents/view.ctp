<?php //pr($materialIndent); exit; ?>
 
<div class="materialIndents view large-9 medium-8 columns content">
    <h3><?= h($materialIndent->id) ?></h3>
    <table class="vertical-table">
        <tr>
            <th><?= __('Company') ?></th>
            <td><?= $materialIndent->has('company') ? $this->Html->link($materialIndent->company->name, ['controller' => 'Companies', 'action' => 'view', $materialIndent->company->id]) : '' ?></td>
        </tr>
        <tr>
            <th><?= __('Job Card') ?></th>
            <td><?= $materialIndent->has('job_card') ? $this->Html->link($materialIndent->job_card->id, ['controller' => 'JobCards', 'action' => 'view', $materialIndent->job_card->id]) : '' ?></td>
        </tr>
        <tr>
            <th><?= __('Id') ?></th>
            <td><?= $this->Number->format($materialIndent->id) ?></td>
        </tr>
        <tr>
            <th><?= __('Created By') ?></th>
            <td><?= $this->Number->format($materialIndent->created_by) ?></td>
        </tr>
        <tr>
            <th><?= __('Required Date') ?></th>
            <td><?= h($materialIndent->required_date) ?></td>
        </tr>
        <tr>
            <th><?= __('Created On') ?></th>
            <td><?= h($materialIndent->created_on) ?></td>
        </tr>
    </table>
    <div class="related">
        <h4><?= __('Related Material Indent Rows') ?></h4>
        <?php if (!empty($materialIndent->material_indent_rows)): ?>
        <table cellpadding="0" cellspacing="0">
            <tr>
                <th><?= __('Id') ?></th>
                <th><?= __('Material Indent Id') ?></th>
                <th><?= __('Item Id') ?></th>
                <th><?= __('Quantity') ?></th>
                <th><?= __('Approved Purchased Quantity') ?></th>
                <th class="actions"><?= __('Actions') ?></th>
            </tr>
            <?php foreach ($materialIndent->material_indent_rows as $materialIndentRows): ?>
            <tr>
                <td><?= h($materialIndentRows->id) ?></td>
                <td><?= h($materialIndentRows->material_indent_id) ?></td>
                <td><?= h($materialIndentRows->item_id) ?></td>
                <td><?= h($materialIndentRows->quantity) ?></td>
                <td><?= h($materialIndentRows->approved_purchased_quantity) ?></td>
                <td class="actions">
                    <?= $this->Html->link(__('View'), ['controller' => 'MaterialIndentRows', 'action' => 'view', $materialIndentRows->id]) ?>
                    <?= $this->Html->link(__('Edit'), ['controller' => 'MaterialIndentRows', 'action' => 'edit', $materialIndentRows->id]) ?>
                    <?= $this->Form->postLink(__('Delete'), ['controller' => 'MaterialIndentRows', 'action' => 'delete', $materialIndentRows->id], ['confirm' => __('Are you sure you want to delete # {0}?', $materialIndentRows->id)]) ?>
                </td>
            </tr>
            <?php endforeach; ?>
        </table>
        <?php endif; ?>
    </div>
</div>
