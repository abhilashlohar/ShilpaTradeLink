
<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption" >
			<i class="icon-globe font-blue-steel"></i>
			<span class="caption-subject font-blue-steel uppercase">Edit Petty Cash Receipt Voucher</span>
		</div>
	</div>
	<div class="portlet-body form">
		<!-- BEGIN FORM-->
		 <?= $this->Form->create($pettyCashReceiptVoucher,['type' => 'file','id'=>'form_sample_3']) ?>
			<div class="form-body">
			<div class="row">
				<div class="col-md-9">
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
				<div class="row" style="margin-top:30px;">
				<div class="col-md-4" >
						<div class="form-group">
						<label class=" control-label">Transaction Date<span class="required" aria-required="true">*</span></label>
							<?php echo $this->Form->input('transaction_date', ['type' => 'text','label' => false,'class' => 'form-control input-sm date-picker','data-date-format' => 'dd-mm-yyyy','value' => date("d-m-Y",strtotime($pettyCashReceiptVoucher->transaction_date))]); ?>
						
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">Recived Form<span class="required" aria-required="true">*</span></label>
							<?php echo $this->Form->input('received_from_id', ['empty'=>'--Select-','label' => false,'class' => 'form-control input-sm select2me']); ?>
						
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">Bank/Cash<span class="required" aria-required="true">*</span></label>
							
							
							<?php echo $this->Form->input('bank_cash_id', ['empty'=>'--Select-','label' => false,'class' => 'form-control input-sm select2me']); ?>
						
						</div>
					</div>
					
					
				</div>
				<div class="row">
				<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">Mode of Payment</label>
							<div class="radio-list">
								<div class="radio-inline" >
								<?php echo $this->Form->radio(
									'payment_mode',
									[
										['value' => 'Cheque', 'text' => 'Cheque'],
										['value' => 'Cash', 'text' => 'Cash']
									]
								); ?>
								</div>
                                
							</div>
						</div>
					</div>
				<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">Amount<span class="required" aria-required="true">*</span></label>
							<?php echo $this->Form->input('amount', ['label' => false,'class' => 'form-control input-sm']); ?>
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">Narration <span class="required" aria-required="true">*</span></label>
							<?php echo $this->Form->input('narration', ['label' => false,'class' => 'form-control input-sm','placeholder'=>'Narration']); ?>
						</div>
					</div>
				</div>
				<div class="alert alert-danger" id="row_error" style="display:none;">
                    Fill all fileds.
                </div>
			</div>
		
			<div class="form-actions">
				<button type="submit" class="btn btn-primary">UPDATE PETTYCASH VOUCHER</button>
			</div>
		</div>
		<?= $this->Form->end() ?>
		<!-- END FORM-->
	</div>
</div>