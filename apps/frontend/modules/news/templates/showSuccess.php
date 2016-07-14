<header>
    <h1><?= $article->getTitle() ?></h1>
</header>
<section class="top">
    <p class="date"><?= date('d-m-Y', strtotime($article->getDateFrom())) ?></p>
    <p class="date"><?= __("Autor") ?>: <?= $article->getAuthor() ?></p>
</section>
<article>
    <?= $article->getBody(ESC_RAW) ?>
</article>
<hr/>
<a class="back" href="<?= url_for('article') ?>">Powrót do artykłów</a>
<hr/>
<?php foreach ($gallery as $image): ?>
    <div class="gallery-image-wrapper zoom-gallery">
        <a href="<?= $image->getFile() ?>" title="<?= $image->getAlternative() ?>">
            <img src="<?= $image->getFileMin1() ?>" alt="<?= $image->getAlternative() ?>" />
        </a>
    </div>
<?php endforeach; ?>
