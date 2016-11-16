
<div class="accountSecondSubgroups index large-9 medium-8 columns content">
    <h3><?= __('Account Second Subgroups') ?></h3>
    <table cellpadding="0" cellspacing="0">
        <thead>
            <tr>
                <th><?= $this->Paginator->sort('id') ?></th>
                <th><?= $this->Paginator->sort('account_first_subgroup_id') ?></th>
                <th><?= $this->Paginator->sort('name') ?></th>
                <th class="actions"><?= __('Actions') ?></th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($accountSecondSubgroups as $accountSecondSubgroup): ?>
            <tr>
                <td><?= $this->Number->format($accountSecondSubgroup->id) ?></td>
                <td><?= $accountSecondSubgroup->has('account_first_subgroup') ? $this->Html->link($accountSecondSubgroup->account_first_subgroup->name, ['controller' => 'AccountFirstSubgroups', 'action' => 'view', $accountSecondSubgroup->account_first_subgroup->id]) : '' ?></td>
                <td><?= h($accountSecondSubgroup->name) ?></td>
                <td class="actions">
                    <?= $this->Html->link(__('View'), ['action' => 'view', $accountSecondSubgroup->id]) ?>
                    <?= $this->Html->link(__('Edit'), ['action' => 'edit', $accountSecondSubgroup->id]) ?>
                    <?= $this->Form->postLink(__('Delete'), ['action' => 'delete', $accountSecondSubgroup->id], ['confirm' => __('Are you sure you want to delete # {0}?', $accountSecondSubgroup->id)]) ?>
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




<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption">
		
		
			<i class="icon-globe font-blue-steel"></i>
			<span class="caption-subject font-blue-steel uppercase">Account Second Sub-Group</span> 
			
			
		</div>
		<div class="actions">
			<?php echo $this->Html->link('<i class="icon-home"></i> Add Account Second SubGroup','/AccountSecondSubgroups/add',array('escape'=>false,'class'=>'btn btn-xs blue')); ?>

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
								<th>Name</th>
								<th>First Sub-Group</th>
								<th class="actions"><?= __('Actions') ?></th>
							</tr>
					
					</thead>
					<tbody>
					 <?php foreach ($accountSecondSubgroups as $accountSecondSubgroup): ?>
						<tr>
							<td><?= h(++$page_no) ?></td>
							
							<td><?= h($accountSecondSubgroups->name) ?></td>
							  <td><?=  h($accountSecondSubgroup->account_first_subgroup->name?></td>
										
							<td class="actions">
								<?= $this->Form->postLink('<i class="fa fa-trash"></i> ',
								['action' => 'delete', $accountSecondSubgroup->id], 
								[
									'escape' => false,
									'class' => 'btn btn-xs btn-danger',
									'confirm' => __('Are you sure ?', $accountSecondSubgroup->id)
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




