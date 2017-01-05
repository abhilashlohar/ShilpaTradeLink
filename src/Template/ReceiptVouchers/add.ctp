<style>
.padding-right-decrease{
	padding-right: 0;
}
.padding-left-decrease{
	padding-left: 0;
}
.table > thead > tr > th, .table > tbody > tr > th, .table > tfoot > tr > th, .table > thead > tr > td, .table > tbody > tr > td, .table > tfoot > tr > td{
	vertical-align: top !important;
}
</style>
<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption" >
			<i class="icon-globe font-blue-steel"></i>
			<span class="caption-subject font-blue-steel uppercase">Receipt Voucher</span>
		</div>
	</div>
	<div class="portlet-body form">
		<!-- BEGIN FORM-->
		 <?= $this->Form->create($receiptVoucher,['type' => 'file','id'=>'form_sample_3']) ?>
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
						<label class=" control-label">Receipt Date<span class="required" aria-required="true">*</span></label>
							<?php echo $this->Form->input('transaction_date', ['type' => 'text','label' => false,'class' => 'form-control input-sm date-picker','data-date-format' => 'dd-mm-yyyy','value' => date("d-m-Y")]); ?>
						
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">Recived Form<span class="required" aria-required="true">*</span></label>
							<?php echo $this->Form->input('received_from_id', ['empty'=>'--Select-','label' => false,'class' => 'form-control input-sm select2me']); ?>
						
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">Bank/Cash<span class="required" aria-required="true">*</span></label>
							
							
							<?php echo $this->Form->input('bank_cash_id', ['empty'=>'--Select-','label' => false,'class' => 'form-control input-sm select2me']); ?>
						
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
										['value' => 'Cheque', 'text' => 'Cheque','checked'],
										['value' => 'Cash', 'text' => 'Cash']
									]
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
							<?php echo $this->Form->input('amount', ['type'=>'text','label' => false,'class' => 'form-control input-sm','placeholder'=>'Amount','id'=>'total_received_amount']); ?>
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">Narration <span class="required" aria-required="true">*</span></label>
							<?php echo $this->Form->input('narration', ['label' => false,'class' => 'form-control input-sm','placeholder'=>'Narration']); ?>
						</div>
					</div>
				</div>
				
				<br/>
				<table width="100%">
					<tr>
						<td width="45%" valign="top" id="pending_invpice_container"></td>
						<td></td>
						<td width="45%" valign="top">
							<h4>Adjust received amount</h4>
							<table class="table tableitm" id="main_tb" >
								<thead>
									<tr>
										<th width="3%">Sr.No. </th>
										<th width="30%">Type</th>
										<th width="37%">Reference</th>
										<th width="20%">Amount</th>
										<th width="10%"></th>
									</tr>
								</thead>
								<tbody id="main_tbody">
								
								</tbody>
								<tfoot>
									<tr>
										<td colspan="3" align="right"><b>Total</b></td>
										<td><?php echo $this->Form->input('total_of_breakups', ['type' => 'text','label' => false,'class' => 'form-control input-sm','placeholder' => 'Total','readonly','value'=>'0.00']); ?></td>
										<td></td>
									</tr>
								</tfoot>
							</table>
						</td>
					</tr>
				</table>
				
				<label class="control-label">Total adjusted amount</label> <input type="text" name="total_adjusted_amount" class="form-control input-sm" readonly="readonly" placeholder="Total Adjusted Amount" style="width:200px;"/>
			</div>
		
			<div class="form-actions">
				<button type="submit" class="btn btn-primary">ADD RECEIPT VOUCHER</button>
			</div>
		</div>
		<?= $this->Form->end() ?>
		<!-- END FORM-->
	</div>
</div>
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
			total_adjusted_amount: {
				equalTo: "#total_received_amount"
			},
		},
		messages: {
			total_adjusted_amount: {
				equalTo: "Please adjust complete received amount."
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
	
	$('.addrow').die().live("click",function() { 
		add_row();
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
			$(this).find("td:nth-child(2) select").attr({name:"receipt_breakups["+i+"][type]", id:"receipt_breakups-"+i+"-type"}).rules("add", "required");
			
			var type=$(this).find("td:nth-child(2) option:selected").val();
			if(type=='On Account' || type==''){
				$(this).find("td:nth-child(3) input:eq(0)").attr({name:"receipt_breakups["+i+"][q]", id:"receipt_breakups-"+i+"-q"}).rules("remove", "required");
			}else{
				$(this).find("td:nth-child(3) input:eq(0)").attr({name:"receipt_breakups["+i+"][new_ref_no]", id:"receipt_breakups-"+i+"-new_ref_no"}).rules("add", "required");
			}
			
			$(this).find("td:nth-child(4) input").attr({name:"receipt_breakups["+i+"][amount]", id:"receipt_breakups-"+i+"-amount"}).rules("add", "required");
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
	
	$(".check_row").die().live("click",function() {
		if($(this).is(':checked')){
			$(this).closest('tr').find('.amount_box').removeAttr('readonly');
			var invoice_amount=$(this).closest('tr').find('.amount_box').attr('invoice_amount');
			$(this).closest('tr').find('.amount_box').val(invoice_amount);
		}else{
			$(this).closest('tr').find('.amount_box').attr('readonly','readonly');
			$(this).closest('tr').find('.amount_box').val('');
		}
	});
	
	$('select[name="received_from_id"]').die().live("change",function() {
		var received_from_id=$(this).find('option:selected').val();
		$("#pending_invpice_container").html('<div align="center"><?php echo $this->Html->image('/img/wait.gif', ['alt' => 'wait']); ?> Loading</div>');
		var url="<?php echo $this->Url->build(['controller'=>'Invoices','action'=>'DueInvoicesForReceipt']); ?>";
		url=url+'/'+received_from_id,
		$.ajax({
			url: url,
		}).done(function(response) {
			$("#pending_invpice_container").html(response);
			Metronic.init();
		});
	});
	
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
				Please select received from
			</div>
			<div class="modal-footer">
				<button class="btn default closebtn">Close</button>
			</div>
		</div>
	</div>
</div>
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
			cheque_no :{
				required: true,
			},
			amount :{
				required: true,
				digits :true
			}
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
			Metronic.scrollTo(error3, -200);
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
			q="ok";
			$("#main_tb tbody tr").each(function(){
				var t=$(this).find("td:nth-child(2) input").val();
				var w=$(this).find("td:nth-child(3) input").val();
				var r=$(this).find("td:nth-child(4) input").val();
				if(t=="" || w=="" || r==""){
					q="e";
				}
			});
			if(q=="e"){
				$("#row_error").show();
				return false;
			}else{
				success3.show();
				error3.hide();
				form[0].submit(); // submit the form
			}
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
	
	
});
</script>