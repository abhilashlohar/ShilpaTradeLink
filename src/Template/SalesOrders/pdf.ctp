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
    @page { margin: 120px 15px 20px 30px; }
    #header { position: fixed; left: 0px; top: -120px; right: 0px; height: 120px;}
    #footer { position: fixed; left: 0px; bottom: -20px; right: 0px; height: 20px;text-align:center;}
    #footer .page:after { content: content: counter(page); }
	#footer { display:none; }
	
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
	.table_rows th{
		font-size:14px;
	}
	.table2 td{
		border: 0px solid  #000;font-size: 13px;padding:0px; 
	}
	.avoid_break{
		page-break-inside: avoid;
	}
	</style>
<body>
  <div id="header">
		<table width="100%">
			<tr>
				<td width="50%">
				<img src='.ROOT . DS  . 'webroot' . DS  .'logos/'.$salesOrder->company->logo.' height="70px" style="height:70px;margin-top:5px;"/>
				</td>
				<td align="right" width="50%" style="font-size: 12px;">
				<span style="font-size: 16px;">'. h($salesOrder->company->name) .'</span><br/>
				<span>'. $this->Text->autoParagraph(h($salesOrder->company->address)) .'</span>
				<span>'. h($salesOrder->company->mobile_no) .'</span>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<div align="center" style="font-size: 16px;font-weight: bold;color: #0685a8;">SALES ORDER</div>
					<div style="border:solid 2px #0685a8;margin-bottom:15px;margin-top: 5px;"></div>
				</td>
			</tr>
		</table>
  </div>
  <div id="footer">
    <p class="page">Page : </p>
  </div>

  <div id="content"> ';
  
$html.='
	<table width="100%">
		<tr>
			<td width="55%">
				<span>'. h(($salesOrder->customer->customer_name)) .'</span><br/>
				'. $this->Text->autoParagraph(h($salesOrder->customer_address)) .'<br/>
				<span>Customer P.O. No. '. h($salesOrder->customer_po_no).' dated '. h(date("d-m-Y",strtotime($salesOrder->po_date))).'</span><br/><br/>
			</td>
			<td width="45%" valign="top" align="right">
				<table>
					<tr>
						<td>Sales Order No.</td>
						<td width="20" align="center">:</td>
						<td>'. h(($salesOrder->so1."/SO-".str_pad($salesOrder->id, 3, "0", STR_PAD_LEFT)."/".$salesOrder->so3."/".$salesOrder->so4)) .'</td>
					</tr>
					<tr>
						<td>Date</td>
						<td width="20" align="center">:</td>
						<td>'. h(date("d-m-Y",strtotime($salesOrder->date))) .'</td>
					</tr>
					
				</table>
			</td>
		</tr>
	</table>';
 
$html.='
<table width="100%" class="table_rows">
		<tr>
			<th>S No</th>
			<th>Item</th>
			<th>Quantity</th>
			<th>Rate</th>
			<th>Amount</th>
			<th>Excise Duty</th>
			<th>Sale Tax(%)</th>
		</tr>
';

$sr=0; foreach ($salesOrder->sales_order_rows as $salesOrderRows): $sr++; 
$html.='
	<tr class="odd">
		<td valign="top" style="width: 40;">'. h($sr) .'</td>
		<td>'. h($salesOrderRows->item->name) .'</td>
		<td style="width: 40;">'. h($salesOrderRows->quantity) .'</td>
		<td style="width: 40;">'. $this->Number->format($salesOrderRows->rate,[ 'places' => 2]) .'</td>
		<td style="width: 40;">'. $this->Number->format($salesOrderRows->amount,[ 'places' => 2]) .'</td>
		<td style="width: 55;">'. h($salesOrderRows->excise_duty) .'</td>
		<td style="width: 60;">'. $this->Number->format($salesOrderRows->so_sale_tax,[ 'places' => 2]) .'</td>
	</tr>';
	if(!empty($salesOrderRows->description)){
		$html.='
		<tr class="even">
			<td></td>
			<td colspan="6" style="text-align: justify;"><b>Description: </b>'. $this->Text->autoParagraph(h($salesOrderRows->description)) .'</td>
		</tr>';
	}
endforeach;

$html.='</table>';		
$html.='
<table width="100%" class="table_rows">
	<tbody>
			<tr>
				<td style="text-align:right;">Total</td>
				<td style="text-align:right;" width="104">'. $this->Number->format($salesOrder->total,[ 'places' => 2]).'</td>
			</tr>
		</tbody>
	</table>'; 
	
$html.='
	<table width="100%">
		<tr>
			<td width="60%" valign="top">
				<table>
					<tr>
						<td valign="top">Transporter</td>
						<td>:</td>
						<td width="40%"> '. h($salesOrder->carrier->transporter_name) .'</td>
					</tr>
					<tr>
						<td valign="top">Carrier</td>
						<td>:</td>
						<td> '. h($salesOrder->courier->transporter_name) .'</td>
					</tr>
					<tr>
						<td valign="top">Delivery Description</td>
						<td>:</td>
						<td> '. h($salesOrder->delivery_description).'</td>
					</tr>
				</table>
			</td>
			<td valign="top">
				<table>
					<tr>
						<td valign="top">Form-49 Required</td>
						<td>:</td>
						<td>'. h($salesOrder->form49).'</td>
					</tr>
					<tr>
						<td valign="top">Expected Delivery Date</td>
						<td>:</td>
						<td> '. h(date("d-m-Y",strtotime($salesOrder->expected_delivery_date))).'</td>
						
					</tr>
					<tr>
						<td valign="top">Road Permit Required</td>
						<td>:</td>
						<td> '. h($salesOrder->road_permit_required).'</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	<br/>
	<b>Dispatch Details</b>
	<table width="100%">
		<tr>
			<td>Name</td>
			<td>: '. h($salesOrder->dispatch_name).'</td>
			<td>Mobile</td>
			<td>: '. h($salesOrder->dispatch_mobile).'</td>
		</tr>
		<tr>
			<td>Email</td>
			<td>: '. h($salesOrder->dispatch_email).'</td>
		</tr>
	</table>
';

$html.='<table width="100%">
		<tr><td width="40%" align="right"></td><td width="30%" align="right">';
		
if(!empty($salesOrder->edited_by)){
$html.='<div align="center">
		<img src='.ROOT . DS  . 'webroot' . DS  .'signatures/'.$salesOrder->editor->signature.' height="50px" style="height:50px;"/>
		<br/>
		<span><b>Edited by</b></span><br/>
		<span>'. h($salesOrder->editor->name) .'</span><br/>
		<span>'. h($salesOrder->editor->designation->name) .'</span><br/>
		<span>'. h($salesOrder->editor->mobile) .'</span><br/>
		<span>'. h($salesOrder->editor->email) .'</span>
		</div>';
}
			
$html.='</td>
<td align="right">
			<div align="center">
			<img src='.ROOT . DS  . 'webroot' . DS  .'signatures/'.$salesOrder->creator->signature.' height="50px" style="height:50px;"/>
			<br/>
			<span><b>Created by</b></span><br/>
			<span>'. h($salesOrder->creator->name) .'</span><br/>
			<span>'. h($salesOrder->creator->designation->name) .'</span><br/>
			<span>'. h($salesOrder->creator->mobile) .'</span><br/>
			<span>'. h($salesOrder->creator->email) .'</span>
			</div>
		</td>';
			
			
$html.='</tr>
	</table>';

$html .= '</div>
</body>
</html>';
  
//echo $html; exit;
 
$name='Sales_Order-'.h(($salesOrder->so1.'_'.str_pad($salesOrder->id, 3, '0', STR_PAD_LEFT).'_'.$salesOrder->so3.'_'.$salesOrder->so4));
$dompdf->loadHtml($html);
$dompdf->setPaper('A4', 'portrait');
$dompdf->render();
$dompdf->stream($name,array('Attachment'=>0));
exit(0);
?>
