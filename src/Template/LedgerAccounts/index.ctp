

<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption">
			<i class="icon-globe font-blue-steel"></i>
			<span class="caption-subject font-blue-steel uppercase">Ledger Account</span>
		</div>
		<div class="actions">
			<?php echo $this->Html->link('Ledger Account','/LedgerAccounts/',array('escape'=>false,'class'=>'btn btn-primary')); ?>
			<?php echo $this->Html->link('Account Group','/AccountGroups/',array('escape'=>false,'class'=>'btn btn-default')); ?>
			<?php echo $this->Html->link('Account First Sub Group','/AccountFirstSubgroups/',array('escape'=>false,'class'=>'btn btn-default')); ?>
			<?php echo $this->Html->link('Account Second Sub Group','/AccountSecondSubgroups/',array('escape'=>false,'class'=>'btn btn-default')); ?>
		</div>
	</div>
	<div class="portlet-body form">
		<!-- BEGIN FORM-->
		<div class="row ">
		
		<div class="col-md-12">
		<div class="table-scrollable">
		 <?php $page_no=$this->Paginator->current('LedgerAccounts'); $page_no=($page_no-1)*20; ?>
			<table class="table table-hover">
				 <thead>
					<tr>
						<th>Sr. No.</th>
						<th>Account Category</th>
						<th>Account Group</th>
						<th>Account First Subgroup </th>
						<th>Account Second Subgroup </th>	
						<th>Ledger Account </th>	
						
					</tr>
				</thead>
				<tbody>
					<?php $i=0;foreach ($ledgerAccounts as $ledgerAccount): $i++; 
					$secondsubgroup=$ledgerAccount->account_second_subgroup->name;
					$firstsubgroup=$ledgerAccount->account_second_subgroup->account_first_subgroup->name;
					$group=$ledgerAccount->account_second_subgroup->account_first_subgroup->account_group->name;
					$category=$ledgerAccount->account_second_subgroup->account_first_subgroup->account_group->account_category->name;
					?>
					<tr>
						<td><?= h(++$page_no) ?></td>
						<td><?= h($category) ?></td>
						<td><?= h($group) ?></td>
						<td><?= h($firstsubgroup) ?></td>
						<td><?= h($secondsubgroup) ?></td>
						<td><?= h($ledgerAccount->name) ?></td>
               
					</tr>
					<?php endforeach; ?>
				</tbody>
			</table>
			</div>
			<div class="paginator">
				<ul class="pagination">
					<?= $this->Paginator->prev('<') ?>
					<?= $this->Paginator->numbers() ?>
					<?= $this->Paginator->next('>') ?>
				</ul>
				<p><?= $this->Paginator->counter() ?></p>
			</div>
		</div>
		
		
		<!-- END FORM-->
	</div>
</div>
</div>