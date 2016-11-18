<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption">
		
		
			<i class="icon-globe font-blue-steel"></i>
			<span class="caption-subject font-blue-steel uppercase">Account Group</span> 
			
			
		</div>
		<div class="actions">
			<?php echo $this->Html->link('<i class="icon-home"></i> Add Account Group','/AccountGroups/add',array('escape'=>false,'class'=>'btn btn-xs blue')); ?>

			</div>
		</div>
		
		
			<div class="portlet-body">
		<div class="row">
			<div class="col-md-12">
				<form method="GET" >
					<table class="table table-condensed">
						<tbody>
							<tr>
								<td><input type="text" name="Account_category" class="form-control input-sm" placeholder="Account Category" value="<?php echo @$Account_category; ?>"></td>
								<td><input type="text" name="name" class="form-control input-sm" placeholder="Group Name" value="<?php echo @$name; ?>"></td>
								<td><button type="submit" class="btn btn-primary btn-sm"><i class="fa fa-filter"></i> Filter</button></td>
							</tr>
						</tbody>
					</table>
				</form>
				
				<?php $page_no=$this->Paginator->current('Account Categories'); $page_no=($page_no-1)*20; ?>
				<table class="table table-bordered table-striped table-hover">
						<thead>
							<tr>
								<th>S.No</th>
								<th>Account Categories</th>
								<th>Name</th>
								<th class="actions"><?= __('Actions') ?></th>
							</tr>
					
					</thead>
					<tbody>
					
						   <?php foreach ($accountGroups as $accountGroup): ?>
						<tr>
							<td><?= h(++$page_no) ?></td>
							
							<td><?= h($accountGroup->account_category->name) ?></td>
							
							<td><?= h($accountGroup->name) ?></td>
										
							<td class="actions">
								<?= $this->Form->postLink('<i class="fa fa-trash"></i> ',
								['action' => 'delete', $accountGroup->id], 
								[
									'escape' => false,
									'class' => 'btn btn-xs btn-danger',
									'confirm' => __('Are you sure ?', $accountGroup->id)
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


