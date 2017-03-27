<?php //pr($materialIndents); exit; ?>

<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption">
			<i class="icon-globe font-blue-steel"></i>
			<span class="caption-subject font-blue-steel uppercase">Material Indents</span> 
			
	    </div>
				 
<?php $page_no=$this->Paginator->current('MaterialIndentS'); $page_no=($page_no-1)*20; ?>
	<table class="table table-bordered table-striped table-hover">
		<tbody>
				<tr>
				<td style="font-size:120%;">Sr.No.</td>
				<td style="font-size:120%;">Material Indent No</td>
				<td style="font-size:120%;">Created on</td>
				<td style="font-size:120%;">Action</td>
				</tr>
		</tbody>
        <tbody>
            <?php  foreach($materialIndents as $materialIndent): 
			//pr($materialIndent->material_indent_rows);
			?>
            <tr>
			   <td><?= h(++$page_no) ?></td>
			   <td>
				<?= h($materialIndent->mi_number) ?>
			    </td>
				<td><?php echo date("d-m-Y",strtotime($materialIndent->created_on)); ?></td>
				<td class="actions">
				<!--<?php echo $this->Html->link('<i class="fa fa-search"></i>',['action' => 'view', $materialIndent->id],array('escape'=>false,'target'=>'_blank','class'=>'btn btn-xs yellow tooltips')); ?>-->
				 <?php echo $this->Html->link('<i class="fa fa-pencil-square-o"></i>',['action' => 'edit', $materialIndent->id],array('escape'=>false,'class'=>'btn btn-xs blue tooltips','data-original-title'=>'Edit'));?>
				 
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
