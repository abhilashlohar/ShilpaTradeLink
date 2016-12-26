<div style="border:solid 1px #c7c7c7;background-color: #FFF;padding: 10px;margin: auto;width: 100%;font-size:14px;">
<table width="100%" class="divHeader">
	<tr>
		<td width="40%"><?php echo $this->Html->image('/logos/'.$jobCard->company->logo, ['width' => '35%']); ?></td>
		<td valign="bottom" width="20%" align="center" style="font-size: 25px;font-weight: bold;color: #0685a8;">JOB CARD</td>
		<td align="right" width="50%" style="font-size: 14px;">
		<span style="font-size: 20px;"><?= h($jobCard->company->name) ?></span><br/>
		<span style="font-size: 15px;"><?= $this->Text->autoParagraph(h($jobCard->company->address)) ?></span>
		<span style="font-size: 15px;"><?= h($jobCard->company->mobile_no) ?></span>
		</td>
	</tr>
</table>
<div style="border:solid 3px #0685a8;margin-bottom:5px;margin-top: 5px;"></div></br>
	<div class="portlet-body form">
		<div class="form-body">
			<div class="row">
				<div class="col-md-4">
					<div class="form-group">
						<label class="col-md-5" style="font-size:105%"><b>SO No:</b></label>
						<div class="col-md-7">
						<?= h(($jobCard->sales_order->so1.'/SO-'.str_pad($jobCard->sales_order->so2, 3, '0', STR_PAD_LEFT).'/'.$jobCard->sales_order->so3.'/'.$jobCard	->sales_order->so4))?>
					   </div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group">
						 <label class="col-md-5" style="font-size:105%"><b>Customer Name:</b></label>
						<div class="col-md-7">
							<?= h($jobCard->customer->customer_name) ?>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group">
					 <label class="col-md-5" style="font-size:105%"><b>Job Card No:</b></label>
						 <div class="col-md-7">
						<?= h(($jobCard->jc1.'/JC-'.str_pad($jobCard->jc2, 3, '0', STR_PAD_LEFT).'/'.$jobCard->jc3.'/'.$jobCard->jc4))?>
					   </div>
					</div>
				</div>
			</div><br/>
			<div class="row">
				<div class="col-md-4">
					<div class="form-group">
						<label class="col-md-5" style="font-size:105%"><b>Dispatch Name:</b></label>
						<div class="col-md-7">
						<?= h($jobCard->dispatch_name) ?></div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group">
						<label class="col-md-5" style="font-size:105%"><b>Dispatch Email:</b></label>
						<div class="col-md-7">
							<?= h($jobCard->dispatch_email) ?></div> 
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group">
						<label class="col-md-5" style="font-size:105%"><b>Dispatch Address:</b></label>
						 <div class="col-md-7">
							<?= h($jobCard->dispatch_address)?></div> 
					</div>
				</div>
			</div><br/>
			<div class="row">
				<div class="col-md-4">
					<div class="form-group">
						<label class="col-md-5" style="font-size:105%"><b>Customer PO No:</b></label>
						 <div class="col-md-7">
							<?= h($jobCard->customer_po_no)?></div> 
						</div>
					</div>
				
				<div class="col-md-4">
					<div class="form-group">
						 <label class="col-md-5" style="font-size:105%"><b>Required Date:</b><span class="required" aria-required="true">*</span></label> 
					  <div class="col-md-7">
							<?= h($jobCard->required_date=date("d-m-Y",strtotime($jobCard->required_date))) ?> 
						</div>
					</div>
				</div>
			</div> 
		</div>
	</div>	
<br>	
<?php if(!empty($jobCard)){ ?>
<div class="portlet-body form">
<table width="96%" id="main_tb" border="1" align="center">
	<thead> 
		<th width="30%">IN</th>
		<th>OUT</th>
	</thead>
	<tbody>
		<?php foreach ($jobCard->sales_order->sales_order_rows as $sales_order_row): ?>
		<tr>
			<td valign="top">
			<b><?= $sales_order_row->item->name?></b>
			</td>
			<td>
 
			<?php $page_no=0; ?>	
				<table width="97%" align="center">
					<tr>
				       <td align="center">
					   <br>
					   <table border="1" class="table tableitm">
					   <thead>
					   <tr>
					   	<th width="10%" style="font-size: 15px;font-weight: bold;">Sr No.</th>
					   	<th width="20%"style="font-size: 15px;font-weight: bold;">Item Name</th>
					   	<th width="20%"style="font-size: 15px;font-weight: bold;">Quantity</th>
					   </tr>
					   </thead>
					  <?php foreach($sales_order_row->item->job_card_rows as $job_card_row): ?> 
					   <tr>
					   <td><?= h(++$page_no) ?></td>
					   <td><?= $job_card_row->item->name?></td>
					   <td><?= $job_card_row->quantity?></td>
					   </tr>
					 <?php endforeach; ?>
					   </table>
					   </td>
					 </tr>

				</table>
			</td>
		</tr>
		<?php endforeach; ?>
	</tbody>
</table>
</br>
<table width="96%" class="divFooter">
	<tr>
		<td align="right">
		<table>
			<tr>
			    <td align="center">
				<span style="font-size:17px;">For</span> <span style="font-size: 17px;font-weight: bold;"><?= h($jobCard->company->name)?><br/></span>
				<?php 
				 echo $this->Html->Image('/signatures/'.$jobCard->creator->signature,['height'=>'50px','style'=>'height:50px;']); 
				 ?></br>
				<span style="font-size: 15px;font-weight: bold;">Authorised Signatory</span>
				</br>
				<span style="font-size:15px;"><?= h($jobCard->creator->name) ?></span><br/>
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
</div>
<?php } ?>
</div>