<?php

/**
 * download actions.
 *
 * @package    madebyrogal
 * @subpackage download
 * @author     Tomasz ROGALSKI rogalski.tomaszek@gmail.com
 * @version    SVN: $Id: actions.class.php 23810 2009-11-12 11:07:44Z Kris.Wallsmith $
 */
class downloadActions extends sfActions {

    /**
     * Executes index action
     *
     * @param sfRequest $request A request object
     */
    public function executeIndex(sfWebRequest $request) {
        $this->page = pageTable::getPageByRouteHash('download');

        $this->pageContext = textTable::getPageContext($this->page->getId());
        $files = downloadTable::getAll();
        $filesArray = array();
        //var_dump(sfConfig::getAll());die;
        foreach($files as $k => $file){
            $filesArray[$k]['title'] = $file->getTitle();
            $filesArray[$k]['file'] = $file->getFile();
            $ext = pathinfo($file->getFile());
            $filesArray[$k]['extension'] = $ext['extension'];
            $filesArray[$k]['size'] = round(filesize(sfConfig::get('sf_web_dir') . $file->getFile())/(1024*1024), 2);
        }

        $this->files = $filesArray;
        $this->setLayout($this->page->getLayout());
        $this->setTemplate($this->page->getTemplate());
        $this->setMeta($this->page);
    }

}
