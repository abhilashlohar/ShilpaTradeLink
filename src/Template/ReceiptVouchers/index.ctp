<?php //pr($pettyCashReceiptVouchers); exit; ?>
<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption">
			<i class="icon-globe font-blue-steel"></i>
			<span class="caption-subject font-blue-steel uppercase">Receipt Vouchers</span>
		</div>
	</div>
	<div class="portlet-body">
		<div class="row">
			<div class="col-md-12">
				<table class="table table-bordered table-striped table-hover">
					<thead>
						<tr>
							<th>S.No</th>
							<th>Voucher Date</th>
							<th>Received From</th>
							<th>Bank/Cash</th>
							<th>Payment Mode</th>
							<th>Amount</th>
							<th class="actions"><?= __('Actions') ?></th>
						</tr>
					</thead>
					<tbody>
						
						<?php $i=0; foreach ($receiptVouchers as $receiptVoucher): $i++; 
						$receivedFrom=$receiptVoucher->ReceivedFrom->name;
						$bankCashes=$receiptVoucher->BankCash->name;
					?>
						<tr>
							<td><?= h($i) ?></td>
							<td><?= h(date("d-M-Y",strtotime($receiptVoucher->transaction_date)))?>
							<td><?= h($receivedFrom) ?></td>
							<td><?= h($bankCashes) ?></td>
							<td><?= h($receiptVoucher->payment_mode) ?></td>
							<td><?= ($receiptVoucher->amount) ?></td>
							
							<td class="actions">
							<?php echo $this->Html->link('<i class="fa fa-search"></i>',['action' => 'view', $receiptVoucher->id],array('escape'=>false,'target'=>'_blank','class'=>'btn btn-xs yellow tooltips','data-original-title'=>'View ')); ?>
							<?php echo $this->Html->link('<i class="fa fa-pencil-square-o"></i>',['action' => 'edit', $receiptVoucher->id],array('escape'=>false,'class'=>'btn btn-xs blue tooltips','data-original-title'=>'Edit'));?>
							<?= $this->Form->postLink('<i class="fa fa-trash"></i> ',
								['action' => 'delete',$receiptVoucher->id], 
								[
									'escape' => false,
									'class' => 'btn btn-xs btn-danger',
									'confirm' => __('Are you sure ?', $receiptVoucher->id)
								]
							) ?>
							</td>
						</tr>
						<?php endforeach; ?>
					</tbody>
				</table>
				<div class="paginator">
					<ul class="pagination">
						<?= $this->Paginator->prev('< ' . __('previous')) ?>
						<?= $this->Paginator->numbers() ?>
						<?= $this->Paginator->next(__('next') . ' >') ?>
					</ul>
					<p><?= $this->Paginator->counter() ?></p>
				</div>
			</div>
		</div>
	</div>
</div>

