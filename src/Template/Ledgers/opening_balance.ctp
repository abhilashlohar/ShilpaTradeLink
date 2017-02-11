
<div class="ledgers form large-9 medium-8 columns content">
    <?= $this->Form->create($ledger,['id'=>'opening_balance']) ?>
    
	<?= $this->Form->input('ledger_account_id', ['options' => $ledgerAccounts]) ?>
	<?= $this->Form->input('transaction_date',['type'=>'text','class'=>'date-picker','data-date-format'=>'d-m-yyyy']) ?>
	<?= $this->Form->hidden('voucher_source',['value'=>'Opening Balance']) ?>
	<table class="table table-bordered" id="main_table">
	<tr>
	<td>Ref. No.</td>
	<td>Credit</td>
	<td>Debit</td>
	<td></td>
	</tr>
	<tr>
	<td><?= $this->Form->input('reference_no[]',['type'=>'text','class'=>'','label'=>false]) ?></td>
	<td><?= $this->Form->input('credit[]',['type'=>'text','class'=>'','label'=>false]) ?></td>
	<td><?= $this->Form->input('debit[]',['type'=>'text','class'=>'','label'=>false]) ?></td>
	<td><?= $this->Form->button(__('<i class="fa fa-plus"></i>'),['type'=>'button','class'=>'add_row','label'=>false]) ?></td>
	</tr>
	</table>
	
    <?= $this->Form->button(__('Submit')) ?>
    <?= $this->Form->end() ?>
	
</div>
<table class="table table-bordered" id="temp_table" style="display:none;">
	<tr>
	<td><?= $this->Form->input('reference_no[]',['type'=>'text','class'=>'','label'=>false]) ?></td>
	<td><?= $this->Form->input('credit[]',['type'=>'text','class'=>'','label'=>false]) ?></td>
	<td><?= $this->Form->input('debit[]',['type'=>'text','class'=>'','label'=>false]) ?></td>
	<td><?= $this->Form->button(__('<i class="fa fa-plus"></i>'),['type'=>'button','class'=>'add_row','label'=>false]) ?><?= $this->Form->button(__('<i class="fa fa-minus"></i>'),['type'=>'button','class'=>'remove_row','label'=>false]) ?></td>
	</tr>
	</table>
	
<?php echo $this->Html->script('/assets/global/plugins/jquery.min.js'); ?>
<script>
$(document).ready(function() {
	//--------- FORM VALIDATION
	var form3 = $('#opening_balance');
	var error3 = $('.alert-danger', form3);
	var success3 = $('.alert-success', form3);
	form3.validate({
		errorElement: 'span', //default input error message container
		errorClass: 'help-block help-block-error', // default input error message class
		focusInvalid: true, // do not focus the last invalid input
		rules: {
				ledger_account_id:{
					required: true,
				},
				transaction_date:{
					required: true,
				},
				'reference_no[]':{
					required: true,
					remote:"<?php echo $this->Url->build(['controller'=>'Ledgers','action'=>'check_reference_no']); ?>"
					
				}
			},

		messages: { // custom messages for radio buttons and checkboxes
			'reference_no[]': {
				remote: "Reference no. is alredy taken."
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
	//--	 END OF VALIDATION
	$( document ).on( 'click', '.add_row', function() {
		var new_line=$('#temp_table').html();
		$("#main_table").append(new_line);
	});
	$( document ).on( 'click', '.remove_row', function() {
		$(this).closest("#main_table tr").remove();
	});
});	
</script>