<?php //pr($inventoryVoucher); exit; ?>
<div style="border:solid 1px #c7c7c7;background-color: #FFF;padding: 10px;margin: auto;width: 100%;font-size: 12px;" class="maindiv">
 
<div style="border:solid 2px #0685a8;margin-bottom:5px;margin-top: 5px;"></div></br>
<div class="portlet-body form">
<?= $this->Form->create($inventoryVoucher)?>
<div class="form-body">
 <div class="row">
	<div class="col-md-4">
		<div class="form-group">
			<label class="col-md-5 control-label">Invoice No </label>
			<div class="col-md-7">
			<?php echo $inventoryVoucher->invoice->in1.'/IN-'.str_pad($inventoryVoucher->invoice->in2, 3, '0', STR_PAD_LEFT).'/'. $inventoryVoucher->invoice->in3.'/'. $inventoryVoucher->invoice->in4; ?>
			</div>
		</div>
	</div>
	<div class="col-md-4">
		<div class="form-group">
			<label class="col-md-5 control-label">Item Name</label>
			 <div class="col-md-7">
			<?php echo $inventoryVoucher->item->name; ?>
			</div>
		</div>
	</div>
	
	<div class="col-md-4">
		<div class="form-group">
			<label class="col-md-5 control-label">Inventory Voucher No</label>
			 <div class="col-md-7">
			  <?= h($inventoryVoucher->iv1.'/IV'.str_pad($inventoryVoucher->iv2, 3, '0', STR_PAD_LEFT).'/'.$inventoryVoucher->iv3.'/'.$inventoryVoucher->iv4) ?>
			</div>
		</div>
	</div>
	
 
	 
</div>
<br/><br/>
<?php $page_no=0; ?>	
	<table class="table tableitm">
		<thead>
			<tr>
			    <th width="20%" align="center">Sr.No.</th>
				<th width="20%" align="center">Item</th>
				<th width="20%" align="center">Quantity</th>
			</tr>
		</thead>
		<tbody>
			 <?php foreach ($inventoryVoucher->inventory_voucher_rows as $inventoryVoucherRows): ?>
			<tr>
			    <td width="20%"><?= h(++$page_no)?></td>
		        <td width="20%"><?= h($inventoryVoucherRows->item->name) ?></td>
				<td width="20%"><?= h($inventoryVoucherRows->quantity) ?></td>
			</tr>
			<?php endforeach;  ?>
		</tbody>
	</table>
	
	 
	
</div>
</div>
 
 
<style>
.table thead tr th {
    color: #FFF;
	background-color: #254b73;
}
.padding-right-decrease{
	padding-right: 0;
}
.padding-left-decrease{
	padding-left: 0;
}
</style>
</div>
 