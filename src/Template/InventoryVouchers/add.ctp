<?php //pr($jobCards); exit; ?>
<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption">
			<i class="icon-globe font-blue-steel"></i>
			<span class="caption-subject font-blue-steel uppercase">Inventory Vouchers</span>
		</div>
		<div class="actions">
		<?php echo $this->Html->link('<i class="fa fa-files-o"></i> Pull Job-Card','/JobCards?inventory_voucher=true',array('escape'=>false,'class'=>'btn btn-xs blue')); ?>
		</div>
	</div>
	
	
	<div class="portlet-body form">
		<!-- BEGIN FORM-->
		 <?= $this->Form->create($inventoryVoucher,['id'=>'form_sample_3']) ?>
			<div class="form-body">

			<div class="row">
				<div class="col-md-4">
					<div class="form-group">
						<label class="col-md-5 control-label">Job Card No</label>
						<div class="col-md-7">
							
							<?= h($jobCards->jc1.'/'.str_pad($jobCards->jc2, 3, '0', STR_PAD_LEFT).'/'.$jobCards->jc3.'/'.$jobCards->jc4) ?>
							
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group">
						<label class="col-md-5 control-label">Invoice Voucher No. </label>
						<div class="col-md-7">
						<?php echo $this->Form->input('iv1', ['label' => false,'type'=>'hidden','value'=>$jobCards->jc1]); ?>
						<?php echo $this->Form->input('jc2', ['label' => false,'type'=>'hidden','value'=>$last_iv_no->iv2]); ?>
						<?php echo $this->Form->input('jc3', ['label' => false,'type'=>'hidden','value'=>$jobCards->jc3]); ?>
						<?php echo $this->Form->input('jc4', ['label' => false,'type'=>'hidden','value'=>$jobCards->jc]); ?>
						<?php echo $jobCards->jc1.'/IV-'.str_pad($last_iv_no->iv2, 3, '0', STR_PAD_LEFT).'/'.$jobCards->jc3.'/'.$jobCards->jc4; ?>
						</div>
					</div>
				</div>

			</div><br/>
		
				
				
				<table width="100%" id="main_tb" border="1">
					<thead>
						<th width="30%">In</th>
						<th>Out</th>
					</thead>
					
					<tbody id="maintbody"><?php $p=0; $q=0; $r=0; ?>
					<?php foreach ($jobCards->sales_order->sales_order_rows as $sales_order_row): ?>
						<tr class="main_tr">
							<td valign="top">
							<?php echo $this->Form->input('sales_order_id', ['type'=>'text','empty'=>'--Select--','class' => 'form-control input-sm','label'=>false,'value'=>$sales_order_row->id,'type'=>'hidden']); ?>
							<b><?= h($sales_order_row->item->name) ?></b>
							</td>
							
							<td>
								<?php  $page_no=$this->Paginator->current('SalesOrders'); $page_no=($page_no-1)*20; ?>	
								<div>
								<div class="form-group">
										<label class="col-md-3 control-label">Remarks </label>
										<?php   foreach($sales_order_row->job_card_rows as $job_card_row): ?>
										<div class="col-md-9">
											<?php echo $this->Form->textarea('job_card_rows['.$r.'][remark]', ['type' => 'text','label' => false,'class' => 'form-control input-sm','placeholder' => 'Remarks','value'=>$job_card_row->remark]); ?>
										</div><?php $r++; break; endforeach; ?>
								</div>
							<table>
								<thead>
									<th>Sr</th>
									<th width="70%">Item</th>
									<th>Quantity</th>
									<th width="10%"></th>
								</thead>
								<tbody>
									<?php  foreach($sales_order_row->job_card_rows as $job_card_row): ?> 
										<tr>
											<td align="center"><?= h(++$page_no) ?></td>
											
											<td>
											<?php echo $this->Form->input('job_card_rows['.$p.'][sales_order_row_id]',['class' => 'form-control input-sm','type'=>'hidden','label'=>false,'value'=>$job_card_row->sales_order_row_id]); ?>
											<?php echo $this->Form->input('job_card_rows['.$p.'][item_id]',['empty'=>'--Select--','options'=>$items,'class' => 'form-control input-sm select2me','label'=>false,'value'=>$job_card_row->item_id]); ?>
											</td>
											<td><?php echo $this->Form->input('job_card_rows['.$p.'][quantity]',['class' => 'form-control input-sm','placeholder'=>'Quantity','label'=>false,'value'=>$job_card_row->quantity]); ?></td>
											<td><a class="btn btn-xs btn-default addrow" href="#" role='button'><i class="fa fa-plus"></i></a><a class="btn btn-xs btn-default deleterow" href="#" role='button'><i class="fa fa-times"></i></a></td>
											
										</tr>
									<?php $p++;  endforeach; ?>
									
								</tbody>
							</table>
							</div>	
							</td>
							
						</tr>
						<?php  endforeach; ?>
					</tbody>
				</table>
			</div>
	
			<div class="form-actions">
				 <button type="submit" class="btn blue-hoki">Add Inventory Vouchers</button>
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
	

	
	add_row();
    $('.addrow').die().live("click",function() { 
		add_row();
    });
	
	function add_row(){
		var tr1=$("#sample_tb tbody tr.tr1").clone();
		$("#main_tb tbody").append(tr1);
		var i=0;
		$("#main_tb tbody tr.tr1").each(function(){
			i++;
			$(this).find("td:nth-child(1)").html(i);
			$(this).find("td:nth-child(2) select").attr("name","inventory_voucher_rows["+i+"][item_id]").select2().rules("add", "required");
			$(this).find("td:nth-child(3) input").attr("name","inventory_voucher_rows["+i+"][quantity]").rules("add", "required");
			
		});
		
	}
	
		$('.deleterow').die().live("click",function() {
		var l=$(this).closest("table tbody").find("tr").length;
		if (confirm("Are you sure to remove row ?") == true) {
			if(l>1){
				var del=$(this).closest("tr");
				$(del).remove();
				var i=0;
				$("#main_tb tbody tr.tr1").each(function(){
					i++;
					$(this).find("td:nth-child(1)").html(i);
					$(this).find("td:nth-child(2) select").attr("name","inventory_voucher_rows["+i+"][item_id]").select2();
					$(this).find("td:nth-child(3) input").attr("name","inventory_voucher_rows["+i+"][quantity]");
					
				});
				
			}
			
		} 
    });
	
});
</script>
<table id="sample_tb" style="display:none;">
	<tbody>
		<tr class="tr1">
			<td width="10">0</td>
			<td><?php echo $this->Form->input('q', ['empty'=>'Select','options' => $items,'label' => false,'class' => 'form-control input-sm select2-offscreen']); ?></td>
			<td width="100"><?php echo $this->Form->input('q', ['label' => false,'class' => 'form-control input-sm quantity','placeholder' => 'Quantity']); ?></td>
			
			<td  width="70"><a class="btn btn-xs btn-default addrow" href="#" role='button'><i class="fa fa-plus"></i></a><a class="btn btn-xs btn-default deleterow" href="#" role='button'><i class="fa fa-times"></i></a></td>
		</tr>
		
	</tbody>
</table>