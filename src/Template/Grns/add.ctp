
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
	<?php  if($process_status!="New"){ ?>
	<div class="portlet-body form">
		<?= $this->Form->create($grn) ?>
		<div class="form-body">
			<div class="row">
					<div class="col-md-3">
						<div class="form-group">
							<label class="control-label">Company <span class="required" aria-required="true">*</span></label>
							
							<?php echo $this->Form->input('company_id', ['type' => 'text','label' => false,'class' => 'form-control input-sm','placeholder' => 'Customer PO NO','value'=>@$purchase_order->company->name,'readonly']); ?>
						</div>
					</div>
					<div class="col-md-3">
						<div class="form-group">
							<label class="control-label">Customers <span class="required" aria-required="true">*</span></label>
							
								<?php 
							$options=array();
							foreach($customers as $customer){
								$merge=$customer->customer_name.'	('.$customer->alias.')';
								$options[]=['text' => $merge, 'value' => $customer->id, 'contact_person' => $customer->contact_person, 'employee_id' => $customer->employee_id];
							}
							 echo $this->Form->input('customer_id', ['empty' => "--Select--",'label' => false,'options' => $options,'class' => 'form-control input-sm select2me','value' => @$sales_order->customer_id]); ?>
							
						</div>
					</div>
					<div class="col-md-3">
						<div class="form-group">
							<label class="control-label">Invoice No. <span class="required" aria-required="true">*</span></label>
							<div class="row">
								<?php
									$options=array();
									foreach($purchaseOrders as $purchaseOrder){
										$merge=(($purchaseOrder->po1.'/GRN-'.str_pad($purchaseOrder->id, 3, '0', STR_PAD_LEFT).'/'.$purchaseOrder->po3.'/'.$purchaseOrder->po4));
										$options[]=['text' =>$merge, 'value' => $purchaseOrder->id];
									}
									echo $this->Form->input('purchase_order_id', ['empty' => "--Select--",'label' => false,'options' => $options,'class' => 'form-control input-sm select2me']); ?>
							</div>
						</div>
					</div>
					<div class="col-md-2">
						<div class="form-group">
							<label class="control-label">Date</label>
							<?php echo $this->Form->input('date_created', ['type' => 'text','label' => false,'class' => 'form-control input-sm','value' => date("d-m-Y"),'readonly']); ?>
						</div>
					</div>
				
			</div><br/>

			<br/>

			<div class="alert alert-danger" id="row_error" style="display:none;padding: 5px !important;">
				All fields are Required
			</div>
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
					<?php $ed_des=[];
					
					if(!empty($purchase_order->purchase_order_rows)){
						
					$q=0; foreach ($purchase_order->purchase_order_rows as $purchase_order_rows): 
						
					?>
						<tr class="tr1" row_no='<?php echo @$purchase_order_rows->id; ?>'>
							<td rowspan="2"><?php echo ++$q; --$q; ?></td>
							<td>
							<?php echo $this->Form->input('company_id', ['type' => 'text','label' => false,'class' => 'form-control input-sm','placeholder' => 'Customer PO NO','value'=>@$purchase_order->company->name,'readonly']); ?>
							</td>

							<td><?php echo $this->Form->input('q', ['label' => false,'type' => 'text','class' => 'form-control input-sm quantity','placeholder'=>'Quantity','value' => @$purchase_order_rows->quantity-$purchase_order_rows->processed_quantity,'readonly','min'=>'1','max'=>@$purchase_order_rows->quantity-$purchase_order_rows->processed_quantity]); ?></td>
							
							<td>
								<label><?php echo $this->Form->input('check.'.$q, ['label' => false,'type'=>'checkbox','class'=>'rename_check','value' => @$purchase_order_rows->id]); ?></label>
								
							</td>
							
						</tr>
						<tr class="tr2" row_no='<?php echo @$purchase_order_rows->id; ?>'>
							<td colspan="4"><?php echo $this->Form->input('q', ['label' => false,'type' => 'textarea','class' => 'form-control input-sm ','placeholder'=>'Description','value' => @$purchase_order_rows->description,'readonly']); ?></td>
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
		<?php echo $this->Form->input('process_status', ['type' => 'hidden','value' => @$process_status]); ?>
		<?php echo $this->Form->input('sales_order_id', ['type' => 'hidden','value' => @$sales_order_id]); ?>
		<div class="form-actions">
			<div class="row">
				<div class="col-md-offset-3 col-md-9">
					<button type="submit" class="btn btn-primary">ADD GRN</button>
				</div>
			</div>
		</div>
		
		<?= $this->Form->end() ?>
	</div>
	<?php } ?>
</div>
	
<style>
.table thead tr th {
    color: #FFF;
	background-color: #254b73;
}
</style>


<table id="sample_tb" style="display:none;">
	<tbody>
		<tr class="tr1">
			<td rowspan="2">0</td>
			<td><?php echo $this->Form->input('item_id', ['empty'=>'Select','options' => $items,'label' => false,'class' => 'form-control input-sm','placeholder' => 'Item']); ?></td>
			<td><?php echo $this->Form->input('unit[]', ['type' => 'text','label' => false,'class' => 'form-control input-sm quantity','placeholder' => 'Quantity']); ?></td>
			
			<td><a class="btn btn-xs btn-default addrow" href="#" role='button'><i class="fa fa-plus"></i></a><a class="btn btn-xs btn-default deleterow" href="#" role='button'><i class="fa fa-times"></i></a></td>
		</tr>
		<tr class="tr2">
			<td colspan="4"><?php echo $this->Form->textarea('description', ['label' => false,'class' => 'form-control input-sm autoExpand','placeholder' => 'Description','rows'=>'1']); ?></td>
			<td></td>
		</tr>
	</tbody>
</table>

</div>
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
			company_id:{
				required: true,
			},
			date_created : {
				  required: true,
			},
			customer_id : {
				  required: true,
			},
			in1 : {
				  required: true,
			},
			
			
			in3:{
				required: true
			},
			in4:{
				required: true,
			},
			customer_address:{
				required: true,
			},
			lr_no : {
				  required: true,
			},
			customer_po_no  : {
				  required: true,
			},
			employee_id: {
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
			q="ok"; var count=0;
			
			success1.show();
			error1.hide();
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
	$('input[name="discount"],input[name="discount_per"],input[name="pnf"],input[name="fright_amount"],input[name="pnf_per"]').die().live("keyup",function() {
			var asc=$(this).val();
			var numbers =  /^[0-9]*\.?[0-9]*$/;
			if(asc.match(numbers))  
			{  
			} 
			else  
			{  
				$(this).val('');
				return false;  
			}
	});
	$('select[name="company_id"]').on("change",function() {
		var alias=$('select[name="company_id"] option:selected').attr("alias");
		$('input[name="in1"]').val(alias);
    });
	
	$("#pnfper").on('click',function(){
		if($(this).is(':checked')){
			$("#pnf_text").show();
			$('input[name="pnf"]').attr('readonly','readonly');
		}else{
			$("#pnf_text").hide();
			$('input[name="pnf"]').removeAttr('readonly');
		}
	})
	
	$("#discount_per").on('click',function(){
		if($(this).is(':checked')){
			$("#discount_text").show();
			$('input[name="discount"]').attr('readonly','readonly');
		}else{
			$("#discount_text").hide();
			$('input[name="discount"]').removeAttr('readonly');
		}
		calculate_total();
	})
	
	$('#main_tb input,#tbl2 input').die().live("keyup","blur",function() { 
		calculate_total();
    });
	$('#main_tb input,#tbl2 select').die().live("change",function() { 
		calculate_total();
    });
	
	$('.rename_check').die().live("click",function() {
		rename_rows(); calculate_total();
    });
	
	<?php if($process_status!="New"){ ?>
	function rename_rows(){
		$("#main_tb tbody tr.tr1").each(function(){
			var row_no=$(this).attr('row_no');
			var val=$(this).find('td:nth-child(6) input[type="checkbox"]:checked').val();
			if(val){
				$(this).find('td:nth-child(2) select').attr("name","invoice_rows["+val+"][item_id]").attr("id","invoice_rows-"+val+"-item_id").rules("add", "required");
				$(this).find('td:nth-child(3) input').removeAttr("readonly").attr("name","invoice_rows["+val+"][quantity]").attr("id","q"+val).attr("id","invoice_rows-"+val+"-quantity").rules("add", "required");
				$(this).find('td:nth-child(4) input').attr("name","invoice_rows["+val+"][rate]").attr("id","q"+val).attr("id","invoice_rows-"+val+"-rate").rules("add", "required");
				$(this).find('td:nth-child(5) input').attr("name","invoice_rows["+val+"][amount]").attr("id","q"+val).attr("id","invoice_rows-"+val+"-amount").rules("add", "required");
				
				$('#main_tb tbody tr.tr2[row_no="'+row_no+'"] td:nth-child(1) textarea').removeAttr("readonly").attr("name","invoice_rows["+val+"][description]").attr("id","invoice_rows-"+val+"-description").rules("add", "required");
				
				$(this).css('background-color','#fffcda');
				$('#main_tb tbody tr.tr2[row_no="'+row_no+'"]').css('background-color','#fffcda');
			}else{
				$(this).find('td:nth-child(2) select').attr({ name:"q", readonly:"readonly"}).rules( "remove", "required" );
				$(this).find('td:nth-child(3) input').attr({ name:"q", readonly:"readonly"}).rules( "remove", "required" );
				$(this).find('td:nth-child(4) input').attr({ name:"q", readonly:"readonly"}).rules( "remove", "required" );
				$(this).find('td:nth-child(5) input').attr({ name:"q", readonly:"readonly"}).rules( "remove", "required" );
				
				$('#main_tb tbody tr.tr2[row_no="'+row_no+'"] td:nth-child(1) textarea').attr({ name:"q", readonly:"readonly"}).rules( "remove", "required" );
				
				$(this).css('background-color','#FFF');
				$('#main_tb tbody tr.tr2[row_no="'+row_no+'"]').css('background-color','#FFF');
			}
			
			
		});
	}
	
	
	function calculate_total(){
		var total=0; var grand_total=0;
		$("#main_tb tbody tr.tr1").each(function(){
			var val=$(this).find('td:nth-child(6) input[type="checkbox"]:checked').val();
			if(val){
				var qty=parseInt($(this).find("td:nth-child(3) input").val());
				var Rate=parseFloat($(this).find("td:nth-child(4) input").val());
				var Amount=qty*Rate;
				$(this).find("td:nth-child(5) input").val(Amount.toFixed(2));
				total=total+Amount;
				var sale_tax=parseFloat($(this).find("td:nth-child(6) input[type=hidden]").eq(1).val());
				if(isNaN(sale_tax)) { var sale_tax = 0; }
				$('input[name="sale_tax_per"]').val(sale_tax);
				var sale_tax_description=$(this).find("td:nth-child(6) input[type=hidden]").eq(2).val();
				$('input[name="sale_tax_description"]').val(sale_tax_description);
			}
		});
		
		if($("#discount_per").is(':checked')){
			var discount_per=parseFloat($('input[name="discount_per"]').val());
			var discount_amount=(total*discount_per)/100;
			if(isNaN(discount_amount)) { var discount_amount = 0; }
			$('input[name="discount"]').val(discount_amount.toFixed(2));
		}else{
			var discount_amount=parseFloat($('input[name="discount"]').val());
			if(isNaN(discount_amount)) { var discount_amount = 0; }
		}
		total=total-discount_amount
		
		var exceise_duty=parseFloat($('input[name="exceise_duty"]').val());
		if(isNaN(exceise_duty)) { var exceise_duty = 0; }
		total=total+exceise_duty
		$('input[name="total"]').val(total.toFixed(2));
		
		if($("#pnfper").is(':checked')){
			var pnf_per=parseFloat($('input[name="pnf_per"]').val());
			var pnf_amount=(total*pnf_per)/100;
			if(isNaN(pnf_amount)) { var pnf_amount = 0; }
			$('input[name="pnf"]').val(pnf_amount.toFixed(2));
		}else{
			var pnf_amount=parseFloat($('input[name="pnf"]').val());
			if(isNaN(pnf_amount)) { var pnf_amount = 0; }
		}
		var total_after_pnf=total+pnf_amount;
		if(isNaN(total_after_pnf)) { var total_after_pnf = 0; }
		$('input[name="total_after_pnf"]').val(total_after_pnf.toFixed(2));
		
		var sale_tax_per=parseFloat($('input[name="sale_tax_per"]').val());
		var sale_tax=(total_after_pnf*sale_tax_per)/100;
		if(isNaN(sale_tax)) { var sale_tax = 0; }
		$('input[name="sale_tax_amount"]').val(sale_tax.toFixed(2));
		
		var fright_amount=parseFloat($('input[name="fright_amount"]').val());
		if(isNaN(fright_amount)) { var fright_amount = 0; }
		
		grand_total=total_after_pnf+sale_tax+fright_amount;
		$('input[name="grand_total"]').val(grand_total.toFixed(2));
	}
	<?php } ?>
	
	
	
	
    $('.addrow').die().live("click",function() { 
		add_row();
    });
	
	
	$('.select_address').on("click",function() { 
		open_address();
    });
	
	$('.closebtn').on("click",function() { 
		$("#myModal12").hide();
    });
	
	
	$('select[name="customer_id"]').on("change",function() {
		var customer_id=$('select[name="customer_id"] option:selected').val();
		var url="<?php echo $this->Url->build(['controller'=>'Customers','action'=>'defaultAddress']); ?>";
		url=url+'/'+customer_id,
		$.ajax({
			url: url,
		}).done(function(response) {
			$('textarea[name="customer_address"]').val(response);
		});
		
		$("#in3_div").html('Loading...');
		var url="<?php echo $this->Url->build(['controller'=>'Filenames','action'=>'listFilename']); ?>";
		url=url+'/'+customer_id,
		$.ajax({
			url: url,
		}).done(function(response) {
			$("#in3_div").html(response);
			$('select[name="qt3"]').attr('name','in3');
		});
		
		var employee_id=$('select[name="customer_id"] option:selected').attr("employee_id");
			$("select[name=employee_id]").val(employee_id).select2();
		
    });
	
	<?php if($process_status!="New"){ ?> 
		var customer_id=$('select[name="customer_id"] option:selected').val();
		
		$("#in3_div").html('Loading...');
		var url="<?php echo $this->Url->build(['controller'=>'Filenames','action'=>'listFilename']); ?>";
		url=url+'/'+customer_id+'/in',
		$.ajax({
			url: url,
		}).done(function(response) {
			$("#in3_div").html(response);
			$('select[name="qt3"]').attr('name','in3');
		});
	<?php } ?>
	
	function open_address(){
		var customer_id=$('select[name="customer_id"]').val();
		$("#result_ajax").html('<div align="center"><?php echo $this->Html->image('/img/wait.gif', ['alt' => 'wait']); ?> Loading</div>');
		var url="<?php echo $this->Url->build(['controller'=>'Customers','action'=>'addressList']); ?>";
		url=url+'/'+customer_id,
		$("#myModal12").show();
		$.ajax({
			url: url,
		}).done(function(response) {
			$("#result_ajax").html(response);
		});
	}
	
	$('.insert_address').die().live("click",function() { 
		var addr=$(this).text();
		$('textarea[name="customer_address"]').val(addr);
		$("#myModal12").hide();
    });
	
	
});
</script>

	 
<div id="myModal12" class="modal fade in" tabindex="-1"  style="display: none; padding-right: 12px;"><div class="modal-backdrop fade in" ></div>
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-body" id="result_ajax">
				
			</div>
			<div class="modal-footer">
				<button class="btn default closebtn">Close</button>
				<button class="btn yellow">Save</button>
			</div>
		</div>
	</div>
</div>


<div id="myModal1" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
		<?php echo $this->Form->create('pull_from_quotation', ['url' => ['action' => 'pull_from_quotation']])?>
			<div class="modal-body">
				<p>
					<label>Select Quotation Ref. No.</label>
					<?php 
					$options=array();
					foreach($quotationlists as $quotationdata){
						$options[]=['text' => h(($quotationdata->qt1.'/QT-'.str_pad($quotationdata->id, 3, '0', STR_PAD_LEFT).'/'.$quotationdata->qt3.'/'.$quotationdata->qt4)), 'value' => $quotationdata->id];
					}
					echo $this->Form->input('quotation_id', ['empty' => "--Select--",'label' => false,'options' => $options,'class' => 'form-control input-sm ']); ?>
				</p>
			</div>
			<div class="modal-footer">
				<button class="btn default" data-dismiss="modal" aria-hidden="true">Close</button>
				<button class="btn blue" type="submit" name="pull_submit">GO</button>
			</div>
		<?= $this->Form->end() ?>
		</div>
	</div>
</div>

<div id="myModal2" class="modal fade in" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1" aria-hidden="false" style="display: none; padding-right: 12px;"><div class="modal-backdrop fade in" ></div>
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-body" id="result_ajax">
			<h4>Commercial Terms & Conditions</h4>
			<table class="table table-hover tabl_tc">
			<?php foreach ($termsConditions as $termsCondition): ?>
				 
				 <tr>
					<td width="10"><label><?php echo $this->Form->input('dummy', ['type' => 'checkbox','label' => false,'class' => '']); ?></label></td>
					<td><p><?= h($termsCondition->text_line) ?></p></td>
				</tr>
			<?php endforeach; ?>
			</table>
			</div>
			<div class="modal-footer">
				<button class="btn default closebtn2">Close</button>
				<button class="btn btn-primary insert_tc">Insert</button>
			</div>
		</div>
	</div>
</div>
