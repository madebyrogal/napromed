<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of components
 *
 * @author Rogal
 */
class pageComponents extends sfComponents {

    public function executeShowMenuHeader(sfWebRequest $request) {        
        $pages = pageTable::getMenuHeader();
        $menu = array();
        foreach ($pages as $key => $page) {
            $menu[$key]['page'] = $page;
            $subPage = pageTable::getSubPage($page);
            if ($subPage->count()) {
                $menu[$key]['subpage'] = $subPage;
            }
        }
        $this->menu = $menu;
        switch ($request->getParameter('module')) {
            case 'main':
                $page = pageTable::getFirstPage();
                $this->activePageId = $page->getId();
                break;
            case 'contact':
                $page = pageTable::getPageByRouteHash('contact');
                $this->activePageId = $page->getId();
                break;
            case 'offer':
                $page = pageTable::getPageByRouteHash('offer');
                $this->activePageId = $page->getId();
                break;
            case 'article':
                $page = pageTable::getPageByRouteHash('article');
                $this->activePageId = $page->getId();
                break;
            case 'faq':
                $page = pageTable::getPageByRouteHash('faq');
                $this->activePageId = $page->getId();
                break;
            case 'dictionary':
                $page = pageTable::getPageByRouteHash('napotech');
                $this->activePageId = $page->getId();
                break;
            default:
                $page = pageTable::getInstance()->findOneBy('id', $request->getParameter('id'));
                if($page && $page->getParentId() > 1){
                    $this->activePageId = $page->getParentId();
                }
                else{
                    $this->activePageId = $request->getParameter('id');
                }
                break;
        }
    }

    public function executeSubpage(sfWebRequest $request) {
        $this->subPage = pageTable::getSubPage($this->page);
    }

    public function executeGetUrl(sfWebRequest $request) {
        $this->page = pageTable::getPageByRouteHash($this->routeHash);
    }

    public function executeShowContactDetals() {
        $this->mailData = mail_dataTable::getMailData('kontakt');
    }

    public function executeNewsOnHome() {
        $this->news = newsTable::getLastNews();
        $this->page = pageTable::getPageByRouteHash('news');
    }

    public function executeMenuOnFooter() {
        $this->menu = pageTable::getMenuHeader();
    }

}

?>
