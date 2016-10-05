<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption">
			<i class="icon-globe font-blue-steel"></i>
			<span class="caption-subject font-blue-steel uppercase">Edit Sales Order</span>
		</div>
		<div class="actions">
			<a href="#myModal1" role="button" class="btn blue pull-right" data-toggle="modal">Pull Quotation</a>
		</div>
	</div>
	<div class="portlet-body form">
		<?= $this->Form->create($salesOrder,['id'=>'quotation_entry']) ?>
		<div class="form-body">
			<div class="row">
				<div class="col-md-6">
					<div class="form-group">
						<label class="col-md-3 control-label">Company</label>
						<div class="col-md-9">
							<?php 
							$options=array();
							foreach($companies as $companie){
								$options[]=['text' => $companie->name, 'value' => $companie->id, 'alias' => $companie->alias];
							}
							echo $this->Form->input('company_id',['options' => $options,'empty' => "--Select Company--",'label' => false,'class' => 'form-control input-sm select2me','value' => @$quotation->company_id] ); ?>
						</div>
					</div>
				</div>
				<div class="col-md-3">
				</div>
				<div class="col-md-3">
					<div class="form-group">
						<label class="col-md-3 control-label">Date</label>
						<div class="col-md-9">
							<?php echo $this->Form->input('date', ['type' => 'text','label' => false,'class' => 'form-control input-sm','value' => date("d-m-Y"),'readonly']); ?>
						</div>
					</div>
				</div>
			</div><br/>
			<div class="row">
				<div class="col-md-6">
					<div class="form-group">
						<label class="col-md-3 control-label">Customer</label>
						<div class="col-md-9">
							<?php echo $this->Form->input('customer_id', ['empty' => "--Select--",'label' => false,'options' => $customers,'class' => 'form-control input-sm select2me','value' => @$quotation->customer_id]); ?>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label class="col-md-3 control-label">Sales Order No.</label>
						<div class="col-md-3">
							<?php echo $this->Form->input('so1', ['label' => false,'class' => 'form-control input-sm','readonly']); ?>
						</div>
						<div class="col-md-3" id="so3_div">
							<?php echo $this->Form->input('so3', ['label' => false,'class' => 'form-control input-sm']); ?>
						</div>
						<div class="col-md-3">
							<?php echo $this->Form->input('so4', ['label' => false,'value'=>'16-17','class' => 'form-control input-sm','readonly']); ?>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6">
					<div class="form-group">
						<label class="col-md-3 control-label">Address</label>
						<div class="col-md-9">
							<?php echo $this->Form->input('customer_address', ['label' => false,'class' => 'form-control','placeholder' => 'Address','value' => @$quotation->customer_address]); ?>
							<a href="#" role="button" class="pull-right select_address" >
							Select Address </a>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label class="col-md-3 control-label">Salesman</label>
						<div class="col-md-9">
							<?php echo $this->Form->input('employee_id', ['empty' => "--Select--",'label' => false,'options' => $employees,'class' => 'form-control input-sm select2me','value' => @$quotation->customer_id]); ?>
						</div>
					</div>
				</div>
			</div>
			<br/>
			<div class="row">
				<div class="col-md-6">
					<div class="form-group">
						<label class="col-md-3 control-label">Customer PO NO <span class="required" aria-required="true">*</span></label>
						<div class="col-md-9">
							<?php echo $this->Form->input('customer_po_no', ['type' => 'text','label' => false,'class' => 'form-control input-sm','placeholder' => 'Customer PO NO']); ?>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label class="col-md-3 control-label">PO Date <span class="required" aria-required="true">*</span></label>
						<div class="col-md-9">
							<?php echo $this->Form->input('po_date', ['type'=>'text','label' => false,'class' => 'form-control input-sm date-picker','placeholder'=>'PO Date','data-date-format'=>'dd-mm-yyyy','data-date-start-date' => '-60d','data-date-end-date' => '0d']); ?>
						</div>
					</div>
				</div>
			</div>
			<br/>
			<div class="alert alert-danger" id="row_error" style="display:none;">
				Fill Quantity and Rate.
			</div>
			<table class="table tableitm" id="main_tb">
				<thead>
					<tr>
						<th width="50">S No</th>
						<th>Items</th>
						<th width="130">Quantity</th>
						<th width="130">Rate</th>
						<th width="130">Amount</th>
						<th width="100">Excise Duty</th>
						<th width="90">Sale Tax</th>
						<th width="70"></th>
					</tr>
				</thead>
				<tbody>
					<?php 
					if(!empty($quotation->quotation_rows)){
					$q=0; foreach ($quotation->quotation_rows as $quotation_rows): ?>
						<tr class="tr1" row_no='<?php echo @$quotation_rows->id; ?>'>
							<td rowspan="2"><?php echo ++$q; --$q; ?></td>
							<td><?php echo $this->Form->input('sales_order_rows.'.$q.'.item_id', ['options' => $items,'label' => false,'class' => 'form-control input-sm','placeholder'=>'Item','value' => @$quotation_rows->item->id]); ?></td>
							<td><?php echo $this->Form->input('sales_order_rows.'.$q.'.quantity', ['label' => false,'class' => 'form-control input-sm','placeholder'=>'Quantity','value' => @$quotation_rows->quantity]); ?></td>
							<td><?php echo $this->Form->input('sales_order_rows.'.$q.'.rate', ['type'=>'text','label' => false,'class' => 'form-control input-sm','placeholder'=>'Rate','value' => @$quotation_rows->rate]); ?></td>
							<td><?php echo $this->Form->input('sales_order_rows.'.$q.'.amount', ['type'=>'text','label' => false,'class' => 'form-control input-sm','placeholder'=>'Amount','value' => @$quotation_rows->amount]); ?></td>
							<td><?php 
							$options=['Yes'=>'Yes','No'=>'No'];
							echo $this->Form->input('sales_order_rows.'.$q.'.excise_duty', ['options'=>$options,'label' => false,'class' => 'form-control input-sm']); ?></td>
							<td>
							<?php $options=[];
							foreach($SaleTaxes as $SaleTaxe){
								$options[(string)$SaleTaxe->tax_figure]=$SaleTaxe->tax_figure;
							}
							echo $this->Form->input('so_sale_tax', ['options'=>$options,'label' => false,'class' => 'form-control input-sm']); ?>
							</td>
							<td><a class="btn btn-xs btn-default addrow" href="#" role='button'><i class="fa fa-plus"></i></a><a class="btn btn-xs btn-default deleterow" href="#" role='button'><i class="fa fa-times"></i></a></td>
						</tr>
						<tr class="tr2" row_no='<?php echo @$quotation_rows->id; ?>'>
							<td colspan="6"><?php echo $this->Form->input('sales_order_rows.'.$q.'.description', ['label' => false,'type' => 'textarea','class' => 'form-control input-sm','placeholder'=>'Description','rows'=>'3','value' => @$quotation_rows->description]); ?></td>
							<td></td>
						</tr>
					<?php $q++; endforeach; } ?>
				</tbody>
			</table>
			<table class="table" id="tbl2">
				<tbody>
					<tr>
						<td align="right"><b>Total</b></td>
						<td width="200"><?php echo $this->Form->input('total', ['type' => 'text','label' => false,'class' => 'form-control input-sm','placeholder' => 'Total','value' => @$quotation->total]); ?></td>
						<td width="70"></td>
					</tr>
					<tr>
						<td colspan="3">
						<label class="control-label">Additional Note <span class="required" aria-required="true">*</span></label>
						<?php echo $this->Form->input('additional_note', ['label' => false,'class' => 'form-control input-sm','placeholder'=>'Additional Note']); ?></td>
					</tr>
				</tbody>
			</table> 
			
			
			<div class="row">
				<div class="col-md-4">
					<div class="form-group">
						<label class="control-label">Transporter <span class="required" aria-required="true">*</span></label>
						<?php echo $this->Form->input('transporter_id', ['empty' => "--Select--",'label' => false,'options' => $transporters,'class' => 'form-control input-sm','placeholder'=>'Transporter']); ?>
					</div>
					<br/>
					<div class="form-group">
						<label class="control-label">Documents Courier <span class="required" aria-required="true">*</span></label>
						<?php echo $this->Form->input('documents_courier_id', ['empty' => "--Select--",'label' => false,'options' => $transporters,'class' => 'form-control input-sm','placeholder'=>'Documents Courier']); ?>
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group">
						<label class="control-label">Expected Delivery Date <span class="required" aria-required="true">*</span></label>
						<?php echo $this->Form->input('expected_delivery_date', ['type' => 'text','label' => false,'class' => 'form-control input-sm date-picker','placeholder' => 'Expected Delivery Date','data-date-format'=>'dd-mm-yyyy','data-date-start-date' => '+0d','data-date-end-date' => '+60d']); ?>
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group">
						<label class="control-label">Delivery Description <span class="required" aria-required="true">*</span></label>
						<?php echo $this->Form->input('delivery_description', ['label' => false,'class' => 'form-control input-sm','placeholder'=>'Delivery Description']); ?>
					</div>
				</div>
			</div>
			<h4>Dispatch Details</h4>
			<div class="row">
				<div class="col-md-4">
					<div class="form-group">
						<label class="control-label">Name <span class="required" aria-required="true">*</span></label>
						<?php echo $this->Form->input('dispatch_name', ['label' => false,'class' => 'form-control input-sm firstupercase','placeholder'=>'Name']); ?>
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group">
						<label class="control-label">Mobile <span class="required" aria-required="true">*</span></label>
						<?php echo $this->Form->input('dispatch_mobile', ['type' => 'text','label' => false,'class' => 'form-control input-sm','placeholder' => 'Mobile','data-date-format'=>'dd-mm-yyyy']); ?>
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group">
						<label class="control-label">Email <span class="required" aria-required="true">*</span></label>
						<?php echo $this->Form->input('dispatch_email', ['type'=>'text','label' => false,'class' => 'form-control input-sm','placeholder'=>'Email']); ?>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-4">
					<div class="form-group">
						<label class="control-label">Road Permit Required <span class="required" aria-required="true">*</span></label>
						<?php echo $this->Form->radio('road_permit_required',[['value' => 'Yes', 'text' => 'Yes'],['value' => 'No', 'text' => 'No']]); ?>
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group">
						<label class="control-label">Form-49 Required <span class="required" aria-required="true">*</span></label>
						<?php echo $this->Form->radio('form49',[['value' => 'Yes', 'text' => 'Yes'],['value' => 'No', 'text' => 'No']]); ?>
					</div>
				</div>
			</div>
			<!--<label>Commercial Terms & Conditions:</label> <a href="#" role="button" class="select_term_condition">Select </a>
			<?php echo $this->Form->input('terms_conditions', ['label' => false,'class' => 'form-control','value' => @$quotation->terms_conditions]); ?>-->
			<br/>
		</div>
		<?php echo $this->Form->input('process_status', ['type' => 'hidden','value' => @$process_status]); ?>
		<div class="form-actions">
			<div class="row">
				<div class="col-md-offset-3 col-md-9">
					<button type="submit" class="btn btn-primary">ADD SALES ORDER</button>
				</div>
			</div>
		</div>
		
		<?= $this->Form->end() ?>
	</div>
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
			<td><?php echo $this->Form->input('item_id', ['options' => $items,'label' => false,'class' => 'form-control input-sm','placeholder' => 'Item']); ?></td>
			<td><?php echo $this->Form->input('unit[]', ['type' => 'number','label' => false,'class' => 'form-control input-sm','placeholder' => 'Quantity']); ?></td>
			<td><?php echo $this->Form->input('rate[]', ['type' => 'text','label' => false,'class' => 'form-control input-sm','placeholder' => 'Rate','step'=>"0.01"]); ?></td>
			<td><?php echo $this->Form->input('amount[]', ['type' => 'text','label' => false,'class' => 'form-control input-sm','placeholder' => 'Amount']); ?></td>
			<td><?php 
			$options=['Yes'=>'Yes','No'=>'No'];
			echo $this->Form->input('excise_duty', ['options'=>$options,'label' => false,'class' => 'form-control input-sm']); ?></td>
			<td>
			<?php $options=[];
			foreach($SaleTaxes as $SaleTaxe){
				$options[(string)$SaleTaxe->tax_figure]=$SaleTaxe->tax_figure;
			}
			echo $this->Form->input('so_sale_tax', ['options'=>$options,'label' => false,'class' => 'form-control input-sm']); ?>
			</td>
			<td><a class="btn btn-xs btn-default addrow" href="#" role='button'><i class="fa fa-plus"></i></a><a class="btn btn-xs btn-default deleterow" href="#" role='button'><i class="fa fa-times"></i></a></td>
		</tr>
		<tr class="tr2">
			<td colspan="6"><?php echo $this->Form->textarea('description', ['label' => false,'class' => 'form-control input-sm autoExpand','placeholder' => 'Description','rows'=>'1']); ?></td>
			<td></td>
		</tr>
	</tbody>
</table>

<div id="terms_conditions" style="display:none;">
</div>
<?php echo $this->Html->script('/assets/global/plugins/jquery.min.js'); ?>
<script>
$(document).ready(function() {
	
	//--------- FORM VALIDATION

			var form1 = $('#quotation_entry');
            var error1 = $('.alert-danger', form1);
            var success1 = $('.alert-success', form1);

            form1.validate({
                errorElement: 'span', //default input error message container
                errorClass: 'help-block help-block-error', // default input error message class
                focusInvalid: false, // do not focus the last invalid input
                ignore: "",  // validate all fields including form hidden input
                messages: {
                    select_multi: {
                        maxlength: jQuery.validator.format("Max {0} items allowed for selection"),
                        minlength: jQuery.validator.format("At least {0} items must be selected")
                    }
                },
                rules: {
                    company_id:{
						required: true,
					},
 					date : {
						  required: true,
                    },
					customer_id : {
						  required: true,
                    },
					so1 : {
						  required: true,
                    },
					so3:{
						required: true
					},
					so4:{
						required: true,
					},
					customer_address:{
						required: true,
					},
 					employee_id : {
						  required: true,
                    },
					customer_po_no  : {
						  required: true,
                    },
					po_date: {
						  required: true,
                    },
					transporter_id:{
						required: true,	
					},
					documents_courier_id:{
						required: true,	
					},
					expected_delivery_date:{
						required: true,	
					},
					delivery_description:{
						required: true,	
					},
					dispatch_name:{
						required: true,	
					},
					dispatch_mobile:{
						required: true,	
					},
					dispatch_email:{
						required: true,	
					}
                },

                invalidHandler: function (event, validator) { //display error alert on form submit              
                    success1.hide();
                    error1.show();
                    Metronic.scrollTo(error1, -200);
                },

                highlight: function (element) { // hightlight error inputs
                    $(element).closest('.form-group').addClass('has-error'); // set error class to the control group
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
						success1.show();
						error1.hide();
						form[0].submit(); // submit the form
					}
                    
                }
            });
		
//--	 END OF VALIDATION
	<?php if($process_status=="New"){ ?> <?php } ?>
    $('.addrow').die().live("click",function() { 
		add_row();
    });
	
	
	<?php if($process_status=="New"){ ?> 
	
	<?php }else{ ?>calculate_total(); 
		var alias=$('select[name="company_id"] option:selected').attr("alias");
		$('input[name="so1"]').val(alias);
	<?php } ?>
	
	
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
					$(this).find("td:nth-child(2) select").attr("name","sales_order_rows["+i+"][item_id]");
					$(this).find("td:nth-child(3) input").attr("name","sales_order_rows["+i+"][quantity]");
					$(this).find("td:nth-child(4) input").attr("name","sales_order_rows["+i+"][rate]");
					$(this).find("td:nth-child(5) input").attr("name","sales_order_rows["+i+"][amount]");
					$(this).find("td:nth-child(6) select").attr("name","sales_order_rows["+i+"][excise_duty]");
					$(this).find("td:nth-child(7) select").attr("name","sales_order_rows["+i+"][so_sale_tax]");
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
			$(this).find("td:nth-child(2) select").attr("name","sales_order_rows["+i+"][item_id]").select2();
			$(this).find("td:nth-child(3) input").attr("name","sales_order_rows["+i+"][quantity]");
			$(this).find("td:nth-child(4) input").attr("name","sales_order_rows["+i+"][rate]");
			$(this).find("td:nth-child(5) input").attr("name","sales_order_rows["+i+"][amount]");
			$(this).find("td:nth-child(6) select").attr("name","sales_order_rows["+i+"][excise_duty]");
			$(this).find("td:nth-child(7) select").attr("name","sales_order_rows["+i+"][so_sale_tax]");
		});
		var i=0;
		
		$("#main_tb tbody tr.tr2").each(function(){
			i++;
			$(this).find("td:nth-child(1) textarea").attr("name","sales_order_rows["+i+"][description]");
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
	
	$('#main_tb input,#tbl2 input').die().live("keyup","blur",function() { 
		calculate_total();
    });
	$('#main_tb select').die().live("change",function() {
		calculate_total();
    });
	
	function calculate_total(){
		var total=0; var grand_total=0;
		$("#main_tb tbody tr.tr1").each(function(){
			var qty=$(this).find("td:nth-child(3) input").val();
			var Rate=$(this).find("td:nth-child(4) input").val();
			var Amount=qty*Rate;
			$(this).find("td:nth-child(5) input").val(Amount.toFixed(2));
			total=total+Amount;
		});
		
		$('input[name="total"]').val(total.toFixed(2));
		var exceise_duty=parseFloat($('input[name="exceise_duty"]').val());
		if(isNaN(exceise_duty)) { var exceise_duty = 0; }
		var pnf=parseFloat($('input[name="pnf"]').val());
		if(isNaN(pnf)) { var pnf = 0; }
		var sale_tax=parseFloat($('input[name="sale_tax"]').val());
		if(isNaN(sale_tax)) { var sale_tax = 0; }
		var fright_amount=parseFloat($('input[name="fright_amount"]').val());
		if(isNaN(fright_amount)) { var fright_amount = 0; }
		grand_total=total+exceise_duty+pnf+sale_tax+fright_amount;
		$('input[name="grand_total"]').val(grand_total.toFixed(2));
	}
	
	
	$('select[name="customer_id"]').on("change",function() {
		var customer_id=$('select[name="customer_id"] option:selected').val();
		var url="<?php echo $this->Url->build(['controller'=>'Customers','action'=>'defaultAddress']); ?>";
		url=url+'/'+customer_id,
		$.ajax({
			url: url,
		}).done(function(response) {
			$('textarea[name="customer_address"]').val(response);
		});
		
		
		$("#so3_div").html('Loading...');
		var url="<?php echo $this->Url->build(['controller'=>'Filenames','action'=>'listFilename']); ?>";
		url=url+'/'+customer_id+'/so',
		$.ajax({
			url: url,
		}).done(function(response) {
			$("#so3_div").html(response);
			$('select[name="qt3"]').attr('name','so3');
		});
		
    });
	
	<?php if($process_status!="New"){ ?> 
		var customer_id=$('select[name="customer_id"] option:selected').val();
		
		$("#so3_div").html('Loading...');
		var url="<?php echo $this->Url->build(['controller'=>'Filenames','action'=>'listFilename']); ?>";
		url=url+'/'+customer_id+'/so',
		$.ajax({
			url: url,
		}).done(function(response) {
			$("#so3_div").html(response);
			$('select[name="qt3"]').attr('name','so3');
		});
	<?php } ?>
	
	$('select[name="company_id"]').on("change",function() {
		var alias=$('select[name="company_id"] option:selected').attr("alias");
		$('input[name="so1"]').val(alias);
    });
	
	
	$('form').on('keyup keypress', function(e) {
	  var keyCode = e.keyCode || e.which;
	  if (keyCode === 13) { 
		e.preventDefault();
		return false;
	  }
	});
});
</script>
	 
