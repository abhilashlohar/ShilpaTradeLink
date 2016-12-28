<a class="btn  blue hidden-print margin-bottom-5 pull-right" onclick="javascript:window.print();">Print <i class="fa fa-print"></i></a>
<div style="border:solid 1px #c7c7c7;background-color: #FFF;padding: 10px;margin: auto;width: 70%;font-size:14px;" class="maindiv">	
<table width="100%" class="divHeader">
<tr>
	<td><?php echo $this->Html->image('/logos/'.$grn->company->logo, ['width' => '48%']); ?></td>
    <td valign="bottom" width="30%" align="center" style="font-size:30px;font-weight: bold;color: #0685a8;">GRN</td>
	<td align="right" width="36%" style="font-size: 14px;"> 
	<span style="font-size: 20px;"><?= h($grn->company->name) ?></span><br/>
	<span style="font-size: 15px;"><?= $this->Text->autoParagraph(h($grn->company->address)) ?></span>
	<span><?= h($grn->company->mobile_no) ?></span>
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
					<td align="center" width="8%"><label style="font-size: 14px;font-weight: bold;">GRN No</label></td>
					<td align="center">:<?= h($grn->grn1)?></td>
					<td align="right" width="76%"<label style="font-size: 14px;font-weight: bold;">Date</label></td>
					<td align="center">:<?= h(date("d-m-Y",strtotime($grn->date_created))) ?> </td>
				</tr>
			</table>
	   </td>
	</tr>
</table>	
</br>
<?php $page_no=$this->Paginator->current('Grns'); $page_no=($page_no-1)*20; ?>
<table width="100%" class="table tableitm"  border="0">	
<thead>
	<tr>
		<th width="45%">S.No</th>
		<th>Item Name</th>
		<th width="8%">Quantity</th>
	</tr>
</thead>
<tbody>
<?php foreach ($grn->grn_rows as $grn_row): ?>
	<tr>
		<td><?= h(++$page_no) ?></td>
		<td><?= $grn_row->item->name; ?></td>
		<td><?= $grn_row->quantity; ?></td>
	</tr>
<?php endforeach; ?>
</tbody>
</table>
<table width="100%" class="divFooter">
	<tr>
		<td align="right">
		<table>
			<tr>
				<td align="center">
				<span style="font-size:17px;">For</span> <span style="font-size: 17px;font-weight: bold;"><?= h($grn->company->name)?><br/></span>
				<?php 
				 echo $this->Html->Image('/signatures/'.$grn->creator->signature,['height'=>'50px','style'=>'height:50px;']); 
				 ?></br>
				<span style="font-size: 15px;font-weight: bold;">Authorised Signatory</span>
				</br>
				<span style="font-size:15px;"><?= h($grn->creator->name) ?></span><br/>
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>	
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

