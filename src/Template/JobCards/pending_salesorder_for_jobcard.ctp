<?php //pr($SalesOrders); exit; ?>


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
		    <?php foreach ($SalesOrders as $SalesOrder): ?>
				<tr>
					<td><?= h(++$page_no) ?></td>
					<td><?= h(($SalesOrder->so1.'/SO-'.str_pad($SalesOrder->so2, 3, '0', STR_PAD_LEFT).'/'.$SalesOrder->so3.'/'.$SalesOrder->so4))?></td> 
					<td><?php echo $SalesOrder->customer->customer_name; ?></td> 
					<td><?php echo $SalesOrder->po_date; ?></td> 
					<td><?php echo $SalesOrder->customer_po_no; ?></td> 
					
					<td class="actions">
					<?php if(($SalesOrder->job_card_status =='Pending') and (sizeof($SalesOrder->sales_order_rows)==0)){
						if(sizeof($SalesOrder->job_card)==0){
							echo $this->Html->link('<i class="fa fa-repeat "></i>  Create Job Card','/JobCards/Add?sales-order='.$SalesOrder->id,array('escape'=>false,'class'=>'btn btn-xs default blue-stripe'));
						}else{
							echo $this->Html->link('<i class="fa fa-repeat "></i>  Edit Job Card','/JobCards/Edit/'.$SalesOrder->job_card->id,array('escape'=>false,'class'=>'btn btn-xs default blue-stripe'));
						}
					}
						
					elseif(($SalesOrder->job_card_status =='Pending') and (sizeof($SalesOrder->sales_order_rows)!=0)){
						if(sizeof($SalesOrder->job_card)==0){
							echo $this->Html->link('<i class="fa fa-repeat "></i>  Create Job Card','/JobCards/PreAdd?Pre-add='.$SalesOrder->id,array('escape'=>false,'class'=>'btn btn-xs default blue-stripe'));
						}else{
							echo $this->Html->link('<i class="fa fa-repeat "></i>  Edit Job Card','/JobCards/PreEdit?Pre-edit='.$SalesOrder->id,array('escape'=>false,'class'=>'btn btn-xs default blue-stripe'));
						}
					}
					elseif(($SalesOrder->job_card_status =='Converted')){
							echo $this->Html->link('<i class="fa fa-repeat "></i>  Edit Job Card','/JobCards/Edit/'.$SalesOrder->job_card->id,array('escape'=>false,'class'=>'btn btn-xs default blue-stripe'));
							echo $this->Html->link('<i class="fa fa-search"></i>',['action' => 'view', $SalesOrder->job_card->id],array('escape'=>false,'class'=>'btn btn-xs yellow tooltips','target'=>'blank','data-original-title'=>'View'));
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
 
 