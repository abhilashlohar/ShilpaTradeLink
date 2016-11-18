<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption" >
			<i class="icon-globe font-blue-steel"></i>
			<span class="caption-subject font-blue-steel uppercase">ADD EMPLOYEE</span>
		</div>
	</div>
	<div class="portlet-body form">
		<!-- BEGIN FORM-->
		 <?= $this->Form->create($employee,['type' => 'file','class'=>'form-horizontal','id'=>'form_sample_3']) ?>
			<div class="form-body">
				<div class="row">
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">Name <span class="required" aria-required="true">*</span></label>
							<?php echo $this->Form->input('name', ['label' => false,'class' => 'form-control input-sm firstupercase','placeholder'=>'Name']); ?>
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">Date of Birth<span class="required" aria-required="true">*</span></label>
							<?php echo $this->Form->input('dob',['type' => 'text','label' => false,'class' => 'form-control input-sm date-picker','data-date-format' => 'dd-mm-yyyy','placeholder' => 'Date of Birth']); ?>
						</div>
					</div>
					
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">Gender <span class="required" aria-required="true">*</span></label>
							<div class="radio-list">
								<div class="radio-inline" data-error-container="#sex_required_error">
									<?php echo $this->Form->radio(
											'sex',
											[
												['value' => 'Male', 'text' => 'Male'],
												['value' => 'Female', 'text' => 'Female']
											]
									); ?>
								</div>
								<div id="sex_required_error"></div>
							</div>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">Mobile <span class="required" aria-required="true">*</span></label>
							<?php echo $this->Form->input('mobile', ['label' => false,'class' => 'form-control input-sm nospace','placeholder'=>'Mobile']); ?>
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">Landline</label>
							<?php echo $this->Form->input('phone_no', ['label' => false,'class' => 'form-control input-sm nospace','placeholder'=>'Landline']); ?>
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">Email <span class="required" aria-required="true">*</span></label>
							<?php echo $this->Form->input('email', ['label' => false,'class' => 'form-control input-sm','placeholder'=>'Email']); ?>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">Blood Group </label>
							<?php 
							
							$arrblood=array(""=>"Select Blood Group", 'A+'=>"A+",'A-'=>"A-",'B+'=>"B+",'B-'=>"B-",'AB+'=>"AB+",'AB-'=>"AB-",'O+'=>"O+",'O-'=>"O-");
							echo $this->Form->input('blood_group', ['options'=>$arrblood,'label' => false,'class' => 'form-control input-sm','placeholder'=>'Blood Group']);?>
						</div>
					</div>
				
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">Education Qualification</label>
							<?php echo $this->Form->input('qualification', ['label' => false,'class' => 'form-control input-sm','placeholder'=>'Education Qualification']); ?>
						</div>
					</div>
					
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label"> Last Company worked Name</label>
							<?php echo $this->Form->input('last_company', ['label' => false,'class' => 'form-control input-sm','placeholder'=>'Last Company Name']); ?>
						</div>
					</div>
				</div>
					
					
				<div class="row">
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">Department <span class="required" aria-required="true">*</span></label>
							<?php echo $this->Form->input('dipartment_id', ['options' => $departments,'label' => false,'class' => 'form-control input-sm']); ?>
						</div>
					</div>
					
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">Designation <span class="required" aria-required="true">*</span></label>
							<?php echo $this->Form->input('designation_id', ['options'=>$designations,'label' => false,'class' => 'form-control input-sm','placeholder'=>'Designation']); ?>
						</div>
					</div>
					
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">Date Of Joining</label>
							<?php echo $this->Form->input('join_date', ['type' => 'text','label' => false,'class' => 'form-control input-sm date-picker','data-date-format' => 'dd-mm-yyyy','placeholder' => 'Date of Joining']); ?>
					</div>
					</div>
					
				</div>
				<div class="row">
				<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">Date of Confirmation as Permanent</label>
							<?php echo $this->Form->input('permanent_join_date', ['type' => 'text','label' => false,'class' => 'form-control input-sm date-picker','data-date-format' => 'dd-mm-yyyy','placeholder' => 'Date of Confirmation']); ?>
					</div>
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">Marital Status<span class="required" aria-required="true">*</span></label>
								<div class="radio-list">
								<div class="radio-inline" data-error-container="#marital_status_required_error">
									<?php echo $this->Form->radio(
											'marital_status',
											[
												['value' => 'Single', 'text' => 'Single', 'id'=>'id_radio1'],
												['value' => 'Married', 'text' => 'Married', 'id'=>'id_radio2']
											]
									); ?>
								</div>
								<div id="marital_status_error"></div>
							</div>
						</div>
					</div>
					</div>
				<div class="row"  id="married_info" style="display:none;">
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">Spouse Name</label>
							<?php echo $this->Form->input('spouse_name', ['label' => false,'class' => 'form-control input-sm','placeholder'=>'Spouse Name']); ?>
						</div>
					</div>
				
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">Date Of Anniversary</label>
							<?php echo $this->Form->input('date_of_anniversary', ['type' => 'text','label' => false,'class' => 'form-control input-sm date-picker','data-date-format' => 'dd-mm-yyyy','placeholder' => 'Date of Anniversary']); ?>
					</div>
					</div>
						<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">Number Of Child</label>
							<?php echo $this->Form->input('children', ['label' => false,'class' => 'form-control input-sm','placeholder' => 'Number Of Child']); ?>
					</div>
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label"> Whether Spouse Working?</label>
								<div class="radio-list">
								<div class="radio-inline">
									<?php echo $this->Form->radio(
											'spouse_working',
											[
												['value' => 'Yes', 'text' => 'Yes'],
												['value' => 'No', 'text' => 'No']
											]
									); ?>
								</div>
								<div id="spouse_working_error"></div>
							</div>
						</div>
					</div>
				</div>
					
				<div class="row">
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">Permanent Address <span class="required" aria-required="true">*</span></label>
							<?php echo $this->Form->input('permanent_address', ['label' => false,'class' => 'form-control input-sm','placeholder'=>'Permanent Address']); ?>
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">Residence Address <span class="required" aria-required="true">*</span></label>
							<?php echo $this->Form->input('residence_address', ['label' => false,'class' => 'form-control input-sm','placeholder'=>'Residence Address']); ?>
						</div>
					</div>
					
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">Signature <span class="required" aria-required="true">*</span></label>
							<?php echo $this->Form->input('signature', ['type' => 'file','label' => false]);?>
							<span class="help-block">Only PNG format is allowed | Upload transparent Signature of size 420 x 165 </span>
						</div>
					</div>
				</div>
				
				<h4 style="font-size:13px'">Employee Contact </h4>
				<table class="table table-condensed tableitm">
					<thead>
						<tr>
							<th><label class="control-label">Name<label></th>
							<th><label class="control-label">Mobile<label></th>
							<th><label class="control-label">Landline<label></th>
							<th><label class="control-label">Email<label></th>
							<th><label class="control-label">Relation<label></th>
							
						</tr>
					</thead>
					<tbody>
					<tr>
						<td>
							<?php echo $this->Form->input('employee_contact_persons.0.name', ['label' => false,'class' => 'form-control input-sm firstupercase','placeholder'=>'Name']); ?>
						</td>
						<td>
							<?php echo $this->Form->input('employee_contact_persons.0.mobile', ['type' => 'number','label' => false,'class' => 'form-control input-sm ','placeholder' => 'Mobile']); ?>
							
						</td>
						<td>
						<?php echo $this->Form->input('employee_contact_persons.0.landline', ['type' => 'number','label' => false,'class' => 'form-control input-sm ','placeholder' => 'Mobile']); ?>
						
						</td>
						<td>
							<?php echo $this->Form->input('employee_contact_persons.0.email', ['label' => false,'class' => 'form-control input-sm nospace','placeholder'=>'Email']); ?>
						</td>
						<td>
							<?php echo $this->Form->input('employee_contact_persons.0.relation', ['label' => false,'class' => 'form-control input-sm firstupercase','placeholder'=>'Relation']); ?>
						</td>
					</tr>
					
					<tr>
						<td>
							<?php echo $this->Form->input('employee_contact_persons.1.name', ['label' => false,'class' => 'form-control input-sm firstupercase','placeholder'=>'Name']); ?>
						</td>
						<td>
							<?php echo $this->Form->input('employee_contact_persons.1.mobile', ['type' => 'number','label' => false,'class' => 'form-control input-sm ','placeholder' => 'Mobile']); ?>
							
						</td>
						<td>
						<?php echo $this->Form->input('employee_contact_persons.1.landline', ['type' => 'number','label' => false,'class' => 'form-control input-sm ','placeholder' => 'Mobile']); ?>
						
						</td>
						<td>
							<?php echo $this->Form->input('employee_contact_persons.1.email', ['label' => false,'class' => 'form-control input-sm nospace','placeholder'=>'Email']); ?>
						</td>
						<td>
							<?php echo $this->Form->input('employee_contact_persons.1.relation', ['label' => false,'class' => 'form-control input-sm firstupercase','placeholder'=>'Relation']); ?>
						</td>
					</tr>
						
						
					</tbody>
					
				</table>
				
				
				
				
				<h4 style="font-size:13px'">Bank's Detail</h4>
				<table class="table table-condensed tableitm">
					<thead>
						<tr>
							<th><label class="control-label">Bank Name<label></th>
							<th><label class="control-label">Account Number<label></th>
							<th><label class="control-label">Branch Name<label></th>
							<th><label class="control-label">IFSC Code<label></th>
							
						</tr>
					</thead>
					<tbody>
						<td>
							<?php echo $this->Form->input('bank_name', ['label' => false,'class' => 'form-control input-sm firstupercase','placeholder'=>'Bank Name']); ?>
						</td>
						<td>
							<?php echo $this->Form->input('account_no', ['label' => false,'class' => 'form-control input-sm nospace','placeholder'=>'Account No']); ?>
						</td>
						<td>
							<?php echo $this->Form->input('branch_name', ['label' => false,'class' => 'form-control input-sm firstupercase','placeholder'=>'Branch Name']); ?>
						</td>
						<td>
							<?php echo $this->Form->input('ifsc_code', ['label' => false,'class' => 'form-control input-sm nospace','placeholder'=>'IFSC Code']); ?>
						</td>
					</tbody>
				</table>
				<div class="alert alert-danger" id="row_error" style="display:none;">
                    Fill all fileds.
                </div>
		</div>
		
		
			<div class="form-actions">
					<button type="submit" class="btn btn-primary">ADD EMPLOYEE</button>
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
			name:{
				required: true,
			},
			dipartment_id : {
				  required: true,
			},
			sex : {
				  required: true,
			},
			mobile : {
				  required: true,
			},
			email:{
				required: true
			},
			designation_id:{
				required: true,
			},
			permanent_address:{
				required: true,
			},
			residence_address:{
				required: true,
			},
			signature : {
				  required: true,
			},
			marital_status:{
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
			$("#main_tb tbody tr.tr1").each(function(){
				var w=$(this).find("td:nth-child(3) input").val();
				var r=$(this).find("td:nth-child(4) input").val();
				if(w=="" || r==""){
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
	
});
</script>
 <script type="text/javascript">
                 $(document).ready(function () {
                    $('#id_radio2').click(function () {
                     $('#married_info').show('fast');
                });
				 $('#id_radio1').click(function () {
                     $('#married_info').hide('fast');
                });
				 });
</script>