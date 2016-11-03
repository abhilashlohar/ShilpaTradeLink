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
				<img src='.ROOT . DS  . 'webroot' . DS  .'logos/'.$invoice->company->logo.' height="50px" style="height:50px;"/>
				</td>
				<td align="right" width="50%" style="font-size: 12px;">
				<span style="font-size: 16px;">'. h($invoice->company->name) .'</span><br/>
				<span>'. $this->Text->autoParagraph(h($invoice->company->address)) .'</span>
				<span><img src='.ROOT . DS  . 'webroot' . DS  .'img/telephone.gif height="11px" style="height:11px;margin-top:5px;"/>'. h($invoice->company->mobile_no).'</span> | 
				<span><img src='.ROOT . DS  . 'webroot' . DS  .'img/email.png height="15px" style="height:15px;margin-top:4px;"/> '. h($invoice->company->email).'</span>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<div align="center" style="font-size: 16px;font-weight: bold;color: #0685a8;">INVOICE</div>
					<div style="border:solid 2px #0685a8;margin-bottom:15px;margin-top: 5px;"></div>
				</td>
			</tr>
		</table>
  </div>
 

  <div id="content"> ';
  
$html.='
	<table width="100%">
		<tr>
			<td width="50%">
				To,<br/>
				<span>'. h(($invoice->customer->customer_name)) .'</span><br/>
				'. $this->Text->autoParagraph(h($invoice->customer_address)) .'
				<span>PO No. :'. h($invoice->customer_po_no) .'</span><br/>
				<span>PO Date. :'. h($invoice->po_date) .'</span><br/>
				<span>TIN No. :'. h($invoice->customer->tin_no) .'</span><br/>
				<span>PAN No. :'. h($invoice->customer->pan_no) .'</span>
			</td>
			<td width="" valign="top" align="right">
				<table>
					<tr>
						<td>Invoice No.</td>
						<td width="20" align="center">:</td>
						<td>'. h(($invoice->in1."/IN-".str_pad($invoice->id, 3, "0", STR_PAD_LEFT)."/".$invoice->in3."/".$invoice->in4)) .'</td>
					</tr>
					<tr>
						<td>Date</td>
						<td width="20" align="center">:</td>
						<td>'. h(date("d-m-Y",strtotime($invoice->date_created))) .'</td>
					</tr>
					<tr>
						<td>LR No.</td>
						<td width="20" align="center">:</td>
						<td>'. h($invoice->lr_no) .'</td>
					</tr>

				</table>
			</td>
		</tr>
	</table>
	
';
 
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

$sr=0; foreach ($invoice->invoice_rows as $invoiceRows): $sr++; 
$html.='
	<tr class="odd">
		<td valign="top" align="center" width="30">'. h($sr) .'</td>
		<td>'. $this->Text->autoParagraph(h($invoiceRows->description)) .'<br/></td>
		<td width="40" valign="top" align="center">'. h($invoiceRows->quantity) .'</td>
		<td style="width: 10;" align="right" valign="top">'. $this->Number->format($invoiceRows->rate,[ 'places' => 2]) .'</td>
		<td style="width: 10;" align="right" valign="top">'. $this->Number->format($invoiceRows->amount,[ 'places' => 2]) .'</td>
	</tr>';
endforeach; 

if($invoice->pnf_type=='1'){ $pnf_text='P&F @ '.$invoice->pnf_per.'%'; }else{ $pnf_text='P&F'; }
if($invoice->discount_type=='1'){ $discount_text='Discount @ '.$invoice->discount_per.'%'; }else{ $discount_text='Discount'; }

$grand_total=explode('.',$invoice->grand_total);
$rupees=$grand_total[0];
$paisa=$grand_total[1];

$html.='</table><br/>';		
$html.='
<table width="100%" class="table_rows">
	<tbody>
			<tr>
				<td rowspan="6">
					<b style="font-size:13px;"><u>Our Bank Details</u></b>
					<table width="100%" class="table2">
						<tr>
							<td width="30%">Bank Name</td>
							<td>: '.h($invoice->company->company_banks[0]->bank_name).'</td>
						</tr>
						<tr>
							<td>Branch</td>
							<td>: '.h($invoice->company->company_banks[0]->branch).'</td>
						</tr>
						<tr>
							<td>Account No</td>
							<td>: '.h($invoice->company->company_banks[0]->account_no).'</td>
						</tr>
						<tr>
							<td>IFSC Code</td>
							<td>: '.h($invoice->company->company_banks[0]->ifsc_code).'</td>
						</tr>
					</table>
				</td>
				<td style="text-align:right;">'.$discount_text.'</td>
				<td style="text-align:right;">'. $this->Number->format($invoice->discount,[ 'places' => 2]).'</td>
			</tr>
			<tr>
				<td style="text-align:justify;">'. h($invoice->ed_description).'</td>
				<td style="text-align:right;" width="100">'. $this->Number->format($invoice->exceise_duty,[ 'places' => 2]).'</td>
			</tr>
			<tr>
				<td  style="text-align:right;">Total</td>
				<td style="text-align:right;">'. $this->Number->format($invoice->total,[ 'places' => 2]).'</td>
			</tr>
			<tr>
				<td style="text-align:right;">'.h($pnf_text).'</td>
				<td style="text-align:right;">'. $this->Number->format($invoice->pnf,[ 'places' => 2]).'</td>
			</tr>
			<tr>
				<td style="text-align:right;">Total after P&F</td>
				<td style="text-align:right;">'. $this->Number->format($invoice->total_after_pnf,[ 'places' => 2]).'</td>
			</tr>
			<tr>
				<td style="text-align:right;">'.h($invoice->sale_tax_description).'('.$this->Number->format($invoice->sale_tax_per,[ 'places' => 2]).'%)</td>
				<td style="text-align:right;">'. $this->Number->format($invoice->sale_tax_amount,[ 'places' => 2]).'</td>
			</tr>
			<tr>
				<td rowspan="2">'. h($invoice->additional_note) .'</td>
				<td style="text-align:justify;">Fright Amount<br/>'. h($invoice->fright_text) .'</td>
				<td style="text-align:right;">'. $this->Number->format($invoice->fright_amount,[ 'places' => 2]) .'</td>
			</tr>
			<tr>
				<td style="text-align:right;"><b>GRAND TOTAL</b></td>
				<td style="text-align:right;">'. $this->Number->format($invoice->grand_total,[ 'places' => 2]) .'</td>
			</tr>
			<tr>
				<td colspan="3"><b>Amount in words: </b>'. h($this->NumberWords->convert_number_to_words($rupees)) .'  Rupees and '. h($this->NumberWords->convert_number_to_words($paisa)) .' Paisa</td>
			</tr>
		</tbody>
	</table>'; 

	

		
$html .= '<div id="footer">
   <table width="100%" class="divFooter">
			<tr>
				<td >
					<table>
						<tr>
							<td collapse="2">Interest @15% per annum shall be charged if not paid with in agreed terms. Invoice is Subject to Udaipur</td>
						</tr>
					</table>
					<table>
						<tr>
							<td>TIN</td>
							<td>: '. h($invoice->company->tin_no) .'</td>
						</tr>
						<tr width="30">
							<td>PAN</td>
							<td>: '. h($invoice->company->pan_no) .'</td>
						</tr>
						<tr>
							<td>CIN</td>
							<td>: '. h($invoice->company->cin_no) .'</td>
						</tr>
					</table>
				</td>
				<td align="right" >
					<div align="center">
						<img src='.ROOT . DS  . 'webroot' . DS  .'signatures/'.$invoice->creator->signature.' height="50px" style="height:50px;"/>
						<br/>
						<span><b>Created by</b></span><br/>
						<span>'. h($invoice->creator->name) .'</span><br/>
						<span>'. h($invoice->creator->designation->name) .'</span><br/>
						<span>'. h($invoice->creator->mobile) .'</span><br/>
						<span>'. h($invoice->creator->email) .'</span>
					</div>
				</td>
			</tr>
		</table>
  </div>';
  

 $html .= '</div>
</body>
</html>';

//echo $html; exit; 

$name='Invoice-'.h(($invoice->in1.'_IN'.str_pad($invoice->id, 3, '0', STR_PAD_LEFT).'_'.$invoice->in3.'_'.$invoice->in4));
$dompdf->loadHtml($html);
$dompdf->setPaper('A4', 'portrait');
$dompdf->render();
$dompdf->stream($name,array('Attachment'=>0));
exit(0);
?>
