
<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption" >
			<i class="icon-globe font-blue-steel"></i>
			<span class="caption-subject font-blue-steel uppercase">Add Journal Voucher</span>
		</div>
	</div>
	<div class="portlet-body form">
		<!-- BEGIN FORM-->
		 <?= $this->Form->create($journalVoucher,['type' => 'file','id'=>'form_sample_3']) ?>
			<div class="form-body">
			<div class="row">
				<div class="col-md-4" >
						<div class="form-group">
						<label class=" control-label">Company<span class="required" aria-required="true">*</span></label>
							<?php 
							$options=array();
							foreach($companies as $companie){
								$options[]=['text' => $companie->name, 'value' => $companie->id, 'alias' => $companie->alias];
							}
							echo $this->Form->input('company_id',['options' => $options,'empty' => "--Select Company--",'label' => false,'class' => 'form-control input-sm select2me'] ); ?>
						
						</div>
				</div>
				
				<div class="col-md-4" >
						<div class="form-group">
						<label class=" control-label">Transaction Date<span class="required" aria-required="true">*</span></label>
							<?php echo $this->Form->input('transaction_date', ['type' => 'text','label' => false,'class' => 'form-control input-sm date-picker','data-date-format' => 'dd-mm-yyyy','value' => date("d-m-Y")]); ?>
						
						</div>
				</div>
			</div>
			<table class="table tableitm" id="main_tb">
				<thead>
					<tr>
						<th>Ledger Account</th>
						<th width="130">Debit/Credit</th>
						<th width="130"></th>
						<th width="130">Amount</th>
						<th width="70"></th>
					</tr>
				</thead>
				<tbody id="main_tbody">
				
				</tbody>
				<tfoot>
					<tr>
						<td align="left"><b>Narration</b></td>
						<td ><?php echo $this->Form->input('narration', ['type' => 'text','label' => false,'class' => 'form-control input-sm','placeholder' => 'Narration']); ?></td>
						<td  align="right"><b>Total</b></td>
						<td><?php echo $this->Form->input('total', ['type' => 'text','label' => false,'class' => 'form-control input-sm','placeholder' => 'Total']); ?></td>
						<td></td>
					</tr>
				</tfoot>
			</table>
			
			
				
			</div>
			<div class="form-actions">
				<button type="submit" class="btn btn-primary">ADD VOUCHER REFERENCE</button>
			</div>
		</div>
		<?= $this->Form->end() ?>
		<!-- END FORM-->
	</div>
</div>

<style>
.table thead tr th {
    color: #FFF;
	background-color: #254b73;
}
.padding-right-decrease{
	padding-right: 0;
}
.padding-left-decrease{
	padding-left: 0;
}
</style>

<table id="sample_tb" style="display:none;">
	<tbody >
		<tr>
			<td>
				<div class="row">
					<div class="col-md-11 padding-right-decrease">
						<?php echo $this->Form->input('item_id', ['empty'=>'Select','options' => $ledgers,'label' => false,'class' => 'form-control input-sm select2me ','placeholder' => 'Item']); ?>
					</div>

				</div>
			</td>
			<td>
				<div class="row">
					<div class="col-md-11 padding-right-decrease">
						<?php 
						$options=['Dr'=>'Dr','Cr'=>'Cr'];
						echo $this->Form->input('dr_cr', ['empty'=>'Select','options' => $options,'label' => false,'class' => 'form-control input-sm select2me ','placeholder' => 'Item']); ?>
					</div>

				</div>
			</td>
			<td></td>
			<td width="130"><?php echo $this->Form->input('amount', ['type' => 'number','label' => false,'class' => 'form-control input-sm rate', 'min'=>'0.01','placeholder' => 'Rate']); ?></td>
			<td  width="70"><a class="btn btn-xs btn-default addrow" href="#" role='button'><i class="fa fa-plus"></i></a><a class="btn btn-xs btn-default deleterow" href="#" role='button'><i class="fa fa-times"></i></a></td>
		</tr>
	
	</tbody>
	
</table>

<div id="terms_conditions" style="display:none;"></div>
<?php echo $this->Html->script('/assets/global/plugins/jquery.min.js'); ?>
<style>
#sortable li{
	cursor: -webkit-grab;
}
</style>
<?php echo $this->Html->css('/drag_drop/jquery-ui.css'); ?>
<?php echo $this->Html->script('/drag_drop/jquery-1.12.4.js'); ?>
<?php echo $this->Html->script('/drag_drop/jquery-ui.js'); ?>

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
			rules: {
				company_id:{
					required: true,
				},
				date : {
					  required: true,
				},
				customer_id : {
					  required: true,
				},
				customer_address : {
					  required: true,
				},
				
				employee_id:{
					required: true
				},
				category_id:{
					required: true,
				},
				
				finalisation_date:{
					required: true,
				},
				customer_for_attention : {
					  required: true,
				},
				enquiry_no  : {
					  required: true,
				},
				customer_contact: {
					  required: true,
				},
				subject:{
					required: true,	
				},
				qt1:{
					required: true,	
				},
				qt3:{
					required: true,	
				},
				qt4:{
					required: true,	
				}
			},
		},

		messages: { // custom messages for radio buttons and checkboxes
			membership: {
				required: "Please select a Membership type"
			},
			service: {
				required: "Please select  at least 2 types of Service",
				minlength: jQuery.validator.format("Please select  at least {0} types of Service")
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
			success3.show();
			error3.hide();
			form[0].submit(); // submit the form
		}

	});
	//--	 END OF VALIDATION
	

	add_row(); add_row();
	
    $('.addrow').die().live("click",function() {
		add_row();
	});		
		

	function add_row(){
		
		var tr1=$("#sample_tb tbody tr").clone();
		$("#main_tb tbody#main_tbody").append(tr1);
		
		var i=0;
		$("#main_tb tbody").each(function(){
			i++;
			$(this).find("td:nth-child(1) select").attr({name:"quotation_rows["+i+"][item_id]", id:"quotation_rows-"+i+"-item_id",}).select2().rules("add", "required");
			$(this).find("td:nth-child(2) select").attr({name:"quotation_rows["+i+"][item_id]", id:"quotation_rows-"+i+"-item_id",}).select2().rules("add", "required");
			$(this).find("td:nth-child(4) input").attr({name:"quotation_rows["+i+"][rate]", id:"quotation_rows-"+i+"-rate"}).rules("add", "required");
	
		});
	}
	
	
		$('.deleterow').die().live("click",function() {
		var l=$(this).closest("table tbody").find("tr").length;
		if (confirm("Are you sure to remove row ?") == true) {
			if(l>3){
				var row_no=$(this).closest("tr").attr("row_no");
				var del="tr[row_no="+row_no+"]";
				$(del).remove();
				var i=0;
				$("#main_tb tbody tr.tr1").each(function(){
							i++;
								$(this).find("td:nth-child(1) select").attr({name:"quotation_rows["+i+"][item_id]", id:"quotation_rows-"+i+"-item_id",}).select2().rules("add", "required");
								$(this).find("td:nth-child(2) select").attr({name:"quotation_rows["+i+"][item_id]", id:"quotation_rows-"+i+"-item_id",}).select2().rules("add", "required");
								$(this).find("td:nth-child(4) input").attr({name:"quotation_rows["+i+"][rate]", id:"quotation_rows-"+i+"-rate"}).rules("add", "required");
						});		
				calculate_total();
			}
		} 
    });	
	
});
</script>