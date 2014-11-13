<div class="main">
    <?php foreach ($slides as $slide): ?>
    <section>
        <header>
            <div class="wrapper">
                <h1><?= $slide->getTitle(ESC_RAW)?></h1>
                <p><?= $slide->getAlternative(ESC_RAW)?></p>
                <a title="" href="">DOWIEDZ SIĘ WIĘCEJ</a>
            </div>
        </header>
        <?= image_tag($slide->getFile(), array('alt'=> wordwrap($slide->getAlternative(), 20), 'data-thumb'=>$slide->getFile()))?>
    </section>
    <?php endforeach; ?>
</div>