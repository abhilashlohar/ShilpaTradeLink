<div class="portlet box blue-hoki">
	<div class="portlet-title">
		<div class="caption">
			<i class="fa fa-gift"></i>Edit Item
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
							<?php echo $this->Form->input('name', ['label' => false,'class' => 'form-control','placeholder'=>'Name']); ?>
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">Unit <span class="required" aria-required="true">*</span></label>
							<?php echo $this->Form->input('unit_id', ['options' => $units,'label' => false,'class' => 'form-control','placeholder'=>'Name']); ?>
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">Source <span class="required" aria-required="true">*</span></label>
							<?php echo $this->Form->input('sources._ids', ['label' => false,'options' => $sources,'multiple' => 'checkbox']); ?>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">Item Category <span class="required" aria-required="true">*</span></label>
							<?php echo $this->Form->input('item_category_id', ['options' => $itemCategories,'label' => false,'class' => 'form-control','placeholder'=>'Item Category']); ?>
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">Item Group <span class="required" aria-required="true">*</span></label>
							<?php echo $this->Form->input('item_group_id', ['options' => $itemGroups,'label' => false,'class' => 'form-control','placeholder'=>'Name']); ?>
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">Item Sub Group <span class="required" aria-required="true">*</span></label>
							<?php echo $this->Form->input('item_sub_group_id', ['options' => $itemSubGroups,'label' => false,'class' => 'form-control','placeholder'=>'Name']); ?>
						</div>
					</div>
				</div>
				<h4 class="form-section">Opening Balance</h4>
				<div class="row">
					<div class="col-md-3">
						<div class="form-group">
							<label class="control-label">Quantity <span class="required" aria-required="true">*</span></label>
							<?php echo $this->Form->input('ob_quantity', ['label' => false,'class' => 'form-control','placeholder'=>'Quantity']); ?>
						</div>
					</div>
					<div class="col-md-3">
						<div class="form-group">
							<label class="control-label">Rate <span class="required" aria-required="true">*</span></label>
							<?php echo $this->Form->input('ob_rate', ['label' => false,'class' => 'form-control','placeholder'=>'Rate']); ?>
						</div>
					</div>
					<div class="col-md-3">
						<div class="form-group">
							<label class="control-label">Value <span class="required" aria-required="true">*</span></label>
							<?php echo $this->Form->input('ob_value', ['label' => false,'class' => 'form-control','placeholder'=>'Value']); ?>
						</div>
					</div>
				</div>
				<hr>
				<div class="row">
					<div class="col-md-3">
						<div class="form-group">
							<label class="control-label">Minimum Quantity <span class="required" aria-required="true">*</span></label>
							<?php echo $this->Form->input('minimum_quantity', ['label' => false,'class' => 'form-control','placeholder'=>'Minimum Quantity']); ?>
						</div>
					</div>
					<div class="col-md-3">
						<div class="form-group">
							<label class="control-label">Maximum Quantity <span class="required" aria-required="true">*</span></label>
							<?php echo $this->Form->input('maximum_quantity', ['label' => false,'class' => 'form-control','placeholder'=>'Maximum Quantity']); ?>
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
					<div class="col-md-3">
						<fieldset>
							<legend><?php __('Companies');?></legend>
							<?php echo $this->Form->input('companies._ids', ['options' => $Companies,'multiple' => 'checkbox']); ?>
						</fieldset>
					</div>
				</div>
			</div>
			
			<div class="form-actions">
				 <button type="submit" class="btn blue-hoki">Update Item</button>
			</div>
		<?= $this->Form->end() ?>
		<!-- END FORM-->
	</div>
</div>