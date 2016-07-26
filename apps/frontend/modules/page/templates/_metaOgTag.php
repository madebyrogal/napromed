<?php foreach ($ogTagData['fb'] as $key => $value):?>
    <meta property="og:<?= $key?>" content="<?= $value?>" />
<?php endforeach;?>