<?php

require_once dirname(__FILE__) . '/../lib/contact_form_1GeneratorConfiguration.class.php';
require_once dirname(__FILE__) . '/../lib/contact_form_1GeneratorHelper.class.php';

/**
 * contact_form_1 actions.
 *
 * @package    tnt
 * @subpackage contact_form_1
 * @author     Tomasz ROGALSKI rogalski.tomaszek@gmail.com
 * @version    SVN: $Id: actions.class.php 23810 2009-11-12 11:07:44Z Kris.Wallsmith $
 */
class contact_form_1Actions extends autoContact_form_1Actions {

    public function executeListShow() {
        $this->contact_form_1 = $this->getRoute()->getObject();
    }

}
