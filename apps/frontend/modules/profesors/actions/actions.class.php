<?php

/**
 * profesors actions.
 *
 * @package    madebyrogal
 * @subpackage profesors
 * @author     Tomasz ROGALSKI rogalski.tomaszek@gmail.com
 * @version    SVN: $Id: actions.class.php 23810 2009-11-12 11:07:44Z Kris.Wallsmith $
 */
class profesorsActions extends sfActions {

    /**
     * Executes index action
     *
     * @param sfRequest $request A request object
     */
    public function executeIndex(sfWebRequest $request) {
        $page = pageTable::getPageByRouteHash('naprotech_doctor');
        $naproPages = pageTable::getSubPage($page);
        $this->redirect($this->generateUrl('staticPage', $naproPages->getFirst()), 301);
    }

}
