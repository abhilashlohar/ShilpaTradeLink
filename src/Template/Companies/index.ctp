<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption">
			<i class="icon-globe font-blue-steel"></i>
			<span class="caption-subject font-blue-steel uppercase">Companies</span>
		</div>
	</div>
	<div class="portlet-body form">
		<!-- BEGIN FORM-->
		<div class="row ">
		<div class="col-md-12">
			<div class="portlet-body">
			<div class="table-scrollable">
			<table class="table ">
				 <thead>
					<tr>
						<th>Sr. No.</th>
						<th>Name</th>
						<th>Pan No</th>
						<th>Tin No</th>
						<th>Tan No</th>
						<th>Service Tax No</th>
						<th>Landline No</th>
						<th>Mobile No</th>
						<th>Email ID</th>
						<th width="75p">Actions</th>
					</tr>
				</thead>
				<tbody>
					<?php $i=0; foreach ($companies as $company): $i++; ?>
					<tr>
						<td rowspan="2"><?= $i ?></td>
						<td><?= h($company->name) ?></td>
						<td><?= h($company->pan_no) ?></td>
						<td><?= h($company->tin_no) ?></td>
						<td><?= h($company->tan_no) ?></td>
						<td><?= h($company->service_tax_no) ?></td>
						<td><?= h($company->landline_no) ?></td>
						<td><?= h($company->mobile_no) ?></td>
						<td><?= h($company->email) ?></td>
						<td rowspan="2">
							<?php echo $this->Html->link('<i class="fa fa-pencil-square-o"></i>',['action' => 'edit', $company->id],array('escape'=>false,'class'=>'btn btn-xs blue')); ?>
							<?= $this->Form->postLink('<i class="fa fa-trash"></i> ',
								['action' => 'delete', $company->id], 
								[
									'escape' => false,
									'class' => 'btn btn-xs btn-danger',
									'confirm' => __('Are you sure ?', $company->id)
								]
							) ?>
						</td>
					</tr>
					<tr>
						<td colspan="1"><?= h($company->company_group->name) ?></td>
						<td colspan="3"><a href="<?= h($company->website) ?>" target="_blank"><?= h($company->website) ?></a></td>
						<td colspan="1"><?= h($company->inventory_status) ?></td>
						<td colspan="3"><?= h($company->address) ?></td>
					</tr>
					<?php endforeach; ?>
				</tbody>
			</table>
			</div>
			<div class="paginator">
				<ul class="pagination pagination-sm pull-right">
					<?= $this->Paginator->prev('< ' . __('previous')) ?>
					<?= $this->Paginator->numbers() ?>
					<?= $this->Paginator->next(__('next') . ' >') ?>
				</ul>
				<p class="pull-left"><?= $this->Paginator->counter() ?></p>
			</div>
			</div>
		</div>
		<!-- END FORM-->
	</div>
</div>
</div>
<style>
.th{
	font-family: -webkit-pictograph !important;
}
</style>
