<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption">
			<i class="icon-globe font-blue-steel"></i>
			<span class="caption-subject font-blue-steel uppercase">Invoices</span>
		</div>
	</div>
	<div class="portlet-body">
		<div class="row">
			<div class="col-md-12">
				<form method="GET" >
				<table class="table table-condensed">
					<thead>
						<tr>
							<th>Invoice No</th>
							<th>Customer</th>
							<th>Date</th>
							<th>Total</th>
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
											<span class="input-group-addon">IN-</span><input type="text" name="invoice_no" class="form-control input-sm" placeholder="Invoice No" value="<?php echo @$invoice_no; ?>">
										</div>
									</div>
									<div class="col-md-4">
										<input type="text" name="file" class="form-control input-sm" placeholder="File" value="<?php echo @$file; ?>">
									</div>
								</div>
							</td>
							<td><input type="text" name="customer" class="form-control input-sm" placeholder="Customer" value="<?php echo @$customer; ?>"></td>
							<td>
								<div class="row">
									<div class="col-md-6">
										<input type="text" name="From" class="form-control input-sm date-picker" placeholder="From" value="<?php echo @$From; ?>" data-date-format="dd-mm-yyyy" >
									</div>
									<div class="col-md-6">
										<input type="text" name="To" class="form-control input-sm date-picker" placeholder="To" value="<?php echo @$To; ?>" data-date-format="dd-mm-yyyy" >
									</div>
								</div>
							</td>
							<td>
							<table>
								<tr>
									<td><input type="text" name="total_From" class="form-control input-sm" placeholder="From" value="<?php echo @$total_From; ?>" style="width: 100px;"></td>
									<td><input type="text" name="total_To" class="form-control input-sm" placeholder="To" value="<?php echo @$total_To; ?>" style="width: 100px;"></td>
								</tr>
							</table>
							</td>
							<td><button type="submit" class="btn btn-primary btn-sm"><i class="fa fa-filter"></i> Filter</button></td>
						</tr>
					</tbody>
				</table>
				</form>
				<table class="table table-bordered table-striped table-hover">
					<thead>
						<tr>
							<th>Sr. No.</th>
							<th>Invoice No.</th>
							<th>Customer</th>
							<th>Date</th>
							<th>Total</th>
							<th>Actions</th>
						</tr>
					</thead>
					<tbody>
						<?php $i=0; foreach ($invoices as $invoice): $i++; ?>
						<tr>
							<td><?= $i; ?></td>
							<td><?= h(($invoice->in1.'/IN-'.str_pad($invoice->id, 3, '0', STR_PAD_LEFT).'/'.$invoice->in3.'/'.$invoice->in4)) ?></td>
							<td><?= h($invoice->customer->customer_name) ?></td>
							<td><?php echo date("d-m-Y",strtotime($invoice->date_created)); ?></td>
							<td><?= h($invoice->total_after_pnf) ?></td>
							<td class="actions">
								<?php echo $this->Html->link('<i class="fa fa-search"></i>',['action' => 'confirm', $invoice->id],array('escape'=>false,'target'=>'_blank','class'=>'btn btn-xs yellow')); ?>
								<!--<?php echo $this->Html->link('<i class="fa fa-pencil-square-o"></i>',['action' => 'edit', $invoice->id],array('escape'=>false,'class'=>'btn btn-xs blue')); ?>-->
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
