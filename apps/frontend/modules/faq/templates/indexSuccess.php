<header>
    <h1><?= $pageContext[0]->getTitle()?></h1>
</header>
<ul>
    <?php foreach($faq as $i => $f):?>
    <li>
        <h2 <?php if($i%2 == 0):?>class="odd"<?php endif;?>>
            <?= $f->getTitle()?>
            <span>pokaż</span>
        </h2>
        <div><?= $f->getBody(ESC_RAW)?></div>
    </li>
    <?php endforeach; ?>
</ul>