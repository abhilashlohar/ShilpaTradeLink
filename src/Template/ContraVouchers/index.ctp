<<<<<<< HEAD
<?php //pr($pettyCashReceiptVouchers); exit; ?>
<div class="portlet light bordered">
    <div class="portlet-title">
        <div class="caption">
            <i class="icon-globe font-blue-steel"></i>
            <span class="caption-subject font-blue-steel uppercase">Payment Vouchers</span>
        </div>
    </div>
    <div class="portlet-body">
        <div class="row">
            <div class="col-md-12">
                <?php $page_no=$this->Paginator->current('contravouchers'); $page_no=($page_no-1)*20; ?>
                <table class="table table-bordered table-striped table-hover">
                    <thead>
                        <tr>
                            <th>Sr. No.</th>
                            <th>Transaction Date</th>
                            <th>Vocher No</th>
                            <th>Amount</th>
                            <th class="actions"><?= __('Actions') ?></th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php $i=0; foreach ($contravouchers as $contravoucher): $i++; 
                        
                    ?>
                        <tr>
                            <td><?= h(++$page_no) ?></td>
                            <td><?= h(date("d-m-Y",strtotime($contravoucher->transaction_date)))?></td>
                            <td><?= h('#'.str_pad($contravoucher->voucher_no, 4, '0', STR_PAD_LEFT)) ?></td>
                            <td><?= h($contravoucher->contra_voucher_rows[0]->total_dr - $contravoucher->contra_voucher_rows[0]->total_cr) ?></td>
                            <td class="actions">
                            <?php echo $this->Html->link('<i class="fa fa-search"></i>',['action' => 'view', $contravoucher->id],array('escape'=>false,'target'=>'_blank','class'=>'btn btn-xs yellow tooltips','data-original-title'=>'View ')); ?>
                             <?php echo $this->Html->link('<i class="fa fa-pencil-square-o"></i>',['action' => 'edit', $contravoucher->id],array('escape'=>false,'class'=>'btn btn-xs blue tooltips','data-original-title'=>'Edit')); ?>
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
        </div>
=======
<nav class="large-3 medium-4 columns" id="actions-sidebar">
    <ul class="side-nav">
        <li class="heading"><?= __('Actions') ?></li>
        <li><?= $this->Html->link(__('New Contra Voucher'), ['action' => 'add']) ?></li>
        <li><?= $this->Html->link(__('List Companies'), ['controller' => 'Companies', 'action' => 'index']) ?></li>
        <li><?= $this->Html->link(__('New Company'), ['controller' => 'Companies', 'action' => 'add']) ?></li>
        <li><?= $this->Html->link(__('List Contra Voucher Rows'), ['controller' => 'ContraVoucherRows', 'action' => 'index']) ?></li>
        <li><?= $this->Html->link(__('New Contra Voucher Row'), ['controller' => 'ContraVoucherRows', 'action' => 'add']) ?></li>
    </ul>
</nav>
<div class="contraVouchers index large-9 medium-8 columns content">
    <h3><?= __('Contra Vouchers') ?></h3>
    <table cellpadding="0" cellspacing="0">
        <thead>
            <tr>
                <th><?= $this->Paginator->sort('id') ?></th>
                <th><?= $this->Paginator->sort('voucher_no') ?></th>
                <th><?= $this->Paginator->sort('bank_cash_id') ?></th>
                <th><?= $this->Paginator->sort('created_by') ?></th>
                <th><?= $this->Paginator->sort('created_on') ?></th>
                <th><?= $this->Paginator->sort('payment_mode') ?></th>
                <th><?= $this->Paginator->sort('company_id') ?></th>
                <th><?= $this->Paginator->sort('transaction_date') ?></th>
                <th><?= $this->Paginator->sort('edited_by') ?></th>
                <th><?= $this->Paginator->sort('edited_on') ?></th>
                <th><?= $this->Paginator->sort('cheque_no') ?></th>
                <th class="actions"><?= __('Actions') ?></th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($contraVouchers as $contraVoucher): ?>
            <tr>
                <td><?= $this->Number->format($contraVoucher->id) ?></td>
                <td><?= $this->Number->format($contraVoucher->voucher_no) ?></td>
                <td><?= $this->Number->format($contraVoucher->bank_cash_id) ?></td>
                <td><?= $this->Number->format($contraVoucher->created_by) ?></td>
                <td><?= h($contraVoucher->created_on) ?></td>
                <td><?= h($contraVoucher->payment_mode) ?></td>
                <td><?= $contraVoucher->has('company') ? $this->Html->link($contraVoucher->company->name, ['controller' => 'Companies', 'action' => 'view', $contraVoucher->company->id]) : '' ?></td>
                <td><?= h($contraVoucher->transaction_date) ?></td>
                <td><?= $this->Number->format($contraVoucher->edited_by) ?></td>
                <td><?= h($contraVoucher->edited_on) ?></td>
                <td><?= h($contraVoucher->cheque_no) ?></td>
                <td class="actions">
                    <?= $this->Html->link(__('View'), ['action' => 'view', $contraVoucher->id]) ?>
                    <?= $this->Html->link(__('Edit'), ['action' => 'edit', $contraVoucher->id]) ?>
                    <?= $this->Form->postLink(__('Delete'), ['action' => 'delete', $contraVoucher->id], ['confirm' => __('Are you sure you want to delete # {0}?', $contraVoucher->id)]) ?>
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
>>>>>>> origin/master
    </div>
</div>
