<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption">
			<i class="icon-globe font-blue-steel"></i>
			<span class="caption-subject font-blue-steel uppercase">CUSTOMERS</span>
		</div>
	</div>
	<div class="portlet-body">
		<div class="table-scrollable">
			<?php $page_no=$this->Paginator->current('Customers'); $page_no=($page_no-1)*20; ?>
			 <table class="table table-hover">
				 <thead>
					<tr>
						<th>Sr. No.</th>
						<th>Customer Name</th>
						<th>Over-Due</th>
					</tr>
				</thead>
				<tbody>
					<?php foreach ($customers as $customer): 
					$due=0;
						foreach($customer->invoices as $invoice){
							$due+=$invoice->due_payment;
						} ?>
					<tr>
						<td><?= h(++$page_no) ?></td>
						<td><?= h($customer->customer_name) ?></td>
						<td>
						<?= $this->Html->link(
							$this->Number->format($due,[ 'places' => 2]),
							'/Invoices/Due-Invoices/'.$customer->id,
							['target' => '_blank']
						); ?>
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