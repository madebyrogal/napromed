<td>
  <ul class="sf_admin_td_actions">
    <?php echo $helper->linkToEdit($product_card, array(  'params' =>   array(  ),  'class_suffix' => 'edit',  'label' => 'Edit',)) ?>
    <?php echo $helper->linkToDelete($product_card, array(  'params' =>   array(  ),  'confirm' => 'Are you sure?',  'class_suffix' => 'delete',  'label' => 'Delete',)) ?>
    <li class="sf_admin_action_media">
      <?= link_to('Zdjęcia', '@media_list?moduleName=' . sfContext::getInstance()->getModuleName() . '&parent_id=' . $product_card->getId() );?>
    </li>
  </ul>
</td>
