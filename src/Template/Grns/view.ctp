
<a class="btn  blue hidden-print margin-bottom-5 pull-right" onclick="javascript:window.print();">Print <i class="fa fa-print"></i></a>

<div style="border:solid 1px #c7c7c7;background-color: #FFF;padding: 10px;margin: auto;width: 55%;font-size:14px;" class="maindiv">	
<table width="100%" class="divHeader">
		<tr>
			<td width="50%"><?php echo $this->Html->image('/logos/'.$grn->company->logo, ['width' => '40%']); ?></td>
			<td align="right" width="50%" style="font-size: 12px;">
			<span style="font-size: 14px;"><?= h($grn->company->name) ?></span><br/>
			<span><?= $this->Text->autoParagraph(h($grn->company->address)) ?></span>
			<span><?= h($grn->company->mobile_no) ?></span>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<div align="center" style="font-size: 16px;font-weight: bold;color: #0685a8;">GRN</div>
				<div style="border:solid 2px #0685a8;margin-bottom:5px;margin-top: 5px;"></div>
			</td>
		</tr>

	</table>
	<table width="100%">

		<tr>
			<td width="50%" valign="top" align="left">
				<table>
					<tr>
						<td>GRN No</td>
						<td width="30" align="left">:<?= h($grn->grn1)?></td>
					</tr>
				</table>
			</td>
			<td width="50%" valign="top" align="right">
				<table>
					<tr>
						<td>Date</td>
						<td> : <?= h(date("d-m-Y",strtotime($grn->date_created))) ?> </td>
						
					</tr>
				</table>
           </td>

    </tr>
   </table>	
   </br>
<?php $page_no=$this->Paginator->current('Grns'); $page_no=($page_no-1)*20; ?>
<table width="100%" class="table_rows itemrow" border="1">	
	<thead>
	<tr>
		<th style="text-align:center">S.No</th>
		<th style="text-align:center">Item</th>
		<th style="text-align:center">Quantity</th>
	   
	</tr>
	</thead>

<tbody align="center">
<?php foreach ($grn->grn_rows as $grn_row): ?>
	<tr>
		<td><?= h(++$page_no) ?></td>
		<td><?= $grn_row->item->name; ?></td>
		<td><?= $grn_row->quantity; ?></td>
	</tr>
<?php endforeach; ?>
</tbody>
</table>
</br> 
<table width="100%" class="table_rows ">
    <tr>
	   <td align="right" width="50%"> 
		 <span>For<b><?= h($grn->company->name)?></b></span><br/>
		 <?php 
		 echo $this->Html->Image('/signatures/'.$grn->creator->signature,['height'=>'50px','style'=>'height:50px;']); 
		 ?></br>
		 <span><b>Authorised Signatory</b></span><br/>
		 <span><?= h($grn->creator->name) ?></span><br/>
		</td>
    </tr>
</table>


</div>

