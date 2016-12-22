<?//php pr($jobCards); exit; ?>

<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption">
			<i class="icon-globe font-blue-steel"></i>
			<span class="caption-subject font-blue-steel uppercase">JobCard</span> 

			<?php if($material_indent=="true"){ ?>
			: Select a Job Card For Material Indent
			<?php } ?>
		</div>
		 
	
	<div class="portlet-body">
		<div class="row">
			<div class="col-md-12">
			<?php $page_no=$this->Paginator->current('SalesOrders'); $page_no=($page_no-1)*20; ?>	 
				<table class="table table-bordered table-striped table-hover" width="100%">
					<thead>
						<tr>
							<th>Sr. No.</th>
							<th>Dispatch Name</th>
							<th>Dispatch Email</th>
							<th>Dispatch Address</th>
							<th>Required Date</th>
							<th>Packing</th>
							<th>Action</th>
						</tr>
					</thead>
 
        <tbody>
		 
            <?php foreach ($jobCards as $jobCards): ?>
             
    <tr>
        <td><?= h(++$page_no) ?></td>
		<td><?= $jobCards->company->name ?></td>

		<td><?= $jobCards->dispatch_name ?></td>
		<td><?= $jobCards->dispatch_email ?></td>
		<td><?= $jobCards->dispatch_address ?></td>
		<td><?= $jobCards->packing ?></td>
		<td class="actions">
							
								<?php if($material_indent=="true"){
									echo $this->Html->link('<i class="fa fa-repeat "></i>  Create Material Indent','/MaterialIndents/Add?job-cards='.$jobCards->id,array('escape'=>false,'class'=>'btn btn-xs default blue-stripe'));
								} ?>
								
								<?= $this->Form->postLink('<i class="fa fa-trash"></i> ',
									['action' => 'delete', $jobCards->id], 
									[
										'escape' => false,
										'class' => 'btn btn-xs red',
										'confirm' => __('Are you sure, you want to delete {0}?', $jobCards->id)
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
