<?php

/**
 * dictionary form.
 *
 * @package    madebyrogal
 * @subpackage form
 * @author     Tomasz ROGALSKI rogalski.tomaszek@gmail.com
 * @version    SVN: $Id: sfDoctrineFormTemplate.php 23810 2009-11-12 11:07:44Z Kris.Wallsmith $
 */
class dictionaryForm extends BasedictionaryForm {

    public function configure() {
        $langs = langTable::getAllVisibleLang();
        $aLangs = langTable::getAllVisibleLangToArray();
        $this->embedI18n($aLangs);
        foreach ($langs as $lang) {
            $this->widgetSchema->setLabel($lang->getSlug(), $lang->getName());
            $this->widgetSchema[$lang->getSlug()]['body'] = new sfWidgetFormTextareaTinyMCE(array('width' => 700, 'height' => 400, 'theme' => 'advanced'));
        }
        if ($this->isNew()) {
            $this->setDefault('hidden', false);
        }
    }

}
