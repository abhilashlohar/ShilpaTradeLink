<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption">
			<i class="icon-globe font-blue-steel"></i>
			<span class="caption-subject font-blue-steel uppercase">Item Groups</span>
		</div>
	</div>
	<div class="portlet-body form">
		<!-- BEGIN FORM-->
		<div class="row ">
		<div class="col-md-6">
		 <?= $this->Form->create($itemGroup,array("class"=>"form-horizontal")) ?>
			<div class="form-body">
				<div class="form-group">
					<label class="control-label col-md-3">Item Category  <span class="required" aria-required="true">
					* </span>
					</label>
					<div class="col-md-9">
						<div class="input-icon right">
							<i class="fa"></i>
							 <?php echo $this->Form->input('item_category_id', ['options' => $itemCategories,'label' => false,'class' => 'form-control']); ?>
						</div>
					</div>
				</div>
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
											<th>ITEMS GROUP</th>
											
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>
												<div class="row">
												<div class="col-md-6">
													<input type="text" name="item_category" class="form-control input-sm" placeholder="Item Category" value="<?php echo @$item_category; ?>">
												</div>
												
												<div class="col-md-6">
													<input type="text" name="item_group" class="form-control input-sm" placeholder="Item Group" value="<?php echo @$item_group; ?>">
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
			<?php $page_no=$this->Paginator->current('ItemGroups'); $page_no=($page_no-1)*20; ?>
			<table class="table table-hover">
				<thead>
					<tr>
						<th><?= $this->Paginator->sort('id') ?></th>
						<th><?= $this->Paginator->sort('item_category_id') ?></th>
						<th><?= $this->Paginator->sort('name') ?></th>
						<th class="actions"><?= __('Actions') ?></th>
					</tr>
				</thead>
				<tbody>
					<?php foreach ($itemGroups as $itemGroup): ?>
					<tr>
						<td><?= h(++$page_no) ?></td>
						<td><?= h($itemGroup->item_category->name) ?></td>
						<td><?= h($itemGroup->name) ?></td>
						<td class="actions">
							<?= $this->Html->link(__('Edit'), ['action' => 'edit', $itemGroup->id]) ?>
							<?= $this->Form->postLink(__('Delete'), ['action' => 'delete', $itemGroup->id], ['confirm' => __('Are you sure you want to delete # {0}?', $itemGroup->id)]) ?>
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
