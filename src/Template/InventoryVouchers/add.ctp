<?php  //foreach($JobCardRows as $items){ pr($items); } exit; ?>
<style>
.page-content-wrapper .page-content{
	padding:5px 5px 5px 5px;
}
#main_tb td,th{
	padding:3px;
}
</style>
<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption">
			<i class="icon-globe font-blue-steel"></i>
			<span class="caption-subject font-blue-steel uppercase">Add Inventory Voucher</span>
		</div>
		<div class="actions">
		<?php echo $this->Html->link('<i class="fa fa-files-o"></i> Pull Invoice','/Invoices?inventory_voucher=true',array('escape'=>false,'class'=>'btn btn-xs blue')); ?>
		</div>
	</div>
<div class="portlet-body form">
	
		<?= $this->Form->create($inventoryVoucher,['id'=>'form_sample_3']) ?>
		<div class="form-body">
			<div class="row">
				<div class="col-md-4">
					<div class="form-group">
						<label class="col-md-3 control-label">Customer</label>
						<div class="col-md-9">
						<?php echo @$Invoice->customer->customer_name; ?>
						</div>
					</div>
				</div>
				<div class="col-md-6">
				<div class="form-group">
						<label class="col-md-3 control-label">Invoice No.</label>
						<div class="col-md-9 padding-right-decrease">
							<?= h(($Invoice->in1.'/IN-'.str_pad($Invoice->in2, 3, '0', STR_PAD_LEFT).'/'.$Invoice->in3.'/'.$Invoice->in4)) ?>
						</div>
						
					</div>
				</div>
				<div class="col-md-2">
					<div class="form-group">
						<label class="col-md-3 control-label">Date</label>
						<div class="col-md-9">
							<?php echo date("d-m-Y"); ?>
						</div>
					</div>
				</div>
			</div>
		</div>
		<?php if(empty($InventoryVoucherRows)){ ?>
		<table border="1" width="80%" >
			<thead>
			<tr>
				<th width="40%">PRODUCTION</th>
				<th>CONSUMPTION</th>
			</tr>
			</thead>
			<tbody >
			<?php $i=0; ?>
				<tr >
					<td><?= h($item->name) ?> (<?= h($invoice_row->quantity) ?>)</td>
					<td>
					<table id="main_table">
						<tbody id="maintbody">
						<?php  foreach($JobCardRows as $job_card_row){ ?>
							<tr class="tr1 preimp" row_no='<?php echo $i; ?>'>
								<td>
								<?php echo $this->Form->input('invoice_id', ['type'=>'hidden','value' => @$invoice_row->invoice_id]); ?>
								<?php echo $this->Form->input('inventory_voucher_rows.'.$i.'.item_id', ['options' => $items,'label' => false,'class' => 'form-control input-sm select_item','value' => $job_card_row->item_id]); ?>
								</td>
								<td>
								<?php echo $this->Form->input('inventory_voucher_rows.'.$i.'.quantity', ['type' => 'text','label' => false,'class' => 'form-control input-sm','value' => $job_card_row->quantity]); ?>
								</td>
								<td>
								<a class="btn btn-xs btn-default addrow" href="#" role='button'><i class="fa fa-plus"></i></a><a class="btn btn-xs btn-default deleterow" href="#" role='button'><i class="fa fa-times"></i></a>
								</td>
							</tr>
							<?php 
							$options1=[];
							foreach($job_card_row->item->item_serial_numbers as $item_serial_number){
								$options1[]=['text' =>$item_serial_number->serial_no, 'value' => $item_serial_number->id];
							} if($options1) { ?>
							<tr class="tr2 preimp" row_no='<?php echo $i; ?>'>
							<td></td>
							<td colspan="3">
							<?php echo $this->Form->input('q', ['label'=>false,'options' => $options1,'multiple' => 'multiple','class'=>'form-control select2me','required','style'=>'width:100%']);  ?></td>
							</tr><?php } ?>
							
						<?php $i++; } ?>
						</tbody>
					</table>
					</td>
				</tr>
			<?php //} ?>			
			</tbody>
		</table>
		<?php } else { ?>
		<table border="1" width="80%" >
			<thead>
			<tr>
				<th width="40%">PRODUCTION</th>
				<th>CONSUMPTION</th>
			</tr>
			</thead>
			<tbody >
			<?php  ?>
				<tr >
					<td><?= h($item->name) ?> (<?= h($invoice_row->quantity) ?>)</td>
					<td>
					<table id="main_table">
						<tbody id="maintbody">
						<?php $i=0; foreach($JobCardRows as $job_card_row){ ?>
							<tr class="tr1" row_no='<?php echo $i; ?>'>
								<td>
								<?php echo $this->Form->input('invoice_id', ['type'=>'hidden','value' => @$invoice_row->invoice_id]); ?>
								<?php echo $this->Form->input('inventory_voucher_rows.'.$i.'.item_id', ['options' => $items,'label' => false,'class' => 'form-control input-sm select_item select2me','value' => $job_card_row->item_id]); ?>
								
								</td>
								<td>
								<?php echo $this->Form->input('inventory_voucher_rows.'.$i.'.quantity', ['type' => 'text','label' => false,'class' => 'form-control input-sm','value' => $job_card_row->quantity]); ?>
								</td>
								<td>
								<a class="btn btn-xs btn-default addrow" href="#" role='button'><i class="fa fa-plus"></i></a><a class="btn btn-xs btn-default deleterow" href="#" role='button'><i class="fa fa-times"></i></a>
								</td>
							</tr>
							<?php 
							$options1=[];
							foreach($job_card_row->item->item_serial_numbers as $item_serial_number){
								$options1[]=['text' =>$item_serial_number->serial_no, 'value' => $item_serial_number->id];
							} if($options1) { ?>
							<tr class="tr2" row_no='<?php echo $i; ?>'>
							<td></td>
							<td colspan="3">
							<?php echo $this->Form->input('q', ['label'=>false,'options' => $options1,'multiple' => 'multiple','class'=>'form-control select2me','required','style'=>'width:100%']);  ?></td>
							</tr><?php } ?>
							
						<?php $i++; } ?>
						</tbody>
					</table>
					</td>
				</tr>
			<?php// } ?>			
			</tbody>
		</table>
		<?php } ?>

		<button type="submit" class="btn btn-primary" >NEXT</button>
		<?= $this->Form->end() ?>
	
	</div>
</div>
<?php echo $this->Html->script('/assets/global/plugins/jquery.min.js'); ?>
<script>
$(document).ready(function() {
	var form3 = $('#form_sample_3');
	var error3 = $('.alert-danger', form3);
	var success3 = $('.alert-success', form3);
	form3.validate({
		errorElement: 'span', //default input error message container
		errorClass: 'help-block help-block-error', // default input error message class
		focusInvalid: true, // do not focus the last invalid input
		ignore: "textarea:hidden",
		rules: {
			item_serial_numbers:{
				required: true,
			}
		},
	});
	rename_rows_name();
	$('.addrow').die().live("click",function() { //alert();
		var tr1=$("#sample_tb tbody").html();
		$(this).closest('table tbody').append(tr1);
		
		var w=0; var r=0;
		$("#main_table tbody#maintbody tr.preimp").each(function(){
			$(this).attr("row_no",w);
			r++;
			if(r==2){ w++; r=0; }
		});
		rename_rows_name();
    });
	$('.deleterow').die().live("click",function() {
		var l=$(this).closest("table tbody").find("tr").length;
		if (confirm("Are you sure to remove row ?") == true) {
			if(l>2){
				var row_no=$(this).closest("tr").attr("row_no");
				var del="tr[row_no="+row_no+"]";
				$(del).remove();
				rename_rows_name();
			}
		} 
    });
	function rename_rows_name(){ 
		var i=0; 
		var j=0; 
		
			$("#main_table tbody#maintbody tr.tr1").each(function(){
				
				$(this).find("td:nth-child(1) select").attr({name:"inventory_voucher_rows["+i+"][item_id]", id:"inventory_voucher_rows-"+i+"-item_id"}).select2();
				$(this).find("td:nth-child(2) input").attr({name:"inventory_voucher_rows["+i+"][quantity]", id:"inventory_voucher_rows-"+i+"-quantity"});
				i++;
				});
			$("#main_table tbody#maintbody tr.tr2").each(function(){
				var row_no=$(this).closest('tr').attr('row_no');
				var qty=$('#main_table tbody#maintbody tr.tr1[row_no='+row_no+']').find("td:nth-child(2) input").val();
				//alert(qty);
				$(this).find("td:nth-child(2) select").attr({name:"inventory_voucher_rows["+j+"][item_serial_numbers][]",id:"inventory_voucher_rows-"+j+"-item_serial_no"}).select2();
				j++;
				});	
											
	}
$('.select_item').die().live("change",function() {
  		var select_item_id=$(this).find('option:selected').val();
		var row_no=$(this).closest('tr').attr('row_no');
		alert(row_no);
		var url1="<?php echo $this->Url->build(['controller'=>'InventoryVouchers','action'=>'ItemSerialNumber']); ?>";
		url1=url1+'/'+select_item_id,
		$.ajax({
			url: url1,
		}).done(function(response) { 
		alert(response);
  			$('tr.tr2[row_no='+row_no+']').find('td:nth-child(2)').html(response);
			rename_rows_name();
		});
		
	
	});
	
});
</script>

<table id="sample_tb" style="display:none;">
	<tbody>
	<tr class="tr1 preimp">
		<td>
		<?php echo $this->Form->input('invoice_row_id', ['class' => 'form-control input-sm ','type'=>'hidden','label'=>false]); ?>
		<?php echo $this->Form->input('invoice_row_item_id',['class' => 'form-control input-sm item_id','type'=>'hidden','label'=>false]); ?>
		<?php echo $this->Form->input('item_id', ['options' => $items,'empty'=>'--select--','label' => false,'class' => 'form-control input-sm select_item']); ?>
		</td>
		<td>
		<?php echo $this->Form->input('quantity', ['type' => 'text','label' => false,'class' => 'form-control input-sm']); ?>
		</td>
		<td>
		<a class="btn btn-xs btn-default addrow" href="#" role='button'><i class="fa fa-plus"></i></a><a class="btn btn-xs btn-default deleterow" href="#" role='button'><i class="fa fa-times"></i></a>
		</td>
	</tr>
	<tr class="tr2 preimp">
		<td></td>
		<td colspan="3" id="serial_no_box"></td>
		
	</tr>
				
				
			
	</tbody>
</table>