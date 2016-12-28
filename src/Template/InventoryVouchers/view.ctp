<a class="btn  blue hidden-print margin-bottom-5 pull-right" onclick="javascript:window.print();">Print <i class="fa fa-print"></i></a>
<div style="border:solid 1px #c7c7c7;background-color: #FFF;padding: 10px;margin: auto;width: 70%;font-size: 12px;" class="maindiv">
<table width="100%" class="divHeader" border="0">
<tr>
	<td><?php echo $this->Html->image('/logos/'.$inventoryVoucher->company->logo, ['width' => '48%']); ?></td>
    <td valign="bottom" width="30%" align="center" style="font-size:23px;font-weight: bold;color: #0685a8;">INVENTORY VOUCHER</td>
	<td align="right" style="font-size: 14px;" width="36%"> 
	<span style="font-size: 20px;"><?= h($inventoryVoucher->company->name) ?></span><br/>
	<span style="font-size: 15px;"><?= $this->Text->autoParagraph(h($inventoryVoucher->company->address)) ?></span>
	<span><?= h($inventoryVoucher->company->mobile_no) ?></span>
	</td>
</tr>
</table>
<div style="border:solid 3px #0685a8;margin-bottom:5px;margin-top: 5px;"></div>
</br>
<table width="100%">
	<tr>
		<td width="50%" valign="top" align="left">
			<table border="0" width="100%">
				<tr>
					<td align="center" width="10%"><label style="font-size: 14px;font-weight: bold;">Invoice No </label></td>
					<td align="center">:<?php echo $inventoryVoucher->invoice->in1.'/IN-'.str_pad($inventoryVoucher->invoice->in2, 3, '0', STR_PAD_LEFT).'/'. $inventoryVoucher->invoice->in3.'/'. $inventoryVoucher->invoice->in4; ?></td>
					<td align="right"><label style="font-size: 14px;font-weight: bold;">Item Name</label></td>
					<td align="center">:<?php echo $inventoryVoucher->item->name; ?></td>
					<td align="right" width=" "<label style="font-size: 14px;font-weight: bold;">Inventory Voucher No</label></td>
					<td align="center">:<?= h($inventoryVoucher->iv1.'/IV'.str_pad($inventoryVoucher->iv2, 3, '0', STR_PAD_LEFT).'/'.$inventoryVoucher->iv3.'/'.$inventoryVoucher->iv4) ?></td>
				</tr>
			</table>
	   </td>
	</tr>
</table>	
</br>
<?php $page_no=0; ?>	
<table class="table tableitm" align="center" border="0">
<thead>
	<tr>
		<th width="45%">Sr.No.</th>
		<th>Item Name</th>
		<th width="8%">Quantity</th>
	</tr>
</thead>
<tbody>
<?php foreach ($inventoryVoucher->inventory_voucher_rows as $inventoryVoucherRows): ?>
	<tr>
		<td><?= h(++$page_no)?></td>
		<td><?= h($inventoryVoucherRows->item->name)?></td>
		<td><?= h($inventoryVoucherRows->quantity) ?></td>
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
 
 