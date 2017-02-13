<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption">
			<i class="icon-globe font-blue-steel"></i>
			<span class="caption-subject font-blue-steel uppercase">Material Indent Report</span>
		</div>
		<div class="portlet-body">
			<div class="row">
				<div class="col-md-12">
				<?php $page_no=$this->Paginator->current('ItemLedgers'); $page_no=($page_no-1)*20; ?>
				<table class="table tableitm">
					<thead>
						<tr>
							<th>Sr. No.</th>
							<th>Item Name</th>
							<th>Current Stock</th>
							<th>Sales Order </th>
							<th>Job card  </th>
							<th>Suggested Indent</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<?php $i=0; foreach($material_report as $data){
		$i++;
							$item_name=$data['item_name'];
							$item_id=$data['item_id'];
							$Current_Stock=$data['Current_Stock'];
							$sales_order=$data['sales_order'];
							$job_card_qty=$data['job_card_qty'];

						?>
						<tr>
						<td><?php echo $i; ?> </td>
						<td><?php echo $item_name; ?></td>
						<td><?php echo $Current_Stock; ?></td>
						<td><?php echo @$sales_order; ?></td>
						<td><?php echo $job_card_qty; ?></td>
						<td><?php echo $Current_Stock-@$sales_order-$job_card_qty; ?></td>
						<td><label><?php echo $this->Form->input('check.'.$i, ['label' => false,'type'=>'checkbox','class'=>'rename_check','value' => @$item_id]); ?></label>
						</td>						
						</tr>
						<?php } ?>
					</tbody>
				</table>
				<div class="paginator">
					<ul class="pagination">
						
					</ul>
					<p></p>
				</div>
				</div>
			</div>
		</div>
	</div>
</div>
<?php echo $this->Html->script('/assets/global/plugins/jquery.min.js'); ?>

<script>

$(document).ready(function() {
	$('.rename_check').die().live("click",function() {
		
		//rename_rows();
    })	
});		
</script>