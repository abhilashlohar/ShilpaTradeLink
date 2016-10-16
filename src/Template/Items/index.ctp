<div class="portlet box blue-hoki">
	<div class="portlet-title">
		<div class="caption">
			<i class="fa fa-comments"></i>Items
		</div>
	</div>
	<div class="portlet-body">
		<div class="table-scrollable">
			<form method="GET" >
			<table class="table table-condensed">
				<thead>
					<tr>
						<th>Item Name</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type="text" name="item_name" class="form-control input-sm" placeholder="Item Name" value="<?php echo @$item_name; ?>"></td>
						<td><button type="submit" class="btn btn-primary btn-sm"><i class="fa fa-filter"></i> Filter</button></td>
					</tr>
				</tbody>
			</table>
			</form>
			 <table class="table table-hover">
				 <thead>
					<tr>
						<th>Sr. No.</th>
						<th>Item Name</th>
						<th>Category</th>
						<th>Group</th>
						<th>Sub-Group</th>
						<th>Unit</th>
						<th>Freeze</th>
						<th>Serial Number Enable</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
					<?php $i=0; foreach ($items as $item): $i++; ?>
					<tr>
						<td><?= $i ?></td>
						<td><?= h($item->name) ?></td>
						<td><?= $item->item_category->name ?></td>
						<td><?= $item->item_group->name ?></td>
						<td><?= $item->item_sub_group->name ?></td>
						<td><?= $item->unit->name ?></td>
						<td><?= $item->freeze ? 'yes' : 'no' ?></td>
						<td><?= $item->serial_number_enable ? 'yes' : 'no'?></td>
						<td class="actions">
							<?php echo $this->Html->link('<i class="fa fa-pencil-square-o"></i>',['action' => 'edit', $item->id],array('escape'=>false,'class'=>'btn btn-xs blue')); ?>
							<?= $this->Form->postLink('<i class="fa fa-trash"></i> ',
								['action' => 'delete', $item->id], 
								[
									'escape' => false,
									'class' => 'btn btn-xs btn-danger',
									'confirm' => __('Are you sure ?', $item->id)
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
				<?= $this->Paginator->prev('< ' . __('previous')) ?>
				<?= $this->Paginator->numbers() ?>
				<?= $this->Paginator->next(__('next') . ' >') ?>
			</ul>
			<p><?= $this->Paginator->counter() ?></p>
		</div>
	</div>
</div>