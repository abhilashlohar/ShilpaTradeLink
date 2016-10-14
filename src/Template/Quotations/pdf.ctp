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
    #footer { position: fixed; left: 0px; bottom: -20px; right: 0px; height: 20px;text-align:center;display:none;}
    #footer .page:after { content: content: counter(page); }
	
	
	@font-face {
		font-family: Lato;
		src: url("https://fonts.googleapis.com/css?family=Lato");
	}
	p{
		margin:0;font-family: Lato;font-weight: 100;line-height: 1.1;
	}
	table td{
		margin:0;font-family: Lato;font-weight: 100;padding:0;line-height: 1.1;
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
	.avoid_break{
		page-break-inside: avoid;
	}
	</style>
<body>
  <div id="header">
		<table width="100%">
			<tr>
				<td width="50%">'.$this->Html->image(ROOT . DS  . 'webroot' . DS  .'/logos/'.$quotation->company->logo, ["height" => "50px"]).'</td>
				<td align="right" width="50%" style="font-size: 12px;">
				<span style="font-size: 16px;">'. h($quotation->company->name) .'</span><br/>
				<span>'. $this->Text->autoParagraph(h($quotation->company->address)) .'</span>
				<span>'. h($quotation->company->mobile_no).'</span>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<div align="center" style="font-size: 16px;font-weight: bold;color: #0685a8;">QUOTATION</div>
					<div style="border:solid 2px #0685a8;margin-bottom:15px;margin-top: 5px;"></div>
				</td>
			</tr>
		</table>
  </div>
  <div id="footer">
    <p class="page">Page : </p>
  </div>
	<div id="content"> ';
  
$html .= '
<table width="100%">
		<tr>
			<td style="">
				<table width="100%">
					<tr>
						<td>To,</td>
					</tr>
					<tr>
						<td>
							<span>'. h(($quotation->customer->customer_name)) .'</span>
							'.$this->Text->autoParagraph(h($quotation->customer_address)) .'
						</td>
					</tr>
					<tr>
						<td>
							<table style="margin: 0px 0 0 -2px;">
								<tr>
									<td>Kind Attn.</td>
									<td>: '. h(($quotation->customer_for_attention)) .' ('. h($quotation->customer_contact) .')</td>
								</tr>
								<tr>
									<td>Reference</td>
									<td>: '. h($quotation->enquiry_no) .'</td>
								</tr>
								<tr>
									<td>Subject</td>
									<td>: '. h(($quotation->subject)) .'</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</td>
			<td align="right" valign="top">
				<table>
					<tr>
						<td>Date</td>
						<td>: '. h(date("d-M-Y",strtotime($quotation->date))) .'</td>
					</tr>
					<tr>
						<td>Ref no</td>
						<td>: '. h(($quotation->qt1.'/QT-'.str_pad($quotation->id, 3, '0', STR_PAD_LEFT).'/'.$quotation->qt3.'/'.$quotation->qt4)) .'</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	<table>
		<tr>
				<td>Dear Sir,</td>
		</tr>
		<tr>
			<td>'. $this->Text->autoParagraph(h($quotation->text)) .'</td>
		</tr>
	</table>
';
 

$html.='
<table width="100%" class="table_rows">
		<tr>
			<th width="30">S No</th>
			<th>Item</th>
			<th width="10">Unit</th>
			<th width="10">Quantity</th>
			<th width="10">Rate</th>
			<th width="10">Amount</th>
		</tr>
';

$sr=0; foreach ($quotation->quotation_rows as $quotationRows): $sr++; 
$html.='
	<tr>
		<td valign="top">'. h($sr) .'</td>
		<td>'. h($quotationRows->item->name) .'</td>
		<td align="right">'. h($quotationRows->item->unit->name) .'</td>
		<td align="right">'. h($quotationRows->quantity) .'</td>
		<td align="right" style="width: 10;">'. $this->Number->format($quotationRows->rate,[ 'places' => 2]).'</td>
		<td align="right" style="width: 10;">'. $this->Number->format($quotationRows->amount,[ 'places' => 2]) .'</td>
	</tr>';
	if(!empty($quotationRows->description)){
		$html.='
		<tr>
			<td></td>
			<td colspan="5" style="text-align: justify;"><b>Description: </b>'. $this->Text->autoParagraph(h($quotationRows->description)) .'</td>
		</tr>';
	}

endforeach;


$html.='
	<tfoot>
			<tr>
				<td colspan="5" style="text-align:right;border-top: none !important;">Total</td>
				<td style="text-align:right;border-top: none !important;" width="10">'. $this->Number->format($quotation->total,[ 'places' => 2]) .'</td>
			</tr>
		</tfoot>
	</table>';
if(!empty($quotation->additional_note)){
	$html.='
	<div class="avoid_break">
		<b>Note:</b>
		'. $this->Text->autoParagraph(h($quotation->additional_note)) .'
	</div><br/>';
}
$html.='
<div class="avoid_break">
	<div class="avoid_break">
		<b>Commercial Terms & Conditions:</b>
		'. $this->Text->autoParagraph(h($quotation->terms_conditions)) .'
	</div><br/>
	<div><b>I hope above is to your requirement and in case of any clarification kindly revert back.</b></div><br/>
	<div class="avoid_break"><b>Thanks and Regards,</b><br/>
	'.$this->Html->image(ROOT . DS  . 'webroot' . DS  .'/signatures/'.$quotation->employee->signature, ["height" => "50px"]).'<br/>
	<span>'. h(($quotation->employee->name)) .'</span><br/>
	<span>'. h(($quotation->employee->mobile)) .'</span><br/>
	<span>'. h(($quotation->employee->email)) .'</span>
	</div>
</div>
	'; 

$html .= '</div>
</body>
</html>';
  
//echo $html; exit;

$name='Quotation-';
$dompdf->loadHtml($html);
$dompdf->setPaper('A4', 'portrait');
$dompdf->render();
$dompdf->stream($name,array('Attachment'=>0));
exit(0);
?>