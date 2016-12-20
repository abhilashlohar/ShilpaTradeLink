<?php //pr($grn->grn_rows); exit; ?>
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
			
				<div class="row">
					<div class="col-md-3">
						<div class="form-group">
							<label class="control-label">Company <span class="required" aria-required="true">*</span></label>
							<br/>
							<?php echo @$grn->company->name; ?>
						</div>
					</div>
					<div class="col-md-3">
						<div class="form-group">
							<label class="control-label">GRN No. <span class="required" aria-required="true">*</span></label>
							<br/>
							<?= h(($grn->grn1.'/GRN-'.str_pad($grn->grn2, 3, '0', STR_PAD_LEFT).'/'.$grn->grn3.'/'.$grn->grn4)) ?>
						</div>
					</div>
					<div class="col-md-3">
						<div class="form-group">
							<label class="control-label">Supplier <span class="required" aria-required="true">*</span></label>
							<br/>
							<?php echo @$grn->vendor->company_name; ?>
						</div>
					</div>
					<div class="col-md-3 pull-right" >
						<div class="form-group">
							<label class="control-label">Invoice Booking No</label></br>
							<?php echo $grn->grn1.'/IB-'.str_pad($last_ib_no->ib2, 3, '0', STR_PAD_LEFT).'/'.$grn->grn3.'/'.$grn->grn4; ?>
							<br/>
							<? ?>
						</div>
					</div>
				</div><br/>
				
				<div class="row">
					<div class="col-md-4" style="display:none;">
						<div class="form-group">
							<label class="control-label">Invoice Booking No. <span class="required" aria-required="true">*</span></label>
							<div class="row">
								<div class="col-md-3">
									<?php echo $this->Form->input('ib1', ['label' => false,'class' => 'form-control input-sm','readonly','value'=>@$grn->company->alias]); ?>
								</div>
								<div class="col-md-3">
									<?php echo $this->Form->input('ib2', ['label' => false,'class' => 'form-control input-sm', 'value'=>@$last_ib_no->ib2, 'readonly']); ?>
								</div>
								<div class="col-md-3">
									<?php echo $this->Form->input('ib3', ['label' => false,'class' => 'form-control input-sm','placeholder'=>'File', 'value'=>@$grn->grn3,'readonly']); ?>
								</div>
								<div class="col-md-3">
									<?php echo $this->Form->input('ib4', ['label' => false,'value'=>'16-17','class' => 'form-control input-sm','readonly']); ?>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">Invoice No. <span class="required" aria-required="true">*</span></label>
							<?php echo $this->Form->input('invoice_no', ['type' => 'text','label' => false,'class' => 'form-control input-sm','placeholder' => 'Invoice NO']); ?>
							<br/>
							<? ?>
						</div>
					</div>
				</div>

				<table class="table tableitm" id="main_tb">
				<thead>
					<tr>
						<th width="50">Sr.No. </th>
						<th>Items</th>
						<th width="130">Quantity</th>
						<th width="130">Rate</th>
						<th width="130">Amount</th>
						<th width="70"></th>
					</tr>
				</thead>
				
				<tbody >
					<?php $total=0; $sum=0;
					$q=0; foreach ($grn->grn_rows as $grn_rows): ?>
							<tr class="tr1" row_no='<?php echo @$grn_rows->id; ?>'>
							<td rowspan="2"><?php echo ++$q; --$q; ?></td>
							<td><?php echo $grn_rows->item->name; ?>
							<?php echo $this->Form->input('invoice_booking_rows.'.$q.'.item_id', ['label' => false,'class' => 'form-control input-sm','type'=>'hidden','value' => @$grn_rows->item->id,'popup_id'=>$q]); ?>
							</td>
						
							<td><?php echo $this->Form->input('invoice_booking_rows.'.$q.'.quantity',['label' => false,'class' => 'form-control input-sm', 'value'=>$grn_rows->quantity]); ?></td>
							<td><?php echo $this->Form->input('invoice_booking_rows.'.$q.'.rate',['label' => false,'class' => 'form-control input-sm','value'=>$grn->purchase_order->purchase_order_rows[$q]->rate,]); ?></td>
							<td><?php echo $this->Form->input('invoice_booking_rows.'.$q.'.amount',['label' => false,'class' => 'form-control input-sm','value'=>$grn->purchase_order->purchase_order_rows[$q]->rate*$grn_rows->quantity]); ?></td>
							
						</tr>
						<tr class="tr2" row_no='<?php echo @$grn_rows->id; ?>'>
							<td colspan="4">
							<?php echo $this->Text->autoParagraph(h($grn->purchase_order->purchase_order_rows[$q]->description)); ?>
							<?php echo $this->Form->input('invoice_booking_rows.'.$q.'.description',['label' => false,'class' => 'form-control input-sm','type'=>'hidden','value'=>$grn->purchase_order->purchase_order_rows[$q]->description]); ?>
							</td>
							<td></td>
						</tr>
					
					<?php $q++; $total=$total+$sum; endforeach; ?>
				
				</tbody>
				
			</table>
					
				<div class="form-actions">
						<div class="row">
							<div class="col-md-3">
								<button type="submit" class="btn btn-primary">BOOK INVOICE</button>
							</div>
						</div>
					</div>
				</div>
					
			</div>
 
<?= $this->Form->end() ?>
			
			<div class="form-body">		
			

				
		 
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


