<?php

/**
 * pageTranslation form.
 *
 * @package    tnt
 * @subpackage form
 * @author     Tomasz ROGALSKI rogalski.tomaszek@gmail.com
 * @version    SVN: $Id: sfDoctrineFormTemplate.php 23810 2009-11-12 11:07:44Z Kris.Wallsmith $
 */
class pageTranslationForm extends BasepageTranslationForm
{
  public function configure()
  {
      $this->widgetSchema['meta_title'] = new sfWidgetFormTextarea( array(), array('cols'=>'100', 'rows'=>'7') );
  }
}
