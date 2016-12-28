<?php //$grns; exit; ?>

<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption">
			<i class="icon-globe font-blue-steel"></i>
			<span class="caption-subject font-blue-steel uppercase">GRN</span>
			<?php if($pull_request=="true"){ ?>
			: Select a GRN to Book Invoice
			<?php } ?>
		</div>
		<div class="actions">
			<div class="btn-group">
			<?php
			if($status==null or $status=='Pending'){ $class1='btn btn-primary'; }else{ $class1='btn btn-default'; }
			if($status=='Invoice-Booked'){ $class2='btn btn-primary'; }else{ $class2='btn btn-default'; }
			?>
				<?= $this->Html->link(
					'Pending',
					'/Grns/index/Pending',
					['class' => $class1]
				); ?>
				<?= $this->Html->link(
					'Invoice-Booked',
					'/Grns/index/Invoice-Booked',
					['class' => $class2]
				); ?>
			<?php  ?>
			</div>
		</div>
	</div>
	<div class="portlet-body">
		<div class="row">
			<div class="col-md-12">
				<?php $page_no=$this->Paginator->current('Invoices'); $page_no=($page_no-1)*20; ?>
				<table class="table table-bordered table-striped table-hover">
					<thead>
						<tr>
							<th>Sr. No.</th>
							<th>GRN No.</th>
							<th>Vendor</th>
							<th>Date Created</th>

								 <th class="actions"><?= __('Actions') ?></th>

							
						</tr>
					</thead>
					<tbody>
					
						<?php foreach ($grns as $grn): ?>
						<tr>
							<td><?= h(++$page_no) ?></td>
							<td><?= h(($grn->grn1.'/GRN-'.str_pad($grn->grn2, 3, '0', STR_PAD_LEFT).'/'.$grn->grn3.'/'.$grn->grn4)) ?></td>
							<td><?= h($grn->vendor->company_name) ?></td>
							<td><?php echo date("d-m-Y",strtotime($grn->date_created)); ?></td>
							<td class="actions">
							<?php if($pull_request=="true"){
									echo $this->Html->link('<i class="fa fa-repeat"></i>  Convert Into Book Invoice','/InvoiceBookings/Add?grn='.$grn->id,array('escape'=>false,'class'=>'btn btn-xs default blue-stripe'));
								} else { ?>
							<?php echo $this->Html->link('<i class="fa fa-search"></i>',['action' => 'view', $grn->id],array('escape'=>false,'target'=>'_blank','class'=>'btn btn-xs yellow tooltips','data-original-title'=>'View '));  ?>	
							<?php echo $this->Html->link('<i class="fa fa-pencil-square-o"></i>',['action' => 'edit', $grn->id],array('escape'=>false,'class'=>'btn btn-xs blue tooltips','data-original-title'=>'Edit'));?>
                             <?php } ?>
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
