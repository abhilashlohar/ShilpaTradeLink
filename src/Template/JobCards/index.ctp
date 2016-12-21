

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
				 
				<table class="table table-bordered table-striped table-hover" width="100%">
					<thead>
						<tr>
							<th>Sr. No.</th>
							<th>Sales Order Id</th>
							<th>Company Id</th>
							<th>JC1</th>
							<th>JC2</th>
							<th>Jc3</th>
							<th>Jc4</th>
						    <th>Create By</th>
							<th>Create On</th>
							<th>Customer Id</th>
							<th>Dispatch Name</th>
							<th>Dispatch Email</th>
							<th>Dispatch Address</th>
							<th>Customer Op No</th> 
							<th>Required Date</th>
							<th>Packing</th>
							 
						</tr>
					</thead>
 
        <tbody>
		 
            <?php foreach ($jobCards as $jobCards): ?>
             
    <tr>
        <td><?= $jobCards->id ?></td>
		<td><?= $jobCards->sales_order_id ?></td>
		<td><?= $jobCards->company->name ?></td>
		<td><?= $jobCards->jc1 ?></td>
		<td><?= $jobCards->jc2 ?></td>
		<td><?= $jobCards->jc3 ?></td>
		<td><?= $jobCards->jc4 ?></td>
		<td><?= $jobCards->created_by ?></td>
		<td><?= $jobCards->created_on ?></td>
		<td><?= $jobCards->customer_id ?></td>
		<td><?= $jobCards->dispatch_name ?></td>
		<td><?= $jobCards->dispatch_email ?></td>
		<td><?= $jobCards->dispatch_address ?></td>
		<td><?= $jobCards->customer_po_no ?></td>
		<td><?= $jobCards->required_date ?></td>
		<td><?= $jobCards->packing ?></td>
        
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
