<?php //pr($materialIndents); exit; ?>

<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption">
			<i class="icon-globe font-blue-steel"></i>
			<span class="caption-subject font-blue-steel uppercase">Material Indents</span> 
			<?php if($pull_request=="true"){ ?>
			: Select a Material Indent to convert into Purchase Order
			<?php } ?>
	    </div>
<div class="portlet-body">
	<?= $this->Form->create($mireport) ?>
	<div class="row">
		<div class="col-md-12">				 
			<?php $page_no=$this->Paginator->current('MaterialIndentS'); $page_no=($page_no-1)*20; ?>
				<table class="table table-bordered " width="100%" id="main_tb" border="1">
					<thead>
						<th  class="text-center"><label class="control-label">S.No</label></th>
						<th width="30%" class="text-center"><label class="control-label">MaterialIndentS</label></th>
						<th align="center" class="text-center"><label class="control-label">MaterialIndentRows</label></th>
					</thead>
					<tbody >
					<?php foreach($materialIndents as $materialIndent){ ?>
						<tr class="main_tr">
							<td><?= h(++$page_no) ?></td>
							<td valign="top" class="text-center">
							<?= h($materialIndent->mi_number) ?>
							</td>
							<td>
								<table class="table" id="main_tb">
									<thead>
										<th width="70%">Item</th>
										<th>Quantity</th>
									</thead>
									<tbody id="maintbody">
									<?php  foreach($materialIndent->material_indent_rows as $materialIndentrows){  ?>
										<tr class="tr1">
											<td>
											<?php echo $this->Form->input('materialIndent_id', ['label' => false,'type'=>'hidden','value'=>$materialIndent->id]);  ?>
											<?php echo $this->Form->input('material_Indent_item_id',['class' => 'form-control input-sm','type'=>'hidden','label'=>false ,'value'=>$materialIndentrows->item_id]); ?>
											<?= h($materialIndentrows->item->name) ?>
											</td>
											<td>
											<?php echo $this->Form->input('materialIndent_id', ['label' => false,'type'=>'hidden','value'=>$materialIndentrows->required_quantity]);  ?>
											<?= h($materialIndentrows->required_quantity) ?></td>
											<td><label><?php echo $this->Form->input('check[]', ['label' => false,'type'=>'checkbox','class'=>'rename_check','value' => @$materialIndentrows->id,'hiddenField'=>false]);  ?>
											</label>
											</td>
											
										</tr>
										<?php } ?>
									</tbody>
								</table>
							</td>
						</tr>
					<?php } ?>
					</tbody>
				</table>
				<div class="form-actions">
					<button type="submit" class="btn btn-primary">Submit</button>
				</div>
			</div>
		</div>
		<?= $this->Form->end() ?>		
	</div>
   
</div>

<?php echo $this->Html->script('/assets/global/plugins/jquery.min.js'); ?>

<script>

$(document).ready(function() {
	$('.rename_check').die().live("click",function() { 
 		rename_rows();
    })
	var p=0;
	function rename_rows(){ 
		var i=0;
		$("#main_tb tbody tr.tr1").each(function(){
			var val=$(this).find('td:nth-child(3) input[type="checkbox"]:checked').val();
			var mi=$(this).find('td:nth-child(1) input[type="hidden"]').val();
			if(val){
				$(this).css('background-color','#fffcda');
				
				$(this).find('td:nth-child(1) input').attr("name","prepo["+mi+"]["+val+"][item_id]").attr("id","prepo-"+val+"-item_id");
				$(this).find('td:nth-child(2) input').attr("name","prepo["+mi+"]["+val+"][quantity]").attr("id","prepo-"+val+"-quantity");
				
				
 			}else{
 				$(this).css('background-color','#FFF');
				
			}
		});
	}	
		
		//rename_rows();
    
});		
</script>
