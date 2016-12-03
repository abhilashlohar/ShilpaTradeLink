<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption">
			<i class="icon-globe font-blue-steel"></i>
			<span class="caption-subject font-blue-steel uppercase">Account Second Sub-Group</span> 
		</div>
		<div class="portlet-body form">
		<!-- BEGIN FORM-->
		<div class="row ">
		<div class="col-md-12">
		<?= $this->Form->create($accountSecondSubgroup) ?>
			<div class="form-body">
				<div class="form-group">
					<div class="col-md-5">
					<label class="control-label">Account First Sub-Group <span class="required" aria-required="true">*</span></label>
						<?php 
						echo $this->Form->input('account_first_subgroup_id', ['options' => $accountFirstSubgroups,'empty' => "--Select--",'label' => false,'class' => 'form-control select2me ' ,'required']); 
						?>
					</div>
					<div class="col-md-5">
					<label class="control-label">Name <span class="required" aria-required="true">*</span></label>
						<?php 
						echo $this->Form->input('name', ['label' => false,'class' => 'form-control input-sm ','placeholder'=>'Name']); 
						?>
					</div>
					
					<div class="col-md-2">
					<label class="control-label"> <span class="required" aria-required="true"></span> </label><br/>
						<?php 
						echo $this->Form->button(__('ADD'),['class'=>'btn btn-primary']); 
						?>
					</div>
				</div>
			</div>
		<?= $this->Form->end() ?>
		</div>
		<!-- END FORM-->
		</div>
	</div>
		
		
			<div class="portlet-body">
		<div class="row">
			<div class="col-md-12">
				<form method="GET" >
					<table class="table table-condensed" style="margin-top:20px;">
						<tbody>
							<tr>
								<td><input type="text" name="Account_first_subgroup" class="form-control input-sm" placeholder="Account First SubGroup" value="<?php echo @$Account_first_subgroup; ?>"></td>
								<td><input type="text" name="name" class="form-control input-sm" placeholder="Name" value="<?php echo @$name; ?>"></td>
								<td><button type="submit" class="btn btn-primary btn-sm"><i class="fa fa-filter"></i> Filter</button></td>
							</tr>
						</tbody>
					</table>
				</form>
				
				<?php $page_no=$this->Paginator->current('Account Group Name'); $page_no=($page_no-1)*20; ?>
				<table class="table table-bordered table-striped table-hover" style="margin-top:20px;">
						<thead>
							<tr>
								<th>S.No</th>
								<th>First Sub-Group</th>
								<th>Name</th>
								
								<th class="actions"><?= __('Actions') ?></th>
							</tr>
					
					</thead>
					<tbody>
					 <?php foreach ($accountSecondSubgroups as $accountSecondSubgroup): ?>
						<tr>
							<td><?= h(++$page_no) ?></td>
							 <td><?=  h($accountSecondSubgroup->account_first_subgroup->name)?></td>
							<td><?= h($accountSecondSubgroup->name) ?></td>
							 <td class="actions">
							<?php echo $this->Html->link('<i class="fa fa-pencil-square-o"></i>',['action' => 'edit', $accountSecondSubgroup->id],array('escape'=>false,'class'=>'btn btn-xs blue tooltips','data-original-title'=>'Edit')); ?>
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
</div>



