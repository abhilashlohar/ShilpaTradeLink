<?php 

	if(!empty($status)){
		$url_excel=$status."/?".$url;
	}else{
		$url_excel="/?".$url;
	}

?>
<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption">
			<i class="icon-globe font-blue-steel"></i>
			<span class="caption-subject font-blue-steel uppercase">Add Customer Group</span>
		</div>
	</div>
	<div class="portlet-body form">
		<!-- BEGIN FORM-->
		<div class="row ">
		<div class="col-md-6">
		 <?= $this->Form->create($customerGroup,array("class"=>"form-horizontal",'id'=>'form_sample_3')) ?>
			<div class="form-body">
				<div class="form-group">
					<label class="control-label col-md-3">Name  <span class="required" aria-required="true">
					* </span>
					</label>
					<div class="col-md-9">
						<div class="input-icon right">
							<i class="fa"></i>
							 <?php echo $this->Form->input('name', ['label' => false,'class' => 'form-control firstupercase','placeholder'=>'Enter Customer Group']); ?>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-offset-4 col-md-8">
						<button type="submit" class="btn btn-primary">Add Customer Group</button>
					</div>
				</div>
			</div>
		<?= $this->Form->end() ?>
		</div>
		<div class="col-md-6">
			<div class="portlet-body">
			<form method="GET" >
				<div class="row">
									
					<div class="col-md-6">
						<input type="text" name="customer_group" class="form-control input-sm" placeholder="Customer Group" value="<?php echo @$customer_group; ?>">
					</div>
					<button type="submit" class="btn btn-primary btn-sm"><i class="fa fa-filter"></i> Filter</button>
				</div>
				</form>
			<div class="table-scrollable">
			<table class="table table-hover">
				<thead>
					<tr>
						<th><?= $this->Paginator->sort('id') ?></th>
						<th><?= $this->Paginator->sort('name') ?></th>
						<th class="actions"><?= __('Actions') ?></th>
					</tr>
				</thead>
				<tbody>
					<?php $i=0; foreach ($customerGroups as $customerGroup): $i++; ?>
					<tr>
						<td><?= h($i) ?></td>
						<td><?= h($customerGroup->name) ?></td>
						<td class="actions">
						<?php echo $this->Html->link('<i class="fa fa-pencil-square-o"></i>',['action' => 'edit', $customerGroup->id],array('escape'=>false,'class'=>'btn btn-xs blue')); ?>
							<?= $this->Form->postLink('<i class="fa fa-trash"></i> ',
								['action' => 'delete', $customerGroup->id], 
								[
									'escape' => false,
									'class' => 'btn btn-xs btn-danger',
									'confirm' => __('Are you sure ?', $customerGroup->id)
								]
							) ?>
						</td>
					</tr>
					<?php endforeach; ?>
				</tbody>
			</table>
			</div>
			<div class="paginator">
				<ul class="pagination">
					<?= $this->Paginator->prev('<') ?>
					<?= $this->Paginator->numbers() ?>
					<?= $this->Paginator->next('>') ?>
				</ul>
				<p><?= $this->Paginator->counter() ?></p>
			</div>
			</div>
		</div>
		<!-- END FORM-->
	</div>
</div>
</div>

<?php echo $this->Html->script('/assets/global/plugins/jquery.min.js'); ?>
<script>
$(document).ready(function() {
	//--------- FORM VALIDATION
	
    jQuery.validator.addMethod("alphabetsAndSpacesOnly", function (value, element) {
    return this.optional(element) || /^[a-zA-Z\s.,]+$/.test(value); });
	
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
				maxlength:40,
				alphabetsAndSpacesOnly: true,
			},
		
		},

		messages: { // custom messages for radio buttons and checkboxes
			name: {
				alphabetsAndSpacesOnly: "Enter Letters only",
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
});
</script>