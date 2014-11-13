<?php

/**
 * article form.
 *
 * @package    tnt
 * @subpackage form
 * @author     Tomasz ROGALSKI rogalski.tomaszek@gmail.com
 * @version    SVN: $Id: sfDoctrineFormTemplate.php 23810 2009-11-12 11:07:44Z Kris.Wallsmith $
 */
class articleForm extends BasearticleForm {

    public function configure() {
        unset($this['created_at'], $this['updated_at']);

        $langs = langTable::getAllVisibleLang();
        $aLangs = langTable::getAllVisibleLangToArray();
        $this->embedI18n($aLangs);
        foreach ($langs as $lang) {
            $this->widgetSchema->setLabel($lang->getSlug(), $lang->getName());
            $this->widgetSchema[$lang->getSlug()]['title']->setLabel('Tytuł');
            $this->widgetSchema[$lang->getSlug()]['sneak_peak']->setLabel('Zajawka');
            $this->widgetSchema[$lang->getSlug()]['body']->setLabel('Treść');
            $this->widgetSchema[$lang->getSlug()]['body'] = new sfWidgetFormTextareaTinyMCE(array('width' => 700, 'height' => 400));
        }

        $this->widgetSchema['date_from'] = new sfWidgetFormDate(array('format' => '%day%/%month%/%year%'));
        if ($this->isNew()) {
            $this->setDefault('hidden', false);
        }
    }

}
