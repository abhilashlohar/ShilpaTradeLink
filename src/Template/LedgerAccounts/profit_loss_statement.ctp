<?php //pr($Ledgers_Assets); exit; ?>
<div class="row">
	<div class="col-md-12">
		<div class="portlet box blue">
			<div class="portlet-title">
				<div class="caption">
					<i class="fa fa-cogs"></i>Profit Loss Statement
				</div>
			</div>
			<div class="portlet-body">
				<form method="get">
					<div class="input-group input-medium">
						<input type="text" name="date" class="form-control date-picker" placeholder="Date" data-date-format='dd-mm-yyyy' data-date-end-date='0d'>
						<span class="input-group-btn">
						<button class="btn blue" type="submit">Go</button>
						</span>
					</div>
				</form>
				<?php if($date){ ?>
				<div class="row">
					<div class="col-md-6">
						<div align="center"><h4>Expense</h4></div>
						<table class="table table-condensed table-hover">
							<tbody>
							<?php $Total_Liablities=0; 
							foreach($Ledgers_Expense as $Ledger){ 
							$Total_Liablities+=$Ledger->total_debit-$Ledger->total_credit; ?>
								<tr>
									<td><?= h($Ledger->ledger_account->name) ?></td>
									<td style=" text-align: right; "><?= h($Ledger->total_debit-$Ledger->total_credit) ?></td>
								</tr>
							<?php } ?>
								<tr>
									<th>Total Expense</th>
									<th style=" text-align: right; "><?= h($Total_Liablities) ?></th>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="col-md-6">
						<div align="center"><h4>Income</h4></div>
						<table class="table table-condensed">
							<tbody>
							<?php $Total_Assets=0; 
							foreach($Ledgers_Income as $Ledger){ 
							$Total_Assets+=$Ledger->total_debit-$Ledger->total_credit; ?>
								<tr>
									<td><?= h($Ledger->ledger_account->name) ?></td>
									<td style=" text-align: right; "><?= h($Ledger->total_debit-$Ledger->total_credit) ?></td>
								</tr>
							<?php } ?>
								<tr>
									<th>Total Income</th>
									<th style=" text-align: right; "><?= h($Total_Assets) ?></th>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<?php } ?>
				</ul>
			</div>
		</div>
	</div>
</div>