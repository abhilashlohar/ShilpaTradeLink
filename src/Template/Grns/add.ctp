<?php //pr($purchase_order); ?>
<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption">
			<i class="icon-globe font-blue-steel"></i>
			<span class="caption-subject font-blue-steel uppercase">Add GRN</span>
		</div>
		<div class="actions">
			<?php echo $this->Html->link('<i class="icon-home"></i> Pull Purchase-Order','/PurchaseOrders/index?pull-request=true',array('escape'=>false,'class'=>'btn btn-xs blue')); ?>
		</div>
	</div>
<<<<<<< HEAD
	
	<div class="portlet-body form">
		<?= $this->Form->create($grn ,['id'=>'form_sample_3']) ?>
=======
	<div class="portlet-body form">
	<?= $this->Form->create($grn) ?>
	<div class="form-body">
>>>>>>> ebde8cc3b803c75f04b39ded8839cfd30ae1a6c8
		<div class="form-body">
			<div class="row">
				<div class="col-md-3">
					<div class="form-group">
						<label class="control-label">Company <span class="required" aria-required="true">*</span></label>
						<br/>
						<?php echo @$purchase_order->company->name; ?>
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group">
						<label class="control-label">GRN No. <span class="required" aria-required="true">*</span></label>
						<div class="row">
							<div class="col-md-4">
								<?php echo $this->Form->input('grn1', ['label' => false,'class' => 'form-control input-sm','readonly','value'=>@$purchase_order->company->alias]); ?>
							</div>
							<div class="col-md-4">
								<?php echo $this->Form->input('grn3', ['label' => false,'class' => 'form-control input-sm','placeholder'=>'File']); ?>
							</div>
							<div class="col-md-4">
								<?php echo $this->Form->input('grn4', ['label' => false,'value'=>'16-17','class' => 'form-control input-sm','readonly']); ?>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="form-group">
						<label class="control-label">Supplier <span class="required" aria-required="true">*</span></label>
						<br/>
						<?php echo @$purchase_order->vendor->company_name; ?>
					</div>
				</div>
				<div class="col-md-2">
					<div class="form-group">
						<label class="control-label">Date</label>
						<br/>
						<?php echo date("d-m-Y"); ?>
					</div>
				</div>
			</div><br/>

		
			<div class="alert alert-danger" id="row_error_item" style="display:none;padding: 5px !important;">
				Please check at least one row.
			</div>
			<table class="table tableitm" id="main_tb">
				<thead>
					<tr>
						<th width="10%">Sr.No. </th>
						<th width="60%">Items</th>
						<th width="20%">Quantity</th>
						<th width="10%"></th>
						
					</tr>
				</thead>
				<tbody>
					<?php if(!empty($purchase_order->purchase_order_rows)){
						$q=0; foreach ($purchase_order->purchase_order_rows as $purchase_order_rows): ?>
						<tr class="tr1" row_no='<?php echo @$purchase_order_rows->id; ?>'>
							<td rowspan="2"><?php echo ++$q; --$q; ?></td>
<<<<<<< HEAD
							<td><?php echo $this->Form->input('q', ['options' => $items,'label' => false,'class' => 'form-control input-sm','placeholder'=>'Item','value' => @$purchase_order_rows->item->id,'readonly']); ?></td>

							<td><?php echo $this->Form->input('q', ['label' => false,'type' => 'text','class' => 'form-control input-sm quantity','placeholder'=>'Quantity','value' => @$purchase_order_rows->quantity-$purchase_order_rows->processed_quantity,'readonly','min'=>'1','max'=>@$purchase_order_rows->quantity-$purchase_order_rows->processed_quantity]); ?></td>
							
=======
							<td>
								<?php echo $this->Form->input('item_id', ['type' => 'hidden','value'=>@$purchase_order_rows->item_id]); 
								echo $purchase_order_rows->item->name;
								?>								
							</td>
>>>>>>> ebde8cc3b803c75f04b39ded8839cfd30ae1a6c8
							<td>
								<?php echo $this->Form->input('q', ['label' => false,'type' => 'text','class' => 'form-control input-sm quantity','placeholder'=>'Quantity','value' => @$purchase_order_rows->quantity-$purchase_order_rows->processed_quantity,'readonly','min'=>'1','max'=>@$purchase_order_rows->quantity-$purchase_order_rows->processed_quantity]); ?>
							</td>
]								<td>
								<label><?php echo $this->Form->input('check.'.$q, ['label' => false,'type'=>'checkbox','class'=>'rename_check','value' => @$purchase_order_rows->id]); ?></label>
							</td>
						</tr>
						<tr class="tr2" row_no='<?php echo @$purchase_order_rows->id; ?>'>
							<td colspan="4">
								<?php echo $this->Text->autoParagraph(h($purchase_order_rows->description)); ?>
							</td>
							<td></td>
						</tr>
					<?php $q++; endforeach; }?>
				</tbody>
			</table>
			

			<div class="row">
				<div class="col-md-12">
					<div class="form-group">
						<label class="col-md-3 control-label">Additional Note</label>
						<div class="col-md-9">
							<?php echo $this->Form->input('additional_note', ['label' => false,'class' => 'form-control input-sm','placeholder'=>'Additional Note']); ?>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="form-actions">
			<div class="row">
				<div class="col-md-offset-3 col-md-9">
					<button type="submit" class="btn btn-primary">ADD GRN</button>
				</div>
			</div>
		</div>
		<?= $this->Form->end() ?>
	</div>
<<<<<<< HEAD
	
</div>
	
=======
	</div>
</div>	
>>>>>>> ebde8cc3b803c75f04b39ded8839cfd30ae1a6c8
<style>
.table thead tr th {
    color: #FFF;
	background-color: #254b73;
}
</style>

<<<<<<< HEAD

<table id="sample_tb" style="display:none;">
	<tbody>
		<tr class="tr1">
			<td rowspan="2">0</td>
			<td><?php echo $this->Form->input('item_id', ['empty'=>'Select','options' => $items,'label' => false,'class' => 'form-control input-sm','placeholder' => 'Item']); ?></td>
			<td><?php echo $this->Form->input('unit[]', ['type' => 'text','label' => false,'class' => 'form-control input-sm quantity','placeholder' => 'Quantity']); ?></td>
			
			<td><a class="btn btn-xs btn-default addrow" href="#" role='button'><i class="fa fa-plus"></i></a><a class="btn btn-xs btn-default deleterow" href="#" role='button'><i class="fa fa-times"></i></a></td>
		</tr>
		<tr class="tr2">
			<td colspan="4"><?php echo $this->Form->textarea('descryption', ['label' => false,'class' => 'form-control input-sm autoExpand','placeholder' => 'Description','rows'=>'1']); ?></td>
			<td></td>
		</tr>
	</tbody>
</table>

</div>

=======
<?php echo $this->Html->script('/assets/global/plugins/jquery.min.js'); ?>
>>>>>>> ebde8cc3b803c75f04b39ded8839cfd30ae1a6c8

<?php echo $this->Html->script('/assets/global/plugins/jquery.min.js'); ?>

<script>
$(document).ready(function() {
<<<<<<< HEAD
		//--------- FORM VALIDATION
=======
	//--------- FORM VALIDATION
>>>>>>> ebde8cc3b803c75f04b39ded8839cfd30ae1a6c8
	var form3 = $('#form_sample_3');
	var error3 = $('.alert-danger', form3);
	var success3 = $('.alert-success', form3);
	form3.validate({
		errorElement: 'span', //default input error message container
		errorClass: 'help-block help-block-error', // default input error message class
		focusInvalid: true, // do not focus the last invalid input
		rules: {
			grn1:{
				required: true,
			},
<<<<<<< HEAD
			date_created : {
				  required: true,
			},
			customer_id : {
				  required: true,
			},
			in1 : {
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

		submitHandler: function (form) {
		
			
=======
			grn3:{
				required: true,
			},
			grn4:{
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
			var check_d=0;
				$(".rename_check").each(function () {
					if($(this).prop('checked'))
					{
						check_d=1;
					}
				});
			if(check_d==0)
			{
				$("#row_error_item").show();
				success3.hide();
				error3.show();
				Metronic.scrollTo(error3, -200);
				return false;
			}
>>>>>>> ebde8cc3b803c75f04b39ded8839cfd30ae1a6c8
			success1.show();
			error1.hide();
			form[0].submit(); // submit the form
		}

	});
	
<<<<<<< HEAD
	$('.rename_check').die().live("click",function() {
		rename_rows(); calculate_total();
    });
	
=======
	
			
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
	
	
	$('.rename_check').die().live("click",function() {
		rename_rows(); calculate_total();
    });
>>>>>>> ebde8cc3b803c75f04b39ded8839cfd30ae1a6c8
	function rename_rows(){
		$("#main_tb tbody tr.tr1").each(function(){
			var row_no=$(this).attr('row_no');
			var val=$(this).find('td:nth-child(4) input[type="checkbox"]:checked').val();
<<<<<<< HEAD
			if(val){
			}
			
		});
	}
});		

</script>

	 

=======
			alert(val);
			if(val){
				alert("hmmm");
				$(this).find('td:nth-child(3) input').attr({ name:"grn_rows["+val+"][quantity]", id:"grn_rows-"+val+"-quantity"});
				
				$(this).css('background-color','#fffcda');
				$('#main_tb tbody tr.tr2[row_no="'+row_no+'"]').css('background-color','#fffcda');
			}else{
				
			}
		});
	}
    $('.addrow').die().live("click",function() { 
		add_row();
    });
});
</script>

>>>>>>> ebde8cc3b803c75f04b39ded8839cfd30ae1a6c8

