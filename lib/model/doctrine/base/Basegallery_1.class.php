<?php

/**
 * Basegallery_1
 * 
 * This class has been auto-generated by the Doctrine ORM Framework
 * 
 * @property string $name
 * @property boolean $hidden
 * 
 * @method string    getName()   Returns the current record's "name" value
 * @method boolean   getHidden() Returns the current record's "hidden" value
 * @method gallery_1 setName()   Sets the current record's "name" value
 * @method gallery_1 setHidden() Sets the current record's "hidden" value
 * 
 * @package    madebyrogal
 * @subpackage model
 * @author     Tomasz ROGALSKI rogalski.tomaszek@gmail.com
 * @version    SVN: $Id: Builder.php 7490 2010-03-29 19:53:27Z jwage $
 */
abstract class Basegallery_1 extends sfDoctrineRecord
{
    public function setTableDefinition()
    {
        $this->setTableName('gallery_1');
        $this->hasColumn('name', 'string', 255, array(
             'type' => 'string',
             'notnull' => false,
             'length' => 255,
             ));
        $this->hasColumn('hidden', 'boolean', null, array(
             'type' => 'boolean',
             'default' => 0,
             ));
    }

    public function setUp()
    {
        parent::setUp();
        
    }
}