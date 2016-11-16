
<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption">
		
		
			<i class="icon-globe font-blue-steel"></i>
			<span class="caption-subject font-blue-steel uppercase">Account Categories</span> 
			
			
		</div>
		<div class="actions">
			<?php echo $this->Html->link('<i class="icon-home"></i> Add Account Categories','/AccountCategories/add',array('escape'=>false,'class'=>'btn btn-xs blue')); ?>
			

			</div>
		</div>
		
		
			<div class="portlet-body">
		<div class="row">
			<div class="col-md-12">
				
				<?php $page_no=$this->Paginator->current('Account Categories'); $page_no=($page_no-1)*20; ?>
				<table class="table table-bordered table-striped table-hover">
						<thead>
							<tr>
								<th>S.No</th>
								<th>Name</th>
								<th class="actions"><?= __('Actions') ?></th>
							</tr>
					
					</thead>
					<tbody>
						   <?php foreach ($accountCategories as $accountCategory): ?>
						<tr>
							<td><?= h(++$page_no) ?></td>
							
							<td><?= h($accountCategory->name) ?></td>
										
							<td class="actions">
							
								<?= $this->Form->postLink('<i class="fa fa-trash"></i> ',
								['action' => 'delete', $accountCategory->id], 
								[
									'escape' => false,
									'class' => 'btn btn-xs btn-danger',
									'confirm' => __('Are you sure ?', $accountCategory->id)
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

