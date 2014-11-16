<?php

/**
 * carousel_home filter form base class.
 *
 * @package    madebyrogal
 * @subpackage filter
 * @author     Tomasz ROGALSKI rogalski.tomaszek@gmail.com
 * @version    SVN: $Id: sfDoctrineFormFilterGeneratedTemplate.php 29570 2010-05-21 14:49:47Z Kris.Wallsmith $
 */
abstract class Basecarousel_homeFormFilter extends BaseFormFilterDoctrine
{
  public function setup()
  {
    $this->setWidgets(array(
      'name'             => new sfWidgetFormFilterInput(),
      'number_of_slides' => new sfWidgetFormFilterInput(),
      'type'             => new sfWidgetFormFilterInput(),
      'hidden'           => new sfWidgetFormChoice(array('choices' => array('' => 'yes or no', 1 => 'yes', 0 => 'no'))),
    ));

    $this->setValidators(array(
      'name'             => new sfValidatorPass(array('required' => false)),
      'number_of_slides' => new sfValidatorSchemaFilter('text', new sfValidatorInteger(array('required' => false))),
      'type'             => new sfValidatorSchemaFilter('text', new sfValidatorInteger(array('required' => false))),
      'hidden'           => new sfValidatorChoice(array('required' => false, 'choices' => array('', 1, 0))),
    ));

    $this->widgetSchema->setNameFormat('carousel_home_filters[%s]');

    $this->errorSchema = new sfValidatorErrorSchema($this->validatorSchema);

    $this->setupInheritance();

    parent::setup();
  }

  public function getModelName()
  {
    return 'carousel_home';
  }

  public function getFields()
  {
    return array(
      'id'               => 'Number',
      'name'             => 'Text',
      'number_of_slides' => 'Number',
      'type'             => 'Number',
      'hidden'           => 'Boolean',
    );
  }
}
