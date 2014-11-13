<?php

/**
 * article_category form.
 *
 * @package    tnt
 * @subpackage form
 * @author     Tomasz ROGALSKI rogalski.tomaszek@gmail.com
 * @version    SVN: $Id: sfDoctrineFormTemplate.php 23810 2009-11-12 11:07:44Z Kris.Wallsmith $
 */
class article_categoryForm extends Basearticle_categoryForm {

    public function configure() {
        $langs = langTable::getAllVisibleLang();
        $aLangs = langTable::getAllVisibleLangToArray();
        $this->embedI18n($aLangs);
        foreach ($langs as $lang) {
            $this->widgetSchema->setLabel($lang->getSlug(), $lang->getName());
            $this->widgetSchema[$lang->getSlug()]['name']->setLabel('Nazwa');
        }

        if ($this->isNew()) {
            $this->setDefault('hidden', false);
        }
    }

}
