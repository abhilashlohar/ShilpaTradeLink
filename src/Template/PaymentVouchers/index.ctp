<?php //pr($paymentVouchers); exit;?>
<div class="portlet light bordered">

	<div class="portlet-title">
		<div class="caption">
			<i class="icon-globe font-blue-steel"></i>
			<span class="caption-subject font-blue-steel uppercase">Payment Vouchers</span>
		</div>
	</div>
	<div class="portlet-body">
		<div class="row">
			<div class="col-md-12">
				<table class="table table-bordered table-striped table-hover">
					<thead>
				<tr>
						<th><?= $this->Paginator->sort('id') ?></th>
						<th><?= $this->Paginator->sort('created_on') ?></th>
						<th><?= $this->Paginator->sort('voucher_date') ?></th>
						<th><?= $this->Paginator->sort('paid_to') ?></th>
						<th><?= $this->Paginator->sort('payment_mode') ?></th>
						<th><?= $this->Paginator->sort('cash_bank_account') ?></th>
						<th class="actions"><?= __('Actions') ?></th>
					</tr>
					</thead>
					<tbody>
						<?php $i=0; foreach($paymentVouchers as $paymentVoucher): $i++; ?>
						<tr>
							<td><?= $this->Number->format($i) ?></td>
							<td><?= h(date("d-M-Y",strtotime($paymentVoucher->created_on)))?></td>
							<td><?= h(date("d-M-Y",strtotime($paymentVoucher->transaction_date)))?></td>
							<td><?= h($paymentVoucher->PaidTo->name) ?></td>
							<td><?= h($paymentVoucher->payment_mode) ?></td>
							<td><?=  h($paymentVoucher->BankCash->name) ?></td>
							<td class="actions">
							<?php echo $this->Html->link('<i class="fa fa-search"></i>',['action' => 'view', $paymentVoucher->id],array('escape'=>false,'target'=>'_blank','class'=>'btn btn-xs yellow tooltips','data-original-title'=>'View ')); ?>
							<?php echo $this->Html->link('<i class="fa fa-pencil-square-o"></i>',['action' => 'edit', $paymentVoucher->id],array('escape'=>false,'class'=>'btn btn-xs blue tooltips','data-original-title'=>'Edit'));?>
							<?= $this->Form->postLink('<i class="fa fa-trash"></i> ',
								['action' => 'delete', $paymentVoucher->id], 
								[
									'escape' => false,
									'class' => 'btn btn-xs btn-danger',
									'confirm' => __('Are you sure ?', $paymentVoucher->id)
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
