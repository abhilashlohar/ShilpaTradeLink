<?php //pr($grn->purchase_order->pnf); exit; ?>
<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption">
			<i class="icon-globe font-blue-steel"></i>
			<span class="caption-subject font-blue-steel uppercase">Add Invoice Booking</span>
		</div>
		<div class="actions">
			<?php echo $this->Html->link('<i class="icon-home"></i> Pull Grn','/Grns/index?pull-request=true',array('escape'=>false,'class'=>'btn btn-xs blue')); ?>
		</div>
	</div>
	
	<?php if(!empty($grn)) { ?>
	<div class="portlet-body form">
		<?= $this->Form->create($invoiceBooking) ?>
		<div class="form-body">
			<div class="form-body">
				<div class="row">
					
					<div class="col-md-5">
						<div class="form-group">
							<label class="control-label">Invoice No. <span class="required" aria-required="true">*</span></label>
							<?php echo $this->Form->input('invoice_no', ['type' => 'text','label' => false,'class' => 'form-control input-sm','placeholder' => 'Invoice NO']); ?>
							<br/>
							<? ?>
						</div>
					</div>
					
					<div class="form-actions">
						<div class="row">
							<div class="col-md-4">
								<button type="submit" class="btn btn-primary">BOOK INVOICE</button>
							</div>
						</div>
					</div>
				</div>
					
			</div>
		</div>
	<?= $this->Form->end() ?>
			
			<div class="form-body">		
			<div class="row">
					<div class="col-md-3">
						<div class="form-group">
							<label class="control-label">Company <span class="required" aria-required="true">*</span></label>
							<br/>
							<?php echo @$grn->company->name; ?>
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">GRN No. <span class="required" aria-required="true">*</span></label>
							<br/>
							<?= h(($grn->grn1.'/PO-'.str_pad($grn->id, 3, '0', STR_PAD_LEFT).'/'.$grn->grn3.'/'.$grn->grn4)) ?>
						</div>
					</div>
					<div class="col-md-3">
						<div class="form-group">
							<label class="control-label">Supplier <span class="required" aria-required="true">*</span></label>
							<br/>
							<?php echo @$grn->vendor->company_name; ?>
						</div>
					</div>
					<div class="col-md-2">
						<div class="form-group">
							<label class="control-label">Date</label>
							<br/>
							<?php echo date("d-m-Y"); ?>
						</div>
					</div>
				</div><br/>
				
				<div class="alert alert-danger" id="row_error_item" style="display:none;padding: 5px !important;">
					Please check at least one row.
				</div>
							<table class="table tableitm" id="main_tb">
				<thead>
					<tr>
						<th width="50">Sr.No. </th>
						<th>Items</th>
						<th width="150">Quantity</th>
						<th width="150">Rate</th>
						<th width="150">Ammount</th>
						<th width="50"></th>
						
					</tr>
				</thead>
				<tbody>
					<?php $total=0; $sum=0;
					$q=0; foreach ($grn->grn_rows as $grn_rows): 
											?>
						<tr class="tr1" row_no='<?php echo @$grn_rows->id; ?>'>
							<td rowspan="2"><?php echo ++$q; --$q; ?></td>
							<td><?php echo $grn_rows->item->name; ?></td>
							<td><?php echo $grn_rows->quantity; ?></td>
							<td><?php echo $grn->purchase_order->purchase_order_rows[$q]->rate; ?></td>
							<td><?php echo $sum=$grn_rows->quantity*$grn->purchase_order->purchase_order_rows[$q]->rate ?></td>
						</tr>
						<tr class="tr2" row_no='<?php echo @$grn_rows->id; ?>'>
							<td colspan="4"><?php echo $this->Text->autoParagraph(h($grn->purchase_order->purchase_order_rows[$q]->description)); ?>
							</td>
							<td></td>
						</tr>
					<?php $q++; $total=$total+$sum; endforeach; ?>
					<tr>
						<td colspan="3"><?php  ?></td>
						<td><b> Total Amount</b> </td>
						<td><?php echo $total; ?></td>
					</tr>
					<tr>
						<td colspan="3"><?php  ?></td>
						<td><b> Discount</b> </td>
						<td><?php echo $grn->purchase_order->discount; echo $grn->purchase_order->discount_type; ?></td>
					</tr>
					<tr>
						<td colspan="3"><?php  ?></td>
						<td><b> P & F</b> </td>
						<td><?php echo $grn->purchase_order->pnf; echo $grn->purchase_order->pnf_type; ?></td>
					</tr>
				</tbody>
				
			</table>
			

			</div>
			
			
		</div>
	
	</div>
	<?php } ?>
</div>	
<style>
.table thead tr th {
    color: #FFF;
	background-color: #254b73;
}
</style>


