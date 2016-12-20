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
							<label class="control-label">Company Name <span class="required" aria-required="true">*</span></label>
							<?php echo $this->Form->input('company_id', ['empty'=>'--Select--','options' => $companies,'class' => 'form-control input-sm select2me','label'=>false]); ?>
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">Date <span class="required" aria-required="true">*</span></label><br/>
							<?php echo date("d-m-Y"); ?>
						</div>
					</div>
				</div>
				<div align="center"><h4>Sales-Order : <?= h($salesOrder->so1.'/'.str_pad($salesOrder->so2, 3, '0', STR_PAD_LEFT).'/'.$salesOrder->so3.'/'.$salesOrder->so4) ?></h4></div>
				<table width="100%" id="main_tb" border="1">
					<thead>
						<th width="30%">In</th>
						<th>Out</th>
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
		alert(l);
		$(this).closest('tr').remove();
    });
	
	function rename_rows_name(){
		var i=0; 
		$("#main_tb tbody#maintbody tr.main_tr").each(function(){
			var sales_order_row_id=$(this).find("td:nth-child(1) input").val();
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
<table class="table">
	<thead>
		<th>Sr</th>
		<th width="70%">Item</th>
		<th>Quantity</th>
		<th width="10%"></th>
	</thead>
	<tbody>
		<tr>
			<td>0</td>
			<td>
			<?php echo $this->Form->input('sales_order_row',['class' => 'form-control input-sm','type'=>'hidden','label'=>false]); ?>
			<?php echo $this->Form->input('item_id',['empty'=>'--Select--','options'=>$items,'class' => 'form-control input-sm','label'=>false]); ?>
			</td>
			<td><?php echo $this->Form->input('quantity',['class' => 'form-control input-sm','label'=>false]); ?></td>
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
			<?php echo $this->Form->input('sales_order_row',['class' => 'form-control input-sm','type'=>'hidden','label'=>false]); ?>
			<?php echo $this->Form->input('item_id',['empty'=>'--Select--','options'=>$items,'class' => 'form-control input-sm','label'=>false]); ?>
			</td>
			<td><?php echo $this->Form->input('quantity',['class' => 'form-control input-sm','label'=>false]); ?></td>
			<td><a class="btn btn-xs btn-default addrow" href="#" role='button'><i class="fa fa-plus"></i></a><a class="btn btn-xs btn-default deleterow" href="#" role='button'><i class="fa fa-times"></i></a></td>
		</tr>
		
	</tbody>
</table>

