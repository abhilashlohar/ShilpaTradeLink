<?php //pr($quotation->customer->customer_contacts[0]->email); exit;
$pdf_url=$this->Url->build(['controller'=>'Quotations','action'=>'pdf']);
$list_url=$this->Url->build(['controller'=>'Quotations','action'=>'index']);
$edit_url=$this->Url->build(['controller'=>'Quotations','action'=>'Edit']);
?>
<table width="100%">
	<tr>
		<td valign="top" style="background: #FFF;">
		<div class="list-group">
			<a href="<?php echo $list_url; ?>" class="list-group-item"><i class="fa fa-chevron-left"></i> Back to Quotations </a>
			<a  data-toggle="modal" class="list-group-item" href="#myModal2"><i class="fa fa-envelope"></i> Email to Customer </a>
			<?php if($quotation->status=='Pending'){ ?>
			<a href="<?php echo $edit_url.'/'.$id; ?>" class="list-group-item"><i class="fa fa-edit"></i> Edit Quotation </a>
			<?php } ?>
			<a href="#" class="list-group-item" onclick="window.close()"><i class="fa fa-times"></i> Close </a>
		</div>
		<div style="padding:5px;">
		<h4>Adjust height of rows</h4>
		<?= $this->Form->create($quotation) ?>
			<?php $sr=0; foreach ($quotation->quotation_rows as $quotationRows): $sr++;
				echo $this->Form->input('quotation_rows.'.$quotationRows->id.'.id');
				echo $this->Form->input('quotation_rows.'.$quotationRows->id.'.height',['label' => 'Row-'.$sr,'class' => 'input-sm quantity','value'=>$quotationRows->height]);				
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

<div id="myModal2" class="modal fade in" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1" aria-hidden="true" style=" padding-right: 12px;"><div class="modal-backdrop fade in" ></div>
	<div class="modal-dialog">
	<form method="post" >
		<div class="modal-content">
			<div class="modal-body">
			<h4>Email</h4>
				<div style="height: 200px;">
			
				<div class="row">
						<div class="col-md-10">
							<div class="form-group">
								<label class="col-md-3 control-label">Send To</label>
								<div class="col-md-9">
									<?php echo $this->Form->input('send_to', ['label' => false,'class' => 'form-control input-sm','value' =>$quotation->customer->customer_contacts[0]->email,'readonly']); ?>
								</div>
							</div>
						</div>
				</div><br/>
				<div class="row">
						<div class="col-md-10">
							<div class="form-group">
								<label class="col-md-3 control-label">Subject</label>
								<div class="col-md-9">
									<?php echo $this->Form->input('subject', ['label' => false,'class' => 'form-control input-sm','value'=>$quotation->subject,'readonly']); ?>
								</div>
							</div>
						</div>
				</div><br/>
				<div class="row">
						<div class="col-md-10">
							<div class="form-group">
								<label class="col-md-3 control-label">Message</label>
								<div class="col-md-9">
									<?php echo $this->Form->textarea('message', ['label' => false,'class' => 'form-control input-sm']); ?>
								</div>
							</div>
						</div>
				</div><br/>
			</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn default" data-dismiss="modal">Close</button>
				<button type="submit" class="btn btn-primary">Send</button>
			</div>
		</div>
	</form>
	</div>
</div>

