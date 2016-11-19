<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption">
			<i class="icon-globe font-blue-steel"></i>
			<span class="caption-subject font-blue-steel uppercase">Item Categories</span>
		</div>
	</div>
	<div class="portlet-body form">
		<!-- BEGIN FORM-->
		<div class="row ">
		<div class="col-md-6">
		 <?= $this->Form->create($itemCategory,array("class"=>"form-horizontal")) ?>
			<div class="form-body">
				<div class="form-group">
					<label class="control-label col-md-3">Name  <span class="required" aria-required="true">
					* </span>
					</label>
					<div class="col-md-9">
						<div class="input-icon right">
							<i class="fa"></i>
							 <?php echo $this->Form->input('name', ['label' => false,'class' => 'form-control firstupercase']); ?>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-offset-4 col-md-8">
						<button type="submit" class="btn btn-primary">Add Item Category</button>
					</div>
				</div>
			</div>
		<?= $this->Form->end() ?>
		</div>
		<div class="col-md-6">
		<form method="GET" name="form2" >
								<table class="table table-condensed">
									<thead>
										<tr>
											<th>ITEMS</th>
											
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>
												<div class="row">
												<div class="col-md-6">
													<input type="text" name="item_name" class="form-control input-sm" placeholder="Item Name" value="<?php echo @$itemname; ?>">
												</div>
												
											</div>
											</td>
											<td><button type="submit" class="btn btn-primary btn-sm"><i class="fa fa-filter"></i> Filter</button></td>
										</tr>
									</tbody>
								</table>
		</form>
			<div class="portlet-body">
			
			<div class="table-scrollable">
			<?php $page_no=$this->Paginator->current('ItemCategories'); $page_no=($page_no-1)*20; ?>
			<table class="table table-hover">
				<thead>
					<tr>
						<th><?= $this->Paginator->sort('id') ?></th>
						<th><?= $this->Paginator->sort('name') ?></th>
						<th class="actions"><?= __('Actions') ?></th>
					</tr>
				</thead>
				<tbody>
					<?php foreach ($itemCategories as $itemCategory): ?>
					<tr>
						<td><?= h(++$page_no) ?></td>
						<td><?= h($itemCategory->name) ?></td>
						<td class="actions">
						<?php echo $this->Html->link('<i class="fa fa-pencil-square-o"></i>',['action' => 'edit', $itemCategory->id],array('escape'=>false,'class'=>'btn btn-xs blue')); ?>
							<?= $this->Form->postLink('<i class="fa fa-trash"></i> ',
								['action' => 'delete', $itemCategory->id], 
								[
									'escape' => false,
									'class' => 'btn btn-xs btn-danger',
									'confirm' => __('Are you sure ?', $itemCategory->id)
								]
							) ?>
						</td>
					</tr>
					<?php endforeach; ?>
				</tbody>
			</table>
			</div>
			<div class="paginator">
				<ul class="pagination">
					<?= $this->Paginator->prev('<') ?>
					<?= $this->Paginator->numbers() ?>
					<?= $this->Paginator->next('>') ?>
				</ul>
				<p><?= $this->Paginator->counter() ?></p>
			</div>
			</div>
		</div>
		<!-- END FORM-->
	</div>
</div>
</div>

