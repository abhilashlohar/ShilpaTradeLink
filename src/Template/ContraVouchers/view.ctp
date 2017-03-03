<style>
@media print{
.maindiv{
width:100% !important;
}	
	
}
</style>
<a class="btn  blue hidden-print margin-bottom-5 pull-right" onclick="javascript:window.print();">Print <i class="fa fa-print"></i></a>

<div style="border:solid 1px #c7c7c7;background-color: #FFF;padding: 10px;margin: auto;width: 55%;font-size: 12px;" class="maindiv">	
<table width="100%" class="divHeader">
		<tr>
			<td width="30%"><?php echo $this->Html->image('/logos/'.$contraVoucher->company->logo, ['width' => '40%']); ?></td>
			<td align="center" width="40%" style="font-size: 12px;"><div align="center" style="font-size: 16px;font-weight: bold;color: #0685a8;">CONTRA VOUCHER</div></td>
			<td align="right" width="30%" style="font-size: 12px;">
			<span style="font-size: 14px;"><?= h($contraVoucher->company->name) ?></span>
			<span><?= $this->Text->autoParagraph(h($contraVoucher->company->address)) ?>
			<?= h($contraVoucher->company->mobile_no) ?></span>
			</td>
		</tr>
		<tr>
			<td colspan="3">
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
						<td><?= h(str_pad($contraVoucher->voucher_no, 4, '0', STR_PAD_LEFT)) ?></td>
					</tr>
				</table>
			</td>
			<td width="50%" valign="top" align="right">
				<table>
					<tr>
						<td>Date.</td>
						<td width="20" align="center">:</td>
						<td><?= h(date("d-m-Y",strtotime($contraVoucher->transaction_date))) ?></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	
	<div style="height:3px;" class="hdrmargin"></div>
	<table class="table table-advance itmtbl itmtbl2">
	<thead>
	<tr>
	<th>Particulars</th>
	<th>Dr</th>
	<th>Cr</th>
	</tr>
	</thead>
		<tfoot>	<tfoot>
			<tr>
				<td><?= h($contraVoucher->CashBankFroms->name) ?></td>
				<td>0</td>
				<td><?= h($contraVoucher->amount) ?></td>
				</tr>
				<tr>
				<td><?= h($contraVoucher->CashBankTos->name) ?> </td>
				<td><?= h($contraVoucher->amount) ?></td>
				<td>0</td>
			</tr>
			
			<tr>
				<td style="font-size: 14px;" ><?= $this->Text->autoParagraph(h($contraVoucher->narration)) ?> </td>
				<td style="font-size: 14px;font-weight: bold;">Total</td>
				<td style="font-size: 14px;font-weight: bold;"><?= h($contraVoucher->amount) ?></td>
			</tr>
			</tr>
		</tfoot>
	</table>
	<br/>
	<table width="100%" class="table_rows ">
    <tr>
	<td align="center" width="25%"> 
	
	</td>
	   <td align="right" width="15%"> 
	
		 <?php 
		 echo $this->Html->Image('/signatures/'.$contraVoucher->creator->signature,['height'=>'50px','style'=>'height:50px;']); 
		 ?></br>
		 </hr>
		 <span><b>Prepared By</b></span><br/>
		 <span><?= h($contraVoucher->creator->name) ?></span><br/>
		</td>
	 </tr>
</table>
</div>
</div>
