
<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption">
			<i class="icon-globe font-blue-steel"></i>
			<span class="caption-subject font-blue-steel uppercase">Opening Balance View</span>
		</div>
		
		<div class="actions">
			<?php echo $this->Html->link('Opening Balance','/ledgers/opening-balance/',array('escape'=>false,'class'=>'btn btn-default')); ?>
			<?php echo $this->Html->link('Opening Balance View','/ledgers/opening-balance-view/',array('escape'=>false,'class'=>'btn btn-primary')); ?>
			
		</div>
<?php $page_no=$this->Paginator->current('OpeningBalanceViews'); $page_no=($page_no-1)*20; ?>
	<table class="table table-bordered table-striped table-hover">
		<tbody>
				<tr>
				<td >Sr.No.</td>
				<td>For</td>
				<td>Credit</td>
				<td>Debit</td>
				<td >Action</td>
				</tr>
		</tbody>
        <tbody>
            <?php  foreach($OpeningBalanceViews as $OpeningBalanceView): 
			//pr($OpeningBalanceView);
			?>
            <tr>
			   <td><?= h(++$page_no) ?></td>
			   <td>
				<?= h($OpeningBalanceView->ledger_account->name) ?>
			    </td>
				<td><?= h($OpeningBalanceView->credit) ?></td>
				<td><?= h($OpeningBalanceView->debit) ?></td>
				
				<td class="actions">
				<?php echo $this->Html->link('<i class="fa fa-pencil-square-o"></i>',['action' => 'edit', $OpeningBalanceView->id],array('escape'=>false,'class'=>'btn btn-xs blue tooltips','data-original-title'=>'Edit'));?>
				
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