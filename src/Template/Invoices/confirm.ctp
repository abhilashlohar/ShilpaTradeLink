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
			<a href="#" class="list-group-item" onclick="window.close()"><i class="fa fa-times"></i> Close </a>
		</div>
		</td>
		<td width="80%">
			<object data="<?php echo $pdf_url.'/'.$id; ?>" type="application/pdf" width="100%" height="613px">
			  <p>Wait a while, PDf is loading...</p>
			</object>
		</td>
	</tr>
</table>
