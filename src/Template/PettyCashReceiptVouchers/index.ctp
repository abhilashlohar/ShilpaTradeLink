<?php //pr($pettyCashReceiptVouchers); exit; ?>
<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption">
			<i class="icon-globe font-blue-steel"></i>
			<span class="caption-subject font-blue-steel uppercase">Petty Cash Receipt Vouchers</span>
		</div>
	</div>
	<div class="portlet-body">
		<div class="row">
			<div class="col-md-12">
				<table class="table table-bordered table-striped table-hover">
					<thead>
						<tr>
							<th>S.No</th>
							<th>Received From</th>
							<th>Bank/Cash</th>
							<th>Amount</th>
							<th class="actions"><?= __('Actions') ?></th>
						</tr>
					</thead>
					<tbody>
						<?php /*$i=0; foreach($vouchersReferences as $vouchersReference): $i++;
							$groups=[];
							foreach($vouchersReference->vouchers_references_groups as $vouchers_references_groups){
								$groups[]=$vouchers_references_groups->account_group->name;
							}
							*/
						?>
						<?php $i=0; foreach ($pettyCashReceiptVouchers as $pettyCashReceiptVoucher): $i++; 
						$receivedFrom=$pettyCashReceiptVoucher->ReceivedFrom->name;
						$bankCashes=$pettyCashReceiptVoucher->BankCash->name;
					?>
						<tr>
							<td><?= h($i) ?></td>
							<td><?= h($receivedFrom) ?></td>
							<td><?= h($bankCashes) ?></td>
							<td><?= ($pettyCashReceiptVoucher->amount) ?></td>
							
						
							<td class="actions">
							<?php echo $this->Html->link('<i class="fa fa-pencil-square-o"></i>',['action' => 'edit', $pettyCashReceiptVoucher->id],array('escape'=>false,'class'=>'btn btn-xs blue')); ?>
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

