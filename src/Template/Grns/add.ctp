<?php //pr($purchase_order); ?>
<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption">
			<i class="icon-globe font-blue-steel"></i>
			<span class="caption-subject font-blue-steel uppercase">Add GRN</span>
		</div>
		<div class="actions">
			<?php echo $this->Html->link('<i class="icon-home"></i> Pull Purchase-Order','/PurchaseOrders/index?pull-request=true',array('escape'=>false,'class'=>'btn btn-xs blue')); ?>
		</div>
	</div>
	<?php if(!empty($purchase_order)) { ?>
	<div class="portlet-body form">
	<?= $this->Form->create($grn,['id'=>'form_sample_3']) ?>
	<div class="form-body">
		<div class="form-body">
			<div class="row">
				<div class="col-md-3">
					<div class="form-group">
						<label class="control-label">Company <span class="required" aria-required="true">*</span></label>
						<br/>
						<?php echo @$purchase_order->company->name; ?>
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group">
						<label class="control-label">GRN No. <span class="required" aria-required="true">*</span></label>
						<div class="row">
							<div class="col-md-4">
								<?php echo $this->Form->input('grn1', ['label' => false,'class' => 'form-control input-sm','readonly','value'=>@$purchase_order->company->alias]); ?>
							</div>
							<div class="col-md-4">
								<?php echo $this->Form->input('grn3', ['label' => false,'class' => 'form-control input-sm','placeholder'=>'File']); ?>
							</div>
							<div class="col-md-4">
								<?php echo $this->Form->input('grn4', ['label' => false,'value'=>'16-17','class' => 'form-control input-sm','readonly']); ?>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="form-group">
						<label class="control-label">Supplier <span class="required" aria-required="true">*</span></label>
						<br/>
						<?php echo @$purchase_order->vendor->company_name; ?>
					</div>
				</div>
				<div class="col-md-2">
					<div class="form-group">
						<label class="control-label">Date</label>
						<br/>
						<?php echo date("d-m-Y"); ?>
					</div>
				</div>
			</div><br/>

		
			<div class="alert alert-danger" id="row_error_item" style="display:none;padding: 5px !important;">
				Please check at least one row.
			</div>
			<table class="table tableitm" id="main_tb">
				<thead>
					<tr>
						<th width="10%">Sr.No. </th>
						<th width="60%">Items</th>
						<th width="20%">Quantity</th>
						<th width="10%"></th>
						
					</tr>
				</thead>
				<tbody>
					<?php if(!empty($purchase_order->purchase_order_rows)){
						$q=0; foreach ($purchase_order->purchase_order_rows as $purchase_order_rows): ?>
						<tr class="tr1" row_no='<?php echo @$purchase_order_rows->id; ?>'>
							<td rowspan="2"><?php echo ++$q; --$q; ?></td>
							<td>
								<?php echo $this->Form->input('q', ['type' => 'hidden','value'=>@$purchase_order_rows->item_id]); 
								echo $purchase_order_rows->item->name;
								?>								
							</td>
							<td>
								<?php echo $this->Form->input('q', ['label' => false,'type' => 'text','class' => 'form-control input-sm quantity','placeholder'=>'Quantity','value' => @$purchase_order_rows->quantity-$purchase_order_rows->processed_quantity,'readonly','min'=>'1','max'=>@$purchase_order_rows->quantity-$purchase_order_rows->processed_quantity]); ?>
							</td>
							<td>
								<label><?php echo $this->Form->input('check.'.$q, ['label' => false,'type'=>'checkbox','class'=>'rename_check','value' => @$purchase_order_rows->id]); ?></label>
							</td>
						</tr>
						<tr class="tr2" row_no='<?php echo @$purchase_order_rows->id; ?>'>
							<td colspan="2">
								<?php echo $this->Text->autoParagraph(h($purchase_order_rows->description)); ?>
							</td>
							<td></td>
						</tr>
					<?php $q++; endforeach; }?>
				</tbody>
			</table>
		</div>
		<div class="form-actions">
			<div class="row">
				<div class="col-md-offset-3 col-md-9">
					<button type="submit" class="btn btn-primary">ADD GRN</button>
				</div>
			</div>
		</div>
		<?= $this->Form->end() ?>
	</div>
	</div>
	<?php } ?>
</div>	
<style>
.table thead tr th {
    color: #FFF;
	background-color: #254b73;
}
</style>



<?php echo $this->Html->script('/assets/global/plugins/jquery.min.js'); ?>
<script>
$(document).ready(function() {
	
	
	$('.rename_check').die().live("click",function() {
		alert();
		//rename_rows();
    });
	
	function rename_rows(){
		alert();
		$("#main_tb tbody tr.tr1").each(function(){
			var row_no=$(this).attr('row_no');
			var val=$(this).find('td:nth-child(4) input[type="checkbox"]:checked').val();
			if(val){
				alert(val);
				$(this).find('td:nth-child(2) input').attr({ name:"grn_rows["+val+"][item_id]"});
				$(this).find('td:nth-child(3) input').attr({ name:"grn_rows["+val+"][quantity]", id:"grn_rows-"+val+"-quantity"}).removeAttr('readonly');
				
				$(this).css('background-color','#fffcda');
				$('#main_tb tbody tr.tr2[row_no="'+row_no+'"]').css('background-color','#fffcda');
			}else{
				$(this).find('td:nth-child(2) input').attr({ name:"q"});
				$(this).find('td:nth-child(3) input').attr({ name:"q", id:"q",readonly:"readonly"});
				
				$(this).css('background-color','#FFF');
				$('#main_tb tbody tr.tr2[row_no="'+row_no+'"]').css('background-color','#FFF');
			}
		}
	});
	
});		
</script>
