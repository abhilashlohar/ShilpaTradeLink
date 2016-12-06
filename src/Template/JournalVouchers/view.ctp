<!--
<a class="btn  blue hidden-print margin-bottom-5 pull-right" onclick="javascript:window.print();">Print <i class="fa fa-print"></i></a>
-->
<div style="border:solid 1px #c7c7c7;background-color: #FFF;padding: 10px;margin: auto;width: 95%;font-size: 14px;" class="maindiv" >	
<table width="100%" class="divHeader">
		<tr>
			<td width="50%"><?php echo $this->Html->image('/logos/'.$journalVoucher->company->logo, ['width' => '40%']); ?></td>
			<td align="right" width="50%" style="font-size: 12px;">
			<span style="font-size: 14px;"><?= h($journalVoucher->company->name) ?></span><br/>
			<span><?= $this->Text->autoParagraph(h($journalVoucher->company->address)) ?></span>
			<span><?= h($journalVoucher->company->mobile_no) ?></span>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<div align="center" style="font-size: 16px;font-weight: bold;color: #0685a8;">JOURNAL VOUCHER</div>
				<div style="border:solid 2px #0685a8;margin-bottom:5px;margin-top: 5px;"></div>
			</td>
		</tr>
	</table>
	<table width="100%">
		<tr>
			<td width="50%" valign="top" align="left">
				<table>
					<tr>
						<td>Voucher No</td>
						<td width="20" align="center">:</td>
						<td><?= h(str_pad($journalVoucher->id, 4, '0', STR_PAD_LEFT)) ?></td>
					</tr>
				</table>
			</td>
			<td width="50%" valign="top" align="right">
				<table>
					<tr>
						<td>Date.</td>
						<td width="20" align="center">:</td>
						<td><?= h(date("d-m-Y",strtotime($journalVoucher->transaction_date))) ?></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	
	<div style="height:3px;" class="hdrmargin"></div>
	<table class="table table-advance itmtbl itmtbl2">
	<thead>
	<tr>
	<th>Ledger A/c</th>
	<th>Dr</th>
	<th>Cr</th>
	</tr>
	</thead>
		<tfoot>
			<tr>
				<td><?= h($journalVoucher->Ledger1s->name) ?></td>
				<td><?= h($journalVoucher->amount) ?></td>
				<td>0</td>
			</tr>
			<tr>
				<td><?= h($journalVoucher->Ledger2s->name) ?></td>
				<td>0</td>
				<td><?= h($journalVoucher->amount) ?></td>
			</tr>
			<tr>
				<td></td>
				<td>Total</td>
				<td><?= h($journalVoucher->amount) ?></td>
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
						For <?= h($journalVoucher->company->name) ?><br/><br/><br/><span style="    border-top: solid 1px #585757;">Authorised Signatory</span>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>	
</div>
</div>
