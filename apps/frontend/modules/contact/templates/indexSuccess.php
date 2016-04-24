<header>
    <h1><?= $pageContext[0]->getTitle(); ?></h1>    
</header>
<section class="doctor-name">
    <?= $pageContext[0]->getContext(ESC_RAW); ?>    
    <?php include_component('page', 'showContactDetals') ?>
</section>
<section class="adress">
    <?= $pageContext[1]->getContext(ESC_RAW); ?>
</section>
<section class="google-maps">
    <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d4869.886034601861!2d16.912036!3d52.3895833!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x47045b281fb38d7b%3A0x67c8da97444f271b!2zS29zacWEc2tpZWdvIDE0LCBQb3puYcWELCBQb2xza2E!5e0!3m2!1spl!2spl!4v1461489149103" width="700" height="500" frameborder="0" style="border:0" allowfullscreen></iframe>
</section>
<section class="adress">
    <?= $pageContext[2]->getContext(ESC_RAW); ?>
</section>
<section class="google-maps">
    <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d4877.279306213375!2d18.353443299999995!3d52.322541!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x471b49b891aaafe9%3A0x7ca143f3f8c8cc04!2sKlasztorna+4%2C+62-563+Liche%C5%84+Stary!5e0!3m2!1spl!2spl!4v1416347841415" width="700" height="500" frameborder="0" style="border:0" allowfullscreen></iframe>
</section>
