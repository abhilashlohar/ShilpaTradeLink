<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption">
			<i class="icon-globe font-blue-steel"></i>
			<span class="caption-subject font-blue-steel uppercase">Vendors</span>
		</div>
	</div>
	<div class="portlet-body">
		<div class="row">
			<div class="col-md-12">
				<table class="table table-bordered table-striped table-hover">
					<thead>
						<tr>
							<th><?= $this->Paginator->sort('id') ?></th>
							<th><?= $this->Paginator->sort('company_name') ?></th>
							<th><?= $this->Paginator->sort('tin_no') ?></th>
							<th><?= $this->Paginator->sort('gst_no') ?></th>
							<th><?= $this->Paginator->sort('ecc_no') ?></th>
							<th><?= $this->Paginator->sort('pan_no') ?></th>
							<th><?= $this->Paginator->sort('payment_terms') ?></th>
							<th><?= $this->Paginator->sort('mode_of_payment') ?></th>
							<th><?= $this->Paginator->sort('item_group_id') ?></th>
							<th class="actions"><?= __('Actions') ?></th>
						</tr>
					</thead>
					<tbody>
						<?php $i=0; foreach ($vendors as $vendor): $i++; ?>
						<tr>
							<td><?= h($i) ?></td>
							<td><?= h($vendor->company_name) ?></td>
							<td><?= h($vendor->tin_no) ?></td>
							<td><?= h($vendor->gst_no) ?></td>
							<td><?= h($vendor->ecc_no) ?></td>
							<td><?= h($vendor->pan_no) ?></td>
							<td><?= $this->Number->format($vendor->payment_terms) ?></td>
							<td><?= h($vendor->mode_of_payment) ?></td>
							<td><?= $this->Number->format($vendor->item_group_id) ?></td>
							<td class="actions">
								<?= $this->Html->link(__('Edit'), ['action' => 'edit', $vendor->id]) ?>
								<?= $this->Form->postLink(__('Delete'), ['action' => 'delete', $vendor->id], ['confirm' => __('Are you sure you want to delete # {0}?', $vendor->id)]) ?>
							</td>
						</tr>
						<?php endforeach; ?>
					</tbody>
				</table>
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
	</div>
</div>
