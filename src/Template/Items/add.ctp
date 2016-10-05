<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption">
			<i class="icon-globe font-blue-steel"></i>
			<span class="caption-subject font-blue-steel uppercase">Add Item</span>
		</div>
	</div>
	<div class="portlet-body form">
		<!-- BEGIN FORM-->
		<?= $this->Form->create($item) ?>
			<div class="form-body">
				<div class="row">
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">Name <span class="required" aria-required="true">*</span></label>
							<?php echo $this->Form->input('name', ['label' => false,'class' => 'form-control input-sm firstupercase','placeholder'=>'Name']); ?>
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">Alias <span class="required" aria-required="true">*</span></label>
							<?php echo $this->Form->input('alias', ['label' => false,'class' => 'form-control input-sm firstupercase','placeholder'=>'Alias']); ?>
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">Unit <span class="required" aria-required="true">*</span></label>
							<?php echo $this->Form->input('unit_id', ['options' => $units,'label' => false,'class' => 'form-control input-sm','placeholder'=>'Name']); ?>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">Category <span class="required" aria-required="true">*</span></label>
							<?php echo $this->Form->input('category_id', ['options' => $Categories,'label' => false,'class' => 'form-control input-sm','placeholder'=>'Category']); ?>
						</div>
					</div>
				</div>
				<h4>Opening Balance</h4>
				<div class="row">
					<div class="col-md-3">
						<div class="form-group">
							<label class="control-label">Quantity <span class="required" aria-required="true">*</span></label>
							<?php echo $this->Form->input('ob_quantity', ['label' => false,'class' => 'form-control input-sm','placeholder'=>'Quantity']); ?>
						</div>
					</div>
					<div class="col-md-3">
						<div class="form-group">
							<label class="control-label">Rate <span class="required" aria-required="true">*</span></label>
							<?php echo $this->Form->input('ob_rate', ['label' => false,'type'=>'text','class' => 'form-control input-sm','placeholder'=>'Rate']); ?>
						</div>
					</div>
					<div class="col-md-3">
						<div class="form-group">
							<label class="control-label">Value <span class="required" aria-required="true">*</span></label>
							<?php echo $this->Form->input('ob_value', ['label' => false,'class' => 'form-control input-sm','placeholder'=>'Value','readonly']); ?>
						</div>
					</div>
				</div>
				<hr>
				<div class="row">
					<div class="col-md-3">
						<div class="form-group">
							<label class="control-label">Minimum Quantity <span class="required" aria-required="true">*</span></label>
							<?php echo $this->Form->input('minimum_quantity', ['label' => false,'class' => 'form-control input-sm','placeholder'=>'Minimum Quantity']); ?>
						</div>
					</div>
					<div class="col-md-3">
						<div class="form-group">
							<label class="control-label">Maximum Quantity <span class="required" aria-required="true">*</span></label>
							<?php echo $this->Form->input('maximum_quantity', ['label' => false,'class' => 'form-control input-sm','placeholder'=>'Maximum Quantity']); ?>
						</div>
					</div>
					<div class="col-md-3">
						<div class="form-group">
							<br/>
							<?php echo $this->Form->input('freeze'); ?>
						</div>
					</div>
					<div class="col-md-3">
						<div class="form-group">
							<br/>
							<?php echo $this->Form->input('serial_number_enable'); ?>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="col-md-4">
						<label class="control-label">Used By Companies <span class="required" aria-required="true">*</span></label>
						<?php echo $this->Form->input('companies._ids', ['label' => false,'options' => $Companies,'multiple' => 'checkbox']); ?>
					</div>
					<div class="col-md-4">
						<label class="control-label">Source <span class="required" aria-required="true">*</span></label>
						<div class="checkbox-list">
							<?php echo $this->Form->input('sources._ids', ['label' => false,'options' => $sources,'multiple' => 'checkbox','class' => 'form-control input-sm']); ?>
						</div>
					</div>
				</div>
			</div>
			
			<div class="form-actions">
				 <button type="submit" class="btn blue-hoki">Add Item</button>
			</div>
		<?= $this->Form->end() ?>
		<!-- END FORM-->
	</div>
</div>
<?php echo $this->Html->script('/assets/global/plugins/jquery.min.js'); ?>
<script>
$(document).ready(function() {
	$('input[name="ob_quantity"],input[name="ob_rate"]').die().live("keyup",function() { 
		var ob_quantity=parseFloat($('input[name="ob_quantity"]').val());
		if(isNaN(ob_quantity)) { var ob_quantity = 0; }
		var ob_rate=parseFloat($('input[name="ob_rate"]').val());
		if(isNaN(ob_rate)) { var ob_rate = 0; }
		var total=ob_quantity*ob_rate;
		$('input[name="ob_value"]').val(total.toFixed(2));
    });
});
</script>