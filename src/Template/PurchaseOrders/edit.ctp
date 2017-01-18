<style>
.table > thead > tr > th, .table > tbody > tr > th, .table > tfoot > tr > th, .table > thead > tr > td, .table > tbody > tr > td, .table > tfoot > tr > td{
	vertical-align: top !important;
}
</style>
<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption">
			<i class="icon-globe font-blue-steel"></i>
			<span class="caption-subject font-blue-steel uppercase">Edit Purchase Order</span>
		</div>
	</div>
	<div class="portlet-body form">
		<!-- BEGIN FORM-->
		<?= $this->Form->create($purchaseOrder,['id'=>'form_sample_3']) ?>
			<div class="form-body">
				<div class="row">
					
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">Purchase Order No. <span class="required" aria-required="true">*</span></label>
							<div class="row">
								<div class="col-md-4">
									<?php echo $this->Form->input('po1', ['label' => false,'class' => 'form-control input-sm','readonly','value'=>$Company->alias]); ?>
								</div>
								<div class="col-md-4">
									<?php echo $this->Form->input('po3', ['options'=>$filenames,'label' => false,'class' => 'form-control input-sm select2me']); ?>
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
							<?php echo $this->Form->textarea('descryption', ['label' => false,'class' => 'form-control input-sm','value' => $purchaseOrder->descryption,'required']); ?>
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
							<?php $q=1; foreach ($purchaseOrder->purchase_order_rows as $purchase_order_rows): ?>
								<tr class="tr1" row_no='<?php echo @$purchase_order_rows->id; ?>'>
									<td rowspan="2"><?= h($q) ?></td>
									<td>
									<?php echo $this->Form->input('purchase_order_rows.'.$q.'.processed_quantity', ['type' => 'hidden','value'=>@$purchase_order_rows->processed_quantity]);?>	
									<?php echo $this->Form->input('purchase_order_rows.'.$q.'.item_id', ['options' => $items,'label' => false,'class' => 'form-control input-sm','placeholder' => 'Item','value'=>$purchase_order_rows->item_id]); ?></td>
									<td><?php echo $this->Form->input('purchase_order_rows.'.$q.'.quantity', ['type' => 'text','label' => false,'class' => 'form-control input-sm quantity','placeholder' => 'Quantity','value'=>$purchase_order_rows->quantity]); ?></td>
									<td><?php echo $this->Form->input('purchase_order_rows.'.$q.'.rate', ['type' => 'text','label' => false,'class' => 'form-control input-sm','placeholder' => 'Rate','step'=>"0.01",'value'=>$purchase_order_rows->rate]); ?></td>
									<td><?php echo $this->Form->input('purchase_order_rows.'.$q.'.amount', ['type' => 'text','label' => false,'class' => 'form-control input-sm','placeholder' => 'Amount','value'=>$purchase_order_rows->amount]); ?></td>
									
									<td><a class="btn btn-xs btn-default addrow" href="#" role='button'><i class="fa fa-plus"></i></a><a class="btn btn-xs btn-default deleterow" href="#" role='button'><i class="fa fa-times"></i></a></td>
								</tr>
								<tr class="tr2" row_no='<?php echo @$purchase_order_rows->id; ?>'>
									<td colspan="6"><?php echo $this->Form->textarea('purchase_order_rows.'.$q.'.description', ['label' => false,'class' => 'form-control input-sm autoExpand','placeholder' => 'Description','rows'=>'5','value'=>$purchase_order_rows->description,'required']); ?></td>
									<td></td>
								</tr>
						<?php $q++; endforeach; ?>
							
						</tbody>
						<tfoot>
							<tr>
								<td colspan="4" align="right"><b>Total</b></td>
								<td><?php echo $this->Form->input('total', ['type' => 'text','label' => false,'class' => 'form-control input-sm','placeholder' => 'Total']); ?></td>
								<td></td>
							</tr>
							<tr>
								<td colspan="4" align="right"><b>Discount</b></td>
								<td><?php echo $this->Form->input('discount', ['type' => 'text','label' => false,'class' => 'form-control input-sm quantity','placeholder' => 'Discount']); ?>
								<?php echo $this->Form->radio('discount_type',[['value' => '%', 'text' => 'Percent(%)'],['value' => '', 'text' => 'Amount']]); ?>
								</td>
								
							</tr>
							
							
							<tr>
								<td colspan="4" align="right"><b>P&F</b></td>
								<td><?php echo $this->Form->input('pnf', ['type' => 'text','label' => false,'class' => 'form-control input-sm quantity','placeholder' => 'P&f']); ?>
								<?php echo $this->Form->radio('pnf_type',[['value' => '%', 'text' => 'Percent(%)'],['value' => '', 'text' => 'Amount']]); ?>
								</td>
							</tr>
							
							
						</tfoot>
					</table>
				</div>
				
				<div class="row">
					<div class="col-md-3">
						<div class="form-group">
							<label class="control-label">Material to be transported at</label>
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
							echo $this->Form->input('sale_tax_per', ['options'=>$options,'label' => false,'class' => 'form-control input-sm select2me','id'=>'saletax']);
							?>
							
							<?php echo $this->Form->input('sale_tax_description', ['type'=>'hidden','label' => false,'class' => 'form-control input-sm ', 'placeholder'=>'Sale Tax Description']);
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
								<?php echo $this->Form->input('delivery_date', ['type'=>'text','label' => false,'class' => 'form-control input-sm date-picker','placeholder'=>'Delivery Date','data-date-format'=>'dd-mm-yyyy','data-date-start-date' => '+0d','data-date-end-date' => '+60d','value'=>date("d-m-Y",strtotime($purchaseOrder->delivery_date))]); ?>
								
							</div>
						</div>
				</div>
				</div>
				
				<div class="row">
					<div class="col-md-3">
						<div class="form-group">
							<label class="control-label">LR to be prepared in favour of</label>
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
							echo $this->Form->input('transporter_id',['empty'=>'--Select--','options'=>$transporters,'label' => false,'class' => 'form-control input-sm select2me']); ?>
						</div>
					</div>
					<div class="col-md-3">
						<div class="form-group">
							<label class="control-label">Customer <span class="required" aria-required="true">*</span></label>
							<?php 
							foreach($customers as $customer){
								if(empty($customer->alias)){
									$merge=$customer->customer_name;
								}else{
									$merge=$customer->customer_name.'	('.$customer->alias.')';
								}
								$option[]=['text' =>$merge, 'value' => $customer->id];
									
								}
							echo $this->Form->input('customer_id', ['empty' => "--Select--",'label' => false,'options' => $option,'class' => 'form-control input-sm select2me']); ?>
						</div>
						
					</div>
					<div class="col-md-3">
						<div class="form-group">
							<label class="control-label">Excise Duty <span class="required" aria-required="true">*</span></label>
							<?php 
							echo $this->Form->input('excise_duty',['label' => false,'class' => 'form-control input-sm','placeholder'=>'Excise Duty']); ?>
						</div>
					</div>
			
			</div>
			<div class="form-actions">
				 <button type="submit" class="btn blue-hoki">Update Purchase Order</button>
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
 
.table thead tr th {
    color: #FFF;
	background-color: #254b73;
}
</style>

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

	
	
		<?php if(empty($purchaseOrder->purchase_order_rows)){ ?>
		add_row();
		<?php } ?> 
	
		$("#saletax").on('click',function(){
			if($(this).is(':click')){ 
				$("#pnf_text").show();
				$('input[name="pnf"]').css('display','block');
			}else{
				$("#pnf_text").hide();
				$('input[name="pnf"]').removeAttr('readonly');
			}
		})
		
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

	rename_rows();
	calculate_total();
	
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
		rename_rows();
		calculate_total();
	}
	
		$('.deleterow').die().live("click",function() {
		var l=$(this).closest("table tbody").find("tr").length;
		if (confirm("Are you sure to remove row ?") == true) {
			if(l>2){
				var row_no=$(this).closest("tr").attr("row_no");
				var del="tr[row_no="+row_no+"]";
				$(del).remove();
				rename_rows();
				calculate_total();
			}
		} 
    });
	
	
	function rename_rows(){
	var i=0;
		$("#main_tb tbody tr.tr1").each(function(){
			i++;
			$(this).find("td:nth-child(1)").html(i);
			$(this).find("td:nth-child(2) select").select2().attr({name:"purchase_order_rows["+i+"][item_id]", id:"purchase_order_rows-"+i+"-item_id"}).rules("add", "required");
			$(this).find("td:nth-child(3) input").attr({name:"purchase_order_rows["+i+"][quantity]", id:"purchase_order_rows-"+i+"-quantity"}).rules("add", "required");
			$(this).find("td:nth-child(4) input").attr({name:"purchase_order_rows["+i+"][rate]", id:"purchase_order_rows-"+i+"-rate"}).rules("add", "required");
			$(this).find("td:nth-child(5) input").attr("name","purchase_order_rows["+i+"][amount]");
		});
		var i=0;
		
		$("#main_tb tbody tr.tr2").each(function(){
			i++;
			$(this).find("td:nth-child(1) textarea").attr({name:"purchase_order_rows["+i+"][description]", id:"purchase_order_rows-"+i+"-description"}).rules("add", "required");
		});
		
			
	}
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
		$('input[name="total"]').val(total.toFixed(2));
		
	}
	$('select[name=sale_tax_per]').die().live("change",function() {
		var description=$('select[name=sale_tax_per] option:selected').attr('description');
		$('input[name=sale_tax_description]').val(description);
    });
	
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
			<td><?php echo $this->Form->input('q', ['empty'=>'Select','options' => $items,'label' => false,'class' => 'form-control input-sm']); ?></td>
			<td width="100"><?php echo $this->Form->input('q', ['label' => false,'class' => 'form-control input-sm quantity','placeholder' => 'Quantity']); ?></td>
			<td width="130"><?php echo $this->Form->input('q', ['type' => 'text','label' => false,'class' => 'form-control input-sm','placeholder' => 'Rate']); ?></td>
			<td width="130"><?php echo $this->Form->input('q', ['type' => 'text','label' => false,'class' => 'form-control input-sm','placeholder' => 'Amount']); ?></td>
			<td  width="70"><a class="btn btn-xs btn-default addrow" href="#" role='button'><i class="fa fa-plus"></i></a><a class="btn btn-xs btn-default deleterow" href="#" role='button'><i class="fa fa-times"></i></a></td>
		</tr>
		<tr class="tr2">
			<td colspan="6"><?php echo $this->Form->input('description', ['label' => false,'class' => 'form-control input-sm autoExpand','placeholder' => 'Description','rows'=>'5']); ?></td>
			<td></td>
		</tr>
	</tbody>
</table>