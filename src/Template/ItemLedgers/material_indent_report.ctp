<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption">
			<i class="icon-globe font-blue-steel"></i>
			<span class="caption-subject font-blue-steel uppercase">Material Indent Report</span>
		</div>
		<div class="portlet-body">
			<?= $this->Form->create($mit) ?>
			<div class="row">
				<div class="col-md-12">
				
				<?php $page_no=$this->Paginator->current('ItemLedgers'); $page_no=($page_no-1)*20; ?>
				<table class="table tableitm" id="main_tb">
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
						<tr class="tr1" row_no='<?php echo @$i; ?>'>
						<td><?php echo $i; ?> </td>
						<td><?php echo $item_name; ?></td>
						<td><?php echo $Current_Stock; ?></td>
						<td><?php echo @$sales_order; ?></td>
						<td><?php echo $job_card_qty; ?></td>
						<td><?php echo $Current_Stock-@$sales_order-$job_card_qty; ?></td>
						<td><label><?php echo $this->Form->input('check[]', ['label' => false,'type'=>'checkbox','class'=>'rename_check','value' => @$item_id,'hiddenField'=>false]);  ?>
						
						<?php echo $this->Form->input('suggestindent.'.$item_id, ['label' => false,'type'=>'hidden','value' => @abs($Current_Stock-@$sales_order-$job_card_qty)]); ?>
						
						
						</label>
						</td>						
						</tr>
						<?php } ?>
					</tbody>
				</table>
					<div class="form-actions">
				<button type="submit" class="btn btn-primary">Submit</button>
			</div>
				<div class="paginator">
					<ul class="pagination">
						
					</ul>
					<p></p>
				</div>
				</div>
			</div>
			<?= $this->Form->end() ?>		
		</div>
	</div>
</div>
<?php echo $this->Html->script('/assets/global/plugins/jquery.min.js'); ?>

<script>

$(document).ready(function() {
	$('.rename_check').die().live("click",function() {
 		rename_rows();
    })
	var p=0;
	function rename_rows(){ 
		$("#main_tb tbody tr.tr1").each(function(){
			var val=$(this).find('td:nth-child(7) input[type="checkbox"]:checked').val();
			if(val){
				/* //var item_id=$(this).find('td:nth-child(7) input[type="hidden"]:nth-child(1)').val();
				var suggestindent=$(this).find('td:nth-child(7) input[type="hidden"]:nth-child(2)').val();
				var qty=$(this).find('td:nth-child(7) input[type="hidden"]:nth-child(3)').val();
				//alert(item_id);
				$(this).find('td:nth-child(7) input[type="hidden"]:nth-child(1)').attr({ name:"item_id"}).val(val);
				$(this).find('td:nth-child(7) input[type="hidden"]:nth-child(2)').attr({ name:"suggestindent"}).val(suggestindent);
				$(this).find('td:nth-child(7) input[type="hidden"]:nth-child(3)').attr({ name:"qty"}).val(qty); */
 				$(this).css('background-color','#fffcda');
 			}else{
				/* $(this).find('td:nth-child(2) input').attr({ name:"q"});
				$(this).find('td:nth-child(3) input').attr({ name:"q", id:"q",readonly:"readonly"}); */
 				$(this).css('background-color','#FFF');
				
			}
		});
	}	
		
		//rename_rows();
    
});		
</script>