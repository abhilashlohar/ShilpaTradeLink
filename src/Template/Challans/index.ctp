
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
				
				<?php $page_no=$this->Paginator->current('Purchase Orders'); $page_no=($page_no-1)*20; ?>
				<table class="table table-bordered table-striped table-hover">
						<thead>
							<tr>
								<th>S.N</th>
								<th>Customer Name</th>
								<th>Company name</th>
								<th>Transporter Name</th>
								<th>lr_no</th>
								<th>reference_detail</th>
								<th>total.</th>
								<th>documents</th>
								
								<th class="actions"><?= __('Actions') ?></th>
							</tr>
					
					</thead>

					<tbody>
            <?php foreach ($challans as $challan): ?>
            <tr>
                <td><?= $this->Number->format($challan->id) ?></td>
                <td><?= $challan->has('customer') ? $this->Html->link($challan->customer->customer_name, ['controller' => 'Customers', 'action' => 'view', $challan->customer->id]) : '' ?></td>
                <td><?= $challan->has('company') ? $this->Html->link($challan->company->name, ['controller' => 'Companies', 'action' => 'view', $challan->company->id]) : '' ?></td>
                
               
                <td><?= $challan->has('transporter') ? $this->Html->link($challan->transporter->transporter_name, ['controller' => 'Transporters', 'action' => 'view', $challan->transporter->id]) : '' ?></td>
                <td><?= $this->Number->format($challan->lr_no) ?></td>
                <td><?= h($challan->reference_detail) ?></td>
                <td><?= $this->Number->format($challan->total) ?></td>
                <td><?= h($challan->documents) ?></td>
               
				
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

