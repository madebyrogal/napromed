<header>
    <h1><?= $pageContext[0]->getTitle()?></h1>
</header>
<section>
    <?= $pageContext[0]->getContext(ESC_RAW)?>
</section>