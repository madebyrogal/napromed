<!DOCTYPE html>
<html>
    <head>
        <?php include_http_metas() ?>
        <?php include_metas() ?>
        <?php include_title() ?>
        <?php include_stylesheets() ?>
        <?php include_javascripts() ?>
    </head>
    <body class="static">
        <header id="top">
            <div class="top-wrapper">
                <div class="wrapper">
                    <a id="logo" title="Strona główna" href="<?= url_for('@homepage') ?>">
                        <?= image_tag('logo_color_static.png', array('alt' => 'Logo')) ?>
                    </a>
                    <div id="show-menu" >
                        <a title="" href=""><span>Menu</span></a>
                    </div>
                    <div class="doctor">
                        <?= image_tag('piotr.png', array('alt' => 'Informacja o lekarzu')) ?>
                    </div>
                </div>
            </div>
        </header>

        <div class="wrapper clearfix">
            <aside>
                <?php include_component('page', 'showMenuHeader') ?>
                <?php include_component('page', 'showContactDetals') ?>                
            </aside>
            <section class="content">
                <?= $sf_content ?>                
            </section>
        </div>
        <?php //include_partial('main/cookieAlert')?>
        <?php include_component('main', 'footer') ?>
    </body>
</html>