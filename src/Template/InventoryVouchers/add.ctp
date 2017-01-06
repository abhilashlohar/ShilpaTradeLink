<?php //pr($jobCards); exit; ?>
<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption">
			<i class="icon-globe font-blue-steel"></i>
			<span class="caption-subject font-blue-steel uppercase">Inventory Vouchers</span>
		</div>
		<div class="actions">
		<?php echo $this->Html->link('<i class="fa fa-files-o"></i> Pull Job-Card','/JobCards?inventory_voucher=true',array('escape'=>false,'class'=>'btn btn-xs blue')); ?>
		</div>
	</div>
	
	
	<?php if(!empty($jobCards)){ ?>
	<div class="portlet-body form">
		<!-- BEGIN FORM-->
		 <?= $this->Form->create($inventoryVoucher,['id'=>'form_sample_3']) ?>
			<div class="form-body">

			<div class="row">
				<div class="col-md-4">
					<div class="form-group">
						<label class="col-md-5 control-label">Job Card No</label>
						<div class="col-md-7">
							
							<?= h($jobCards->jc1.'/'.str_pad($jobCards->jc2, 3, '0', STR_PAD_LEFT).'/'.$jobCards->jc3.'/'.$jobCards->jc4) ?>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label class="col-md-5 control-label">Invoice Voucher No. </label>
						<div class="col-md-7">
						<?php echo $this->Form->input('iv1', ['label' => false,'type'=>'hidden','value'=>$jobCards->jc1]); ?>
						<?php echo $this->Form->input('iv2', ['label' => false,'type'=>'hidden','value'=>$last_iv_no->iv2]); ?>
						<?php echo $this->Form->input('iv3', ['label' => false,'type'=>'hidden','value'=>$jobCards->jc3]); ?>
						<?php echo $this->Form->input('iv4', ['label' => false,'type'=>'hidden','value'=>'16-17']); ?>
						<?php echo $jobCards->jc1.'/IV-'.str_pad($last_iv_no->iv2, 3, '0', STR_PAD_LEFT).'/'.$jobCards->jc3.'/'.$jobCards->jc4; ?>
						</div>
					</div>
				</div>

			</div><br/>
				<table width="100%" id="main_tb" border="1">
					<thead>
						<th width="30%">In</th>
						<th>Out</th>
					</thead>
					<tbody id="maintbody"><?php $p=0; $q=0; $r=0; ?>
					<?php foreach ($jobCards->sales_order->sales_order_rows as $sales_order_row): ?>
						<tr class="main_tr">
							<td valign="top">
							<?php echo $this->Form->input('sales_order_id', ['type'=>'text','empty'=>'--Select--','class' => 'form-control input-sm','label'=>false,'value'=>$sales_order_row->id,'type'=>'hidden']); ?>
							<b><?= h($sales_order_row->item->name) ?></b>
							</td>
							
							<td>
								<?php  $page_no=$this->Paginator->current('SalesOrders'); $page_no=($page_no-1)*20; ?>	
								<div>
								<div class="form-group">
										<label class="col-md-3 control-label">Remarks </label>
										<?php   foreach($sales_order_row->job_card_rows as $job_card_row): ?>
										<div class="col-md-9">
											<?php echo $this->Form->textarea('job_card_rows['.$r.'][remark]', ['type' => 'text','label' => false,'class' => 'form-control input-sm','placeholder' => 'Remarks','value'=>$job_card_row->remark]); ?>
										</div><?php $r++; break; endforeach; ?>
								</div>
			<table>
								<thead>
									<th>Sr</th>
									<th width="70%">Item</th>
									<th>Quantity</th>
									<th width="10%"></th>
								</thead>
								<tbody>
									<?php  foreach($sales_order_row->job_card_rows as $job_card_row): ?> 
										<tr>
											<td align="center"><?= h(++$page_no) ?></td>
											
											<td>
											<?php echo $this->Form->input('inventory_voucher_rows['.$p.'][item_id]',['empty'=>'--Select--','options'=>$items,'class' => 'form-control input-sm select2me','label'=>false,'value'=>$job_card_row->item_id]); ?>
											</td>
											<td><?php echo $this->Form->input('inventory_voucher_rows['.$p.'][quantity]',['class' => 'form-control input-sm','placeholder'=>'Quantity','label'=>false,'value'=>$job_card_row->quantity]); ?></td>
											<td><a class="btn btn-xs btn-default addrow" href="#" role='button'><i class="fa fa-plus"></i></a><a class="btn btn-xs btn-default deleterow" href="#" role='button'><i class="fa fa-times"></i></a></td>
											
										</tr>
									<?php $p++;  endforeach; ?>
									
								</tbody>
							</table>
							</div>	
							</td>
						</tr>
						<?php  endforeach; ?>
					</tbody>
				</table>
				
			</div>
	
			<div class="form-actions">
				 <button type="submit" class="btn blue-hoki">Add Inventory Vouchers</button>
			</div>
		<?= $this->Form->end() ?>
		<!-- END FORM-->
	<?php } ?>
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
		alert(l);
		$(this).closest('tr').remove();
    });
	
	function rename_rows_name(){
		var i=0; 
		$("#main_tb tbody#maintbody tr.main_tr").each(function(){
			var sales_order_row_id=$(this).find("td:nth-child(1) input").val();
			
			i++;
			$(this).find("td:nth-child(2) textarea").attr({name:"inventory_voucher_rows["+i+"][remark]", id:"inventory_voucher_rows-"+i+"-remark"});
			i--;
			var sr=0;
			$(this).find("td:nth-child(2) table tbody tr").each(function(){
				
				 sr++;
				$(this).find('td:nth-child(1)').html(sr);
				$(this).find('td:nth-child(2) input[type="hidden"]').attr({name:"inventory_voucher_rows["+i+"][sales_order_row_id]", id:"job_card_rows-"+i+"-sales_order_row_id"}).val(sales_order_row_id);
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
			<?php echo $this->Form->input('item_id',['empty'=>'--Select--','options'=>$items,'class' => 'form-control input-sm','label'=>false]); ?>
			</td>
			<td><?php echo $this->Form->input('quantity',['class' => 'form-control input-sm','placeholder'=>'Quantity','label'=>false]); ?></td>
			<td><a class="btn btn-xs btn-default addrow" href="#" role='button'><i class="fa fa-plus"></i></a><a class="btn btn-xs btn-default deleterow" href="#" role='button'><i class="fa fa-times"></i></a></td>
		</tr>
		
	</tbody>
</table>