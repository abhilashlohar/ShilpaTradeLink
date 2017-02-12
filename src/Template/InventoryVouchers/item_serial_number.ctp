<?php
 if(empty($falg)){
	 
 }else{
	$options1=[];
		foreach($SerialNumbers as $SerialNumber){ 
			 $options1[]=['text' =>$SerialNumber->serial_no, 'value' => $SerialNumber->id];
		}  
	 if($options1) { ?>
		<?php echo $this->Form->input('q', ['label'=>false,'options' => $options1,'multiple' => 'multiple','class'=>'form-control select2me','required','style'=>'width:100%']);  ?>
		
 <?php }}?>