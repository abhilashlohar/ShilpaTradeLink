<div class="portlet light bordered">
<div class="portlet-title">
<div class="caption">
    <i class="icon-globe font-blue-steel"></i>
	<span class="caption-subject font-blue-steel uppercase">Quotations</span> 
</div>
<div class="portlet-body">
	<div class="row">
		<div class="col-md-12">
			<?php $page_no=$this->Paginator->current('JobCards'); $page_no=($page_no-1)*20; ?>	 
			<table class="table table-bordered table-striped table-hover">
				<thead>
				<tr>
					<td style="font-size:120%;">Sr.No.</td>
					<td style="font-size:120%;">Sales Order</td>
					<td style="font-size:120%;">Job Cord No.</td>
					<td style="font-size:120%;">Required Date</td>
					<td style="font-size:120%;">Created Date</td>
					<td style="font-size:120%;">Action</td>
				</tr>
				<tbody>
		    <?php foreach ($jobCards as $jobCards): ?>
				<tr>
					<td><?= h(++$page_no) ?></td>
					<td><?= h(($jobCards->sales_order->so1.'/SO-'.str_pad($jobCards->sales_order->so2, 3, '0', STR_PAD_LEFT).'/'.$jobCards->sales_order->so3.'/'.$jobCards->sales_order->so4))?></td> 
					<td><?= h(($jobCards->jc1.'/JC-'.str_pad($jobCards->jc2, 3, '0', STR_PAD_LEFT).'/'.$jobCards->jc3.'/'.$jobCards->jc4))?></td>
					<td><?= date("d-m-Y",strtotime($jobCards->created_on));?></td>
					<td><?= date("d-m-Y",strtotime($jobCards->required_date));?></td>
					<td class="actions">
					<?php if($material_indent=="true"){
					echo $this->Html->link('<i class="fa fa-repeat"></i>  Convert Into Material Indents','/MaterialIndents/Add?job-cards='.$jobCards->id,array('escape'=>false,'class'=>'btn btn-xs default blue-stripe'));
					} ?>
					<?php echo $this->Html->link('<i class="fa fa-pencil-square-o"></i>',['action' => 'edit', $jobCards->id],array('escape'=>false,'class'=>'btn btn-xs blue tooltips','data-original-title'=>'Edit')); ?>
					<?php echo $this->Html->link('<i class="fa fa-search"></i>',['action' => 'view', $jobCards->id],array('escape'=>false,'target'=>'_blank','class'=>'btn btn-xs yellow tooltips')); ?>
					</td>
				</tr>
		    <?php endforeach; ?>
			 </tbody>
			</table>
		</div>
	</div>
</div>
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
 
 