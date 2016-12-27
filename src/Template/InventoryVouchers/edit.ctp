
<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption">
			<i class="icon-globe font-blue-steel"></i>
			<span class="caption-subject font-blue-steel uppercase">Edit Inventory Vouchers</span>
		</div>
	</div>
	<div class="portlet-body form">
		<!-- BEGIN FORM-->
		<?= $this->Form->create($inventoryVoucher,['id'=>'form_sample_3']) ?>
			<div class="form-body">
				<div class="row">
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">Invoice No :  <span class="required" aria-required="true"></span></label>
							<?php echo $inventoryVoucher->invoice->in1.'/IN-'.str_pad($inventoryVoucher->invoice->in2, 3, '0', STR_PAD_LEFT).'/'. $inventoryVoucher->invoice->in3.'/'. $inventoryVoucher->invoice->in4; ?>
						</div>
					</div>
				</div>	
				
				<div class="table-scrollable">
					<table class="table tableitm" id="main_tb">
						<thead>
							<tr>
								<th width="50">Sr.No. </th>
								<th>Items</th>
								<th width="130">Quantity</th>
								<th width="70"></th>
							</tr>
						</thead>
						<tbody>
						
						<?php $q=0; foreach ($inventoryVoucher->inventory_voucher_rows as $inventory_voucher_row): ?>
						<tr class="tr1 preimp" row_no='<?php echo @$inventory_voucher_row->id; ?>'>
							<td width="10"><?php echo ++$q; --$q; ?><?php echo $this->Form->input('inventory_voucher_row.'.$q.'.id'); ?></td>
							<td><?php echo $this->Form->input('inventory_voucher_row['.$q.'][item_id]', ['options' => $items,'label' => false,'class' => 'form-control input-sm select2me item_box','value' => $inventory_voucher_row->item_id]); ?></td>
							<td width="100"><?php echo $this->Form->input('inventory_voucher_row['.$q.'][quantity]', ['label' => false,'class' => 'form-control input-sm quantity','placeholder' => 'Quantity','value' => $inventory_voucher_row->quantity]); ?></td>
							<td  width="70"><a class="btn btn-xs btn-default addrow" href="#" role='button'><i class="fa fa-plus"></i></a><a class="btn btn-xs btn-default deleterow" href="#" role='button'><i class="fa fa-times"></i></a></td>
						</tr>	
						<?php $q++; endforeach; ?>
						</tbody>
					</table>
				</div>
				
	
			</div>
		</div>
			<div class="form-actions">
				 <button type="submit" class="btn blue-hoki">Update Inventory Vouchers</button>
			</div>
		<?= $this->Form->end() ?>
		<!-- END FORM-->
	</div>
</div>

<table id="sample_tb" style="display:none;">
	<tbody>
		<tr class="tr1 preimp">
			<td width="10">0</td>
			<td><?php echo $this->Form->input('q', ['empty'=>'Select','options' => $items,'label' => false,'class' => 'form-control input-sm select2-offscreen']); ?></td>
			<td width="100"><?php echo $this->Form->input('q', ['label' => false,'class' => 'form-control input-sm quantity','placeholder' => 'Quantity']); ?></td>
			
			<td  width="70"><a class="btn btn-xs btn-default addrow" href="#" role='button'><i class="fa fa-plus"></i></a><a class="btn btn-xs btn-default deleterow" href="#" role='button'><i class="fa fa-times"></i></a></td>
		</tr>
		
	</tbody>
</table>
<?php echo $this->Html->script('/assets/global/plugins/jquery.min.js'); ?>
<style>
#sortable li{
	cursor: -webkit-grab;
}
 
.table thead tr th {
    color: #FFF;
	background-color: #254b73;
}
</style>
<?php echo $this->Html->css('/drag_drop/jquery-ui.css'); ?>
<?php echo $this->Html->script('/drag_drop/jquery-1.12.4.js'); ?>
<?php echo $this->Html->script('/drag_drop/jquery-ui.js'); ?>

<script>
$( function() {
$( "#sortable" ).sortable();
$( "#sortable" ).disableSelection();
} );
</script>
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
				customer_id : {
					  required: true,
				},
				po1 : {
					  required: true,
				},
				po3:{
					required: true
				},
				po4:{
					required: true,
				},
				
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
	

    $('.addrow').die().live("click",function() { 
		add_row();
    });
	
	function add_row(){
		var tr1=$("#sample_tb tbody tr.tr1").clone();
		$("#main_tb tbody").append(tr1);
		var i=0;
		$("#main_tb tbody tr.tr1").each(function(){
			i++;
			$(this).find("td:nth-child(1)").html(i);
			$(this).find("td:nth-child(2) select").attr("name","inventory_voucher_rows["+i+"][item_id]").select2().rules("add", "required");
			$(this).find("td:nth-child(3) input").attr("name","inventory_voucher_rows["+i+"][quantity]").rules("add", "required");
			
		});
		
	}
	
		$('.deleterow').die().live("click",function() {
		var l=$(this).closest("table tbody").find("tr").length;
		if (confirm("Are you sure to remove row ?") == true) {
			
				var del=$(this).closest("tr");
				$(del).remove();
				var i=0;
				$("#main_tb tbody tr.tr1").each(function(){
					i++;
					$(this).find("td:nth-child(1)").html(i);
					$(this).find("td:nth-child(2) select").attr("name","inventory_voucher_rows["+i+"][item_id]").select2();
					$(this).find("td:nth-child(3) input").attr("name","inventory_voucher_rows["+i+"][quantity]");
					
				});
		} 
    });
	
});
</script>

