<h4>Due Invoices of <?= h($Customer->customer_name) ?></h4>
<table class="table table-hover">
	<thead>
		<tr>
			<th></th>
			<th>#</th>
			<th>Invoice</th>
			<th style="text-align: right;">Due Amount</th>
			<th style="text-align: right;">Amount</th>
		</tr>
	</thead>
	<tbody>
	<?php $i=0; foreach($Invoices as $Invoice){ ?>
		<tr>
			<td><input type="checkbox" value="<?= h($Invoice->id) ?>" class="check_row" /></td>
			<td><?= h(++$i) ?></td>
			<td><?= h(($Invoice->in1.'/IN-'.str_pad($Invoice->in2, 3, '0', STR_PAD_LEFT).'/'.$Invoice->in3.'/	'.$Invoice->in4)) ?></td>
			<td align="right" ><?php echo $this->Number->format($Invoice->due_payment,[ 'places' => 2]); ?></td>
			<td align="right" width="120">
				<input type="text" name="amount" class="form-control input-sm amount_box" placeholder="Amount" max="<?php echo $Invoice->due_payment; ?>" readonly="readonly" invoice_amount="<?php echo $Invoice->due_payment; ?>">
			</td>
		</tr>
	<?php } ?>
	</tbody>
</table>