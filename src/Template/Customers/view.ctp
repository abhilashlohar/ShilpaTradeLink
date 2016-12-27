<?php //pr($customer); exit;?>
<style>
.control-label1{
font-weight: 600;
font-size: 12px;
text-transform: titlecase;
color: #113775;
}
</style>
<div style="border:solid 1px #c7c7c7;background-color: #FFF;padding: 10px;margin: auto;width: 80%;font-size:14px;">
<h3>Customer Details</h3>
	<table class="table table-bordered table-striped table-hover">
		<tbody>
			<tr>
				<td><label class="control-label1">Customer Name</label></td>
				<td><?= h($customer->customer_name) ?></td>
				<td><label class="control-label1">Alias</label></td>
				<td><?= h($customer->alias) ?></td>
				<td> </td>
			</tr>
			<tr>
			    <td><label class="control-label1">District</label></td>
				<td><?= $customer->has('district') ? $this->Html->link($customer->district->district, ['controller' => 'Districts', 'action' => 'view', $customer->district->id]) : '' ?></td>
				<td><label class="control-label1">Company Group</label></td>
				<td><?= $customer->has('company_group') ? $this->Html->link($customer->company_group->name, ['controller' => 'CompanyGroups', 'action' => 'view', $customer->company_group->id]) : '' ?></td>
			</tr>
			<tr>
			   <td><label class="control-label1">Tin No</label></td>
				<td><?= h($customer->tin_no) ?></td>
				<td><label class="control-label1">Gst No</label></td>
				<td><?= h($customer->gst_no) ?></td>
			</tr>
			<tr>
			<td><label class="control-label1">Pan No</label></td>
			<td><?= h($customer->pan_no) ?></td>
			<td><label class="control-label1">Ecc No</label></td>
			<td><?= h($customer->ecc_no) ?></td>
			</tr>
			<tr>
				<td><label class="control-label1">Customer Seg</label></td>
				<td><?= h($customer->customer_seg->name) ?></td>
			</tr>
		</tbody>
	</table>
<h3>Customer's Contacts</h3>	 
	<table class="table table-bordered table-striped table-hover">
		<tbody>		
			<tr>
				<td><label class="control-label1">Sr.No.<label></td>
				<td><label class="control-label1">Name<label></td>
				<td><label class="control-label1">Contact Person<label></td>
				<td><label class="control-label1">Designation<label></td>
				<td><label class="control-label1">Telephone<label></td>
				<td><label class="control-label1">Email<label></td>
				<td><label class="control-label1">Mobile<label></td>
				<td><label class="control-label1">Default Contact<label></td>
			</tr>
			<?php $i=0; foreach ($customer->customer_contacts as $customer):$i++; ?>
			<tr>
				<td><?= h($i) ?></td>
			    <td><?= h($customer->customer_id) ?></td>
				<td><?= h($customer->contact_person) ?></td>
				<td><?= h($customer->designation) ?></td>
				<td><?= h($customer->telephone) ?></td>
				<td><?= h($customer->email) ?></td>
				<td><?= h($customer->mobile) ?></td>
				<td><?= h($customer->default_contact) ?></td>
				<?php endforeach; ?>
			</tr>
		</tbody>
	</table>
</div>
 