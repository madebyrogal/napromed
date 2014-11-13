<?php

/**
 * product_cardTranslation form base class.
 *
 * @method product_cardTranslation getObject() Returns the current form's model object
 *
 * @package    tnt
 * @subpackage form
 * @author     Tomasz ROGALSKI rogalski.tomaszek@gmail.com
 * @version    SVN: $Id: sfDoctrineFormGeneratedTemplate.php 29553 2010-05-20 14:33:00Z Kris.Wallsmith $
 */
abstract class Baseproduct_cardTranslationForm extends BaseFormDoctrine
{
  public function setup()
  {
    $this->setWidgets(array(
      'id'     => new sfWidgetFormInputHidden(),
      'nazwa'  => new sfWidgetFormInputText(),
      'opis'   => new sfWidgetFormTextarea(),
      'opis_2' => new sfWidgetFormTextarea(),
      'lang'   => new sfWidgetFormInputHidden(),
      'slug'   => new sfWidgetFormInputText(),
    ));

    $this->setValidators(array(
      'id'     => new sfValidatorChoice(array('choices' => array($this->getObject()->get('id')), 'empty_value' => $this->getObject()->get('id'), 'required' => false)),
      'nazwa'  => new sfValidatorString(array('max_length' => 255)),
      'opis'   => new sfValidatorString(array('required' => false)),
      'opis_2' => new sfValidatorString(array('required' => false)),
      'lang'   => new sfValidatorChoice(array('choices' => array($this->getObject()->get('lang')), 'empty_value' => $this->getObject()->get('lang'), 'required' => false)),
      'slug'   => new sfValidatorString(array('max_length' => 255, 'required' => false)),
    ));

    $this->validatorSchema->setPostValidator(
      new sfValidatorDoctrineUnique(array('model' => 'product_cardTranslation', 'column' => array('slug', 'lang', 'nazwa')))
    );

    $this->widgetSchema->setNameFormat('product_card_translation[%s]');

    $this->errorSchema = new sfValidatorErrorSchema($this->validatorSchema);

    $this->setupInheritance();

    parent::setup();
  }

  public function getModelName()
  {
    return 'product_cardTranslation';
  }

}
