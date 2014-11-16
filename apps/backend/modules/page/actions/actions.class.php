<?php

require_once dirname(__FILE__) . '/../lib/pageGeneratorConfiguration.class.php';
require_once dirname(__FILE__) . '/../lib/pageGeneratorHelper.class.php';

/**
 * page actions.
 *
 * @package    tnt
 * @subpackage page
 * @author     Tomasz ROGALSKI rogalski.tomaszek@gmail.com
 * @version    SVN: $Id: actions.class.php 23810 2009-11-12 11:07:44Z Kris.Wallsmith $
 */
class pageActions extends autoPageActions {
  
  public function executeIndex(sfWebRequest $request)
  {
      $pages = array();
      $pagesMain = pageTable::getMainPage();
      foreach($pagesMain as $key => $pageMain){
          $pages[$key]['page'] = $pageMain;
          $pages[$key]['subpage'] = pageTable::getSubPage($pageMain);
      }
      $this->pages = $pages;
  }
  
  public function executePromote() {
    $object = Doctrine::getTable('page')->findOneById($this->getRequestParameter('id'));
    $object->promote();
    $this->redirect("@page");
  }

  public function executeDemote() {
    $object = Doctrine::getTable('page')->findOneById($this->getRequestParameter('id'));
    $object->demote();
    $this->redirect("@page");
  }

}
