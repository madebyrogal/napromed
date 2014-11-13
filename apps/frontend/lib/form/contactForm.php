<?php

/**
 * newsletter_address form.
 *
 * @package    tnt
 * @subpackage form
 * @author     Tomasz ROGALSKI rogalski.tomaszek@gmail.com
 * @version    SVN: $Id: sfDoctrineFormTemplate.php 23810 2009-11-12 11:07:44Z Kris.Wallsmith $
 */
class contactForm extends sfForm {

  public function configure() {
    $this->disableCSRFProtection();
    $this->widgetSchema->setNameFormat('contact[%s]');
    $this->widgetSchema['name'] = new sfWidgetFormInput();
    $this->widgetSchema['subject'] = new sfWidgetFormInput();
    $this->widgetSchema['email'] = new sfWidgetFormInput();
    $this->widgetSchema['message'] = new sfWidgetFormTextarea();

    $this->validatorSchema['name'] = new sfValidatorString(array('required' => false));
    $this->validatorSchema['subject'] = new sfValidatorString(array('required' => false));
    $this->validatorSchema['email'] = new sfValidatorEmail();
    $this->validatorSchema['message'] = new sfValidatorString(array('required' => true));
  }

  public function save() {
    $values = $this->getValues();
    $model = new contact_form_1();
    foreach ($values as $key => $val) {
      $model->set($key, $val);
    }
    $model->save();
  }

}
