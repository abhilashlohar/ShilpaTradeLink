
<div class="accountGroups index large-9 medium-8 columns content">
    <h3><?= __('Account Groups') ?></h3>
    <table cellpadding="0" cellspacing="0">
        <thead>
            <tr>
                <th><?= $this->Paginator->sort('id') ?></th>
                <th><?= $this->Paginator->sort('account_category_id') ?></th>
                <th><?= $this->Paginator->sort('name') ?></th>
                <th class="actions"><?= __('Actions') ?></th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($accountGroups as $accountGroup): ?>
            <tr>
                <td><?= $this->Number->format($accountGroup->id) ?></td>
                <td><?= $accountGroup->has('account_category') ? $this->Html->link($accountGroup->account_category->id, ['controller' => 'AccountCategories', 'action' => 'view', $accountGroup->account_category->id]) : '' ?></td>
                <td><?= h($accountGroup->name) ?></td>
                <td class="actions">
                    <?= $this->Html->link(__('View'), ['action' => 'view', $accountGroup->id]) ?>
                    <?= $this->Html->link(__('Edit'), ['action' => 'edit', $accountGroup->id]) ?>
                    <?= $this->Form->postLink(__('Delete'), ['action' => 'delete', $accountGroup->id], ['confirm' => __('Are you sure you want to delete # {0}?', $accountGroup->id)]) ?>
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
			<span class="caption-subject font-blue-steel uppercase">Account Group</span> 
			
			
		</div>
		<div class="actions">
			<?php echo $this->Html->link('<i class="icon-home"></i> Add Account Group','/AccountGroups/add',array('escape'=>false,'class'=>'btn btn-xs blue')); ?>

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
						   <?php foreach ($accountGroups as $accountGroup): ?>
						<tr>
							<td><?= h(++$page_no) ?></td>
							
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


