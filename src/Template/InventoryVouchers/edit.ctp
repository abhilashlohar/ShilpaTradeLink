<style>
.table > thead > tr > th, .table > tbody > tr > th, .table > tfoot > tr > th, .table > thead > tr > td, .table > tbody > tr > td, .table > tfoot > tr > td{
	vertical-align: top !important;
}
</style>
<div class="row">
	<div class="col-md-12" style="background-color:#FFF;">
		<div class="row">
			<div class="col-md-3"> 
				<ul class="nav nav-tabs tabs-left">
					<?php foreach($display_items as $item_id=>$display_item){ ?>
					<li <?php if($q_item_id==$item_id){ echo 'class="active"'; } ?> >
						<?php	echo $this->Html->link($display_item,'/Inventory-Vouchers/edit?invoice='.$invoice_id.'&item-id='.$item_id); ?>
					</li>
					<?php } ?>
				</ul>
			</div>
			<div class="col-md-7">
				<?= $this->Form->create($InventoryVoucher,['id'=>'form_sample_3']) ?>
				<table id="main_table"  class="table table-condensed table-hover">
					<thead>
						<tr>
							<th>Item</th>
							<th style="width: 80px;">Quntity</th>
							<th style="width: 200px;">Serial Number</th>
							<th></th>
							<th></th>
						</tr>
					</thead>
					<tbody id="maintbody">
					<?php foreach($InventoryVoucherRows as $InventoryVoucherRow){ ?>
						<tr class="main" >
							<td>
								<?php 
								$item_option=[];
								foreach($Items as $Item){
									$item_option[]=['text' =>$Item->name, 'value' => $Item->id, 'serial_number_enable' => (int)$Item->serial_number_enable];
								}
								echo $this->Form->input('q', ['empty'=>'Select','options' => $item_option,'label' => false,'class' => 'form-control input-sm select_item','value'=>$InventoryVoucherRow->item_id]); ?>
							</td>
							<td>
								<?php echo $this->Form->input('q', ['type' => 'text','label' => false,'class' => 'form-control input-sm qty_bx','placeholder' => 'Quntity','value'=>$InventoryVoucherRow->quantity]); ?>
							</td>
							<td></td>
							<td><a class="btn btn-xs btn-default addrow" href="#" role='button'><i class="fa fa-plus"></i></a><a class="btn btn-xs btn-default deleterow" href="#" role='button'><i class="fa fa-times"></i></a></td>
						</tr>
					<?php } ?>
					</tbody>
				</table>
				<button type="submit" class="btn btn-primary" >Save & Next</button>
				<?= $this->Form->end() ?>
			</div>
		</div>
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
	
	var l=$("#main_table tbody#maintbody tr.main").length;
	
	
	$('.addrow').die().live("click",function() { 
		add_row();
    });
	
	$('.deleterow').die().live("click",function() {
		var l=$(this).closest("table tbody").find("tr").length;
		if (confirm("Are you sure to remove row ?") == true) {
			if(l>1){
				var row_no=$(this).closest("tr").attr("row_no");
				var del="tr[row_no="+row_no+"]";
				$(del).remove();
				
				//rename_rows();
			}
		} 
    });
	
	function add_row(){
		var tr1=$("#sampletable tbody tr").clone();
		$("#main_table tbody#maintbody").append(tr1);
		rename_rows();
	}
	rename_rows();
	function rename_rows(){
		var i=0;
		$("#main_table tbody#maintbody tr.main").each(function(){
			$(this).attr('row_no',i);
			$(this).find('td:nth-child(1) select').attr({name:"inventory_voucher_rows["+i+"][item_id]", id:"inventory_voucher_rows-"+i+"-item_id"}).rules("add", "required");
			$(this).find('td:nth-child(2) input').attr({name:"inventory_voucher_rows["+i+"][quantity]", id:"inventory_voucher_rows-"+i+"-quantity"}).rules("add", "required");
			if($(this).find('td:nth-child(3) select').length>0){
				$(this).find('td:nth-child(3) select').attr({name:"inventory_voucher_rows["+i+"][serial_number_data][]", id:"inventory_voucher_rows-"+i+"-serial_number_data"}).rules("add", "required");
			}
			
			
		i++; });
	}
	
	$('.select_item').die().live("change",function() {
		var t=$(this);
		var row_no=$(this).closest('tr').attr('row_no');
  		var select_item_id=$(this).find('option:selected').val();
		var url1="<?php echo $this->Url->build(['controller'=>'InventoryVouchers','action'=>'ItemSerialNumber']); ?>";
		url1=url1+'/'+select_item_id+'/<?php echo $invoice_id; ?>/<?php echo $q_item_id; ?>',
		$.ajax({
			url: url1,
		}).done(function(response) {
  			$(t).closest('tr').find('td:nth-child(3)').html(response);
			$(t).closest('tr').find('td:nth-child(3) select').attr({name:"inventory_voucher_rows["+row_no+"][serial_number_data][]", id:"inventory_voucher_rows-"+row_no+"-serial_number_data"});
			$(t).closest('tr').find('td:nth-child(3) select').select2();
		});
	});
	
	function validate_serial(){
		$("#main_table tbody#maintbody tr.main").each(function(){
			var qty=$(this).find('td:nth-child(2) input').val();
			if($(this).find('td:nth-child(3) select').length>0){
				$(this).find('td:nth-child(3) select').attr('test',qty).rules('add', {
							required: true,
							minlength: qty,
							maxlength: qty,
							messages: {
								maxlength: "select serial number equal to quantity.",
								minlength: "select serial number equal to quantity."
							}
					});
			}
		});	
	}
	
	if(l==0){
		add_row();
	}else{
		$("#main_table tbody#maintbody tr.main").each(function(){
			var t=$(this).find('td:nth-child(1) select');
			if(t.val()){
				var row_no=t.closest('tr').attr('row_no');
				var select_item_id=t.find('option:selected').val();
				var url1="<?php echo $this->Url->build(['controller'=>'InventoryVouchers','action'=>'ItemSerialNumber']); ?>";
				url1=url1+'/'+select_item_id+'/<?php echo $invoice_id; ?>/<?php echo $q_item_id; ?>',
				$.ajax({
					url: url1,
				}).done(function(response) {
					$(t).closest('tr').find('td:nth-child(3)').html(response);
					$(t).closest('tr').find('td:nth-child(3) select').attr({name:"inventory_voucher_rows["+row_no+"][serial_number_data][]", id:"inventory_voucher_rows-"+row_no+"-serial_number_data"});
					$(t).closest('tr').find('td:nth-child(3) select').select2();
					validate_serial();
				});
			}
		});
	}
	
	$('.qty_bx').die().live("keyup",function() {
		validate_serial();
    });
});
</script>

<table id="sampletable" style="display:none;">
	<tbody>
		<tr class="main">
			<td>
				<?php 
				$item_option=[];
				foreach($Items as $Item){
					$item_option[]=['text' =>$Item->name, 'value' => $Item->id, 'serial_number_enable' => (int)$Item->serial_number_enable];
				}
				echo $this->Form->input('q', ['empty'=>'Select','options' => $item_option,'label' => false,'class' => 'form-control input-sm select_item']); ?>
			</td>
			<td>
				<?php echo $this->Form->input('q', ['type' => 'text','label' => false,'class' => 'form-control input-sm qty_bx','placeholder' => 'Quntity']); ?>
			</td>
			<td></td>
			<td><a class="btn btn-xs btn-default addrow" href="#" role='button'><i class="fa fa-plus"></i></a><a class="btn btn-xs btn-default deleterow" href="#" role='button'><i class="fa fa-times"></i></a></td>
		</tr>
	</tbody>
</table>