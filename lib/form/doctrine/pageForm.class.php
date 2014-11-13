<?php

/**
 * page form.
 *
 * @package    tnt
 * @subpackage form
 * @author     Tomasz ROGALSKI tomasz.rogalski@huevo.pl
 * @version    SVN: $Id: sfDoctrineFormTemplate.php 23810 2009-11-12 11:07:44Z Kris.Wallsmith $
 */
class pageForm extends BasepageForm {

  public function configure() {
    $langs = langTable::getAllVisibleLang();
    $aLangs = langTable::getAllVisibleLangToArray();
    $this->embedI18n($aLangs);
    foreach ($langs as $lang) {
      $this->widgetSchema->setLabel($lang->getSlug(), $lang->getName());
    }


    $this->widgetSchema['position'] = new sfWidgetFormInputHidden();

    if ($this->isNew()) {
      $this->setDefault('hidden', false);
      $this->setDefault('not_in_menu', false);
    }
    else {
      if (!sfContext::getInstance()->getUser()->hasCredential('admin')) {
        foreach ($langs as $lang) {
          $this->widgetSchema[$lang->getSlug()]['template'] = new sfWidgetFormInputHidden();
        }
        $this->widgetSchema['layout'] = new sfWidgetFormInputHidden();
        $this->widgetSchema['route_name'] = new sfWidgetFormInputHidden();
        $this->widgetSchema['route_hash'] = new sfWidgetFormInputHidden();
        $this->widgetSchema['parent_id'] = new sfWidgetFormInputHidden();
        $this->widgetSchema['hidden'] = new sfWidgetFormInputHidden();
        $this->widgetSchema['not_in_menu'] = new sfWidgetFormInputHidden();
        $this->widgetSchema['absolute_link'] = new sfWidgetFormInputHidden();
      }
    }
  }

}
