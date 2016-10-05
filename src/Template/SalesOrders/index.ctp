<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption">
			<i class="icon-globe font-blue-steel"></i>
			<span class="caption-subject font-blue-steel uppercase">Sales Orders</span>
		</div>
	</div>
	<div class="portlet-body">
		<div class="row">
			<div class="col-md-12">
				<div class="pull-right" style="margin-bottom: 2px;">
					<div class="btn-group">
					<?php
					if($status==null or $status=='Pending'){ $class1='btn btn-primary'; }else{ $class1='btn btn-default'; }
					if($status=='Converted Into Invoice'){ $class2='btn btn-primary'; }else{ $class2='btn btn-default'; }
					
					?>
						<?= $this->Html->link(
							'Pending',
							'/Sales-Orders/index/Pending',
							['class' => $class1]
						); ?>
						<?= $this->Html->link(
							'Converted Into Invoice',
							'/Sales-Orders/index/Converted Into Invoice',
							['class' => $class2]
						); ?>
					</div>
				</div>
				<table class="table table-bordered table-striped table-hover">
					<thead>
						<tr>
							<th>S. No.</th>
							<th>Sales Order No</th>
							<th>Customer</th>
							<th>Date</th>
							<th>PO No.</th>
							<th>Actions</th>
						</tr>
					</thead>
					<tbody>
						<?php $i=0; foreach ($salesOrders as $salesOrder): $i++; ?>
						<tr <?php if($status=='Converted Into Invoice'){ echo 'style="background-color:#f4f4f4"'; } ?> >
							<td><?= $i; ?></td>
							<td><?= h(($salesOrder->so1.'/SO-'.str_pad($salesOrder->id, 3, '0', STR_PAD_LEFT).'/'.$salesOrder->so3.'/'.$salesOrder->so4)) ?></td>
							<td><?= h($salesOrder->customer->customer_name) ?></td>
							<td><?php echo date("d-m-Y",strtotime($salesOrder->date)); ?></td>
							<td><?= h($salesOrder->customer_po_no) ?></td>
							<td class="actions">
								<?php echo $this->Html->link('<i class="fa fa-search"></i>',['action' => 'confirm', $salesOrder->id],array('escape'=>false,'target'=>'_blank','class'=>'btn btn-xs yellow tooltips','data-original-title'=>'View as PDF')); ?>
								
								<?php if($status!='Converted Into Invoice'){ ?> 
									<?php echo $this->Html->link('<i class="fa fa-pencil-square-o"></i>',['action' => 'edit', $salesOrder->id],array('escape'=>false,'class'=>'btn btn-xs blue tooltips','data-original-title'=>'Edit')); ?>
								<?php } ?>
								<!--<?= $this->Form->postLink('<i class="fa fa-trash"></i> ',
									['action' => 'delete', $salesOrder->id], 
									[
										'escape' => false,
										'class' => 'btn btn-xs red',
										'confirm' => __('Are you sure, you want to delete {0}?', $salesOrder->id)
									]
								) ?>-->
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
