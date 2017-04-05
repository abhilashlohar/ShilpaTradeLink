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
		<?php $page_no=$this->Paginator->current('ItemLedgers'); $page_no=($page_no-1)*20; ?>
		<table class="table table-bordered table-striped">
					<thead>
						<tr>
							<th>Sr. No.</th>
							<th>Date</th>
							<th>Item</th>
							<th>Quantity</th>
							<th>Rate</th>
							<th>Amout</th>
						</tr>
					</thead>
					<tbody>
					<?php foreach($ItemLedgers as $ItemLedger){ ?>
						<tr>
							<td><?= h(++$page_no) ?></td>
							<td><?= date('d-m-Y',strtotime($ItemLedger->processed_on)) ?></td>
							<td><?= h($ItemLedger->item->name) ?></td>
							<td><?= h((int)$ItemLedger->quantity) ?></td>
							<td><?= h($ItemLedger->rate) ?></td>
							<td><?= h($ItemLedger->quantity*$ItemLedger->rate) ?></td>
						</tr>
					<?php } ?>
					</tbody>
				</table>
	</div>
</div>