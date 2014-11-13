<ul>
    <?php foreach ($menu as $item): ?>
        <li class="<?php if (isset($item['subpage'])): ?>more<?php endif ?> <?php if ($item['page']->getId() == $activePageId): ?>active<?php endif ?>">
            <a id="m<?= $item['page']->getId() ?>" <?php if (isset($item['subpage'])): ?>class="more"<?php endif ?> title="<?= $item['page']->getTitle() ?>" 
               href="
               <?php if ($item['page']->getRouteName() == 'staticPage'): ?>
                   <?= url_for('staticPage', $item['page']) ?>
               <?php elseif ($item['page']->getAbsoluteLink() != ''): ?>
                   <?= $item['page']->getAbsoluteLink() ?>
               <?php else: ?>
                   <?= url_for('@' . $item['page']->getRouteName()) ?>
               <?php endif; ?>
               " <?php if ($item['page']->getAbsoluteLink() != ''): ?>target="_blank"<?php endif; ?>>
                   <?= $item['page']->getTitle(ESC_RAW) ?>
            </a>
            <?php if (isset($item['subpage'])): ?>
                <ul class="hide <?php if ($item['page']->getId() == $activePageId): ?>show<?php endif ?>">
                    <?php foreach ($item['subpage'] as $page): ?>
                        <li>
                            <a id="m<?= $page->getId() ?>" title="<?= $page->getTitle() ?>" 
                               href="
                               <?php if ($page->getRouteName() == 'staticPage'): ?>
                                   <?= url_for('staticPage', $page) ?>
                               <?php elseif ($page->getAbsoluteLink() != ''): ?>
                                   <?= $page->getAbsoluteLink() ?>
                               <?php else: ?>
                                   <?= url_for('@' . $page->getRouteName()) ?>
                               <?php endif; ?>
                               " <?php if ($item['page']->getAbsoluteLink() != ''): ?>target="_blank"<?php endif; ?>><?= $page->getTitle(ESC_RAW) ?></a>
                        </li>
                    <?php endforeach; ?>
                </ul>
            <?php endif ?>
        </li>
    <?php endforeach ?>
</ul>