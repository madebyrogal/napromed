<?php

/**
 * contact_form_1 form.
 *
 * @package    tnt
 * @subpackage form
 * @author     Tomasz ROGALSKI rogalski.tomaszek@gmail.com
 * @version    SVN: $Id: sfDoctrineFormTemplate.php 23810 2009-11-12 11:07:44Z Kris.Wallsmith $
 */
class contact_form_1Form extends Basecontact_form_1Form
{
  public function configure()
  {
    unset($this['updated_at']);
    if($this->isNew()){
      
    }
    else{
      $this->widgetSchema['created_at'] = new sfWidgetFormInputHidden();
    }
  }
}
