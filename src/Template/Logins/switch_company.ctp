<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption">
			<i class="icon-globe font-blue-steel"></i>
			<span class="caption-subject font-blue-steel uppercase">Switch Company</span>
		</div>
	</div>
	<div class="portlet-body form">
		<!-- BEGIN FORM-->
		<div class="row ">
		<div class="col-md-6">
			<div class="portlet-body">
			<div class="table-scrollable">
			<table class="table table-hover">
				<thead>
					<tr>
						<th>Sr. No.</th>
						<th>Company</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
					 <?php $i=0; foreach ($Employee->companies as $company):  $i++; ?>
					<tr>
						<td><?= h($i) ?></td>
						<td><?= h($company->name) ?></td>
						<td class="actions">
							<?= $this->Form->postLink(__('Switch'),'/Logins/SwitchCompany/'.$company->id, ['confirm' => __('Are you sure you want to switch ?')]) ?>
						</td>
					</tr>
					<?php endforeach; ?>
				</tbody>
			</table>
			</div>
			</div>
		</div>
		<!-- END FORM-->
	</div>
</div>
</div>

