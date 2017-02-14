<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption" >
			<i class="icon-globe font-blue-steel"></i>
			<span class="caption-subject font-blue-steel uppercase">Create Purchase Order</span>
		</div>
		
	</div>
<div class="portlet-body form">
 	<?= $this->Form->create($materialIndent,['id'=>'form_sample_3']) ?>
		 <div class="form-body">
<table class="table table-bordered table-condensed">
	<thead> 
		<th></th>
		<th>
			<table  align="center">
				<tr>
					<td>Item</td>
					<td >Quantity</td>
					<td ></td>
				</tr>
			</table>
		</th>
	</thead>
	
	<tbody>
		<?php foreach ($materialIndents as $materialIndent): ?>
		<tr>
			<td valign="top">
			<b><?= $materialIndent->mi_number ?></b>
			</td>
			<td>
				<table width="100%" id="main_tb">
					<tbody>
						<?php $i=0; foreach($materialIndent->material_indent_rows as $material_indent_row): $i++; ?> 
							<tr class="tr1">
								<td>
								<?= $material_indent_row->item->name?></td>
								<td><?php echo $this->Form->input('required_quantity', ['type'=>'text','empty'=>'--Select--','class' => 'form-control input-sm','label'=>false,'value'=>$material_indent_row->required_quantity,'type'=>'hidden']); ?>
								<?= $material_indent_row->required_quantity?></td>
								<td>
								<?php echo $this->Form->input('qantity.'.$material_indent_row->material_indent_id, ['label' => false,'type'=>'hidden','value' => $material_indent_row->required_quantity]); ?>
								<?php echo $this->Form->input('check[]', ['label' => false,'type'=>'checkbox','class'=>'rename_check','value' =>$material_indent_row->material_indent_id,'hiddenField'=>false]);  ?>
								<?php echo $this->Form->input('item_id.'.$material_indent_row->material_indent_id, ['label' => false,'type'=>'hidden','value' => $material_indent_row->item_id]); ?></td>
							</tr>
						<?php  endforeach; ?>
					</tbody>
				</table>
			</td>
			
		</tr>
		<?php endforeach; ?>
	</tbody>
	
</table>
</br>
</div>
	<div class="form-actions">
		<button type="submit" class="btn btn-primary">NEXT</button>
	</div>
<?= $this->Form->end() ?>

</div>
	


 <?php echo $this->Html->script('/assets/global/plugins/jquery.min.js'); ?>

<script>

$(document).ready(function() {
/* 	$('.rename_check').die().live("click",function() {
 		rename_rows();
    })
	function rename_rows(){ 
		$("#main_tb tbody tr.tr1").each(function(){
			var val=$(this).find('td:nth-child(3) input[type="checkbox"]:checked').val();
			
			if(val){
				$(this).css('background-color','#fffcda');
 			}else{
 				$(this).css('background-color','#FFF');
				
			}
		});
	} */	
		
		//rename_rows();
    
});		
</script>
 