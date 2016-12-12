<?php //pr($purchaseOrder->customer); exit;
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
    @page { margin: 130px 15px 20px 30px; }
    #header { position: fixed; left: 0px; top: -130px; right: 0px; height: 130px;}
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
    <div id="header" ><br/>	
		<table width="100%" >
			<tr>
				<td width="35%" rowspan="2" valign="bottom">
				<img src='.ROOT . DS  . 'webroot' . DS  .'logos/'.$purchaseOrder->company->logo.' height="80px" style="height:80px;"/>
				</td>
				<td colspan="2" align="right">
				<span style="font-size: 20px;">'. h($purchaseOrder->company->name) .'</span>
				</td>
			</tr>
			<tr>
				<td width="35%" valign="bottom">
				<div align="left" style="font-size: 26px;font-weight: bold;color: #0685a8;">PURCHASE ORDER</div>
				</td>
				<td align="right" width="35%" style="font-size: 12px;">
				<span>'. $this->Text->autoParagraph(h($purchaseOrder->company->address)) .'</span>
				<span><img src='.ROOT . DS  . 'webroot' . DS  .'img/telephone.gif height="11px" style="height:11px;margin-top:5px;"/> '. h($purchaseOrder->company->mobile_no).'</span> | 
				<span><img src='.ROOT . DS  . 'webroot' . DS  .'img/email.png height="15px" style="height:15px;margin-top:4px;"/> '. h($purchaseOrder->company->email).'</span>
				</td>
			</tr>
			<tr>
				<td colspan="3" >
					<div style="border:solid 2px #0685a8;margin-top: 5px; margin-top:15px;"></div>
				</td>
			</tr>
		</table>
  </div>
  
  
 

  <div id="content"> ';
  
$html.='<br/><br/>

			<table width="100%" class="table_rows ">
				<tr >
					<td width="35%" valign="top" ><span><b>'. h(($purchaseOrder->vendor->company_name)) .'</b></span><br/>
					<span>'. $this->Text->autoParagraph(h($purchaseOrder->vendor->address)) .'
					</span><br/>
					</td>
					<td valign="top" >
						<table class="table2">
									<tr>
										<td width="60" valign="top" style="vertical-align: top;">TIN</td>
										<td width="20" valign="top">:</td>
										<td valign="top">'. h(($purchaseOrder->company->tin_no)) .'</td>
									</tr>
									<tr>
										<td valign="top" style="vertical-align: top;">PAN</td>
										<td width="20" valign="top">:</td>
										<td valign="top">'.h(($purchaseOrder->company->pan_no)).'</td>
									</tr>
									<tr>
										<td valign="top" style="vertical-align: top;">CIN</td>
										<td width="20" valign="top">:</td>
										<td valign="top">'. h(($purchaseOrder->company->cin_no)).'</td>
									</tr>
									
								</table>
						
					</td>
					<td width="35%" valign="top">

						<table class="table2">
									<tr>
										<td width="30" valign="top" style="vertical-align: top;">NO</td>
										<td width="10" valign="top">:</td>
										<td valign="top">'.h(($purchaseOrder->po1.'/PO-'.str_pad($purchaseOrder->id, 3, '0', STR_PAD_LEFT).'/'.$purchaseOrder->po3.'/'.$purchaseOrder->po4)).'</td>
									</tr>
									<tr>
										<td valign="top" style="vertical-align: top;">DATE</td>
										<td width="20" valign="top">:</td>
										<td valign="top">'.h(date("d-m-Y",strtotime($purchaseOrder->date_created))) .'</td>
									</tr>
						</table>
						
					</td>
				</tr>
			</table>
			<table class="table_rows">
				<tr>
					<td>'. $this->Text->autoParagraph(h($purchaseOrder->descryption)) .'</td>
				</tr>
			</table>';
		
$html.='
<table width="100%" class="table_rows itemrow ">
		<tr>
			<th>S No</th>
			<th>Item Description</th>
			<th>Unit</th>
			<th>Quantity</th>
			<th>Rate</th>
			<th>Amount</th>
		</tr>
';

$sr=0; foreach ($purchaseOrder->purchase_order_rows as $purchase_order_rows): $sr++; 
$html.='
	<tr class="odd">
		<td style="padding-top:10px;" valign="top" align="center" width="5%">'. h($sr) .'</td>
		<td  style="padding-top:10px;" width="100%">'. $this->Text->autoParagraph(h($purchase_order_rows->description)) .
		'<div style="height:'.$purchase_order_rows->height.'"></div></td>
		<td style="padding-top:10px;" valign="top" align="center">'. h($purchase_order_rows->item->unit->name) .'</td>
		<td style="padding-top:10px;" valign="top" align="center">'. h($purchase_order_rows->quantity) .'</td>
		<td style="padding-top:10px;" align="right" valign="top">'. $this->Number->format($purchase_order_rows->rate,[ 'places' => 2]) .'</td>
		<td style="padding-top:10px;" align="right" valign="top">'. $this->Number->format($purchase_order_rows->amount,[ 'places' => 2]) .'</td>
	</tr>';
endforeach; 



$total=explode('.',$purchaseOrder->total);
$rupees=$total[0];
if(sizeof($total)==2){
	$total[1]=str_pad($total[1], 2, '0', STR_PAD_RIGHT);
	$paisa=(int)$total[1];
}else{ $paisa=""; }

$html.='</table>';


	$html.='
	<table width="100%" class="table_rows">
		<tbody>
				<tr>
					
					<td width="100%" style="text-align:right;">Total</td>
					<td  style="text-align:right;">'. $this->Number->format($purchaseOrder->total,[ 'places' => 2]).'</td>
				</tr>
					
				
				<tr>
					<td colspan="2"><b>Amount in words: </b>'. h(ucwords($this->NumberWords->convert_number_to_words($rupees))) .'  Rupees and '. h(ucwords($this->NumberWords->convert_number_to_words($paisa))) .' Paisa</td>
				</tr>
			</tbody>
		</table>';

		
$html .= '	<table width="100%" class="table_rows">
  <tr>
    <td valign="top" rowspan="2" style="text-align:center;">Material To Be Transported:<br/>'. h(($purchaseOrder->material_to_be_transported)) .'</td>
    <td valign="top" rowspan="2" style="text-align:center;">Sale Tax:'. h(($purchaseOrder->sale_tax_per)) .'%<br/>'. h(($purchaseOrder->sale_tax_description)) .'</td>
    <td valign="top"> <p>Discount:'. h(($purchaseOrder->discount)) .''. h(($purchaseOrder->discount_type)) .'</p>
    </td>
  </tr>
  <tr>
  <td><p>P & F	:'. h(($purchaseOrder->pnf)) .''. h(($purchaseOrder->pnf_type)) .'</p></td>
  </tr>
  <tr>
    <td valign="top" style="text-align:center;">LR To Be Prepared In Favour Of:<br/>'. h(($purchaseOrder->lr_to_be_prepared_in_favour_of)) .'</td>
    <td valign="top" style="text-align:center;">Payment Terms<br/>'. h(($purchaseOrder->payment_terms)) .'</td>
    <td valign="top">Excise Duty	:'. h(($purchaseOrder->exceise_duty)) .'</td>
   
  </tr>
  <tr>
    <td valign="top" style="text-align:center;">Road Permit Form:<br/>'. h(($purchaseOrder->road_permit_form47)) .'</td>
    <td valign="top" style="text-align:center;">Transporter Name:<br/>'. h(($purchaseOrder->transporter->transporter_name)) .'</td>
    <td valign="top" >Delivery:-		'. h(($purchaseOrder->delivery)) .'</td>
	
  </tr>

</table>';

 $html .= '
<table width="100%" class="table_rows ">
  <tr>
		<td style="padding-left:5px;" valign="top">Excise Invoice Required in Favour of Consignee:<br/><br/>
			 '. h($purchaseOrder->customer->customer_name) .'<br/>
			'. h($purchaseOrder->customer->customer_address[0]->address) .'<br/>
			ECC : '. h($purchaseOrder->customer->ecc_no) .'<br/>
			TIN : '. h($purchaseOrder->customer->tin_no) .'<br/>
		</td >
		<td align="left" width="50%">Please confirm that you have registered this order and request you to return back the duplicate copy duly signed in token of having accepted the order.<br/><br/>
					<div align="center">
						<span>For <b>'. h($purchaseOrder->company->name) .'</b></span><br/>
						<img src='.ROOT . DS  . 'webroot' . DS  .'signatures/'.$purchaseOrder->creator->signature.' height="50px" style="height:50px;"/>
						<br/>
						<span><b>Authorised Signatory</b></span><br/>
						<span>'. h($purchaseOrder->creator->name) .'</span><br/>
						
					</div>
				</td>
	
	</td>
  </tr>
  
</table>';




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
