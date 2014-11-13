<?php if( $media->getFileMin1() ):?>
  <img src="<?= $media->getFileMin1()?>" width="100"/>
<?php else:?>
  <img src="<?= $media->getFile()?>" width="100"/>
<?php endif;?>
