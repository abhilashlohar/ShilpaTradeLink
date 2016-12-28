<?php if(!$Invoices){ echo 'Please select received from'; } ?>
<table class="table table-hover">
	<thead>
		<tr>
			<th>#</th>
			<th>Invoice</th>
			<th style="text-align: right;">Due Amount</th>
		</tr>
	</thead>
	<tbody>
	<?php $i=0; foreach($Invoices as $Invoice){ ?>
		<tr style="cursor: pointer;" invoice_id="<?= h($Invoice->id) ?>" class="invoice_tr">
			<td><?= h(++$i) ?></td>
			<td><?= h(($Invoice->in1.'/IN'.str_pad($Invoice->in2, 3, '0', STR_PAD_LEFT).'/'.$Invoice->in3.'/	'.$Invoice->in4)) ?></td>
			<td align="right" ><?= h($Invoice->due_payment) ?></td>
		</tr>
	<?php } ?>
	</tbody>
</table>