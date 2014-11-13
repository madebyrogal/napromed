<?php

/**
 * module_group_permissionTable
 * 
 * This class has been auto-generated by the Doctrine ORM Framework
 */
class module_group_permissionTable extends Doctrine_Table {

  /**
   * Returns an instance of this class.
   *
   * @return object module_group_permissionTable
   */
  public static function getInstance() {
    return Doctrine_Core::getTable('module_group_permission');
  }

  public static function getModuleGroupPermission($moduleGroupId) {
    $result = Doctrine_Query::create()
            ->from('module_group_permission mgp')
            ->leftJoin('mgp.permission p')
            ->where('mgp.module_group_id = ?', $moduleGroupId)
            ->execute();
    if ($result->count()) {
      return $result;
    } else {
      return false;
    }
  }

}