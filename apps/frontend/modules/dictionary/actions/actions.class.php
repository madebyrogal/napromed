<?php

/**
 * dictionary actions.
 *
 * @package    madebyrogal
 * @subpackage dictionary
 * @author     Tomasz ROGALSKI rogalski.tomaszek@gmail.com
 * @version    SVN: $Id: actions.class.php 23810 2009-11-12 11:07:44Z Kris.Wallsmith $
 */
class dictionaryActions extends sfActions {

    /**
     * Executes index action
     *
     * @param sfRequest $request A request object
     */
    public function executeIndex(sfWebRequest $request) {
        $this->page = pageTable::getPageByRouteHash('dictionary');

        $this->pageContext = textTable::getPageContext($this->page->getId());
        $this->dictionary = dictionaryTable::getAll();

        $this->setLayout($this->page->getLayout());
        $this->setTemplate($this->page->getTemplate());
        $this->setMeta($this->page);
    }

}
