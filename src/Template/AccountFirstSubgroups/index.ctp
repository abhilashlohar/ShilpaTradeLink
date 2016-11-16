<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption">
		
		
			<i class="icon-globe font-blue-steel"></i>
			<span class="caption-subject font-blue-steel uppercase">Account First Sub-Group</span> 
			
			
		</div>
		<div class="actions">
			<?php echo $this->Html->link('<i class="icon-home"></i> Add Account First SubGroup','/AccountFirstSubgroups/add',array('escape'=>false,'class'=>'btn btn-xs blue')); ?>

			</div>
		</div>
		
		
			<div class="portlet-body">
		<div class="row">
			<div class="col-md-12">
				
				<?php $page_no=$this->Paginator->current('Account Group Name'); $page_no=($page_no-1)*20; ?>
				<table class="table table-bordered table-striped table-hover">
						<thead>
							<tr>
								<th>S.No</th>
								<th>Account Group</th>
								<th>Name</th>
								<th class="actions"><?= __('Actions') ?></th>
							</tr>
					
					</thead>
					<tbody>
					 <?php foreach ($accountFirstSubgroups as $accountFirstSubgroup): ?>
						<tr>
							<td><?= h(++$page_no) ?></td>
							
							<td><?= h($accountFirstSubgroup->name) ?></td>
							<td><?= h($accountFirstSubgroup->account_group->name) ?></td>
										
							<td class="actions">
								<?= $this->Form->postLink('<i class="fa fa-trash"></i> ',
								['action' => 'delete', $accountFirstSubgroup->id], 
								[
									'escape' => false,
									'class' => 'btn btn-xs btn-danger',
									'confirm' => __('Are you sure ?', $accountFirstSubgroup->id)
								]
							) ?>
								
								
							</td>
						</tr>
						<?php endforeach; ?>
					</tbody>
				</table>
				<div class="paginator">
					<ul class="pagination">
						<?= $this->Paginator->prev('< ' . __('previous')) ?>
						<?= $this->Paginator->numbers() ?>
						<?= $this->Paginator->next(__('next') . ' >') ?>
					</ul>
					<p><?= $this->Paginator->counter() ?></p>
				</div>
			</div>
		</div>
	</div>
</div>



