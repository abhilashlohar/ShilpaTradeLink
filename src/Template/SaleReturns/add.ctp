<?php 
if($financial_year_data['Response'] == "Close" ){
 			echo "Financial Year Closed"; 

 		} else { ?>
<style>
table > thead > tr > th, table > tbody > tr > th, table > tfoot > tr > th, table > thead > tr > td, table > tbody > tr > td, table > tfoot > tr > td{
	vertical-align: top !important;
	border-bottom:solid 1px #CCC;
}
.help-block-error{
	font-size: 10px;
}
</style>
<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption">
			<i class="icon-globe font-blue-steel"></i>
			<span class="caption-subject font-blue-steel uppercase">Sale Return</span>
		</div>
	</div>
	<div class="portlet-body form">
		<?= $this->Form->create($saleReturn,['id'=>'form_sample_3']) ?>
		
		<div class="form-body">
			<div class="row">
				<div class="col-md-6">
					<div class="form-group">
						<label class="col-md-4 control-label">Sales Account<span class="required" aria-required="true">*</span></label>
						<div class="col-md-8">
							<?php echo $ledger_account_details->name ?>
							
						</div>
					</div>
				</div>
				<?php 
//pr($ledger_account_details->toArray()); exit;?>
				<div class="col-md-3">
				</div>
				<div class="col-md-3">
					<div class="form-group">
						<label class="col-md-3 control-label">Date</label>
						<div class="col-md-9">
							<?php echo $this->Form->input('date_created', ['type' => 'text','label' => false,'class' => 'form-control input-sm','value' => date("d-m-Y",strtotime($invoice->date_created)),'readonly']); ?>
						</div>
					</div>
				</div>
			</div><br/>
			<div class="row">
				<div class="col-md-6">
					<div class="form-group">
						<label class="col-md-3 control-label">Customer</label>
						<div class="col-md-9">
							<?php echo $this->Form->input('customer_id', ['type'=>'hidden','value' => @$invoice->customer->id]); ?>
							<?php echo $invoice->customer->customer_name.'('; echo $invoice->customer->alias.')'; ?>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label class="col-md-3 control-label">Invoice No.</label>
						<div class="col-md-3 padding-right-decrease">
							<?php echo $this->Form->input('in1', ['label' => false,'class' => 'form-control input-sm','readonly','value' => @$invoice->in1]); ?>
						</div>
						<div class="col-md-3 padding-right-decrease">
							<?php echo @$invoice->in3; ?>
						</div>
						<div class="col-md-3">
							<?php echo $this->Form->input('in4', ['label' => false,'class' => 'form-control input-sm','readonly']); ?>
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
							<?php echo $invoice->customer_address; ?>
							
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label class="col-md-3 control-label">LR No.</label>
						<div class="col-md-9">
							<?php echo $invoice->lr_no; ?>
						</div>
					</div>
					<br/><br/>
					<div class="form-group">
						<label class="col-md-3 control-label">Salesman  <span class="required" aria-required="true">*</span></label>
						<div class="col-md-9">
							<?php echo @$invoice->employee->name; ?>
						</div>
					</div><br/>
					<div class="form-group">
						<label class="col-md-3 control-label">Carrier <span class="required" aria-required="true">*</span></label>
						<div class="col-md-9">
							<?php echo $Transporter->transporter_name; ?>
						</div>
					</div>
				</div>
				</div><br/>
				<div class="row">
				<div class="col-md-6">
				
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label class="col-md-3  control-label">Delivery Description <span class="required" aria-required="true">*</span></label>
						<div class="col-md-9">
						<?php echo $invoice->delivery_description; ?>
						</div>
					</div>
				</div>
				
			</div><br/>
				
			</div><br/>
			<div class="row">
				<div class="col-md-6">
				<div class="form-group">
						<label class="col-md-3 control-label">Customer PO NO  <span class="required" aria-required="true">*</span></label>
						<div class="col-md-9">
							<?php echo $invoice->customer_po_no; ?>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label class="col-md-3 control-label">PO DATE  <span class="required" aria-required="true">*</span></label>
						<div class="col-md-9">
							<?php echo @date("d-m-Y",strtotime($invoice->po_date)); ?>
						</div>
					</div>
				</div>
			</div><br/>
			
						<div class="row">
			<?php if(!empty($invoice->form47)) {?>
				<div class="col-md-6">
				<div class="form-group">
						<label class="col-md-3 control-label">Road Permit No  <span class="required" aria-required="true">*</span></label>
						<div class="col-md-9">
							<?php echo $this->Form->input('form47', ['type' => 'text','label' => false,'class' => 'form-control input-sm','placeholder' => 'Form 47','required']); ?>
						</div>
					</div>
				</div>
			<?php } ?>
				<?php if(!empty($invoice->form49)) {?>
				<div class="col-md-6">
				<div class="form-group">
						<label class="col-md-3 control-label">Form 49 <span class="required" aria-required="true">*</span></label>
						<div class="col-md-9">
							<?php echo $this->Form->input('form49', ['type' => 'text','label' => false,'class' => 'form-control input-sm','placeholder' => 'Form 49','required']); ?>
						</div>
					</div>
				</div>
				<?php } ?>
			</div><br/>
			
			<input type="text"  name="checked_row_length" id="checked_row_length" style="height: 0px;padding: 0;border: none;" />
			<table class="table tableitm" id="main_tb">
				<thead>
					<tr>
						<th width="50">Sr.No. </th>
						<th>Items</th>
						<th width="130">Quantity</th>
						<th width="130">Rate</th>
						<th width="130">Amount</th>
						<th width="130">Sale Tax</th>
						<th width="70"></th>
					</tr>
				</thead>
				<tbody>
					<?php 
					$q=0; 
					foreach ($invoice->invoice_rows as $invoice_row){  ?>
						<tr class="tr1" row_no="<?= h($q) ?>">
							<td ><?php echo ++$q; ?></td>
							<td>
								<?php 
								echo $this->Form->input('sale_return_rows.'.$q.'.item_id', ['type'=>'hidden','value'=>$invoice_row->item_id]);
								echo $invoice_row->item->name;
								?>
							</td>
							<td>
								<?php  
								echo $this->Form->input('sale_return_rows.'.$q.'.quantity', ['type' => 'text','label' => false,'class' => 'form-control input-sm quantity','placeholder' => 'Quantity','value' => @$invoice_row->quantity]); 
								?>
								<span>Max: <?= h($invoice_row->quantity) ?></span>
							</td>
							<td>
								<?php echo $this->Form->input('sale_return_rows.'.$q.'.rate', ['type' => 'text','label' => false,'class' => 'form-control input-sm','readonly','placeholder' => 'Rate','step'=>0.01,'value'=>$invoice_row->rate]); ?>
							</td>
							<td>
								<?php echo $this->Form->input('sale_return_rows.'.$q.'.amount', ['type' => 'text','label' => false,'class' => 'form-control input-sm','readonly','placeholder' => 'Amount','step'=>0.01,'value'=>$invoice_row->amount]); ?>
							</td>
							<td>
								<?php echo @$invoice->sale_tax->tax_figure; ?>
							</td>
							<td>
								
								
							</td>
						</tr>
						
						
						<?php $options1=[]; $choosen=[];
						pr(@$ItemSerialNumber[@$invoice_row->item_id]);exit;
							if(sizeof(@$ItemSerialNumber[@$invoice_row->item_id])>0){
								foreach($ItemSerialNumber[@$invoice_row->item_id] as $item_serial_number){
									if($item_serial_number->status=="Out"){
										$choosen[]=$item_serial_number->id;
									}
									$options1[]=['text' =>$item_serial_number->serial_no, 'value' => $item_serial_number->id];
								} 
							}else if(sizeof(@$ItemSerialNumber2[@$invoice_row->item_id])>0){
								foreach($ItemSerialNumber2[@$invoice_row->item_id] as $item_serial_number){
									$options1[]=['text' =>$item_serial_number->serial_no, 'value' => $item_serial_number->id];
								} 
							}
							if($invoice_row->item->item_companies[0]->serial_number_enable==1) { ?>
							<tr class="tr3" row_no="<?= h($q) ?>">
							<td></td>
							<td colspan="6">
							<?php echo $this->Form->input('q', ['label'=>false,'options' => $options1,'multiple' => 'multiple','class'=>'form-control','style'=>'width:100%','value'=>$choosen,'readonly']);  ?></td>
							</tr><?php } ?>
					
					<?php $q++; }  ?>
				</tbody>
			</table>
			<table class="table tableitm" id="tbl2">
				<tr>
					<td  align="right">
						<?php 
						if($invoice->discount_type==1){ $checked2="Checked";
							 } 
						else{	$checked2="";
							 } 
					?> 
					<b>Discount <label><?php echo $this->Form->input('discount_type', ['type' => 'checkbox','label' => false,'class' => 'form-control input-sm','id'=>'discount_per','Checked'=>$checked2]); ?></label>(in %)</b>
						
						<div class="input-group col-md-2" style="display:none;" id="discount_text">
						<input type="text" name="discount_per" class="form-control input-sm" placeholder="5.5"  'step'=0.01 value="<?php echo $invoice->discount_per; ?> "><span class="input-group-addon">%</span>
					</div>
					</td>
				
					<td><?php echo $this->Form->input('discount', ['type' => 'text','label' => false,'class' => 'form-control input-sm','placeholder' => 'Discount','step'=>0.01,'value'=>$invoice->discount]); ?></td>
				</tr>
				
				<tr style="background-color:#e6faf9;">
					<td align="right"><b><?php echo $this->Form->input('ed_description', ['type' => 'textarea','label' => false,'class' => 'form-control input-sm','placeholder' => 'Excise-Duty Description','style'=>['text-align:left']]); ?> </b></td>
					<td><?php echo $this->Form->input('exceise_duty', ['type' => 'text','label' => false,'class' => 'form-control input-sm','placeholder' => 'Excise-Duty']); ?></td>
				</tr>
				<tr>
					<td align="right"><b>Total</b></td>
					<td width="20%"><?php echo $this->Form->input('total', ['type' => 'text','label' => false,'class' => 'form-control input-sm','placeholder' => 'Total','step'=>0.01,'readonly']); ?></td>
				</tr>
				<tr>
					<td  align="right">
					<b>P&F <label><?php echo $this->Form->input('pnf_type', ['type' => 'checkbox','label' => false,'class' => 'form-control input-sm','id'=>'pnfper']); ?></label>(in %)</b>
					<?php if($invoice->pnf_type=='1'){ ?>
						<div class="input-group col-md-2"  id="pnf_text">
							<input type="text" name="pnf_per" class="form-control input-sm" placeholder="5.5"  'step'=0.01 value='<?= h($invoice->pnf_per) ?>'><span class="input-group-addon">%</span>
						</div>
					<?php }else{ ?>
						<div class="input-group col-md-2"  id="pnf_text" style="display:none;">
							<input type="text" name="pnf_per" class="form-control input-sm" placeholder="5.5"  'step'=0.01 value='0'><span class="input-group-addon">%</span>
						</div>
					<?php } ?>
					
					</td>
					<td><?php echo $this->Form->input('pnf', ['type' => 'text','label' => false,'class' => 'form-control input-sm','placeholder' => 'P&F','step'=>0.01]); ?></td>
				</tr>
				<tr>
					<td  align="right"><b>Total after P&F </b></td>
					<td><?php echo $this->Form->input('total_after_pnf', ['type' => 'text','label' => false,'class' => 'form-control input-sm','placeholder' => 'Total after P&F','readonly','step'=>0.01]); ?></td>
				</tr>
				<tr>
					<td  align="right">
						<input type="hidden" name="sale_tax_id"  />
						<input type="hidden" name="st_ledger_account_id" />
						<input type="text" name="sale_tax_description" class="form-control input-sm" readonly placeholder="Sale Tax Description" style="text-align:right;" />
						<div class="input-group col-md-2">
							<div class="input-group">
							<input type="text" name="sale_tax_per" class="form-control input-sm" readonly><span class="input-group-addon">%</span>
							</div>
						</div>
					</td>
					<td><?php echo $this->Form->input('sale_tax_amount', ['type' => 'text','label' => false,'class' => 'form-control input-sm','readonly','step'=>0.01]); ?></td>
				</tr>
				<tr>
					<td  align="left">
					<?php echo $this->Form->input('fright_text', ['type'=>'textarea','label' => false,'class' => 'form-control input-sm','value'=>$invoice->fright_text,'placeholder'=>'Additional text for Fright Amount','style'=>['text-align:left']]); ?>
					</td>
					<td>
					<?php echo $ledger_account_details_for_fright->name; ?>
					<?php echo $this->Form->input('fright_amount', ['type' => 'text','label' => false,'class' => 'form-control input-sm','placeholder' => 'Fright Amount','value'=>$invoice->fright_amount]); ?></td>
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
							<?php echo $this->Form->input('additional_note', ['label' => false,'class' => 'form-control input-sm','placeholder'=>'Additional Note','rows'=>'5']); ?>
						</div>
					</div>
				</div>
			</div><br/>
			
			
			
			<?php $ref_types=['New Reference'=>'New Ref','Against Reference'=>'Agst Ref','Advance Reference'=>'Advance']; ?>
			<div class="row">
					<div class="col-md-8">
					<table width="100%" class="main_ref_table">
						<thead>
							<tr>
								<th width="25%">Ref Type</th>
								<th width="40%">Ref No.</th>
								<th width="30%">Amount</th>
								<th width="5%"></th>
							</tr>
						</thead>
						<tbody>
							
						</tbody>
						<tfoot>
							<tr>
								<td align="center" style="vertical-align: middle !important;">On Account</td>
								<td></td>
								<td><?php echo $this->Form->input('on_account', ['label' => false,'class' => 'form-control input-sm on_account','placeholder'=>'Amount','readonly']); ?></td>
								<td></td>
							</tr>
							<tr>
								<td colspan="2"><a class="btn btn-xs btn-default addrefrow" href="#" role="button"><i class="fa fa-plus"></i> Add row</a></td>
								<td><input type="text" class="form-control input-sm" placeholder="total" readonly></td>
								<td></td>
							</tr>
						</tfoot>
					</table>
					</div>
				</div>
		</div>
		<?php echo $this->Form->input('process_status', ['type' => 'hidden','value' => @$process_status]); ?>
		<?php echo $this->Form->input('in_id', ['type' => 'hidden','value' => @$invoice->id]); ?>
		<div class="form-actions">
			<div class="row">
				<div class="col-md-offset-3 col-md-9">
					<?= $this->Form->button(__('UPDATE INVOICE'),['class'=>'btn btn-primary','id'=>'add_submit','type'=>'Submit']) ?>
				</div>
			</div>
		</div>
		
		<?= $this->Form->end() ?>
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
			<td><?php echo $this->Form->input('unit[]', ['type' => 'text','label' => false,'class' => 'form-control input-sm','placeholder' => 'Quantity']); ?></td>
			<td><?php echo $this->Form->input('rate[]', ['type' => 'text','label' => false,'class' => 'form-control input-sm','placeholder' => 'Rate','step'=>0.01]); ?></td>
			<td><?php echo $this->Form->input('amount[]', ['type' => 'text','label' => false,'class' => 'form-control input-sm','placeholder' => 'Amount','step'=>0.01]); ?></td>
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
alert();
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

<?php } ?>


<?php $ref_types=['New Reference'=>'New Ref','Against Reference'=>'Agst Ref','Advance Reference'=>'Advance']; ?>
<div id="sample_ref" style="display:none;">
	<table width="100%" class="ref_table">
		<tbody>
			<tr>
				<td><?php echo $this->Form->input('ref_types', ['empty'=>'--Select-','options'=>$ref_types,'label' => false,'class' => 'form-control input-sm ref_type']); ?></td>
				<td class="ref_no"></td>
				<td><?php echo $this->Form->input('amount', ['label' => false,'class' => 'form-control input-sm ref_amount_textbox','placeholder'=>'Amount']); ?></td>
				<td><a class="btn btn-xs btn-default deleterefrow" href="#" role="button"><i class="fa fa-times"></i></a></td>
			</tr>
		</tbody>
	</table>
</div>