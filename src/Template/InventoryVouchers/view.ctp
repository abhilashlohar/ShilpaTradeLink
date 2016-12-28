<?php //pr($inventoryVoucher); exit; ?>
<div style="border:solid 1px #c7c7c7;background-color: #FFF;padding: 10px;margin: auto;width: 100%;font-size: 12px;" class="maindiv">
<table width="100%" class="divHeader">
<tr>
	<td width="30%"><?php echo $this->Html->image('/logos/'.$inventoryVoucher->company->logo, ['width' => '38%']); ?></td>
    <td valign="bottom"  align="center" style="font-size:20px;font-weight: bold;color: #0685a8;">INVENTORY VOUCHER</td>
	<td align="right" width="30%" style="font-size: 14px;"> 
	<span style="font-size: 20px;"><?= h($inventoryVoucher->company->name) ?></span><br/>
	<span style="font-size: 15px;"><?= $this->Text->autoParagraph(h($inventoryVoucher->company->address)) ?></span>
	<span><?= h($inventoryVoucher->company->mobile_no) ?></span>
	</td>
</tr>
</table>
<div style="border:solid 3px #0685a8;margin-bottom:5px;margin-top: 5px;"></div>
</br>
<div class="portlet-body form">
<?= $this->Form->create($inventoryVoucher)?>
<div class="form-body">
<div class="row">
	<div class="col-md-4">
		<div class="form-group">
			<label class="col-md-4" width="22%" style="font-size: 14px;font-weight: bold;">Invoice No </label>
			<div class="col-md-7">
			<?php echo $inventoryVoucher->invoice->in1.'/IN-'.str_pad($inventoryVoucher->invoice->in2, 3, '0', STR_PAD_LEFT).'/'. $inventoryVoucher->invoice->in3.'/'. $inventoryVoucher->invoice->in4; ?>
			</div>
		</div>
	</div>
	<div class="col-md-4">
		<div class="form-group">
			<label class="col-md-4" style="font-size: 14px;font-weight: bold;">Item Name</label>
			 <div class="col-md-7">
			<?php echo $inventoryVoucher->item->name; ?>
			</div>
		</div>
	</div>
	<div class="col-md-4">
		<div class="form-group">
			<label class="col-md-4" style="font-size: 14px;font-weight: bold;">Inventory Voucher No</label>
			 <div class="col-md-7">
			  <?= h($inventoryVoucher->iv1.'/IV-'.str_pad($inventoryVoucher->iv2, 3, '0', STR_PAD_LEFT).'/'.$inventoryVoucher->iv3.'/'.$inventoryVoucher->iv4) ?>
			</div>
		</div>
	</div>
</div>
<br/><br/>
<?php $page_no=0; ?>	
<table class="table tableitm" align="center" border="0">
<thead>
	<tr>
		<th width="20%">Sr.No.</th>
		<th width="20%">Item Name</th>
		<th width="20%">Quantity</th>
	</tr>
</thead>
<tbody>
<?php foreach ($inventoryVoucher->inventory_voucher_rows as $inventoryVoucherRows): ?>
	<tr>
		<td><span style="font-size: 13px;"><?= h(++$page_no)?></span></td>
		<td><span style="font-size: 13px;"><?= h($inventoryVoucherRows->item->name) ?></span></td>
		<td><span style="font-size: 13px;"><?= h($inventoryVoucherRows->quantity) ?></span></td>
	</tr>
<?php endforeach;  ?>
</tbody>
</table>
<table width="100%" class="divFooter">
	<tr>
		<td align="right">
		<table>
			<tr>
				<td align="center">
				<span style="font-size:17px;">For</span> <span style="font-size: 17px;font-weight: bold;"><?= h($inventoryVoucher->company->name)?><br/></span>
				<?php 
				 echo $this->Html->Image('/signatures/'.$inventoryVoucher->creator->signature,['height'=>'50px','style'=>'height:50px;']); 
				 ?></br>
				<span style="font-size: 15px;font-weight: bold;">Authorised Signatory</span>
				</br>
				<span style="font-size:15px;"><?= h($inventoryVoucher->creator->name) ?></span><br/>
				</td>
			</tr>
		</table>
		</td>
	</tr>
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
 