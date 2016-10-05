<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption">
			<i class="icon-globe font-blue-steel"></i>
			<span class="caption-subject font-blue-steel uppercase">Edit Transporter</span>
		</div>
	</div>
	<div class="portlet-body form">
		<!-- BEGIN FORM-->
		 <?= $this->Form->create($transporter,array("class"=>"form-horizontal")) ?>
			<div class="form-body">
				<div class="form-group">
					<label class="control-label col-md-3">Transporter Name  <span class="required" aria-required="true">
					* </span>
					</label>
					<div class="col-md-3">
						<div class="input-icon right">
							<i class="fa"></i>
							 <?php echo $this->Form->input('transporter_name', ['label' => false,'class' => 'form-control']); ?>
						</div>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-3">Mobile <span class="required" aria-required="true">
					* </span>
					</label>
					<div class="col-md-3">
						<div class="input-icon right">
							<i class="fa"></i>
							 <?php echo $this->Form->input('mobile', ['label' => false,'class' => 'form-control']); ?>
						</div>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-3">Address <span class="required" aria-required="true">
					* </span>
					</label>
					<div class="col-md-3">
						<div class="input-icon right">
							<i class="fa"></i>
							 <?php echo $this->Form->input('address', ['label' => false,'class' => 'form-control']); ?>
						</div>
					</div>
				</div>
			</div>
			<div class="form-actions">
				<div class="row">
					<div class="col-md-offset-3 col-md-9">
						<button type="submit" class="btn btn-primary">Update Transporter</button>
					</div>
				</div>
			</div>
		<?= $this->Form->end() ?>
		<!-- END FORM-->
	</div>
</div>
