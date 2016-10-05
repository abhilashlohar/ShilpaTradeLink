<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption">
			<i class="icon-globe font-blue-steel"></i>
			<span class="caption-subject font-blue-steel uppercase">EDIT CUSTOMER</span>
		</div>
	</div>
	<div class="portlet-body form">
		<!-- BEGIN FORM-->
		 <?= $this->Form->create($customer,array("class"=>"form-horizontal")) ?>
			<div class="form-body">
				<div class="row">
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">Customer Name <span class="required" aria-required="true">*</span></label>
							<?php echo $this->Form->input('customer_name', ['label' => false,'class' => 'form-control input-sm','placeholder'=>'Customer Name']); ?>
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">District <span class="required" aria-required="true">*</span></label>
							<?php echo $this->Form->input('district_id', ['options' => $districts,'label' => false,'class' => 'form-control input-sm']); ?>
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">Company Group <span class="required" aria-required="true">*</span></label>
							<?php echo $this->Form->input('company_group_id', ['options' => $companyGroups,'label' => false,'class' => 'form-control input-sm','placeholder'=>'Company Group']); ?>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">Customer Seg <span class="required" aria-required="true">*</span></label>
							<?php echo $this->Form->input('customer_seg_id', ['options' => $customerSegs,'label' => false,'class' => 'form-control input-sm','placeholder'=>'Customer Seg']); ?>
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">Tin No <span class="required" aria-required="true">*</span></label>
							<?php echo $this->Form->input('tin_no', ['label' => false,'class' => 'form-control input-sm','placeholder'=>'Tin No']); ?>
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">Gst No <span class="required" aria-required="true">*</span></label>
							<?php echo $this->Form->input('gst_no', ['label' => false,'class' => 'form-control input-sm','placeholder'=>'Gst No']); ?>
						</div>
					</div>
				</div>
			
				<div class="row">
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">Pan No <span class="required" aria-required="true">*</span></label>
							<?php echo $this->Form->input('pan_no', ['label' => false,'class' => 'form-control input-sm','placeholder'=>'Pan No']); ?>
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">Ecc No <span class="required" aria-required="true">*</span></label>
							<?php echo $this->Form->input('ecc_no', ['label' => false,'class' => 'form-control input-sm','placeholder'=>'Ecc No']); ?>
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">Salesman <span class="required" aria-required="true">*</span></label>
							<?php echo $this->Form->input('employee_id', ['options'=>$employees,'label' => false,'class' => 'form-control input-sm']); ?>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">Payment Terms<span class="required" aria-required="true">*</span></label>
							<?php echo $this->Form->input('payment_terms', ['label' => false,'class' => 'form-control input-sm','placeholder'=>'Payment Terms']); ?>
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">Mode of Payment<span class="required" aria-required="true">*</span></label>
							<div class="radio-list">
								<div class="radio-inline">
								<?php echo $this->Form->radio(
									'mode_of_payment',
									[
										['value' => 'Cheque', 'text' => 'Cheque'],
										['value' => 'NEFT', 'text' => 'NEFT'],
										['value' => 'Cash', 'text' => 'Cash']
									]
								); ?>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">Transporter<span class="required" aria-required="true">*</span></label>
							<?php echo $this->Form->input('transporter_id', ['options'=>$transporters,'label' => false,'class' => 'form-control input-sm','placeholder'=>'Transporter ']); ?>
						</div>
					</div>
				</div>
				
				<h4 style="font-size:13px'">Customer's Contacts</h4>
				<table class="table table-condensed tableitm" id="main_tb">
					<thead>
						<tr>
							<th><label>Sr.No.</label></th>
							<th><label>Telephone</label></th>
							<th><label>Mobile</label></th>
							<th><label>Rank</label></th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<?php $q=0; foreach ($customer->customer_contacts as $customer_contact): ?>
						<tr>
							<td><?php echo ++$q; --$q; ?><?php echo $this->Form->input('customer_contacts.'.$q.'.id'); ?></td>
							<td><?php echo $this->Form->input('customer_contacts.'.$q.'.telephone', ['label' => false,'class' => 'form-control input-sm','placeholder'=>'Telephone']); ?></td>
							<td><?php echo $this->Form->input('customer_contacts.'.$q.'.mobile', ['label' => false,'class' => 'form-control input-sm','placeholder'=>'Mobile']); ?></td>
							<td><?php echo $this->Form->input('customer_contacts.'.$q.'.rank', ['label' => false,'class' => 'form-control input-sm','placeholder'=>'Rank']); ?></td>
							<td><a class="btn btn-xs btn-default addrow" href="#" role='button'><i class="fa fa-plus"></i></a><a class="btn btn-xs btn-default deleterow" href="#" role='button'><i class="fa fa-times"></i></a></td>
						</tr>
						<?php $q++; endforeach; ?>
					</tbody>
				</table>
				
				<h4 style="font-size:13px'">Customer's Address</h4>
				<table class="table table-condensed tableitm" id="main_tb2">
					<thead>
						<tr>
							<th><label>Sr.No.</label></th>
							<th><label>Address</label></th>
							<th><label>District</label></th>
							<th><label>Pin Code</label></th>
							<th><label>Courier Charge</label></th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<?php $q=0; foreach ($customer->customer_address as $customer_addres): ?>
						<tr>
							<td><?php echo ++$q; --$q; ?><?php echo $this->Form->input('customer_address.'.$q.'.id'); ?></td>
							<td><?php echo $this->Form->input('customer_address.'.$q.'.address', ['label' => false,'type' => 'textarea','rows' => '2','style' => ['resize:none'],'class' => 'form-control input-sm','placeholder'=>'Telephone']); ?></td>
							<td><?php echo $this->Form->input('customer_address.'.$q.'.district_id', ['label' => false,'class' => 'form-control input-sm','placeholder'=>'Mobile']); ?></td>
							<td><?php echo $this->Form->input('customer_address.'.$q.'.pin_code', ['label' => false,'class' => 'form-control input-sm','placeholder'=>'Rank']); ?></td>
							<td><?php echo $this->Form->input('customer_address.'.$q.'.courier_charge', ['label' => false,'class' => 'form-control input-sm','placeholder'=>'Rank']); ?></td>
							<td><a class="btn btn-xs btn-default addrow2" href="#" role='button'><i class="fa fa-plus"></i></a><a class="btn btn-xs btn-default deleterow2" href="#" role='button'><i class="fa fa-times"></i></a></td>
						</tr>
						<?php $q++; endforeach; ?>
					</tbody>
				</table>
			
			<div class="form-actions">
				<div class="row">
					<div class="col-md-offset-3 col-md-9">
						<button type="submit" class="btn btn-primary">UPDATE CUSTOMER SEGMENT</button>
					</div>
				</div>
			</div>
		<?= $this->Form->end() ?>
		<!-- END FORM-->
	</div>
</div>
<?php echo $this->Html->script('/assets/global/plugins/jquery.min.js'); ?>
<script>
$(document).ready(function() {
    $('.addrow').die().live("click",function() { 
		add_row();
    });
	
	$('.deleterow').die().live("click",function() {
		var l=$(this).closest("table tbody").find("tr").length;
		if (confirm("Are you sure to remove row ?") == true) {
			if(l>1){
				$(this).closest("tr").remove();
				var i=0;
				$("#main_tb tbody tr").each(function(){
					
					$(this).find("td:nth-child(1)").html(++i); --i;
					$(this).find("td:nth-child(2) input").attr("name","customer_contacts["+i+"][telephone]");
					$(this).find("td:nth-child(3) input").attr("name","customer_contacts["+i+"][mobile]");
					$(this).find("td:nth-child(4) input").attr("name","customer_contacts["+i+"][rank]");
					i++;
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
			
			$(this).find("td:nth-child(1)").html(++i); --i;
			$(this).find("td:nth-child(2) input").attr("name","customer_contacts["+i+"][telephone]");
			$(this).find("td:nth-child(3) input").attr("name","customer_contacts["+i+"][mobile]");
			$(this).find("td:nth-child(4) input").attr("name","customer_contacts["+i+"][rank]");
			i++;
		});
	}
	
	
	
	
    $('.addrow2').die().live("click",function() { 
		add_row2();
    });
	
	$('.deleterow2').die().live("click",function() {
		var l=$(this).closest("table tbody").find("tr").length;
		if (confirm("Are you sure to remove row ?") == true) {
			if(l>1){
				$(this).closest("tr").remove();
				var i=0;
				$("#main_tb2 tbody tr").each(function(){
					
					$(this).find("td:nth-child(1)").html(++i); --i;
					$(this).find("td:nth-child(2) textarea").attr("name","customer_address["+i+"][address]");
					$(this).find("td:nth-child(3) select").attr("name","customer_address["+i+"][district_id]");
					$(this).find("td:nth-child(4) input").attr("name","customer_address["+i+"][pin_code]");
					$(this).find("td:nth-child(5) input").attr("name","customer_address["+i+"][courier_charge]");
					i++;
				});
				calculate_total();
			}
		} 
    });
	
	function add_row2(){
		
		var tr=$("#sample_tb2 tbody tr").clone();
		$("#main_tb2 tbody").append(tr);
		var i=0;
		$("#main_tb2 tbody tr").each(function(){
			
			$(this).find("td:nth-child(1)").html(++i); --i;
			$(this).find("td:nth-child(2) textarea").attr("name","customer_address["+i+"][address]");
			$(this).find("td:nth-child(3) select").attr("name","customer_address["+i+"][district_id]");
			$(this).find("td:nth-child(4) input").attr("name","customer_address["+i+"][pin_code]");
			$(this).find("td:nth-child(5) input").attr("name","customer_address["+i+"][courier_charge]");
			i++;
		});
	}
	
});
</script>

<table id="sample_tb" style="display:none;">
	<tbody>
		<tr>
			<td>0</td>
			<td><?php echo $this->Form->input('telephone', ['type' => 'text','label' => false,'class' => 'form-control input-sm','placeholder' => 'Telephone']); ?></td>
			<td><?php echo $this->Form->input('mobile', ['type' => 'text','label' => false,'class' => 'form-control input-sm','placeholder' => 'Mobile']); ?></td>
			<td><?php echo $this->Form->input('rank', ['type' => 'number','label' => false,'class' => 'form-control input-sm','placeholder' => 'Rank']); ?></td>
			<td><a class="btn btn-xs btn-default addrow" href="#" role='button'><i class="fa fa-plus"></i></a><a class="btn btn-xs btn-default deleterow" href="#" role='button'><i class="fa fa-times"></i></a></td>
		</tr>
	</tbody>
</table>

<table id="sample_tb2" style="display:none;">
	<tbody>
		<tr>
			<td>0</td>
			<td><?php echo $this->Form->input('address', ['label' => false,'type' => 'textarea','rows' => '2','style' => ['resize:none'],'class' => 'form-control input-sm','placeholder' => 'Address']); ?></td>
			<td><?php echo $this->Form->input('district_id', ['options' => $districts,'label' => false,'class' => 'form-control input-sm']); ?></td>
			<td><?php echo $this->Form->input('pin_code', ['type' => 'number','label' => false,'class' => 'form-control input-sm','placeholder' => 'Pin Code']); ?></td>
			<td><?php echo $this->Form->input('courier_charge', ['type' => 'number','label' => false,'class' => 'form-control input-sm','placeholder' => 'Courier Charge']); ?></td>
			<td><a class="btn btn-xs btn-default addrow2" href="#" role='button'><i class="fa fa-plus"></i></a><a class="btn btn-xs btn-default deleterow2" href="#" role='button'><i class="fa fa-times"></i></a></td>
		</tr>
	</tbody>
</table>