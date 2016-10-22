<div class="portlet box blue-hoki">
	<div class="portlet-title">
		<div class="caption">
			<i class="fa fa-gift"></i>Edit Sale Taxe
		</div>
	</div>
	<div class="portlet-body form">
		<!-- BEGIN FORM-->
		<div class="row ">
		<div class="col-md-12">
		 <?= $this->Form->create($saleTax,array("class"=>"form-horizontal")) ?>
			<div class="form-body">
				<div class="form-group">
					<label class="control-label col-md-3">Figure  <span class="required" aria-required="true">
					* </span>
					</label>
					<div class="col-md-6">
						<div class="input-icon right">
							<i class="fa"></i>
							 <?php echo $this->Form->input('tax_figure', ['label' => false,'class' => 'form-control','placeholder'=>'Figure']); ?>
						</div>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-3">Description  <span class="required" aria-required="true">
					* </span>
					</label>
					<div class="col-md-6">
						<div class="input-icon right">
							<i class="fa"></i>
							 <?php echo $this->Form->input('description', ['label' => false,'class' => 'form-control','placeholder'=>'Description']); ?>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-offset-4 col-md-8">
						<button type="submit" class="btn btn-primary">Edit Sale Tax</button>
					</div>
				</div>
			</div>
		<?= $this->Form->end() ?>
		</div>
		<!-- END FORM-->
	</div>
</div>
</div>


