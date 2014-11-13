<?php

/**
 * contact_form_2 form.
 *
 * @package    tnt
 * @subpackage form
 * @author     Tomasz ROGALSKI rogalski.tomaszek@gmail.com
 * @version    SVN: $Id: sfDoctrineFormTemplate.php 23810 2009-11-12 11:07:44Z Kris.Wallsmith $
 */
class contact_form_2Form extends Basecontact_form_2Form
{
  public function configure()
  {
    unset($this['updated_at']);
    if($this->isNew()){
      
    }
    else{
      $this->widgetSchema['created_at'] = new sfWidgetFormDateTime( array(), array('date' => array('disabled' => true), 'time' => array('disabled' => true)) );
    }
  }
}
