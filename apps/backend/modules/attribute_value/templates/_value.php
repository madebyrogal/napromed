<?php if($attribute_value->attribute_type->getName() === 'value' ):?>
  <?= $attribute_value->getValue() ?>
<?php else:?>
  <?= $attribute_value->attribute_def_value->getValue() ?>
<?php endif?>
