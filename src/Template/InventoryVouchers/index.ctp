<?php pr($inventoryVouchers); exit; ?>
<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption">
			<i class="icon-globe font-blue-steel"></i>
			<span class="caption-subject font-blue-steel uppercase">Inventory Vouchers</span>
		</div>
	</div>
	<div class="portlet-body form">
		<!-- BEGIN FORM-->
		
			<div class="form-body">
				<div class="row">
					
					
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">Invoice No <span class="required" aria-required="true">*</span></label>
							
							<?php echo $inventoryVouchers->iv1.'/IN-'.str_pad($$inventoryVouchers->iv2, 3, '0', STR_PAD_LEFT).'/'. $$inventoryVouchers->iv1.'/'. $$inventoryVouchers->iv4; ?>
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">Item Name</label>
							<?php echo $this->Form->input('item_id', ['label' => false,'type'=>'hidden','value'=>$invoiceRows->item_id]); ?>
							<?php echo $inventoryVouchers->invoice_row->item->name; ?>
						</div>
					</div>
				</div>	
				
				<div class="table-scrollable">
					<table class="table tableitm" id="main_tb">
						<thead>
							<tr>
								<th width="50">Sr.No. </th>
								<th>Items</th>
								<th width="130">Quantity</th>
								
								<th width="70"></th>
							</tr>
						</thead>
						<tbody>
							
						</tbody>
						
					</table>
				</div>
				
	
			</div>
		</div>

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

<script>
$( function() {
$( "#sortable" ).sortable();
$( "#sortable" ).disableSelection();
} );
</script>
