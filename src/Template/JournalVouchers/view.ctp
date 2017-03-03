<?php //pr($journalVoucher->journal_voucher_rows); exit; ?>
<div style="border:solid 1px #c7c7c7;background-color: #FFF;padding: 10px;margin: auto;width: 95%;font-size: 14px;" class="maindiv" >	

<table width="100%" class="divHeader">
			<tr>
				<td width="50%"><?php echo $this->Html->image('/logos/'.$journalVoucher->company->logo, ['width' => '40%']); ?></td>
				<td colspan="2" align="right">
				<span style="font-size: 14px;"><?= h($journalVoucher->company->name) ?></span>
				</td>
			</tr>
			<tr>
				<td width="50%" valign="bottom">
				<div align="right" style="font-size: 28px;font-weight: bold;color: #0685a8;">JOURNAL VOUCHER</div>
				</td>
				<td align="right" width="35%" style="font-size: 12px;">
				<span><?= $this->Text->autoParagraph(h($journalVoucher->company->address)) ?></span>
				<span><?= h($journalVoucher->company->mobile_no) ?></span>
				</td>
			</tr>
			<tr>
				<td colspan="2" >
					<div style="border:solid 2px #0685a8;margin-top: 5px; margin-top:15px;"></div>
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
						<td><?= h('#'.str_pad($journalVoucher->voucher_no, 4, '0', STR_PAD_LEFT)) ?></td>
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
			<?php $sr=0; $dr=0; $cr=0; foreach ($journalVoucher->journal_voucher_rows as $journal_voucher_row): $sr++; ?>
			<tr>
				<td><?= h($journal_voucher_row->ledger_account->name) ?></td>
				<td><?php if($journal_voucher_row->cr_dr=="Dr")
					{ 
					
					$dr=$dr+$journal_voucher_row->amount;
					echo $journal_voucher_row->amount ;
					}else{ echo "-";}
					?></td>
				<td><?php if($journal_voucher_row->cr_dr=="Cr")
					{
					
					$cr=$cr+$journal_voucher_row->amount;
					echo $journal_voucher_row->amount;
					}else{ echo "-";}
					?></td>
				
			</tr>
			<?php endforeach ?>
			<tr>
			<td align="right"><b>Total</b></td>
			
			<td> <?php echo $dr;?></td>
			<td> <?php echo $cr;?></td>
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
						For <?= h($journalVoucher->company->name) ?>
							<br/>
					 <?php 
		             echo $this->Html->Image('/signatures/'.$journalVoucher->creator->signature,['height'=>'50px','style'=>'height:50px;']); 
		             ?></br>		
							
						Authorised Signatory</span>
						
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>	
</div>
</div>
