<?php //pr($jobCards); exit; ?>
<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption" >
			<i class="icon-globe font-blue-steel"></i>
			<span class="caption-subject font-blue-steel uppercase">Add Material Indent</span>
		</div>
		<div class="actions">
		<?php echo $this->Html->link('<i class="fa fa-files-o"></i> Pull Job card','/JobCards/index?material-indent=true',array('escape'=>false,'class'=>'btn btn-xs blue')); ?>
		</div>
	</div>

	<?php if(!empty($jobCards)){ ?>
	<div class="portlet-body form">
		<!-- BEGIN FORM-->
		 <?= $this->Form->create($materialIndent,['id'=>'form_sample_3']) ?>
			<div class="form-body">

			<div class="row">
				<div class="col-md-4">
					<div class="form-group">
						<label class="col-md-5 control-label">Job Card No</label>
						<div class="col-md-7">
							<?php echo $this->Form->input('mi1', ['type'=>'hidden','value' => @$jobCards->jc1]); ?>
							<?php echo $this->Form->input('mi2', ['type'=>'hidden','value' => $last_mi_no->mi2]); ?>
							<?php echo $this->Form->input('mi3', ['type'=>'hidden','value' => @$jobCards->jc3]); ?>
							<?php echo $this->Form->input('mi4', ['type'=>'hidden','value' => '16-17']); ?>
							<?= h($jobCards->jc1.'/JC'.str_pad($jobCards->jc1, 3, '0', STR_PAD_LEFT).'/'.$jobCards->jc3.'/'.$jobCards->jc4) ?>
							
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group">
						<label class="col-md-5 control-label">Customer Name </label>
						<div class="col-md-7">
						<?php echo $this->Form->input('customer_id', ['type'=>'hidden','value' => @$jobCards->customer_id]); ?>
						<?php echo $jobCards->customer->customer_name; ?>
						</div>
					</div>
				</div>
				
				<div class="col-md-4">
					<div class="form-group">
						<label class="col-md-5 control-label">Required Date <span class="required" aria-required="true">*</span></label>
						<div class="col-md-7">
							<?php echo $this->Form->input('required_date', ['type'=>'text','label' => false,'class' => 'form-control input-sm date-picker','placeholder'=>'Required Date','data-date-format'=>'dd-mm-yyyy','data-date-start-date' => '-60d','data-date-end-date' => '0d']); ?>
						</div>
					</div>
				</div>

			</div><br/>
			
			<table class="table tableitm">
				<thead>
					<tr>
						<th width="50">Sr.No. </th>
						<th>Items</th>
						<th> Required Quantity</th>
						<th>Current Stocks</th>
						<th>Approved Purchased Quantity</th>
						
					</tr>
				</thead>
				<tbody>
					<?php 
					$req_quantity=[]; 
					foreach ($jobCards->job_card_rows as $job_card_rows){
						$req_quantity[$job_card_rows->item_id]['item']=$job_card_rows['item'];
						$req_quantity[$job_card_rows->item_id]['required_qty']=@$req_quantity[$job_card_rows->item_id]['required_qty']+$job_card_rows->quantity;
					} ?>
					
					<?php $q=0; foreach($req_quantity as  $item_id=>$required_qty): ?>
					<tr class="tr1" row_no='<?php echo @$quotation_rows->id; ?>'>
							<td><?php echo ++$q; --$q; ?></td>
							<td><?php echo $this->Form->input('material_indent_rows.'.$q.'.item_id', ['type'=>'hidden','value' => @$job_card_rows->item->id]); ?>
							<?php echo $required_qty['item']->name; ?></td>
							<td><?php echo $required_qty['required_qty']; ?></td>
							
							<td><?php echo @$current_stock[$job_card_rows->item_id]['total_in']-@$current_stock[$job_card_rows->item_id]['total_out']; ?></td>
							<td><?php echo $this->Form->input('material_indent_rows.'.$q.'.approved_purchased_quantity', ['type'=>'text','label' => false,'class' => 'form-control input-sm quantity','placeholder'=>'Approved Purchased Quantity']); ?></td>
					</tr>
					<?php $q++; endforeach;  ?>
					
				</tbody>
				
			</table>
		</div>
			<div class="form-actions">
				<button type="submit" class="btn btn-primary">CREATE MATERIAL INDENT</button>
			</div>
		<?= $this->Form->end() ?>
	</div>
	<?php } ?>
<style>
.table thead tr th {
    color: #FFF;
	background-color: #254b73;
}
.padding-right-decrease{
	padding-right: 0;
}
.padding-left-decrease{
	padding-left: 0;
}
</style>
<?php echo $this->Html->script('/assets/global/plugins/jquery.min.js'); ?>