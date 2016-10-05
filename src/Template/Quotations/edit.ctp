<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption">
			<i class="icon-globe font-blue-steel"></i>
			<span class="caption-subject font-blue-steel uppercase">Edit Quotation: </span><?= h($quotation->ref_no) ?>
		</div>
	</div>
	<div class="portlet-body form">
		<?= $this->Form->create($quotation) ?>
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
							echo $this->Form->input('company_id',['options' => $options,'empty' => "--Select Company--",'label' => false,'class' => 'form-control input-sm']); ?>
						</div>
					</div>
				</div>
			</div><br/>
			<div class="row">
				<div class="col-md-6">
					<div class="form-group">
						<label class="col-md-3 control-label">Qutote Ref. No.</label>
						<div class="col-md-3">
							<?php 
							$ref_no=explode('/',$quotation->ref_no);
							echo $this->Form->input('alias', ['label' => false,'value' => $ref_no[0],'class' => 'form-control input-sm','readonly']); ?>
						</div>
						<div class="col-md-3">
							<?php echo $this->Form->input('ref', ['label' => false,'value' => $ref_no[1],'class' => 'form-control input-sm']); ?>
						</div>
						<div class="col-md-3">
							<?php echo $this->Form->input('yr', ['label' => false,'value'=>'16-17','class' => 'form-control input-sm','readonly']); ?>
						</div>
					</div>
				</div>
				<div class="col-md-6" align="right">
					<div class="form-group">
						<label class="col-md-8 control-label">Date</label>
						<div class="col-md-4">
							<?php echo $this->Form->input('date', ['type' => 'text','label' => false,'class' => 'form-control input-sm date-picker','value' => date("d-m-Y"),'data-date-format' => 'dd-mm-yyyy']); ?>
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
							<?php echo $this->Form->input('customer_id', ['empty' => "--Select--",'label' => false,'options' => $customers,'class' => 'form-control input-sm select2me ']); ?>
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
							<?php echo $this->Form->input('product', ['label' => false,'class' => 'form-control input-sm','placeholder' => 'Product']); ?>
						</div>
					</div>
					<br/>
					<div class="form-group">
						<label class="col-md-4 control-label">Finalisation Date</label>
						<div class="col-md-8">
							<?php echo $this->Form->input('finalisation_date', ['type' => 'text','label' => false,'class' => 'form-control input-sm date-picker','data-date-format' => 'dd-mm-yyyy','placeholder' => 'Finalisation Date']); ?>
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
							<?php echo $this->Form->input('customer_for_attention', ['label' => false,'class' => 'form-control']); ?>
						</div>
					</div>
					<br/><br/>
					<div class="form-group">
						<label class="col-md-3 control-label">Reference: Your Enquiry No.</label>
						<div class="col-md-9">
							<?php echo $this->Form->input('enquiry_no', ['label' => false,'class' => 'form-control']); ?>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label class="col-md-3 control-label">Contact No</label>
						<div class="col-md-9">
							<?php echo $this->Form->input('customer_contact', ['label' => false,'class' => 'form-control']); ?>
						</div>
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-1 control-label">Subject</label>
				<div class="col-md-11">
					<?php echo $this->Form->input('subject', ['label' => false,'class' => 'form-control']); ?>
				</div>
			</div>
			<br/><br/>
			<div class="form-group">
				<label class="col-md-1 control-label">Dear Sir</label>
				<div class="col-md-11">
					<?php echo $this->Form->input('text', ['label' => false,'class' => 'form-control','value' => 'With reference to above enquiry we are pleased to submit our quote as follows :-']); ?>
				</div>
			</div>
			
			<table class="table table-condensed tableitm" id="main_tb">
				<thead>
					<tr>
						<th>Sr.No. </th>
						<th>Items</th>
						<th>Item Description</th>
						<th>Unit</th>
						<th>Rate</th>
						<th>Amount</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<?php $q=0; foreach ($quotation->quotation_rows as $quotation_row): ?>
						<tr>
							<td><?php echo ++$q; --$q; ?><?php echo $this->Form->input('quotation_rows.'.$q.'.id'); ?></td>
							<td><?php echo $this->Form->input('quotation_rows.'.$q.'.item', ['label' => false,'class' => 'form-control input-sm','placeholder'=>'Item']); ?></td>
							<td><?php echo $this->Form->input('quotation_rows.'.$q.'.description', ['label' => false,'class' => 'form-control input-sm','placeholder'=>'Description']); ?></td>
							<td><?php echo $this->Form->input('quotation_rows.'.$q.'.unit', ['label' => false,'class' => 'form-control input-sm','placeholder'=>'Unit']); ?></td>
							<td><?php echo $this->Form->input('quotation_rows.'.$q.'.rate', ['label' => false,'class' => 'form-control input-sm','placeholder'=>'Rate']); ?></td>
							<td><?php echo $this->Form->input('quotation_rows.'.$q.'.amount', ['label' => false,'class' => 'form-control input-sm','placeholder'=>'Amount']); ?></td>
							<td><a class="btn btn-xs btn-default addrow" href="#" role='button'><i class="fa fa-plus"></i></a><a class="btn btn-xs btn-default deleterow" href="#" role='button'><i class="fa fa-times"></i></a></td>
						</tr>
					<?php $q++; endforeach; ?>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="5" align="right"><b>Total</b></td>
						<td><?php echo $this->Form->input('total', ['type' => 'text','label' => false,'class' => 'form-control input-sm','placeholder' => 'Total']); ?></td>
						<td></td>
					</tr>
					<tr>
						<td colspan="5" align="right"><b>Service Tax</b></td>
						<td><?php echo $this->Form->input('tax', ['type' => 'text','value' => '0','label' => false,'class' => 'form-control input-sm','placeholder' => 'Service Tax']); ?></td>
						<td></td>
					</tr>
					<tr>
						<td colspan="5" align="right"><b>Grand Total</b></td>
						<td><?php echo $this->Form->input('grand_total', ['type' => 'text','label' => false,'class' => 'form-control input-sm','placeholder' => 'Grand Total']); ?></td>
						<td></td>
					</tr>
				</tfoot>
			</table>
			
			<div><b>Commercial Terms & Conditions:</b></div>
			<?php echo $this->Form->input('terms_conditions', ['label' => false,'class' => 'form-control wysihtml5']); ?>
			<div><b>I hope above is to your requirement and in case of any clarification kindly revert back.</b></div>
			<br/>
			<div>
			Regards<br/>
			Salesman Name, Contact, Email
			</div>
		</div>
		<div class="form-actions">
			<div class="row">
				<div class="col-md-offset-3 col-md-9">
					<button type="submit" class="btn red">GENERATE QUOTATION</button>
				</div>
			</div>
		</div>
		
		<?= $this->Form->end() ?>
	</div>
</div>
<style>
table.table1 td {
    padding: 8px;
}
input.brd_btm{
	border: none;border-bottom: solid 1px #CCC;height: 25px;
}
table.tableitm th{
    background-color: #1f4566;color:#FFF;border: solid 1px #FFF;
}
table.tableitm td{
   border: solid 1px #CCC;
}
</style>


<table id="sample_tb" style="display:none;">
	<tbody>
		<tr>
			<td>0</td>
			<td><?php echo $this->Form->input('item[]', ['type' => 'text','label' => false,'class' => 'form-control input-sm','placeholder' => 'Item']); ?></td>
			<td><?php echo $this->Form->input('description[]', ['type' => 'text','label' => false,'class' => 'form-control input-sm','placeholder' => 'Description']); ?></td>
			<td><?php echo $this->Form->input('unit[]', ['type' => 'number','label' => false,'class' => 'form-control input-sm','placeholder' => 'Unit']); ?></td>
			<td><?php echo $this->Form->input('rate[]', ['type' => 'number','label' => false,'class' => 'form-control input-sm','placeholder' => 'Rate']); ?></td>
			<td><?php echo $this->Form->input('amount[]', ['type' => 'number','label' => false,'class' => 'form-control input-sm','placeholder' => 'Amount']); ?></td>
			<td><a class="btn btn-xs btn-default addrow" href="#" role='button'><i class="fa fa-plus"></i></a><a class="btn btn-xs btn-default deleterow" href="#" role='button'><i class="fa fa-times"></i></a></td>
		</tr>
	</tbody>
</table>

<div id="terms_conditions" style="display:none;">1. Price Basis
2. P&F 
3. Sales Tax
4.Please pay bills on time. Thank You
</div>
<?php echo $this->Html->script('/assets/global/plugins/jquery.min.js'); ?>
<script>
$(document).ready(function() {
    $('.addrow').die().live("click",function() { 
		add_row();
    });
	
	var terms_conditions=$("#terms_conditions").text();
	$('textarea[name="terms_conditions"]').val(terms_conditions);
	
	$('.deleterow').die().live("click",function() {
		var l=$(this).closest("table tbody").find("tr").length;
		if (confirm("Are you sure to remove row ?") == true) {
			if(l>1){
				$(this).closest("tr").remove();
				var i=0;
				$("#main_tb tbody tr").each(function(){
					i++;
					$(this).find("td:nth-child(1)").html(i);
					$(this).find("td:nth-child(2) input").attr("name","quotation_rows["+i+"][item]");
					$(this).find("td:nth-child(3) input").attr("name","quotation_rows["+i+"][description]");
					$(this).find("td:nth-child(4) input").attr("name","quotation_rows["+i+"][unit]");
					$(this).find("td:nth-child(5) input").attr("name","quotation_rows["+i+"][rate]");
					$(this).find("td:nth-child(6) input").attr("name","quotation_rows["+i+"][amount]");
				});
				calculate_total();
			}
		} 
    });
	
	function add_row(){
		var tr=$("#sample_tb tbody tr").clone();
		$("#main_tb tbody").append(tr);
		var i=0;
		$("#main_tb tbody tr").each(function(){
			i++;
			$(this).find("td:nth-child(1)").html(i);
			$(this).find("td:nth-child(2) input").attr("name","quotation_rows["+i+"][item]");
			$(this).find("td:nth-child(3) input").attr("name","quotation_rows["+i+"][description]");
			$(this).find("td:nth-child(4) input").attr("name","quotation_rows["+i+"][unit]");
			$(this).find("td:nth-child(5) input").attr("name","quotation_rows["+i+"][rate]");
			$(this).find("td:nth-child(6) input").attr("name","quotation_rows["+i+"][amount]");
		});
	}
	
	$('#main_tb input').die().live("keyup","blur",function() { 
		calculate_total();
    });
	function calculate_total(){
		var total=0;
		$("#main_tb tbody tr").each(function(){
			var unit=$(this).find("td:nth-child(4) input").val();
			var Rate=$(this).find("td:nth-child(5) input").val();
			var Amount=unit*Rate;
			$(this).find("td:nth-child(6) input").val(Amount);
			total=total+Amount;
		});
		$('input[name="total"]').val(total);
		var tax=parseFloat($('input[name="tax"]').val());
		var grand_total=total+tax;
		$('input[name="grand_total"]').val(grand_total);
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
		var name=$('select[name="customer_id"] option:selected').text();
		$('input[name="customer_for_attention"]').val(name);
    });
	
	$('select[name="company_id"]').on("change",function() {
		var alias=$('select[name="company_id"] option:selected').attr("alias");
		$('input[name="alias"]').val(alias);
    });
	
});
</script>
	 
<div id="myModal1" class="modal fade in" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1" aria-hidden="false" style="display: none; padding-right: 12px;"><div class="modal-backdrop fade in" ></div>
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