<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption">
			<i class="icon-globe font-blue-steel"></i>
			<span class="caption-subject font-blue-steel uppercase">EDIT COMPANY</span>
		</div>
	</div>
	<div class="portlet-body" >
		
			<div class="row">
			 <div class="col-md-6">
			 <table class="table table-hover">
				 <thead>
					<tr>
						<th width="20%">Sr. No.</th>
						<th>Company Name</th>
						<th width="10%">Action</th>
						
					</tr>
				</thead>
				<tbody>
				<?php $i=0; foreach ($Company_array as $key=>$Company_array){ $i++;
				$c_namrr=$Company_array1[$key];
				?>
					<tr>
						<td><?= h($i) ?></td>
						<td><?php echo $c_namrr; ?></td>
						<td class="actions">
						 	<?php if($Company_array =='Yes') { ?>
							 <?= $this->Form->postLink('Delete ',
								['action' => 'CheckCompany', $key,$customer_id],
								[
									'escape' => false,
									'class'=>'btn red tooltips',
									
								]
							) ?>
							<?php  } else { ?>
							<?= $this->Form->postLink(' Add ',
								['action' => 'AddCompany', $key,$customer_id],
								[
									'escape' => false,
									'class'=>'btn blue tooltips',
									
								]
							) ?>
							<?php }  ?>
						</td>
					</tr>
				<?php  } ?>
				</tbody>
			</table>
		</div>
		
		</div>
		
	</div>
</div>

<?php echo $this->Html->script('/assets/global/plugins/jquery.min.js'); ?>
<script>
$(document).ready(function() {
	
});
</script>