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
							<th>Party</th>
							<th>Customer/Supplier Name</th>
							<th>Voucher No.</th>
							<th>In</th>
							<th>Out</th>
						</tr>
					</thead>
					<tbody>
						<?php foreach ($itemLedgers as $itemLedger): 
						$in_out_type=$itemLedger->in_out;
						$party=$itemLedger->party_type;
						if($party=='Customer')
						{
							$party_name=$itemLedger->party_info->customer_name;
							$voucher_no=$itemLedger->voucher_info->in1.'/IN-'.str_pad($itemLedger->voucher_info->in2, 3, '0', STR_PAD_LEFT).'/'.$itemLedger->voucher_info->in3.'/'.$itemLedger->voucher_info->in4;
						}
						else if($party=='Supplier')
						{
							$party_name=$itemLedger->party_info->company_name;
							$voucher_no=$itemLedger->voucher_info->grn1.'/GRN-'.str_pad($itemLedger->voucher_info->grn2, 3, '0', STR_PAD_LEFT).'/'.$itemLedger->voucher_info->grn3.'/'.$itemLedger->voucher_info->grn4;
							
						}
						else{
							$party_name='-';
							$voucher_no=$itemLedger->voucher_info->iv1.'/IV-'.str_pad($itemLedger->voucher_info->iv2, 3, '0', STR_PAD_LEFT).'/'.$itemLedger->voucher_info->iv3.'/'.$itemLedger->voucher_info->iv4;
						}
						?>
						<tr>
							
							<td><?= h(++$page_no) ?></td>
							<td><?= h(date("d-m-Y",strtotime($itemLedger->processed_on))) ?></td>
							<td><?= h($itemLedger->party_type) ?></td>
							<td><?= h($party_name) ?></td>
							<td><?= h($voucher_no) ?></td>
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


<?php echo $this->Html->script('/assets/global/plugins/jquery.min.js'); ?>

<script>
$(document).ready(function() 
}
</script>