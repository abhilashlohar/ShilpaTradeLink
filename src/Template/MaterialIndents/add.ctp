<?php //pr($salesOrder->so1); exit; ?>
<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption" >
			<i class="icon-globe font-blue-steel"></i>
			<span class="caption-subject font-blue-steel uppercase">Add Material Indent</span>
		</div>
		<div class="actions">
		<?php echo $this->Html->link('<i class="fa fa-files-o"></i> Pull Job card','/JobCards/index?material-indent=true',array('escape'=>false,'class'=>'btn btn-xs blue')); ?>
		</div>
	</div>




<div class="materialIndents form large-9 medium-8 columns content">
    <?= $this->Form->create($materialIndent) ?>
    <fieldset>
        <legend><?= __('Add Material Indent') ?></legend>
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
