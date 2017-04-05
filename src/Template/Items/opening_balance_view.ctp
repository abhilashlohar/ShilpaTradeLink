<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption">
			<i class="icon-globe font-blue-steel"></i>
			<span class="caption-subject font-blue-steel">Item opening balance view</span>
		</div>
		
		<div class="actions">
			<?= $this->Html->link(
				'Add',
				'/Items/Opening-Balance'
			); ?>
			<?= $this->Html->link(
				'View',
				'/Items/Opening-Balance-View'
			); ?>
		</div>
	</div>
	<div class="portlet-body form">
		<?php $page_no=$this->Paginator->current('Quotations'); $page_no=($page_no-1)*20; ?>
		<table class="table table-bordered table-striped">
					<thead>
						<tr>
							<th>Sr. No.</th>
							<th>Ref. No.</th>
							<th>Customer</th>
							<th>Salesman</th>
							<th>Product</th>
						</tr>
					</thead>
					<tbody>
					<?php foreach($ItemLedgers as $ItemLedger){ ?>
						<tr>
							<td>Sr. No.</td>
							<td>Ref. No.</td>
							<td>Customer</td>
							<td>Salesman</td>
							<td>Product</td>
						</tr>
					<?php } ?>
					</tbody>
				</table>
	</div>
</div>