<div class="portlet light bordered">
<div class="portlet-title">
<div class="caption">
    <i class="icon-globe font-blue-steel"></i>
	<span class="caption-subject font-blue-steel uppercase">Job Cards</span> 
</div>
<div class="portlet-body">
	<div class="row">
		<div class="col-md-12">
			<?php $page_no=$this->Paginator->current('JobCards'); $page_no=($page_no-1)*20; ?>	 
			<table class="table table-bordered table-striped table-hover ">
				<tr>
					<td style="font-size:120%;">Sr.No.</td>
					<td style="font-size:120%;">Job Card No.</td>
					<td style="font-size:120%;">Sales Order</td>
					<td style="font-size:120%;">Required Date</td>
					<td style="font-size:120%;">Created Date</td>
					<td style="font-size:120%;">Action</td>
				</tr>
				<tbody>
		    <?php foreach ($jobCards as $jobCard): ?>
				<tr>
					<td><?= h(++$page_no) ?></td>
					<td><?= h(($jobCard->jc1.'/JC-'.str_pad($jobCard->jc2, 3, '0', STR_PAD_LEFT).'/'.$jobCard->jc3.'/'.$jobCard->jc4))?></td>
					<td><?= h(($jobCard->sales_order->so1.'/SO-'.str_pad($jobCard->sales_order->so2, 3, '0', STR_PAD_LEFT).'/'.$jobCard->sales_order->so3.'/'.$jobCard->sales_order->so4))?></td> 
					<td><?= date("d-m-Y",strtotime($jobCard->created_on));?></td>
 					<td><?= date("d-m-Y",strtotime($jobCard->required_date));?></td>
					<td class="actions">
					
					<?php echo $this->Html->link('<i class="fa fa-search"></i>',['action' => 'view', $jobCard->id],array('escape'=>false,'class'=>'btn btn-xs yellow tooltips','target'=>'blank','data-original-title'=>'View')); ?>
					<?php echo $this->Html->link('<i class="fa fa-pencil-square-o"></i>',['action' => 'edit', $jobCard->id],array('escape'=>false,'class'=>'btn btn-xs blue tooltips','data-original-title'=>'Edit')); ?>
					<?php if($jobCard->status =='Pending'){
						echo $this->Html->link('<i class="fa fa-repeat"></i>  Create Inventory Voucher','/Inventory-Vouchers/Add?jobcard='.$jobCard->id,array('escape'=>false,'class'=>'btn btn-xs default blue-stripe'));
						}		?>
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
 
 