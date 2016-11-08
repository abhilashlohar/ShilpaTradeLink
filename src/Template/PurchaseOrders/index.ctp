

<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption">
			<i class="icon-globe font-blue-steel"></i>
			<span class="caption-subject font-blue-steel uppercase">Purchase Orders</span>
		
		</div>

	</div>
	<div class="portlet-body">
		<div class="row">
			<div class="col-md-12">
				
				<?php $page_no=$this->Paginator->current('Purchase Orders'); $page_no=($page_no-1)*20; ?>
				<table class="table table-bordered table-striped table-hover">
						<thead>
							<tr>
								<th>id</th>
								<th>Company</th>
								<th>Purchase No.</th>
								
							
								<th>delivery_date</th>
								<th>total</th>
								
								<th class="actions"><?= __('Actions') ?></th>
							</tr>
					
					</thead>

					<tbody>
						<?php foreach ($purchaseOrders as $purchaseOrder): ?>
						<tr>
							<td><?= $this->Number->format($purchaseOrder->id) ?></td>
							<td><?= $purchaseOrder->has('company') ? $this->Html->link($purchaseOrder->company->name, ['controller' => 'Companies', 'action' => 'view', $purchaseOrder->company->id]) : '' ?></td>
							<td><?= h(($purchaseOrder->po1.'/PO-'.str_pad($purchaseOrder->id, 3, '0', STR_PAD_LEFT).'/'.$purchaseOrder->po3.'/'.$purchaseOrder->po4)) ?></td>
							<td><?= h($purchaseOrder->delivery_date) ?></td>
							<td><?= $this->Number->format($purchaseOrder->total) ?></td>
						
							<td class="actions">
								<?php echo $this->Html->link('<i class="fa fa-search"></i>',['action' => 'confirm', $purchaseOrder->id],array('escape'=>false,'target'=>'_blank','class'=>'btn btn-xs yellow tooltips','data-original-title'=>'View as PDF')); ?>
								<?php echo $this->Html->link('<i class="fa fa-pencil-square-o"></i>',['action' => 'edit', $purchaseOrder->id],array('escape'=>false,'class'=>'btn btn-xs blue tooltips','data-original-title'=>'Edit')); ?>
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
