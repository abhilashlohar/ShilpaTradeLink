<?php //pr($ReceiptVoucher); exit; ?>
<h4>Receipt of <?= h($Customer->customer_name) ?></h4>
<table class="table table-hover" id="due_receipt">
	<thead>
		<tr>
			<th></th>
			<th>#</th>
			<th style="text-align: right;">Amount</th>
			<th style="text-align: right;">Receipt Amount</th>
			
		</tr>
	</thead>
	<tbody>
	<?php $i=0; foreach($ReceiptVoucher as $receiptVoucher){ ?>
		<tr class="tr1">
			<td><input type="checkbox" value="<?= h($receiptVoucher->id) ?>" class="check_row" name="invoice_breakups[<?php echo $i; ?>][checkbox]" /></td>
			<td><?php echo ++$i; $i--;  ?></td>
			<td align="right" >
				
				<?php echo $this->Number->format($receiptVoucher->amount,[ 'places' => 2]); ?>
				<input type="hidden" name="invoice_breakups[<?php echo $i; ?>][receipt_voucher_id]" value='<?php echo $receiptVoucher->id; ?>' />
				<input type="hidden" name="invoice_breakups[<?php echo $i; ?>][receipt_amount]" value="<?php echo $receiptVoucher->amount; ?>" />
			</td>
			<td align="right" width="120">
				<input type="text" name="invoice_breakups[<?php echo $i; ?>][amount]" class="form-control input-sm amount_box" placeholder="Amount" max="<?php echo $receiptVoucher->amount; ?>" readonly="readonly" amount="<?php echo $receiptVoucher->amount; ?>" />
			</td>
			
		</tr>
	<?php $i++; } ?>
	</tbody>
	<tfoot>
		<tr>
			<td align="right" colspan="4"></td>
			<td><input type="text" name="total_amount_agst" class="form-control input-sm" readonly="readonly" placeholder="Total" value="0.00"/></td>
		</tr>
	</tfoot>
</table>