<?php

include(dirname(__FILE__) . '/../../bootstrap/functional.php');

$browser = new sfTestFunctional(new sfBrowser());

$browser->
        get('/wiadomosci.html')->
        with('request')->begin()->
        isParameter('module', 'news')->
        isParameter('action', 'index')->
        end()->
        with('response')->begin()->
        isStatusCode(200)->
        end();
