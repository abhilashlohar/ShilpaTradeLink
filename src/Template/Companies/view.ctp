<style>
.control-label1{
font-weight: 600;
font-size: 12px;
text-transform: titlecase;
color: #113775;
}
</style>
<div style="border:solid 1px #c7c7c7;background-color: #FFF;padding: 10px;margin: auto;width: 80%;font-size:14px;">
<h3>Company Details</h3>
	<table class="table table-bordered table-striped table-hover">
		<tbody>
			<tr>
				<td width="16%"><label class="control-label1">Name</label></td>
				<td width="16%"><?= h($company->name) ?></td>
				<td width="16%"><label class="control-label1">Alias</label></td>
				<td width="16%"><?= h($company->alias) ?></td>
			</tr>
			<tr>
				<td><label class="control-label1">Pan No</label></td>
				<td><?= h($company->pan_no) ?></td>
				<td><label class="control-label1">Tin No</label></td>
				<td><?= h($company->tin_no) ?></td>
			</tr>
			<tr>
				<td><label class="control-label1">Tan No</label></td>
				<td><?= h($company->tan_no) ?></td>
				<td><label class="control-label1">Cin No</label></td>
				<td><?= h($company->cin_no) ?></td>
			</tr>
			<tr>
				<td><label class="control-label1">Service Tax No</label></td>
				<td><?= h($company->mobile) ?></td>
				<td><label class="control-label1">Landline No'</label></td>
				<td><?= h($company->landline_no) ?></td>
			</tr>
			<tr>
				<td><label class="control-label1">'Mobile No</label></td>
				<td><?= h($company->mobile_no) ?></td>
				<td><label class="control-label1">Email</label></td>
				<td><?= h($company->email) ?></td>
			</tr>
			<tr>
				<td><label class="control-label1">Address</label></td>
				<td><?= h($company->address) ?></td>
				<td><label class="control-label1">Website</label></td>
				<td><?= h($company->website) ?></td>
			</tr>
		</tbody>
</table>
</div>
 