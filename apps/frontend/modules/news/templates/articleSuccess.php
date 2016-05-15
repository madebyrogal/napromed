<header>
    <h1><?= $pageContext[0]->getTitle()?></h1>
</header>
<section class="top">
    <?= $pageContext[0]->getContext(ESC_RAW)?>
</section>
<section class="articles">
    <?php foreach ($articles as $article): ?>
        <article>
            <h2 class="title"><a href=""><?= $article->getTitle(); ?></a></h2>
            <i class="fa fa-pencil"></i> <span class="author"><?= $article->getAuthor(); ?></span> <span class="date"><?= $article->getDate_from(); ?></span>
            <p><?= $article->getSneak_peak(ESC_RAW) ?> <a href="" class="read-more">Czytaj więcej >></a></p>
        </article>
    <?php endforeach; ?>
</section>