<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption">
			<i class="icon-globe font-blue-steel"></i>
			<span class="caption-subject font-blue-steel uppercase">Item Sub Groups</span>
		</div>
	</div>
	<div class="portlet-body form">
		<!-- BEGIN FORM-->
		<div class="row ">
		<div class="col-md-6">
		 <?= $this->Form->create($itemSubGroup,array("class"=>"form-horizontal")) ?>
			<div class="form-body">
				<div class="form-group">
					<label class="control-label col-md-3">Item Category  <span class="required" aria-required="true">
					* </span>
					</label>
					<div class="col-md-9">
						<div class="input-icon right">
							<i class="fa"></i>
							 <?php echo $this->Form->input('item_category_id', ['empty'=>'--Select--','options' => $itemCategories,'label' => false,'class' => 'form-control input-sm']); ?>
						</div>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-3">Item Group  <span class="required" aria-required="true">
					* </span>
					</label>
					<div class="col-md-9" id="item_group_div">
						
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-3">Name  <span class="required" aria-required="true">
					* </span>
					</label>
					<div class="col-md-9">
						<div class="input-icon right">
							<i class="fa"></i>
							 <?php echo $this->Form->input('name', ['label' => false,'class' => 'form-control input-sm firstupercase']); ?>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-offset-4 col-md-8">
						<button type="submit" class="btn btn-primary">Add Item Sub Group</button>
					</div>
				</div>
			</div>
		<?= $this->Form->end() ?>
		</div>
		<div class="col-md-6">
			<div class="portlet-body">
			<div class="table-scrollable">
			<table class="table table-hover">
				<thead>
					<tr>
						<th><?= $this->Paginator->sort('id') ?></th>
						<th>Category Name</th>
						<th>Group Name</th>
						<th>Sub Group Name</th>
						<th class="actions"><?= __('Actions') ?></th>
					</tr>
				</thead>
				<tbody>
					<?php foreach ($itemSubGroups as $itemSubGroup): ?>
					<tr>
						<td><?= $this->Number->format($itemSubGroup->id) ?></td>
						<td><?= h($itemSubGroup->item_group->item_category->name) ?></td>
						<td><?= h($itemSubGroup->item_group->name) ?></td>
						<td><?= h($itemSubGroup->name) ?></td>
						<td class="actions">
							<?= $this->Html->link(__('Edit'), ['action' => 'edit', $itemSubGroup->id]) ?>
							<?= $this->Form->postLink(__('Delete'), ['action' => 'delete', $itemSubGroup->id], ['confirm' => __('Are you sure you want to delete # {0}?', $itemSubGroup->id)]) ?>
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
<?php echo $this->Html->script('/assets/global/plugins/jquery.min.js'); ?>
<script>
$(document).ready(function() {
	$('select[name="item_category_id"]').on("change",function() {
		$('#item_group_div').html('Loading...');
		var itemCategoryId=$('select[name="item_category_id"] option:selected').val();
		var url="<?php echo $this->Url->build(['controller'=>'ItemGroups','action'=>'ItemGroupDropdown']); ?>";
		url=url+'/'+itemCategoryId,
		$.ajax({
			url: url,
			type: 'GET',
		}).done(function(response) {
			$('#item_group_div').html(response);
		});
    });
});
</script>