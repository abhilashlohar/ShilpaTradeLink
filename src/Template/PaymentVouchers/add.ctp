<?php if(@$ErrorpaidTos){
		?> 
		<div class="actions">
				<?php echo $this->Html->link('Create Ledger Account For PaymentVoucher -> Paid To','/VouchersReferences/edit/1',array('escape'=>false,'class'=>'btn btn-primary')); ?>
		</div>
		<?php } 
		 else if(@$ErrorbankCashes){
		?> 
		<div class="actions">
				<?php echo $this->Html->link('Create Ledger Account For PaymentVoucher -> Cash/Bank','/VouchersReferences/edit/2',array('escape'=>false,'class'=>'btn btn-primary')); ?>
		</div>
<?php }  else { ?>

<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption">
			<i class="icon-globe font-blue-steel"></i>
			<span class="caption-subject font-blue-steel uppercase">Add Payment Voucher</span>
		</div>
	</div>
	<div class="portlet-body form">
		<!-- BEGIN FORM-->
		 <?= $this->Form->create($paymentVoucher,['type' => 'file','id'=>'form_sample_3']) ?>
		<div class="form-body">
			<div class="row">
				
				<div class="col-md-9">
				</div>
				<div class="col-md-3">
					<div class="form-group">
						<label class="col-md-3 control-label">Date</label>
						<div class="col-md-9">
							<?php echo $this->Form->input('created_on', ['type' => 'text','label' => false,'class' => 'form-control input-sm','value' => date("d-m-Y"),'readonly']); ?>
						</div>
					</div>
				</div>
			</div>
				<div class="row" style="margin-top:30px;">
					<div class="col-md-4" >
						<div class="form-group">
						<label class=" control-label">Transaction Date<span class="required" aria-required="true">*</span></label>
							<?php echo $this->Form->input('transaction_date', ['type' => 'text','label' => false,'class' => 'form-control input-sm date-picker','data-date-format' => 'dd-mm-yyyy','placeholder' => 'Transaction Date','value' => date("d-m-Y")]); ?>
						
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">Paid To <span class="required" aria-required="true">*</span></label>
							<?php 
							echo $this->Form->input('paid_to_id', ['options'=>$paidTos,'empty'=>'--Select-','label' => false,'class' => 'form-control input-sm select2me']); ?>
						</div>
					</div>
				<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">Cash/Bank<span class="required" aria-required="true">*</span></label>
							<?php 
							echo $this->Form->input('cash_bank_account_id', ['options'=>$bankCashes,'empty'=>'--Select-','label' => false,'class' => 'form-control input-sm select2me']); ?>
						</div>
						
					</div>
				
				</div>
				<div class="row">
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">Mode of Payment<span class="required" aria-required="true">*</span></label>
							<div class="radio-list">
								<div class="radio-inline" >
								<?php echo $this->Form->radio(
									'payment_mode',
									[
										['value' => 'Cheque', 'text' => 'Cheque', 'checked'],
										['value' => 'Cash', 'text' => 'Cash'],
										['value' => 'NEFT/RTGS', 'text' => 'NEFT/RTGS']
								); ?>
								</div>
                                
							</div>
						</div>
						<div class="form-group" id="chq_no">
							<label class="control-label">Cheque No<span class="required" aria-required="true">*</span></label>
							<?php 
							echo $this->Form->input('cheque_no', ['type'=>'text','label' => false,'class' => 'form-control input-sm','placeholder'=>'Cheque No']); ?>
						</div>
					</div>
					
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">Amount<span class="required" aria-required="true">*</span></label>
							<?php echo $this->Form->input('amount', ['label' => false,'class' => 'form-control input-sm quantity','placeholder' => 'Amount','id'=>'total_paid_amount','type'=>'text']); ?>
						</div>
						<div class="form-group">
							<label class="control-label">Receipt Type<span class="required" aria-required="true">*</span></label>
							<div class="radio-list">
								<div class="radio-inline" >
								<?php echo $this->Form->radio(
									'receipt_type',
									[
										['value' => 'New Ref', 'text' => 'New Ref','checked'],
										['value' => 'Agst Ref', 'text' => 'Agst Ref'],
										['value' => 'On Account', 'text' => 'On Account'],
									]
								); ?>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">Narration<span class="required" aria-required="true">*</span></label>
							<?php echo $this->Form->input('narration', ['label' => false,'class' => 'form-control input-sm','placeholder' => 'Narration']); ?>
						</div>
					</div>
				</div>
				<?php echo $this->Form->input('bill_to_bill', ['label' => false,'class' => 'form-control input-sm','type'=>'text','id'=>'bill_to_bill','style'=>'height:0px; border:none; widht:0px;']); ?>
			
				<div id="bill_to_bill_show" style="display:none;">
					<table width="100%">
						<tr>
							<td width="45%" valign="top" id="pending_invoice_container"></td>
							<td></td>
							
						</tr>
					</table>
				</div>
			</div>
			<div class="form-actions">
				<button type="submit" class="btn btn-primary">ADD PAYMENT VOUCHER</button>
			</div>
		</div>
		<?= $this->Form->end() ?>
		<!-- END FORM-->
	</div>

<?php } ?>
<?php echo $this->Html->script('/assets/global/plugins/jquery.min.js'); ?>
<script>
$(document).ready(function() {
	//--------- FORM VALIDATION
	var form3 = $('#form_sample_3');
	var error3 = $('.alert-danger', form3);
	var success3 = $('.alert-success', form3);
	form3.validate({
		errorElement: 'span', //default input error message container
		errorClass: 'help-block help-block-error', // default input error message class
		focusInvalid: true, // do not focus the last invalid input
		rules: {
			cheque_no:{
				required: true,
			},
			advance: {
				min:0,
			},
		},
		messages: {
			
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
			success3.show();
			error3.hide();
			form[0].submit(); // submit the form
		}

	});
	
	$('input[name="payment_mode"]').die().live("click",function() {
		var payment_mode=$(this).val();
		
		if(payment_mode=="Cheque"){
			$("#chq_no").show();
		}else{
			$("#chq_no").hide();
		}
	});
	
	$('.addrow').die().live("click",function() { 
		add_row();
    });
	
	
	$('.deleterow').die().live("click",function() {
		var l=$(this).closest("table tbody").find("tr").length;
		if(l>1){
			$(this).closest('tr').remove();
			rename_rows_new_ref();
		}
    });
	
	add_row();
	function add_row(){
		var tr1=$("#sample_tb tbody tr").clone();
		$("#main_tb tbody#main_tbody").append(tr1);
		rename_rows_new_ref();
		
	}
	
	function rename_rows_new_ref(){
		var i=0;
		$("#main_tb tbody#main_tbody tr").each(function(){
			$(this).find("td:nth-child(1)").html(++i); i--;
			$(this).find("td:nth-child(2) select").attr({name:"new_ref_record["+i+"][type]", id:"new_ref_record-"+i+"-type"});
			
			var type=$(this).find("td:nth-child(2) option:selected").val();
			if(type=='On Account' || type==''){
				$(this).find("td:nth-child(3) input:eq(0)").attr({name:"new_ref_record["+i+"][q]", id:"new_ref_record-"+i+"-q"});
			}else{
				$(this).find("td:nth-child(3) input:eq(0)").attr({name:"new_ref_record["+i+"][new_ref_no]", id:"new_ref_record-"+i+"-new_ref_no"});
			}
			
			$(this).find("td:nth-child(4) input").attr({name:"new_ref_record["+i+"][amount]", id:"new_ref_record-"+i+"-amount"});
			i++;
			
		});
	}
	
	$('.type').die().live("change",function() {
		var type=$(this).find('option:selected').val();
		if(type=='On Account' || type==''){
			$(this).closest('tr').find('td:nth-child(3)').find('input:eq(0)').hide();
		}else{
			$(this).closest('tr').find('td:nth-child(3)').find('input:eq(0)').show();
		}
		
		rename_rows_new_ref();
	});
	
	$('input[name="amount"]').live("blur",function() {
		var val=$(this).val();
		$(this).val(parseFloat($(this).val()).toFixed(2));
	});
	
	$(".check_row").die().live("click",function() {
		if($(this).is(':checked')){
			$(this).closest('tr').find('.amount_box').removeAttr('readonly');
			var invoice_booking_amount=$(this).closest('tr').find('.amount_box').attr('invoice_booking_amount');
			$(this).closest('tr').find('.amount_box').val(invoice_booking_amount);
			calculation_for_total();
   
		}else{
			$(this).closest('tr').find('.amount_box').attr('readonly','readonly');
			$(this).closest('tr').find('.amount_box').val('');
			calculation_for_total();
		}
	});
	
	$('select[name="paid_to_id"]').die().live("change",function() {
		var paid_to_id=$(this).find('option:selected').val();
		var url1="<?php echo $this->Url->build(['controller'=>'LedgerAccounts','action'=>'BillToBillAccount']); ?>";
		url1=url1+'/'+paid_to_id,
		$.ajax({
			url: url1,
		}).done(function(response) {
			$("#bill_to_bill").val(response);
			var receipt_mode=$('input[name="receipt_type"]').val();
			var bill_to_bill=$("#bill_to_bill").val();
			if((receipt_mode=="Agst Ref")&&(bill_to_bill=='Yes')){
			$('#bill_to_bill_show').show();
			}else{
			$('#bill_to_bill_show').hide();
			}
		});
		
		$("#pending_invoice_container").html('<div align="center"><?php echo $this->Html->image('/img/wait.gif', ['alt' => 'wait']); ?> Loading</div>');
		var url="<?php echo $this->Url->build(['controller'=>'InvoiceBookings','action'=>'DueInvoiceBookingsForPayment']); ?>";
		url=url+'/'+paid_to_id,
		$.ajax({
			url: url,
		}).done(function(response) {
			$("#pending_invoice_container").html(response);
			
		});
	});
	
	$('input[name="receipt_type"]').die().live("click",function() {
		var receipt_mode=$(this).val();
		var bill_to_bill=$("#bill_to_bill").val();
		if((receipt_mode=="Agst Ref")&&(bill_to_bill=='Yes')){
			$('#bill_to_bill_show').show();
		}else{
			$('#bill_to_bill_show').hide();
		}
	});
	
	calculation_for_total();
	$('input').live("keyup",function() {
		calculation_for_total();
	});
	
	function calculation_for_total(){  
		var total_left=0; var total_right=0; var sum=0;
		$("#due_payment tbody tr.tr1").each(function(){ 
			var val=$(this).find('td:nth-child(1) input[type="checkbox"]:checked').val();
			if(val){
				var qty=parseFloat($(this).find('.amount_box').val());
				total_left=total_left+qty;
			} 	
			$('input[name="total_amount_agst"]').val(total_left.toFixed(2));	
			var total_agst = $('input[name="total_amount_agst"]').val();
			var total_paid_amount= $('#total_paid_amount').val();
			var advance_amt=total_paid_amount-total_agst;
			$('input[name="advance"]').val(advance_amt.toFixed(2));
		});
		
	}
	
});
	
</script>

<table id="sample_tb" style="display:none;">
	<tbody >
		<tr>
			<td>0</td>
			<td><?php 
			$options=['New Ref'=>'New Ref','On Account'=>'On Account','Advance'=>'Advance'];
			echo $this->Form->input('type', ['empty'=>'--select--','options' => $options,'label' => false,'class' => 'form-control input-sm type','placeholder' => 'Rate']); ?></td>
			<td>
				<?php echo $this->Form->input('new_ref', ['label' => false,'class' => 'form-control input-sm','placeholder' => 'Type New Ref','style'=>'display:none']); ?>
			</td>
			<td><?php echo $this->Form->input('amount[]', ['type' => 'text','label' => false,'class' => 'form-control input-sm','placeholder' => 'Amount']); ?></td>
			<td><a class="btn btn-xs btn-default addrow" href="#" role='button'><i class="fa fa-plus"></i></a><a class="btn btn-xs btn-default deleterow" href="#" role='button'><i class="fa fa-times"></i></a></td>
		</tr>
	</tbody>
</table>

<div id="myModal1" class="modal fade in" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1" aria-hidden="false" style="display: none; padding-right: 12px;"><div class="modal-backdrop fade in" ></div>
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-body" id="result_ajax">
				Please select paid from
			</div>
			<div class="modal-footer">
				<button class="btn default closebtn">Close</button>
			</div>
		</div>
	</div>
</div>

