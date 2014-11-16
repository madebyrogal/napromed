<?php

/**
 * product_cardTranslation filter form base class.
 *
 * @package    madebyrogal
 * @subpackage filter
 * @author     Tomasz ROGALSKI rogalski.tomaszek@gmail.com
 * @version    SVN: $Id: sfDoctrineFormFilterGeneratedTemplate.php 29570 2010-05-21 14:49:47Z Kris.Wallsmith $
 */
abstract class Baseproduct_cardTranslationFormFilter extends BaseFormFilterDoctrine
{
  public function setup()
  {
    $this->setWidgets(array(
      'nazwa'  => new sfWidgetFormFilterInput(array('with_empty' => false)),
      'opis'   => new sfWidgetFormFilterInput(),
      'opis_2' => new sfWidgetFormFilterInput(),
      'slug'   => new sfWidgetFormFilterInput(),
    ));

    $this->setValidators(array(
      'nazwa'  => new sfValidatorPass(array('required' => false)),
      'opis'   => new sfValidatorPass(array('required' => false)),
      'opis_2' => new sfValidatorPass(array('required' => false)),
      'slug'   => new sfValidatorPass(array('required' => false)),
    ));

    $this->widgetSchema->setNameFormat('product_card_translation_filters[%s]');

    $this->errorSchema = new sfValidatorErrorSchema($this->validatorSchema);

    $this->setupInheritance();

    parent::setup();
  }

  public function getModelName()
  {
    return 'product_cardTranslation';
  }

  public function getFields()
  {
    return array(
      'id'     => 'Number',
      'nazwa'  => 'Text',
      'opis'   => 'Text',
      'opis_2' => 'Text',
      'lang'   => 'Text',
      'slug'   => 'Text',
    );
  }
}
