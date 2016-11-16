
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
	
	<div class="portlet-body form">
		<?= $this->Form->create($grn ,['id'=>'form_sample_3']) ?>
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
							<td><?php echo $this->Form->input('q', ['options' => $items,'label' => false,'class' => 'form-control input-sm','placeholder'=>'Item','value' => @$purchase_order_rows->item->id,'readonly']); ?></td>

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
			<td colspan="4"><?php echo $this->Form->textarea('descryption', ['label' => false,'class' => 'form-control input-sm autoExpand','placeholder' => 'Description','rows'=>'1']); ?></td>
			<td></td>
		</tr>
	</tbody>
</table>

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
		
			
			success1.show();
			error1.hide();
			form[0].submit(); // submit the form
		}

	});
	
	$('.rename_check').die().live("click",function() {
		rename_rows(); calculate_total();
    });
	
	function rename_rows(){
		$("#main_tb tbody tr.tr1").each(function(){
			var row_no=$(this).attr('row_no');
			var val=$(this).find('td:nth-child(4) input[type="checkbox"]:checked').val();
			if(val){
			}
			
		});
	}
});		

</script>

	 


