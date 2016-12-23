<?php //pr($jobCard->sales_order->sales_order_rows); exit; ?>

<div style="border:solid 1px #c7c7c7;background-color: #FFF;padding: 10px;margin: auto;width: 100%;font-size:14px;">
<table width="100%" class="divHeader">
	<tr>
		<td width="40%"><?php echo $this->Html->image('/logos/'.$jobCard->company->logo, ['width' => '47%']); ?></td>
		<td align="center" style="font-size: 16px;font-weight: bold;color: #0685a8;">JOB CARD</td>
		<td align="right" width="50%" style="font-size: 14px;">
		<span style="font-size: 14px;"><?= h($jobCard->company->name) ?></span><br/>
		<span><?= $this->Text->autoParagraph(h($jobCard->company->address)) ?></span>
		<span><?= h($jobCard->company->mobile_no) ?></span>
		</td>
	</tr>
</table>
<div style="border:solid 2px #0685a8;margin-bottom:5px;margin-top: 5px;"></div></br>
	<div class="portlet-body form">
		<div class="form-body">
			<div class="row">
				<div class="col-md-4">
					<div class="form-group">
						<label class="col-md-5" style="font-size:105%"><b>SO No</b></label>
						<div class="col-md-7">
						<?= h(($jobCard->sales_order->so1.'/SO-'.str_pad($jobCard->sales_order->so2, 3, '0', STR_PAD_LEFT).'/'.$jobCard->sales_order->so3.'/'.$jobCard	->sales_order->so4))?>
					   </div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group">
						 <label class="col-md-5" style="font-size:105%"><b>Customer Name</b></label>
						<div class="col-md-7">
							<?= h($jobCard->customer->customer_name) ?>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group">
					 <label class="col-md-5" style="font-size:105%"><b>Job Card No</b></label>
						 <div class="col-md-7">
						<?= h(($jobCard->jc1.'/JC-'.str_pad($jobCard->jc2, 3, '0', STR_PAD_LEFT).'/'.$jobCard->jc3.'/'.$jobCard->jc4))?>
					   </div>
					</div>
				</div>
			</div><br/>
			<div class="row">
				<div class="col-md-4">
					<div class="form-group">
						<label class="col-md-5" style="font-size:105%"><b>Dispatch Name</b></label>
						<div class="col-md-7">
						<?= h($jobCard->dispatch_name) ?></div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group">
						<label class="col-md-5" style="font-size:105%"><b>Dispatch Email</b></label>
						<div class="col-md-7">
							<?= h($jobCard->dispatch_email) ?></div> 
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group">
						<label class="col-md-5" style="font-size:105%"><b>Dispatch Address</b></label>
						 <div class="col-md-7">
							<?= h($jobCard->dispatch_address)?></div> 
					</div>
				</div>
			</div><br/>
			<div class="row">
				<div class="col-md-4">
					<div class="form-group">
						<label class="col-md-5" style="font-size:105%"><b>Customer PO No</b></label>
						 <div class="col-md-7">
							<?= h($jobCard->customer_po_no)?></div> 
						</div>
					</div>
				
				<div class="col-md-4">
					<div class="form-group">
						 <label class="col-md-5" style="font-size:105%"><b>Required Date</b><span class="required" aria-required="true">*</span></label> 
					  <div class="col-md-7">
							<?= h($jobCard->required_date=date("d-m-Y",strtotime($jobCard->required_date))) ?> 
						</div>
					</div>
				</div>
			</div> 
		</div>
	</div>		
<?php if(!empty($jobCard)){ ?>
<div class="portlet-body form">
<table width="100%" id="main_tb" border="1">
	<thead> 
		<th width="30%">in</th>
		<th>Out</th>
	</thead>
	<tbody>
		<?php foreach ($jobCard->sales_order->sales_order_rows as $sales_order_row): ?>
		<tr>
			<td valign="top">
			<?= $sales_order_row->item->id?>
			<b><?= $sales_order_row->item->name?></b>
			</td>
			<td>
				<table>
					<tr>
						<td align="center">Sr no.</td>
						<td align="center">item name</td>
						<td align="center">quantity</td>
					</tr>
					<?php foreach($sales_order_row->item->job_card_rows as $job_card_row): ?>
					<tr>
						<td align="center"><?php  echo $table2;?></td>
						<td align="center"><?= $job_card_row->item->name?></td>
						<td align="center"><?= $job_card_row->quantity?></td>
						
					</tr>
					<?php $table2++; endforeach; ?>
				</table>
			</td>
		</tr>
		<?php endforeach; ?>
	</tbody>
</table>
</div>
<?php } ?>
</div>

				



	 