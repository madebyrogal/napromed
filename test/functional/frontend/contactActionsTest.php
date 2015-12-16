<?php

include(dirname(__FILE__) . '/../../bootstrap/functional.php');

$browser = new sfTestFunctional(new sfBrowser());

$browser->
        get('kontakt.html')->
        with('request')->begin()->
        isParameter('module', 'contact')->
        isParameter('action', 'index')->
        end()->
        with('response')->begin()->
        isStatusCode(200)->
        end()
;
