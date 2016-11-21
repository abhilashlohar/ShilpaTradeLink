<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption" >
			<i class="icon-globe font-blue-steel"></i>
			<span class="caption-subject font-blue-steel uppercase">Edit Vendor</span>
		</div>
	</div>
	<div class="portlet-body form">
		<!-- BEGIN FORM-->
		 <?= $this->Form->create($vendor,['type' => 'file','id'=>'form_sample_3']) ?>
			<div class="form-body">
				<div class="row">
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">Company Name <span class="required" aria-required="true">*</span></label>
							<?php echo $this->Form->input('company_name', ['label' => false,'class' => 'form-control input-sm firstupercase','placeholder'=>'Company Name']); ?>
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">Address <span class="required" aria-required="true">*</span></label>
							<?php echo $this->Form->input('address', ['label' => false,'class' => 'form-control input-sm','placeholder'=>'Address']); ?>
						</div>
					</div>
					<div class="col-md-3">
						<div class="form-group">
							<label class="control-label">Item Group Id <span class="required" aria-required="true">*</span></label>
							<?php echo $this->Form->input('item_group_id', ['empty'=>'--Select--','options'=>$ItemGroups,'label' => false,'class' => 'form-control input-sm select2me']); ?>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="col-md-2">
						<div class="form-group">
							<label class="control-label">Tin No <span class="required" aria-required="true">*</span></label>
							<?php echo $this->Form->input('tin_no', ['label' => false,'class' => 'form-control input-sm ','placeholder'=>'Tin No']); ?>
						</div>
					</div>
					<div class="col-md-2">
						<div class="form-group">
							<label class="control-label">Gst No</label>
							<?php echo $this->Form->input('gst_no', ['label' => false,'class' => 'form-control input-sm nospace','placeholder'=>'Gst No']); ?>
						</div>
					</div>
					<div class="col-md-2">
						<div class="form-group">
							<label class="control-label">ECC No</label>
							<?php echo $this->Form->input('ecc_no', ['label' => false,'class' => 'form-control input-sm nospace','placeholder'=>'ECC No']); ?>
						</div>
					</div>
					<div class="col-md-2">
						<div class="form-group">
							<label class="control-label">Pan No</label>
							<?php echo $this->Form->input('pan_no', ['label' => false,'class' => 'form-control input-sm','placeholder'=>'Pan No']); ?>
						</div>
					</div>
					<div class="col-md-2">
						<div class="form-group">
							<label class="control-label">Payment Terms</label>
							<?php echo $this->Form->input('payment_terms', ['label' => false,'class' => 'form-control input-sm','placeholder'=>'Payment Terms']); ?>
						</div>
					</div>
					<div class="col-md-2">
						<div class="form-group">
							<label class="control-label">Mode of Payment</label>
							<?php echo $this->Form->input('mode_of_payment', ['label' => false,'class' => 'form-control input-sm nospace','placeholder'=>'Mode of Payment']); ?>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">Account Category<span class="required" aria-required="true">*</span></label>
							<?php echo $this->Form->input('account_category_id', ['options'=>$AccountCategories,'empty' => "--Select Account Category--",'label' => false,'class' => 'form-control input-sm select2me']); ?>
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-group">
						<label class="control-label">Account Group <span class="required" aria-required="true">*</span></label>
							<div id="account_group_div">
							<?php echo $this->Form->input('account_group_id', ['options' => [],'label' => false,'class' => 'form-control input-sm select2me','placeholder'=>'Account Group']); ?>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-group">
						<label class="control-label">Account First Sub Group <span class="required" aria-required="true">*</span></label>
							<div id="account_first_subgroup_div">
							<?php echo $this->Form->input('account_first_subgroup_id', ['options' => [],'label' => false,'class' => 'form-control input-sm select2me','placeholder'=>'Account First Sub Group']); ?>
							</div>
						</div>
					</div>
				</div>
				<h4 style="font-size:13px'">Contact Persons</h4>
				<table class="table table-condensed tableitm" id="main_tb">
					<thead>
						<tr>
							<th><label class="control-label">Sr.No.<label></th>
							<th><label class="control-label">NAME<label></th>
							<th><label class="control-label">EMAIL<label></th>
							<th><label class="control-label">MOBILE<label></th>
							<th><label class="control-label">DEFAULT<label></th>
						</tr>
					</thead>
					<tbody>
						<?php $i=0; foreach($vendor->vendor_contact_persons as $vendor_contact_person){ $i++; ?>
						<tr>
							<td><?= h($i) ?></td>
							<td><?php echo $this->Form->input('vendor_contact_persons.'.$i.'.name', ['label' => false,'class' => 'form-control input-sm','placeholder'=>'Bank Name','value'=>$vendor_contact_person->name]); ?></td>
							<td><?php echo $this->Form->input('vendor_contact_persons.'.$i.'.email', ['label' => false,'class' => 'form-control input-sm','placeholder'=>'Branch','value'=>$vendor_contact_person->email]); ?></td>
							<td><?php echo $this->Form->input('vendor_contact_persons.'.$i.'.mobile', ['label' => false,'class' => 'form-control input-sm','placeholder'=>'Account No','value'=>$vendor_contact_person->mobile]); ?></td>
							<td><a class="btn btn-xs btn-default addrow" href="#" role='button'><i class="fa fa-plus"></i></a><a class="btn btn-xs btn-default deleterow" href="#" role='button'><i class="fa fa-times"></i></a></td>
						</tr>
						<?php } ?>
					</tbody>
				</table>
                <div class="alert alert-danger" id="row_error" style="display:none;">
                    Fill all fileds.
                </div>
			</div>
		
			<div class="form-actions">
				<button type="submit" class="btn btn-primary">EDIT VENDOR</button>
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
			company_name:{
				required: true,
			},
			address  : {
				  required: true,
			},
			tin_no  : {
				  required: true,
			},
			ecc_no   : {
				  required: true,
			},
			pan_no   :{
				required: true,
			},
			payment_terms :{
				required: true,
			},
			mode_of_payment   :{
				required: true,
			},
			address : {
				  required: true,
			},
			item_group_id : {
				  required: true,
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
	//--	 END OF VALIDATION
	
	$('.default_btn:first').attr('checked','checked'); $.uniform.update();
    $('.addrow').die().live("click",function() { 
		add_row();
    });
	
	$('.default_btn').die().live("click",function() { 
		$('.default_btn').removeAttr('checked');
		$(this).attr('checked','checked');
		$.uniform.update();
    });
	
	$('.deleterow').die().live("click",function() {
		$('input[name="customer_contacts[0][default_address]"]').val("DEFAULT").css('background-color','#DDD');
		var l=$(this).closest("table tbody").find("tr").length;
		if (confirm("Are you sure to remove row ?") == true) {
			if(l>1){
				$(this).closest("tr").remove();
				var i=0;
				$("#main_tb tbody tr").each(function(){
					
					$(this).find("td:nth-child(1)").html(++i); --i;
					$(this).find("td:nth-child(2) input").attr("name","vendor_contact_persons["+i+"][name]");
					$(this).find("td:nth-child(3) input").attr("name","vendor_contact_persons["+i+"][email]");
					$(this).find("td:nth-child(4) input").attr("name","vendor_contact_persons["+i+"][mobile]");
					$(this).find("td:nth-child(6) input[type=checkbox]").attr("name","vendor_contact_persons["+i+"][default_person]");
					i++;
					
				});
				calculate_total();
			}
		} 
    });
	
	function add_row(){
		var tr=$("#sample_tb tbody tr").clone();
		$("#main_tb tbody").append(tr);
		var i=0;
		$("#main_tb tbody tr").each(function(){
			
			$(this).find("td:nth-child(1)").html(++i); --i;
			$(this).find("td:nth-child(2) input").attr("name","vendor_contact_persons["+i+"][name]");
			$(this).find("td:nth-child(3) input").attr("name","vendor_contact_persons["+i+"][email]");
			$(this).find("td:nth-child(4) input").attr("name","vendor_contact_persons["+i+"][mobile]");
			$(this).find("td:nth-child(5) input[type=checkbox]").attr("name","vendor_contact_persons["+i+"][default_person]");
			var test = $("input[type=radio]:not(.toggle),input[type=checkbox]:not(.toggle)");
			if (test) { test.uniform(); }
			i++;
		});
	}
	
});
</script>

<table id="sample_tb" style="display:none;">
	<tbody>
		<tr>
			<td>0</td>
			<td><?php echo $this->Form->input('q', ['label' => false,'class' => 'form-control input-sm','placeholder'=>'Name']); ?></td>
			<td><?php echo $this->Form->input('q', ['label' => false,'class' => 'form-control input-sm','placeholder'=>'Email']); ?></td>
			<td><?php echo $this->Form->input('q', ['label' => false,'class' => 'form-control input-sm','placeholder'=>'Mobile']); ?></td>
			<td><a class="btn btn-xs btn-default addrow" href="#" role='button'><i class="fa fa-plus"></i></a><a class="btn btn-xs btn-default deleterow" href="#" role='button'><i class="fa fa-times"></i></a></td>
		</tr>
	</tbody>
</table>


