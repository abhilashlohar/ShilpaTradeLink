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
						<?php $i=0; foreach($paymentVouchers as $paymentVoucher): $i++; pr($paymentVoucher); exit; ?>
						<tr>
							<td><?= $this->Number->format($paymentVoucher->id) ?></td>
							<td><?= h($paymentVoucher->created_on) ?></td>
							<td><?= h($paymentVoucher->voucher_date) ?></td>
							<td><?= h($paymentVoucher->ledger_account->name) ?></td>
							<td><?= h($paymentVoucher->payment_mode) ?></td>
							<td><?= $this->Number->format($paymentVoucher->cash_bank_account_id) ?></td>
							<td class="actions">
								<?= $this->Html->link(__('View'), ['action' => 'view', $paymentVoucher->id]) ?>
								<?= $this->Html->link(__('Edit'), ['action' => 'edit', $paymentVoucher->id]) ?>
								<?= $this->Form->postLink(__('Delete'), ['action' => 'delete', $paymentVoucher->id], ['confirm' => __('Are you sure you want to delete # {0}?', $paymentVoucher->id)]) ?>
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
