<?php

/**
 * przeliczniki actions.
 *
 * @package    tnt
 * @subpackage przeliczniki
 * @author     Tomasz ROGALSKI rogalski.tomaszek@gmail.com
 * @version    SVN: $Id: actions.class.php 23810 2009-11-12 11:07:44Z Kris.Wallsmith $
 */
class przelicznikiActions extends sfActions {

    /**
     * Executes index action
     *
     * @param sfRequest $request A request object
     */
    public function executeHormon(sfWebRequest $request) {
        $this->page = pageTable::getPageByRouteHash('conversions_hormons');

        $this->pageContext = textTable::getPageContext($this->page->getId());

        $this->setLayout($this->page->getLayout());
        $this->setTemplate($this->page->getTemplate());
        $this->setMeta($this->page);
    }

    public function executeHormonComplex(sfWebRequest $request) {
        $this->page = pageTable::getPageByRouteHash('conversions_hormons_complex');

        $this->pageContext = textTable::getPageContext($this->page->getId());

        $this->setLayout($this->page->getLayout());
        $this->setTemplate($this->page->getTemplate());
        $this->setMeta($this->page);
    }
    
    public function executeAntropometria(sfWebRequest $request) {
        $this->page = pageTable::getPageByRouteHash('conversions_antropometria');

        $this->pageContext = textTable::getPageContext($this->page->getId());

        $this->setLayout($this->page->getLayout());
        $this->setTemplate($this->page->getTemplate());
        $this->setMeta($this->page);
    }
}
