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
				<div class="col-md-3">
				<div class="titletext">Quotation</div>
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
				</div>
				</div>
				<div class="col-md-3">
				<div class="titletext">Sales-Order</div>
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
				</div>
				</div>
				<div class="col-md-3">
				<div class="titletext">Job-Card</div>
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
				</div>
				</div>
				<div class="col-md-3">
				<div class="titletext">Invoice</div>
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
				</div>
				</div>


				<div style="border-bottom: 1px solid #eee;" ></div>
			</div>
			<div class="col-md-12">
				<div class="col-md-3">
				<div class="titletext">Inventory Voucher</div>
				<div class="checkbox-list">
					<label class="checkbox-inline">
						<?php 
						if(in_array(9,$page_ids)){ $checked_status='checked'; }else{ $checked_status=''; }
						echo $this->Form->input('user_rights.9.page_id', ['label' => 'Create','class' => 'form-control input-sm','type'=>'checkbox','value'=>9,$checked_status]); ?>
					</label>
					<label class="checkbox-inline">
						<?php 
						if(in_array(10,$page_ids)){ $checked_status='checked'; }else{ $checked_status=''; }
						echo $this->Form->input('user_rights.10.page_id', ['label' => 'Edit','class' => 'form-control input-sm','type'=>'checkbox','value'=>10,$checked_status]); ?>
					</label>
				</div>
				</div>
				<div class="col-md-3">
				<div class="titletext">Challan</div>
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
				</div>
				</div>
				<div class="col-md-3">
				<div class="titletext">Purchase Order</div>
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
				</div>
				</div>
				<div class="col-md-3">
				<div class="titletext">Grn</div>
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
				</div>


				<div style="border-bottom: 1px solid #eee;" ></div>
			</div>
				<div class="col-md-12">
					<div class="col-md-3">
						<div class="titletext">Invoice Booking</div>
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
			</div>
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