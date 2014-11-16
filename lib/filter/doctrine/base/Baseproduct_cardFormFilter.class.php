<?php

/**
 * product_card filter form base class.
 *
 * @package    madebyrogal
 * @subpackage filter
 * @author     Tomasz ROGALSKI rogalski.tomaszek@gmail.com
 * @version    SVN: $Id: sfDoctrineFormFilterGeneratedTemplate.php 29570 2010-05-21 14:49:47Z Kris.Wallsmith $
 */
abstract class Baseproduct_cardFormFilter extends BaseFormFilterDoctrine
{
  public function setup()
  {
    $this->setWidgets(array(
      'hidden'   => new sfWidgetFormChoice(array('choices' => array('' => 'yes or no', 1 => 'yes', 0 => 'no'))),
      'position' => new sfWidgetFormFilterInput(),
    ));

    $this->setValidators(array(
      'hidden'   => new sfValidatorChoice(array('required' => false, 'choices' => array('', 1, 0))),
      'position' => new sfValidatorSchemaFilter('text', new sfValidatorInteger(array('required' => false))),
    ));

    $this->widgetSchema->setNameFormat('product_card_filters[%s]');

    $this->errorSchema = new sfValidatorErrorSchema($this->validatorSchema);

    $this->setupInheritance();

    parent::setup();
  }

  public function getModelName()
  {
    return 'product_card';
  }

  public function getFields()
  {
    return array(
      'id'       => 'Number',
      'hidden'   => 'Boolean',
      'position' => 'Number',
    );
  }
}
