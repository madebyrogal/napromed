<header>
    <h1><?= $article->getTitle() ?></h1>
</header>
<section class="top">
    <p class="date"><?= date('d-m-Y', strtotime($article->getDateFrom()))?></p>
    <p class="date"><?= __("Autor")?>: <?= $article->getAuthor()?></p>
</section>
<article>
    <?= $article->getBody(ESC_RAW) ?>
</article>
<a class="back" href="<?= url_for('article') ?>">Powrót do artykłów</a>