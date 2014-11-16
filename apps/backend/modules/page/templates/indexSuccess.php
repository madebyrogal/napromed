<?php use_helper('I18N', 'Date') ?>
<?php include_partial('page/assets') ?>

<div id="sf_admin_container">
    <h1><?php echo __('Strony', array(), 'messages') ?></h1>
    <?php include_partial('page/flashes') ?>

    <div id="sf_admin_content">
        <div class="sf_admin_list">
            <?php if (count($pages) == 0): ?>
                <p><?php echo __('No result', array(), 'sf_admin') ?></p>
            <?php else: ?>
                <table cellspacing="0">
                    <thead>
                        <tr>
                            <th class="sf_admin_text sf_admin_list_th_title">
                                <?php echo __('Title', array(), 'messages') ?>
                            </th>
                            <th class="sf_admin_text sf_admin_list_th_parent">
                                <?php echo __('Parent', array(), 'messages') ?>
                            </th>
                            <th class="sf_admin_boolean sf_admin_list_th_hidden">
                                <?php echo __('Ukryta', array(), 'messages') ?>
                            </th>
                            <th class="sf_admin_boolean sf_admin_list_th_not_in_menu">
                                <?php echo __('Poza menu', array(), 'messages') ?>
                            </th>
                            <th id="sf_admin_list_th_actions"><?php echo __('Actions', array(), 'sf_admin') ?></th>
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                            <th colspan="5">

                            </th>
                        </tr>
                    </tfoot>
                    <tbody>
                        <?php foreach ($pages as $i => $page): $odd = fmod( ++$i, 2) ? 'odd' : 'even' ?>
                            <tr class="sf_admin_row <?php echo $odd ?>">
                                <td class="sf_admin_text sf_admin_list_td_title">
                                    <?php if (count($page['subpage']) > 0): ?>
                                        <a id="opener_<?= $i ?>" class="open"><?php echo $page['page']->getTitle() ?></a>
                                    <?php else: ?>
                                        <?php echo $page['page']->getTitle() ?>
                                    <?php endif; ?>
                                </td>
                                <td class="sf_admin_text sf_admin_list_td_parent">
                                    <?php echo $page['page']->getParent() ?>
                                </td>
                                <td class="sf_admin_boolean sf_admin_list_td_hidden">
                                    <?php echo get_partial('page/list_field_boolean', array('value' => $page['page']->getHidden())) ?>
                                </td>
                                <td class="sf_admin_boolean sf_admin_list_td_not_in_menu">
                                    <?php echo get_partial('page/list_field_boolean', array('value' => $page['page']->getNotInMenu())) ?>
                                </td>
                                <td>
                                    <ul class="sf_admin_td_actions">
                                        <li class="sf_admin_action_promote">
                                            <?php echo link_to(__('Up', array(), 'messages'), 'page/Promote?id=' . $page['page']->getId(), array()) ?>
                                        </li>
                                        <li class="sf_admin_action_demote">
                                            <?php echo link_to(__('Down', array(), 'messages'), 'page/Demote?id=' . $page['page']->getId(), array()) ?>
                                        </li>
                                        <?php echo $helper->linkToEdit($page['page'], array('params' => array(), 'class_suffix' => 'edit', 'label' => 'Edit',)) ?>
                                        <?php if ($sf_user->hasCredential('admin')): ?>
                                            <?php echo $helper->linkToDelete($page['page'], array('credentials' => 'admin', 'params' => array(), 'confirm' => 'Are you sure?', 'class_suffix' => 'delete', 'label' => 'Delete',)) ?>
                                        <?php endif; ?>
                                        <li class="sf_admin_action_show">
                                            <?= link_to('Teksty', '@text_list?moduleName=' . sfContext::getInstance()->getModuleName() . '&parent_id=' . $page['page']->getId()); ?>
                                        </li>
                                    </ul>
                                </td>
                            </tr>
                            <?php foreach ($page['subpage'] as $j => $subpage): $odd = fmod( ++$j, 2) ? 'odd' : 'even' ?>
                                <tr class="hidden hide_<?= $i ?> sf_admin_row <?php echo $odd ?>">
                                    <td class="sf_admin_text sf_admin_list_td_title" style="padding-left: 25px;">
                                        <?php echo $subpage->getTitle() ?>
                                    </td>
                                    <td class="sf_admin_text sf_admin_list_td_parent">
                                        <?php echo $subpage->getParent() ?>
                                    </td>
                                    <td class="sf_admin_boolean sf_admin_list_td_hidden">
                                        <?php echo get_partial('page/list_field_boolean', array('value' => $subpage->getHidden())) ?>
                                    </td>
                                    <td class="sf_admin_boolean sf_admin_list_td_not_in_menu">
                                        <?php echo get_partial('page/list_field_boolean', array('value' => $subpage->getNotInMenu())) ?>
                                    </td>
                                    <td>
                                        <ul class="sf_admin_td_actions">
                                            <li class="sf_admin_action_promote">
                                                <?php echo link_to(__('Up', array(), 'messages'), 'page/Promote?id=' . $subpage->getId(), array()) ?>
                                            </li>
                                            <li class="sf_admin_action_demote">
                                                <?php echo link_to(__('Down', array(), 'messages'), 'page/Demote?id=' . $subpage->getId(), array()) ?>
                                            </li>
                                            <?php echo $helper->linkToEdit($subpage, array('params' => array(), 'class_suffix' => 'edit', 'label' => 'Edit',)) ?>
                                            <?php if ($sf_user->hasCredential('admin')): ?>
                                                <?php echo $helper->linkToDelete($subpage, array('credentials' => 'admin', 'params' => array(), 'confirm' => 'Are you sure?', 'class_suffix' => 'delete', 'label' => 'Delete',)) ?>
                                            <?php endif; ?>
                                            <li class="sf_admin_action_show">
                                                <?= link_to('Teksty', '@text_list?moduleName=' . sfContext::getInstance()->getModuleName() . '&parent_id=' . $subpage->getId()); ?>
                                            </li>
                                        </ul>
                                    </td>
                                </tr>
                            <?php endforeach; ?>
                        <?php endforeach; ?>
                    </tbody>
                </table>
            <?php endif; ?>
        </div>
        <script type="text/javascript">
            /* <![CDATA[ */
            $(document).ready(function () {
                $('a.open').click(function () {
                    var id = $(this).attr('id');
                    console.log(id);
                    id = id.split('_');
                    id = id[1];
                    $('tr.hide_' + id).slideToggle();
                })
            });
            function checkAll()
            {
                var boxes = document.getElementsByTagName('input');
                for (var index = 0; index < boxes.length; index++) {
                    box = boxes[index];
                    if (box.type == 'checkbox' && box.className == 'sf_admin_batch_checkbox')
                        box.checked = document.getElementById('sf_admin_list_batch_checkbox').checked
                }
                return true;
            }
            /* ]]> */
        </script>
        <ul class="sf_admin_actions">
            <?php include_partial('page/list_batch_actions', array('helper' => $helper)) ?>
            <?php include_partial('page/list_actions', array('helper' => $helper)) ?>
        </ul>
    </div>

    <div id="sf_admin_footer">
        <?php include_partial('page/list_footer') ?>
    </div>
</div>
