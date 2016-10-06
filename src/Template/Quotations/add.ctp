<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption">
			<i class="icon-globe font-blue-steel"></i>
			<span class="caption-subject font-blue-steel uppercase">Generate Quotation</span>
		</div>
	</div>
	<div class="portlet-body form">
		<?= $this->Form->create($quotation,['id'=>'quotation_entry']) ?>
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
							echo $this->Form->input('company_id',['options' => $options,'empty' => "--Select Company--",'label' => false,'class' => 'form-control input-sm select2me']); ?>
						</div>
					</div>
				</div>
				<div class="col-md-6" align="right">
					<div class="form-group">
						<label class="col-md-8 control-label">Date</label>
						<div class="col-md-4">
							<?php echo $this->Form->input('date', ['type' => 'text','label' => false,'class' => 'form-control input-sm','value' => date("d-m-Y"),'readonly']); ?>
						</div>
					</div>
				</div>
			</div>
			<br/>
			<div class="row">
				<div class="col-md-6">
					<div class="form-group">
						<label class="col-md-3 control-label">Customer</label>
						<div class="col-md-9">
							<?php 
							$options=array();
							foreach($customers as $customer){
								$options[]=['text' => $customer->customer_name, 'value' => $customer->id, 'contact_person' => $customer->contact_person];
							}
							echo $this->Form->input('customer_id', ['empty' => "--Select Customer--",'label' => false,'options' => $options,'class' => 'form-control input-sm select2me ']); ?>
						</div>
					</div>
					<br/>
					<div class="form-group">
						<label class="col-md-3 control-label">Address</label>
						<div class="col-md-9">
							<?php echo $this->Form->input('customer_address', ['label' => false,'class' => 'form-control','placeholder' => 'Address']); ?>
							<a href="#" role="button" class="pull-right select_address" >
							Select Address </a>
						</div>
					</div>
					
				</div>
				<div class="col-md-6" align="right">
					<div class="form-group">
						<label class="col-md-4 control-label">Salesman</label>
						<div class="col-md-8">
							<?php echo $this->Form->input('employee_id', ['options'=>$employees,'label' => false,'class' => 'form-control input-sm']); ?>
						</div>
					</div>
					<br/>
					<div class="form-group">
						<label class="col-md-4 control-label">Product</label>
						<div class="col-md-8">
							<?php echo $this->Form->input('category_id', ['options' => $Categories,'label' => false,'class' => 'form-control input-sm']); ?>
						</div>
					</div>
					<br/>
					<div class="form-group">
						<label class="col-md-4 control-label">Finalisation Date</label>
						<div class="col-md-8">
							<?php echo $this->Form->input('finalisation_date', ['type' => 'text','label' => false,'class' => 'form-control input-sm date-picker','data-date-format' => 'dd-mm-yyyy','data-date-start-date' => '+0d','data-date-end-date' => '+60d','placeholder' => 'Finalisation Date']); ?>
						</div>
					</div>
					<br/>
					<div class="form-group">
						<label class="col-md-4 control-label">Qutote Ref. No.</label>
						<div class="col-md-2">
							<?php echo $this->Form->input('qt1', ['label' => false,'class' => 'form-control input-sm','readonly']); ?>
						</div>
						<div class="col-md-3" id="qt3_div">
							<?php echo $this->Form->input('qt3', ['label' => false,'class' => 'form-control input-sm']); ?>
						</div>
						<div class="col-md-3">
							<?php echo $this->Form->input('qt4', ['label' => false,'value'=>'16-17','class' => 'form-control input-sm','readonly']); ?>
						</div>
					</div>
				
				</div>
			</div>
			<br/>
			<div class="row">
				<div class="col-md-6">
					<div class="form-group">
						<label class="col-md-3 control-label">Kind attention</label>
						<div class="col-md-9">
							<?php echo $this->Form->input('customer_for_attention', ['label' => false,'class' => 'form-control input-sm']); ?>
						</div>
					</div>
					<br/><br/>
					<div class="form-group">
						<label class="col-md-3 control-label">Reference</label>
						<div class="col-md-9">
							<?php echo $this->Form->input('enquiry_no', ['label' => false,'class' => 'form-control input-sm']); ?>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label class="col-md-3 control-label">Contact No</label>
						<div class="col-md-9">
							<?php echo $this->Form->input('customer_contact', ['label' => false,'class' => 'form-control input-sm']); ?>
						</div>
					</div>
				</div>
			</div>
			<br/>
			<div class="row">
				<div class="col-md-12">
					<div class="form-group">
						<label class="col-md-1 control-label">Subject</label>
						<div class="col-md-11">
							<?php echo $this->Form->input('subject', ['label' => false,'class' => 'form-control input-sm']); ?>
						</div>
					</div>
				</div>
			</div><br/>
			<div class="row">
				<div class="col-md-12">
					<div class="form-group">
						<label class="col-md-1 control-label">Dear Sir</label>
						<div class="col-md-11">
							<?php echo $this->Form->input('text', ['label' => false,'class' => 'form-control','value' => 'With reference to above enquiry we are pleased to submit our quote as follows :-']); ?>
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
						<td colspan="4" align="right"><b>Total</b></td>
						<td><?php echo $this->Form->input('total', ['type' => 'text','label' => false,'class' => 'form-control input-sm','placeholder' => 'Total']); ?></td>
						<td></td>
					</tr>
				</tfoot>
			</table>
			<label class="control-label">Additional Note (Optional): </label>
			<?php echo $this->Form->input('additional_note', ['label' => false,'class' => 'form-control wysihtml5']); ?>
			<br/>
			<div class="alert alert-danger" id="terms_conditions_error" style="display:none;">
				Select Commercial Terms & Conditions.
			</div>
			
			<label class="control-label">Commercial Terms & Conditions: </label> <a href="#" role="button" class="select_term_condition btn btn-xs btn-primary">Select </a> <a  role="button" class="btn btn-xs btn-primary updatetc" >Update </a>
			<?php echo $this->Form->input('terms_conditions', ['label'=>false,'class' => 'form-control','onmousehover'=>'copy_term_condition_to_textarea()']); ?>
			<br/>
			<ol id="sortable">
			  
			</ol>
		</div>
		<div class="form-actions">
			<div class="row">
				<div class="col-md-offset-3 col-md-9">
					<button type="submit" class="btn btn-primary" >GENERATE QUOTATION</button>
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
			<td rowspan="2" width="10">0</td>
			<td><?php echo $this->Form->input('item_id', ['options' => $items,'label' => false,'class' => 'form-control input-sm select2-offscreen','placeholder' => 'Item']); ?></td>
			<td width="100"><?php echo $this->Form->input('quantity[]', ['label' => false,'class' => 'form-control input-sm','placeholder' => 'Quantity']); ?></td>
			<td width="130"><?php echo $this->Form->input('rate[]', ['type' => 'text','label' => false,'class' => 'form-control input-sm','placeholder' => 'Rate']); ?></td>
			<td width="130"><?php echo $this->Form->input('amount[]', ['type' => 'text','label' => false,'class' => 'form-control input-sm','placeholder' => 'Amount']); ?></td>
			<td  width="70"><a class="btn btn-xs btn-default addrow" href="#" role='button'><i class="fa fa-plus"></i></a><a class="btn btn-xs btn-default deleterow" href="#" role='button'><i class="fa fa-times"></i></a></td>
		</tr>
		<tr class="tr2">
			<td colspan="4"><?php echo $this->Form->textarea('description', ['label' => false,'class' => 'form-control input-sm autoExpand','placeholder' => 'Description','rows'=>'1']); ?></td>
			<td></td>
		</tr>
	</tbody>
</table>

<div id="terms_conditions" style="display:none;"></div>
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
					customer_address : {
						  required: true,
                    },
					
					employee_id:{
						required: true
					},
					category_id:{
						required: true,
					},
					
					finalisation_date:{
						required: true,
					},
 					customer_for_attention : {
						  required: true,
                    },
					enquiry_no  : {
						  required: true,
                    },
					customer_contact: {
						  required: true,
                    },
					subject:{
						required: true,	
					},
					qt1:{
						required: true,	
					},
					qt3:{
						required: true,	
					},
					qt4:{
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
						$("#row_error").hide();
						success1.show();
						error1.hide();
						form[0].submit(); // submit the form
					}
                }
            });
		
//--	 END OF VALIDATION

	add_row();
    $('.addrow').die().live("click",function() { 
		add_row();
    });
	
	var terms_conditions=$("#terms_conditions").text();
	$('textarea[name="terms_conditions"]').val(terms_conditions);
	
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
					$(this).find("td:nth-child(2) select").attr("name","quotation_rows["+i+"][item_id]");
					$(this).find("td:nth-child(3) input").attr("name","quotation_rows["+i+"][quantity]");
					$(this).find("td:nth-child(4) input").attr("name","quotation_rows["+i+"][rate]");
					$(this).find("td:nth-child(5) input").attr("name","quotation_rows["+i+"][amount]");
				});
				var i=0;
				$("#main_tb tbody tr.tr2").each(function(){
					i++;
					$(this).find("td:nth-child(1) textarea").attr("name","quotation_rows["+i+"][description]");
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
			$(this).find("td:nth-child(2) select").attr("name","quotation_rows["+i+"][item_id]").select2();
			$(this).find("td:nth-child(3) input").attr("name","quotation_rows["+i+"][quantity]");
			$(this).find("td:nth-child(4) input").attr("name","quotation_rows["+i+"][rate]");
			$(this).find("td:nth-child(5) input").attr("name","quotation_rows["+i+"][amount]");
		});
		var i=0;
		
		$("#main_tb tbody tr.tr2").each(function(){
			i++;
			$(this).find("td:nth-child(1) textarea").attr("name","quotation_rows["+i+"][description]");
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
	
	$('#main_tb input').die().live("keyup","blur",function() { 
		calculate_total();
    });
	function calculate_total(){
		var total=0;
		$("#main_tb tbody tr.tr1").each(function(){
			var unit=$(this).find("td:nth-child(3) input").val();
			var Rate=$(this).find("td:nth-child(4) input").val();
			var Amount=unit*Rate;
			$(this).find("td:nth-child(5) input").val(Amount.toFixed(2));
			total=total+Amount;
		});
		$('input[name="total"]').val(total.toFixed(2));
	}
	
	$('.select_address').on("click",function() { 
		open_address();
    });
	
	$('.closebtn').on("click",function() { 
		$("#myModal1").hide();
    });
	
	
	
	function open_address(){
		var customer_id=$('select[name="customer_id"]').val();
		$("#result_ajax").html('<div align="center"><?php echo $this->Html->image('/img/wait.gif', ['alt' => 'wait']); ?> Loading</div>');
		var url="<?php echo $this->Url->build(['controller'=>'Customers','action'=>'addressList']); ?>";
		url=url+'/'+customer_id,
		$("#myModal1").show();
		$.ajax({
			url: url,
		}).done(function(response) {
			$("#result_ajax").html(response);
		});
	}
	
	$('.insert_address').die().live("click",function() { 
		var addr=$(this).text();
		$('textarea[name="customer_address"]').val(addr);
		$("#myModal1").hide();
    });
	
	$('select[name="customer_id"]').on("change",function() {
		var contact_person=$('select[name="customer_id"] option:selected').attr('contact_person');
		$('input[name="customer_for_attention"]').val(contact_person);
		
		var customer_id=$('select[name="customer_id"] option:selected').val();
		var url="<?php echo $this->Url->build(['controller'=>'Customers','action'=>'defaultAddress']); ?>";
		url=url+'/'+customer_id,
		$.ajax({
			url: url,
		}).done(function(response) {
			$('textarea[name="customer_address"]').val(response);
		});
		
		var url="<?php echo $this->Url->build(['controller'=>'Customers','action'=>'defaultContact']); ?>";
		url=url+'/'+customer_id,
		$.ajax({
			url: url,
			type: 'GET',
			dataType: 'json'
		}).done(function(response) {
			$('input[name="customer_for_attention"]').val(response.contact_person);
			$('input[name="customer_contact"]').val(response.mobile);
		});
		
		$("#qt3_div").html('Loading...');
		var url="<?php echo $this->Url->build(['controller'=>'Filenames','action'=>'listFilename']); ?>";
		url=url+'/'+customer_id,
		$.ajax({
			url: url,
		}).done(function(response) {
			$("#qt3_div").html(response);
		});
    });
	
	$('select[name="company_id"]').on("change",function() {
		var alias=$('select[name="company_id"] option:selected').attr("alias");
		$('input[name="qt1"]').val(alias);
    });
	
	$('.select_term_condition').die().live("click",function() { 
		var addr=$(this).text();
		$("#myModal2").show();
    });
	
	$('.closebtn2').on("click",function() { 
		$("#myModal2").hide();
    });
	
	$('.insert_tc').die().live("click",function() {
		$('#sortable').html("");
		
		$(".tabl_tc tbody tr").each(function(){
			var v=$(this).find('td:nth-child(1) input[type="checkbox"]:checked').val();
			if(v){
				var tc=$(this).find('td:nth-child(2)').text();
				$('#sortable').append('<li class="ui-state-default">'+tc+'</li>');
			}
		});
		var terms_conditions=$("#terms_conditions").text();
		$('textarea[name="terms_conditions"]').val(terms_conditions);
		$("#myModal2").hide();
    });
	
	function copy_term_condition_to_textarea(){
		$('#terms_conditions').html("");
		var inc=0;
		$("#sortable li").each(function(){
			var tc=$(this).text();
			++inc;
			$('#terms_conditions').append(inc+". "+tc+"&#13;&#10;");
		});
		var terms_conditions=$("#terms_conditions").text();
		$('textarea[name="terms_conditions"]').val(terms_conditions);
	}
	
	$(".updatetc").die().on("click",function(){
		copy_term_condition_to_textarea();
	})
	
	
});

</script>
	 
<div id="myModal1" class="modal fade in" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1" aria-hidden="false" style="display: none; padding-right: 12px;"><div class="modal-backdrop fade in" ></div>
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-body" id="result_ajax">
				
			</div>
			<div class="modal-footer">
				<button class="btn default closebtn">Close</button>
			</div>
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
