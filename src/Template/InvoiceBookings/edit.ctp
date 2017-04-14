<style>
.row_textbox{
	width: 100px;
}
.check_text{
	font-size:9px;
}
.add_check_text{
	font-size:9px;
}	
.table > thead > tr > th, .table > tbody > tr > th, .table > tfoot > tr > th, .table > thead > tr > td, .table > tbody > tr > td, .table > tfoot > tr > td{
	vertical-align: top !important;
}
</style>
<?php 
$this->Form->templates([
				'inputContainer' => '{{content}}'
			]);
			
    if($financial_year_data['Response'] == "Close" ){
 			echo "Financial Year Closed"; 

 		} else { ?>
<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption">
			<i class="icon-globe font-blue-steel"></i>
			<span class="caption-subject font-blue-steel uppercase">Edit Invoice Booking</span>
		</div>
		
	</div>
	
	
	<div class="portlet-body form">
		<?= $this->Form->create($invoiceBooking,['id'=> 'form_sample_3']) ?>
		
			<div class="form-body">
			
				<div class="row">
					
					<div class="col-md-3">
						<div class="form-group">
							<label class="control-label">GRN No.</label>
							<br/>
							<?= h(($invoiceBooking->grn->grn1.'/GRN-'.str_pad($invoiceBooking->grn->grn2, 3, '0', STR_PAD_LEFT).'/'.$invoiceBooking->grn->grn3.'/'.$invoiceBooking->grn->grn4)) ?>
						</div>
					</div>
					<div class="col-md-3">
						<div class="form-group">
							<label class="control-label">Supplier </label>
							<br/>
							<?php echo $this->Form->input('vendor_ledger_id', ['label' => false,'class' => 'form-control input-sm','type' =>'hidden','value'=>@$vendor_ledger_acc_id]); ?>
							<?php echo @$invoiceBooking->grn->vendor->company_name; ?>
						</div>
					</div>
					<div class="col-md-3" >
						<div class="form-group">
							<label class="control-label">Invoice Booking No</label></br>
							<?php echo $invoiceBooking->ib1.'/IB-'.str_pad($invoiceBooking->ib2, 3, '0', STR_PAD_LEFT).'/'.$invoiceBooking->ib3.'/'.$invoiceBooking->ib4; ?>
							<br/>
							<? ?>
						</div>
					</div>
					<div class="col-md-2 pull-right">
									<div class="form-group">
										<label class="control-label">Date</label>
										<br/>
										<?php echo date("d-m-Y"); ?>
									</div>
								</div>
				</div><br/>
				<div class="row" style="display:none;">
						<div class="form-group">
							<label class="control-label">Invoice Booking No. <span class="required" aria-required="true">*</span></label>
							<div class="row">
								<div class="col-md-3">
									<?php echo $this->Form->input('ib1', ['label' => false,'class' => 'form-control input-sm','readonly']); ?>
								</div>
								<div class="col-md-3">
									<?php echo $this->Form->input('ib2', ['label' => false,'class' => 'form-control input-sm','readonly']); ?>
								</div>
								<div class="col-md-3">
									<?php echo $this->Form->input('ib3', ['label' => false,'class' => 'form-control input-sm','placeholder'=>'File', 'readonly']); ?>
								</div>
								<div class="col-md-3">
									<?php echo $this->Form->input('ib4', ['label' => false,'class' => 'form-control input-sm','readonly']); ?>
								</div>
								<?php echo $this->Form->input('grn_id', ['label' => false,'class' => 'form-control input-sm','readonly']); ?>
							</div>
						</div>
				</div>
				
				<div class="row">
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">Supplier Invoice Date. <span class="required" aria-required="true">*</span></label>
								<?php echo $this->Form->input('supplier_date', ['type'=>'text','label' => false,'class' => 'form-control input-sm date-picker','placeholder'=>'Supplier Date','data-date-format'=>'dd-mm-yyyy','data-date-start-date' => '-60d','data-date-end-date' => '0d','value' => date("d-m-Y",strtotime($invoiceBooking->supplier_date))]); ?>
							
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
				<div style="overflow: auto;">
				<table class="table tableitm" id="main_tb">
				<thead>
					<tr>
						<th width="50">Sr.No. </th>
						<th style="white-space: nowrap;">Items</th>
						<th width="100">Unit Rate From PO</th>
						<th width="100">Quantity</th>
						<th width="100">Amount</th>
						<th width="100">Discount</th>
						<th width="100">P & F</th>
						<th width="100">Excise Duty</th>
						<th width="100">CST</th>
						<th width="100">Misc</th>
						<th width="100">Total</th>
						<th width="100">Rate to be post</th>
					</tr>
				</thead>
				<tbody>
					<?php
					$q=0; foreach ($invoiceBooking->invoice_booking_rows as $invoice_booking_row): ?>
						<tr class="tr1" row_no='<?php echo @$invoice_booking_row->id; ?>'>
							<td rowspan="2"><?php echo ++$q; --$q; ?></td>
							
							<td style="white-space: nowrap;"><?php echo $invoice_booking_row->item->name; ?>
							<?php echo $this->Form->input('invoice_booking_rows.'.$q.'.item_id', ['label' => false,'class' => 'form-control input-sm','type'=>'hidden','value' => @$invoice_booking_row->item->id,'popup_id'=>$q]); ?>
							</td>
							
							<td><?php echo $this->Form->input('invoice_booking_rows.'.$q.'.unit_rate_from_po',['value'=>$invoice_booking_row->unit_rate_from_po,'type'=>'text','label'=>false,'class'=>'form-control input-sm row_textbox']); ?></td>
							
							<td><?php echo $this->Form->input('invoice_booking_rows.'.$q.'.quantity',['label' => false,'class' => 'form-control input-sm','type'=>'text','value'=>$invoice_booking_row->quantity,'readonly']); ?></td>
							
							<td><?php echo $this->Form->input('invoice_booking_rows.'.$q.'.amount',['label' => false,'class' => 'form-control input-sm row_textbox','type'=>'text','readonly']); ?></td>
								
							<td>
							<?php echo $this->Form->input('invoice_booking_rows.'.$q.'.discount',['value'=>$invoice_booking_row->discount,'label'=>false,'type'=>'text','class'=>'form-control input-sm row_textbox']); ?>
							<?php echo $this->Form->input('invoice_booking_rows.'.$q.'.discount_per',['label'=>false,'type'=>'checkbox','class'=>'per_check']); ?>
							<span class="check_text">In Amount</span>
							
							</td>
								
							<td>
							<?php echo $this->Form->input('invoice_booking_rows.'.$q.'.pnf',['value'=> $invoice_booking_row->pnf,'label'=>false,'type'=>'text','class'=>'form-control input-sm row_textbox']); ?>
							<?php echo $this->Form->input('invoice_booking_rows.'.$q.'.pnf_per',['label'=>false,'type'=>'checkbox','class'=>'per_check']); ?>
							<span class="check_text">In Amount</span>
							</td>
							
							<td>
							<?php echo $this->Form->input('invoice_booking_rows.'.$q.'.excise_duty',['value'=>$invoice_booking_row->excise_duty,'label'=>false,'type'=>'text','class'=>'form-control input-sm row_textbox']); ?>
							<?php echo $this->Form->input('invoice_booking_rows.'.$q.'.excise_duty_per',['label'=>false,'type'=>'checkbox','class'=>'per_check']); ?>
							<span class="check_text">In Amount</span>
							</td>
							
							<td>
							<?php echo $this->Form->input('invoice_booking_rows.'.$q.'.sale_tax',['value'=>$invoice_booking_row->sale_tax,'label'=>false,'type'=>'text','class'=>'form-control input-sm row_textbox']); ?>
							<?php echo $this->Form->input('invoice_booking_rows.'.$q.'.sale_tax_per',['label'=>false,'type'=>'checkbox','class'=>'per_check']); ?>
							<span class="check_text">In Amount</span>
							</td>
							
							<td>
							<?php echo $this->Form->input('invoice_booking_rows.'.$q.'.misc',['value'=>$invoice_booking_row->misc,'label'=>false,'type'=>'text','class'=>'form-control input-sm row_textbox']); ?>
							<?php echo $this->Form->input('invoice_booking_rows.'.$q.'.misc_per',['label'=>false,'type'=>'checkbox','class'=>'add_check']); ?>
							<span class="add_check_text">To be add</span>
							</td>
							
							<td><?php echo $this->Form->input('invoice_booking_rows.'.$q.'.total',['label' => false,'class' => 'form-control input-sm row_textbox','type'=>'text','readonly']); ?></td>
							
							<td><?php echo $this->Form->input('invoice_booking_rows.'.$q.'.rate',['label' => false,'class' => 'form-control input-sm row_textbox','value'=>$invoice_booking_row->rate,'type'=>'text','readonly']); ?></td>
							
							
						</tr>
						<tr class="tr2" row_no='<?php echo @$invoice_booking_row->id; ?>'>
							<td colspan="11">
							<?php echo $this->Text->autoParagraph(h($invoice_booking_row->description)); ?>
							<?php echo $this->Form->input('invoice_booking_rows.'.$q.'.description',['label' => false,'class' => 'form-control input-sm','type'=>'hidden','value'=>$invoice_booking_row->description]); ?>
							</td>
							<td></td>
						</tr>

					<?php $q++;  endforeach; ?>
				
				</tbody>
				<tfoot>
					<tr>
						<td colspan="10" align="right"><b>Total</b></td>
						<td><?php echo $this->Form->input('total', ['type' => 'text','label' => false,'class' => 'form-control input-sm','placeholder' => 'Total','readonly']); ?></td>
						<td></td>
					</tr>
				</tfoot>
			</table>
			</div>
			<div class="row">
					<div class="col-md-12">
						<div class="form-group">
						<?php echo $this->Form->button('<i class="fa fa-plus"></i> New Ref', ['label' => false,'class' => 'btn btn-primary new_ref','type'=>'button']); ?>
						<?php echo $this->Form->button('<i class="fa fa-plus"></i> Agst Ref', ['label' => false,'class' => 'btn btn-primary agst_ref','type'=>'button']); ?>
						<?php echo $this->Form->button('<i class="fa fa-plus"></i> Advance', ['label' => false,'class' => 'btn btn-primary adv_ref','type'=>'button']); ?>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<table class="table table-bordered" id="main_table" style="text-align:center;">
						<thead>
						<tr>
						<td>Ref. Type</td>
						<td>Ref. No.</td>
						<td>Amount</td>
						<td></td>
						</tr>
						</thead>
						<tbody>
						<?php
						$ref_no=0;
						
						if(!empty($ReferenceBalances))
						{
							foreach($ReferenceBalances as $ReferenceBalancee=>$key)
							{
								foreach($key as $ReferenceBalance)
								{ 
									$ReferenceBalance_amount=$ReferenceBalance->credit-$ReferenceBalance->debit;
									
									if($ReferenceBalance_amount>0)
									{ 
										$itemGroups[]=['text'=>$ReferenceBalance->reference_no, 'value' =>$ReferenceBalance->reference_no,  'amount' => $ReferenceBalance_amount];
									}
								}
							}
						}
						foreach($ReferenceDetails as $ReferenceDetail)
						{				
							$ref_no++;
							if($ReferenceDetail->reference_type=='New Reference')
							{
								
							?>
							<tr>
							<td>New Ref<?= $this->Form->hidden('reference_type[]',['class'=>'','label'=>false, 'value'=>'New Reference']) ?></td>
							<td><?= $this->Form->input('reference_no[]',['type'=>'text','class'=>'form-control distinctreference','label'=>false,'id'=>'reference_no_'+$ref_no,'value'=>$ReferenceDetail->reference_no,'readonly']) ?></td>
							<td><?= $this->Form->input('credit[]',['type'=>'text','class'=>'form-control ','label'=>false,'value'=>$ReferenceDetail->credit]) ?>
							<?= $this->Form->hidden('old_amount[]',['type'=>'text','class'=>'form-control ','label'=>false, 'value'=>$ReferenceDetail->credit]) ?></td>
							<td><?= $this->Form->button(__('<i class="fa fa-trash-o"></i>'),['type'=>'button','class'=>'btn btn-danger btn-sm remove_row','label'=>false]) ?></td>
							</tr>
							<?php
							} 
							else if($ReferenceDetail->reference_type=='Against Reference')
							{ 
						
								$key=0;
								foreach($itemGroups as $itemGroup)
								{
									if($itemGroup['value']==$ReferenceDetail->reference_no)
									{
										//pr($ReferenceDetail->debit);
										 $itemGroups[$key]['amount']=$ReferenceDetail->credit;
									}
									$key++;
								}
							?>
							<tr class="against_references_no">
							<td>Agst Ref<?= $this->Form->hidden('reference_type[]',['class'=>'','label'=>false, 'value'=>'Against Reference']) ?><?= $this->Form->hidden('reference_no[]',['type'=>'text','class'=>'form-control ','label'=>false,'id'=>'reference_no_'+$ref_no,'value'=>$ReferenceDetail->reference_no]) ?></td>
							<td id="against_references_no">
							<?php echo $this->Form->input('against_references_no', ['empty'=>'--Select-','label' => false,'options' =>$itemGroups,'class' => 'form-control input-sm','value'=>$ReferenceDetail->reference_no,'readonly']); ?>
							</td>
							<td><?= $this->Form->input('debit[]',['type'=>'text','class'=>'form-control ','label'=>false, 'value'=>$ReferenceDetail->debit]) ?>
							<?= $this->Form->hidden('old_amount[]',['type'=>'text','class'=>'form-control ','label'=>false, 'value'=>$ReferenceDetail->credit]) ?></td></td>
							<td><?= $this->Form->button(__('<i class="fa fa-trash-o"></i>'),['type'=>'button','class'=>'btn btn-danger btn-sm remove_row','label'=>false]) ?></td>
							</tr>
							<?php
							} 
							else if($ReferenceDetail->reference_type=='Advance Reference')
							{ ?>
							<tr>
							<td>Adv Ref<?= $this->Form->hidden('reference_type[]',['class'=>'','label'=>false, 'value'=>'Advance Reference']) ?></td>
							<td><?= $this->Form->input('reference_no[]',['type'=>'text','class'=>'form-control distinctreference','label'=>false,'id'=>'reference_no_'+$ref_no,'value'=>$ReferenceDetail->reference_no,'readonly']) ?></td>
							<td><?= $this->Form->input('credit[]',['type'=>'text','class'=>'form-control ','label'=>false, 'value'=>$ReferenceDetail->credit]) ?>
							<?= $this->Form->hidden('old_amount[]',['type'=>'text','class'=>'form-control ','label'=>false, 'value'=>$ReferenceDetail->credit]) ?></td></td>
							<td><?= $this->Form->button(__('<i class="fa fa-trash-o"></i>'),['type'=>'button','class'=>'btn btn-danger btn-sm remove_row','label'=>false]) ?></td>
							</tr>
							<?php
							}
						}
						?>
						</tbody>
						</table>
					</div>
				  </div>
		</div>
		<div class="form-actions">
			<div class="row">
				<div class="col-md-3">
				<?= $this->Form->button(__('UPDATE BOOK INVOICE'),['class'=>'btn btn-primary','id'=>'add_submit','type'=>'Submit']) ?>
					
				</div>
			</div>
		</div>
	</div>	
		<?= $this->Form->end() ?>
</div>	
		<table class="table table-bordered" id="new_ref" style="display:none;">
			<tbody>
			<tr>
			<td>New Ref<?= $this->Form->hidden('reference_type[]',['class'=>'','label'=>false, 'value'=>'New Reference']) ?></td>
			<td><?= $this->Form->input('reference_no[]',['type'=>'text','class'=>'form-control distinctreference','label'=>false,'id'=>'reference_no_2']) ?></td>
			<td><?= $this->Form->input('credit[]',['type'=>'text','class'=>'form-control ','label'=>false, 'value'=>0]) ?></td>
			<td><?= $this->Form->button(__('<i class="fa fa-trash-o"></i>'),['type'=>'button','class'=>'btn btn-danger btn-sm remove_row','label'=>false]) ?></td>
			</tr>
			</tbody>
		</table>
		<table class="table table-bordered" id="agst_ref" style="display:none;">
			<tbody>
			<tr class="against_references_no">
			<td>Agst Ref<?= $this->Form->hidden('reference_type[]',['class'=>'','label'=>false, 'value'=>'Against Reference']) ?><?= $this->Form->hidden('reference_no[]',['type'=>'text','class'=>'form-control ','label'=>false,'id'=>'reference_no_2']) ?></td>
			<td id="against_references_no">
			<?php echo $this->Form->input('against_references_no', ['empty'=>'--Select-','label' => false,'options' =>$itemGroups,'class' => 'form-control input-sm']); ?>
			</td>
			<td><?= $this->Form->input('credit[]',['type'=>'text','class'=>'form-control ','label'=>false, 'value'=>0]) ?></td>
			<td><?= $this->Form->button(__('<i class="fa fa-trash-o"></i>'),['type'=>'button','class'=>'btn btn-danger btn-sm remove_row','label'=>false]) ?></td>
			</tr>
			</tbody>
		</table>
		<table class="table table-bordered" id="adv_ref" style="display:none;">
		<tbody>
			<tr>
			<td>Adv Ref<?= $this->Form->hidden('reference_type[]',['class'=>'','label'=>false, 'value'=>'Advance Reference']) ?></td>
			<td><?= $this->Form->input('reference_no[]',['type'=>'text','class'=>'form-control distinctreference','label'=>false,'id'=>'reference_no_2']) ?></td>
			<td><?= $this->Form->input('credit[]',['type'=>'text','class'=>'form-control ','label'=>false, 'value'=>0]) ?></td>
			<td><?= $this->Form->button(__('<i class="fa fa-trash-o"></i>'),['type'=>'button','class'=>'btn btn-danger btn-sm remove_row','label'=>false]) ?></td>
			</tr>
			</tbody>
		</table>				

<style>
.table thead tr th {
    color: #FFF;
	background-color: #254b73;
}
</style>
<?php echo $this->Html->css('/drag_drop/jquery-ui.css'); ?>
<?php echo $this->Html->script('/drag_drop/jquery-1.12.4.js'); ?>
<?php echo $this->Html->script('/drag_drop/jquery-ui.js'); ?>
<?php echo $this->Html->script('/assets/global/plugins/jquery.min.js'); ?>

<script>
$(document).ready(function() {
	//--------- FORM VALIDATION
   
	$('.per_check').die().live("click",function() {
		if($(this).is(':checked')==true){
			$(this).closest('td').find('span.check_text').text('In percentages');
		}else{
			$(this).closest('td').find('span.check_text').text('In amount');
		}
		calculate_total();
    });
	
	$('.add_check').die().live("click",function() {
		if($(this).is(':checked')==true){
			$(this).closest('td').find('span.add_check_text').text('To be subtract');
		}else{
			$(this).closest('td').find('span.add_check_text').text('To be add');
		}
		calculate_total();
    });
	
   calculate_total();
	$('#main_tb input').die().live("keyup",function() { 
		calculate_total();
    });
	function calculate_total(){
		var row_total=0;
		$("#main_tb tbody tr.tr1").each(function(){
			var urate=parseFloat($(this).find("td:nth-child(3) input").val());
			var qty=parseFloat($(this).find("td:nth-child(4) input").val());
			var amount=urate*qty;
			$(this).find("td:nth-child(5) input").val(amount.toFixed(2));
		
			var discount=parseFloat($(this).find("td:nth-child(6) input").val());
			if($(this).find('td:nth-child(6) input[type="checkbox"]').is(':checked')==true){
				var amount_after_discount=amount*(100-discount)/100;
			}else{
				var amount_after_discount=amount-discount;
			}
			
			var pnf=parseFloat($(this).find("td:nth-child(7) input").val());
			if($(this).find('td:nth-child(7) input[type="checkbox"]').is(':checked')==true){
				var amount_after_pnf=amount_after_discount*(100+pnf)/100;
			}else{
			
				var amount_after_pnf=amount_after_discount+pnf;
			}
			
			var ex=parseFloat($(this).find("td:nth-child(8) input").val());
			if($(this).find('td:nth-child(8) input[type="checkbox"]').is(':checked')==true){
				var amount_after_ex=amount_after_pnf*(100+ex)/100;
			}else{
				var amount_after_ex=amount_after_pnf+ex;
			}
			
			var saletax=parseFloat($(this).find("td:nth-child(9) input").val());
			if($(this).find('td:nth-child(9) input[type="checkbox"]').is(':checked')==true){
				var amount_after_saletax=amount_after_ex*(100+saletax)/100;
			}else{
				var amount_after_saletax=amount_after_ex+saletax;
			}
			
			var misc=parseFloat($(this).find("td:nth-child(10) input").val());
			if($(this).find('td:nth-child(10) input[type="checkbox"]').is(':checked')==true){
				var amount_after_misc=amount_after_saletax-misc;
			}else{
				var amount_after_misc=amount_after_saletax+misc;
			}
			
			
			$(this).find("td:nth-child(11) input").val(amount_after_misc.toFixed(2));
			row_total=row_total+amount_after_misc;
			
			$(this).find("td:nth-child(12) input").val((amount_after_misc/qty).toFixed(5));
		});
		$('input[name="total"]').val(row_total.toFixed(2));
	}
   
   
   
   
			$( document ).on( 'keyup', 'input[name="credit[]"]', function() {
			var credit=parseFloat($(this).val());
			var amount=$(this).closest('tr').find('select[name="against_references_no"] option:selected').attr('amount');
			amount=parseFloat(amount);

			if(amount<credit)
			{
				$(this).val(amount);
			}
				
	});
	
	$('select[name="against_references_no"]').live("change",function() {
		var against_references_no=$(this).val();
		var amount=eval($('option:selected',this).attr('amount'));
		
		$(this).closest('tr').find('input[name="reference_no[]"]').val(against_references_no);
		$(this).closest('tr').find('input[name="credit[]"]').val(amount);
	});
	var received_from_id=$(this).find('input[name="vendor_ledger_id"]').val();
	//alert(received_from_id);
	<?php
	if(empty($ReferenceBalances) || empty($itemGroups))
	{
		?>
			
			//var received_from_id=$('select[name="received_from_id"] option:selected').val();
			
			var url="<?php echo $this->Url->build(['controller'=>'ReceiptVouchers','action'=>'fetchReferenceNo']); ?>";
			url=url+'/'+received_from_id,
			
			$.ajax({
				url: url,
				type: 'GET',
				dataType: 'text'
			}).done(function(response) { 
				
				$("#main_table tbody").find('tr.against_references_no').remove();
				
				$('#against_references_no').html(response);
			});
			
		<?php
	}
	?>
	$('input[name="amount"],[name^=credit]').live("blur",function() {
		var val=$(this).val();
		$(this).val(parseFloat($(this).val()).toFixed(2));
	});
		$( document ).on( 'click', '.new_ref', function() {
		var new_line=$('#new_ref tbody').html();
		$("#main_table tbody").append(new_line);
		var i=1;
		var len=$("[name^=reference_no]").length;
		
		$("[name^=reference_no]").each(function () {
			
			$(this).attr('id','reference_no_'+i);
			
			$(this).rules("add", {
				required: true,
				noSpace: true,
				notEqualToGroup: ['.distinctreference']
			});
			i++;
		});
	});
	$( document ).on( 'click', '.agst_ref', function() {
		var new_line=$('#agst_ref tbody').html();
		$("#main_table tbody").append(new_line);
		var i=1;
		var len=$("[name^=reference_no]").length;
		
		$("[name^=reference_no]").each(function () {
			
			$(this).attr('id','reference_no_'+i);
			
			$(this).rules("add", {
				required: true,
				noSpace: true,
				notEqualToGroup: ['.distinctreference']
			});
			i++;
		});
	});
	$( document ).on( 'click', '.adv_ref', function() {
		var new_line=$('#adv_ref tbody').html();
		$("#main_table tbody").append(new_line);
		var i=1;
		var len=$("[name^=reference_no]").length;
		
		$("[name^=reference_no]").each(function () {
			
			$(this).attr('id','reference_no_'+i);
			
			$(this).rules("add", {
				required: true,
				noSpace: true,
				notEqualToGroup: ['.distinctreference']
			});
			i++;
		});
	});
	
	$( document ).on( 'click', '.remove_row', function() {
		
		var current_obj=$(this).closest("#main_table tr");
		
		var old_amount=$(this).closest("#main_table tr").find('input[name="old_amount[]"]').val();
		
		if(old_amount)
		{
			var reference_type=$(this).closest("#main_table tr").find('input[name="reference_type[]"]').val();
			var reference_no=$(this).closest("#main_table tr").find('input[name="reference_no[]"]').val();
			var ledger_account_id=$('input[name="vendor_ledger_id"]').val();
			
			
			var invoice_booking_id='<?php echo $invoice_booking_id; ?>';
			
			var url="<?php echo $this->Url->build(['controller'=>'InvoiceBookings','action'=>'deleteReceiptRow']); ?>";
			url=url+'?reference_type='+reference_type+'&old_amount='+old_amount+'&ledger_account_id='+ledger_account_id+'&invoice_booking_id='+invoice_booking_id+'&reference_no='+reference_no,
			$.ajax({
				url: url,
				type: 'GET',
				dataType: 'text'
			}).done(function(response) {
				alert(response);
				current_obj.remove();
				var i=1;
				var len=$("[name^=reference_no]").length;
				
				$("[name^=reference_no]").each(function () {
					
					$(this).attr('id','reference_no_'+i);
					$(this).rules("add", {
						required: true,
						noSpace: true,
						notEqualToGroup: ['.distinctreference']
					});
					i++;
				});
			});
		}
		else
		{
			current_obj.closest("#main_table tr").remove();
				var i=1;
				var len=$("[name^=reference_no]").length;
				
				$("[name^=reference_no]").each(function () {
					
					$(this).attr('id','reference_no_'+i);
					$(this).rules("add", {
						required: true,
						noSpace: true,
						notEqualToGroup: ['.distinctreference']
					});
					i++;
				});
		}
		
	});
		////////////////  Validation  ////////////////////////
	
	jQuery.validator.addMethod("noSpace", function(value, element) { 
	  return value.indexOf(" ") < 0 && value != ""; 
	}, "No space please and don't leave it empty");
	
	jQuery.validator.addMethod("notEqualToGroup", function (value, element, options) {
    // get all the elements passed here with the same class
    var elems = $(element).parents('form').find(options[0]);
    // the value of the current element
    var valueToCompare = value;
    // count
    var matchesFound = 0;
    // loop each element and compare its value with the current value
    // and increase the count every time we find one
    jQuery.each(elems, function () {
        thisVal = $(this).val();
        if (thisVal == valueToCompare) {
            matchesFound++;
        }
    });
    // count should be either 0 or 1 max
    if (this.optional(element) || matchesFound <= 1) {
        //elems.removeClass('error');
        return true;
    } else {
        //elems.addClass('error');
    }
}, jQuery.format("Please enter a Unique Value."));

	//--------- FORM VALIDATION
	var form3 = $('#form_sample_3'); 
	var error3 = $('.alert-danger', form3);
	var success3 = $('.alert-success', form3);
	form3.validate({
		errorElement: 'span', //default input error message container
		errorClass: 'help-block help-block-error', // default input error message class
		focusInvalid: true, // do not focus the last invalid input
		ignore: ":hidden,[readonly=readonly]",
		rules: {
			advance: {
				min:0,
			},
			cheque_no :{
				required: true,
			},
			'reference_no[]':{
					required: true,
					noSpace: true,
					notEqualToGroup: ['.distinctreference'],
					remote : {
                    url: '<?php echo $this->Url->build(['controller'=>'Ledgers','action'=>'check_reference_no']); ?>',
                    type: "get",
                    data:
                        { 
                            ledger_account_id: function(){return $('input[name=vendor_ledger_id]').val();}
                        },
					},
				}
		},
		messages: {
			'reference_no[]': {
				remote: "Reference no. is alredy taken."
			},
		},
		errorPlacement: function (error, element) { // render error placement for each input type
			if (element.parent(".input-group").size() > 0) {
				error.insertAfter(element.parent(".input-group"));
			} else if (element.attr("data-error-container")) { 
				error.appendTo(element.attr("data-error-container"));
			} else if (element.parents('.radio-list').size() > 0) { 
				error.appendTo(element.parents('.radio-list').attr("data-error-container"));
			} else if (element.parents('.radio-inline').size() > 0) { 
				error.appendTo(element.parents('.radio-inline').attr("data-error-container"));
			} else if (element.parents('.checkbox-list').size() > 0) {
				error.appendTo(element.parents('.checkbox-list').attr("data-error-container"));
			} else if (element.parents('.checkbox-inline').size() > 0) { 
				error.appendTo(element.parents('.checkbox-inline').attr("data-error-container"));
			} else {
				error.insertAfter(element); // for other inputs, just perform default behavior
			}
		},

		invalidHandler: function (event, validator) { //display error alert on form submit   
			success3.hide();
			error3.show();
			$("#add_submit").removeAttr("disabled");
			//Metronic.scrollTo(error3, -200);
		},

		highlight: function (element) { // hightlight error inputs
		   $(element)
				.closest('.form-group').addClass('has-error'); // set error class to the control group
		},

		unhighlight: function (element) { // revert the change done by hightlight
			$(element)
				.closest('.form-group').removeClass('has-error'); // set error class to the control group
		},

		success: function (label) {
			label
				.closest('.form-group').removeClass('has-error'); // set success class to the control group
		},

		submitHandler: function (form) {
			var amount=parseFloat($('input[name="total"]').val());
		
				var credit=0;
				$("[name^=credit]").each(function () {
					credit=credit+parseFloat($(this).val());
				});
				credit=credit.toFixed(2);
				if(amount==credit)
				{
					success3.show();
					error3.hide();
					form[0].submit();
				}
				else
				{
					$("#add_submit").removeAttr("disabled");
					alert("Amount mismatch.");
				}
				
			
			// // submit the form
		}

	});
	


});

</script>

<?php } ?>
