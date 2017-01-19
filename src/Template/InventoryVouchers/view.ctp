<a class="btn  blue hidden-print margin-bottom-5 pull-right" onclick="javascript:window.print();">Print <i class="fa fa-print"></i></a>
<div style="border:solid 1px #c7c7c7;background-color: #FFF;padding: 10px;margin: auto;width: 70%;font-size: 12px;" class="maindiv">
<table width="100%" class="divHeader" border="0">
<tr>
    <td><?php echo $this->Html->image('/logos/'.$inventoryVoucher->company->logo, ['width' => '48%']); ?></td>
    <td valign="bottom" width="35%" align="center" style="font-size:23px;font-weight: bold;color: #0685a8;">INVENTORY VOUCHER</td>
	<td align="right" style="font-size: 14px;" width="36%"> 
 
	<span style="font-size: 20px;"><?= h($inventoryVoucher->company->name) ?></span><br/>
	<span style="font-size: 15px;"><?= $this->Text->autoParagraph(h($inventoryVoucher->company->address)) ?></span>
	<span><?= h($inventoryVoucher->company->landline_no) ?></span><br/>
	<span><?= h($inventoryVoucher->company->mobile_no) ?></span>
	</td>
</tr>
</table>
<div style="border:solid 3px #0685a8;margin-bottom:5px;margin-top: 5px;"></div>
</br>
<table width="100%">
	<tr>
		<td  valign="top" align="left">
			<table border="0">
				<tr>
					<td align="left" width=" "<label style="font-size: 14px;font-weight: bold;">Inventory Voucher No</label></td>
					<td>:</td>
					<td align="right"><?= h($inventoryVoucher->iv1.'/IV'.str_pad($inventoryVoucher->iv2, 3, '0', STR_PAD_LEFT).'/'.$inventoryVoucher->iv3.'/'.$inventoryVoucher->iv4) ?></td>
					<td align="left"></td>
					<td></td>
				</tr>
			</table>
	   </td>
	</tr>
</table>	
</br>
				<table width="100%" id="main_tb" border="1">
					<thead>
						<th width="30%" class="text-center"><label class="control-label">Production</label></th>
						<th align="center" class="text-center"><label class="control-label">Consumption</label></th>
					</thead>
					<tbody id="maintbody"><?php $p=0; $q=0; $r=0; ?>
					<?php 
					foreach ($inventoryVoucher->sales_order->sales_order_rows as $sales_order_row): ?> 
						
						<tr class="main_tr">
							<td valign="top" align="center">
							<?php echo $this->Form->input('sales_order_id', ['type'=>'text','empty'=>'--Select--','class' => 'form-control input-sm','label'=>false,'value'=>$sales_order_row->id,'type'=>'hidden']); ?>
							<?php echo $this->Form->input('sales_order_row_quantity', ['class' => 'form-control input-sm','type'=>'hidden','label'=>false,'value'=>$sales_order_row->quantity]); ?>
							<br/><b><?= h($sales_order_row->item->name) ?> ( <?= h($sales_order_row->quantity) ?> )</b>
							</td>
							
							<td>
							<?php if(sizeof($sales_order_row->inventory_voucher_rows)>0){ ?>
							<?php  $page_no=$this->Paginator->current('SalesOrders'); $page_no=($page_no-1)*20; ?>	
							<div>
								
								<table class="table">
									<thead>
										<th>Sr</th>
										<th width="60%">Item</th>
										<th>Quantity</th>
										<th width="15%"></th>
									</thead>
									<tbody>
										<?php  foreach($sales_order_row->inventory_voucher_rows as $inventory_voucher_row): ?> 
											<tr>
												<td align="center"><?= h(++$page_no) ?></td>
												<td><?= h($inventory_voucher_row->item->name) ?></td>
												<td><?= h($inventory_voucher_row->quantity) ?></td>
											</tr>
										<?php $p++;  endforeach; ?>
									</tbody>
								</table>
							</div>
							<?php } ?>
							</td>
							
						</tr>
						<?php  endforeach; ?>
					</tbody>
				</table>
<table width="100%" class="divFooter">
	<tr>
		<td align="right">
		<table>
			<tr>
				<td align="center">
				<span style="font-size:17px;">For</span> <span style="font-size: 17px;font-weight: bold;"><?= h($inventoryVoucher->company->name)?><br/></span>
				<?php 
				 echo $this->Html->Image('/signatures/'.$inventoryVoucher->creator->signature,['height'=>'50px','style'=>'height:50px;']); 
				 ?></br>
				<span style="font-size: 15px;font-weight: bold;">Authorised Signatory</span>
				</br>
				<span style="font-size:15px;"><?= h($inventoryVoucher->creator->name) ?></span><br/>
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>	
</div>

 
 