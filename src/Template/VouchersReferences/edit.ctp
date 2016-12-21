
<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption" >
			<i class="icon-globe font-blue-steel"></i>
			<span class="caption-subject font-blue-steel uppercase">Edit Voucher Reference</span>
		</div>
	</div>
	<div class="portlet-body form">
		<!-- BEGIN FORM-->
		 <?= $this->Form->create($vouchersReference,['type' => 'file','id'=>'form_sample_3']) ?>
			<div class="form-body">
				<div class="row">
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">Voucher Entity <span class="required" aria-required="true">*</span></label>
							<?php echo $this->Form->input('voucher_entity', ['label' => false,'class' => 'form-control input-sm firstupercase','placeholder'=>'Voucher Entity']); ?>
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">Description <span class="required" aria-required="true">*</span></label>
							<?php echo $this->Form->input('description', ['label' => false,'class' => 'form-control input-sm','placeholder'=>'Description']); ?>
						</div>
					</div>
					
				</div>
				<div class="row">
				<div class="panel-group accordion" id="accordion0">
				
				<?php foreach($AccountGroups as $accountGroup){ ?>
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4 class="panel-title">
							<table width="100%">
								<tr>
									<td ><input type="checkbox" class="checkall_group" /></td>
									<td width="100%"><a class="accordion-toggle accordion-toggle-styled collapsed" data-toggle="collapse" data-parent="#accordion0" href="#collapse_<?php echo $accountGroup->id;?>" aria-expanded="false"><?php echo $accountGroup->name; ?></a></td>
								</tr>
							</table>
						</h4>
					</div>
					<div id="collapse_<?php echo $accountGroup->id;?>" class="panel-collapse collapse" aria-expanded="false">
						<div class="panel-body">
							<!--Account first Sub group Start-->
							<div class="panel-group accordion" id="accordion<?php echo $accountGroup->id;?>">
							<?php foreach($accountGroup->account_first_subgroups as $account_first_subgroup){ ?>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<table width="100%">
											<tr>
												<td><input type="checkbox" class="checkall_first_subgroup" /></td>
												<td width="100%"><a class="accordion-toggle accordion-toggle-styled collapsed" data-toggle="collapse" data-parent="#accordion<?php echo $accountGroup->id;?>" href="#collapse_<?php echo $accountGroup->id;?>_<?php echo $account_first_subgroup->id;?>" aria-expanded="false"><?php echo $account_first_subgroup->name; ?></a></td>
											</tr>
										</table>
									</h4>
								</div>
								<div id="collapse_<?php echo $accountGroup->id;?>_<?php echo $account_first_subgroup->id;?>" class="panel-collapse collapse" aria-expanded="false">
								<div class="panel-body">
										
								<!--Account second Sub group Start-->
								<div class="panel-group accordion" id="accordion<?php echo $accountGroup->id;?>_<?php echo $account_first_subgroup->id;?>">
								<?php foreach($account_first_subgroup->account_second_subgroups as $account_second_subgroup){ ?>
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<table width="100%">
												<tr>
													<td ><input type="checkbox" class="checkall_second_subgroup"/></td>
													<td width="100%"><a class="accordion-toggle accordion-toggle-styled collapsed" data-toggle="collapse" data-parent="#accordion<?php echo $accountGroup->id;?>_<?php echo $account_first_subgroup->id;?>" href="#collapse_<?php echo $accountGroup->id;?>_<?php echo $account_first_subgroup->id;?>_<?php echo $account_second_subgroup->id;?>" aria-expanded="false"><?php echo $account_second_subgroup->name; ?></a></td>
												</tr>
											</table>
										</h4>
								</div>
								<div id="collapse_<?php echo $accountGroup->id;?>_<?php echo $account_first_subgroup->id;?>_<?php echo $account_second_subgroup->id;?>" class="panel-collapse collapse" aria-expanded="false">
									<div class="panel-body">
									<!--Account ledger account Start-->
								<div class="panel-group accordion" id="accordion<?php echo $accountGroup->id;?>_<?php echo $account_first_subgroup->id;?>_<?php echo $account_second_subgroup->id;?>">
								<?php foreach($account_second_subgroup->ledger_accounts as $ledger_account){ ?>
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<table width="100%">
												<tr>
													<td ><input type="checkbox" class="checkall_ledger"/></td>
													<td width="100%"><?php echo $ledger_account->name; ?></td>
												</tr>
											</table>
										</h4>
								</div>
								
							</div>
							<?php } ?>
							</div>
							<!--Account Ledger Sub group End-->	
								</div>
								</div>
							</div>
							<?php } ?>
							</div>
							<!--Account Second Sub group End-->
	
									</div>
								</div>
							</div>
							<?php } ?>
							</div>
							<!--Account First Sub group End-->	
								</div>
								</div>
							</div>
							<?php } ?>
							</div>
							<!--Account Group Sub group End-->
						</div>
					
				
			</div>
		
			<div class="form-actions">
				<button type="submit" class="btn btn-primary">EDIT VOUCHER REFERENCE</button>
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
			voucher_entity:{
				required: true,
			},
			description  : {
				  required: true,
			},
			account_group_id : {
				  required: true,
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
	
	$('.checkall_group').on('click', function(){ $('.checkall_first_subgroup').prop('checked', true); });
	
});
</script>


