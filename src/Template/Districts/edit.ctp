<div class="portlet box blue-hoki">
	<div class="portlet-title">
		<div class="caption">
			<i class="fa fa-gift"></i>Edit District
		</div>
	</div>
	<div class="portlet-body form">
		<!-- BEGIN FORM-->
		 <?= $this->Form->create($district,array("class"=>"form-horizontal")) ?>
			<div class="form-body">
				<div class="form-group">
					<label class="control-label col-md-3">State  <span class="required" aria-required="true">
					* </span>
					</label>
					<div class="col-md-4">
						<div class="input-icon right">
							<i class="fa"></i>
							 <?php echo $this->Form->input('state', ['label' => false,'class' => 'form-control']); ?>
						</div>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-3">District <span class="required" aria-required="true">
					* </span>
					</label>
					<div class="col-md-4">
						<div class="input-icon right">
							<i class="fa"></i>
							 <?php echo $this->Form->input('district', ['label' => false,'class' => 'form-control']); ?>
						</div>
					</div>
				</div>
			</div>
			<div class="form-actions">
				<div class="row">
					<div class="col-md-offset-3 col-md-9">
						<button type="submit" class="btn green">UPDATE DISTRICT</button>
					</div>
				</div>
			</div>
		<?= $this->Form->end() ?>
		<!-- END FORM-->
	</div>
</div>