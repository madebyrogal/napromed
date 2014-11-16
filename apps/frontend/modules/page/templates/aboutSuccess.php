<header>
    <h1><?= $pageContext[0]->getTitle()?></h1>
</header>
<section class="top">
    <?= $pageContext[0]->getContext(ESC_RAW)?>
</section>
<section>
    <?= $pageContext[1]->getContext(ESC_RAW)?>
</section>