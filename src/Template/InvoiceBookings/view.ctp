<a class="btn  blue hidden-print margin-bottom-5 pull-right" onclick="javascript:window.print();">Print <i class="fa fa-print"></i></a>
<div style="border:solid 1px #c7c7c7;background-color: #FFF;padding: 10px;margin: auto;width: 70%;font-size:14px;" class="maindiv">	
<table width="100%" class="divHeader">
		<tr>
			<td width="50%"><?php echo $this->Html->image('/logos/'.$invoiceBooking->company->logo, ['width' => '40%']); ?></td>
			<td align="right" width="50%" style="font-size: 12px;">
			<span style="font-size: 14px;"><?= h($invoiceBooking->company->name) ?></span><br/>
			<span><?= $this->Text->autoParagraph(h($invoiceBooking->company->address)) ?></span>
			<span><?= h($invoiceBooking->company->mobile_no) ?></span>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<div align="center" style="font-size: 20px;font-weight: bold;color: #0685a8;">INVOICE BOOKING</div>
				<div style="border:solid 2px #0685a8;margin-bottom:5px;margin-top: 5px;"></div>
			</td>
		</tr>
	</table>
		<table width="100%">
		<tr>
			<td width="50%" valign="top" align="left">
				<table>
					<tr>
						<td>Invoice Booking No</td>
						<td width="20" align="center">:</td>
						<td><?= h($invoiceBooking->ib1.'/IB-'.str_pad($invoiceBooking->ib2, 3, '0', STR_PAD_LEFT).'/'.$invoiceBooking->ib3.'/'.$invoiceBooking->ib4) ?></td>
					</tr>
				</table>
			</td>
			<td width="50%" valign="top" align="right">
				<table>
					<tr>
						<td>Date.</td>
						<td width="20" align="center">:</td>
						<td><?= h(date("d-m-Y",strtotime($invoiceBooking->date_created))) ?></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	
</br>
<?php $page_no=$this->Paginator->current('InvoiceBookings'); $page_no=($page_no-1)*20; ?>
<table width="100%" class="table tableitm"  border="0">	
<thead>
	<tr>
		<th >S.No</th>
		<th >Item Name</th>
		<th >Quantity</th>
		<th >Rate</th>
		<th >Amount</th>
	</tr>
</thead>
<tbody>
<?php foreach ($invoiceBooking->invoice_booking_rows as $invoice_booking_row): ?>
	<tr>
		<td><?= h(++$page_no) ?></td>
		<td><?= $invoice_booking_row->item->name; ?></td>
		<td><?= $invoice_booking_row->quantity; ?></td>
		<td><?= $invoice_booking_row->rate; ?></td>
		<td><?= $invoice_booking_row->amount; ?></td>
	</tr>
	<?php endforeach; ?>
</tbody>
<tfoot>
<tr>
	<td colspan="3"></td><td style="font-size:16px; font-weight:bold;"> Total</td><td style="font-size:16px; font-weight:bold; "><?= $invoiceBooking->total ?></td>
	</tr>
	</tfoot>
</table>
<table width="100%" class="divFooter">
	<tr>
		<td align="right">
		<table>
			<tr>
				<td align="center">
				<span style="font-size:17px;">For</span> <span style="font-size: 17px;font-weight: bold;"><?= h($invoiceBooking->company->name)?><br/></span>
				<?php 
				 echo $this->Html->Image('/signatures/'.$invoiceBooking->creator->signature,['height'=>'50px','style'=>'height:50px;']); 
				 ?></br>
				<span style="font-size: 15px;font-weight: bold;">Authorised Signatory</span>
				</br>
				<span style="font-size:15px;"><?= h($invoiceBooking->creator->name) ?></span><br/>
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

