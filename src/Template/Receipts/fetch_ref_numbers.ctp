<?php
$options=[];
foreach($ReferenceBalances as $ReferenceBalance){
	$due_amount=$ReferenceBalance->debit-$ReferenceBalance->credit;
	if($due_amount>0){
		$options[]=['text' =>$ReferenceBalance->reference_no.' (Total: '.$ReferenceBalance->debit.', Due: '.$due_amount.')', 'value' => $ReferenceBalance->reference_no, 'due_amount' => $due_amount];
	}
}
echo $this->Form->input('ref_no', ['empty'=>'--Select-','options'=>$options,'label' => false,'class' => 'form-control input-sm ref_list']); ?>