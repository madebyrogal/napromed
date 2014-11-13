<?php

/**
 * Basemedia_size
 * 
 * This class has been auto-generated by the Doctrine ORM Framework
 * 
 * @property integer $module_cms_id
 * @property string $min1
 * @property string $min2
 * @property string $min3
 * @property module_cms $module_cms
 * 
 * @method integer    getModuleCmsId()   Returns the current record's "module_cms_id" value
 * @method string     getMin1()          Returns the current record's "min1" value
 * @method string     getMin2()          Returns the current record's "min2" value
 * @method string     getMin3()          Returns the current record's "min3" value
 * @method module_cms getModuleCms()     Returns the current record's "module_cms" value
 * @method media_size setModuleCmsId()   Sets the current record's "module_cms_id" value
 * @method media_size setMin1()          Sets the current record's "min1" value
 * @method media_size setMin2()          Sets the current record's "min2" value
 * @method media_size setMin3()          Sets the current record's "min3" value
 * @method media_size setModuleCms()     Sets the current record's "module_cms" value
 * 
 * @package    tnt
 * @subpackage model
 * @author     Tomasz ROGALSKI rogalski.tomaszek@gmail.com
 * @version    SVN: $Id: Builder.php 7490 2010-03-29 19:53:27Z jwage $
 */
abstract class Basemedia_size extends sfDoctrineRecord
{
    public function setTableDefinition()
    {
        $this->setTableName('media_size');
        $this->hasColumn('module_cms_id', 'integer', null, array(
             'type' => 'integer',
             'notnull' => true,
             ));
        $this->hasColumn('min1', 'string', 10, array(
             'type' => 'string',
             'notnull' => false,
             'length' => 10,
             ));
        $this->hasColumn('min2', 'string', 10, array(
             'type' => 'string',
             'notnull' => false,
             'length' => 10,
             ));
        $this->hasColumn('min3', 'string', 10, array(
             'type' => 'string',
             'notnull' => false,
             'length' => 10,
             ));
    }

    public function setUp()
    {
        parent::setUp();
        $this->hasOne('module_cms', array(
             'local' => 'module_cms_id',
             'foreign' => 'id'));
    }
}