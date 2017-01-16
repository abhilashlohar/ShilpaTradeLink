<a class="btn  blue hidden-print margin-bottom-5 pull-right" onclick="javascript:window.print();">Print <i class="fa fa-print"></i></a>

<div style="border:solid 1px #c7c7c7;background-color: #FFF;padding: 10px;margin: auto;width: 55%;font-size: 14px;" class="maindiv">	
<table width="100%" class="divHeader">
		<tr>
			<td width="50%"><?php echo $this->Html->image('/logos/'.$receiptVoucher->company->logo, ['width' => '40%']); ?></td>
			<td align="right" width="50%" style="font-size: 12px;">
			<span style="font-size: 14px;"><?= h($receiptVoucher->company->name) ?></span><br/>
			<span><?= $this->Text->autoParagraph(h($receiptVoucher->company->address)) ?></span>
			<span><?= h($receiptVoucher->company->mobile_no) ?></span>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<div align="center" style="font-size: 16px;font-weight: bold;color: #0685a8;">RECEIPT VOUCHER</div>
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
						<td><?= h('#'.str_pad($receiptVoucher->voucher_no, 4, '0', STR_PAD_LEFT)) ?></td>
					</tr>
				</table>
			</td>
			<td width="50%" valign="top" align="right">
				<table>
					<tr>
						<td>Date.</td>
						<td width="20" align="center">:</td>
						<td><?= h(date("d-m-Y",strtotime($receiptVoucher->transaction_date))) ?></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	
	<div style="height:3px;" class="hdrmargin"></div>
	<table class="table-advance itmtbl ">
		<tfoot>
			
			<tr>
				<td>Recieved with thanks from
				<?= h($receiptVoucher->ReceivedFrom->name) ?></td>
			</tr>
			<tr><td>Rupees<?php echo ucwords($this->NumberWords->convert_number_to_words($receiptVoucher->amount)) ?> Only </td>
			</tr>
			<tr>
				<td>via <?= h($receiptVoucher->payment_mode) ?> </td>
			</tr>
			<tr>
				<td><?= $this->Text->autoParagraph(h($receiptVoucher->narration)) ?> </td>
			</tr>
		</tfoot>
	</table>
	
	<div style="border:solid 1px ;"></div>
	<table width="100%" class="divFooter">
		<tr>
			<td align="left" valign="top">
				<table>
					<tr>
						<td style="font-size: 16px;font-weight: bold;">
						Rs: <?=h($receiptVoucher->amount) ?>
					</tr>
				</table>
			</td>
			
		</tr>
	</table>
	<br/>
	<table width="100%" class="table_rows ">
    <tr>
	<td align="center" width="25%"> 
	
	</td>
	   <td align="right" width="15%"> 
	
		 <?php 
		 echo $this->Html->Image('/signatures/'.$receiptVoucher->creator->signature,['height'=>'50px','style'=>'height:50px;']); 
		 ?></br>
		 </hr>
		 <span><b>Prepared By</b></span><br/>
		 <span><?= h($receiptVoucher->company->name) ?></span><br/>
		</td>
	 </tr>
</table>
	
</div>
</br>

<div style="border:solid 1px #c7c7c7;background-color: #FFF;padding: 10px;margin: auto;width: 55%;font-size: 14px;" class="maindiv">
<table class="table table-bordered table-condensed">
	<thead> 
		<th>Sr.No</th>
		<th>Reference Type</th>
		<th>Invoice No / Ref No.</th>
		<th>Amount</th>
			
	</thead>
	<tbody>
	
		<?php $i=0; $sum=0; foreach ($receiptVoucher->receipt_breakups as $receipt_breakup): 
		 $url_path="/invoices/confirm/".$receipt_breakup->invoice_id; 
		 ?>
		<tr>
			<td><?php echo ++$i;?></td>
			<td><?= h($receipt_breakup->ref_type) ?></td>
			<td><?php if($receipt_breakup->invoice_id) { ?><?php echo $this->Html->link(($receipt_breakup->invoice->in1.'/IN-'.str_pad($receipt_breakup->invoice->in2, 3, '0', STR_PAD_LEFT).'/'.$receipt_breakup->invoice->in3.'/'.$receipt_breakup->invoice->in4),$url_path,['target' => '_blank']) ?><?php } else { ?> <?= h($receipt_breakup->new_ref_no) ?> <?php }?></td>
			<td><?= h($receipt_breakup->amount) ?></td>
			<?php $sum= $sum+$receipt_breakup->amount; ?>
		</tr>
		<?php endforeach; ?>
		<tr>
			
			<td colspan="3" align="right">Total</td><td><?php echo $sum;?></td>
		</tr>
	</tbody>
</table>
</br>	

</div>
