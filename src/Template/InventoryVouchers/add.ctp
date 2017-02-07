<?php // pr($invoice_row->quantity); exit; ?>
<style>
.page-content-wrapper .page-content{
	padding:5px 5px 5px 5px;
}
#main_tb td,th{
	padding:3px;
}
</style>
<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption">
			<i class="icon-globe font-blue-steel"></i>
			<span class="caption-subject font-blue-steel uppercase">Add Inventory Voucher</span>
		</div>
		<div class="actions">
		<?php echo $this->Html->link('<i class="fa fa-files-o"></i> Pull Invoice','/Invoices?inventory_voucher=true',array('escape'=>false,'class'=>'btn btn-xs blue')); ?>
		</div>
	</div>
<div class="portlet-body form">
	
		<?= $this->Form->create($inventoryVoucher,['id'=>'form_sample_3']) ?>
		<div class="form-body">
			<div class="row">
				<div class="col-md-4">
					<div class="form-group">
						<label class="col-md-3 control-label">Customer</label>
						<div class="col-md-9">
						<?php echo @$Invoice->customer->customer_name; ?>
						</div>
					</div>
				</div>
				<div class="col-md-6">
				<div class="form-group">
						<label class="col-md-3 control-label">Invoice No.</label>
						<div class="col-md-9 padding-right-decrease">
							<?= h(($Invoice->in1.'/IN-'.str_pad($Invoice->in2, 3, '0', STR_PAD_LEFT).'/'.$Invoice->in3.'/'.$Invoice->in4)) ?>
						</div>
						
					</div>
				</div>
				<div class="col-md-2">
					<div class="form-group">
						<label class="col-md-3 control-label">Date</label>
						<div class="col-md-9">
							<?php echo date("d-m-Y"); ?>
						</div>
					</div>
				</div>
			</div>
		</div>
				<table border="1" width="80%" id="main_tb">
			<thead>
			<tr>
				<th width="40%">PRODUCTION</th>
				<th>CONSUMPTION</th>
			</tr>
			</thead>
			<tbody id="maintbody">
			<?php $i=0; ?>
				<tr class="main_tr">
					<td>
					
					<?= h($item->name) ?> (<?= h($invoice_row->quantity) ?>)
					</td>
					<td>
					<table>
						<tbody>
						<?php foreach($JobCardRows as $job_card_row){ ?>
							<tr>
								<td>
								
								<?php echo $this->Form->input('inventory_voucher_rows.'.$i.'.item_id', ['options' => $items,'label' => false,'class' => 'form-control input-sm','value' => $job_card_row->item_id]); ?>
								</td>
								<td>
								<?php echo $this->Form->input('inventory_voucher_rows.'.$i.'.quantity', ['type' => 'text','label' => false,'class' => 'form-control input-sm','value' => $job_card_row->quantity]); ?>
								</td>
								<td>
								<a class="btn btn-xs btn-default addrow" href="#" role='button'><i class="fa fa-plus"></i></a><a class="btn btn-xs btn-default deleterow" href="#" role='button'><i class="fa fa-times"></i></a>
								</td>
							</tr>
							
						<?php $i++; } ?>
						</tbody>
					</table>
					</td>
				</tr>
			<?php// } ?>			
			</tbody>
		</table>

		<button type="submit" class="btn btn-primary" >GENERATE INVENTORY VOUCHER</button>
		<?= $this->Form->end() ?>
	
	</div>
</div>
<?php echo $this->Html->script('/assets/global/plugins/jquery.min.js'); ?>
