<div class="backstage" >
  <div id="objects" class="wrapper">
    <h3>Galeria obiektów którymi zarządzamy</h3>
    <div class="more-office">
      <?php foreach ($images as $key => $img): ?>
        <a href="<?= $img->getFile() ?>" rel="prettyPhoto[]" title="" <?php if (($key + 1) % 6 == 0): ?>class="none"<?php endif; ?>>
          <img alt="" src="<?= $img->getFileMin1() ?>" />
          <span>
            <?= $img->getTitle() ?><br>
            <small class="grey"><?= $img->getAlternative() ?></small>
          </span>
        </a>
      <?php endforeach; ?>
    </div>
    <div class="clear"></div>
  </div>
</div>