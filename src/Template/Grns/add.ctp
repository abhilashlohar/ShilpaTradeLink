
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
						<th width="50">Sr.No. </th>
						<th>Items</th>
						<th width="130">Quantity</th>
						<th width="130"></th>
						<th width="130"></th>
						<th width="70"></th>
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
								<label><?php echo $this->Form->input('check.'.$q, ['label' => false,'type'=>'checkbox','class'=>'rename_check','value' => @$sales_order_rows->id]); ?></label>
								
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
			<td><?php echo $this->Form->input('rate[]', ['type' => 'text','label' => false,'class' => 'form-control input-sm','placeholder' => 'Rate','step'=>0.01]); ?></td>
			<td><?php echo $this->Form->input('amount[]', ['type' => 'text','label' => false,'class' => 'form-control input-sm','placeholder' => 'Amount','step'=>0.01]); ?></td>
			<td><a class="btn btn-xs btn-default addrow" href="#" role='button'><i class="fa fa-plus"></i></a><a class="btn btn-xs btn-default deleterow" href="#" role='button'><i class="fa fa-times"></i></a></td>
		</tr>
		<tr class="tr2">
			<td colspan="4"><?php echo $this->Form->textarea('description', ['label' => false,'class' => 'form-control input-sm autoExpand','placeholder' => 'Description','rows'=>'1']); ?></td>
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
		},
		
	});\
	
	
	
	
	
	
	<?php if($process_status=="New"){ ?> add_row(); 
	$("#main_tb tbody tr.tr1").each(function(){
		var description=$(this).find("td:nth-child(7) select option:selected").attr("description");
		$(this).closest("td").find('input').val(description);
	});
	<?php } ?>
    $('.addrow').die().live("click",function() { 
		add_row();
    });
	
	$('.change_des').die().live("change",function() { 
		var description=$(this).find('option:selected').attr("description");
		$(this).closest("td").find('input').val(description);
    });
	$("#main_tb tbody tr.tr1").each(function(){
		var description=$(this).find("td:nth-child(7) select option:selected").attr("description");
		$(this).find("td:nth-child(7) input").val(description);
	});
	
	<?php if($process_status=="New"){ ?> 
	var terms_conditions=$("#terms_conditions").text();
	$('textarea[name="terms_conditions"]').val(terms_conditions);
	<?php }else{ ?>calculate_total(); 
		var alias=$('select[name="company_id"] option:selected').attr("alias");
		$('input[name="so1"]').val(alias);
	<?php } ?>
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
					$(this).find("td:nth-child(2) select").attr("name","grn_rows["+i+"][item_id]");
					$(this).find("td:nth-child(3) input").attr("name","grn_rows["+i+"][quantity]");

				});
				var i=0;
				$("#main_tb tbody tr.tr2").each(function(){
					i++;
					$(this).find("td:nth-child(1) textarea").attr("name","grn_rows["+i+"][description]");
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
			$(this).find("td:nth-child(2) select").attr("name","grn_rows["+i+"][item_id]").select2();
			$(this).find("td:nth-child(3) input").attr("name","grn_rows["+i+"][quantity]");
			
		});
		var i=0;
		
		$("#main_tb tbody tr.tr2").each(function(){
			i++;
			$(this).find("td:nth-child(1) textarea").attr("name","grn_rows["+i+"][description]");
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
