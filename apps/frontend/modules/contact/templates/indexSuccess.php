<section id="google-maps">
    <iframe width="100%" height="450" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://www.google.pl/maps?t=m&amp;sll=52.2772892,16.9861296&amp;sspn=0.0050414,0.0109864&amp;q=Waniliowa+44&amp;ie=UTF8&amp;hq=&amp;hnear=Waniliowa+44,+62-023+Kamionki,+pozna%C5%84ski,+wielkopolskie&amp;ll=52.277285,16.986124&amp;spn=0.008954,0.022724&amp;z=14&amp;iwloc=A&amp;output=embed"></iframe>
</section>
<section id="top">
    <div class="wrapper">
        <h1><?= $pageContext[0]->getTitle()?></h1>
        <?= $pageContext[0]->getContext(ESC_RAW)?>
        <img class="line" alt="line" src="/images/line.png"/>
    </div>
</section>
<div class="wrapper">
    <section class="contact-form clearfix">
        <!--<div class="error">Lorem ipsum dolor sit amet, consectetuer adipiscing elit.</div>-->
        <section class="left">
            <div class="top"><?= $pageContext[1]->getTitle();?></div>
            <?= $pageContext[1]->getContext(ESC_RAW);?>
            <div class="icon">
                <i class="fa fa-map-marker fa-2x"></i>
                <b><?= $pageContext[2]->getTitle();?></b>
                <?= $pageContext[2]->getContext(ESC_RAW);?>
            </div>
            <div class="icon">
                <i class="fa fa-phone fa-2x"></i>
                <b><?= $pageContext[3]->getTitle();?></b>
                <?= $pageContext[3]->getContext(ESC_RAW);?>
            </div>
            <div class="icon">
                <i class="fa fa-envelope-o fa-2x"></i>
                <b><?= $pageContext[4]->getTitle();?></b>
                <?= $pageContext[4]->getContext(ESC_RAW);?>
            </div>
        </section>
        <section class="right">
            <?php include_partial('contact/contactForm');?>
        </section>
    </section>
</div>