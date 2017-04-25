<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption">
			<i class="icon-globe font-blue-steel"></i>
			<span class="caption-subject font-blue-steel uppercase">User Rights - <?php echo $EmployeeName; ?></span>
		</div>
	</div>
	<div class="portlet-body form">
		<?= $this->Form->create($userRight) ?>
		<div class="row ">
			<div class="col-md-12">
				<div class="col-md-6">
					<div class="titletext"><b>Quotation</b></div>
					<div class="checkbox-list">
						<label class="checkbox-inline">
							<?php 
							if(in_array(1,$page_ids)){ $checked_status='checked'; }else{ $checked_status=''; }
							echo $this->Form->input('user_rights.0.page_id', ['label' => 'Create','class' => 'form-control input-sm','type'=>'checkbox','value'=>1,$checked_status]); ?>
						</label>
						<label class="checkbox-inline">
							<?php 
							if(in_array(2,$page_ids)){ $checked_status='checked'; }else{ $checked_status=''; }
							echo $this->Form->input('user_rights.1.page_id', ['label' => 'Edit','class' => 'form-control input-sm','type'=>'checkbox','value'=>2,$checked_status]); ?>
						</label>
						<label class="checkbox-inline">
							<?php 
							if(in_array(21,$page_ids)){ $checked_status='checked'; }else{ $checked_status=''; }
							echo $this->Form->input('user_rights.21.page_id', ['label' => 'View','class' => 'form-control input-sm','type'=>'checkbox','value'=>21,$checked_status]);
							?>
						</label>
						<label class="checkbox-inline">
							<?php 
							if(in_array(30,$page_ids)){ $checked_status='checked'; }else{ $checked_status=''; }
							echo $this->Form->input('user_rights.30.page_id', ['label' => 'Close','class' => 'form-control input-sm','type'=>'checkbox','value'=>30,$checked_status]);
							?>
						</label>
					</div>
					<div style="border-bottom: 1px solid #eee;" ></div>
				</div>
				<div class="col-md-6">
					<div class="titletext"><b>Sales-Order</b></div>
					<div class="checkbox-list">
						<label class="checkbox-inline">
							<?php 
							if(in_array(3,$page_ids)){ $checked_status='checked'; }else{ $checked_status=''; }
							echo $this->Form->input('user_rights.3.page_id', ['label' => 'Create','class' => 'form-control input-sm','type'=>'checkbox','value'=>3,$checked_status]); ?>
						</label>
						<label class="checkbox-inline">
							<?php 
							if(in_array(4,$page_ids)){ $checked_status='checked'; }else{ $checked_status=''; }
							echo $this->Form->input('user_rights.4.page_id', ['label' => 'Edit','class' => 'form-control input-sm','type'=>'checkbox','value'=>4,$checked_status]); ?>
						</label>
						<label class="checkbox-inline">
							<?php 
							if(in_array(22,$page_ids)){ $checked_status='checked'; }else{ $checked_status=''; }
							echo $this->Form->input('user_rights.22.page_id', ['label' => 'View','class' => 'form-control input-sm','type'=>'checkbox','value'=>22,$checked_status]); ?>
						</label>
					</div>
					<div style="border-bottom: 1px solid #eee;" ></div>
				</div>

				<div class="col-md-6">
					<div class="titletext"><b>Job-Card</b></div>
					<div class="checkbox-list">
						<label class="checkbox-inline">
							<?php 
							if(in_array(5,$page_ids)){ $checked_status='checked'; }else{ $checked_status=''; }
							echo $this->Form->input('user_rights.5.page_id', ['label' => 'Create','class' => 'form-control input-sm','type'=>'checkbox','value'=>5,$checked_status]); ?>
						</label>
						<label class="checkbox-inline">
							<?php 
							if(in_array(6,$page_ids)){ $checked_status='checked'; }else{ $checked_status=''; }
							echo $this->Form->input('user_rights.6.page_id', ['label' => 'Edit','class' => 'form-control input-sm','type'=>'checkbox','value'=>6,$checked_status]); ?>
						</label>
						<label class="checkbox-inline">
							<?php 
							if(in_array(24,$page_ids)){ $checked_status='checked'; }else{ $checked_status=''; }
							echo $this->Form->input('user_rights.24.page_id', ['label' => 'View','class' => 'form-control input-sm','type'=>'checkbox','value'=>24,$checked_status]); ?>
						</label>
						<label class="checkbox-inline">
							<?php 
							if(in_array(34,$page_ids)){ $checked_status='checked'; }else{ $checked_status=''; }
							echo $this->Form->input('user_rights.34.page_id', ['label' => 'Close','class' => 'form-control input-sm','type'=>'checkbox','value'=>34,$checked_status]); ?>
						</label>
					</div>
					<div style="border-bottom: 1px solid #eee;" ></div>
				</div>
				
				<div class="col-md-6">
					<div class="titletext"><b>Challan</b></div>
					<div class="checkbox-list">
						<label class="checkbox-inline">
							<?php 
							if(in_array(11,$page_ids)){ $checked_status='checked'; }else{ $checked_status=''; }
							echo $this->Form->input('user_rights.11.page_id', ['label' => 'Create','class' => 'form-control input-sm','type'=>'checkbox','value'=>11,$checked_status]); ?>
						</label>
						<label class="checkbox-inline">
							<?php 
							if(in_array(12,$page_ids)){ $checked_status='checked'; }else{ $checked_status=''; }
							echo $this->Form->input('user_rights.12.page_id', ['label' => 'Edit','class' => 'form-control input-sm','type'=>'checkbox','value'=>12,$checked_status]); ?>
						</label>
						<label class="checkbox-inline">
							<?php 
							if(in_array(28,$page_ids)){ $checked_status='checked'; }else{ $checked_status=''; }
							echo $this->Form->input('user_rights.28.page_id', ['label' => 'View','class' => 'form-control input-sm','type'=>'checkbox','value'=>28,$checked_status]); 
							?>
						</label>
					</div>
					<div style="border-bottom: 1px solid #eee;" ></div>
				</div>
				<div class="col-md-6">
					<div class="titletext"><b>Invoice</b></div>
					<div class="checkbox-list">
						<label class="checkbox-inline">
							<?php 
							if(in_array(7,$page_ids)){ $checked_status='checked'; }else{ $checked_status=''; }
							echo $this->Form->input('user_rights.7.page_id', ['label' => 'Create','class' => 'form-control input-sm','type'=>'checkbox','value'=>7,$checked_status]); ?>
						</label>
						<label class="checkbox-inline">
							<?php 
							if(in_array(8,$page_ids)){ $checked_status='checked'; }else{ $checked_status=''; }
							echo $this->Form->input('user_rights.8.page_id', ['label' => 'Edit','class' => 'form-control input-sm','type'=>'checkbox','value'=>8,$checked_status]); ?>
						</label>
						<label class="checkbox-inline">
							<?php 
							if(in_array(23,$page_ids)){ $checked_status='checked'; }else{ $checked_status=''; }
							echo $this->Form->input('user_rights.23.page_id', ['label' => 'View','class' => 'form-control input-sm','type'=>'checkbox','value'=>23,$checked_status]); 
							?>
						</label>
						<label class="checkbox-inline">
								<?php 
								if(in_array(33,$page_ids)){ $checked_status='checked'; }else{ $checked_status=''; }
								echo $this->Form->input('user_rights.33.page_id', ['label' => 'Close','class' => 'form-control input-sm','type'=>'checkbox','value'=>33,$checked_status]);
								?>
						</label>
					</div>
					<div style="border-bottom: 1px solid #eee;" ></div>
				</div>
				
				<div class="col-md-6">
					<div class="titletext"><b>Purchase Order</b></div>
					<div class="checkbox-list">
						<label class="checkbox-inline">
							<?php 
							if(in_array(13,$page_ids)){ $checked_status='checked'; }else{ $checked_status=''; }
							echo $this->Form->input('user_rights.13.page_id', ['label' => 'Create','class' => 'form-control input-sm','type'=>'checkbox','value'=>13,$checked_status]); ?>
						</label>
						<label class="checkbox-inline">
							<?php 
							if(in_array(14,$page_ids)){ $checked_status='checked'; }else{ $checked_status=''; }
							echo $this->Form->input('user_rights.14.page_id', ['label' => 'Edit','class' => 'form-control input-sm','type'=>'checkbox','value'=>14,$checked_status]); ?>
						</label>
						<label class="checkbox-inline">
							<?php 
							if(in_array(31,$page_ids)){ $checked_status='checked'; }else{ $checked_status=''; }
							echo $this->Form->input('user_rights.31.page_id', ['label' => 'View','class' => 'form-control input-sm','type'=>'checkbox','value'=>31,$checked_status]); 
							?>
						</label>
					</div>
					<div style="border-bottom: 1px solid #eee;" ></div>
				</div>
				<div class="col-md-6">
					<div class="titletext"><b>Inventory Voucher</b></div>
					<div class="checkbox-list">
						<label class="checkbox-inline">
							<?php 
							if(in_array(9,$page_ids)){ $checked_status='checked'; }else{ $checked_status=''; }
							echo $this->Form->input('user_rights.9.page_id', ['label' => 'Create','class' => 'form-control input-sm','type'=>'checkbox','value'=>9,$checked_status]); ?>
						</label>
						<label class="checkbox-inline">
							<?php 
							if(in_array(10,$page_ids)){ $checked_status='checked'; }else{ $checked_status=''; }
							echo $this->Form->input('user_rights.10.page_id', ['label' => 'View','class' => 'form-control input-sm','type'=>'checkbox','value'=>10,$checked_status]); ?>
						</label>
					</div>
					<div style="border-bottom: 1px solid #eee;" ></div>
				</div>
				
				<div class="col-md-6">
					<div class="titletext"><b>Grn</b></div>
					<div class="checkbox-list">
						<label class="checkbox-inline">
							<?php 
							if(in_array(15,$page_ids)){ $checked_status='checked'; }else{ $checked_status=''; }
							echo $this->Form->input('user_rights.15.page_id', ['label' => 'Create','class' => 'form-control input-sm','type'=>'checkbox','value'=>15,$checked_status]); ?>
						</label>
						<label class="checkbox-inline">
							<?php 
							if(in_array(16,$page_ids)){ $checked_status='checked'; }else{ $checked_status=''; }
							echo $this->Form->input('user_rights.16.page_id', ['label' => 'Edit','class' => 'form-control input-sm','type'=>'checkbox','value'=>16,$checked_status]); ?>
						</label>
					</div>
					<div style="border-bottom: 1px solid #eee;" ></div>
				</div>
				<div class="col-md-6">
						<div class="titletext"><b>Invoice Booking</b></div>
						<div class="checkbox-list">
						<label class="checkbox-inline">
							<?php 
							if(in_array(17,$page_ids)){ $checked_status='checked'; }else{ $checked_status=''; }
							echo $this->Form->input('user_rights.17.page_id', ['label' => 'Create','class' => 'form-control input-sm','type'=>'checkbox','value'=>17,$checked_status]); ?>
						</label>
						<label class="checkbox-inline">
							<?php 
							if(in_array(18,$page_ids)){ $checked_status='checked'; }else{ $checked_status=''; }
							echo $this->Form->input('user_rights.18.page_id', ['label' => 'Edit','class' => 'form-control input-sm','type'=>'checkbox','value'=>18,$checked_status]); ?>
						</label>
						</div>
					</div>
					<div class="col-md-6">
						<div class="titletext"><b>User-Rights/Logins</b></div>
						<div class="checkbox-list">
						<label class="checkbox-inline">
							<?php 
							if(in_array(19,$page_ids)){ $checked_status='checked'; }else{ $checked_status=''; }
							echo $this->Form->input('user_rights.19.page_id', ['label' => 'Login','class' => 'form-control input-sm','type'=>'checkbox','value'=>19,$checked_status]); ?>
						</label>
						<label class="checkbox-inline">
							<?php 
							if(in_array(20,$page_ids)){ $checked_status='checked'; }else{ $checked_status=''; }
							echo $this->Form->input('user_rights.20.page_id', ['label' => 'User-Right','class' => 'form-control input-sm','type'=>'checkbox','value'=>20,$checked_status]); ?>
						</label>
						</div>
					</div>
		</div></br>
		<div class="col-md-12">
			<div class="col-md-5"></div>
			<div class="col-md-2" style="text-align:center;">
				<div class="titletext"><b><u>Report</u></b></div>
			</div>
			<div style="border-bottom: 1px solid #eee;" ></div>
		</div>
		<div class="col-md-12">
				<div class="col-md-3">
					<div class="titletext">Stock-Report</div>
						<div class="checkbox-list">
							<label class="checkbox-inline">
								<?php 
								if(in_array(36,$page_ids)){ $checked_status='checked'; }else{ $checked_status=''; }
								echo $this->Form->input('user_rights.36.page_id', ['label' => 'View','class' => 'form-control input-sm','type'=>'checkbox','value'=>36,$checked_status]); ?>
							</label>
						</div>
				</div>
				<div class="col-md-3">
					<div class="titletext">Balance-Sheet</div>
						<div class="checkbox-list">
							<label class="checkbox-inline">
								<?php 
								if(in_array(37,$page_ids)){ $checked_status='checked'; }else{ $checked_status=''; }
								echo $this->Form->input('user_rights.37.page_id', ['label' => 'View','class' => 'form-control input-sm','type'=>'checkbox','value'=>37,$checked_status]); ?>
							</label>
						</div>
				</div>
				<div class="col-md-3">
					<div class="titletext">Profit Loss Statement</div>
						<div class="checkbox-list">
							<label class="checkbox-inline">
								<?php 
								if(in_array(38,$page_ids)){ $checked_status='checked'; }else{ $checked_status=''; }
								echo $this->Form->input('user_rights.38.page_id', ['label' => 'View','class' => 'form-control input-sm','type'=>'checkbox','value'=>38,$checked_status]); ?>
							</label>
						</div>
				</div>
				<div class="col-md-3">
					<div class="titletext">Material Indent Report</div>
						<div class="checkbox-list">
							<label class="checkbox-inline">
								<?php 
								if(in_array(39,$page_ids)){ $checked_status='checked'; }else{ $checked_status=''; }
								echo $this->Form->input('user_rights.39.page_id', ['label' => 'View','class' => 'form-control input-sm','type'=>'checkbox','value'=>39,$checked_status]); ?>
							</label>
						</div>
				</div>
				<div class="col-md-3">
					<div class="titletext">Account-Statement</div>
						<div class="checkbox-list">
							<label class="checkbox-inline">
								<?php 
								if(in_array(40,$page_ids)){ $checked_status='checked'; }else{ $checked_status=''; }
								echo $this->Form->input('user_rights.40.page_id', ['label' => 'View','class' => 'form-control input-sm','type'=>'checkbox','value'=>40,$checked_status]); ?>
							</label>
						</div>
				</div>
				<div class="col-md-3">
					<div class="titletext">Daily Report</div>
						<div class="checkbox-list">
							<label class="checkbox-inline">
								<?php 
								if(in_array(41,$page_ids)){ $checked_status='checked'; }else{ $checked_status=''; }
								echo $this->Form->input('user_rights.41.page_id', ['label' => 'View','class' => 'form-control input-sm','type'=>'checkbox','value'=>41,$checked_status]); ?>
							</label>
						</div>
				</div>
				<div style="border-bottom: 1px solid #eee;" ></div>
		</div>
		<br/>
		<div class="col-md-12">
			<div class="col-md-7" style="text-align:right;">
				<div class="titletext"><b><u>Master Setup</u></b></div>
			</div>
			<div style="border-bottom: 1px solid #eee;" ></div>
		</div>			
		<div class="col-md-12">
				<div class="col-md-3">
					<div class="titletext">Customer</div>
						<div class="checkbox-list">
							<label class="checkbox-inline">
								<?php 
								if(in_array(42,$page_ids)){ $checked_status='checked'; }else{ $checked_status=''; }
								echo $this->Form->input('user_rights.42.page_id', ['label' => 'Add','class' => 'form-control input-sm','type'=>'checkbox','value'=>42,$checked_status]); ?>
							</label>
						</div>
				</div>
				<div class="col-md-3">
					<div class="titletext"> &nbsp </div>
						<div class="checkbox-list">
							<label class="checkbox-inline">
								<?php 
								if(in_array(43,$page_ids)){ $checked_status='checked'; }else{ $checked_status=''; }
								echo $this->Form->input('user_rights.43.page_id', ['label' => 'View','class' => 'form-control input-sm','type'=>'checkbox','value'=>43,$checked_status]); ?>
							</label>
						</div>
				</div>
				<div class="col-md-3">
					<div class="titletext"> &nbsp </div>
						<div class="checkbox-list">
							<label class="checkbox-inline">
								<?php 
								if(in_array(44,$page_ids)){ $checked_status='checked'; }else{ $checked_status=''; }
								echo $this->Form->input('user_rights.44.page_id', ['label' => 'Edit','class' => 'form-control input-sm','type'=>'checkbox','value'=>44,$checked_status]); ?>
							</label>
						</div>
				</div>
				<div class="col-md-3">
					<div class="titletext"> &nbsp </div>
						<div class="checkbox-list">
							<label class="checkbox-inline">
								<?php 
								if(in_array(45,$page_ids)){ $checked_status='checked'; }else{ $checked_status=''; }
								echo $this->Form->input('user_rights.45.page_id', ['label' => 'Edit Company','class' => 'form-control input-sm','type'=>'checkbox','value'=>45,$checked_status]); ?>
							</label>
						</div>
				</div>
				<div class="col-md-3">
					<div class="titletext">Employee</div>
						<div class="checkbox-list">
							<label class="checkbox-inline">
								<?php 
								if(in_array(46,$page_ids)){ $checked_status='checked'; }else{ $checked_status=''; }
								echo $this->Form->input('user_rights.46.page_id', ['label' => 'Add','class' => 'form-control input-sm','type'=>'checkbox','value'=>46,$checked_status]); ?>
							</label>
						</div>
				</div>
				<div class="col-md-3">
					<div class="titletext"> &nbsp </div>
						<div class="checkbox-list">
							<label class="checkbox-inline">
								<?php 
								if(in_array(47,$page_ids)){ $checked_status='checked'; }else{ $checked_status=''; }
								echo $this->Form->input('user_rights.47.page_id', ['label' => 'View','class' => 'form-control input-sm','type'=>'checkbox','value'=>47,$checked_status]); ?>
							</label>
						</div>
				</div>
				<div class="col-md-3">
					<div class="titletext">&nbsp </div>
						<div class="checkbox-list">
							<label class="checkbox-inline">
								<?php 
								if(in_array(48,$page_ids)){ $checked_status='checked'; }else{ $checked_status=''; }
								echo $this->Form->input('user_rights.48.page_id', ['label' => 'Edit','class' => 'form-control input-sm','type'=>'checkbox','value'=>48,$checked_status]); ?>
							</label>
						</div>
				</div>
				<div class="col-md-3">
					<div class="titletext"> &nbsp </div>
						<div class="checkbox-list">
							<label class="checkbox-inline">
								<?php 
								if(in_array(49,$page_ids)){ $checked_status='checked'; }else{ $checked_status=''; }
								echo $this->Form->input('user_rights.49.page_id', ['label' => 'Edit Company','class' => 'form-control input-sm','type'=>'checkbox','value'=>49,$checked_status]); ?>
							</label>
						</div>
				</div>
				<div class="col-md-3">
					<div class="titletext">Items</div>
						<div class="checkbox-list">
							<label class="checkbox-inline">
								<?php 
								if(in_array(50,$page_ids)){ $checked_status='checked'; }else{ $checked_status=''; }
								echo $this->Form->input('user_rights.50.page_id', ['label' => 'Add','class' => 'form-control input-sm','type'=>'checkbox','value'=>50,$checked_status]); ?>
							</label>
						</div>
				</div>
				<div class="col-md-3">
					<div class="titletext"> &nbsp </div>
						<div class="checkbox-list">
							<label class="checkbox-inline">
								<?php 
								if(in_array(51,$page_ids)){ $checked_status='checked'; }else{ $checked_status=''; }
								echo $this->Form->input('user_rights.51.page_id', ['label' => 'View','class' => 'form-control input-sm','type'=>'checkbox','value'=>51,$checked_status]); ?>
							</label>
						</div>
				</div>
				<div class="col-md-3">
					<div class="titletext">&nbsp </div>
						<div class="checkbox-list">
							<label class="checkbox-inline">
								<?php 
								if(in_array(52,$page_ids)){ $checked_status='checked'; }else{ $checked_status=''; }
								echo $this->Form->input('user_rights.52.page_id', ['label' => 'Edit','class' => 'form-control input-sm','type'=>'checkbox','value'=>52,$checked_status]); ?>
							</label>
						</div>
				</div>
				<div class="col-md-3">
					<div class="titletext"> &nbsp </div>
						<div class="checkbox-list">
							<label class="checkbox-inline">
								<?php 
								if(in_array(53,$page_ids)){ $checked_status='checked'; }else{ $checked_status=''; }
								echo $this->Form->input('user_rights.53.page_id', ['label' => 'Edit Company','class' => 'form-control input-sm','type'=>'checkbox','value'=>53,$checked_status]); ?>
							</label>
						</div>
				</div>
			<div style="border-bottom: 1px solid #eee;" ></div>
		</div>
		
		<br/>
		<?= $this->Form->button(__('Update'),['class'=>'btn btn-primary']) ?>
		<?= $this->Form->end() ?>
	</div>
</div>
<style>
.titletext{
	font-size: 16px;
    color: #626262;
}
</style>