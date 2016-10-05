<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption" >
			<i class="icon-globe font-blue-steel"></i>
			<span class="caption-subject font-blue-steel uppercase">Edit Company</span>
		</div>
	</div>
	<div class="portlet-body form">
		<!-- BEGIN FORM-->
		 <?= $this->Form->create($company,array("class"=>"form-horizontal")) ?>
			<div class="form-body">
				<div class="row">
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">Name <span class="required" aria-required="true">*</span></label>
							<?php echo $this->Form->input('name', ['label' => false,'class' => 'form-control input-sm','placeholder'=>'Name']); ?>
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">Pan No <span class="required" aria-required="true">*</span></label>
							<?php echo $this->Form->input('pan_no', ['label' => false,'class' => 'form-control input-sm','placeholder'=>'Pan No']); ?>
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">Tin No <span class="required" aria-required="true">*</span></label>
							<?php echo $this->Form->input('tin_no', ['label' => false,'class' => 'form-control input-sm','placeholder'=>'Tin No']); ?>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">Tan No <span class="required" aria-required="true">*</span></label>
							<?php echo $this->Form->input('tan_no', ['label' => false,'class' => 'form-control input-sm','placeholder'=>'Tan No']); ?>
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">Service Tax No  <span class="required" aria-required="true">*</span></label>
							<?php echo $this->Form->input('service_tax_no', ['label' => false,'class' => 'form-control input-sm','placeholder'=>'Service Tax No']); ?>
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">Landline No  <span class="required" aria-required="true">*</span></label>
							<?php echo $this->Form->input('landline_no', ['label' => false,'class' => 'form-control input-sm','placeholder'=>'Landline No']); ?>
						</div>
					</div>
				</div>
			
				<div class="row">
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">Mobile No <span class="required" aria-required="true">*</span></label>
							<?php echo $this->Form->input('mobile_no', ['label' => false,'class' => 'form-control input-sm','placeholder'=>'Mobile No']); ?>
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">Email ID <span class="required" aria-required="true">*</span></label>
							<?php echo $this->Form->input('email', ['label' => false,'class' => 'form-control input-sm','placeholder'=>'Email ID']); ?>
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">Website <span class="required" aria-required="true">*</span></label>
							<?php echo $this->Form->input('website', ['label' => false,'class' => 'form-control input-sm','placeholder'=>'Website']); ?>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">Address <span class="required" aria-required="true">*</span></label>
							<?php echo $this->Form->input('address', ['label' => false,'class' => 'form-control input-sm','placeholder'=>'Address']); ?>
						</div>
					</div>
				</div>
			</div>
		
			<div class="form-actions">
				<button type="submit" class="btn btn-primary">UPDATE COMPANY</button>
			</div>
		</div>
		<?= $this->Form->end() ?>
		<!-- END FORM-->
	</div>
</div>
<?php echo $this->Html->script('/assets/global/plugins/jquery.min.js'); ?>
