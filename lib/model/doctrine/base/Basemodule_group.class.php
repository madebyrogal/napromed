<?php

/**
 * Basemodule_group
 * 
 * This class has been auto-generated by the Doctrine ORM Framework
 * 
 * @property string $name
 * @property boolean $hidden
 * @property Doctrine_Collection $permission
 * @property Doctrine_Collection $module_cms
 * @property Doctrine_Collection $module_group_permission
 * 
 * @method string              getName()                    Returns the current record's "name" value
 * @method boolean             getHidden()                  Returns the current record's "hidden" value
 * @method Doctrine_Collection getPermission()              Returns the current record's "permission" collection
 * @method Doctrine_Collection getModuleCms()               Returns the current record's "module_cms" collection
 * @method Doctrine_Collection getModuleGroupPermission()   Returns the current record's "module_group_permission" collection
 * @method module_group        setName()                    Sets the current record's "name" value
 * @method module_group        setHidden()                  Sets the current record's "hidden" value
 * @method module_group        setPermission()              Sets the current record's "permission" collection
 * @method module_group        setModuleCms()               Sets the current record's "module_cms" collection
 * @method module_group        setModuleGroupPermission()   Sets the current record's "module_group_permission" collection
 * 
 * @package    madebyrogal
 * @subpackage model
 * @author     Tomasz ROGALSKI rogalski.tomaszek@gmail.com
 * @version    SVN: $Id: Builder.php 7490 2010-03-29 19:53:27Z jwage $
 */
abstract class Basemodule_group extends sfDoctrineRecord
{
    public function setTableDefinition()
    {
        $this->setTableName('module_group');
        $this->hasColumn('name', 'string', 128, array(
             'type' => 'string',
             'notnull' => true,
             'length' => 128,
             ));
        $this->hasColumn('hidden', 'boolean', null, array(
             'type' => 'boolean',
             'default' => 0,
             ));
    }

    public function setUp()
    {
        parent::setUp();
        $this->hasMany('sfGuardPermission as permission', array(
             'refClass' => 'module_group_permission',
             'local' => 'module_group_id',
             'foreign' => 'permission_id',
             'onDelete' => 'CASCADE'));

        $this->hasMany('module_cms', array(
             'local' => 'id',
             'foreign' => 'module_group_id'));

        $this->hasMany('module_group_permission', array(
             'local' => 'id',
             'foreign' => 'module_group_id'));

        $sortable0 = new Doctrine_Template_Sortable(array(
             ));
        $this->actAs($sortable0);
    }
}