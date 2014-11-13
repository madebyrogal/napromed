<?php

/**
 * carousel_home form.
 *
 * @package    tnt
 * @subpackage form
 * @author     Tomasz ROGALSKI rogalski.tomaszek@gmail.com
 * @version    SVN: $Id: sfDoctrineFormTemplate.php 23810 2009-11-12 11:07:44Z Kris.Wallsmith $
 */
class carousel_homeForm extends Basecarousel_homeForm
{
  public function configure()
  {
    $type = array('Prosty', 'Losowy');
    $typeValid = array_keys($type);
    $this->widgetSchema['type'] = new sfWidgetFormChoice( array('choices' => $type ) );
    if( $this->isNew() ){
      $this->setDefault('hidden', false);
    }
    else{
      $this->widgetSchema['name'] = new sfWidgetFormInput( array(), array('readonly' => true) );
    }
    
    $this->validatorSchema['type'] = new sfValidatorChoice( array('choices' => $typeValid ) );
  }
}
