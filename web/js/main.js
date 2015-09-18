$(document).ready(function () {
    removeBlur();
    //ciasteczka(0);
    menu();
    menuStatic();
    //tab();
    faq();
    listenAnchorUrl();
    //contactSend();
    hormons();
    hormonsIndex();
    antropometria();
    initMask();
    showLeftMenu();
});

$(window).load(function () {
    if ($('body').hasClass('home')) {
        $(".main").onepage_scroll({
            sectionContainer: "section", // sectionContainer accepts any kind of selector in case you don't want to use section
            easing: "ease", // Easing options accepts the CSS3 easing animation such "ease", "linear", "ease-in", 
            // "ease-out", "ease-in-out", or even cubic bezier value such as "cubic-bezier(0.175, 0.885, 0.420, 1.310)"
            animationTime: 1000, // AnimationTime let you define how long each section takes to animate
            pagination: true, // You can either show or hide the pagination. Toggle true for show, false for hide.
            updateURL: false, // Toggle this true if you want the URL to be updated automatically when the user scroll to each page.
            beforeMove: function (index) {
            }, // This option accepts a callback function. The function will be called before the page moves.
            afterMove: function (index) {
            }, // This option accepts a callback function. The function will be called after the page moves.
            loop: false, // You can have the page loop back to the top/bottom when the user navigates at up/down on the first/last page.
            keyboard: true, // You can activate the keyboard controls
            responsiveFallback: false, // You can fallback to normal page scroll by defining the width of the browser in which
            // you want the responsive fallback to be triggered. For example, set this to 600 and whenever 
            // the browser's width is less than 600, the fallback will kick in.
            direction: "vertical"            // You can now define the direction of the One Page Scroll animation. Options available are "vertical" and "horizontal". The default value is "vertical".  
        });
    }
});

$(window).resize(function() {
    showLeftMenu();
});

//Maska na inputy
function initMask() {
    $('.inputVal').keyup(function () {
        var val = $(this).val();
        val = val.replace(/,/, ".");
        val = val.replace(/[a-zA-Z]/, '');
        $(this).val(val);
    });
}

//Działanie antropometrii
function antropometria() {
    $('#antropometriaCal').click(function () {
        //validacja
        if(validAntropometria()){
            var wzrost = $('#wzrostVal').val();
            var waga = $('#wagaVal').val();
            var talia = $('#taliaVal').val();
            var biodra = $('#biodraVal').val();
            var plec = $('#plecUnit').val();
            var wiek = $('#lataUnit').val() * 5;
            var kreatynina = $('#kreatyninaVal').val();
            var kreatyninaUnit = $('#kreatyninaUnit').val();
            //Obliczenia
            $('#mosteller').html(mosteller(wzrost, waga));
            $('#bmi').html(bmi(waga, wzrost));
            $('#taton').html(taton(wzrost, waga, plec));
            $('#bmc').html(bmc(waga, wzrost, wiek, plec));
            $('#whr').html(whr(talia, biodra, plec));
            $('#whtr').html(whtr(talia, wzrost, plec));
            $('#bmr').html(bmr(waga, wzrost, wiek, plec));
            if( kreatynina !== '' && kreatynina !== 'NaN'){
                $('#kre').html(kre(kreatynina, kreatyninaUnit, wiek, waga, plec));
            }
            else{
                $('#kre').html('---');
            }
            if(wzrost > 150){
                $('#lorenz').html(lorenz(wzrost));
            }
            else{
                $('#lorenz').html('---');
            }
            $('#antropometriaResult').show();
        }
        else{
            $('#antropometriaResult').hide();
        }
    });
}

//Idealna masa ciała wg Lorenza
function lorenz(wzrost){
    var result = (wzrost - 100) - (wzrost - 150)/4
    result = result.toFixed(2);
    return result;
}

//Indeks masy ciała BMI
function bmi(waga, wzrost){
    var result = waga / Math.pow(wzrost/100, 2);
    result = result.toFixed(2);
    return result;
}

//Obliczanie powierzchni ciała BSA Mostellera
function mosteller(wzrost, waga){
    var result = Math.pow((wzrost * waga / 3600), 0.5);
    result = result.toFixed(2);
    return result;
}

//Obliczanie wagi należnej
function taton(wzrost, waga, plec){
    var wagaPrawidlowa = 0;
    var opis = '';
    if(plec === 'f'){
        wagaPrawidlowa = wzrost - (100 + (wzrost - 100) / 10);
    }
    else{
        wagaPrawidlowa = wzrost - (100 + (wzrost - 100) / 20);
    }
    wagaPrawidlowa = wagaPrawidlowa.toFixed(2);
    
    var nadwaga = wagaPrawidlowa * 1.1;
    var otylosc = wagaPrawidlowa * 1.2;
    if(waga < nadwaga){
        opis = "PRAWIDŁOWA";
    }
    else if(nadwaga < waga  && waga < otylosc){
        opis = "NADWAGA";
    }
    else if( waga > otylosc){
        opis = "OTYLOŚĆ";
    }
    var result = wagaPrawidlowa + ' kg ' + opis;
    return result;
}

//Obliczanie beztluszczowej masy ciala
function bmc(waga, wzrost, wiek, plec){
    var result = 0;
    //Kobiety
    if(plec === 'f'){
        //Wiek 30
        if(wiek > 30){
            result = 0.29569 * waga + 0.41813 * wzrost - 43.2933;
        }
        else{
            result = 1.07 * waga - 148 * Math.pow(waga, 2) / Math.pow(100 * wzrost, 1);
        }
    }
    //Mezczyzni
    else{
        //Wiek 16
        if(wiek >= 16){
            result = 0.32810 * waga + 0.33929 * wzrost - 29.5336;
        }
        else{
            result = 1.1 * waga - 128 * Math.pow(waga, 2) / Math.pow(100 * wzrost, 1);
        }
    }
    result = result.toFixed(2);
    return result;
}

//Obliczanie talia/biodro
function whr(talia, biodro, plec){
    var result = talia / biodro;
    var opis = '';
    if(plec === 'f'){
        if(result > 0.8) opis = 'JABŁKO';
        else opis = 'GRUSZKA';
    }
    else{
        if(result > 0.94) opis = 'JABŁKO';
        else opis = 'GRUSZKA';
    }
    result = result.toFixed(2);
    
    return result + ' ' + opis;
}

function whtr(talia, wzrost, plec){
    var result = 0;
    var opis = 0;
    result = talia / wzrost * 100;
    if(plec === 'f'){
        if(result < 35){
            opis = 'Niedyżywiona';
        }
        else if(result >= 35 && result < 42){
            opis = 'Niedowaga';
        }
        else if(result >= 42 && result < 46){
            opis = 'Lekka niedowaga';
        }
        else if(result >= 46 && result < 49){
            opis = 'ZDROWA';
        }
        else if(result >= 49 && result < 54){
            opis = 'Nadwaga';
        }
        else if(result >= 54 && result < 58){
            opis = 'Poważna Nadwaga';
        }
        else if(result >= 58 ){
            opis = 'Otyłość';
        }
    }
    else{
        if(result < 35){
            opis = 'Niedyżywienie';
        }
        else if(result >= 35 && result < 43){
            opis = 'Niedowaga';
        }
        else if(result >= 43 && result < 46){
            opis = 'Lekka niedowaga';
        }
        else if(result >= 46 && result < 53){
            opis = 'ZDROWY';
        }
        else if(result >= 53 && result < 58){
            opis = 'Nadwaga';
        }
        else if(result >= 58 && result < 63){
            opis = 'Poważna Nadwaga';
        }
        else if(result >= 63 ){
            opis = 'Otyłość';
        }
    }
    result = result/100;
    result = result.toFixed(2);
    return result + ' ' + opis;
}

function bmr(waga, wzrost, wiek, plec){
    var result = 0;
    if(plec === 'f'){
        result = 9.99 * waga + 6.25 * wzrost - 4.92 * wiek - 161;
    }
    else{
        result = 9.99 * waga + 6.25 * wzrost - 4.92 * wiek + 5;
    }
    
    result = result.toFixed(2);
    return result;
}

function kre(kreatynina, kreatyninaUnit, wiek, waga, plec){
    var wsk = 0;
    var result = 0;
    if(plec === 'f'){
        wsk = 0.85;
    }
    else{
        wsk = 1;
    }
    
    result = (140 - wiek) * waga / 72 * kreatynina * wsk;
    result = result.toFixed(2);
    return result;
}

//Walidacja formularza antropometrii
function validAntropometria(){
    var result = false;
    var waga = $('#wagaVal').val();
    var talia = $('#taliaVal').val();
    var wiek = $('#lataUnit').val();
    var wzrost = $('#wzrostVal').val();
    var biodra = $('#biodraVal').val();
    var plec = $('#plecUnit').val();
    var kreatynina = $('#kreatyninaVal').val();
    var kreatyninaUnit = $('#kreatyninaUnit').val();
    if(waga !== '' && waga !== 'NaN' && wzrost !== '' && wzrost !== 'NaN' && talia !== '' && talia !== 'NaN' && biodra !== '' && biodra !== 'NaN'){
        result = true;
        $('#wagaVal').prop('style', '');
        $('#wzrostVal').prop('style', '');
        $('#taliaVal').prop('style', '');
        $('#biodraVal').prop('style', '');
    }
    else{
        if(waga === '' || waga === 'NaN') $('#wagaVal').css('border', '1px solid #ff0000');
        else $('#wagaVal').prop('style', '');
        
        if(wzrost === '' || wzrost === 'NaN') $('#wzrostVal').css('border', '1px solid #ff0000');
        else $('#wzrostVal').prop('style', '');
        
        if(talia === '' || talia === 'NaN') $('#taliaVal').css('border', '1px solid #ff0000');
        else $('#taliaVal').prop('style', '');
        
        if(biodra === '' || biodra === 'NaN') $('#biodraVal').css('border', '1px solid #ff0000');
        else $('#biodraVal').prop('style', '');
        
        result = false;
    }
    return result;

}

//Działanie indeksów hormonalnych
function hormonsIndex() {
    //INSULINA
    var insArray = ['pm', 'mi'];
    insArray['pm'] = [];
    insArray['pm']['pm'] = 1;
    insArray['pm']['mi'] = 0.144;
    insArray['mi'] = [];
    insArray['mi']['pm'] = 6.945;
    insArray['mi']['mi'] = 1;

    $('#hormonComplex').click(function () {
        var hormonId = $(this).val();
        $('.hormons').hide();
        $('.hormons input').val('');
        $('#' + hormonId).show();
    });
    //INSULINA
    $('#insVal').keyup(function () {
        calculateHormon('ins', insArray);
    });
    $('#insUnit, #insUnit2').change(function () {
        calculateHormon('ins', insArray);
    });
    //HOMA IR
    $('#glukozaVal, #insulinaVal').keyup(function () {
        var result = parseFloat($('#glukozaVal').val()) * parseFloat($('#insulinaVal').val()) / 22.5;
        result = result.toFixed(2);
        if (result !== 'NaN') {
            $('#odpornoscVal').val(result);
        }
    });

    $('#glukozaUnit').change(function () {
        var unit = $(this).val();
        if (unit === 'mg') {
            $('#insulinaUnit').val('ug');
        }
        else {
            $('#insulinaUnit').val('ui');
        }
    });
    
    //TESTOSTERON
    $('#tesCal').click(function(){
        //Odczyt i konwersja wartości testosteronu
        var tesVal = $('#tesVal').val();
        var tesUnit = $('#tesUnit').val();
        var tesUnitPow = $('#tesUnit').find('option:selected').attr("data");
        tesVal = tesVal * Math.pow(10, tesUnitPow);
        if(tesUnit === 'ng'){
            tesVal = tesVal * 0.0347;
        }
        
        //Odczyt wartości shbg
        var shbgVal = $('#shbgVal').val();
        var shbgUnit = $('#shbgUnit').val();
        
        //Odczyt i konwersja wartości albuminy
        var albVal = $('#albVal').val();
        var albUnit = $('#albUnit').val();
        var albUnitPow = $('#albUnit').find('option:selected').attr("data");
        albVal = albVal * Math.pow(10, albUnitPow);
        
        //Vermeulen
        var NV = 10 * Math.pow(10,8);
        var UV = 3.6 * Math.pow(10,4);
        //Sodegard
        var NS = 5.97 * Math.pow(10,8);
        var US = 4.06 * Math.pow(10,4);
        //Emadi-Konjin
        var NE = 1.4 * Math.pow(10,9);
        var UE = 1.3 * Math.pow(10,4);
        //Obliczenia dla Vermeulen
        var FTV = ft(NV, UV, tesVal, shbgVal, albVal);
        var bioTV = bioT(NV, UV, tesVal, shbgVal, albVal, FTV);
        $('#bioTV').html(bioTV.toFixed(4));
        $('#FTV').html(FTV.toFixed(4));
        
    });
}

//Obliczanie współczynnika a
function wspA(U, N, shbg, alb, T){
    var a = U + N + ( U * N ) * (shbg + alb - T);
    return a;
}

//Obliczanie współczynnika b
function wspB(U, N, shbg, alb, T){
    var b = 1 + N * shbg + U * alb - ( U + N ) * T;
    return b;
}

//Testosteron biodostępny
function bioT(N, U, T, shbg, alb, FT){
    var a = wspA(U, N, shbg, alb, T);
    var b = wspB(U, N, shbg, alb, T);
    var bioT = U * alb * FT / ( 1 + U * FT) + FT;
    return bioT;
}

//Testosteron wolny
function ft(N, U, T, shbg, alb){
    var a = wspA(U, N, shbg, alb, T);
    var b = wspB(U, N, shbg, alb, T);
    var ft = (-b + Math.sqrt( Math.pow(b,2) + 4 * a * T) ) / ( 2 * a);
    return ft;
}

//Działanie hormonów
function hormons() {
    //ESTRADIOL
    var estArray = ['pmol', 'pg'];
    estArray['pmol'] = [];
    estArray['pmol']['pmol'] = 1;
    estArray['pmol']['pg'] = 0.2724;
    estArray['pg'] = [];
    estArray['pg']['pmol'] = 3.671;
    estArray['pg']['pg'] = 1;

    //PROGESTERON
    var proArray = ['nmol', 'ng'];
    proArray['nmol'] = [];
    proArray['nmol']['nmol'] = 1;
    proArray['nmol']['ng'] = 0.3145;
    proArray['ng'] = [];
    proArray['ng']['nmol'] = 3.18;
    proArray['ng']['ng'] = 1;

    //TESTOSTERON
    var tesArray = ['nmol', 'ng'];
    tesArray['nmol'] = [];
    tesArray['nmol']['nmol'] = 1;
    tesArray['nmol']['ng'] = 28.8184;
    tesArray['ng'] = [];
    tesArray['ng']['nmol'] = 0.0347;
    tesArray['ng']['ng'] = 1;

    //PROLAKTYNA
    var prlArray = ['ng', 'mi'];
    prlArray['ng'] = [];
    prlArray['ng']['ng'] = 1;
    prlArray['ng']['mi'] = 20;
    prlArray['mi'] = [];
    prlArray['mi']['ng'] = 0.05;
    prlArray['mi']['mi'] = 1;

    //INSULINA
    var insArray = ['pm', 'mi'];
    insArray['pm'] = [];
    insArray['pm']['pm'] = 1;
    insArray['pm']['mi'] = 0.144;
    insArray['mi'] = [];
    insArray['mi']['pm'] = 6.945;
    insArray['mi']['mi'] = 1;

    //GLUKOZA
    var gluArray = ['mm', 'mg'];
    gluArray['mm'] = [];
    gluArray['mm']['mm'] = 1;
    gluArray['mm']['mg'] = 18.018;
    gluArray['mg'] = [];
    gluArray['mg']['mm'] = 0.0555;
    gluArray['mg']['mg'] = 1;

    //DHEA
    var dheArray = ['nm', 'ng'];
    dheArray['nm'] = [];
    dheArray['nm']['nm'] = 1;
    dheArray['nm']['ng'] = 0.2882;
    dheArray['ng'] = [];
    dheArray['ng']['nm'] = 3.47;
    dheArray['ng']['ng'] = 1;

    //ANDROSTENDION
    var andArray = ['nm', 'ng'];
    andArray['nm'] = [];
    andArray['nm']['nm'] = 1;
    andArray['nm']['ng'] = 28.985;
    andArray['ng'] = [];
    andArray['ng']['nm'] = 0.0345;
    andArray['ng']['ng'] = 1;

    //17–α-OH-PROGESTERON
    var a17Array = ['nm', 'ng'];
    a17Array['nm'] = [];
    a17Array['nm']['nm'] = 1;
    a17Array['nm']['ng'] = 0.33;
    a17Array['ng'] = [];
    a17Array['ng']['nm'] = 3.03;
    a17Array['ng']['ng'] = 1;

    //ESTRON
    var esrArray = ['pm', 'ng'];
    esrArray['pm'] = [];
    esrArray['pm']['pm'] = 1;
    esrArray['pm']['ng'] = 0.027;
    esrArray['ng'] = [];
    esrArray['ng']['pm'] = 37;
    esrArray['ng']['ng'] = 1;

    $('#hormon').click(function () {
        var hormonId = $(this).val();
        $('.hormons').hide();
        $('.hormons input').val('');
        $('#' + hormonId).show();
    });
    //ESTRADIOL
    $('#estVal').keyup(function () {
        calculateHormon('est', estArray);
    });
    $('#estUnit, #estUnit2').change(function () {
        calculateHormon('est', estArray);
    });

    //PROGESTERON
    $('#proVal').keyup(function () {
        calculateHormon('pro', proArray);
    });
    $('#proUnit, #proUnit2').change(function () {
        calculateHormon('pro', proArray);
    });

    //TESTOSTERON
    $('#tesVal').keyup(function () {
        calculateHormon('tes', tesArray);
    });
    $('#tesUnit, #tesUnit2').change(function () {
        calculateHormon('tes', tesArray);
    });

    //PROLAKTYNA
    $('#prlVal').keyup(function () {
        calculateHormon('prl', prlArray);
    });
    $('#prlUnit, #prlUnit2').change(function () {
        calculateHormon('prl', prlArray);
    });

    //INSULINA
    $('#insVal').keyup(function () {
        calculateHormon('ins', insArray);
    });
    $('#insUnit, #insUnit2').change(function () {
        calculateHormon('ins', insArray);
    });

    //GLUKOZA
    $('#gluVal').keyup(function () {
        calculateHormon('glu', gluArray);
    });
    $('#gluUnit, #gluUnit2').change(function () {
        calculateHormon('glu', gluArray);
    });

    //DHEA
    $('#dheVal').keyup(function () {
        calculateHormon('dhe', dheArray);
    });
    $('#dheUnit, #dheUnit2').change(function () {
        calculateHormon('dhe', dheArray);
    });

    //ANDROSTENDION
    $('#andVal').keyup(function () {
        calculateHormon('and', andArray);
    });
    $('#andUnit, #andUnit2').change(function () {
        calculateHormon('and', andArray);
    });

    //17–α-OH-PROGESTERON
    $('#a17Val').keyup(function () {
        calculateHormon('a17', a17Array);
    });
    $('#a17Unit, #a17Unit2').change(function () {
        calculateHormon('a17', a17Array);
    });

    //ESTRON
    $('#esrVal').keyup(function () {
        calculateHormon('esr', esrArray);
    });
    $('#esrUnit, #esrUnit2').change(function () {
        calculateHormon('esr', esrArray);
    });
}

//Funkcja obliczająca działanie hormonów
function calculateHormon(hormon, unitArray) {
    var val = $('#' + hormon + 'Val').val();
    var unit = $('#' + hormon + 'Unit').val();
    var pow = $('#' + hormon + 'Unit').find('option:selected').attr("data")
    var unit2 = $('#' + hormon + 'Unit2').val();
    var pow2 = $('#' + hormon + 'Unit2').find('option:selected').attr("data")
    var val2 = val * unitArray[unit][unit2];
    if(pow !== 'NaN' && typeof pow !== 'undefined' && typeof pow2 !== 'undefined'){
        val2 = val2 * Math.pow(10,(pow-pow2));
    }
    val2 = val2.toFixed(4);
    if (val2 !== 'NaN') {
        $('#' + hormon + 'Val2').val(val2);
    }
}

function contactSend() {
    $('#send').click(function (e) {
        e.preventDefault();
        //Clear input class
        $('#email').removeClass('error');
        $('#message').removeClass('error');

        //Get data
        var name = $('#name').val();
        var email = $('#email').val();
        var subject = $('#subject').val();
        var message = $('#message').val();
        //Walidacja
        if (isEmail(email) && message !== '') {
            showAlert('RESET');
            //Set data
            var data = 'contact[name]=' + name + '&contact[email]=' + email + '&contact[subject]=' + subject + '&contact[message]=' + message;
            var url = $('#contactForm').attr('action');
            $.ajax({
                url: url,
                type: 'POST',
                data: data,
                beforeSend: function () {
                    $('#send').hide();
                    $('.load').show();
                },
                success: function (data) {
                    if (data === '1') {
                        showAlert('OK');
                        $('#name').val('');
                        $('#email').val('');
                        $('#subject').val('');
                        $('#message').val('');
                    }
                    else {
                        showAlert('ERROR');
                    }
                    $('.load').hide();
                    $('#send').show();
                }
            });
        }
        else {
            showAlert('WARNING');
            //Email
            if (!isEmail(email)) {
                $('#email').addClass('error');
            }
            else {
                $('#email').removeClass('error');
            }
            //Message
            if (message === '') {
                $('#message').addClass('error');
            }
            else {
                $('#message').removeClass('error');
            }
        }
    });
}
//Alerty
function showAlert(type) {
    if (type === 'OK') {
        $('#successAlert').show();
    }
    if (type === 'ERROR') {
        $('#dangerAlert').show();
    }
    if (type === 'WARNING') {
        $('#warningAlert').show();
    }
    if (type === 'RESET') {
        $('#successAlert').hide();
        $('#warningAlert').hide();
        $('#dangerAlert').hide();
    }
}

//validation function
function isEmail(email) {
    var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    return regex.test(email);
}

//function check resolution

function checkResolution() {
    var windowWidth = Math.max( $(window).width(), window.innerWidth),
    device = "";

    if (windowWidth <= 767) {
        device = "mobile";
    } else if (windowWidth <= 1024) {
        device = "tablet";
    } else {
        device = "desktop";
    }

    return device;
}

//Obsługa menu oferty
function tab() {
    $('#tab a').click(function (e) {
        e.preventDefault();
        if ($(this).parent('li').hasClass('selected')) {
        }
        else {
            var selector = $(this).attr('href');
            $('#tab li').removeClass('selected');
            $('article div').removeClass('in');
            $(selector).addClass('in').show();
            $(this).parent('li').addClass('selected');

        }
    });
}

//Rozwijane opisy w faq
function faq() {
    $('.faq ul li h2').click(function (e) {
        e.preventDefault();
        if ($(this).parent().hasClass('active')) {
            $(this).next('div').slideUp();
            $(this).parent().removeClass('active');
        } else {
            $('.faq li div').slideUp();
            $('.faq ul li').removeClass('active');
            $(this).parent().addClass('active');
            $(this).next('div').slideDown();
        }
    });
}

function menu() {
    $('#nav').click(function (e) {
        e.preventDefault();
        $('nav').removeClass('hide').addClass('show');
        $('#nav').hide();
    });

    $('#close').click(function (e) {
        e.preventDefault();
        $('nav').removeClass('show').addClass('hide');
        $('#nav').show();
    });

    /*$(window).resize(function() {
     if ($(document).width()>1020) {
     $('nav').css('display','block');
     }
     else {
     $('nav').css('display','none');
     }
     });*/
}

function showLeftMenu() {
    if (checkResolution() === 'desktop') {
        $('#show-menu a').removeClass('show').addClass('hide');
        $('aside').removeClass('hide');
    }
    else {
        $('#show-menu a').removeClass('show').addClass('hide');
        $('aside').addClass('hide');
        $('#show-menu a').click(function (e) {
            e.preventDefault();
            if($(this).hasClass('show')) {
                $(this).removeClass('show').addClass('hide');
                $('aside').addClass('hide');
            }
            else {
                $(this).removeClass('hide').addClass('show');
                $('aside').removeClass('hide');
            }
        });  
    }
}

function menuStatic() {
    $('aside ul li.more a.more').click(function (e) {
        e.preventDefault();
        if ($(this).parent().hasClass('active')) {
            $(this).parent().removeClass('active');
            $(this).parent().children('ul').removeClass('show').addClass('hide');
        } else {
            $('aside ul li.more').removeClass('active');
            $('aside ul li.more').children('ul').removeClass('show').addClass('hide');
            $(this).parent().addClass('active');
            $(this).parent().children('ul').removeClass('hide').addClass('show');
        }
    });
}

//Usuwa mrówki wokoło kliknietego obszaru
function removeBlur() {
    $("a").bind("focus", function () {
        if (this.blur)
            this.blur();
    });
}

//Akceptacja ciasteczek
function ciasteczka(a)
{
    if (a > 0)
    {
        $.cookie('ciasteczka_accept', '1', {
            path: '/',
            expires: 3650
        });
        $('#ciasteczka_alert').hide();
    }
    else
    {
        if ($.cookie('ciasteczka_accept') >= 0)
            $('#ciasteczka_alert').hide();
        else
            $('#ciasteczka_alert').show();
    }
}
//Nasłuchuje anchora w linku
function listenAnchorUrl() {
    if (window.location.hash) {
        var hash = window.location.hash.substring(1);
        $('.faq li div').slideUp();
        $('.faq ul li').removeClass('active');
        $('#' + hash).parent().addClass('active');
        $('#' + hash).next('div').slideDown();
    }
}