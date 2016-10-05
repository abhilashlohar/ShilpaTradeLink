<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption">
			<i class="icon-globe font-blue-steel"></i>
			<span class="caption-subject font-blue-steel uppercase">Add Vendor</span>
		</div>
	</div>
	<div class="portlet-body form">
		<!-- BEGIN FORM-->
		<?= $this->Form->create($purchaseOrder) ?>
			<div class="form-body">
				<div class="row">
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">Company <span class="required" aria-required="true">*</span></label>
							<?php echo $this->Form->input('company_id', ['options' => $companies,'label' => false,'class' => 'form-control input-sm']); ?>
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">Purchase Order No. <span class="required" aria-required="true">*</span></label>
							<div class="row">
								<div class="col-md-4">
									<?php echo $this->Form->input('po1', ['label' => false,'class' => 'form-control input-sm','readonly']); ?>
								</div>
								<div class="col-md-4">
									<?php echo $this->Form->input('po3', ['label' => false,'class' => 'form-control input-sm']); ?>
								</div>
								<div class="col-md-4">
									<?php echo $this->Form->input('po4', ['label' => false,'value'=>'16-17','class' => 'form-control input-sm','readonly']); ?>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">Vendor <span class="required" aria-required="true">*</span></label>
							<?php echo $this->Form->input('vendor_id', ['label' => false,'class' => 'form-control input-sm']); ?>
						</div>
					</div>
					
				</div>
				<div class="row">
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">Shipping Method <span class="required" aria-required="true">*</span></label>
							<?php echo $this->Form->input('shipping_method', ['label' => false,'class' => 'form-control input-sm','placeholder'=>'Shipping Method']); ?>
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">Shipping Terms <span class="required" aria-required="true">*</span></label>
							<?php echo $this->Form->input('shipping_terms', ['label' => false,'class' => 'form-control input-sm','placeholder'=>'Shipping Terms']); ?>
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">Delivery Date <span class="required" aria-required="true">*</span></label>
							<?php echo $this->Form->input('delivery_date', ['label' => false,'class' => 'form-control input-sm','placeholder'=>'Delivery Date']); ?>
						</div>
					</div>
				</div>
				
				<div class="table-scrollable">
								<table class="table table-hover">
								<thead>
								<tr>
									<th>
										 #
									</th>
									<th>
										 First Name
									</th>
									<th>
										 Last Name
									</th>
									<th>
										 Username
									</th>
									<th>
										 Status
									</th>
								</tr>
								</thead>
								<tbody>
								<tr>
									<td>
										 1
									</td>
									<td>
										 Mark
									</td>
									<td>
										 Otto
									</td>
									<td>
										 makr124
									</td>
									<td>
										<span class="label label-sm label-success">
										Approved </span>
									</td>
								</tr>
								<tr>
									<td>
										 2
									</td>
									<td>
										 Jacob
									</td>
									<td>
										 Nilson
									</td>
									<td>
										 jac123
									</td>
									<td>
										<span class="label label-sm label-info">
										Pending </span>
									</td>
								</tr>
								<tr>
									<td>
										 3
									</td>
									<td>
										 Larry
									</td>
									<td>
										 Cooper
									</td>
									<td>
										 lar
									</td>
									<td>
										<span class="label label-sm label-warning">
										Suspended </span>
									</td>
								</tr>
								<tr>
									<td>
										 4
									</td>
									<td>
										 Sandy
									</td>
									<td>
										 Lim
									</td>
									<td>
										 sanlim
									</td>
									<td>
										<span class="label label-sm label-danger">
										Blocked </span>
									</td>
								</tr>
								</tbody>
								</table>
							</div>
			</div>
			
			<div class="form-actions">
				 <button type="submit" class="btn blue-hoki">Add Vendor</button>
			</div>
		<?= $this->Form->end() ?>
		<!-- END FORM-->
	</div>
</div>

<div class="purchaseOrders form large-9 medium-8 columns content">
    <?= $this->Form->create($purchaseOrder) ?>
    <fieldset>
        <legend><?= __('Add Purchase Order') ?></legend>
        <?php
            echo $this->Form->input('company_id', ['options' => $companies]);
            echo $this->Form->input('vendor_id', ['options' => $vendors]);
            echo $this->Form->input('shipping_method');
            echo $this->Form->input('shipping_terms');
            echo $this->Form->input('delivery_date');
            echo $this->Form->input('total');
            echo $this->Form->input('terms_conditions');
            echo $this->Form->input('po1');
            echo $this->Form->input('po3');
            echo $this->Form->input('po4');
        ?>
    </fieldset>
    <?= $this->Form->button(__('Submit')) ?>
    <?= $this->Form->end() ?>
</div>
