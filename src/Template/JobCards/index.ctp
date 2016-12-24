<?php //pr($jobCards); exit; ?>

<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption">
			<i class="icon-globe font-blue-steel"></i>
			<span class="caption-subject font-blue-steel uppercase">JobCard</span> 

			<?php if($material_indent=="true"){ ?>
			: Select a Job Card For Material Indent
			<?php } ?>
		</div>
		 

<div class="col-md-12">
	<?php $page_no=$this->Paginator->current('SalesOrders'); $page_no=($page_no-1)*20; ?>	 
		<table class="table table-bordered table-striped table-hover">
			<tbody>
					<tr>
					<td align="Center" style="font-size:120%;">Sr.No.</td>
					<td align="Center" style="font-size:120%;">Sales Order</td>
					<td align="Center" style="font-size:120%;">Job Cord No.</td>
					<td align="Center" style="font-size:120%;">Required Date</td>
					<td align="Center" style="font-size:120%;">Created Date</td>
					<td align="Center" style="font-size:120%;">Action</td>
					</tr>
			</tbody>
 

        <tbody>
		 
         <?php foreach ($jobCards as $jobCards): ?>
             
		<tr>
			<td align="Center"><?= h(++$page_no) ?></td>
			
			 <td align="Center"><?= h(($jobCards->sales_order->so1.'/SO-'.str_pad($jobCards->sales_order->so2, 3, '0', STR_PAD_LEFT).'/'.$jobCards->sales_order->so3.'/'.$jobCards->sales_order->so4))?></td> 
			 
			 <td align="Center"><?= h(($jobCards->jc1.'/JC-'.str_pad($jobCards->jc2, 3, '0', STR_PAD_LEFT).'/'.$jobCards->jc3.'/'.$jobCards->jc4))?></td>
			<td align="Center"><?= $jobCards->created_on ?></th>
			<td align="Center"><?= $jobCards->required_date?></td>
			<td class="actions" align="Center">
								
								 <?php if($material_indent=="true"){
									echo $this->Html->link('<i class="fa fa-repeat"></i>  Convert Into Material Indents','/MaterialIndents/Add?job-cards='.$jobCards->id,array('escape'=>false,'class'=>'btn btn-xs default blue-stripe'));
								} ?>
								 <?php echo $this->Html->link('<i class="fa fa-pencil-square-o"></i>',['action' => 'edit', $jobCards->id],array('escape'=>false,'class'=>'btn btn-xs blue tooltips','data-original-title'=>'Edit')); ?>
								 <?php echo $this->Html->link('<i class="fa fa-search"></i>',['action' => 'view', $jobCards->id],array('escape'=>false,'target'=>'_blank','class'=>'btn btn-xs yellow tooltips')); ?>
								 
								<?= $this->Form->postLink('<i class="fa fa-trash"></i> ',
									['action' => 'delete', $jobCards->id], 
									[
										'escape' => false,
										'class' => 'btn btn-xs red',
										'confirm' => __('Are you sure, you want to delete {0}?', $jobCards->id)
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
