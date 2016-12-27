<?php //pr($journalVoucher->journal_voucher_rows); exit; ?>
<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption" >
			<i class="icon-globe font-blue-steel"></i>
			<span class="caption-subject font-blue-steel uppercase">Edit Journal Voucher</span>
		</div>
	</div>
	<div class="portlet-body form">
		<!-- BEGIN FORM-->
		 <?= $this->Form->create($journalVoucher,['type' => 'file','id'=>'form_sample_3']) ?>
			<div class="form-body">
			<div class="row">
				<div class="col-md-4" >
						<div class="form-group">
						<label class=" control-label">Transaction Date<span class="required" aria-required="true">*</span></label>
							<?php echo $this->Form->input('transaction_date', ['type' => 'text','label' => false,'class' => 'form-control input-sm date-picker','data-date-format' => 'dd-mm-yyyy','value' => date("d-m-Y",strtotime($journalVoucher->transaction_date))]); ?>
						
						</div>
				</div>
				<div class="col-md-5">
				</div>
				<div class="col-md-3">
					<div class="form-group">
						<label class="col-md-3 control-label">Date</label>
						<div class="col-md-9">
							<?php echo $this->Form->input('edited_on', ['type' => 'text','label' => false,'class' => 'form-control input-sm','value' => date("d-m-Y"),'readonly']); ?>
						</div>
					</div>
				</div>
			</div>
			<table class="table tableitm" id="main_tb">
				<thead>
					<tr>
						<th width="400">Ledger Account</th>
						<th width="200">Debit/Credit</th>
						<th width="200">Amount</th>
						<th></th>
					</tr>
				</thead>
				<tbody id="main_tbody">
				<?php 	$q=0; foreach ($journalVoucher->journal_voucher_rows as $journal_voucher_rows): ?>
					<tr>
						<td width="400" >
							<div class="row">
								<div class="col-md-11 padding-right-decrease">
									<?php echo $this->Form->input('journal_voucher_rows['.$q.'][ledger_account_id]', ['empty'=>'Select','options' => $ledgers,'label' => false,'class' => 'form-control input-sm','placeholder' => 'Item', 'value'=>$journal_voucher_rows->ledger_account_id]); ?>
								</div>

							</div>
						</td>
						<td width="200">
							<div class="row">
								<div class="col-md-11 padding-right-decrease">
									<?php 
									$options=['Dr'=>'Dr','Cr'=>'Cr'];
									echo $this->Form->input('journal_voucher_rows['.$q.'][cr_dr]', ['options' => $options,'label' => false,'class' => 'form-control input-sm  ','placeholder' => 'Item','value'=>$journal_voucher_rows->cr_dr]); ?>
								</div>

							</div>
						</td>
						
						<td width="200"><?php echo $this->Form->input('journal_voucher_rows['.$q.'][amount]', ['type' => 'number','label' => false,'class' => 'form-control input-sm rate', 'min'=>'0.01','placeholder' => 'Amount','value'=>$journal_voucher_rows->amount]); ?></td>
						<td  width="70"><a class="btn btn-xs btn-default addrow" href="#" role='button'><i class="fa fa-plus"></i></a><a class="btn btn-xs btn-default deleterow" href="#" role='button'><i class="fa fa-times"></i></a>
						</td>
					</tr>


				<?php $q++; endforeach ?>
				
				</tbody>
				<tfoot>
					<tr>
						<td><?php echo $this->Form->textarea('narration', ['type' => 'text','label' => false,'class' => 'form-control input-sm','placeholder' => 'Narration']); ?></td>
						<td id="drAmount" width="80"><label>Total Dr</label><?php echo $this->Form->input('debitamount', ['type' => 'text','label' => false,'class' => 'form-control input-sm','readonly']); ?></td>
					
						<td align="left" id="crAmount" align="right"><label>Total Cr</label><?php echo $this->Form->input('creditamount', ['type' => 'text','label' => false,'class' => 'form-control input-sm','readonly']); ?></td>
						
					</tr>
				</tfoot>
			</table>
			
			
				
			</div>
			<div class="form-actions">
				<button type="submit" class="btn btn-primary">ADD VOUCHER REFERENCE</button>
			</div>
		</div>
		<?= $this->Form->end() ?>
		<!-- END FORM-->
	</div>


<style>
.table thead tr th {
    color: #FFF;
	background-color: #254b73;
}
.padding-right-decrease{
	padding-right: 0;
}
.padding-left-decrease{
	padding-left: 0;
}
</style>

<table id="sample_tb" style="display:none;">
	<tbody >
		<tr>
			<td>
				<div class="row" width="400">
					<div class="col-md-11 padding-right-decrease">
						<?php echo $this->Form->input('ledger_account_id', ['empty'=>'Select','options' => $ledgers,'label' => false,'class' => 'form-control input-sm','placeholder' => 'Item']); ?>
					</div>

				</div>
			</td>
			<td width="200">
				<div class="row">
					<div class="col-md-11 padding-right-decrease">
						<?php 
						$options=['Dr'=>'Dr','Cr'=>'Cr'];
						echo $this->Form->input('cr_dr', ['options' => $options,'label' => false,'class' => 'form-control input-sm  ','placeholder' => 'Item']); ?>
					</div>

				</div>
			</td>
			
			<td width="200"><?php echo $this->Form->input('amount', ['type' => 'number','label' => false,'class' => 'form-control input-sm rate', 'min'=>'0.01','placeholder' => 'Rate']); ?></td>
			<td><a class="btn btn-xs btn-default addrow" href="#" role='button'><i class="fa fa-plus"></i></a><a class="btn btn-xs btn-default deleterow" href="#" role='button'><i class="fa fa-times"></i></a></td>
		</tr>
	
	</tbody>
	
</table>

<div id="terms_conditions" style="display:none;"></div>
<?php echo $this->Html->script('/assets/global/plugins/jquery.min.js'); ?>
<style>
#sortable li{
	cursor: -webkit-grab;
}
</style>
<?php echo $this->Html->css('/drag_drop/jquery-ui.css'); ?>
<?php echo $this->Html->script('/drag_drop/jquery-1.12.4.js'); ?>
<?php echo $this->Html->script('/drag_drop/jquery-ui.js'); ?>

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
				debitamount:{
					
				},
				creditamount:{
					
					equalTo: "#debitamount",
					
				}
			},
		messages: {
			creditamount:{
					equalTo: "Must be equal to Debit Amount",
					
				}
		}


		
	});
	//--	 END OF VALIDATION
	
	calculate_total();
	
    $('.addrow').die().live("click",function() {
		add_row();
	});		
		

	function add_row(){
		
		var tr1=$("#sample_tb tbody tr").clone();
		$("#main_tb tbody#main_tbody").append(tr1);
		
		var i=0;
		$("#main_tb tbody tr").each(function(){
			i++;
			$(this).find("td:nth-child(1) select").attr({name:"journal_voucher_rows["+i+"][ledger_account_id]", id:"journal_voucher_rows-"+i+"-ledger_account_id",}).select2().rules("add", "required");
			$(this).find("td:nth-child(2) select").attr({name:"journal_voucher_rows["+i+"][cr_dr]", id:"journal_voucher_rows-"+i+"-cr_dr",}).select2().rules("add", "required");
			$(this).find("td:nth-child(3) input").attr({name:"journal_voucher_rows["+i+"][amount]", id:"journal_voucher_rows-"+i+"-amount"}).rules("add", "required");
	
		});
	}
	
	
		$('.deleterow').die().live("click",function() {
		var l=$(this).closest("table tbody").find("tr").length;
		if (confirm("Are you sure to remove row ?") == true) {
			if(l>2){
				var row_no=$(this).closest("tr").remove();
						
				var i=0;
				$("#main_tb tbody tr").each(function(){
							i++;
								$(this).find("td:nth-child(1) select").attr({name:"journal_voucher_rows["+i+"][ledger_account_id]", id:"journal_voucher_rows-"+i+"-ledger_account_id",}).select2().rules("add", "required");
								$(this).find("td:nth-child(2) select").attr({name:"journal_voucher_rows["+i+"][cr_dr]", id:"journal_voucher_rows-"+i+"-cr_dr",}).select2().rules("add", "required");
								$(this).find("td:nth-child(3) input").attr({name:"journal_voucher_rows["+i+"][amount]", id:"journal_voucher_rows-"+i+"-amount"}).rules("add", "required");
						});		
				calculate_total();
			}
		} 
    });	
	
	$('#main_tb input').die().live("keyup","blur",function() { 
	calculate_total();
		});
	
	$('#main_tb select').die().live("change",function() { 
	calculate_total();
		});
	
	function calculate_total(){
		var drAmount=0; var crAmount=0; 
		$("#main_tb tbody tr").each(function(){
			var dr_cr=$(this).find("td:nth-child(2) select option:selected").val();
			var Amount=parseFloat($(this).find("td:nth-child(3) input").val());
			if(!Amount){ Amount=0; }
			if(dr_cr=="Dr"){
				drAmount=drAmount+Amount;
			}else if(dr_cr=="Cr"){
				crAmount=crAmount+Amount;
			}
		});
		$('#debitamount').val(drAmount.toFixed(2));
		$('#creditamount').val(crAmount.toFixed(2));
	}
	
});
</script>