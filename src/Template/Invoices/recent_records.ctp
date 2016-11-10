<span style="font-size: 16px;"><?php echo $customer_text; ?></span>
<table class="table">
	<thead>
		<tr>
			<th>Sr. No.</th>
			<th>Invoice No.</th>
			<th>Invoice Date</th>
			<th>Last Selling Rate</th>
		</tr>
	</thead>
	<tbody>
	<?php $i=0; foreach($Invoices as $invoice): ?>
		<tr>
			<td><?= h(++$i) ?></td>
			<td><?php echo $this->Html->link(($invoice->in1.'/IN'.str_pad($invoice->id, 3, '0', STR_PAD_LEFT).'/'.$invoice->in3.'/'.$invoice->in4),'/Invoices/confirm/'.$invoice->id,array('target'=>'_blank')); ?></td>
			<td><?= h(date('d-m-Y',strtotime($invoice->date_created))) ?></td>
			<td><?= h($invoice->_matchingData['InvoiceRows']->rate) ?></td>
		</tr>
	<?php endforeach; ?>
	</tbody>
</table>