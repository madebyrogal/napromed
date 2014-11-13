<!DOCTYPE html>
<html>
    <head>
        <?php include_http_metas() ?>
        <?php include_metas() ?>
        <?php include_title() ?>
        <?php include_stylesheets() ?>
        <link href="/css/onepage-scroll.css" media="screen" type="text/css" rel="stylesheet">
        <?php include_javascripts() ?>
    </head>
    <body class="home">
        <header id="top" class="clearfix">
            <div class="top-header">
                <div class="wrapper clearfix">
                    <div class="top-left">
                        <a id="logo" title="Strona główna" href="<?= url_for('@homepage')?>">
                            <?= image_tag('logo.png', array('alt'=>'Logo'))?>
                            <div class="about">
                                <p><b>NaProMED</b><p> 
                                <p>Prywatna Praktyka Lekarska</p> 
                                <p>Piotr Broda</p>
                            </div>
                        </a>
                        <div id="nav">
                            <a href="" title="">MENU</a>
                        </div>
                    </div>
                    <nav class="hide">
                        <?php include_component('page', 'showMenuHeader') ?>
                    </nav>
                    <div class="doctor">
                        <?= image_tag('piotr.png', array('alt'=>'Informacja o lekarzu'))?>
                    </div>
                </div>
            </div>
        </header>
        <?php //include_partial('main/cookieAlert') ?>
        <?php include_component('main', 'headerHP') ?>
        <?= $sf_content ?>
        <?php include_component('main', 'footer') ?>
    </body>
</html>
