<div class="row">
	<div class="col-md-6">
		<div class="portlet light bordered">
			<div class="portlet-title">
				<div class="caption">
					<i class="icon-globe font-blue-steel"></i>
					<span class="caption-subject font-blue-steel uppercase">Add Category</span>
				</div>
			</div>
			<div class="portlet-body form">
				 <?= $this->Form->create($category,array("class"=>"form-horizontal")) ?>
					<div class="form-body">
						<div class="form-group">
							<label class="control-label col-md-3">Parent Category</label>
							<div class="col-md-9">
								<div class="input-icon right">
									<i class="fa"></i>
									 <?php echo $this->Form->input('parent_id', ['options' => $parentCategories, 'empty' => 'No  Parent Category','label' => false,'class' => 'form-control input-sm select2me']); ?>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3">Category Name</label>
							<div class="col-md-9">
								<div class="input-icon right">
									<i class="fa"></i>
									 <?php echo $this->Form->input('name', ['label' => false,'placeholder'=>'Category Name','class' => 'form-control input-sm']); ?>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-offset-4 col-md-8">
								<button type="submit" class="btn green">Add Category</button>
							</div>
						</div>
					</div>
				<?= $this->Form->end() ?>
			</div>
		</div>
	</div>
		<div class="col-md-6">
		<div class="portlet light bordered">
			<div class="portlet-title">
				<div class="caption">
					<i class="icon-globe font-blue-steel"></i>
					<span class="caption-subject font-blue-steel uppercase">Categories</span>
				</div>
			</div>
			<div class="portlet-body form">
				<?php 
				foreach ($categories as $categoryName) {
					echo $categoryName . "<br/>";
				} ?>
			</div>
		</div>
	</div>

</div>


