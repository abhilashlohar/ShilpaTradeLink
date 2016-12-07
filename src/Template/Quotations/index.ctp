
<?php 

	if(!empty($status)){
		$url_excel=$status."/?".$url;
	}else{
		$url_excel="/?".$url;
	}

?>

<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption">
		
		
			<i class="icon-globe font-blue-steel"></i>
			<span class="caption-subject font-blue-steel uppercase">Quotations</span> 
			<?php if($pull_request=="true"){ ?>
			: Select a Quotation to convert into sales-order
			<?php }  elseif($copy_request=="copy"){?>
			: Select a Quotation to Copy
			<?php } ?>
		</div>
		<div class="actions">
				
			
			<?php
			if($status==null or $status=='Pending'){ $class1='btn btn-primary'; }else{ $class1='btn btn-default'; }
			if($status=='Converted Into Sales Order'){ $class2='btn btn-primary'; }else{ $class2='btn btn-default'; }
			if($status=='Closed'){ $class3='btn btn-primary'; }else{ $class3='btn btn-default'; }
			?>
			<?php if($pull_request!="true" and $copy_request!="copy"){ ?>
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
				
				<?= $this->Html->link(
					'Closed',
					'/Quotations/index/Closed',
					['class' => $class3]
				); ?>
				<?php echo $this->Html->link('<i class="fa fa-file-excel-o"></i> Excel','/Quotations/Export-Excel/'.$url_excel,['class' =>'btn  green tooltips','target'=>'_blank','escape'=>false,'data-original-title'=>'Download as excel']); ?>
			<div class="btn-group">
				
			<?php }  ?>
			
					
			</div>
		</div>
	
	<div class="portlet-body">
		<div class="row">
			<div class="col-md-12">
				<form method="GET" >
				<input type="hidden" name="pull-request" value="<?php echo @$pull_request; ?>">
				<table class="table table-condensed">
					<thead>
						<tr>
							<th>Quotation No.</th>
							<th>Customer</th>
							<th>Salesman</th>
							<th>Product</th>
							<th>Finalisation Date</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>
								<div class="row">
									<div class="col-md-4">
										<?php echo $this->Form->input('company_id',['options' => $companies,'empty' => "--Select Company--",'label' => false,'class' => 'form-control input-sm select2me','value'=>@$company_id]); ?>
									</div>
									<div class="col-md-4">
										<div class="input-group" style="" id="pnf_text">
											<span class="input-group-addon">QT-</span><input type="text" name="qt2" class="form-control input-sm" placeholder="Quotation No" value="<?php echo @$qt2; ?>">
										</div>
									</div>
									<div class="col-md-4">
										<input type="text" name="file" class="form-control input-sm" placeholder="File" value="<?php echo @$file; ?>">
									</div>
								</div>
							</td>
							<td><input type="text" name="customer" class="form-control input-sm" placeholder="Customer" value="<?php echo @$customer; ?>"></td>
							<td><input type="text" name="salesman" class="form-control input-sm" placeholder="Salesman" value="<?php echo @$salesman; ?>"></td>
							<td><input type="text" name="product" class="form-control input-sm" placeholder="Product" value="<?php echo @$product; ?>"></td>
							<td>
								<div class="row">
									<div class="col-md-6">
										<input type="text" name="From" class="form-control input-sm date-picker" placeholder="From" value="<?php echo @$From; ?>"  data-date-format="dd-mm-yyyy" >
									</div>
									<div class="col-md-6">
										<input type="text" name="To" class="form-control input-sm date-picker" placeholder="To" value="<?php echo @$To; ?>"  data-date-format="dd-mm-yyyy" >
									</div>
								</div>
							</td>
							<td><button type="submit" class="btn btn-primary btn-sm"><i class="fa fa-filter"></i> Filter</button></td>
						</tr>
					</tbody>
				</table>
				</form>
				<?php $page_no=$this->Paginator->current('Quotations'); $page_no=($page_no-1)*20; ?>
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
						if($quotation->status=='Closed'){ $tr_color='#FFF'; }
						?>
						<tr style="background-color:<?php echo $tr_color; ?>;">
							<td><?= h(++$page_no) ?></td>
							<td><?= h(($quotation->qt1.'/QT-'.str_pad($quotation->qt2, 3, '0', STR_PAD_LEFT).'/'.$quotation->qt3.'/'.$quotation->qt4)) ?></td>
							<td><?= h($quotation->customer->customer_name) ?></td>
							<td><?= h($quotation->employee->name) ?></td>
							<td><?= h($quotation->item_group->name) ?></td>
							<td><?php echo date("d-m-Y",strtotime($quotation->finalisation_date)); ?></td>
							<td class="actions">
								<?php echo $this->Html->link('<i class="fa fa-search"></i>',['action' => 'confirm', $quotation->id],array('escape'=>false,'target'=>'_blank','class'=>'btn btn-xs yellow tooltips','data-original-title'=>'View as PDF')); ?>
								
							
								<?php if($quotation->status=='Pending' and in_array(2,$allowed_pages) and $pull_request!="true" && $copy_request!="copy"){
									echo $this->Html->link('<i class="fa fa-pencil-square-o"></i>',['action' => 'edit', $quotation->id],array('escape'=>false,'class'=>'btn btn-xs blue tooltips','data-original-title'=>'Edit'));
								} ?>
								<?php if($pull_request=="true"){
									echo $this->Html->link('<i class="fa fa-repeat"></i>  Convert Into Sales Order','/Sales-Orders/Add?quotation='.$quotation->id,array('escape'=>false,'class'=>'btn btn-xs default blue-stripe'));
								} ?>
								
								<?php 
								if($quotation->status=='Pending' && $copy_request!="copy" && $pull_request!="true"){
									echo $this->Form->postLink('<i class="fa fa-minus-circle"></i> ',['action' =>'close', $quotation->id],['escape' => false,'class' => 'btn btn-xs red tooltips','data-original-title'=>'Close','confirm' => __('Are you sure, you want to close ?', $quotation->id)
										]
									);
									echo $this->Html->link('<i class="fa fa-minus-circle"></i> ',['action' => '#'],array('escape'=>false,'class'=>'btn btn-xs red tooltips close_btn','data-original-title'=>'Close','role'=>'button','quote_id'=>$quotation->id));
								} ?>
								<?php if($copy_request=="copy"){
									echo $this->Html->link('<i class="fa fa-repeat"></i>  Copy','/Quotations/Add?copy='.$quotation->id,array('escape'=>false,'class'=>'btn btn-xs default blue-stripe'));
								} ?>
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
