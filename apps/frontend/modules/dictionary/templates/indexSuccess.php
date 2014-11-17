<header>
    <h1><?= $pageContext[0]->getTitle()?></h1>
</header>
<ul>
    <?php foreach($dictionary as $i => $d):?>
    <li>
        <h2 id="<?= $d->getSlug()?>">
            <?= $d->getTitle()?>
            <span>pokaż</span>
        </h2>
        <div><?= $d->getBody(ESC_RAW)?></div>
    </li>
    <?php endforeach; ?>
</ul>