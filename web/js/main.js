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

//Działanie hormonów
function hormons(){
    $('#hormon').click(function(){
       var hormonId = $(this).val();
       $('.hormons').hide();
       $('#'+hormonId).show();
    });
    //ESTRADIOL
    $('#estVal').keyup(function(){
        var unitArray = {};
        unitArray['pn']
        var val = $(this).val();
        
    });
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
            console.log(selector);
            $(this).parent('li').addClass('selected');

        }

        //console.log($(this));
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
        $('#'+hash).parent().addClass('active');
        $('#'+hash).next('div').slideDown();
    }
}