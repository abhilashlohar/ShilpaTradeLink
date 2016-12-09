<nav class="large-3 medium-4 columns" id="actions-sidebar">
    <ul class="side-nav">
        <li class="heading"><?= __('Actions') ?></li>
        <li><?= $this->Html->link(__('New Employee Company'), ['action' => 'add']) ?></li>
        <li><?= $this->Html->link(__('List Employees'), ['controller' => 'Employees', 'action' => 'index']) ?></li>
        <li><?= $this->Html->link(__('New Employee'), ['controller' => 'Employees', 'action' => 'add']) ?></li>
        <li><?= $this->Html->link(__('List Companies'), ['controller' => 'Companies', 'action' => 'index']) ?></li>
        <li><?= $this->Html->link(__('New Company'), ['controller' => 'Companies', 'action' => 'add']) ?></li>
    </ul>
</nav>
<div class="employeeCompanies index large-9 medium-8 columns content">
    <h3><?= __('Employee Companies') ?></h3>
    <table cellpadding="0" cellspacing="0">
        <thead>
            <tr>
                <th><?= $this->Paginator->sort('employee_id') ?></th>
                <th><?= $this->Paginator->sort('company_id') ?></th>
                <th class="actions"><?= __('Actions') ?></th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($employeeCompanies as $employeeCompany): ?>
            <tr>
                <td><?= $employeeCompany->has('employee') ? $this->Html->link($employeeCompany->employee->name, ['controller' => 'Employees', 'action' => 'view', $employeeCompany->employee->id]) : '' ?></td>
                <td><?= $employeeCompany->has('company') ? $this->Html->link($employeeCompany->company->name, ['controller' => 'Companies', 'action' => 'view', $employeeCompany->company->id]) : '' ?></td>
                <td class="actions">
                    <?= $this->Html->link(__('View'), ['action' => 'view', $employeeCompany->company_id]) ?>
                    <?= $this->Html->link(__('Edit'), ['action' => 'edit', $employeeCompany->company_id]) ?>
                    <?= $this->Form->postLink(__('Delete'), ['action' => 'delete', $employeeCompany->company_id], ['confirm' => __('Are you sure you want to delete # {0}?', $employeeCompany->company_id)]) ?>
                </td>
            </tr>
            <?php endforeach; ?>
        </tbody>
    </table>
    <div class="paginator">
        <ul class="pagination">
            <?= $this->Paginator->prev('< ' . __('previous')) ?>
            <?= $this->Paginator->numbers() ?>
            <?= $this->Paginator->next(__('next') . ' >') ?>
        </ul>
        <p><?= $this->Paginator->counter() ?></p>
    </div>
</div>
