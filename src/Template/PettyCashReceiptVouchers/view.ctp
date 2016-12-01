
<a class="btn  blue hidden-print margin-bottom-5 pull-right" onclick="javascript:window.print();">Print <i class="fa fa-print"></i></a>

<div style="border:solid 1px #c7c7c7;background-color: #FFF;padding: 10px;margin: auto;width: 85%;font-size: 14px;" class="maindiv">	
<table width="100%" class="divHeader">
		<tr>
			<td width="50%"><?php echo $this->Html->image('/logos/'.$pettyCashReceiptVoucher->company->logo, ['width' => '40%']); ?></td>
			<td align="right" width="50%" style="font-size: 12px;">
			<span style="font-size: 16px;"><?= h($pettyCashReceiptVoucher->company->name) ?></span><br/>
			<span><?= $this->Text->autoParagraph(h($pettyCashReceiptVoucher->company->address)) ?></span>
			<span><?= h($pettyCashReceiptVoucher->company->mobile_no) ?></span>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<div align="center" style="font-size: 16px;font-weight: bold;color: #0685a8;">PETTY CASH VOUCHER</div>
				<div style="border:solid 2px #0685a8;margin-bottom:15px;margin-top: 5px;"></div>
			</td>
		</tr>
	</table>
	<table width="100%">
		<tr>
			<td width="50%" valign="top" align="right">
				<table>
					<tr>
						<td>Date.</td>
						<td width="20" align="center">:</td>
						<td><?= h(date("d-M-Y",strtotime($pettyCashReceiptVoucher->transaction_date))) ?></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	
	<div style="height:30px;" class="hdrmargin"></div>
	<table class="table table-advance itmtbl itmtbl2">
		<tfoot>
				<tr>
				<td><b>Recieved by Mr./Ms.:</b></td>
				<td><?= h($pettyCashReceiptVoucher->ReceivedFrom->name) ?></td>
			</tr>
			<tr>
				<td><b>Amount :</b></td>
				<td><?= h($pettyCashReceiptVoucher->amount) ?></td>
			</tr>
			
			<tr>
				<td><b>Amount in words: </b> </td>
				<td><?php echo $this->NumberWords->convert_number_to_words($pettyCashReceiptVoucher->amount) ?> </td>
			</tr>
			
			<tr>
				<td><b>By: </b> </td>
				<td><?= h($pettyCashReceiptVoucher->payment_mode) ?> </td>
			</tr>
			<tr>
				<td><b>On Account Of: </b> </td>
				<td><?= h($pettyCashReceiptVoucher->BankCash->name) ?> </td>
			</tr>
			<tr>
				<td><b>Narration: </b> </td>
				<td><?= $this->Text->autoParagraph(h($pettyCashReceiptVoucher->narration)) ?> </td>
			</tr>
		</tfoot>
	</table>
	<table width="100%" class="divFooter">
		<tr>
			<td></td>
			<td align="right">
				<table>
					<tr>
						<td align="center">
						For <?= h($pettyCashReceiptVoucher->company->name) ?><br/><br/><br/><span style="    border-top: solid 1px #585757;">Authorised Signatory</span>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>	
</div>
</div>
