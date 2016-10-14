<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption">
			<i class="icon-globe font-blue-steel"></i>
			<span class="caption-subject font-blue-steel uppercase">CUSTOMERS</span>
		</div>
	</div>
	<div class="portlet-body">
		<div class="table-scrollable">
			<form method="GET" >
				<table class="table table-condensed">
				<thead>
					<tr>
						<th>Customer Name</th>
						<th>District</th>
						<th>Customer Seg</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type="text" name="customer" class="form-control input-sm" placeholder="Customer Name" value="<?php echo @$customer; ?>"></td>
						<td><input type="text" name="district" class="form-control input-sm" placeholder="District" value="<?php echo @$district; ?>"></td>
						<td><input type="text" name="customer_seg" class="form-control input-sm" placeholder="Customer Seg" value="<?php echo @$customer_seg; ?>"></td>
						<td><button type="submit" class="btn btn-primary btn-sm"><i class="fa fa-filter"></i> Filter</button></td>
					</tr>
				</tbody>
			</table>
			</form>
			 <table class="table table-hover">
				 <thead>
					<tr>
						<th>Sr. No.</th>
						<th>Customer Name</th>
						<th>District</th>
						<th>Customer Seg</th>
						<th>Tin No</th>
						<th>Gst No</th>
						<th>Pan No</th>
						<th>Ecc No</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
					<?php $i=0; foreach ($customers as $customer): $i++; ?>
					<tr>
						<td><?= h($i) ?></td>
						<td><?= h($customer->customer_name) ?></td>
						<td><?= h($customer->district->district) ?></td>
						<td><?= h($customer->customer_seg->name) ?></td>
						<td><?= h($customer->tin_no) ?></td>
						<td><?= h($customer->gst_no) ?></td>
						<td><?= h($customer->pan_no) ?></td>
						<td><?= h($customer->ecc_no) ?></td>
						<td class="actions">
							<?php echo $this->Html->link('<i class="fa fa-pencil-square-o"></i>',['action' => 'edit', $customer->id],array('escape'=>false,'class'=>'btn btn-xs blue')); ?>
							<?= $this->Form->postLink('<i class="fa fa-trash"></i> ',
								['action' => 'delete', $customer->id], 
								[
									'escape' => false,
									'class' => 'btn btn-xs btn-danger',
									'confirm' => __('Are you sure ?', $customer->id)
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