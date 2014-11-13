<?php

/**
 * media form.
 *
 * @package    tnt
 * @subpackage form
 * @author     Tomasz ROGALSKI rogalski.tomaszek@gmail.com
 * @version    SVN: $Id: sfDoctrineFormTemplate.php 23810 2009-11-12 11:07:44Z Kris.Wallsmith $
 */
class mediaForm extends BasemediaForm {

    public function configure() {
        $langs = langTable::getAllVisibleLang();
        $aLangs = langTable::getAllVisibleLangToArray();
        $this->embedI18n($aLangs);
        foreach ($langs as $lang) {
            $this->widgetSchema->setLabel($lang->getSlug(), $lang->getName());
        }

        $this->widgetSchema['module'] = new sfWidgetFormInputHidden();
        $this->widgetSchema['parent_id'] = new sfWidgetFormInputHidden();
        $this->widgetSchema['file'] = new sfWidgetFormPopUpImageBrowser(array('id' => 'file'));
        $this->widgetSchema['position'] = new sfWidgetFormInputHidden();

        $module = sfContext::getInstance()->getUser()->getAttribute('mediaModule');
        if (!empty($module)) {
            switch ($module) {
                case 'product':
                    $this->widgetSchema['file_min1'] = new sfWidgetFormPopUpImageBrowser(array('id' => 'file_min1'));
                    $this->widgetSchema['file_min2'] = new sfWidgetFormPopUpImageBrowser(array('id' => 'file_min2'));
                    $this->widgetSchema['file_min3'] = new sfWidgetFormPopUpImageBrowser(array('id' => 'file_min3'));
                    foreach ($langs as $lang) {
                        $this->widgetSchema[$lang->getSlug()]['link'] = new sfWidgetFormInputHidden();
                    }
                    break;
                case 'product_card':
                    $this->widgetSchema['file_min1'] = new sfWidgetFormInputHidden();
                    $this->widgetSchema['file_min2'] = new sfWidgetFormInputHidden();
                    $this->widgetSchema['file_min3'] = new sfWidgetFormInputHidden();
                    foreach ($langs as $lang) {
                        $this->widgetSchema[$lang->getSlug()]['link'] = new sfWidgetFormInputHidden();
                    }
                    break;
                case 'carousel_home':
                    $this->widgetSchema['file_min1'] = new sfWidgetFormInputHidden();
                    $this->widgetSchema['file_min2'] = new sfWidgetFormInputHidden();
                    $this->widgetSchema['file_min3'] = new sfWidgetFormInputHidden();
                    foreach ($langs as $lang) {
                        $this->widgetSchema[$lang->getSlug()]['link'] = new sfWidgetFormInput();
                        $this->widgetSchema[$lang->getSlug()]['alternative'] = new sfWidgetFormTextareaTinyMCE(array('width' => 700, 'height' => 400));
                    }
                    break;
                case 'gallery_1':
                    $this->widgetSchema['file_min1'] = new sfWidgetFormPopUpImageBrowser(array('id' => 'file_min1'));
                    $this->widgetSchema['file_min2'] = new sfWidgetFormInputHidden();
                    $this->widgetSchema['file_min3'] = new sfWidgetFormInputHidden();
                    foreach ($langs as $lang) {
                        $this->widgetSchema[$lang->getSlug()]['link'] = new sfWidgetFormInput();
                    }
                    break;
                case 'article':
                    $this->widgetSchema['file_min1'] = new sfWidgetFormPopUpImageBrowser(array('id' => 'file_min1'));
                    $this->widgetSchema['file_min2'] = new sfWidgetFormInputHidden();
                    $this->widgetSchema['file_min3'] = new sfWidgetFormInputHidden();
                    foreach ($langs as $lang) {
                        $this->widgetSchema[$lang->getSlug()]['link'] = new sfWidgetFormInput();
                    }
                    break;
                default:
                    $this->widgetSchema['file_min1'] = new sfWidgetFormInputHidden();
                    $this->widgetSchema['file_min2'] = new sfWidgetFormInputHidden();
                    $this->widgetSchema['file_min3'] = new sfWidgetFormInputHidden();
                    foreach ($langs as $lang) {
                        $this->widgetSchema[$lang->getSlug()]['link'] = new sfWidgetFormInput();
                        $this->widgetSchema[$lang->getSlug()]['alternative'] = new sfWidgetFormInput();
                    }
                    break;
            }
        } else {
            $this->widgetSchema['file_min1'] = new sfWidgetFormPopUpImageBrowser(array('id' => 'file_min1'));
            $this->widgetSchema['file_min2'] = new sfWidgetFormPopUpImageBrowser(array('id' => 'file_min2'));
            $this->widgetSchema['file_min3'] = new sfWidgetFormPopUpImageBrowser(array('id' => 'file_min3'));
            foreach ($langs as $lang) {
                $this->widgetSchema[$lang->getSlug()]['link'] = new sfWidgetFormInputHidden();
            }
        }

        if ($this->isNew()) {
            $this->setDefault('module', sfContext::getInstance()->getUser()->getAttribute('mediaModule'));
            $this->setDefault('parent_id', sfContext::getInstance()->getUser()->getAttribute('mediaParent'));
            $this->setDefault('main', false);
        }
    }

    public function setValue($name, $value) {
        $this->values[$name] = $value;
    }

}
