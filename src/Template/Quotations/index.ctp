<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption">
			<i class="icon-globe font-blue-steel"></i>
			<span class="caption-subject font-blue-steel uppercase">Quotations</span>
		</div>
	</div>
	<div class="portlet-body">
		<div class="row">
			<div class="col-md-12">
				<div class="pull-right" style="margin-bottom: 2px;">
					<div class="btn-group">
					<?php
					if($status==null or $status=='Pending'){ $class1='btn btn-primary'; }else{ $class1='btn btn-default'; }
					if($status=='Converted Into Sales Order'){ $class2='btn btn-primary'; }else{ $class2='btn btn-default'; }
					
					?>
						<?= $this->Html->link(
							'Pending',
							'/Quotations/index/Pending',
							['class' => $class1]
						); ?>
						<?= $this->Html->link(
							'Converted Into Sales Order',
							'/Quotations/index/Converted Into Sales Order',
							['class' => $class2]
						); ?>
					</div>
				</div>
				asd
				<table class="table table-bordered table-striped table-hover">
					<thead>
						<tr>
							<th>Sr. No.</th>
							<th>Ref. No.</th>
							<th>Customer</th>
							<th>Salesman</th>
							<th>Product</th>
							<th>Finalisation Ddate</th>
							<th class="actions"><?= __('Actions') ?></th>
						</tr>
					</thead>
					<tbody>
						<?php $i=0; foreach ($quotations as $quotation): $i++;
						if($quotation->status=='Converted Into Sales Order'){ $tr_color='#f4f4f4'; }
						if($quotation->status=='Pending'){ $tr_color='#FFF'; }
						?>
						<tr style="background-color:<?php echo $tr_color; ?>;">
							<td><?= $i; ?></td>
							<td><?= h(($quotation->qt1.'/QT-'.str_pad($quotation->id, 3, '0', STR_PAD_LEFT).'/'.$quotation->qt3.'/'.$quotation->qt4)) ?></td>
							<td><?= h($quotation->customer->customer_name) ?></td>
							<td><?= h($quotation->employee->name) ?></td>
							<td><?= h($quotation->category->name) ?></td>
							<td><?php echo date("d-m-Y",strtotime($quotation->finalisation_date)); ?></td>
							<td class="actions">
								<?php echo $this->Html->link('<i class="fa fa-search"></i>',['action' => 'confirm', $quotation->id],array('escape'=>false,'target'=>'_blank','class'=>'btn btn-xs yellow tooltips','data-original-title'=>'View as PDF')); ?>
								
								<?php if($quotation->status=='Pending'){
									echo $this->Html->link('<i class="fa fa-pencil-square-o"></i>',['action' => 'edit', $quotation->id],array('escape'=>false,'class'=>'btn btn-xs blue tooltips','data-original-title'=>'Edit'));
								} ?>
								<!--<?= $this->Form->postLink('<i class="fa fa-trash"></i> ',
									['action' => 'delete', $quotation->id], 
									[
										'escape' => false,
										'class' => 'btn btn-xs red',
										'confirm' => __('Are you sure, you want to delete {0}?', $quotation->id)
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
