<?php

/**
 * download form.
 *
 * @package    madebyrogal
 * @subpackage form
 * @author     Tomasz ROGALSKI rogalski.tomaszek@gmail.com
 * @version    SVN: $Id: sfDoctrineFormTemplate.php 23810 2009-11-12 11:07:44Z Kris.Wallsmith $
 */
class downloadForm extends BasedownloadForm {

    public function configure() {
        $langs = langTable::getAllVisibleLang();
        $aLangs = langTable::getAllVisibleLangToArray();
        $this->embedI18n($aLangs);
        unset($this['created_at'], $this['updated_at']);
        
        foreach ($langs as $lang) {
            $this->widgetSchema->setLabel($lang->getSlug(), $lang->getName());
        }
        $this->widgetSchema['file'] = new sfWidgetFormPopUpFileBrowser( array('id'=>'file1', 'folder'=>'/userupload/files') );
        if ($this->isNew()) {
            $this->setDefault('hidden', false);
        }
    }

}
