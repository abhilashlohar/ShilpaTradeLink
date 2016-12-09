<nav class="large-3 medium-4 columns" id="actions-sidebar">
    <ul class="side-nav">
        <li class="heading"><?= __('Actions') ?></li>
        <li><?= $this->Html->link(__('Edit Employee Company'), ['action' => 'edit', $employeeCompany->company_id]) ?> </li>
        <li><?= $this->Form->postLink(__('Delete Employee Company'), ['action' => 'delete', $employeeCompany->company_id], ['confirm' => __('Are you sure you want to delete # {0}?', $employeeCompany->company_id)]) ?> </li>
        <li><?= $this->Html->link(__('List Employee Companies'), ['action' => 'index']) ?> </li>
        <li><?= $this->Html->link(__('New Employee Company'), ['action' => 'add']) ?> </li>
        <li><?= $this->Html->link(__('List Employees'), ['controller' => 'Employees', 'action' => 'index']) ?> </li>
        <li><?= $this->Html->link(__('New Employee'), ['controller' => 'Employees', 'action' => 'add']) ?> </li>
        <li><?= $this->Html->link(__('List Companies'), ['controller' => 'Companies', 'action' => 'index']) ?> </li>
        <li><?= $this->Html->link(__('New Company'), ['controller' => 'Companies', 'action' => 'add']) ?> </li>
    </ul>
</nav>
<div class="employeeCompanies view large-9 medium-8 columns content">
    <h3><?= h($employeeCompany->company_id) ?></h3>
    <table class="vertical-table">
        <tr>
            <th><?= __('Employee') ?></th>
            <td><?= $employeeCompany->has('employee') ? $this->Html->link($employeeCompany->employee->name, ['controller' => 'Employees', 'action' => 'view', $employeeCompany->employee->id]) : '' ?></td>
        </tr>
        <tr>
            <th><?= __('Company') ?></th>
            <td><?= $employeeCompany->has('company') ? $this->Html->link($employeeCompany->company->name, ['controller' => 'Companies', 'action' => 'view', $employeeCompany->company->id]) : '' ?></td>
        </tr>
    </table>
</div>
