<?php 
$pdf_url=$this->Url->build(['controller'=>'Invoices','action'=>'pdf']);
$list_url=$this->Url->build(['controller'=>'Invoices','action'=>'index']);
$Edit_url=$this->Url->build(['controller'=>'Invoices','action'=>'Edit']);
?>
<table width="100%">
	<tr>
		<td valign="top" style="background: #FFF;">
		<div class="list-group">
			<a href="<?php echo $list_url; ?>" class="list-group-item"><i class="fa fa-chevron-left"></i> Back to Invoices </a>
			<a href="#" class="list-group-item"><i class="fa fa-envelope"></i> Email </a>
			<a href="<?php echo $Edit_url.'/'.$id; ?>" class="list-group-item"><i class="fa fa-edit"></i> Edit </a>
			<a href="#" class="list-group-item" onclick="window.close()"><i class="fa fa-times"></i> Close </a>
		</div>
		<div style="padding:5px;">
		<h4>Adjust height of rows</h4>
		<?= $this->Form->create($invoice) ?>
			<?php $sr=0; foreach ($invoice->invoice_rows as $invoiceRows): $sr++;
				echo $this->Form->input('invoice_rows.'.$invoiceRows->id.'.id');
				echo $this->Form->input('invoice_rows.'.$invoiceRows->id.'.height',['label' => 'Row-'.$sr,'class' => 'input-sm quantity','value'=>$invoiceRows->height]);				
			endforeach; ?>
			<?= $this->Form->button(__('Update'),['class'=>'btn btn-sm default']) ?>
		<?= $this->Form->end() ?>
		</div>
		</td>
		<td width="80%">
			<object data="<?php echo $pdf_url.'/'.$id; ?>" type="application/pdf" width="100%" height="613px">
			  <p>Wait a while, PDf is loading...</p>
			</object>
		</td>
	</tr>
</table>
<?php echo $this->Html->script('/assets/global/plugins/jquery.min.js'); ?>
<script>
$(document).ready(function() {
	$('.quantity').die().live("keyup",function() {
			var asc=$(this).val();
			var numbers =  /^[0-9]*\.?[0-9]*$/;
			if(asc==0)
			{
				$(this).val('');
				return false; 
			}
			else if(asc.match(numbers))  
			{  
			} 
			else  
			{  
				$(this).val('');
				return false;  
			}
	});
});
</script>
