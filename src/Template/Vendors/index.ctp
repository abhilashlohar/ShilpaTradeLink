<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption">
			<i class="icon-globe font-blue-steel"></i>
			<span class="caption-subject font-blue-steel uppercase">Suppliers</span>
		</div>
	</div>
	<div class="portlet-body">
		<div class="row">
			<div class="col-md-12">
			<?php $page_no=$this->Paginator->current('Quotations'); $page_no=($page_no-1)*20; ?>
				<table class="table table-bordered table-striped table-hover">
					<thead>
						<tr>
							<th>Sr. No.</th>
							<th>Suppliers Name</th>
							<th>TIN No</th>
							<th>GST No</th>
							<th>ECC No</th>
							<th>PAN No</th>
							<th>Payment Terms</th>
							<th>Mode Of Payment</th>
							<th width="12%">Actions</th>
							
						</tr>
					</thead>
					<tbody>
						<?php $i=0; foreach ($vendors as $vendor): $i++; ?>
						<tr>
							<td><?= h(++$page_no) ?></td>
							<td><?= h($vendor->company_name) ?></td>
							<td><?= h($vendor->tin_no) ?></td>
							<td><?= h($vendor->gst_no) ?></td>
							<td><?= h($vendor->ecc_no) ?></td>
							<td><?= h($vendor->pan_no) ?></td>
							<td><?= $this->Number->format($vendor->payment_terms) ?></td>
							<td><?= h($vendor->mode_of_payment) ?></td>
							<td class="actions">
								<?php echo $this->Html->link('<i class="fa fa-pencil-square-o"></i>',['action' => 'edit', $vendor->id],array('escape'=>false,'class'=>'btn btn-xs blue tooltips','data-original-title'=>'Edit')); ?>
								 <?= $this->Form->postLink('<i class="fa fa-trash"></i> ',
									['action' => 'delete', $vendor->id], 
									[
										'escape' => false,
										'class'=>'btn btn-xs red tooltips','data-original-title'=>'Delete',
										
										'confirm' => __('Are you sure ?', $vendor->id)
									]
								) ?>
								<?php echo $this->Html->link('<i class="fa fa-pencil-square-o"></i>',['action' => 'EditCompany', $vendor->id],array('escape'=>false,'class'=>'btn btn-xs green tooltips','data-original-title'=>'EditCompany')); ?>
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
