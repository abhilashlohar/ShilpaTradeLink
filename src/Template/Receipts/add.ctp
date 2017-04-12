<style>
table > thead > tr > th, table > tbody > tr > th, table > tfoot > tr > th, table > thead > tr > td, table > tbody > tr > td, table > tfoot > tr > td{
	vertical-align: top !important;
	border-bottom:solid 1px #CCC;
}
.page-content-wrapper .page-content {
    padding: 5px;
}
.portlet.light {
    padding: 4px 10px 4px 10px;
}
</style>
<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption" >
			<i class="icon-globe font-blue-steel"></i>
			<span class="caption-subject font-blue-steel uppercase">Add Receipt</span>
		</div>
	</div>
	<div class="portlet-body form">
    <?= $this->Form->create($receipt) ?>
        <div class="row">
			<div class="col-md-3">
				<div class="form-group">
					<label class="control-label">Transaction Date<span class="required" aria-required="true">*</span></label>
					<?php echo $this->Form->input('transaction_date', ['type' => 'text','label' => false,'class' => 'form-control input-sm date-picker','data-date-format' => 'dd-mm-yyyy','value' => date("d-m-Y"),'data-date-start-date' => date("d-m-Y",strtotime($financial_year->date_from)),'data-date-end-date' => date("d-m-Y",strtotime($financial_year->date_to))]); ?>
				</div>
			</div>
			<div class="col-md-3">
				<div class="form-group">
					<label class="control-label">Bank/Cash Account<span class="required" aria-required="true">*</span></label>
					<?php echo $this->Form->input('bank_cash_id', ['empty'=>'--Select-','label' => false,'class' => 'form-control input-sm select2me']); ?>
				</div>
			</div>
			<div class="col-md-3">
				<div class="form-group">
					<label class="control-label">Mode of Payment<span class="required" aria-required="true">*</span></label>
					<div class="radio-list">
						<div class="radio-inline" >
						<?php echo $this->Form->radio(
							'payment_mode',
							[
								['value' => 'Cheque', 'text' => 'Cheque','checked'],
								['value' => 'Cash', 'text' => 'Cash'],
								['value' => 'NEFT/RTGS', 'text' => 'NEFT/RTGS']
							]
						); ?>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="form-group" id="chq_no">
					<label class="control-label">Cheque No<span class="required" aria-required="true">*</span></label>
					<?php echo $this->Form->input('cheque_no', ['label' => false,'class' => 'form-control input-sm','placeholder'=>'Cheque No']); ?>
				</div>
			</div>
		</div>
		
		<div style="overflow: auto;">
		<table width="100%" id="main_table">
			<thead>
				<th width="25%"><label class="control-label">Received From</label></th>
				<th width="15%"><label class="control-label">Amunt</label></th>
				<th></th>
				<th width="15%"><label class="control-label">Narration</label></th>
				<th width="3%"></th>
			</thead>
			<tbody id="main_tbody">
			
			</tbody>
			<tfoot>
			
			</tfoot>
		</table>
		</div>
		<a class="btn btn-xs btn-default addrow" href="#" role="button"><i class="fa fa-plus"></i> Add row</a>
    <?= $this->Form->button(__('Submit')) ?>
    <?= $this->Form->end() ?>
	</div>
</div>
<?php echo $this->Html->script('/assets/global/plugins/jquery.min.js'); ?>

<script>
$(document).ready(function() {
	$('input[name="payment_mode"]').die().live("click",function() {
		var payment_mode=$(this).val();
		
		if(payment_mode=="Cheque"){
			$("#chq_no").show();
		}else{
			$("#chq_no").hide();
		}
	});
	
	add_row();
	function add_row(){
		var tr=$("#sample_table tbody tr").clone();
		$("#main_table tbody#main_tbody").append(tr);
		rename_rows();
	}
	
	function rename_rows(){
		var i=0;
		$("#main_table tbody#main_tbody tr.main_tr").each(function(){
			$(this).find("td:eq(0) select.received_from").select2().attr({name:"receipt_rows["+i+"][received_from_id]", id:"quotation_rows-"+i+"-received_from_id"});
			$(this).find("td:nth-child(2) input").attr({name:"receipt_rows["+i+"][amount]", id:"quotation_rows-"+i+"-amount"});
			$(this).find("td:nth-child(4) textarea").attr({name:"receipt_rows["+i+"][narration]", id:"quotation_rows-"+i+"-narration"});
			i++;
		});
	}
	
	$('.addrow').live("click",function() {
		add_row();
	});
	$('.deleterow').live("click",function() {
		$(this).closest("tr").remove();
	});
	
	$('.addrefrow').live("click",function() {
		var sel=$(this).closest('tr.main_tr');
		var received_from_id=$(this).closest('tr.main_tr').find('td:nth-child(1) select').val();
		add_ref_row(sel,received_from_id);
	});
	
	function add_ref_row(sel,received_from_id){
		var tr=$("#sample_ref table.ref_table tbody tr").clone();
		sel.find("table.ref_table tbody").append(tr);
		rename_ref_rows(sel,received_from_id);
	}
	
	function rename_ref_rows(sel,received_from_id){
		var i=0;
		$(sel).find("table.ref_table tbody tr").each(function(){
			$(this).find("td:nth-child(1) select").attr({name:"ref_rows["+received_from_id+"]["+i+"][ref_type]", id:"ref_rows-"+i+"-ref_type"});
			var is_select=$(this).find("td:nth-child(2) select").length;
			var is_input=$(this).find("td:nth-child(2) input").length;
			if(is_select){
				$(this).find("td:nth-child(2) select").attr({name:"ref_rows["+received_from_id+"]["+i+"][ref_no]", id:"ref_rows-"+i+"-ref_no"});
			}else if(is_input){
				$(this).find("td:nth-child(2) input").attr({name:"ref_rows["+received_from_id+"]["+i+"][ref_no]", id:"ref_rows-"+i+"-ref_no"});
			}
			
			$(this).find("td:nth-child(3) input").attr({name:"ref_rows["+received_from_id+"]["+i+"][amount]", id:"ref_rows-"+i+"-amount"});
			i++;
		});
	}
	
	$('.deleterefrow').live("click",function() {
		$(this).closest("tr").remove();
	});
	
	$('.received_from').live("change",function() {
		var sel=$(this);
		var sel2=$(this).closest('tr.main_tr');
		var received_from_id=$(this).find('option:selected').val();
		var url="<?php echo $this->Url->build(['controller'=>'LedgerAccounts','action'=>'checkBillToBillAccountingStatus']); ?>";
		url=url+'/'+received_from_id,
		$.ajax({
			url: url,
			type: 'GET',
			dataType: 'text'
		}).done(function(response) {
			if(response.trim()=="Yes"){
				var ref_table=$("#sample_ref div.ref").clone();
				$(sel).closest("tr").find("td:nth-child(3)").html(ref_table);
				rename_ref_rows(sel2,received_from_id);
			}else{
				$(sel).closest("tr").find("td:nth-child(3)").html("");
			}
		});
	});
	
	$('.ref_type').live("change",function() {
		var ref_type=$(this).find('option:selected').val();
		var received_from_id=$(this).closest('tr.main_tr').find('td select:eq(0)').val();
		if(ref_type=="Agst Ref"){
			var url="<?php echo $this->Url->build(['controller'=>'Receipts','action'=>'fetchRefNumbers']); ?>";
			url=url+'/'+received_from_id,
			$.ajax({
				url: url,
				type: 'GET',
			}).done(function(response) {
				alert(response);
			});
		}else if(ref_type=="New Ref" || ref_type=="Advance"){
			
		}
	});
	
});
</script>

<table id="sample_table" style="display:none;">
	<tbody>
		<tr class="main_tr">
			<td><?php echo $this->Form->input('received_from_id', ['empty'=>'--Select-','options'=>$receivedFroms,'label' => false,'class' => 'form-control input-sm received_from']); ?></td>
			<td><?php echo $this->Form->input('amount', ['label' => false,'class' => 'form-control input-sm','placeholder'=>'Amount']); ?></td>
			<td></td>
			<td><?php echo $this->Form->input('narration', ['type'=>'textarea','label' => false,'class' => 'form-control input-sm','placeholder'=>'Narration']); ?></td>
			<td><a class="btn btn-xs btn-default deleterow" href="#" role="button"><i class="fa fa-times"></i></a></td>
		</tr>
	</tbody>
</table>

<?php $ref_types=['New Ref'=>'New Ref','Agst Ref'=>'Agst Ref','Advance'=>'Advance']; ?>
<div id="sample_ref" style="display:none;">
	<div class="ref" style="padding:4px;">
	<table width="100%" class="ref_table">
		<thead>
			<tr>
				<th width="25%">Ref Type</th>
				<th width="40%">Ref No.</th>
				<th width="30%">Amount</th>
				<th width="5%"></th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><?php echo $this->Form->input('ref_types', ['empty'=>'--Select-','options'=>$ref_types,'label' => false,'class' => 'form-control input-sm ref_type']); ?></td>
				<td class="ref_no"></td>
				<td><?php echo $this->Form->input('amount', ['label' => false,'class' => 'form-control input-sm','placeholder'=>'Amount']); ?></td>
				<td><a class="btn btn-xs btn-default deleterefrow" href="#" role="button"><i class="fa fa-times"></i></a></td>
			</tr>
		</tbody>
	</table>
	<a class="btn btn-xs btn-default addrefrow" href="#" role="button"><i class="fa fa-plus"></i> Add row</a>
	</div>
</div>
