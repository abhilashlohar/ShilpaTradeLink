<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption" >
			<i class="icon-globe font-blue-steel"></i>
			<span class="caption-subject font-blue-steel uppercase">Add Job Card</span>
		</div>
		<div class="actions">
		<?php echo $this->Html->link('<i class="fa fa-files-o"></i> Pull Sales-Order','/Sales-Orders/index?job-card=true',array('escape'=>false,'class'=>'btn btn-xs blue')); ?>
		</div>
	</div>
	<?php if(!empty($salesOrder)){ ?>
	<div class="portlet-body form">
		<!-- BEGIN FORM-->
		 <?= $this->Form->create($jobCard,['id'=>'form_sample_3']) ?>
			<div class="form-body">
				<div class="row">
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">Company Name <span class="required" aria-required="true">*</span></label>
							<?php echo $this->Form->input('company_id', ['empty'=>'--Select--','options' => $companies,'class' => 'form-control input-sm select2me','label'=>false]); ?>
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">Date <span class="required" aria-required="true">*</span></label><br/>
							<?php echo date("d-m-Y"); ?>
						</div>
					</div>
				</div>
				<div align="center"><h4>Sales-Order : <?= h($salesOrder->so1.'/'.str_pad($salesOrder->so2, 3, '0', STR_PAD_LEFT).'/'.$salesOrder->so3.'/'.$salesOrder->so4) ?></h4></div>
				<table class="table table-bordered">
					<thead>
						<th width="30%">In</th>
						<th>Out</th>
					</thead>
					<tbody>
					<?php foreach($salesOrder->sales_order_rows as $sales_order_row){ ?>
						<tr>
							<td><?= h($sales_order_row->item->name) ?></td>
							<td></td>
						</tr>
					<?php } ?>
					</tbody>
				</table>
			</div>
		
			<div class="form-actions">
				<button type="submit" class="btn btn-primary">CREATE JOB CARD</button>
			</div>
		<?= $this->Form->end() ?>
	</div>
	<?php } ?>
		<!-- END FORM-->
	</div>
</div>
<?php echo $this->Html->script('/assets/global/plugins/jquery.min.js'); ?>
<script>
$(document).ready(function() {
	//alert();
});
</script>

