<ul class="menu">
  <?php foreach($menu as $item):?>
  <li>
    <a id="m<?= $item->getId()?>" title="<?= $item->getTitle()?>" 
       href="
        <?php if($item->getRouteName() == 'staticPage'):?>
          <?= url_for('staticPage', $item)?>
        <?php else:?>
          <?= url_for('@' . $item->getRouteName())?>
        <?php endif;?>
       ">
       <?= $item->getTitle(ESC_RAW)?>
    </a>
  </li>
  <?php endforeach?>
</ul>
