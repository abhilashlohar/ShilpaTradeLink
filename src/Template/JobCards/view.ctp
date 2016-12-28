<?php //pr($jobCard); exit;?>
<div style="border:solid 1px #c7c7c7;background-color: #FFF;padding: 10px;margin: auto;width: 80%;font-size:14px;">
<table width="100%">
	<tr>
		<td width="40%"><?php echo $this->Html->image('/logos/'.$jobCard->company->logo, ['width' => '35%']); ?></td>
		<td valign="bottom" width="20%" align="center" style="font-size:26px;font-weight: bold;color: #0685a8;">JOB CARD</td>
		<td align="right" width="50%" style="font-size: 14px;">
		<span style="font-size: 20px;"><?= h($jobCard->company->name) ?></span><br/>
		<span style="font-size: 15px;"><?= $this->Text->autoParagraph(h($jobCard->company->address)) ?></span>
		<span style="font-size: 15px;"><?= h($jobCard->company->mobile_no) ?></span>
		</td>
	</tr>
</table>
<div style="border:solid 3px #0685a8;margin-bottom:5px;margin-top: 5px;"></div>
<div class="portlet-body form">
	<div class="form-body">
		 <table border="0" align="center" width="100%">
		        <tr>
					<td width="20%"><label style="font-size:105%"><b>SO No</b></label></td>
					<td>:<?= h(($jobCard->sales_order->so1.'/SO-'.str_pad($jobCard->sales_order->so2, 3, '0', STR_PAD_LEFT).'/'.$jobCard->sales_order->so3.'/'.$jobCard	->sales_order->so4))?></td>
					<td width="15%"><label  style="font-size:105%"><b>Customer Name</b></label></td>
					<td>:<?= h($jobCard->customer->customer_name) ?></td>
				</tr>
				<tr>
					<td ><label style="font-size:105%"><b>Job Card No</b></label></td>
					<td>:<?= h(($jobCard->jc1.'/JC-'.str_pad($jobCard->jc2, 3, '0', STR_PAD_LEFT).'/'.$jobCard->jc3.'/'.$jobCard->jc4))?></td>
					<td><label style="font-size:105%"><b>Customer PO No</b></label></td>
					<td>:<?= h($jobCard->customer_po_no)?></td>
				</tr>
				<tr>
					<td><label style="font-size:105%"><b>Required Date</b></label></td>
					<td>:<?= h($jobCard->required_date=date("d-m-Y",strtotime($jobCard->required_date))) ?></td>
					<td><label style="font-size:105%"><b>Dispatch Name</b></label></td>
					<td>:<?= h($jobCard->dispatch_name) ?></td>
				</tr>
				<tr>
					<td><label style="font-size:105%"><b>Dispatch Email</b></label></td>
					<td>:<?= h($jobCard->dispatch_email) ?></td>
					<td><label style="font-size:105%"><b>Dispatch Address</b></label></td>
					<td>:<?= h($jobCard->dispatch_address)?></td>
				</tr>
				<tr>
					<td><label style="font-size:105%"><b>Packing</b></label></td>
					<td>:<?= h($jobCard->packing) ?></td>
					<td><label style="font-size:105%"> </td>
					<td> </td>
				</tr>
			</table>	
	</div>
</div>	
	
<?php if(!empty($jobCard)){ ?>
<div class="portlet-body form">
<table class="table table-bordered table-condensed">
	<thead> 
		<th width="30%"></th>
		<th>
			<table width="97%" align="center">
				<tr>
					<td>Item</td>
					<td width="5%">Quantity</td>
				</tr>
			</table>
		</th>
	</thead>
	<tbody>
		<?php foreach ($jobCard->sales_order->sales_order_rows as $sales_order_row): ?>
		<tr>
			<td valign="top">
			<b><?= $sales_order_row->item->name?></b>
			</td>
			<td>
				<table width="100%">
					<?php foreach($sales_order_row->job_card_rows as $job_card_row): ?> 
					<tr>
						<td><?= $job_card_row->item->name?></td>
						<td width="5%"><?= $job_card_row->quantity?></td>
					</tr>
					<?php endforeach; ?>
				</table>
			</td>
		</tr>
		<?php endforeach; ?>
	</tbody>
</table>
</br>
<table width="96%">
	<tr>
		<td align="right">
		<table>
			<tr>
			    <td align="center">
				<span style="font-size:17px;">For</span> <span style="font-size: 17px;font-weight: bold;"><?= h($jobCard->company->name)?><br/></span>
				<?php 
				 echo $this->Html->Image('/signatures/'.$jobCard->creator->signature,['height'=>'50px','style'=>'height:50px;']); 
				 ?></br>
				<span style="font-size: 15px;font-weight: bold;">Authorised Signatory</span>
				</br>
				<span style="font-size:15px;"><?= h($jobCard->creator->name) ?></span><br/>
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
</div>
<?php } ?>
</div>