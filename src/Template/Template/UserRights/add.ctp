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
				<div style="border-bottom: 1px solid #eee;" ></div>
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