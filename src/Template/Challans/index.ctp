<?php //pr($challans); exit; ?>
<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption">
			<i class="icon-globe font-blue-steel"></i>
			<span class="caption-subject font-blue-steel uppercase">Challans</span>
		
		</div>

	</div>
	<div class="portlet-body">
		<div class="row">
			<div class="col-md-12">
				
				<?php $page_no=$this->Paginator->current('Challans'); $page_no=($page_no-1)*20; ?>
				<table class="table table-bordered table-striped table-hover">
						<thead>
							<tr>
								<th>S.No</th>
								<th>Type</th>
								<th>Customer/Vendor Name</th>
								<th>Company name</th>
								<th>Transporter Name</th>
								<th>LR No</th>
								<th>Reference Detail</th>
								<th>Total.</th>
								
								
								<th class="actions"><?= __('Actions') ?></th>
							</tr>
					
					</thead>

					<tbody>
            <?php foreach ($challans as $challan): ?>
            <tr>
				<?php $type=$challan->challan_for; ?>
                <td><?= h(++$page_no) ?></td>
                <td><?= h($challan->challan_for) ?></td>
				<td><?php if($challan->customer_id){ echo $challan->customer->customer_name;  }elseif($challan->vendor_id){ echo $challan->vendor->company_name; } ?></td>
                <td><?= h($challan->company->name) ?></td>
				<td><?= h($challan->transporter->transporter_name) ?></td>
                <td><?= $this->Number->format($challan->lr_no) ?></td>
                <td><?= h($challan->reference_detail) ?></td>
                <td><?= $this->Number->format($challan->total) ?></td>
               
				<td class="actions">
								<?php echo $this->Html->link('<i class="fa fa-search"></i>',['action' => 'confirm', $challan->id],array('escape'=>false,'target'=>'_blank','class'=>'btn btn-xs yellow tooltips','data-original-title'=>'View as PDF')); ?>
								<?php echo $this->Html->link('<i class="fa fa-pencil-square-o"></i>',['action' => 'edit', $challan->id],array('escape'=>false,'class'=>'btn btn-xs blue tooltips','data-original-title'=>'Edit')); ?>
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

