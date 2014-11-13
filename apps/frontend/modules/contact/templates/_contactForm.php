<div id="successAlert" class="alert alert-success alert-dismissable" style="display: none">
  <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
  <strong>Ok.</strong> Twój formularz został wysłany poprawnie :) . Dziękujemy, już wkrótce się z Tobą skontaktujemy. 
</div>
<div id="warningAlert" class="alert alert-danger alert-dismissable" style="display: none">
  <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
  <strong>Uwaga!</strong> Wprowadziłeś niepoprawne dane w pola z czerwoną ramką. Proszę popraw je :)
</div>
<div id="dangerAlert" class="alert alert-danger alert-dismissable" style="display: none">
  <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
  <strong>Błąd!</strong> Podczas wysyłki formularza nastąpił błąd :( . Spróbuj się z nami skontaktować w inny sposób w zakładce "Kontakt"
</div>
<form id="contactForm" action="<?= url_for('@contact_send') ?>" method="post">
    <div class="left">
        <label class="lab-name" for="name"><i class="fa fa-user"></i></label>
        <input id="name" type="text" placeholder="IMIĘ I NAZWISKO" >

        <label class="lab-email" for="email"><i class="fa fa-envelope-o"></i></label>
        <input id="email" type="text" placeholder="EMAIL" >

        <label class="lab-comments" for="comments"><i class="fa fa-comment"></i></label>
        <input id="subject" type="text" placeholder="TEMAT" >
    </div>
    <div class="right">
        <label class="message" ><i class="fa fa-comments"></i></label>
        <textarea id="message" placeholder="TREŚĆ ZAPYTANIA"></textarea>
    </div>
    <button class="clearfix" id="send">Wyślij</button>
    <div class="clearfix"></div>
    <div class="load"></div>
</form>