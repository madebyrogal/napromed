<div class="clearfix"></div>
<footer class="clearfix footer-other">
    <!-- Dynamic links -->
    <div class="wrapper">
        <ul>
            <?php foreach ($pages as $page): ?>
                <li><a href="<?= url_for('staticPage', $page) ?>" title="<?= $page->getTitle() ?>"><?= $page->getTitle() ?></a></li>
            <?php endforeach; ?>
        </ul>
    </div>
</footer>