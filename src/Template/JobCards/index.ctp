
<?php 
if(!empty($status)){
		$url_excel=$status."/?".$url;
	}else{
		$url_excel="/?".$url;
	}
	
?>

<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption">
			<i class="icon-globe font-blue-steel"></i>
			<span class="caption-subject font-blue-steel uppercase">JobCard</span> 
			<?php if($pull_request=="true"){ ?>
			: Select a Quotation to convert into sales-order
			<?php }  elseif($copy_request=="copy"){?>
			: Select a Quotation to Copy
			<?php } ?>
		</div>
		 
	
	<div class="portlet-body">
		<div class="row">
			<div class="col-md-12">
				 
				<table class="table table-bordered table-striped table-hover">
					<thead>
						<tr>
							<th>Sr. No.</th>
							<th>sales_order_id</th>
							<th>company_id</th>
							<th>jc1</th>
							<th>jc2</th>
							<th>jc3</th>
							<th>jc4</th>
						    <th>created_by</th>
							<th>created_on</th>
							<th>customer_id</th>
							<th>dispatch_name</th>
							<th>dispatch_email </th>
							<th>dispatch_address</th>
							<th>customer_po_no</th><th> </th>
							<th>required_date</th>
							<th>packing</th>
							 
							
							
						</tr>
					</thead>
 
        <tbody>
            <?php foreach ($jobCards as $jobCard): ?>
            <tr>
                <td><?= $this->Number->format($jobCard->id) ?></td>
                 
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
