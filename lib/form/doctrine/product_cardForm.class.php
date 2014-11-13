<?php

/**
 * product_card form.
 *
 * @package    tnt
 * @subpackage form
 * @author     Tomasz ROGALSKI rogalski.tomaszek@gmail.com
 * @version    SVN: $Id: sfDoctrineFormTemplate.php 23810 2009-11-12 11:07:44Z Kris.Wallsmith $
 */
class product_cardForm extends Baseproduct_cardForm {

  public function configure() {
    $langs = langTable::getAllVisibleLang();
    $aLangs = langTable::getAllVisibleLangToArray();
    $this->embedI18n($aLangs);
    foreach ($langs as $lang) {
      $this->widgetSchema->setLabel($lang->getSlug(), $lang->getName());
    }

    $this->widgetSchema['position'] = new sfWidgetFormInputHidden();
    foreach ($langs as $lang) {
      $this->widgetSchema[$lang->getSlug()]['opis'] = new sfWidgetFormTextareaTinyMCE(array('width' => 700, 'height' => 400));
      $this->widgetSchema[$lang->getSlug()]['opis_2'] = new sfWidgetFormTextareaTinyMCE(array('width' => 700, 'height' => 400));
      $this->widgetSchema[$lang->getSlug()]['slug'] = new sfWidgetFormInputHidden();
    }
    if ($this->isNew()) {
      $this->setDefault('hidden', false);
    }
  }

}
