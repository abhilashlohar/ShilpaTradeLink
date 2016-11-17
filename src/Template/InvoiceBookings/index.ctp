<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption">
			<i class="icon-globe font-blue-steel"></i>
			<span class="caption-subject font-blue-steel uppercase">Invoice Book</span>
			
		</div>
		<div class="actions">
			<div class="btn-group">
			
			</div>
		</div>
	</div>
	<div class="portlet-body">
		<div class="row">
			<div class="col-md-12">
				<?php $page_no=$this->Paginator->current('Invoices'); $page_no=($page_no-1)*20; ?>
				<table class="table table-bordered table-striped table-hover">
					<thead>
						<tr>
							<th>Sr. No.</th>
							<th>Invoice No.</th>
							<th>Date Created</th>
							<th>Actions</th>
						</tr>
					</thead>
					<tbody>
					<?php foreach ($invoiceBookings as $invoiceBooking): ?>
						<tr>
							<td><?= h(++$page_no) ?></td>
							<td><?= h($invoiceBooking->invoice_no) ?></td>
							<td><?php echo date("d-m-Y",strtotime($invoiceBooking->created_on)) ?></td>
							<td class="actions">
								<?= $this->Html->link(__('Edit'), ['action' => 'edit', $invoiceBooking->id]) ?>
								
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

