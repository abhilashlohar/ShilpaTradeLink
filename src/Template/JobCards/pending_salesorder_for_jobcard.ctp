<?php //foreach($jobCards as $data){ pr($data); } exit; ?>
<div class="portlet light bordered">
<div class="portlet-title">
<div class="caption">
    <i class="icon-globe font-blue-steel"></i>
	<span class="caption-subject font-blue-steel uppercase">Pending Sales Order For Job Cards</span> 
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
					<td style="font-size:120%;">Customer</td>
					<td style="font-size:120%;">Date</td>
					<td style="font-size:120%;">PO No.</td>
					<td style="font-size:120%;">Action</td>
				</tr>
				<tbody>
		    <?php foreach ($jobCards as $jobCard): 
			//pr($jobCard->sales_order_rows);?>
				<tr>
					
					<td><?= h(++$page_no) ?></td>
					
					<td><?= h(($jobCard->so1.'/SO-'.str_pad($jobCard->so2, 3, '0', STR_PAD_LEFT).'/'.$jobCard->so3.'/'.$jobCard->so4))?></td> 
					<td><?php echo $jobCard->customer->customer_name; ?></td> 
					<td><?php echo $jobCard->po_date; ?></td> 
					<td><?php echo $jobCard->customer_po_no; ?></td> 
					
					<td class="actions">
					<?php if(($jobCard->job_card =='Pending') and (sizeof($jobCard->sales_order_rows)==0)){
					echo $this->Html->link('<i class="fa fa-repeat "></i>  Create Job Card','/JobCards/Add?sales-order='.$jobCard->id,array('escape'=>false,'class'=>'btn btn-xs default blue-stripe'));
					} 
					elseif(($jobCard->job_card =='Pending') and (sizeof($jobCard->sales_order_rows)!=0)){
					echo $this->Html->link('<i class="fa fa-repeat "></i>  Selct Item Source','/JobCards/PreAdd?Pre-add='.$jobCard->id,array('escape'=>false,'class'=>'btn btn-xs default blue-stripe'));
					}
					elseif(($jobCard->job_card =='Converted')){
					echo $this->Html->link('<i class="fa fa-repeat "></i> Edit jobCard','/JobCards/Edit/'.$jobCard->id,array('escape'=>false,'class'=>'btn btn-xs default blue-stripe'));
					echo $this->Html->link('<i class="fa fa-search"></i>',['action' => 'view', $jobCard->id],array('escape'=>false,'class'=>'btn btn-xs yellow tooltips','data-original-title'=>'View'));
					}
					
					 ?>
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
 
 