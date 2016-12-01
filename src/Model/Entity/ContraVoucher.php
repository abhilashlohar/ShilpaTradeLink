<?php
namespace App\Model\Entity;

use Cake\ORM\Entity;

/**
 * ContraVoucher Entity
 *
 * @property int $id
 * @property \Cake\I18n\Time $created_on
 * @property \Cake\I18n\Time $transaction_date
 * @property int $cash_bank_from
 * @property string $payment_mode
 * @property int $cash_bank_to
 * @property string $narration
 * @property float $amount
 * @property int $company_id
 * @property int $created_by
 *
 * @property \App\Model\Entity\Company $company
 */
class ContraVoucher extends Entity
{

    /**
     * Fields that can be mass assigned using newEntity() or patchEntity().
     *
     * Note that when '*' is set to true, this allows all unspecified fields to
     * be mass assigned. For security purposes, it is advised to set '*' to false
     * (or remove it), and explicitly make individual fields accessible as needed.
     *
     * @var array
     */
    protected $_accessible = [
        '*' => true,
        'id' => false
    ];
}
