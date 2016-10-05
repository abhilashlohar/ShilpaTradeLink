<div class="portlet box blue-hoki">
	<div class="portlet-title">
		<div class="caption">
			<i class="fa fa-comments"></i>Vendors
		</div>
	</div>
	<div class="portlet-body">
		<div class="table-scrollable">
			 <table class="table table-hover">
				 <thead>
					<tr>
						<th>Sr. No.</th>
						<th>Name</th>
						<th>Phone</th>
						<th>Company Name</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
					<?php $i=0; foreach ($vendors as $vendor): $i++; ?>
					<tr>
						<td><?= $i ?></td>
						<td><?= h($vendor->name) ?></td>
						<td><?= $this->Number->format($vendor->phone) ?></td>
						<td><?= h($vendor->company_name) ?></td>
						<td class="actions">
						<?= $this->Html->link(__('Edit'), ['action' => 'edit', $vendor->id]) ?>
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
