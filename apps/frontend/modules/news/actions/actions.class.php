<?php

/**
 * news actions.
 *
 * @package    madebyrogal
 * @subpackage news
 * @author     Tomasz ROGALSKI rogalski.tomaszek@gmail.com
 * @version    SVN: $Id: actions.class.php 23810 2009-11-12 11:07:44Z Kris.Wallsmith $
 */
class newsActions extends sfActions
{

    /**
     * Executes index action
     *
     * @param sfRequest $request A request object
     */
    public function executeIndex(sfWebRequest $request)
    {
        $this->page = pageTable::getPageByRouteHash('news');
        $this->pageContext = textTable::getPageContext($this->page->getId());
        $this->setLayout($this->page->getLayout());
        $this->setTemplate($this->page->getTemplate());
        $this->setMeta($this->page);
    }

    public function executeArticles()
    {
        //Get texts and layout setup
        $this->page = pageTable::getPageByRouteHash('article');
        $this->pageContext = textTable::getPageContext($this->page->getId());
        $this->setLayout($this->page->getLayout());
        $this->setTemplate($this->page->getTemplate());
        $this->setMeta($this->page);
        //Get articles
        $this->articles = articleTable::getAll();
    }
    
    public function executeShow(sfWebRequest $request)
    {
        $this->article = $this->getRoute()->getObject();
        $this->gallery = mediaTable::getGallery('article', $this->article->getId());
    }

}
