<div class="customers view large-9 medium-8 columns content">
    <h3></h3>
    
    
</div>


<div class="portlet box red">
	<div class="portlet-title">
		<div class="caption">
			<?= h($customer->customer_name) ?>
		</div>
	</div>
	<div class="portlet-body">
		<div class="table-scrollable">
			<table class="vertical-table table table-hover">
				<tr>
					<th><?= __('Customer Name') ?></th>
					<td><?= h($customer->customer_name) ?></td>
				</tr>
				<tr>
					<th><?= __('District') ?></th>
					<td><?= $customer->has('district') ? $this->Html->link($customer->district->district, ['controller' => 'Districts', 'action' => 'view', $customer->district->id]) : '' ?></td>
				</tr>
				<tr>
					<th><?= __('Company Group') ?></th>
					<td><?= $customer->has('company_group') ? $this->Html->link($customer->company_group->name, ['controller' => 'CompanyGroups', 'action' => 'view', $customer->company_group->id]) : '' ?></td>
				</tr>
				<tr>
					<th><?= __('Customer Seg') ?></th>
					<td><?= h($customer->customer_seg->name) ?></td>
				</tr>
				<tr>
					<th><?= __('Tin No') ?></th>
					<td><?= h($customer->tin_no) ?></td>
				</tr>
				<tr>
					<th><?= __('Gst No') ?></th>
					<td><?= h($customer->gst_no) ?></td>
				</tr>
				<tr>
					<th><?= __('Pan No') ?></th>
					<td><?= h($customer->pan_no) ?></td>
				</tr>
				<tr>
					<th><?= __('Ecc No') ?></th>
					<td><?= h($customer->ecc_no) ?></td>
				</tr>
			</table>
			
			<div class="related">
				<h4><?= __('Related Customer Contacts') ?></h4>
				<?php if (!empty($customer->customer_contacts)): ?>
				<table class="table table-hover">
					<tr>
						<th><?= __('Id') ?></th>
						<th><?= __('Name') ?></th>
						<th><?= __('Telephone') ?></th>
						<th><?= __('Mobile') ?></th>
						<th><?= __('Rank') ?></th>
					</tr>
					<?php foreach ($customer->customer_contacts as $customerContacts): ?>
					<tr>
						<td><?= h($customerContacts->id) ?></td>
						<td><?= h($customerContacts->name) ?></td>
						<td><?= h($customerContacts->telephone) ?></td>
						<td><?= h($customerContacts->mobile) ?></td>
						<td><?= h($customerContacts->rank) ?></td>
					</tr>
					<?php endforeach; ?>
				</table>
				<?php endif; ?>
			</div>
			<div class="related">
				<h4><?= __('Related Quotations') ?></h4>
				<?php if (!empty($customer->quotations)): ?>
				<table class="table table-hover">
					<tr>
						<th><?= __('Id') ?></th>
						<th><?= __('Ref No') ?></th>
						<th><?= __('Customer Address') ?></th>
						<th><?= __('Salesman') ?></th>
						<th><?= __('Product') ?></th>
						<th><?= __('Finalisation Date') ?></th>
						<th><?= __('Customer For Attention') ?></th>
						<th><?= __('Customer Contact') ?></th>
						<th><?= __('Enquiry No') ?></th>
						<th><?= __('Subject') ?></th>
						<th><?= __('Text') ?></th>
						<th><?= __('Terms Conditions') ?></th>
						<th class="actions"><?= __('Actions') ?></th>
					</tr>
					<?php foreach ($customer->quotations as $quotations): ?>
					<tr>
						<td><?= h($quotations->ref_no) ?></td>
						<td><?= h($quotations->customer_id) ?></td>
						<td><?= h($quotations->customer_address) ?></td>
						<td><?= h($quotations->salesman) ?></td>
						<td><?= h($quotations->product) ?></td>
						<td><?= h($quotations->finalisation_date) ?></td>
						<td><?= h($quotations->customer_for_attention) ?></td>
						<td><?= h($quotations->customer_contact) ?></td>
						<td><?= h($quotations->enquiry_no) ?></td>
						<td><?= h($quotations->subject) ?></td>
						<td><?= h($quotations->text) ?></td>
						<td><?= h($quotations->terms_conditions) ?></td>
						<td class="actions">
							<?= $this->Html->link(__('View'), ['controller' => 'Quotations', 'action' => 'view', $quotations->id]) ?>
							<?= $this->Html->link(__('Edit'), ['controller' => 'Quotations', 'action' => 'edit', $quotations->id]) ?>
							<?= $this->Form->postLink(__('Delete'), ['controller' => 'Quotations', 'action' => 'delete', $quotations->id], ['confirm' => __('Are you sure you want to delete # {0}?', $quotations->id)]) ?>
						</td>
					</tr>
					<?php endforeach; ?>
				</table>
				<?php endif; ?>
			</div>
		</div>
	</div>
</div>