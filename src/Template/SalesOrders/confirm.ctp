<?php 
$pdf_url=$this->Url->build(['controller'=>'SalesOrders','action'=>'pdf']);
$list_url=$this->Url->build(['controller'=>'SalesOrders','action'=>'index']);
?>
<table width="100%">
	<tr>
		<td valign="top" style="background: #FFF;">
		<div class="list-group">
			<a href="<?php echo $list_url; ?>" class="list-group-item"><i class="fa fa-chevron-left"></i> Back to Sales Orders </a>
			<a href="#" class="list-group-item"><i class="fa fa-envelope"></i> Email to Customer </a>
			<a href="#" class="list-group-item"><i class="fa fa-edit"></i> Edit </a>
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
