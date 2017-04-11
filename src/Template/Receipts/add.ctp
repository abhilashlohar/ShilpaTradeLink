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
			$(this).find("td:nth-child(1) select").select2().attr({name:"receipt_rows["+i+"][received_from_id]", id:"quotation_rows-"+i+"-received_from_id"});
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
	
	var url="<?php echo $this->Url->build(['controller'=>'Receipts','action'=>'checkBillToBillAccountingStatus']); ?>";
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
});
</script>

<table id="sample_table" style="display:none;">
	<tbody>
		<tr class="main_tr">
			<td><?php echo $this->Form->input('received_from_id', ['empty'=>'--Select-','label' => false,'class' => 'form-control input-sm']); ?></td>
			<td><?php echo $this->Form->input('amount', ['label' => false,'class' => 'form-control input-sm','placeholder'=>'Amount']); ?></td>
			<td>ref</td>
			<td><?php echo $this->Form->input('narration', ['type'=>'textarea','label' => false,'class' => 'form-control input-sm','placeholder'=>'Narration']); ?></td>
			<td><a class="btn btn-xs btn-default deleterow" href="#" role="button"><i class="fa fa-times"></i></a></td>
		</tr>
	</tbody>
</table>

