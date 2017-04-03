<?php //pr($grn->grn_rows); exit; ?>
<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption">
			<i class="icon-globe font-blue-steel"></i>
			<span class="caption-subject font-blue-steel uppercase">Add Invoice Booking</span>
		</div>
		<div class="actions">
			<?php echo $this->Html->link('<i class="icon-home"></i> Pull Grn','/Grns/index?pull-request=true',array('escape'=>false,'class'=>'btn btn-xs blue')); ?>
		</div>
	</div>
	
	<?php if(!empty($grn)) { ?>
	<div class="portlet-body form">
		<?= $this->Form->create($invoiceBooking,['id'=> 'form_sample_3']) ?>
		
			<div class="form-body">
			
				<div class="row">
					
					<div class="col-md-3">
						<div class="form-group">
							<label class="control-label">GRN No.</label>
							<br/>
							<?= h(($grn->grn1.'/GRN-'.str_pad($grn->grn2, 3, '0', STR_PAD_LEFT).'/'.$grn->grn3.'/'.$grn->grn4)) ?>
						</div>
					</div>
					<div class="col-md-3">
						<div class="form-group">
							<label class="control-label">Supplier</label>
							<br/>
							<?php echo $this->Form->input('vendor_ledger_id', ['label' => false,'class' => 'form-control input-sm','type' =>'hidden','value'=>@$grn->vendor->ledger_account_id]); ?>
							<?php echo @$grn->vendor->company_name; ?>
						</div>
					</div>
					<div class="col-md-3" >
						<div class="form-group">
							<label class="control-label">Invoice Booking No</label></br>
							<?php echo $grn->grn1.'/IB-'.str_pad($last_ib_no->ib2, 3, '0', STR_PAD_LEFT).'/'.$grn->grn3.'/'.$grn->grn4; ?>
							<br/>
							<? ?>
						</div>
					</div>
					<div class="col-md-2 pull-right">
									<div class="form-group">
										<label class="control-label">Date</label>
										<br/>
										<?php echo date("d-m-Y"); ?>
									</div>
					<span style="color: red;"><?php if($chkdate == 'Not Found'){  ?>
					You are not in Current Financial Year
				<?php } ?></span>				
					</div>
				</div><br/>
				
				<div class="row" style="display:none;">
						<div class="form-group">
							<label class="control-label">Invoice Booking No. <span class="required" aria-required="true">*</span></label>
							<div class="row">
								<div class="col-md-3">
									<?php echo $this->Form->input('ib1', ['label' => false,'class' => 'form-control input-sm','readonly','value'=>@$grn->company->alias]); ?>
								</div>
								<div class="col-md-3">
									<?php echo $this->Form->input('ib2', ['label' => false,'class' => 'form-control input-sm', 'value'=>@$last_ib_no->ib2, 'readonly']); ?>
								</div>
								<div class="col-md-3">
									<?php echo $this->Form->input('ib3', ['label' => false,'class' => 'form-control input-sm','placeholder'=>'File', 'value'=>@$grn->grn3,'readonly']); ?>
								</div>
								<div class="col-md-3">
									<?php echo $this->Form->input('ib4', ['label' => false,'value'=>substr($s_year_from, -2).'-'.substr($s_year_to, -2),'class' => 'form-control input-sm','readonly']); ?>
								</div>
								<?php echo $this->Form->input('vendor_id', ['label' => false,'class' => 'form-control input-sm','type' =>'hidden','value'=>@$grn->vendor_id]); ?>
							</div>
						</div>
				</div>
				<div class="row">
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">Supplier Invoice Date. <span class="required" aria-required="true">*</span></label>
								<?php echo $this->Form->input('supplier_date', ['type'=>'text','label' => false,'class' => 'form-control input-sm date-picker','placeholder'=>'Supplier Date','data-date-format'=>'dd-mm-yyyy','data-date-start-date' => '-60d','data-date-end-date' => '0d']); ?>
							
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">Invoice No. <span class="required" aria-required="true">*</span></label>
							<?php echo $this->Form->input('invoice_no', ['type' => 'text','label' => false,'class' => 'form-control input-sm','placeholder' => 'Invoice NO']); ?>
							<br/>
							<? ?>
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">Purchase Account <span class="required" aria-required="true">*</span></label>
							<?php echo $this->Form->input('purchase_ledger_account', ['options' => $ledger_account_details,'label' => false,'class' => 'form-control input-sm']); ?>
							<br/>
							<? ?>
						</div>
					</div>
				</div>
				
				<table class="table tableitm" id="main_tb">
				<thead>
					<tr>
						<th width="50">Sr.No. </th>
						<th width="170">Items</th>
						<th width="100">Unit Rate From PO</th>
						<th width="70">Discount</th>
						<th  width="100">Excise Duty</th>
						<th  width="70" >CST</th>
						<th  width="70" >total rate</th>
						<th  width="100">P & F</th>
						<th>Quantity</th>
						<th>Rate</th>
						<th>Amount</th>
						
					</tr>
				</thead>

				
				
				<tbody>
					<?php $total=0; $sum=0;
					$q=0; foreach ($grn->grn_rows as $grn_rows): ?>
						<tr class="tr1" row_no='<?php echo @$grn_rows->id; ?>'>
							<td rowspan="2"><?php echo ++$q; --$q; ?></td>
							<?php
							$dis=($discount*$grn->purchase_order->purchase_order_rows[$q]->amount)/$grn->purchase_order->total;
							$item_discount=$dis/$grn->purchase_order->purchase_order_rows[$q]->quantity;
							
							$item_rate=$grn->purchase_order->purchase_order_rows[$q]->amount-$dis;
							$total_sale=($tot_sale_tax*$item_rate)/$item_total_rate;
							$item_sale=$total_sale/$grn->purchase_order->purchase_order_rows[$q]->quantity;
							
						
							$excise_duty_discount=($excise_duty*$item_rate)/$item_total_rate;
							$total_exicese_duty=$excise_duty_discount/$grn->purchase_order->purchase_order_rows[$q]->quantity;
							
							?>
							<td><?php echo $grn_rows->item->name; ?>
							<?php echo $this->Form->input('invoice_booking_rows.'.$q.'.item_id', ['label' => false,'class' => 'form-control input-sm','type'=>'hidden','value' => @$grn_rows->item->id,'popup_id'=>$q]); ?>
							</td>
							<td><?php echo $this->Form->input('invoice_booking_rows.'.$q.'.rate',['value'=>$grn->purchase_order->purchase_order_rows[$q]->rate,'type'=>'hidden']);
							echo $grn->purchase_order->purchase_order_rows[$q]->rate;  ?></td>
							<td><?php echo $this->Form->input('invoice_booking_rows.'.$q.'.discount',['value'=>$dis,'type'=>'hidden']);
							echo $this->Number->format($dis,[ 'places' => 2]);?></td>
								
							<td><?php echo $this->Form->input('invoice_booking_rows.'.$q.'.excise_duty',['value'=>$excise_duty_discount,'type'=>'hidden']);
								echo $this->Number->format($excise_duty_discount,[ 'places' => 2]);  ?></td>
							<td><?php echo $this->Form->input('invoice_booking_rows.'.$q.'.sale_tax',['value'=>$total_sale,'type'=>'hidden']);
								echo $this->Number->format($total_sale,[ 'places' => 2]);?></td>
							<td><?php echo $this->Form->input('invoice_booking_rows.'.$q.'.total_rate',['value'=>$grn->purchase_order->purchase_order_rows[$q]->rate-$item_discount+$item_sale+$total_exicese_duty,'type'=>'hidden']);
							echo $this->Number->format($grn->purchase_order->purchase_order_rows[$q]->rate-$item_discount+$item_sale+$total_exicese_duty,[ 'places' => 2]);?></td>
							<td><?php echo $this->Form->input('invoice_booking_rows.'.$q.'.pnf',['label' => false,'class' => 'form-control input-sm required','id'=>'update_pnf','type'=>'text','placeholder' => 'pnf','value'=>0]); ?></td>
							<td><?php echo $this->Form->input('invoice_booking_rows.'.$q.'.quantity',['label' => false,'class' => 'form-control input-sm', 'value'=>$grn_rows->quantity,'readonly','type'=>'text']); ?></td>
							
							<td><?php echo $this->Form->input('invoice_booking_rows.'.$q.'.rate',['label' => false,'class' => 'form-control input-sm','type'=>'text']); ?></td>
							<td><?php echo $this->Form->input('invoice_booking_rows.'.$q.'.amount',['label' => false,'class' => 'form-control input-sm','value'=>$grn->purchase_order->purchase_order_rows[$q]->rate*$grn_rows->quantity,'type'=>'text']); ?></td>

							
						</tr>
						<tr class="tr2" row_no='<?php echo @$grn_rows->id; ?>'>
							<td colspan="9">
							<?php echo $this->Text->autoParagraph(h($grn->purchase_order->purchase_order_rows[$q]->description)); ?>
							<?php echo $this->Form->input('invoice_booking_rows.'.$q.'.description',['label' => false,'class' => 'form-control input-sm','type'=>'hidden','value'=>$grn->purchase_order->purchase_order_rows[$q]->description]); ?>
							</td>
							<td></td>
						</tr>
					
					<tr>
						 
					
				    
					</tr>

					<?php $q++; $total=$total+$sum; endforeach; ?>

				</tbody>
				<tfoot>
					<tr>
						<td colspan="9" align="right"><b>Total</b></td>
						<td><?php echo $this->Form->input('total', ['type' => 'text','label' => false,'class' => 'form-control input-sm','placeholder' => 'Total']); ?></td>
						</td>
					</tr>
				</tfoot>
			</table>
			
		</div>
		
		<div class="row">
				<div class="col-md-12">
					<div class="form-group">
					<?php echo $this->Form->button('<i class="fa fa-plus"></i> New Ref', ['label' => false,'class' => 'btn btn-primary new_ref','type'=>'button']); ?>
					<?php echo $this->Form->button('<i class="fa fa-plus"></i> Agst Ref', ['label' => false,'class' => 'btn btn-primary agst_ref','type'=>'button']); ?>
					<?php echo $this->Form->button('<i class="fa fa-plus"></i> Advance', ['label' => false,'class' => 'btn btn-primary adv_ref','type'=>'button']); ?>
					</div>
				</div>
		</div>
		<div class="row">
				<div class="col-md-12">
					<table class="table table-bordered" id="main_table" style="text-align:center;">
					<thead>
					<tr>
					<td>Ref. Type</td>
					<td>Ref. No.</td>
					<td>Amount</td>
					<td></td>
					</tr>
					</thead>
					<tbody>
					</tbody>
					</table>
				</div>
		</div>
				<?php echo $this->Form->input('bill_to_bill', ['label' => false,'class' => 'form-control input-sm','type'=>'text','id'=>'bill_to_bill','style'=>'height:0px; border:none; widht:0px;']); ?>
		<div id="bill_to_bill_show" style="display:none;">
				<table width="100%">
					<tr>
						<td width="45%" valign="top" id="pending_invpice_container"></td>
						<td></td>
						
						
					</tr>
				</table>
				
		</div>
		<div class="form-actions">
						<div class="row">
							<div class="col-md-3">
									<?php if($chkdate == 'Not Found'){  ?>
					<label class="btn btn-danger"> You are not in Current Financial Year </label>
				<?php } else { ?>
					<?= $this->Form->button(__('BOOK INVOICE'),['class'=>'btn btn-primary','id'=>'add_submit','type'=>'Submit']) ?>
				<?php } ?>	
								
						</div>
				</div>
		</div>
	</div>	
	
	<?php } ?> <?= $this->Form->end() ?>
			
</div>	

<table class="table table-bordered" id="new_ref" style="display:none;">
			<tbody>
			<tr>
			<td>New Ref<?= $this->Form->hidden('reference_type[]',['class'=>'','label'=>false, 'value'=>'New Reference']) ?></td>
			<td><?= $this->Form->input('reference_no[]',['type'=>'text','class'=>'form-control distinctreference','label'=>false,'id'=>'reference_no_2']) ?></td>
			<td><?= $this->Form->input('debit[]',['type'=>'text','class'=>'form-control ','label'=>false, 'value'=>0]) ?></td>
			<td><?= $this->Form->button(__('<i class="fa fa-trash-o"></i>'),['type'=>'button','class'=>'btn btn-danger btn-sm remove_row','label'=>false]) ?></td>
			</tr>
			</tbody>
</table>
<table class="table table-bordered" id="agst_ref" style="display:none;">
		<tbody>
			<tr class="against_references_no">
			<td>Agst Ref<?= $this->Form->hidden('reference_type[]',['class'=>'','label'=>false, 'value'=>'Against Reference']) ?><?= $this->Form->hidden('reference_no[]',['type'=>'text','class'=>'form-control ','label'=>false,'id'=>'reference_no_2']) ?></td>
			<td id="against_references_no"></td>
			<td><?= $this->Form->input('debit[]',['type'=>'text','class'=>'form-control ','label'=>false, 'value'=>0]) ?></td>
			<td><?= $this->Form->button(__('<i class="fa fa-trash-o"></i>'),['type'=>'button','class'=>'btn btn-danger btn-sm remove_row','label'=>false]) ?></td>
			</tr>
			</tbody>
</table>
<table class="table table-bordered" id="adv_ref" style="display:none;">
		<tbody>
			<tr>
			<td>Adv Ref<?= $this->Form->hidden('reference_type[]',['class'=>'','label'=>false, 'value'=>'Advance Reference']) ?></td>
			<td><?= $this->Form->input('reference_no[]',['type'=>'text','class'=>'form-control distinctreference','label'=>false,'id'=>'reference_no_2']) ?></td>
			<td><?= $this->Form->input('debit[]',['type'=>'text','class'=>'form-control ','label'=>false, 'value'=>0]) ?></td>
			<td><?= $this->Form->button(__('<i class="fa fa-trash-o"></i>'),['type'=>'button','class'=>'btn btn-danger btn-sm remove_row','label'=>false]) ?></td>
			</tr>
			</tbody>
</table>		

<style>
.table thead tr th {
    color: #FFF;
	background-color: #254b73;
}
</style>
<?php echo $this->Html->css('/drag_drop/jquery-ui.css'); ?>
<?php echo $this->Html->script('/drag_drop/jquery-1.12.4.js'); ?>
<?php echo $this->Html->script('/drag_drop/jquery-ui.js'); ?>
<?php echo $this->Html->script('/assets/global/plugins/jquery.min.js'); ?>

<script>
$(document).ready(function() {
	
	
   calculate_total();
	$('#main_tb input').die().live("keyup",function() { 
		calculate_total();
    });
	function calculate_total(){
		var total=0;
		$("#main_tb tbody tr.tr1").each(function(){
			var unit=$(this).find("td:nth-child(9) input").val();
			var Rate=$(this).find("td:nth-child(10) input").val();
			var Amount=unit*Rate;
			$(this).find("td:nth-child(11) input").val(Amount.toFixed(2));
			total=total+Amount;
		});
		$('input[name="total"]').val(total.toFixed(2));
	}
	
	$( document ).on( 'keyup', 'input[name="debit[]"]', function() {
			var debit=parseFloat($(this).val());
			var amount=$(this).closest('tr').find('select[name="against_references_no"] option:selected').attr('amount');
			amount=parseFloat(amount);

			if(amount<debit)
			{
				$(this).val(amount);
			}
				
	});
	
	$('select[name="against_references_no"]').live("change",function() {
		var against_references_no=$(this).val();
		var amount=eval($('option:selected',this).attr('amount'));
		
		$(this).closest('tr').find('input[name="reference_no[]"]').val(against_references_no);
		$(this).closest('tr').find('input[name="debit[]"]').val(amount);
	});
	
	var received_from_id=$(this).find('input[name="vendor_ledger_id"]').val();
		
	//alert(received_from_id); 
		var url="<?php echo $this->Url->build(['controller'=>'InvoiceBookings','action'=>'fetchReferenceNo']); ?>";
		url=url+'/'+received_from_id,
		
		$.ajax({
			url: url,
			type: 'GET',
			dataType: 'text'
		}).done(function(response) { 
			$("#main_table tbody").find('tr.against_references_no').remove();
			if(!response)
			{
				$('#agst_ref').remove();
			}
			$('#against_references_no').html(response);
		});
	
	
	$('input[name="amount"],[name^=debit]').live("blur",function() {
		var val=$(this).val();
		$(this).val(parseFloat($(this).val()).toFixed(2));
	});
	

	
	$( document ).on( 'click', '.new_ref', function() {
		var new_line=$('#new_ref tbody').html();
		$("#main_table tbody").append(new_line);
		var i=1;
		var len=$("[name^=reference_no]").length;
		
		$("[name^=reference_no]").each(function () {
			
			$(this).attr('id','reference_no_'+i);
			
			$(this).rules("add", {
				required: true,
				noSpace: true,
				notEqualToGroup: ['.distinctreference']
			});
			i++;
		});
	});
	$( document ).on( 'click', '.agst_ref', function() {
		var new_line=$('#agst_ref tbody').html();
		$("#main_table tbody").append(new_line);
		var i=1;
		var len=$("[name^=reference_no]").length;
		
		$("[name^=reference_no]").each(function () {
			
			$(this).attr('id','reference_no_'+i);
			
			$(this).rules("add", {
				required: true,
				noSpace: true,
				notEqualToGroup: ['.distinctreference']
			});
			i++;
		});
	});
	$( document ).on( 'click', '.adv_ref', function() {
		var new_line=$('#adv_ref tbody').html();
		$("#main_table tbody").append(new_line);
		var i=1;
		var len=$("[name^=reference_no]").length;
		
		$("[name^=reference_no]").each(function () {
			
			$(this).attr('id','reference_no_'+i);
			
			$(this).rules("add", {
				required: true,
				noSpace: true,
				notEqualToGroup: ['.distinctreference']
			});
			i++;
		});
	});
	$( document ).on( 'click', '.remove_row', function() {
		$(this).closest("#main_table tr").remove();
		var i=1;
		var len=$("[name^=reference_no]").length;
		
		$("[name^=reference_no]").each(function () {
			
			$(this).attr('id','reference_no_'+i);
			
			$(this).rules("add", {
				required: true,
				noSpace: true,
				notEqualToGroup: ['.distinctreference']
			});
			i++;
		});
	});
	
	$('#main_tb input').die().live("keyup",function() { 
	calculate_total_after_pnf();
	});
	function calculate_total_after_pnf(){
		var total=0;  var Amount=0; var pnf_cal=0;  var qty=0;
		$("#main_tb tbody tr.tr1").each(function(){
			var total_rate=parseFloat($(this).find("td:nth-child(7) input").val());
			var pnf_cal=parseInt($(this).find("td:nth-child(8) input").val());
			var qty=parseInt($(this).find("td:nth-child(9) input").val());
			if(isNaN(pnf_cal)) { var pnf_cal = 0; }
			var Amount=total_rate+pnf_cal;
			$(this).find("td:nth-child(10) input").val(Amount.toFixed(2));
			total=Amount*qty;
			$(this).find("td:nth-child(11) input").val(total.toFixed(2));
		});
		calculate_total();
	}
	
	////////////////  Validation  ////////////////////////
	
	jQuery.validator.addMethod("noSpace", function(value, element) { 
	  return value.indexOf(" ") < 0 && value != ""; 
	}, "No space please and don't leave it empty");
	
	jQuery.validator.addMethod("notEqualToGroup", function (value, element, options) {
    // get all the elements passed here with the same class
    var elems = $(element).parents('form').find(options[0]);
    // the value of the current element
    var valueToCompare = value;
    // count
    var matchesFound = 0;
    // loop each element and compare its value with the current value
    // and increase the count every time we find one
    jQuery.each(elems, function () {
        thisVal = $(this).val();
        if (thisVal == valueToCompare) {
            matchesFound++;
        }
    });
    // count should be either 0 or 1 max
    if (this.optional(element) || matchesFound <= 1) {
        //elems.removeClass('error');
        return true;
    } else {
        //elems.addClass('error');
    }
}, jQuery.format("Please enter a Unique Value."));


	//--------- FORM VALIDATION
	var form3 = $('#form_sample_3');	
	var error3 = $('.alert-danger', form3); 
	var success3 = $('.alert-success', form3); 
	form3.validate({  
		errorElement: 'span', //default input error message container
		errorClass: 'help-block help-block-error', // default input error message class
		focusInvalid: true, // do not focus the last invalid input
		ignore: ":hidden",
		rules: {
			advance: {
				min:0,
			},
			pnf: {
				required: true,
			},
			cheque_no :{
				required: true,
			},
			'reference_no[]':{
					required: true,
					noSpace: true,
					notEqualToGroup: ['.distinctreference'],
					remote : {
                    url: '<?php echo $this->Url->build(['controller'=>'Ledgers','action'=>'check_reference_no']); ?>',
                    type: "get",
                    data:
                        {
                            ledger_account_id: function(){return $('input[name=vendor_ledger_id]').val();}
                        },
					},
				}
		},
		messages: {
			'reference_no[]': {
				remote: "Reference no. is alredy taken."
			},
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
			$("#add_submit").removeAttr("disabled");
			//Metronic.scrollTo(error3, -200);
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
			var amount=parseFloat($('input[name="total"]').val());
			
		
				var debit=0;
				$("[name^=debit]").each(function () {
					debit=debit+parseFloat($(this).val());
				});
				
				if(amount==debit)
				{
					success3.show();
					error3.hide();
					form[0].submit();
				}
				else
				{
					$("#add_submit").removeAttr("disabled");
					alert("Amount mismatch.");
				}
				
			
			// // submit the form
		}

	});

	
	
	


});

</script>


