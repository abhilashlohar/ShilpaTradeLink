<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption" >
			<i class="icon-globe font-blue-steel"></i>
			<span class="caption-subject font-blue-steel uppercase">Edit Employee</span>
		</div>
	</div>
	<div class="portlet-body form">
		<!-- BEGIN FORM-->
		 <?= $this->Form->create($employee,array("class"=>"form-horizontal")) ?>
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
							<label class="control-label">Dipartment <span class="required" aria-required="true">*</span></label>
							<?php echo $this->Form->input('department_id', ['options' => $departments,'label' => false,'class' => 'form-control input-sm']); ?>
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">Sex <span class="required" aria-required="true">*</span></label>
							<div class="radio-list">
								<div class="radio-inline">
									<?php echo $this->Form->radio(
											'sex',
											[
												['value' => 'Male', 'text' => 'Male'],
												['value' => 'Female', 'text' => 'Female']
											]
									); ?>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">Mobile <span class="required" aria-required="true">*</span></label>
							<?php echo $this->Form->input('mobile', ['label' => false,'class' => 'form-control input-sm','placeholder'=>'Mobile']); ?>
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">Email <span class="required" aria-required="true">*</span></label>
							<?php echo $this->Form->input('email', ['label' => false,'class' => 'form-control input-sm','placeholder'=>'Email']); ?>
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">Address <span class="required" aria-required="true">*</span></label>
							<?php echo $this->Form->input('address', ['label' => false,'class' => 'form-control input-sm','placeholder'=>'Address']); ?>
						</div>
					</div>
				</div>
		</div>
		
			<div class="form-actions">
					<button type="submit" class="btn btn-primary">Update Employee</button>
			</div>
		</div>
		<?= $this->Form->end() ?>
		<!-- END FORM-->
	</div>
</div>
