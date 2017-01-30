<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption">
			<i class="icon-globe font-blue-steel"></i>
			<span class="caption-subject font-blue-steel ">Item Ledger for "<?php foreach ($itemLedgers as $itemLedger){ echo $itemLedger->item->name; break; } ?>"</span>
		</div>
		<div class="portlet-body">
			<div class="row">
				<div class="col-md-12">
				<?php $page_no=$this->Paginator->current('ItemLedgers'); $page_no=($page_no-1)*20; ?>
				<table class="table table-bordered table-striped table-hover">
					<thead>
						<tr>
							<th>Sr. No.</th>
							<th><?= $this->Paginator->sort('processed_on') ?></th>
							
							<th>In</th>
							<th>Out</th>
						</tr>
					</thead>
					<tbody>
						<?php foreach ($itemLedgers as $itemLedger): 
						$in_out_type=$itemLedger->in_out;
						?>
						<tr>
							
							<td><?= h(++$page_no) ?></td>
							<td><?= h(date("d-m-Y",strtotime($itemLedger->processed_on))) ?></td>
							<td><?php if($in_out_type=='In'){ echo $this->Number->format($itemLedger->quantity); } else { echo '-'; } ?></td>
							<td><?php if($in_out_type=='Out'){ echo $this->Number->format($itemLedger->quantity); } else { echo '-'; } ?></td>
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
</div>