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
  
  protected function buildQuery()
  {
    $tableMethod = $this->configuration->getTableMethod();
    $query = Doctrine_Core::getTable('page')
      ->createQuery('a');

    if ($tableMethod)
    {
      $query = Doctrine_Core::getTable('page')->$tableMethod($query);
    }

    $this->addSortQuery($query);
    $query->orderBy('position ASC, parent_id ASC');
    
    $event = $this->dispatcher->filter(new sfEvent($this, 'admin.build_query'), $query);
    $query = $event->getReturnValue();

    return $query;
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
