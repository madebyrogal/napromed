<?php

/**
 * Baseattribute_def
 * 
 * This class has been auto-generated by the Doctrine ORM Framework
 * 
 * @property string $module
 * @property integer $parent_id
 * @property string $name
 * @property string $description
 * @property integer $type_id
 * @property attribute_type $attribute_type
 * @property Doctrine_Collection $attribute_def_value
 * @property Doctrine_Collection $attribute_value
 * 
 * @method string              getModule()              Returns the current record's "module" value
 * @method integer             getParentId()            Returns the current record's "parent_id" value
 * @method string              getName()                Returns the current record's "name" value
 * @method string              getDescription()         Returns the current record's "description" value
 * @method integer             getTypeId()              Returns the current record's "type_id" value
 * @method attribute_type      getAttributeType()       Returns the current record's "attribute_type" value
 * @method Doctrine_Collection getAttributeDefValue()   Returns the current record's "attribute_def_value" collection
 * @method Doctrine_Collection getAttributeValue()      Returns the current record's "attribute_value" collection
 * @method attribute_def       setModule()              Sets the current record's "module" value
 * @method attribute_def       setParentId()            Sets the current record's "parent_id" value
 * @method attribute_def       setName()                Sets the current record's "name" value
 * @method attribute_def       setDescription()         Sets the current record's "description" value
 * @method attribute_def       setTypeId()              Sets the current record's "type_id" value
 * @method attribute_def       setAttributeType()       Sets the current record's "attribute_type" value
 * @method attribute_def       setAttributeDefValue()   Sets the current record's "attribute_def_value" collection
 * @method attribute_def       setAttributeValue()      Sets the current record's "attribute_value" collection
 * 
 * @package    madebyrogal
 * @subpackage model
 * @author     Tomasz ROGALSKI rogalski.tomaszek@gmail.com
 * @version    SVN: $Id: Builder.php 7490 2010-03-29 19:53:27Z jwage $
 */
abstract class Baseattribute_def extends sfDoctrineRecord
{
    public function setTableDefinition()
    {
        $this->setTableName('attribute_def');
        $this->hasColumn('module', 'string', 64, array(
             'type' => 'string',
             'notnull' => false,
             'length' => 64,
             ));
        $this->hasColumn('parent_id', 'integer', null, array(
             'type' => 'integer',
             'notnull' => false,
             ));
        $this->hasColumn('name', 'string', 128, array(
             'type' => 'string',
             'notnull' => true,
             'length' => 128,
             ));
        $this->hasColumn('description', 'string', 255, array(
             'type' => 'string',
             'notnull' => false,
             'length' => 255,
             ));
        $this->hasColumn('type_id', 'integer', null, array(
             'type' => 'integer',
             'notnull' => true,
             ));
    }

    public function setUp()
    {
        parent::setUp();
        $this->hasOne('attribute_type', array(
             'local' => 'type_id',
             'foreign' => 'id'));

        $this->hasMany('attribute_def_value', array(
             'local' => 'id',
             'foreign' => 'attribute_def_id'));

        $this->hasMany('attribute_value', array(
             'local' => 'id',
             'foreign' => 'attribute_def_id'));

        $i18n0 = new Doctrine_Template_I18n(array(
             'fields' => 
             array(
              0 => 'name',
              1 => 'description',
             ),
             ));
        $this->actAs($i18n0);
    }
}