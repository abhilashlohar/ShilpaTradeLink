<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption">
			<i class="icon-globe font-blue-steel"></i>
			<span class="caption-subject font-blue-steel uppercase">Add Invoice</span>
		</div>
		<div class="actions">
			<a href="#myModal1" role="button" class="btn blue pull-right" data-toggle="modal">Pull Sales Order</a>
		</div>
	</div>
	<div class="portlet-body form">
		<?= $this->Form->create($invoice) ?>
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
							echo $this->Form->input('company_id',['options' => $options,'empty' => "--Select Company--",'label' => false,'class' => 'form-control input-sm select2me','value' => @$sales_order->company_id] ); ?>
						</div>
					</div>
				</div>
				<div class="col-md-3">
				</div>
				<div class="col-md-3">
					<div class="form-group">
						<label class="col-md-3 control-label">Date</label>
						<div class="col-md-9">
							<?php echo $this->Form->input('date_created', ['type' => 'text','label' => false,'class' => 'form-control input-sm','value' => date("d-m-Y"),'readonly']); ?>
						</div>
					</div>
				</div>
			</div><br/>
			<div class="row">
				<div class="col-md-6">
					<div class="form-group">
						<label class="col-md-3 control-label">Customer</label>
						<div class="col-md-9">
							<?php echo $this->Form->input('customer_id', ['empty' => "--Select--",'label' => false,'options' => $customers,'class' => 'form-control input-sm select2me','value' => @$sales_order->customer_id]); ?>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label class="col-md-3 control-label">Invoice No.</label>
						<div class="col-md-3">
							<?php echo $this->Form->input('in1', ['label' => false,'class' => 'form-control input-sm','readonly','value' => @$sales_order->so1]); ?>
						</div>
						<div class="col-md-3" id="in3_div">
							<?php echo $this->Form->input('in3', ['label' => false,'class' => 'form-control input-sm']); ?>
						</div>
						<div class="col-md-3">
							<?php echo $this->Form->input('in4', ['label' => false,'value'=>'16-17','class' => 'form-control input-sm','readonly']); ?>
						</div>
					</div>
				</div>
			</div>
			<br/>
			<div class="row">
				<div class="col-md-6">
					<div class="form-group">
						<label class="col-md-3 control-label">Address</label>
						<div class="col-md-9">
							<?php echo $this->Form->input('customer_address', ['label' => false,'class' => 'form-control','placeholder' => 'Address','value' => @$sales_order->customer_address]); ?>
							<a href="#" role="button" class="pull-right select_address" >
							Select Address </a>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label class="col-md-3 control-label">LR No.</label>
						<div class="col-md-9">
							<?php echo $this->Form->input('lr_no', ['type' => 'text','label' => false,'class' => 'form-control input-sm','placeholder'=>'LR No']); ?>
						</div>
					</div>
					<br/>
					<div class="form-group">
						<label class="col-md-3 control-label">Customer PO NO  <span class="required" aria-required="true">*</span></label>
						<div class="col-md-9">
							<?php echo $this->Form->input('customer_po_no', ['type' => 'text','label' => false,'class' => 'form-control input-sm','placeholder' => 'Customer PO NO','value'=>@$sales_order->customer_po_no]); ?>
						</div>
					</div>
				</div>
			</div><br/>
			<div class="row">
				<div class="col-md-6">
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label class="col-md-3 control-label">Salesman  <span class="required" aria-required="true">*</span></label>
						<div class="col-md-9">
							<?php echo $this->Form->input('employee_id', ['empty' => "--Select--",'label' => false,'options' => $employees,'class' => 'form-control input-sm select2me','value' => @$sales_order->customer_id]); ?>
						</div>
					</div>
				</div>
			</div><br/>
			
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
					<?php $ed_des=[];
					if(!empty($sales_order->sales_order_rows)){
					$q=0; foreach ($sales_order->sales_order_rows as $sales_order_rows): 
						$ed_des[]=$sales_order_rows->excise_duty;
					?>
						<tr class="tr1" row_no='<?php echo @$sales_order_rows->id; ?>'>
							<td rowspan="2"><?php echo ++$q; --$q; ?></td>
							<td><?php echo $this->Form->input('q', ['options' => $items,'label' => false,'class' => 'form-control input-sm','placeholder'=>'Item','value' => @$sales_order_rows->item->id,'readonly']); ?></td>
							<td><?php echo $this->Form->input('q', ['label' => false,'type' => 'number','class' => 'form-control input-sm','placeholder'=>'Quantity','value' => @$sales_order_rows->quantity-$sales_order_rows->processed_quantity,'readonly','min'=>'1','max'=>@$sales_order_rows->quantity-$sales_order_rows->processed_quantity]); ?></td>
							<td><?php echo $this->Form->input('q', ['label' => false,'class' => 'form-control input-sm','placeholder'=>'Rate','value' => @$sales_order_rows->rate,'readonly','step'=>0.01]); ?></td>
							<td><?php echo $this->Form->input('q', ['label' => false,'class' => 'form-control input-sm','placeholder'=>'Amount','value' => @$sales_order_rows->amount,'readonly','step'=>0.01]); ?></td>
							<td>
								<label><?php echo $this->Form->input('check.'.$q, ['label' => false,'type'=>'checkbox','class'=>'rename_check','value' => @$sales_order_rows->id]); ?></label>
								<?php echo $this->Form->input('q', ['label' => false,'type' => 'text','value' => @$sales_order_rows->so_sale_tax]); ?>
							</td>
						</tr>
						<tr class="tr2" row_no='<?php echo @$sales_order_rows->id; ?>'>
							<td colspan="4"><?php echo $this->Form->input('q', ['label' => false,'type' => 'textarea','class' => 'form-control input-sm ','placeholder'=>'Description','value' => @$sales_order_rows->description,'readonly']); ?></td>
							<td></td>
						</tr>
					<?php $q++; endforeach; }?>
				</tbody>
			</table>
			<table class="table tableitm" id="tbl2">
				<?php if(in_array('Yes',@$ed_des) or $process_status=="New") { ?>
				<tr style="background-color:#e6faf9;">
					<td align="right"><b><?php echo $this->Form->input('ed_description', ['type' => 'text','label' => false,'class' => 'form-control input-sm','placeholder' => 'Excise-Duty Description','style'=>['text-align:right']]); ?> </b></td>
					<td><?php echo $this->Form->input('exceise_duty', ['type' => 'text','label' => false,'class' => 'form-control input-sm','placeholder' => 'Excise-Duty','value' => 0]); ?></td>
				</tr>
				<?php } ?>
				<tr>
					<td align="right"><b>Total</b></td>
					<td width="20%"><?php echo $this->Form->input('total', ['type' => 'text','label' => false,'class' => 'form-control input-sm','placeholder' => 'Total','value' => 0,'step'=>0.01,'readonly']); ?></td>
				</tr>
				<tr>
					<td  align="right">
					<b>P&F <label><?php echo $this->Form->input('pnf_type', ['type' => 'checkbox','label' => false,'class' => 'form-control input-sm','id'=>'pnfper']); ?></label>(in %)</b>
					<div class="input-group col-md-2" style="display:none;" id="pnf_text">
						<input type="text" name="pnf_per" class="form-control input-sm" placeholder="5.5"  'step'=0.01><span class="input-group-addon">%</span>
					</div>
					</td>
					<td><?php echo $this->Form->input('pnf', ['type' => 'number','label' => false,'class' => 'form-control input-sm','placeholder' => 'P&F','step'=>0.01]); ?></td>
				</tr>
				<tr>
					<td  align="right"><b>Total after P&F </b></td>
					<td><?php echo $this->Form->input('total_after_pnf', ['type' => 'text','label' => false,'class' => 'form-control input-sm','placeholder' => 'Total after P&F','readonly','step'=>0.01]); ?></td>
				</tr>
				<tr>
					<td  align="right">
						<b>Sale Tax Description</b>
						<div class="input-group col-md-2">
						<?php if($process_status!="New"){ ?>
							<input type="text" name="sale_tax_per" class="form-control input-sm" readonly><span class="input-group-addon">%</span>
						
						<?php }else{ 
							$options=[];
							foreach($SaleTaxes as $SaleTaxe){
								$options[(string)$SaleTaxe->tax_figure]=$SaleTaxe->tax_figure.'%';
							}
							echo $this->Form->input('sale_tax_per', ['options'=>$options,'label' => false,'class' => 'form-control input-sm']); 
						} ?>
						</div>
					</td>
					<td><?php echo $this->Form->input('sale_tax_amount', ['type' => 'text','label' => false,'class' => 'form-control input-sm','readonly','step'=>0.01]); ?></td>
				</tr>
				<tr>
					<td  align="right">
					<b>Fright Amount </b>
					<?php echo $this->Form->input('fright_text', ['label' => false,'class' => 'form-control input-sm','placeholder'=>'Additional text for Fright Amount','style'=>['text-align:right']]); ?>
					</td>
					<td><?php echo $this->Form->input('fright_amount', ['type' => 'number','label' => false,'class' => 'form-control input-sm','placeholder' => 'Fright Amount','step'=>0.01]); ?></td>
				</tr>
				<tr>
					<td  align="right"><b>Grand Total </b></td>
					<td><?php echo $this->Form->input('grand_total', ['type' => 'text','label' => false,'class' => 'form-control input-sm','placeholder' => 'Grand Total','readonly','step'=>0.01]); ?></td>
				</tr>
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
		<div class="form-actions">
			<div class="row">
				<div class="col-md-offset-3 col-md-9">
					<button type="submit" class="btn btn-primary">ADD INVOICE</button>
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
			<td><?php echo $this->Form->input('rate[]', ['type' => 'number','label' => false,'class' => 'form-control input-sm','placeholder' => 'Rate','step'=>0.01]); ?></td>
			<td><?php echo $this->Form->input('amount[]', ['type' => 'number','label' => false,'class' => 'form-control input-sm','placeholder' => 'Amount','step'=>0.01]); ?></td>
			<td><a class="btn btn-xs btn-default addrow" href="#" role='button'><i class="fa fa-plus"></i></a><a class="btn btn-xs btn-default deleterow" href="#" role='button'><i class="fa fa-times"></i></a></td>
		</tr>
		<tr class="tr2">
			<td colspan="4"><?php echo $this->Form->textarea('description', ['label' => false,'class' => 'form-control input-sm autoExpand','placeholder' => 'Description','rows'=>'1']); ?></td>
			<td></td>
		</tr>
	</tbody>
</table>


<?php echo $this->Html->script('/assets/global/plugins/jquery.min.js'); ?>
<script>
$(document).ready(function() {
	$('select[name="company_id"]').on("change",function() {
		var alias=$('select[name="company_id"] option:selected').attr("alias");
		$('input[name="in1"]').val(alias);
    });
	
	$("#pnfper").on('click',function(){
		if($(this).is(':checked')){
			$("#pnf_text").show();
			$('input[name="pnf"]').attr('readonly','readonly');
		}else{
			$("#pnf_text").hide();
			$('input[name="pnf"]').removeAttr('readonly');
		}
	})
	
	
	
	$('#main_tb input,#tbl2 input').die().live("keyup","blur",function() { 
		calculate_total();
    });
	$('#main_tb input,#tbl2 select').die().live("change",function() { 
		calculate_total();
    });
	
	$('.rename_check').die().live("click",function() {
		rename_rows(); calculate_total();
    });
	
	<?php if($process_status!="New"){ ?>
	function rename_rows(){
		$("#main_tb tbody tr.tr1").each(function(){
			var row_no=$(this).attr('row_no');
			var val=$(this).find('td:nth-child(6) input[type="checkbox"]:checked').val();
			if(val){
				$(this).find('td:nth-child(2) select').attr("name","invoice_rows["+val+"][item_id]");
				$(this).find('td:nth-child(3) input').removeAttr("readonly").attr("name","invoice_rows["+val+"][quantity]");
				$(this).find('td:nth-child(4) input').attr("name","invoice_rows["+val+"][rate]");
				$(this).find('td:nth-child(5) input').attr("name","invoice_rows["+val+"][amount]");
				
				$('#main_tb tbody tr.tr2[row_no="'+row_no+'"] td:nth-child(1) textarea').removeAttr("readonly").attr("name","invoice_rows["+val+"][description]");
				
				$(this).css('background-color','#fffcda');
				$('#main_tb tbody tr.tr2[row_no="'+row_no+'"]').css('background-color','#fffcda');
			}else{
				$(this).find('td:nth-child(2) select').attr({ name:"q", readonly:"readonly"});
				$(this).find('td:nth-child(3) input').attr({ name:"q", readonly:"readonly"});
				$(this).find('td:nth-child(4) input').attr({ name:"q", readonly:"readonly"});
				
				$('#main_tb tbody tr.tr2[row_no="'+row_no+'"] td:nth-child(1) textarea').attr({ name:"q", readonly:"readonly"});
				
				$(this).css('background-color','#FFF');
				$('#main_tb tbody tr.tr2[row_no="'+row_no+'"]').css('background-color','#FFF');
			}
		});
	}
	
	
	function calculate_total(){
		var total=0; var grand_total=0;
		$("#main_tb tbody tr.tr1").each(function(){
			var val=$(this).find('td:nth-child(6) input[type="checkbox"]:checked').val();
			if(val){
				var qty=parseInt($(this).find("td:nth-child(3) input").val());
				var Rate=parseFloat($(this).find("td:nth-child(4) input").val());
				var Amount=qty*Rate;
				$(this).find("td:nth-child(5) input").val(Amount);
				total=total+Amount;
				var sale_tax=parseFloat($(this).find("td:nth-child(6) input[type=text]").val());
				if(isNaN(sale_tax)) { var sale_tax = 0; }
				$('input[name="sale_tax_per"]').val(sale_tax);
			}
		});
		var exceise_duty=parseFloat($('input[name="exceise_duty"]').val());
		if(isNaN(exceise_duty)) { var exceise_duty = 0; }
		total=total+exceise_duty
		$('input[name="total"]').val(total.toFixed(2));
		
		if($("#pnfper").is(':checked')){
			var pnf_per=parseFloat($('input[name="pnf_per"]').val());
			var pnf_amount=(total*pnf_per)/100;
			if(isNaN(pnf_amount)) { var pnf_amount = 0; }
			$('input[name="pnf"]').val(pnf_amount.toFixed(2));
		}else{
			var pnf_amount=parseFloat($('input[name="pnf"]').val());
			if(isNaN(pnf_amount)) { var pnf_amount = 0; }
		}
		var total_after_pnf=total+pnf_amount;
		if(isNaN(total_after_pnf)) { var total_after_pnf = 0; }
		$('input[name="total_after_pnf"]').val(total_after_pnf.toFixed(2));
		
		var sale_tax_per=parseFloat($('input[name="sale_tax_per"]').val());
		var sale_tax=(total_after_pnf*sale_tax_per)/100;
		if(isNaN(sale_tax)) { var sale_tax = 0; }
		$('input[name="sale_tax_amount"]').val(sale_tax.toFixed(2));
		
		var fright_amount=parseFloat($('input[name="fright_amount"]').val());
		if(isNaN(fright_amount)) { var fright_amount = 0; }
		
		grand_total=total_after_pnf+sale_tax+fright_amount;
		$('input[name="grand_total"]').val(grand_total.toFixed(2));
	}
	<?php } ?>
	
	
	
	<?php if($process_status=="New"){ ?> add_row(); <?php } ?>
    $('.addrow').die().live("click",function() { 
		add_row();
    });
	
	<?php if($process_status=="New"){ ?>
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
						$(this).find("td:nth-child(2) select").attr("name","invoice_rows["+i+"][item_id]");
						$(this).find("td:nth-child(3) input").attr("name","invoice_rows["+i+"][quantity]");
						$(this).find("td:nth-child(4) input").attr("name","invoice_rows["+i+"][rate]");
						$(this).find("td:nth-child(5) input").attr("name","invoice_rows["+i+"][amount]");
						$(this).find('td:nth-child(6) select').attr("name","invoice_rows["+i+"][excise_duty]");
					});
					var i=0;
					$("#main_tb tbody tr.tr2").each(function(){
						i++;
						$(this).find("td:nth-child(1) textarea").attr("name","invoice_rows["+i+"][description]");
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
				$(this).find("td:nth-child(2) select").attr("name","invoice_rows["+i+"][item_id]").select2();
				$(this).find("td:nth-child(3) input").attr("name","invoice_rows["+i+"][quantity]");
				$(this).find("td:nth-child(4) input").attr("name","invoice_rows["+i+"][rate]");
				$(this).find("td:nth-child(5) input").attr("name","invoice_rows["+i+"][amount]");
				$(this).find('td:nth-child(6) select').attr("name","invoice_rows["+i+"][excise_duty]");
			});
			var i=0;
			
			$("#main_tb tbody tr.tr2").each(function(){
				i++;
				$(this).find("td:nth-child(1) textarea").attr("name","invoice_rows["+i+"][description]");
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
		
		function calculate_total(){
			var total=0;
			$("#main_tb tbody tr.tr1").each(function(){
				var unit=$(this).find("td:nth-child(3) input").val();
				var Rate=$(this).find("td:nth-child(4) input").val();
				var Amount=unit*Rate;
				$(this).find("td:nth-child(5) input").val(Amount);
				total=total+Amount;
			});
			var exceise_duty=parseFloat($('input[name="exceise_duty"]').val());
			if(isNaN(exceise_duty)) { var exceise_duty = 0; }
			total=total+exceise_duty
			$('input[name="total"]').val(total.toFixed(2));
			
			if($("#pnfper").is(':checked')){
				var pnf_per=parseFloat($('input[name="pnf_per"]').val());
				var pnf_amount=(total*pnf_per)/100;
				if(isNaN(pnf_amount)) { var pnf_amount = 0; }
				$('input[name="pnf"]').val(pnf_amount.toFixed(2));
			}else{
				var pnf_amount=parseFloat($('input[name="pnf"]').val());
				if(isNaN(pnf_amount)) { var pnf_amount = 0; }
			}
			var total_after_pnf=total+pnf_amount;
			if(isNaN(total_after_pnf)) { var total_after_pnf = 0; }
			$('input[name="total_after_pnf"]').val(total_after_pnf.toFixed(2));
			
			var sale_tax_per=parseFloat($('select[name="sale_tax_per"] option:selected').val());
			var sale_tax=(total_after_pnf*sale_tax_per)/100;
			if(isNaN(sale_tax)) { var sale_tax = 0; }
			$('input[name="sale_tax_amount"]').val(sale_tax.toFixed(2));
			
			var fright_amount=parseFloat($('input[name="fright_amount"]').val());
			if(isNaN(fright_amount)) { var fright_amount = 0; }
			
			grand_total=total_after_pnf+sale_tax+fright_amount;
			$('input[name="grand_total"]').val(grand_total.toFixed(2));
			
		}
		
	<?php } ?>
	
	
	
	
	$('.select_address').on("click",function() { 
		open_address();
    });
	
	$('.closebtn').on("click",function() { 
		$("#myModal12").hide();
    });
	
	
	$('select[name="customer_id"]').on("change",function() {
		var customer_id=$('select[name="customer_id"] option:selected').val();
		var url="<?php echo $this->Url->build(['controller'=>'Customers','action'=>'defaultAddress']); ?>";
		url=url+'/'+customer_id,
		$.ajax({
			url: url,
		}).done(function(response) {
			$('textarea[name="customer_address"]').val(response);
		});
		
		$("#in3_div").html('Loading...');
		var url="<?php echo $this->Url->build(['controller'=>'Filenames','action'=>'listFilename']); ?>";
		url=url+'/'+customer_id,
		$.ajax({
			url: url,
		}).done(function(response) {
			$("#in3_div").html(response);
			$('select[name="qt3"]').attr('name','in3');
		});
		
    });
	
	<?php if($process_status!="New"){ ?> 
		var customer_id=$('select[name="customer_id"] option:selected').val();
		
		$("#in3_div").html('Loading...');
		var url="<?php echo $this->Url->build(['controller'=>'Filenames','action'=>'listFilename']); ?>";
		url=url+'/'+customer_id+'/in',
		$.ajax({
			url: url,
		}).done(function(response) {
			$("#in3_div").html(response);
			$('select[name="qt3"]').attr('name','in3');
		});
	<?php } ?>
	
	function open_address(){
		var customer_id=$('select[name="customer_id"]').val();
		$("#result_ajax").html('<div align="center"><?php echo $this->Html->image('/img/wait.gif', ['alt' => 'wait']); ?> Loading</div>');
		var url="<?php echo $this->Url->build(['controller'=>'Customers','action'=>'addressList']); ?>";
		url=url+'/'+customer_id,
		$("#myModal12").show();
		$.ajax({
			url: url,
		}).done(function(response) {
			$("#result_ajax").html(response);
		});
	}
	
	$('.insert_address').die().live("click",function() { 
		var addr=$(this).text();
		$('textarea[name="customer_address"]').val(addr);
		$("#myModal12").hide();
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
		<?php echo $this->Form->create('pull_From_Sales_Order', ['url' => ['action' => 'pull_From_Sales_Order']])?>
			<div class="modal-body">
				<p>
					<label>Select Sales Order No.</label>
					<?php 
					$options=array();
					foreach($salesOrders as $salesOrderdata){
						$options[]=['text' => h(($salesOrderdata->so1.'/SO-'.str_pad($salesOrderdata->id, 3, '0', STR_PAD_LEFT).'/'.$salesOrderdata->so3.'/'.$salesOrderdata->so4)), 'value' => $salesOrderdata->id];
					}
					echo $this->Form->input('sales_order_id', ['empty' => "--Select--",'label' => false,'options' => $options,'class' => 'form-control input-sm select2me']); ?>
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


