<?php //pr($salesOrder->sales_order_rows); exit; ?>
<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption" >
			<i class="icon-globe font-blue-steel"></i>
			<span class="caption-subject font-blue-steel uppercase">Add Job Card</span>
		</div>
		<div class="actions">
		<?php echo $this->Html->link('<i class="fa fa-files-o"></i> Pull Sales-Order','/Sales-Orders/index?job-card=true',array('escape'=>false,'class'=>'btn btn-xs blue')); ?>
		</div>
	</div>
	<?php if(!empty($salesOrder)){ ?>
	<div class="portlet-body form">
		<!-- BEGIN FORM-->
		 <?= $this->Form->create($jobCard,['id'=>'form_sample_3']) ?>
			<div class="form-body">

			<div class="row">
				<div class="col-md-4">
					<div class="form-group">
						<label class="col-md-5 control-label">Sales Order No</label>
						<div class="col-md-7">
							
							<?= h($salesOrder->so1.'/'.str_pad($salesOrder->so2, 3, '0', STR_PAD_LEFT).'/'.$salesOrder->so3.'/'.$salesOrder->so4) ?>
							
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group">
						<label class="col-md-5 control-label">Customer Name </label>
						<div class="col-md-7">
						<?php echo $this->Form->input('customer_id', ['type'=>'hidden','value' => @$salesOrder->customer_id]); ?>
						<?php echo $salesOrder->customer->customer_name; ?>
						</div>
					</div>
				</div>
				
				<div class="col-md-4">
					<div class="form-group">
						<label class="col-md-5 control-label">Job Card No. </label>
						<div class="col-md-7">
						<?php echo $this->Form->input('jc1', ['label' => false,'type'=>'hidden','value'=>$salesOrder->so1]); ?>
						<?php echo $this->Form->input('jc2', ['label' => false,'type'=>'hidden','value'=>$last_jc_no->jc2]); ?>
						<?php echo $this->Form->input('jc3', ['label' => false,'type'=>'hidden','value'=>$salesOrder->so3]); ?>
						<?php echo $this->Form->input('jc4', ['label' => false,'type'=>'hidden','value'=>$salesOrder->so4]); ?>
						<?php echo $salesOrder->so1.'/JC-'.str_pad($last_jc_no->jc2, 3, '0', STR_PAD_LEFT).'/'.$salesOrder->so3.'/'.$salesOrder->so4; ?>
						</div>
					</div>
				</div>

			</div><br/>
			<div class="row">
				<div class="col-md-4">
					<div class="form-group">
						<label class="col-md-5 control-label">Customer PO No</label>
						<div class="col-md-7">
							<?php echo $this->Form->input('customer_po_no', ['type'=>'hidden','value' => @$salesOrder->customer_po_no]); ?>
							<?php echo $salesOrder->customer_po_no; ?>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group">
						<label class="col-md-5 control-label">Required Date <span class="required" aria-required="true">*</span></label>
						<div class="col-md-7">
							<?php echo $this->Form->input('required_date', ['type'=>'text','label' => false,'class' => 'form-control input-sm date-picker','placeholder'=>'Required Date','data-date-format'=>'dd-mm-yyyy','data-date-start-date' => '-60d','data-date-end-date' => '0d','required']); ?>
						</div>
					</div>
				</div>
			</div><br/>
						<div class="row">
				<div class="col-md-4">
					<div class="form-group">
						<label class="col-md-5 control-label">Dispatch Name </label>
						<div class="col-md-7">
							
							<?php echo $this->Form->input('dispatch_name', ['type'=>'hidden','value' => @$salesOrder->dispatch_name]); ?>
							<?php echo $salesOrder->dispatch_name; ?>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group">
						<label class="col-md-5 control-label">Dispatch Email</label>
						<div class="col-md-7">
							<?php echo $this->Form->input('dispatch_email', ['type'=>'hidden','value' => @$salesOrder->dispatch_email]); ?>
							<?php echo $salesOrder->dispatch_email; ?>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group">
						<label class="col-md-5 control-label">Dispatch Address</label>
						<div class="col-md-7">
							<?php echo $this->Form->input('dispatch_address', ['type'=>'hidden','value' => @$salesOrder->dispatch_address]); ?>
							<?php echo $salesOrder->dispatch_address; ?>
						</div>
					</div>
				</div>
			</div><br/>
			<div class="row">
				<div class="col-md-12">
					<div class="form-group">
						<label class="col-md-2 control-label">Packing: <span class="required" aria-required="true">*</span></label>
						<div class="col-md-10">
							<?php echo $this->Form->textarea('packing', ['type' => 'text','label' => false,'class' => 'form-control input-sm','placeholder' => 'Packing','required']); ?>
						</div>
					</div>
				</div>
				
			</div>	<br/>		
				
				
				<table class="table table-bordered " width="100%" id="main_tb" border="1">
					<thead>
						<th valign="right" width="30%">IN</th>
						<th align="center">OUT</th>
					</thead>
					<tbody id="maintbody">
					<?php foreach($salesOrder->sales_order_rows as $sales_order_row){ ?>
						<tr class="main_tr">
							<td valign="top">
							<?php echo $this->Form->input('sales_order_id', ['type'=>'text','empty'=>'--Select--','class' => 'form-control input-sm','label'=>false,'value'=>$sales_order_row->id,'type'=>'hidden']); ?>
							<b><?= h($sales_order_row->item->name) ?></b>
							</td>
							<td></td>
						</tr>
					<?php } ?>
					</tbody>
				</table>
			</div>
		
			<div class="form-actions">
				<button type="submit" class="btn btn-primary">CREATE JOB CARD</button>
			</div>
		<?= $this->Form->end() ?>
	</div>
	<?php } ?>
		<!-- END FORM-->
	</div>
</div>
<?php echo $this->Html->script('/assets/global/plugins/jquery.min.js'); ?>
<script>
$(document).ready(function() { 
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

	onload_add_row();
	function onload_add_row(){
		var tr1=$("#onload_sample_tb").html();
		$("#main_tb tbody#maintbody tr.main_tr").each(function(){
			$(this).find("td:nth-child(2)").html(tr1);
		});
		rename_rows_name();
	}
	
	$('.addrow').die().live("click",function() {
		var tr1=$("#sample_tb tbody").html();
		$(this).closest('table tbody').append(tr1);
		rename_rows_name();
    });
	
	$('.deleterow').die().live("click",function() {
		var l=$(this).closest("table tbody").find("tr").length;
		if (confirm("Are you sure to remove row ?") == true) {
			if(l>1){  
			 $(this).closest('tr').remove(); 
			}
		} 
    });
	
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
	
	function rename_rows_name(){
		var i=0; 
		$("#main_tb tbody#maintbody tr.main_tr").each(function(){
			var sales_order_row_id=$(this).find("td:nth-child(1) input").val();
			i++;
			$(this).find("td:nth-child(2) textarea").attr({name:"job_card_rows["+i+"][remark]", id:"job_card_rows-"+i+"-remark"});
			i--;
			var sr=0;
			$(this).find("td:nth-child(2) table tbody tr").each(function(){
				i++; sr++;
				$(this).find('td:nth-child(1)').html(sr);
				$(this).find("td:nth-child(2) input").attr({name:"job_card_rows["+i+"][sales_order_row_id]", id:"job_card_rows-"+i+"-sales_order_row_id"}).val(sales_order_row_id);
				$(this).find("td:nth-child(2) select").attr({name:"job_card_rows["+i+"][item_id]", id:"job_card_rows-"+i+"-item_id"}).select2();
				$(this).find("td:nth-child(3) input").attr({name:"job_card_rows["+i+"][quantity]", id:"job_card_rows-"+i+"-quantity"});
			});
		});
	}
});
</script>
<div id="onload_sample_tb" style="display:none;">
	
	<div class="col-md-10">
					<div class="form-group">
						<label class="control-label">Remarks <span class="required" aria-required="true">*</span></label>
						<?php echo $this->Form->textarea('remark', ['type' => 'text','label' => false,'class' => 'form-control input-sm','placeholder' => 'Remarks' ,'rows'=>1]); ?>
					</div>
	</div>
	
<table class="table">
	<thead>
		<th>S.No</th>
		<th width="70%">Item</th>
		<th>Quantity</th>
		<th width="10%"></th>
	</thead>
	<tbody>
		<tr>
			<td>0</td>
			<td>
			<?php echo $this->Form->input('sales_order_row_id',['class' => 'form-control input-sm','type'=>'hidden','label'=>false]); ?>
			<?php echo $this->Form->input('item_id',['empty'=>'--Select--','options'=>$items,'class' => 'form-control input-sm','label'=>false]); ?>
			</td>
			<td><?php echo $this->Form->input('quantity',['class' => 'form-control input-sm quantity','label'=>false,'placeholder'=>'Quantity','required']); ?></td>
			<td><a class="btn btn-xs btn-default addrow" href="#" role='button'><i class="fa fa-plus"></i></a><a class="btn btn-xs btn-default deleterow" href="#" role='button'><i class="fa fa-times"></i></a></td>
		</tr>
		
	</tbody>
</table>
</div>

<table id="sample_tb" style="display:none;">
	<tbody>
		<tr>
			<td>0</td>
			<td>
			<?php echo $this->Form->input('sales_order_row_id',['class' => 'form-control input-sm','type'=>'hidden','label'=>false]); ?>
			<?php echo $this->Form->input('item_id',['empty'=>'--Select--','options'=>$items,'class' => 'form-control input-sm','label'=>false,'required']); ?>
			</td>
			<td><?php echo $this->Form->input('quantity',['class' => 'form-control input-sm quantity','placeholder'=>'Quantity','label'=>false,'required']); ?></td>
			<td><a class="btn btn-xs btn-default addrow" href="#" role='button'><i class="fa fa-plus"></i></a><a class="btn btn-xs btn-default deleterow" href="#" role='button'><i class="fa fa-times"></i></a></td>
		</tr>
		
	</tbody>
</table>

