<footer class="clearfix">
    <!-- Dynamic links -->
    <div class="wrapper">
        <ul>
            <? foreach ($pages as $page): ?>
                <li><a href="<?= url_for('staticPage', $page) ?>" title="<?= $page->getTitle() ?>"><?= $page->getTitle() ?></a></li>
            <? endforeach; ?>
        </ul>
    </div>
</footer>