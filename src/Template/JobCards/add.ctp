<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption" >
			<i class="icon-globe font-blue-steel"></i>
			<span class="caption-subject font-blue-steel uppercase">Add Job Card</span>
		</div>
		<div class="actions">
		<?php echo $this->Html->link('<i class="fa fa-files-o"></i> Pull Sales-Order','/Sales-Orders/index?job-card=true',array('escape'=>false,'class'=>'btn btn-xs blue')); ?>
		</div>
	</div>
	<div class="portlet-body form">
		<!-- BEGIN FORM-->
		 <?= $this->Form->create($jobCard,['id'=>'form_sample_3']) ?>
			<div class="form-body">
				<div class="row">
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">Company Name <span class="required" aria-required="true">*</span></label>
							<?php echo $this->Form->input('company_id', ['options' => $companies,'class' => 'form-control input-sm select2me','label'=>false]); ?>
						</div>
					</div>
				</div>
				
			</div>
		
			<div class="form-actions">
				<button type="submit" class="btn btn-primary">CREATE JOB CARD</button>
			</div>
		<?= $this->Form->end() ?>
	</div>
		
		<!-- END FORM-->
	</div>
</div>
<?php echo $this->Html->script('/assets/global/plugins/jquery.min.js'); ?>
<script>
$(document).ready(function() {
	alert();
});
</script>
<div class="jobCards form large-9 medium-8 columns content">
    <?= $this->Form->create($jobCard) ?>
    <fieldset>
        <legend><?= __('Add Job Card') ?></legend>
        <?php
            echo $this->Form->input('sales_order_id', ['options' => $salesOrders]);
            echo $this->Form->input('company_id', ['options' => $companies]);
            echo $this->Form->input('created_by');
            echo $this->Form->input('created_on');
        ?>
    </fieldset>
    <?= $this->Form->button(__('Submit')) ?>
    <?= $this->Form->end() ?>
</div>
