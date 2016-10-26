<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption">
			<i class="icon-globe font-blue-steel"></i>
			<span class="caption-subject font-blue-steel uppercase">Quotations</span>
		</div>
		<div class="actions">
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
	</div>
	<div class="portlet-body">
		<div class="row">
			<div class="col-md-12">
				<form method="GET" >
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
										<input type="text" name="company_alise" class="form-control input-sm" placeholder="Company" value="<?php echo @$company_alise; ?>">
									</div>
									<div class="col-md-4">
										<div class="input-group" style="" id="pnf_text">
											<span class="input-group-addon">QT-</span><input type="text" name="quotation_no" class="form-control input-sm" placeholder="Quotation No" value="<?php echo @$quotation_no; ?>">
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
						?>
						<tr style="background-color:<?php echo $tr_color; ?>;">
							<td><?= h(++$page_no) ?></td>
							<td><?= h(($quotation->qt1.'/QT-'.str_pad($quotation->id, 3, '0', STR_PAD_LEFT).'/'.$quotation->qt3.'/'.$quotation->qt4)) ?></td>
							<td><?= h($quotation->customer->customer_name) ?></td>
							<td><?= h($quotation->employee->name) ?></td>
							<td><?= h($quotation->item_group->name) ?></td>
							<td><?php echo date("d-m-Y",strtotime($quotation->finalisation_date)); ?></td>
							<td class="actions">
								<?php echo $this->Html->link('<i class="fa fa-search"></i>',['action' => 'confirm', $quotation->id],array('escape'=>false,'target'=>'_blank','class'=>'btn btn-xs yellow tooltips','data-original-title'=>'View as PDF')); ?>
								
							
								<?php if($quotation->status=='Pending' and in_array(2,$allowed_pages)){
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
