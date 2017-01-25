<style>
.page-content-wrapper .page-content{
	padding:5px 5px 5px 5px;
}
#main_tb td,th{
	padding:3px;
}
</style>
<?php pr($inventoryVoucher); exit; ?>
<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption">
			<i class="icon-globe font-blue-steel"></i>
			<span class="caption-subject font-blue-steel uppercase">Add Inventory Voucher</span>
		</div>
		<div class="actions">
		<?php echo $this->Html->link('<i class="fa fa-files-o"></i> Pull Invoice','/Invoices?inventory_voucher=true',array('escape'=>false,'class'=>'btn btn-xs blue')); ?>
		</div>
	</div>
	<div>
	<?php if(@$Invoice){ ?>
		<?= $this->Form->create($inventoryVoucher,['id'=>'form_sample_3']) ?>
		<table border="1" width="80%" id="main_tb">
			<thead>
			<tr>
				<th width="40%">PRODUCTION</th>
				<th>CONSUMPTION</th>
			</tr>
			</thead>
			<tbody id="maintbody">
			<?php 
			$i=0;
			foreach($inventoryVoucher->invoice_rows as $invoice_row){ ?>
				<tr class="main_tr">
					<td>
					<?= h($invoice_row->item->name) ?> (<?= h($invoice_row->quantity) ?>)
					<?php echo $this->Form->input('invoice_row_id', ['type' => 'hidden','label' => false,'value' => $invoice_row->id]); ?>
					</td>
					<td>
					<table>
						<tbody>
						<?php foreach($job_card_data[$invoice_row->item_id] as $job_card_row){ ?>
							<tr>
								<td>
								<?php echo $this->Form->input('invoice_row_id', ['type' => 'hidden','value'=>$invoice_row->id]); ?>
								<?php echo $this->Form->input('inventory_voucher_rows.'.$i.'.item_id', ['orphans' => $items,'label' => false,'class' => 'form-control input-sm','value' => $job_card_row->item_id]); ?>
								</td>
								<td>
								<?php echo $this->Form->input('inventory_voucher_rows.'.$i.'.quantity', ['type' => 'text','label' => false,'class' => 'form-control input-sm','value' => $job_card_row->quantity]); ?>
								</td>
								<td>
								<a class="btn btn-xs btn-default addrow" href="#" role='button'><i class="fa fa-plus"></i></a><a class="btn btn-xs btn-default deleterow" href="#" role='button'><i class="fa fa-times"></i></a>
								</td>
							</tr>
						<?php $i++; } ?>
						</tbody>
					</table>
					</td>
				</tr>
			<?php } ?>
			</tbody>
		</table>
		<button type="submit" class="btn btn-primary" >GENERATE QUOTATION</button>
		<?= $this->Form->end() ?>
	<?php } ?>
	</div>
</div>
<?php echo $this->Html->script('/assets/global/plugins/jquery.min.js'); ?>
<script>
$(document).ready(function() {
	rename_rows_name();
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
	
	function rename_rows_name(){
		var i=0; 
		$("#main_tb tbody#maintbody tr.main_tr").each(function(){
			var invoice_row_id=$(this).find("td:nth-child(1) input[type=hidden]:nth-child(1)").val();
			var sr=0;
			$(this).find("td:nth-child(2) table tbody tr").each(function(){
				i++; sr++;
				$(this).find("td:nth-child(1) input[type=hidden]").attr({name:"inventory_voucher_rows["+i+"][invoice_row_id]"}).val(invoice_row_id);
				$(this).find("td:nth-child(1) select").attr({name:"inventory_voucher_rows["+i+"][item_id]", id:"inventory_voucher_rows-"+i+"-item_id"}).select2();
				$(this).find("td:nth-child(2) input").attr({name:"inventory_voucher_rows["+i+"][quantity]", id:"inventory_voucher_rows-"+i+"-quantity"});
			});
		});
	}
});
</script>
<table id="sample_tb" style="display:none;">
	<tbody>
	<tr>
		<td>
		<?php echo $this->Form->input('invoice_row_id', ['type' => 'hidden']); ?>
		<?php echo $this->Form->input('item_id', ['orphans' => $items,'empty'=>'--select--','label' => false,'class' => 'form-control input-sm']); ?>
		</td>
		<td>
		<?php echo $this->Form->input('quantity', ['type' => 'text','label' => false,'class' => 'form-control input-sm']); ?>
		</td>
		<td>
		<a class="btn btn-xs btn-default addrow" href="#" role='button'><i class="fa fa-plus"></i></a><a class="btn btn-xs btn-default deleterow" href="#" role='button'><i class="fa fa-times"></i></a>
		</td>
	</tr>
	</tbody>
</table>