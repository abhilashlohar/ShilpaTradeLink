<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption">
			<i class="icon-globe font-blue-steel"></i>
			<span class="caption-subject font-blue-steel uppercase">Add Purchase Order</span>
		</div>
	</div>
	<div class="portlet-body form">
		<!-- BEGIN FORM-->
		<?= $this->Form->create($purchaseOrder,['id'=>'form_sample_3']) ?>
			<div class="form-body">
				<div class="row">
					<div class="col-md-3">
						<div class="form-group">
							<label class="control-label">Company <span class="required" aria-required="true">*</span></label>
							<?php 
							$options=array();
							foreach($companies as $companie){
								$options[]=['text' => $companie->name, 'value' => $companie->id, 'alias' => $companie->alias];
							}
							echo $this->Form->input('company_id', ['empty'=>'--Select-','options' => $options,'label' => false,'class' => 'form-control input-sm select2me']); ?>
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">Purchase Order No. <span class="required" aria-required="true">*</span></label>
							<div class="row">
								<div class="col-md-4">
									<?php echo $this->Form->input('po1', ['label' => false,'class' => 'form-control input-sm','readonly']); ?>
								</div>
								<div class="col-md-4">
									<?php echo $this->Form->input('po3', ['options'=>$filenames,'label' => false,'class' => 'form-control input-sm']); ?>
								</div>
								<div class="col-md-4">
									<?php echo $this->Form->input('po4', ['label' => false,'value'=>'16-17','class' => 'form-control input-sm','readonly']); ?>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-3">
						<div class="form-group">
							<label class="control-label">Supplier <span class="required" aria-required="true">*</span></label>
							<?php echo $this->Form->input('vendor_id', ['options'=>$vendors,'empty'=>'--Select--','label' => false,'class' => 'form-control input-sm select2me']); ?>
						</div>
					</div>
					<div class="col-md-2">
						<div class="form-group">
							<label class="control-label">Date</label>
							<?php echo $this->Form->input('date_created', ['type' => 'text','label' => false,'class' => 'form-control input-sm','value' => date("d-m-Y"),'readonly']); ?>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="form-group">
							<?php echo $this->Form->textarea('descryption', ['label' => false,'class' => 'form-control input-sm','value' => 'Dear Sir,
With reference to your price list we are pleased to place an order for the following items as per conditions given below.','required']); ?>
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
								<th width="130">Rate</th>
								<th width="130">Amount</th>
								<th width="70"></th>
							</tr>
						</thead>
						<tbody>
							
						</tbody>
						<tfoot>
						
							<tr>
							<td  colspan="4" align="right">
							<b>Discount <label><?php echo $this->Form->input('discount_type', ['type' => 'checkbox','label' => false,'class' => 'form-control input-sm','id'=>'discount_per']); ?></label>(in %)</b>
							<div class="input-group col-md-2" style="display:none;" id="discount_text">
							<input type="text" name="discount_per" class="form-control input-sm" placeholder="5.5"  'step'=0.01><span class="input-group-addon">%</span>
							</div>
							</td>
							<td><?php echo $this->Form->input('discount', ['type' => 'number','label' => false,'class' => 'form-control input-sm','placeholder' => 'Discount','step'=>0.01]); ?></td>
							</tr>
							
							<tr style="background-color:#e6faf9;">
								<td colspan="4" align="right"><b><?php echo $this->Form->input('ed_description', ['type' => 'text','label' => false,'class' => 'form-control input-sm','placeholder' => 'Excise-Duty Description','style'=>['text-align:right']]); ?> </b></td>
								<td><?php echo $this->Form->input('exceise_duty', ['type' => 'text','label' => false,'class' => 'form-control input-sm','placeholder' => 'Excise-Duty','value' => 0]); ?></td>
							</tr>
							
							<tr>
								<td colspan="4" align="right"><b>Total</b></td>
								<td><?php echo $this->Form->input('total', ['type' => 'text','label' => false,'class' => 'form-control input-sm','placeholder' => 'Total']); ?></td>
								<td></td>
							</tr>
							

							
							<tr>
								<td  colspan="4" align="right">
								<b>P&F <label><?php echo $this->Form->input('pnf_type', ['type' => 'checkbox','label' => false,'class' => 'form-control input-sm','id'=>'pnfper']); ?></label>(in %)</b>
								<div class="input-group col-md-2" style="display:none;" id="pnf_text">
								<input type="text" name="pnf_per" class="form-control input-sm" placeholder="5.5"  'step'=0.01><span class="input-group-addon">%</span>
								</div>
								</td>
								<td><?php echo $this->Form->input('pnf', ['type' => 'number','label' => false,'class' => 'form-control input-sm','placeholder' => 'P&F','step'=>0.01]); ?></td>
							</tr>
							<tr>
							<td  colspan="4" align="right"><b>Grand Total </b></td>
							<td><?php echo $this->Form->input('grand_total', ['type' => 'text','label' => false,'class' => 'form-control input-sm','placeholder' => 'Total after P&F','readonly','step'=>0.01]); ?></td>
							</tr>
							
						</tfoot>
					</table>
				</div>
				
				<div class="row">
					<div class="col-md-3">
						<div class="form-group">
							<label class="control-label">Material to be transported at <span class="required" aria-required="true">*</span></label>
							<?php 
							echo $this->Form->input('material_to_be_transported',['label' => false,'class' => 'form-control input-sm','placeholder'=>'Material to be transported at']); ?>
						</div>
					</div>
					<div class="col-md-3">
						<div class="form-group">
							<label class="control-label">Sale Tax <span class="required" aria-required="true">*</span></label>
							<?php 
							$options=[];
							foreach($SaleTaxes as $SaleTaxe){
								$options[]=['text' => (string)$SaleTaxe->tax_figure.'%', 'value' => $SaleTaxe->tax_figure, 'description' => $SaleTaxe->description];
							}
							echo $this->Form->input('sale_tax_per', ['empty'=>'--Select--','options'=>$options,'label' => false,'class' => 'form-control input-sm']);
							
							?>
						</div>
					</div>
					
					<div class="col-md-3">
						<div class="form-group">
							<label class="control-label">Delivery <span class="required" aria-required="true">*</span></label>
							<?php 
							echo $this->Form->input('delivery',['label' => false,'class' => 'form-control input-sm','placeholder'=>'Delivery']); ?>
						</div>
					</div>
					
					<div class="col-md-3">
						<div class="form-group">
							<label class="control-label">Delivery Date</label>
							
								<?php echo $this->Form->input('delivery_date', ['type'=>'text','label' => false,'class' => 'form-control input-sm date-picker','placeholder'=>'Delivery Date','data-date-format'=>'dd-mm-yyyy','data-date-start-date' => '+0d','data-date-end-date' => '+60d']); ?>
							</div>
						</div>
				</div>
				</div>
				
				<div class="row">
					<div class="col-md-3">
						<div class="form-group">
							<label class="control-label">LR to be prepared in favour of <span class="required" aria-required="true">*</span></label>
							<?php 
							echo $this->Form->input('lr_to_be_prepared_in_favour_of',['label' => false,'class' => 'form-control input-sm','placeholder'=>'LR to be prepared in favour of']); ?>
						</div>
					</div>
					<div class="col-md-3">
						<div class="form-group">
							<label class="control-label">Payment Terms <span class="required" aria-required="true">*</span></label>
							<?php 
							echo $this->Form->input('payment_terms',['label' => false,'class' => 'form-control input-sm','placeholder'=>'Payment Terms']); ?>
						</div>
					</div>
					<div class="col-md-3">
						<div class="form-group">
							<label class="control-label">Road permit form 47 <span class="required" aria-required="true">*</span></label>
							<?php 
							echo $this->Form->input('road_permit_form47',['label' => false,'class' => 'form-control input-sm','placeholder'=>'Road permit form 47']); ?>
						</div>
					</div>
					<div class="col-md-3">
						<div class="form-group">
							<label class="control-label">Transporter <span class="required" aria-required="true">*</span></label>
							<?php 
							echo $this->Form->input('transporter_id',['empty'=>'--Select--','options'=>$transporters,'label' => false,'class' => 'form-control input-sm']); ?>
						</div>
					</div>
				</div>
			</div>
			<div class="form-actions">
				 <button type="submit" class="btn blue-hoki">Add Vendor</button>
			</div>
		<?= $this->Form->end() ?>
		<!-- END FORM-->
	</div>
</div>

<?php echo $this->Html->script('/assets/global/plugins/jquery.min.js'); ?>
<style>
#sortable li{
	cursor: -webkit-grab;
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

	$('select[name="company_id"]').on("change",function() {
		var alias=$('select[name="company_id"] option:selected').attr("alias");
		$('input[name="po1"]').val(alias);
    });
	
	add_row();
    $('.addrow').die().live("click",function() { 
		add_row();
    });
	
	function add_row(){
		var tr1=$("#sample_tb tbody tr.tr1").clone();
		$("#main_tb tbody").append(tr1);
		var tr2=$("#sample_tb tbody tr.tr2").clone();
		$("#main_tb tbody").append(tr2);
		
		var w=0; var r=0;
		$("#main_tb tbody tr").each(function(){
			$(this).attr("row_no",w);
			r++;
			if(r==2){ w++; r=0; }
		});
		
		var i=0;
		$("#main_tb tbody tr.tr1").each(function(){
			i++;
			$(this).find("td:nth-child(1)").html(i);
			$(this).find("td:nth-child(2) select").attr("name","purchase_order_rows["+i+"][item_id]").select2();
			$(this).find("td:nth-child(3) input").attr("name","purchase_order_rows["+i+"][quantity]");
			$(this).find("td:nth-child(4) input").attr("name","purchase_order_rows["+i+"][rate]");
			$(this).find("td:nth-child(5) input").attr("name","purchase_order_rows["+i+"][amount]");
		});
		var i=0;
		
		$("#main_tb tbody tr.tr2").each(function(){
			i++;
			$(this).find("td:nth-child(1) textarea").attr("name","purchase_order_rows["+i+"][description]");
		});
		
		
		
		$(document)
		.one('focus.textarea', '.autoExpand', function(){
			var savedValue = this.value;
			this.value = '';
			this.baseScrollHeight = this.scrollHeight;
			this.value = savedValue;
		})
		.on('input.textarea', '.autoExpand', function(){
			var minRows = this.getAttribute('data-min-rows')|0,rows;
			this.rows = minRows;
			console.log(this.scrollHeight , this.baseScrollHeight);
			rows = Math.ceil((this.scrollHeight - this.baseScrollHeight) / 17);
			this.rows = minRows + rows;
		});
	}
	
		$('.deleterow').die().live("click",function() {
		var l=$(this).closest("table tbody").find("tr").length;
		if (confirm("Are you sure to remove row ?") == true) {
			if(l>2){
				var row_no=$(this).closest("tr").attr("row_no");
				var del="tr[row_no="+row_no+"]";
				$(del).remove();
				var i=0;
				$("#main_tb tbody tr.tr1").each(function(){
					i++;
					$(this).find("td:nth-child(1)").html(i);
					$(this).find("td:nth-child(2) select").attr("name","purchase_order_rows["+i+"][item_id]").select2();
					$(this).find("td:nth-child(3) input").attr("name","purchase_order_rows["+i+"][quantity]");
					$(this).find("td:nth-child(4) input").attr("name","purchase_order_rows["+i+"][rate]");
					$(this).find("td:nth-child(5) input").attr("name","purchase_order_rows["+i+"][amount]");
					$(this).find("td:nth-child(7) input").attr("name","sales_order_rows["+i+"][sale_tax_description]");
					var description=$(this).find("td:nth-child(7) select option:selected").attr("description");
					$(this).find("td:nth-child(7) input").val(description);
				});
				var i=0;
				$("#main_tb tbody tr.tr2").each(function(){
					i++;
					$(this).find("td:nth-child(1) textarea").attr("name","sales_order_rows["+i+"][description]");
				});
				calculate_total();
			}
		} 
    });
	
	
		$('#main_tb input').die().live("keyup","blur",function() { 
		calculate_total();
    });
	
	function calculate_total(){
		var total=0;  var grand_total=0;
		$("#main_tb tbody tr.tr1").each(function(){
			var unit=$(this).find("td:nth-child(3) input").val();
			var Rate=$(this).find("td:nth-child(4) input").val();
			var Amount=unit*Rate;
			$(this).find("td:nth-child(5) input").val(Amount.toFixed(2));
			total=total+Amount;
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
		total=total-discount_amount;
		
		var exceise_duty=parseFloat($('input[name="exceise_duty"]').val());
		if(isNaN(exceise_duty)) { var exceise_duty = 0; }
		total=total+exceise_duty;
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
		var grand_total=total+pnf_amount;
		
		if(isNaN(grand_total)) { var grand_total = 0; }
		
		
		
		$('input[name="grand_total"]').val(grand_total.toFixed(2));
		
	
		
	}
	
	
	
	
	$('select[name=sale_tax_per]').die().live("change",function() {
		var description=$('select[name=sale_tax_per] option:selected').attr('description');
		$('input[name=sale_tax_description]').val(description);
    });
});
</script>
<table id="sample_tb" style="display:none;">
	<tbody>
		<tr class="tr1">
			<td rowspan="2" width="10">0</td>
			<td><?php echo $this->Form->input('q', ['empty'=>'Select','options' => $items,'label' => false,'class' => 'form-control input-sm select2-offscreen']); ?></td>
			<td width="100"><?php echo $this->Form->input('q', ['label' => false,'class' => 'form-control input-sm','placeholder' => 'Quantity']); ?></td>
			<td width="130"><?php echo $this->Form->input('q', ['type' => 'text','label' => false,'class' => 'form-control input-sm','placeholder' => 'Rate']); ?></td>
			<td width="130"><?php echo $this->Form->input('q', ['type' => 'text','label' => false,'class' => 'form-control input-sm','placeholder' => 'Amount']); ?></td>
			<td  width="70"><a class="btn btn-xs btn-default addrow" href="#" role='button'><i class="fa fa-plus"></i></a><a class="btn btn-xs btn-default deleterow" href="#" role='button'><i class="fa fa-times"></i></a></td>
		</tr>
		<tr class="tr2">
			<td colspan="4"><?php echo $this->Form->textarea('description', ['label' => false,'class' => 'form-control input-sm autoExpand','placeholder' => 'Description','rows'=>'1']); ?></td>
			<td></td>
		</tr>
	</tbody>
</table>