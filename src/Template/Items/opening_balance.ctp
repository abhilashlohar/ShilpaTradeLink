<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption">
			<i class="icon-globe font-blue-steel"></i>
			<span class="caption-subject font-blue-steel 	">Item opening balance</span>
		</div>
		
		<div class="actions">
			<?= $this->Html->link(
				'Add',
				'/Items/Opening-Balance'
			); ?>
			<?= $this->Html->link(
				'View',
				'/Items/Opening-Balance-View'
			); ?>
		</div>
	</div>
	<div class="portlet-body form">
	<?= $this->Form->create($ItemLedger,['id'=>'form_sample_3']) ?>
		<div class="row">
			<div class="col-md-4">
				<div class="form-group">
					<label class="control-label">Item <span class="required" aria-required="true">*</span></label>
					<?php echo $this->Form->input('Item_id', ['empty'=>'--select--','label' => false,'class' => 'form-control input-sm select2me','options'=>$Items]); ?>
				</div>
			</div>
			<div class="col-md-3">
				<div class="form-group">
					<label class="control-label">Date <span class="required" aria-required="true">*</span></label>
					<?php echo $this->Form->input('date', ['label' => false,'class' => 'form-control input-sm date-picker','placeholder'=>'Date','data-date-format' => 'dd-mm-yyyy']); ?>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-3">
				<div class="form-group">
					<label class="control-label">quantity <span class="required" aria-required="true">*</span></label>
					<?php echo $this->Form->input('quantity', ['type'=>'text','label' => false,'class' => 'form-control input-sm','placeholder'=>'Quantity']); ?>
				</div>
			</div>
			<div class="col-md-3">
				<div class="form-group">
					<label class="control-label">Rate <span class="required" aria-required="true">*</span></label>
					<?php echo $this->Form->input('rate', ['type'=>'text','label' => false,'class' => 'form-control input-sm','placeholder'=>'Rate']); ?>
				</div>
			</div>
			<div class="col-md-3">
				<div class="form-group">
					<label class="control-label">Value <span class="required" aria-required="true">*</span></label>
					<?php echo $this->Form->input('value', ['type'=>'text','label' => false,'class' => 'form-control input-sm','placeholder'=>'Value']); ?>
				</div>
			</div>
		</div>
		<button type="submit" class="btn blue-hoki">Submit</button>
	<?= $this->Form->end() ?>
	</div>
</div>