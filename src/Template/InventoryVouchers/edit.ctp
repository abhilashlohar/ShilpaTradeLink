<?php ?>
<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption">
			<i class="icon-globe font-blue-steel"></i>
			<span class="caption-subject font-blue-steel uppercase">Edit Inventory Vouchers</span>
		</div>
	</div>
	<div class="portlet-body form">
		<!-- BEGIN FORM-->
		<?= $this->Form->create($inventoryVoucher,['id'=>'form_sample_3']) ?>
			<div class="row">
				<div class="col-md-5">
					<div class="form-group">
						<label class="col-md-5 control-label">Voucher No. </label>
						<div class="col-md-7">
						<?php echo $this->Form->input('iv1', ['label' => false,'type'=>'hidden','value'=>$inventoryVoucher->iv1]); ?>
						<?php echo $this->Form->input('iv2', ['label' => false,'type'=>'hidden','value'=>$inventoryVoucher->iv2]); ?>
						<?php echo $this->Form->input('iv3', ['label' => false,'type'=>'hidden','value'=>$inventoryVoucher->iv3]); ?>
						<?php echo $this->Form->input('iv4', ['label' => false,'type'=>'hidden','value'=>$inventoryVoucher->iv4]); ?>
						<?php echo $inventoryVoucher->iv1.'/IV-'.str_pad($inventoryVoucher->iv2, 3, '0', STR_PAD_LEFT).'/'.$inventoryVoucher->iv3.'/'.$inventoryVoucher->iv4; ?>
						</div>
					</div>
				</div>
			</div><br/>
			
			
				<table width="100%" id="main_tb" border="1">
					<thead>
						<th width="30%" class="text-center"><label class="control-label">Production</label></th>
						<th align="center" class="text-center"><label class="control-label">Consumption</label></th>
					</thead>
					<tbody id="maintbody"><?php $p=0; $q=0; $r=0; ?>
					<?php 
					foreach ($inventoryVoucher->sales_order->sales_order_rows as $sales_order_row): ?> 
						
						<tr class="main_tr">
							<td valign="top" align="center">
							<?php echo $this->Form->input('sales_order_id', ['type'=>'text','empty'=>'--Select--','class' => 'form-control input-sm','label'=>false,'value'=>$sales_order_row->id,'type'=>'hidden']); ?>
							<?php echo $this->Form->input('sales_order_row_quantity', ['class' => 'form-control input-sm','type'=>'hidden','label'=>false,'value'=>$sales_order_row->quantity]); ?>
							<br/><b><?= h($sales_order_row->item->name) ?> ( <?= h($sales_order_row->quantity) ?> )</b>
							</td>
							
							<td>
							<?php if(sizeof($sales_order_row->inventory_voucher_rows)>0){ ?>
							<?php  $page_no=$this->Paginator->current('SalesOrders'); $page_no=($page_no-1)*20; ?>	
							<div>
								
								<table class="table">
									<thead>
										<th>Sr</th>
										<th width="60%">Item</th>
										<th>Quantity</th>
										<th width="15%"></th>
									</thead>
									<tbody>
										<?php  foreach($sales_order_row->inventory_voucher_rows as $inventory_voucher_row): ?> 
											<tr>
												<td align="center"><?= h(++$page_no) ?></td>
												
												<td>
												<?php echo $this->Form->input('inventory_voucher_rows['.$p.'][sales_order_row_id]',['class' => 'form-control input-sm','type'=>'hidden','label'=>false,'value'=>$inventory_voucher_row->sales_order_row_id]); ?>
												<?php echo $this->Form->input('inventory_voucher_rows['.$p.'][sales_order_row_quantity]', ['class' => 'form-control input-sm','type'=>'hidden','label'=>false,'value'=>$sales_order_row->quantity,'type'=>'text']); ?>
												<?php echo $this->Form->input('inventory_voucher_rows['.$p.'][item_id]',['empty'=>'--Select--','options'=>$items,'class' => 'form-control input-sm ','label'=>false,'value'=>$inventory_voucher_row->item_id]); ?>
												</td>
												<td><?php echo $this->Form->input('inventory_voucher_rows['.$p.'][quantity]',['class' => 'form-control input-sm','placeholder'=>'Quantity','label'=>false,'value'=>$inventory_voucher_row->quantity]); ?></td>
												<td><a class="btn btn-xs btn-default addrow" href="#" role='button'><i class="fa fa-plus"></i></a><a class="btn btn-xs btn-default deleterow" href="#" role='button'><i class="fa fa-times"></i></a></td>
												
											</tr>
										<?php $p++;  endforeach; ?>
										
									</tbody>
								</table>
							</div>
							<?php } ?>
							</td>
							
						</tr>
						<?php  endforeach; ?>
					</tbody>
				</table>
			</div>
			
			<?php echo $this->Form->input('sales_order_id', ['type'=>'hidden','value' => @$inventoryVoucher->sales_order_id]); ?>
			
			<div class="form-actions">
				 <button type="submit" class="btn blue-hoki">Update Inventory Vouchers</button>
			</div>
		<?= $this->Form->end() ?>
		<!-- END FORM-->
	</div>
</div>

<?php echo $this->Html->script('/assets/global/plugins/jquery.min.js'); ?>
<style>
#sortable li{
	cursor: -webkit-grab;
}
 
.table thead tr th {
    color: #FFF;
	background-color: #254b73;
}
</style>
<?php echo $this->Html->css('/drag_drop/jquery-ui.css'); ?>
<?php echo $this->Html->script('/drag_drop/jquery-1.12.4.js'); ?>
<?php echo $this->Html->script('/drag_drop/jquery-ui.js'); ?>

<?php echo $this->Html->script('/assets/global/plugins/jquery.min.js'); ?>
<script>
$(document).ready(function() {


	$('.addrow').die().live("click",function() {
		var tr1=$("#sample_tb tbody").html();
		$(this).closest('table tbody').append(tr1);
		rename_rows_name();
    });
	
	$('.deleterow').die().live("click",function() {
		var l=$(this).closest("table tbody").find("tr").length;
		if (confirm("Are you sure to remove row ?") == true) {
			if(l>1){  
			 $(this).closest('tr').remove();
				rename_rows_name();
			}
		} 
    });
	rename_rows_name();
	function rename_rows_name(){
		var i=0; 
		$("#main_tb tbody#maintbody tr.main_tr").each(function(){
			var sales_order_row_id=$(this).find("td:nth-child(1) input").val();
			var sales_order_row_quantity=$(this).find("td:nth-child(1) input[type=hidden]:nth-child(2)").val();
			$(this).find("td:nth-child(2) textarea").attr({name:"inventory_voucher_rows["+i+"][remark]", id:"inventory_voucher_rows-"+i+"-remark"});
			
			var sr=0;
			$(this).find("td:nth-child(2) table tbody tr").each(function(){
				
				 sr++;
				$(this).find('td:nth-child(1)').html(sr);
				$(this).find('td:nth-child(2) input[type="hidden"]:nth-child(1)').attr({name:"inventory_voucher_rows["+i+"][sales_order_row_id]", id:"inventory_voucher_rows-"+i+"-sales_order_row_id"}).val(sales_order_row_id);
				$(this).find('td:nth-child(2) input[type="hidden"]:nth-child(2)').attr({name:"inventory_voucher_rows["+i+"][sales_order_row_quantity]", id:"inventory_voucher_rows-"+i+"-sales_order_row_quantity"}).val(sales_order_row_quantity);
				$(this).find("td:nth-child(2) select").attr({name:"inventory_voucher_rows["+i+"][item_id]", id:"inventory_voucher_rows-"+i+"-item_id"}).select2();
				$(this).find("td:nth-child(3) input").attr({name:"inventory_voucher_rows["+i+"][quantity]", id:"inventory_voucher_rows-"+i+"-quantity"}); i++;
			});
		
		});
	}
});
</script>

<table id="sample_tb" style="display:none;">
	<tbody>
		<tr>
			<td>0</td>
			<td>
			<?php echo $this->Form->input('sales_order_row_id',['class' => 'form-control input-sm','type'=>'hidden','label'=>false]); ?>
			<?php echo $this->Form->input('sales_order_row_quantity',['class' => 'form-control input-sm','type'=>'hidden','label'=>false]); ?>
			<?php echo $this->Form->input('item_id',['empty'=>'--Select--','options'=>$items,'class' => 'form-control input-sm','label'=>false]); ?>
			</td>
			<td><?php echo $this->Form->input('quantity',['class' => 'form-control input-sm','placeholder'=>'Quantity','label'=>false]); ?></td>
			<td><a class="btn btn-xs btn-default addrow" href="#" role='button'><i class="fa fa-plus"></i></a><a class="btn btn-xs btn-default deleterow" href="#" role='button'><i class="fa fa-times"></i></a></td>
		</tr>
		
	</tbody>
</table>