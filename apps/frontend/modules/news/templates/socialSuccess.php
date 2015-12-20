<h1><?= $pageContext[0]->getTitle() ?></h1>
<?= $pageContext[0]->getContext(ESC_RAW) ?>

<div id="fb-root"></div>
<script>(function (d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id))
            return;
        js = d.createElement(s);
        js.id = id;
        js.src = "//connect.facebook.net/pl_PL/sdk.js#xfbml=1&version=v2.5";
        fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));</script>

<div class="fb-page"
     data-href="https://www.facebook.com/Napromed-141706606186200" 
     data-tabs="timeline" 
     data-width="500" 
     data-height="500" 
     data-small-header="true" 
     data-adapt-container-width="true" 
     data-hide-cover="true" 
     data-show-facepile="true"
     data-adapt-container-width="true">
    <div class="fb-xfbml-parse-ignore">
        <blockquote cite="https://www.facebook.com/facebook">
            <a href="https://www.facebook.com/facebook">Facebook</a>
        </blockquote>
    </div>
</div>