<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption">
			<i class="icon-globe font-blue-steel"></i>
			<span class="caption-subject font-blue-steel uppercase">CUSTOMERS</span>
		</div>
	</div>
	<div class="portlet-body">
		<div class="table-scrollable">
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
					<?php foreach ($customers as $customer): ?>
					<tr>
						<td><?= $this->Number->format($customer->id) ?></td>
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