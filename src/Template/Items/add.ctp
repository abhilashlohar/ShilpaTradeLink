<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption">
			<i class="icon-globe font-blue-steel"></i>
			<span class="caption-subject font-blue-steel uppercase">Add Item</span>
		</div>
	</div>
	<div class="portlet-body form">
		<!-- BEGIN FORM-->
		<?= $this->Form->create($item,['id'=>'form_sample_3']) ?>
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
							<label class="control-label">Alias <span class="required" aria-required="true">*</span></label>
							<?php echo $this->Form->input('alias', ['label' => false,'class' => 'form-control input-sm firstupercase','placeholder'=>'Alias']); ?>
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">Unit <span class="required" aria-required="true">*</span></label>
							<?php echo $this->Form->input('unit_id', ['options' => $units,'label' => false,'class' => 'form-control input-sm','placeholder'=>'Name']); ?>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">Category <span class="required" aria-required="true">*</span></label>
							<?php echo $this->Form->input('category_id', ['options' => $Categories,'label' => false,'class' => 'form-control input-sm','placeholder'=>'Category']); ?>
						</div>
					</div>
				</div>
				<h4>Opening Balance</h4>
				<div class="row">
					<div class="col-md-3">
						<div class="form-group">
							<label class="control-label">Quantity <span class="required" aria-required="true">*</span></label>
							<?php echo $this->Form->input('ob_quantity', ['label' => false,'class' => 'form-control input-sm','placeholder'=>'Quantity']); ?>
						</div>
					</div>
					<div class="col-md-3">
						<div class="form-group">
							<label class="control-label">Rate <span class="required" aria-required="true">*</span></label>
							<?php echo $this->Form->input('ob_rate', ['label' => false,'type'=>'text','class' => 'form-control input-sm','placeholder'=>'Rate']); ?>
						</div>
					</div>
					<div class="col-md-3">
						<div class="form-group">
							<label class="control-label">Value <span class="required" aria-required="true">*</span></label>
							<?php echo $this->Form->input('ob_value', ['label' => false,'class' => 'form-control input-sm','placeholder'=>'Value','readonly']); ?>
						</div>
					</div>
				</div>
				<hr>
				<div class="row">
					<div class="col-md-3">
						<div class="form-group">
							<label class="control-label">Minimum Quantity <span class="required" aria-required="true">*</span></label>
							<?php echo $this->Form->input('minimum_quantity', ['label' => false,'class' => 'form-control input-sm','placeholder'=>'Minimum Quantity']); ?>
						</div>
					</div>
					<div class="col-md-3">
						<div class="form-group">
							<label class="control-label">Maximum Quantity <span class="required" aria-required="true">*</span></label>
							<?php echo $this->Form->input('maximum_quantity', ['label' => false,'class' => 'form-control input-sm','placeholder'=>'Maximum Quantity']); ?>
						</div>
					</div>
					<div class="col-md-3">
						<div class="form-group">
							<br/>
							<?php echo $this->Form->input('freeze'); ?>
						</div>
					</div>
					<div class="col-md-3">
						<div class="form-group">
							<br/>
							<?php echo $this->Form->input('serial_number_enable'); ?>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="col-md-4">
						<label class="control-label">Used By Companies <span class="required" aria-required="true">*</span></label>
						<?php echo $this->Form->input('companies._ids', ['label' => false,'options' => $Companies,'multiple' => 'checkbox']); ?>
					</div>
					<div class="col-md-4">
						<label class="control-label">Source <span class="required" aria-required="true">*</span></label>
						<div class="checkbox-list">
							<?php echo $this->Form->input('sources._ids', ['label' => false,'options' => $sources,'multiple' => 'checkbox','class' => 'form-control input-sm']); ?>
						</div>
					</div>
				</div>
			</div>
			
			<div class="form-actions">
				 <button type="submit" class="btn blue-hoki">Add Item</button>
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
			unit_id :{
				required: true,
			},
			name  : {
				  required: true,
			},
			alias  : {
				  required: true,
			},
			category_id    : {
				  required: true,
			},
			ob_quantity    :{
				required: true,
			},
			ob_rate  :{
				required: true,
			},
			ob_value    :{
				required: true,
			},
			minimum_quantity  : {
				  required: true,
			}
			
			
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
	
	$('input[name="ob_quantity"],input[name="ob_rate"]').die().live("keyup",function() { 
		var ob_quantity=parseFloat($('input[name="ob_quantity"]').val());
		if(isNaN(ob_quantity)) { var ob_quantity = 0; }
		var ob_rate=parseFloat($('input[name="ob_rate"]').val());
		if(isNaN(ob_rate)) { var ob_rate = 0; }
		var total=ob_quantity*ob_rate;
		$('input[name="ob_value"]').val(total.toFixed(2));
    });
});
</script>