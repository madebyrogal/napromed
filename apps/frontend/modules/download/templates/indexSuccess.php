<header>
    <h1><?= $pageContext[0]->getTitle()?></h1>
</header>
<ul class="files">
    <?php foreach($files as $i => $file):?>
    <li class="<?= $file['extension']?>">
        <a href="<? include_component('common', 'getFile', array('file'=> $file['file']))?>" ><?= $file['title']?></a> - rozmiar: <?= $file['size']?> MB
    </li>
    <?php endforeach; ?>
</ul>