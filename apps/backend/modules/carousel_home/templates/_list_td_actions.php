<td>
  <ul class="sf_admin_td_actions">
    <?php echo $helper->linkToEdit($carousel_home, array('params' => array(), 'class_suffix' => 'edit', 'label' => 'Edit',)) ?>
    <?php if ($sf_user->hasCredential('admin')): ?>
      <?php echo $helper->linkToDelete($carousel_home, array('credentials' => 'admin', 'params' => array(), 'confirm' => 'Are you sure?', 'class_suffix' => 'delete', 'label' => 'Delete',)) ?>
    <?php endif; ?>
    <li class="sf_admin_action_media">
      <?= link_to('Slajdy', '@media_list?moduleName=' . sfContext::getInstance()->getModuleName() . '&parent_id=' . $carousel_home->getId() );?>
    </li>
  </ul>
</td>
