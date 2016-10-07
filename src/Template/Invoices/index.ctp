<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption">
			<i class="icon-globe font-blue-steel"></i>
			<span class="caption-subject font-blue-steel uppercase">Invoices</span>
		</div>
	</div>
	<div class="portlet-body">
		<div class="row">
			<div class="col-md-12">
				<table class="table table-bordered table-striped table-hover">
					<thead>
						<tr>
							<th>Sr. No.</th>
							<th>Invoice No.</th>
							<th>Customer</th>
							<th>Date</th>
							<th>Total</th>
							<th>Actions</th>
						</tr>
					</thead>
					<tbody>
						<?php $i=0; foreach ($invoices as $invoice): $i++; ?>
						<tr>
							<td><?= $i; ?></td>
							<td><?= h(($invoice->in1.'/IN-'.str_pad($invoice->id, 3, '0', STR_PAD_LEFT).'/'.$invoice->in3.'/'.$invoice->in4)) ?></td>
							<td><?= h($invoice->customer->customer_name) ?></td>
							<td><?php echo date("d-m-Y",strtotime($invoice->date_created)); ?></td>
							<td><?= h($invoice->total_after_pnf) ?></td>
							<td class="actions">
								<?php echo $this->Html->link('<i class="fa fa-search"></i>',['action' => 'confirm', $invoice->id],array('escape'=>false,'target'=>'_blank','class'=>'btn btn-xs yellow')); ?>
								<!--<?php echo $this->Html->link('<i class="fa fa-pencil-square-o"></i>',['action' => 'edit', $invoice->id],array('escape'=>false,'class'=>'btn btn-xs blue')); ?>-->
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
