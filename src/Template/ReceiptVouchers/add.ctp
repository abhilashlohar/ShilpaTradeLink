<style>

.padding-right-decrease{
	padding-right: 0;
}
.padding-left-decrease{
	padding-left: 0;
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
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">Amount<span class="required" aria-required="true">*</span></label>
							<?php echo $this->Form->input('amount', ['label' => false,'class' => 'form-control input-sm quantity']); ?>
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
				<div style="width: 70%;">
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
							<td><?php echo $this->Form->input('total_of_breakups', ['type' => 'text','label' => false,'class' => 'form-control input-sm','placeholder' => 'Total']); ?></td>
							<td></td>
						</tr>
					</tfoot>
				</table>
				</div>
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
		ignore: [],
		rules: {
			
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
			success3.show();
			error3.hide();
			form[0].submit(); // submit the form
		}

	});
		$('.quantity').die().live("keyup",function() {
		var asc=$(this).val();
		var numbers =  /^[0-9]*\.?[0-9]*$/;
		if(asc==0)
		{
			$(this).val('');
			return false; 
		}
		else if(asc.match(numbers))  
		{  
		} 
		else  
		{  
			$(this).val('');
			return false;  
		}
	});
	$('input[name="amount"]').die().live("keyup",function() { 
		var asc=$(this).val();
			var numbers =  /^[0-9]*\.?[0-9]*$/;
			if(asc.match(numbers))  
			{  
			} 
			else  
			{  
				$(this).val('');
				return false;  
			}
	});
	
	
	$('.addrow').die().live("click",function() { 
		add_row();
    });
	
	add_row();
	function add_row(){
		var tr1=$("#sample_tb tbody tr").clone();
		$("#main_tb tbody#main_tbody").append(tr1);
		rename_rows();
	}
	
	$('.deleterow').die().live("click",function() {
		var l=$(this).closest("table tbody").find("tr").length;
		if (confirm("Are you sure to remove row ?") == true) {
			if(l>1){
				var row_no=$(this).closest("tr").remove();
				rename_rows();
			}
		} 
    });
	
	function rename_rows(){
		var i=0;
		$("#main_tb tbody tr").each(function(){
			i++;
			$(this).find("td:nth-child(1)").html(i);
			$(this).find("td:nth-child(2) select").attr({name:"receipt_breakups["+i+"][type]", id:"receipt_breakups-"+i+"-type"}).rules("add", "required");
			var type=$(this).find("td:nth-child(2) option:selected").val();
			if(type=='Against Ref'){
				$(this).find("td:nth-child(3) input:eq(0)").attr({name:"receipt_breakups["+i+"][invoice_id]", id:"receipt_breakups-"+i+"-invoice_id"}).rules("add", "required");
				$(this).find("td:nth-child(3) input:eq(1)").attr({name:"receipt_breakups["+i+"][q]", id:"receipt_breakups-"+i+"-q"}).rules("remove", "required");
				$(this).find("td:nth-child(3) span[for=receipt_breakups-"+i+"-new_ref_no]").remove();
				
			}else if(type=='On Account' || type==''){
				$(this).find("td:nth-child(3) input:eq(0)").attr({name:"receipt_breakups["+i+"][q]", id:"receipt_breakups-"+i+"-q"}).rules("remove", "required");
				$(this).find("td:nth-child(3) input:eq(1)").attr({name:"receipt_breakups["+i+"][q]", id:"receipt_breakups-"+i+"-q"}).rules("remove", "required");
			}else{
				$(this).find("td:nth-child(3) input:eq(0)").attr({name:"receipt_breakups["+i+"][q]", id:"receipt_breakups-"+i+"-q"}).rules("remove", "required");
				$(this).find("td:nth-child(3) input:eq(1)").attr({name:"receipt_breakups["+i+"][new_ref_no]", id:"receipt_breakups-"+i+"-new_ref_no"}).rules("add", "required");
				$(this).find("td:nth-child(3) span[for=receipt_breakups-"+i+"-invoice_id]").remove();
			}
			
			$(this).find("td:nth-child(4) input").attr({name:"receipt_breakups["+i+"][amount]", id:"receipt_breakups-"+i+"-amount"}).rules("add", "required");
		})
	}
	
	
	$('.type').die().live("change",function() {
		var type=$(this).find('option:selected').val();
		if(type=='Against Ref'){
			$(this).closest('tr').find('td:nth-child(3)').find('a').show();
			$(this).closest('tr').find('td:nth-child(3)').find('input:eq(1)').hide();
		}else if(type=='On Account' || type==''){
			$(this).closest('tr').find('td:nth-child(3)').find('a').hide();
			$(this).closest('tr').find('td:nth-child(3)').find('input:eq(1)').hide();
		}else{
			$(this).closest('tr').find('td:nth-child(3)').find('a').hide();
			$(this).closest('tr').find('td:nth-child(3)').find('input:eq(1)').show();
		}
		
		rename_rows();
	});
	
	$('.select_ref').die().live("click",function() {
		$('#myModal1').show();
	});
	
	$('.closebtn').live("click",function() { 
		$(".modal").hide();
    });
	
	$('select[name="received_from_id"]').die().live("change",function() {
		var received_from_id=$(this).find('option:selected').val();
		$("#result_ajax").html('<div align="center"><?php echo $this->Html->image('/img/wait.gif', ['alt' => 'wait']); ?> Loading</div>');
		var url="<?php echo $this->Url->build(['controller'=>'Invoices','action'=>'DueInvoicesForReceipt']); ?>";
		url=url+'/'+received_from_id,
		$.ajax({
			url: url,
		}).done(function(response) {
			$("#result_ajax").html(response);
		});
	});
});
</script>

<table id="sample_tb" style="display:none;">
	<tbody >
		<tr>
			<td>0</td>
			<td><?php 
			$options=['Against Ref'=>'Against Ref','New Ref'=>'New Ref','On Account'=>'On Account','Advance'=>'Advance'];
			echo $this->Form->input('type', ['empty'=>'--select--','options' => $options,'label' => false,'class' => 'form-control input-sm type','placeholder' => 'Rate']); ?></td>
			<td>
				<a href="#" role="button" class="select_ref" style="display:none;">Select Ref</a>
				<?php echo $this->Form->input('invoice_id', ['type' => 'hidden','class' => 'my_item']); ?>
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
				
			</div>
			<div class="modal-footer">
				<button class="btn default closebtn">Close</button>
			</div>
		</div>
	</div>
</div>