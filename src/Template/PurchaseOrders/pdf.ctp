<?php 
require_once(ROOT . DS  .'vendor' . DS  . 'dompdf' . DS . 'autoload.inc.php');
use Dompdf\Dompdf;
use Dompdf\Options;

$options = new Options();
$options->set('defaultFont', 'Lato-Hairline');
$dompdf = new Dompdf($options);

$dompdf = new Dompdf();




$html = '
<html>
<head>
  <style>
    @page { margin: 150px 15px 200px 30px; }
    #header { position: fixed; left: 0px; top: -150px; right: 0px; height: 150px;}
    #footer { position: fixed; left: 0px; bottom: -200px; right: 0px; height: 200px;}
    #footer .page:after { content: content: counter(page); }
	
	
	@font-face {
		font-family: Lato;
		src: url("https://fonts.googleapis.com/css?family=Lato");
	}
	p{
		margin:0;font-family: Lato;font-weight: 100;line-height: 1;
	}
	table td{
		margin:0;font-family: Lato;font-weight: 100;padding:0;line-height: 1;
	}
	table.table_rows tr.odd{
		page-break-inside: avoid;
	}
	.table_rows, .table_rows th, .table_rows td {
	   border: 1px solid  #000;border-collapse: collapse;padding:2px; 
	}
	.table2 td{
		border: 0px solid  #000;font-size: 14px;padding:0px; 
	}
	.table_rows th{
		font-size:14px;
	}
	.avoid_break{
		page-break-inside: avoid;
	}
	</style>
<body>
  <div id="header" ><br/>	
		<table width="100%">
			<tr>
				<td width="50%">
				<img src='.ROOT . DS  . 'webroot' . DS  .'logos/'.$purchaseOrder->company->logo.' height="80px" style="height:80px;"/>
				</td>
				<td align="right" width="50%" style="font-size: 12px;">
				<span style="font-size: 16px;">'. h($purchaseOrder->company->name) .'</span><br/>
				<span>'. $this->Text->autoParagraph(h($purchaseOrder->company->address)) .'</span>
				<span><img src='.ROOT . DS  . 'webroot' . DS  .'img/telephone.gif height="11px" style="height:11px;margin-top:5px;"/> '. h($purchaseOrder->company->mobile_no).'</span> | 
				<span><img src='.ROOT . DS  . 'webroot' . DS  .'img/email.png height="15px" style="height:15px;margin-top:4px;"/> '. h($purchaseOrder->company->email).'</span>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<div align="center" style="font-size: 16px;font-weight: bold;color: #0685a8;">PURCHASE ORDER</div>
					<div style="border:solid 2px #0685a8;margin-bottom:35px;margin-top: 5px;"></div>
				</td>
			</tr>
		</table>
  </div>
 

  <div id="content"> ';
  
$html.='
	<table width="100%" class="table_rows">
		<tr>
				<td width="50%">
					<span>'. h(($purchaseOrder->vendor->company_name)) .'</span><br/>
					<span>'. h(($purchaseOrder->vendor->address)) .'</span><br/>
				</td>
				
				<td width="50%">
					<span>'. h(($purchaseOrder->vendor->company_name)) .'</span><br/>
					<span>'. h(($purchaseOrder->vendor->address)) .'</span><br/>
				</td>
			</tr>

		</table>';
		
 
$html.='<br/>
<table width="100%" class="table_rows">
		<tr>
			<th>S No</th>
			<th>Item Description</th>
			<th>Quantity</th>
			<th>Rate</th>
			<th>Amount</th>
		</tr>
';

$sr=0; foreach ($purchaseOrder->purchase_order_rows as $purchase_order_rows): $sr++; 
$html.='
	<tr class="odd">
		<td valign="top" align="center" width="30">'. h($sr) .'</td>
		<td>'. $this->Text->autoParagraph(h($purchase_order_rows->description)) .'<br/></td>
		<td width="40" valign="top" align="center">'. h($purchase_order_rows->quantity) .'</td>
		<td style="width: 10;" align="right" valign="top">'. $this->Number->format($purchase_order_rows->rate,[ 'places' => 2]) .'</td>
		<td style="width: 10;" align="right" valign="top">'. $this->Number->format($purchase_order_rows->amount,[ 'places' => 2]) .'</td>
	</tr>';
endforeach; 



 $html .= '</div>
</body>
</html>';

//echo $html; exit; 


$dompdf->loadHtml($html);
$dompdf->setPaper('A4', 'portrait');
$dompdf->render();
$dompdf->stream($name,array('Attachment'=>0));
exit(0);
?>
