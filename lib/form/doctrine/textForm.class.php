<?php

/**
 * text form.
 *
 * @package    tnt
 * @subpackage form
 * @author     Tomasz ROGALSKI tomasz.rogalski@huevo.pl
 * @version    SVN: $Id: sfDoctrineFormTemplate.php 23810 2009-11-12 11:07:44Z Kris.Wallsmith $
 */
class textForm extends BasetextForm {

  public function configure() {
    $langs = langTable::getAllVisibleLang();
    $aLangs = langTable::getAllVisibleLangToArray();
    $this->embedI18n($aLangs);
    foreach ($langs as $lang) {
      $this->widgetSchema->setLabel($lang->getSlug(), $lang->getName());
    }

    $this->widgetSchema['module'] = new sfWidgetFormInputHidden();
    $this->widgetSchema['parent_id'] = new sfWidgetFormInputHidden();
    foreach ($langs as $lang) {
      $this->widgetSchema[$lang->getSlug()]['context'] = new sfWidgetFormTextareaTinyMCE(array('width' => 700, 'height' => 400));
    }
    if ($this->isNew()) {
      $this->setDefault('module', sfContext::getInstance()->getUser()->getAttribute('textModule'));
      $this->setDefault('parent_id', sfContext::getInstance()->getUser()->getAttribute('textParent'));
      $this->setDefault('hidden', false);
    }
  }

}
