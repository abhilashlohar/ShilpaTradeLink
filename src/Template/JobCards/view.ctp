<?php //pr($jobCard); exit; ?>

<?php //pr($jobCard->sales_order); exit; ?>
<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption" >
			<i class="icon-globe font-blue-steel"></i>
			<span class="caption-subject font-blue-steel uppercase">view Job Card</span>
		</div>
	</div>
	
	
	<table width="100%" class="divHeader">
	<tr>
			<td width="50%"><?php echo $this->Html->image('/logos/'.$jobCard->company->logo, ['width' => '40%']); ?></td>
			<td align="right" width="50%" style="font-size: 12px;">
			<span style="font-size: 14px;"><?= h($jobCard->company->name) ?></span><br/>
			<span><?= $this->Text->autoParagraph(h($jobCard->company->address)) ?></span>
			<span><?= h($jobCard->company->mobile_no) ?></span>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<div align="center" style="font-size: 16px;font-weight: bold;color: #0685a8;">RECEIPT VOUCHER</div>
				<div style="border:solid 2px #0685a8;margin-bottom:5px;margin-top: 5px;"></div>
			</td>
		</tr>
	</table>
	
	
	
	 
	<div class="portlet-body form">
		<div class="form-body">
			<div class="row">
				<div class="col-md-4">
					<div class="form-group">
						<label class="col-md-5 control-label">SO No</label>
						<div class="col-md-7">
						<?= h(($jobCard->sales_order->so1.'/SO-'.str_pad($jobCard->sales_order->so2, 3, '0', STR_PAD_LEFT).'/'.$jobCard->sales_order->so3.'/'.$jobCard	->sales_order->so4))?>
					   </div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group">
						<label class="col-md-5 control-label">Customer Name </label>
						<div class="col-md-7">
							<?= h($jobCard->customer->customer_name) ?>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group">
						<label class="col-md-5 control-label">Job Card No</label>
						<div class="col-md-7">
						<?= h(($jobCard->jc1.'/JC-'.str_pad($jobCard->jc2, 3, '0', STR_PAD_LEFT).'/'.$jobCard->jc3.'/'.$jobCard->jc4))?>
					   </div>
					</div>
				</div>
			</div><br/>
			<div class="row">
				<div class="col-md-4">
					<div class="form-group">
						<label class="col-md-5 control-label">Dispatch Name </label>
						<div class="col-md-7">
						<?= h($jobCard->dispatch_name) ?></div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group">
						<label class="col-md-5 control-label">Dispatch Email</label>
						<div class="col-md-7">
							<?= h($jobCard->dispatch_email) ?></div> 
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group">
						<label class="col-md-5 control-label">Dispatch Address</label>
						<div class="col-md-7">
							<?= h($jobCard->dispatch_address)?></div> 
					</div>
				</div>
			</div><br/>
			<div class="row">
				<div class="col-md-4">
					<div class="form-group">
						<label class="col-md-5 control-label">Customer PO No</label>
						<div class="col-md-7">
							<?= h($jobCard->customer_po_no)?></div> 
						</div>
					</div>
				
				<div class="col-md-4">
					<div class="form-group">
						<label class="col-md-5 control-label">Required Date <span class="required" aria-required="true">*</span></label>
						<div class="col-md-7">
							<?= h($jobCard->required_date=date("d-m-Y",strtotime($jobCard->required_date))) ?> 
						</div>
					</div>
				</div>
			</div> 
	 
		</div>
</div>		
		
</br></br>
		
		<div class="col-md-14">
		<?php $page_no=$this->Paginator->current('SalesOrders'); $page_no=($page_no-1)*20; ?>	 
		<table class="table table-bordered table-striped table-hover" width="100%">
			<tbody>
					<tr>
					<td align="Center" style="font-size:120%;">Sr.No.</td>
					<td align="Center" style="font-size:120%;">Item Name</td>
					<td align="Center" style="font-size:120%;">Quantity</td>
					<td align="Center" style="font-size:120%;">Remark</td>
					</tr>
			</tbody>
		    <tbody>
			<?php foreach ($jobCard->job_card_rows as $job_card_rows): ?>
					<tr>
						<td align="Center"><?= h(++$page_no) ?></td>
						<td align="Center"><?= $job_card_rows->item->name?></td>
						<td align="Center"><?= $job_card_rows->quantity?></td>
						<td align="Center"><?= $job_card_rows->remark?></td>
					</tr>
			<?php endforeach; ?>
					
		   </tbody>
		 </table>
		 </div>
		 
		 <div class="form-body">
			<?php $page_no=$this->Paginator->current('SalesOrders'); $page_no=($page_no-1)*20; ?>	
			 	 <table width="100%" id="main_tb" border="1">
					<thead>
						<td align="Center" style="font-size:120%;">Sr.No.</td>
					<td align="Center" style="font-size:120%;">Item Name</td>
					<td align="Center" style="font-size:120%;">Quantity</td>
					<td align="Center" style="font-size:120%;">Remark</td>
					</thead>
					<tbody id="maintbody">
					<?php foreach ($jobCard->job_card_rows as $job_card_rows): ?>
						<tr class="main_tr">
						<td align="Center"><?= h(++$page_no) ?></td>
						<td align="Center"><?= $job_card_rows->item->name?></td>
						<td align="Center"><?= $job_card_rows->quantity?></td>
						<td align="Center"><?= $job_card_rows->remark?></td>
						</tr>
					<?php endforeach; ?>
					</tbody>
				</table>
			</div>
		 
		 
		 
		 
			    <div class="col-md-14">
				 <tr>
					<table width="100%" class="divHeader">
					<tr>
						<td align="right">
						For <?= h($jobCard->company->name) ?><br/><br/><br/><span style="    border-top: solid 1px #585757;">Authorised Signatory</span>
						</td>
					</tr>
					</table>
					</td>
				  </tr>
				  </div>
				  

 
		<!-- END FORM-->
	</div>