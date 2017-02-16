<?php if($financial_year_data['Response'] == "Close" ){
 			echo "Financial Year Closed"; 

 		} else { ?>
<style>
.table > thead > tr > th, .table > tbody > tr > th, .table > tfoot > tr > th, .table > thead > tr > td, .table > tbody > tr > td, .table > tfoot > tr > td{
	vertical-align: top !important;
}
</style>
<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption">
			<i class="icon-globe font-blue-steel"></i>
			<span class="caption-subject font-blue-steel uppercase">Edit Invoice</span>
		</div>
	</div>
	<div class="portlet-body form">
		<?= $this->Form->create($invoice,['id'=>'form_sample_3']) ?>
		<div class="form-body">
			<div class="row">
				<div class="col-md-6">
				</div>
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
							<?php echo @$invoice->customer->customer_name; ?>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label class="col-md-3 control-label">Invoice No.</label>
						<div class="col-md-3 padding-right-decrease">
							<?php echo $this->Form->input('in1', ['label' => false,'class' => 'form-control input-sm','readonly','value' => @$sales_order->so1]); ?>
						</div>
						<div class="col-md-3 padding-right-decrease">
							<?php echo @$invoice->in3; ?>
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
							<?php echo $this->Form->input('customer_address', ['label' => false,'class' => 'form-control','placeholder' => 'Address','value' => @$invoice->customer_address]); ?>
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
						<label class="col-md-3 control-label">Salesman  <span class="required" aria-required="true">*</span></label>
						<div class="col-md-9">
							<?php echo @$invoice->employee->name; ?>
						</div>
					</div>
				</div>
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
					$existing_rows=[];
					$current_rows=[];
					$current_row_items=[];
					foreach($invoice->sales_order->invoices as $all_invoice){
						foreach($all_invoice->invoice_rows as $all_invoice_row){
							$existing_rows[$all_invoice_row->item_id]=@$existing_rows[$all_invoice_row->item_id]+$all_invoice_row->quantity;
						}
					}
					
					foreach($invoice->invoice_rows as $current_invoice_row){
						@$existing_rows[$current_invoice_row->item_id]=$existing_rows[$current_invoice_row->item_id]-$current_invoice_row->quantity;
						$current_rows[]=$current_invoice_row->item_id;
						$current_row_items[$current_invoice_row->item_id]=$current_invoice_row->quantity;
					}
					$q=0; 
					foreach ($invoice->sales_order->sales_order_rows as $sales_order_row){ ?>
						<?php if(@$existing_rows[$sales_order_row->item_id]!=$sales_order_row->quantity) { ?> 
						<tr class="tr1" row_no="<?= h($q) ?>">
							<td rowspan="2"><?php echo ++$q; $q--; ?></td>
							<td>
								<?php 
								echo $this->Form->input('q', ['type'=>'hidden','value'=>$sales_order_row->item_id]);
								echo $sales_order_row->item->name;
								?>
							</td>
							<td>
								<?php  
								echo $this->Form->input('q', ['type' => 'text','label' => false,'class' => 'form-control input-sm quantity','placeholder' => 'Quantity','value' => @$current_row_items[$sales_order_row->item_id],'max'=>$sales_order_row->quantity-@$existing_rows[$sales_order_row->item_id]]); 
								?>
								<span>Max: <?= h($sales_order_row->quantity-@$existing_rows[$sales_order_row->item_id]) ?></span>
							</td>
							<td>
								<?php echo $this->Form->input('q', ['type' => 'text','label' => false,'class' => 'form-control input-sm','placeholder' => 'Rate','step'=>0.01,'value'=>$sales_order_row->rate]); ?>
							</td>
							<td>
								<?php echo $this->Form->input('q', ['type' => 'text','label' => false,'class' => 'form-control input-sm','placeholder' => 'Amount','step'=>0.01,'value'=>$sales_order_row->amount]); ?>
							</td>
							<td>
								<?php echo @$sales_order_row->sale_tax->tax_figure; ?>
							</td>
							<td>
								<label><?php 
								if(in_array($sales_order_row->item_id,$current_rows)){
									$check='checked';
								}else{
									$check='';
								}
								echo $this->Form->input('q', ['label' => false,'type'=>'checkbox','class'=>'rename_check','value' => @$sales_order_row->id,$check]);
								?></label>
								<?php echo $this->Form->input('q', ['label' => false,'type' => 'hidden','value' => @$sales_order_row->sale_tax->tax_figure]); ?>
								<?php echo $this->Form->input('st_description', ['type' => 'hidden','label' => false,'value' => @$sales_order_row->sale_tax->invoice_description]); ?>
								<?php echo $this->Form->input('st_id', ['type' => 'hidden','label' => false,'value' => @$sales_order_row->sale_tax->id]); ?>
							</td>
						</tr>
						<tr class="tr2" row_no="<?= h($q) ?>">
							<td colspan="7">
							<?php echo $sales_order_row->description; ?>
							<?php echo $this->Form->textarea('q', ['label' => false,'class' => 'form-control input-sm autoExpand','style'=>['display:none'],'placeholder' => 'Description','required','value'=>$sales_order_row->description]); ?>
							</td>
						</tr>
						
						<?php $options1=[]; $choosen=[];
							if(sizeof(@$ItemSerialNumber[@$sales_order_row->item_id])>0){
								foreach($ItemSerialNumber[@$sales_order_row->item_id] as $item_serial_number){
									if($item_serial_number->status=="Out"){
										$choosen[]=$item_serial_number->id;
									}
									$options1[]=['text' =>$item_serial_number->serial_no, 'value' => $item_serial_number->id];
								} 
							}else if(sizeof(@$ItemSerialNumber2[@$sales_order_row->item_id])>0){
								foreach($ItemSerialNumber2[@$sales_order_row->item_id] as $item_serial_number){
									$options1[]=['text' =>$item_serial_number->serial_no, 'value' => $item_serial_number->id];
								} 
							}
							if($sales_order_row->item->serial_number_enable==1) { ?>
							<tr class="tr3" row_no="<?= h($q) ?>">
							<td></td>
							<td colspan="5">
							<?php echo $this->Form->input('q', ['label'=>false,'options' => $options1,'multiple' => 'multiple','class'=>'form-control','style'=>'width:100%','value'=>$choosen,'readonly']);  ?></td>
							</tr><?php } ?>
					<?php } ?>
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
						<input type="hidden" name="sale_tax_id" class="form-control input-sm"  placeholder="Sale Tax" value="<?php echo $invoice->sale_tax_id;?>"/>
						<input type="text" name="sale_tax_description" class="form-control input-sm" readonly placeholder="Sale Tax Description" style="text-align:right;" value="<?php echo $invoice->sale_tax->invoice_description;?>"/>
						<div class="input-group col-md-2">
							<div class="input-group">
						<?php						
							$options=[];
							foreach($SaleTaxes as $SaleTaxe){
								$options[]=['text' => (string)$SaleTaxe->tax_figure.'%', 'value' => $SaleTaxe->tax_figure, 'description' => $SaleTaxe->invoice_description,'sale_tax_id' => $SaleTaxe->id];
							}
							echo $this->Form->input('sale_tax_per', ['options'=>$options,'label' => false,'class' => 'form-control input-sm','value'=>$invoice->sale_tax_per]);  ?>
							</div>
						</div>
					</td>
					<td><?php echo $this->Form->input('sale_tax_amount', ['type' => 'text','label' => false,'class' => 'form-control input-sm','readonly','step'=>0.01]); ?></td>
				</tr>
				<tr>
					<td  align="left">
					<b>Fright Amount </b>
					<?php echo $this->Form->input('fright_text', ['type'=>'textarea','label' => false,'class' => 'form-control input-sm','placeholder'=>'Additional text for Fright Amount','style'=>['text-align:left']]); ?>
					</td>
					<td><?php echo $this->Form->input('fright_amount', ['type' => 'text','label' => false,'class' => 'form-control input-sm','placeholder' => 'Fright Amount','step'=>0.01]); ?></td>
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
			
			<div class="row">
				<div class="col-md-4">
					<div class="form-group">
						<label class="col-md-6 control-label">Credit Limits</label>
						<div class="col-md-6" id="due">
							<?php echo $this->Form->input('credit_limit', ['label' => false,'class' => 'form-control input-sm','placeholder'=>'','readonly','value' => @$invoice->customer->credit_limit]); ?><br/>
							<a href="#" role="button" id="update_credit_limit">Update Credit Limit</a>
							<span id="update_credit_limit_wait"></span>
						</div>
					</div>
				</div>
		
				<div class="col-md-4">
					<div class="form-group">
						<label class="col-md-6 control-label">Due Payment</label>
						<div class="col-md-6" id="due">
							<?php echo $this->Form->input('old_due_payment', ['label' => false,'class' => 'form-control input-sm','placeholder'=>'','readonly','value'=>$old_due_payment]); ?>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group">
						<label class="col-md-6 control-label">New Due Payment</label>
						<div class="col-md-6" id="due">
							<?php echo $this->Form->input('new_due_payment', ['label' => false,'class' => 'form-control input-sm','placeholder'=>'','readonly','max'=>@$sales_order->customer->credit_limit]); ?>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-4">
					<div class="form-group">
						<label class="col-md-6 control-label">Temporary Limit</label>
						<div class="col-md-6" id="due">
							<?php echo $this->Form->input('temp_limit', ['label' => false,'class' => 'form-control input-md','placeholder'=>'']); ?>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group">
						<label class="col-md-6 control-label">Customer TIN</label>
						<div class="col-md-6" id="due">
							<?php echo $this->Form->input('customer_tin', ['label' => false,'class' => 'form-control input-sm','placeholder'=>'','readonly','value' => @$invoice->customer->tin_no,'required']); ?><br/>
							
						</div>
					</div>
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
						<?php
						$ref_no=0;
						
						if(!empty($ReferenceBalances))
						{
							foreach($ReferenceBalances as $ReferenceBalancee=>$key)
							{
								foreach($key as $ReferenceBalance)
								{
									$ReferenceBalance_amount=$ReferenceBalance->debit-$ReferenceBalance->credit;
		
									if($ReferenceBalance_amount>0)
									{
										$itemGroups[]=['text'=>$ReferenceBalance->reference_no, 'value' =>$ReferenceBalance->reference_no,  'amount' => $ReferenceBalance_amount];
									}
								}
							}
						}
						
						
						foreach($ReferenceDetails as $ReferenceDetail)
						{				
							$ref_no++;
							if($ReferenceDetail->reference_type=='New Reference')
							{
							?>
							<tr>
							<td>New Ref<?= $this->Form->hidden('reference_type[]',['class'=>'','label'=>false, 'value'=>'New Reference']) ?></td>
							<td><?= $this->Form->input('reference_no[]',['type'=>'text','class'=>'form-control distinctreference','label'=>false,'id'=>'reference_no_'+$ref_no,'value'=>$ReferenceDetail->reference_no,'readonly']) ?></td>
							<td><?= $this->Form->input('credit[]',['type'=>'text','class'=>'form-control ','label'=>false,'value'=>$ReferenceDetail->credit]) ?>
							<?= $this->Form->hidden('old_amount[]',['type'=>'text','class'=>'form-control ','label'=>false, 'value'=>$ReferenceDetail->credit]) ?></td>
							<td><?= $this->Form->button(__('<i class="fa fa-trash-o"></i>'),['type'=>'button','class'=>'btn btn-danger btn-sm remove_row','label'=>false]) ?></td>
							</tr>
							<?php
							} 
							else if($ReferenceDetail->reference_type=='Against Reference')
							{ 
								$key=0;
								foreach($itemGroups as $itemGroup)
								{
									if($itemGroup['value']==$ReferenceDetail->reference_no)
									{
										$itemGroups[$key]['amount']+=$ReferenceDetail->credit;
									}
									$key++;
								}
							?>
							<tr class="against_references_no">
							<td>Agst Ref<?= $this->Form->hidden('reference_type[]',['class'=>'','label'=>false, 'value'=>'Against Reference']) ?><?= $this->Form->hidden('reference_no[]',['type'=>'text','class'=>'form-control ','label'=>false,'id'=>'reference_no_'+$ref_no,'value'=>$ReferenceDetail->reference_no]) ?></td>
							<td id="against_references_no">
							<?php echo $this->Form->input('against_references_no', ['empty'=>'--Select-','label' => false,'options' =>$itemGroups,'class' => 'form-control input-sm','value'=>$ReferenceDetail->reference_no,'readonly']); ?>
							</td>
							<td><?= $this->Form->input('credit[]',['type'=>'text','class'=>'form-control ','label'=>false, 'value'=>$ReferenceDetail->credit]) ?>
							<?= $this->Form->hidden('old_amount[]',['type'=>'text','class'=>'form-control ','label'=>false, 'value'=>$ReferenceDetail->credit]) ?></td></td>
							<td><?= $this->Form->button(__('<i class="fa fa-trash-o"></i>'),['type'=>'button','class'=>'btn btn-danger btn-sm remove_row','label'=>false]) ?></td>
							</tr>
							<?php
							} 
							else if($ReferenceDetail->reference_type=='Advance Reference')
							{ ?>
							<tr>
							<td>Adv Ref<?= $this->Form->hidden('reference_type[]',['class'=>'','label'=>false, 'value'=>'Advance Reference']) ?></td>
							<td><?= $this->Form->input('reference_no[]',['type'=>'text','class'=>'form-control distinctreference','label'=>false,'id'=>'reference_no_'+$ref_no,'value'=>$ReferenceDetail->reference_no,'readonly']) ?></td>
							<td><?= $this->Form->input('credit[]',['type'=>'text','class'=>'form-control ','label'=>false, 'value'=>$ReferenceDetail->credit]) ?>
							<?= $this->Form->hidden('old_amount[]',['type'=>'text','class'=>'form-control ','label'=>false, 'value'=>$ReferenceDetail->credit]) ?></td></td>
							<td><?= $this->Form->button(__('<i class="fa fa-trash-o"></i>'),['type'=>'button','class'=>'btn btn-danger btn-sm remove_row','label'=>false]) ?></td>
							</tr>
							<?php
							}
						}
						?>
						</tbody>
						</table>
					</div>
				  </div>
				<table width="100%">
					<tr>
						<td width="100%" align="center" valign="top" id="pending_invoice_container"></td>
						<td></td>
						
					</tr>
				</table>
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
	<table class="table table-bordered" id="new_ref" style="display:none;">
			<tbody>
			<tr>
			<td>New Ref<?= $this->Form->hidden('reference_type[]',['class'=>'','label'=>false, 'value'=>'New Reference']) ?></td>
			<td><?= $this->Form->input('reference_no[]',['type'=>'text','class'=>'form-control distinctreference','label'=>false,'id'=>'reference_no_2']) ?></td>
			<td><?= $this->Form->input('credit[]',['type'=>'text','class'=>'form-control ','label'=>false, 'value'=>0]) ?></td>
			<td><?= $this->Form->button(__('<i class="fa fa-trash-o"></i>'),['type'=>'button','class'=>'btn btn-danger btn-sm remove_row','label'=>false]) ?></td>
			</tr>
			</tbody>
		</table>
		<table class="table table-bordered" id="agst_ref" style="display:none;">
		<tbody>
			<tr class="against_references_no">
			<td>Agst Ref<?= $this->Form->hidden('reference_type[]',['class'=>'','label'=>false, 'value'=>'Against Reference']) ?><?= $this->Form->hidden('reference_no[]',['type'=>'text','class'=>'form-control ','label'=>false,'id'=>'reference_no_2']) ?></td>
			<td id="against_references_no">
			<?php echo $this->Form->input('against_references_no', ['empty'=>'--Select-','label' => false,'options' =>$itemGroups,'class' => 'form-control input-sm']); ?>
			</td>
			<td><?= $this->Form->input('credit[]',['type'=>'text','class'=>'form-control ','label'=>false, 'value'=>0]) ?></td>
			<td><?= $this->Form->button(__('<i class="fa fa-trash-o"></i>'),['type'=>'button','class'=>'btn btn-danger btn-sm remove_row','label'=>false]) ?></td>
			</tr>
			</tbody>
		</table>
		<table class="table table-bordered" id="adv_ref" style="display:none;">
		<tbody>
			<tr>
			<td>Adv Ref<?= $this->Form->hidden('reference_type[]',['class'=>'','label'=>false, 'value'=>'Advance Reference']) ?></td>
			<td><?= $this->Form->input('reference_no[]',['type'=>'text','class'=>'form-control distinctreference','label'=>false,'id'=>'reference_no_2']) ?></td>
			<td><?= $this->Form->input('credit[]',['type'=>'text','class'=>'form-control ','label'=>false, 'value'=>0]) ?></td>
			<td><?= $this->Form->button(__('<i class="fa fa-trash-o"></i>'),['type'=>'button','class'=>'btn btn-danger btn-sm remove_row','label'=>false]) ?></td>
			</tr>
			</tbody>
		</table>
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


	$( document ).on( 'keyup', 'input[name="credit[]"]', function() {
			var credit=parseFloat($(this).val());
			var amount=$(this).closest('tr').find('select[name="against_references_no"] option:selected').attr('amount');
			amount=parseFloat(amount);

			if(amount<credit)
			{
				$(this).val(amount);
			}
				
	});
	
	$('select[name="against_references_no"]').live("change",function() {
		var against_references_no=$(this).val();
		var amount=eval($('option:selected',this).attr('amount'));
		
		$(this).closest('tr').find('input[name="reference_no[]"]').val(against_references_no);
		$(this).closest('tr').find('input[name="credit[]"]').val(amount);
	});
	
		
		var received_from_id='<?php echo $invoice->customer->ledger_account_id; ?>';
	
		var url="<?php echo $this->Url->build(['controller'=>'PaymentVouchers','action'=>'fetchReferenceNo']); ?>";
		url=url+'/'+received_from_id,
		$.ajax({
			url: url,
			type: 'GET',
			dataType: 'text'
		}).done(function(response) {
			$("#main_table tbody").find('tr.against_references_no').remove();
			$('#against_references_no').html(response);
		});
			
		
	
	$('input[name="amount"],[name^=credit]').live("blur",function() {
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
		
		var current_obj=$(this).closest("#main_table tr");
		
		var old_amount=$(this).closest("#main_table tr").find('input[name="old_amount[]"]').val();
		
		if(old_amount)
		{
			var reference_type=$(this).closest("#main_table tr").find('input[name="reference_type[]"]').val();
			var reference_no=$(this).closest("#main_table tr").find('input[name="reference_no[]"]').val();
			var ledger_account_id='<?php echo $invoice->customer->ledger_account_id; ?>';
				var invoice_id='<?php echo $invoice_id; ?>';
			
			var url="<?php echo $this->Url->build(['controller'=>'Invoices','action'=>'deleteReceiptRow']); ?>";
			url=url+'/'+reference_type+'/'+old_amount+'/'+ledger_account_id+'/'+invoice_id+'/'+reference_no,
			
			$.ajax({
				url: url,
				type: 'GET',
				dataType: 'text'
			}).done(function(response) {
				
				current_obj.remove();
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
		
		}
		else
		{
			current_obj.closest("#main_table tr").remove();
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
		}
		
	});
	
	/////////////////////////////////////////////////////////////////////
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
		ignore: ":hidden,[readonly=readonly]",
		rules: {
			checked_row_length: {
				required: true,
				max : 1,
				min : 1,
			},
			date_created : {
				  required: true,
			},
			
			customer_id : {
				  required: true,
			},
			in1 : {
				  required: true,
			},
			in3:{
				required: true
			},
			in4:{
				required: true,
			},
			customer_address:{
				required: true,
			},
			lr_no : {
				  required: true,
			},
			customer_po_no  : {
				  required: true,
			},
			employee_id: {
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
                            ledger_account_id: '<?php echo $invoice->customer->ledger_account_id; ?>'
                        }
					}
				}
			
		},

		messages: { // custom messages for radio buttons and checkboxes
			checked_row_length: {
				required : "Please select atleast one row.",
				min : "Please select atleast one row.",
				max: "You can not select multiple rows of different sale tax rate."
			},
			service: {
				required: "Please select  at least 2 types of Service",
				minlength: jQuery.validator.format("Please select  at least {0} types of Service")
			},
			'reference_no[]': {
				remote: "Reference no. is alredy taken."
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
			var amount=parseFloat($('input[name="grand_total"]').val());
		
				var credit=0;
				$('input[name="credit[]"]').each(function () {
					credit=credit+parseFloat($(this).val());
				});
				
				if(amount==credit)
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
				
				// submit the form
		}

	});
	//--	 END OF VALIDATION
	
	if($("#discount_per").is(':checked')){
		$("#discount_text").show();
		$('input[name="discount"]').attr('readonly','readonly');
		
	}else{
		$("#discount_text").hide();
		$('input[name="discount"]').removeAttr('readonly');
		$('input[name="discount_per"]').val(0);
		$('input[name="discount"]').val(0);
	}

	$("#main_tb tbody tr.tr1").each(function(){
		var row_no=$(this).attr('row_no');
		$(this).find('td:nth-child(3) input').rules("add", "required");
		$(this).find('td:nth-child(4) input').rules("add", "required");
		
		$('#main_tb tbody tr.tr2[row_no="'+row_no+'"] td:nth-child(1) textarea').rules("add", "required");
	});	
	
	$('select[name="company_id"]').on("change",function() {
		var alias=$('select[name="company_id"] option:selected').attr("alias");
		$('input[name="in1"]').val(alias);
    });
	
	$('#main_tb input,#tbl2 input').die().live("keyup","blur",function() {
		calculate_total();
    });
	$('#main_tb input,#tbl2 select').die().live("change",function() { 
		calculate_total();
    });
	
	
	$('.rename_check').die().live("click",function() {
		rename_rows(); calculate_total();
		
    });
	
	$('.addrow').die().live("click",function() { 
		add_row();
    });
	
	$('.quantity').die().live("keyup",function() {
		var qty =$(this).val();
			rename_rows(); 
    });
	rename_rows(); calculate_total();
	function rename_rows(){
		var list = new Array();
		$("#main_tb tbody tr.tr1").each(function(){
			var row_no=$(this).attr('row_no');
			var val=$(this).find('td:nth-child(7) input[type="checkbox"]:checked').val();
			if(val){
				$(this).find('td:nth-child(2) input').attr("name","invoice_rows["+val+"][item_id]").attr("id","invoice_rows-"+val+"-item_id").rules("add", "required");
				$(this).find('td:nth-child(3) input').removeAttr("readonly").attr("name","invoice_rows["+val+"][quantity]").attr("id","q"+val).attr("id","invoice_rows-"+val+"-quantity").rules("add", "required");
				$(this).find('td:nth-child(4) input').attr("name","invoice_rows["+val+"][rate]").attr("id","q"+val).attr("id","invoice_rows-"+val+"-rate").rules("add", "required");
				$(this).find('td:nth-child(5) input').attr("name","invoice_rows["+val+"][amount]").attr("id","q"+val).attr("id","invoice_rows-"+val+"-amount").rules("add", "required");
				
				$('#main_tb tbody tr.tr2[row_no="'+row_no+'"] td:nth-child(1) textarea').removeAttr("readonly").attr("name","invoice_rows["+val+"][description]").attr("id","invoice_rows-"+val+"-description").rules("add", "required");
				$('#main_tb tbody tr.tr2[row_no="'+row_no+'"] td:nth-child(1) div#editor').attr("name","invoice_rows["+val+"][description]").attr("id","invoice_rows-"+val+"-description");
				
				$(this).css('background-color','#fffcda');
				$('#main_tb tbody tr.tr2[row_no="'+row_no+'"]').css('background-color','#fffcda');
				var s_tax=$(this).find('td:nth-child(6)').text();
				
				list.push(s_tax);
				var qty=$(this).find('td:nth-child(3) input[type="text"]').val();
				var serial_l=$('#main_tb tbody tr.tr3[row_no="'+row_no+'"] td:nth-child(2) select').length;
				if(serial_l>0){
					$('#main_tb tbody tr.tr3[row_no="'+row_no+'"] td:nth-child(2) select').removeAttr("readonly").attr("name","invoice_rows["+val+"][item_serial_numbers][]").attr("id","invoice_rows-"+val+"-item_serial_no").attr('maxlength',qty).select2().rules('add', {
						    required: true,
							minlength: qty,
							maxlength: qty,
							messages: {
								maxlength: "select serial number equal to quantity.",
								minlength: "select serial number equal to quantity."
							}
					});
				}
				
				$('#main_tb tbody tr.tr3[row_no="'+row_no+'"]').css('background-color','#fffcda');
				
			}else{
				$(this).find('td:nth-child(2) input').attr({ name:"q", readonly:"readonly"}).rules( "remove", "required" );
				$(this).find('td:nth-child(3) input').attr({ name:"q", readonly:"readonly"}).rules( "remove", "required" );
				$(this).find('td:nth-child(4) input').attr({ name:"q", readonly:"readonly"}).rules( "remove", "required" );
				$(this).find('td:nth-child(5) input').attr({ name:"q", readonly:"readonly"}).rules( "remove", "required" );
				
				$('#main_tb tbody tr.tr2[row_no="'+row_no+'"] td:nth-child(1) textarea').attr({ name:"q", readonly:"readonly"}).rules( "remove", "required" );
				$(this).css('background-color','#FFF');
				$('#main_tb tbody tr.tr2[row_no="'+row_no+'"]').css('background-color','#FFF');
				$('#main_tb tbody tr.tr3[row_no="'+row_no+'"]').css('background-color','#FFF');
				
				$('#main_tb tbody tr.tr3[row_no="'+row_no+'"] select').attr({ name:"q", readonly:"readonly"}).select2().rules( "remove", "required" );
			}
			var unique=list.filter(function(itm,i,a){
				return i==a.indexOf(itm);
			});

			$("#checked_row_length").val(unique.length);
			
		});
	}
	
	function calculate_total(){
			var total=0;
			$("#main_tb tbody tr.tr1").each(function(){
			var val=$(this).find('td:nth-child(7) input[type="checkbox"]:checked').val();
			if(val){
				var qty=parseInt($(this).find("td:nth-child(3) input").val());
				var Rate=parseFloat($(this).find("td:nth-child(4) input").val());
				var Amount=qty*Rate;
				$(this).find("td:nth-child(5) input").val(Amount.toFixed(2));
				total=total+Amount;
				var sale_tax=parseFloat($(this).find("td:nth-child(7) input[type=hidden]").eq(1).val());
				if(isNaN(sale_tax)) { var sale_tax = 0; }
				$('input[name="sale_tax_per"]').val(sale_tax);
				var sale_tax_description=$(this).find("td:nth-child(7) input[type=hidden]").eq(2).val();
				$('input[name="sale_tax_description"]').val(sale_tax_description);
				var sale_tax_id=$(this).find("td:nth-child(7) input[type=hidden]").eq(3).val();
				$('input[name="sale_tax_id"]').val(sale_tax_id);
				
			}
		});
			if($("#discount_per").is(':checked')){
				var discount_per=parseFloat($('input[name="discount_per"]').val());
				var discount_amount=(total*discount_per)/100;
				if(isNaN(discount_amount)) { var discount_amount = 0; }
				$('input[name="discount"]').val(discount_amount.toFixed(2));
			}else{
				var discount_amount=parseFloat($('input[name="discount"]').val());
				if(isNaN(discount_amount)) { var discount_amount = 0; }
			}
			total=total-discount_amount
			
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
			
			var sale_tax_description=$('select[name="sale_tax_per"] option:selected').attr("description");
			$('input[name="sale_tax_description"]').val(sale_tax_description);
			
			var sale_tax_id=$('select[name="sale_tax_per"] option:selected').attr("sale_tax_id");
			$('input[name="sale_tax_id"]').val(sale_tax_id);
			
			var fright_amount=parseFloat($('input[name="fright_amount"]').val());
			if(isNaN(fright_amount)) { var fright_amount = 0; }
			
			grand_total=total_after_pnf+sale_tax+fright_amount;
			$('input[name="grand_total"]').val(grand_total.toFixed(2));

			var old_due_payment1=parseFloat($('input[name="old_due_payment"]').val());
			var	new_due_payment=grand_total+old_due_payment1;
			$('input[name="new_due_payment"]').val(new_due_payment.toFixed(2));
			
		}
		
			var grand_total=parseFloat($('input[name="grand_total"]').val());
			var old_due_payment1=parseFloat($('input[name="old_due_payment"]').val());
			var	new_due_payment=grand_total+old_due_payment1;
			$('input[name="new_due_payment"]').val(new_due_payment.toFixed(2));
			
	
			var credit_limit=parseFloat($('input[name="credit_limit"]').val());
			var temp_limit=$('input[name="temp_limit"]').val();
			var sum= parseFloat(temp_limit) + parseFloat(credit_limit);
			$('input[name="new_due_payment"]').attr('max',sum).rules('add', {
						required: true,
						max: sum,
						messages: {
							max: "Credit Limit Exieded ."
						}
					});
		
			$('input[name="temp_limit"]').die().live("keyup",function(){
				var credit_limit=$('input[name="credit_limit"]').val();
				var temp_limit=$('input[name="temp_limit"]').val();
				var sum1= parseFloat(temp_limit) + parseFloat(credit_limit);
					$('input[name="new_due_payment"]').attr('max',sum1).rules('add', {
						required: true,
						max: sum1,
						messages: {
							max: "Credit Limit Exieded ."
						}
					});
			});
			
	$('.select_address').on("click",function() { 
		open_address(); 
    });
	
	$('.closebtn').on("click",function() { 
		$("#myModal12").hide();
    });
	
	$("#discount_per").on('click',function(){
		if($(this).is(':checked')){
			$("#discount_text").show();
			$('input[name="discount"]').attr('readonly','readonly');
		}else{ 
			$("#discount_text").hide();
			$('input[name="discount"]').removeAttr('readonly');
			$('input[name="discount_per"]').val(0);
			$('input[name="discount"]').val(0);
		}
		calculate_total();
	});
		
	$("#pnfper").on('click',function(){
		if($(this).is(':checked')){
			$("#pnf_text").show();
			$('input[name="pnf"]').attr('readonly','readonly');
			$('input[name="pnf_per"]').val(0);

		}else{
			$("#pnf_text").hide();
			$('input[name="pnf"]').removeAttr('readonly');
			$('input[name="pnf"]').val(0);
			$('input[name="pnfper"]').val(0);
			
		}
		calculate_total();
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
		
		var employee_id=$('select[name="customer_id"] option:selected').attr("employee_id");
			$("select[name=employee_id]").val(employee_id).select2();
		
    });
	
	function open_address(){
		var customer_id=$('input[name="customer_id"]').val();
		$("#result_ajax").html('<div align="center"><?php echo $this->Html->image('/img/wait.gif', ['alt' => 'wait']); ?> Loading</div>');
		var url="<?php echo $this->Url->build(['controller'=>'Customers','action'=>'addressList']); ?>";
		url=url+'/'+customer_id,
		//alert(url);
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
	$(".check_row").die().live("click",function() {  
	if($(this).is(':checked')){  
			$(this).closest('tr').find('.amount_box').removeAttr('readonly');
			var amount=$(this).closest('tr').find('.amount_box').attr('amount');
			
			$(this).closest('tr').find('.amount_box').val(amount);
			calculation_for_total();
   
		}else{
			$(this).closest('tr').find('.amount_box').attr('readonly','readonly');
			$(this).closest('tr').find('.amount_box').val('');
			calculation_for_total();
		}
	
	});
	
	 $('input[type="radio"]').click(function(){ 
	    var payment_mode_sel=$('input[name=payment_mode]:checked').val();
		var customer_id=$('input[name="customer_id"]').val();
		
	    var in_id=$('input[name="in_id"]').val();
		
		
		if(payment_mode_sel == 'Agst_ref'){ 
		$("#pending_invoice_container").html('<div align="center"><?php echo $this->Html->image('/img/wait.gif', ['alt' => 'wait']); ?> Loading</div>');
		var url="<?php echo $this->Url->build(['controller'=>'Invoices','action'=>'AgstRefForPaymentEdit']); ?>";
		
		url=url+'/'+in_id,customer_id
		
		$.ajax({
			url: url,
		}).done(function(response) {
			$("#pending_invoice_container").html(response);
			
		});
		}
		else{
			$("#pending_invoice_container").html('<div align="center"></div>');
		}
	});
	var payment_mode_sel=$('input[name=payment_mode]:checked').val();
		var customer_id=$('input[name="customer_id"]').val();
		
	    var in_id=$('input[name="in_id"]').val();
		
		
		if(payment_mode_sel == 'Agst_ref'){ 
		$("#pending_invoice_container").html('<div align="center"><?php echo $this->Html->image('/img/wait.gif', ['alt' => 'wait']); ?> Loading</div>');
		var url="<?php echo $this->Url->build(['controller'=>'Invoices','action'=>'AgstRefForPaymentEdit']); ?>";
		
		url=url+'/'+in_id,customer_id
		
		$.ajax({
			url: url,
		}).done(function(response) {
			$("#pending_invoice_container").html(response);
			
		});
		}
		else{
			$("#pending_invoice_container").html('<div align="center"></div>');
		}
	calculation_for_total();
	$('input').live("keyup",function() {
		calculation_for_total();
	});
	function calculation_for_total(){  
		var total_left=0; var total_right=0; var sum=0;
		$("#due_receipt tbody tr.tr1").each(function(){ 
			var val=$(this).find('td:nth-child(1) input[type="checkbox"]:checked').val();
			if(val){
				var qty=parseFloat($(this).find('.amount_box').val());
				total_left=total_left+qty;
			} 
			$('input[name="total_amount_agst"]').val(total_left.toFixed(2));	
			
		});
	}
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
