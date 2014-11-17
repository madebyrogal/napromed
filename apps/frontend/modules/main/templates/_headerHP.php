
<div class="main">
    <?php foreach ($slides as $slide): ?>    
    <section>
        <header>
            <div class="wrapper">
                <h1><?= $slide->getTitle(ESC_RAW)?></h1>
                <?= $slide->getAlternative(ESC_RAW)?>
                <a title="<?= $slide->getTitle(ESC_RAW)?>" href="<?= $slide->getLink()?>">DOWIEDZ SIĘ WIĘCEJ</a>
            </div>
        </header>
        <?= image_tag($slide->getFile(), array('alt'=> wordwrap($slide->getAlternative(), 20), 'data-thumb'=>$slide->getFile()))?>
    </section>
    <?php endforeach; ?>
</div>