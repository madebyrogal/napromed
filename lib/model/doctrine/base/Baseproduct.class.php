<?php

/**
 * Baseproduct
 * 
 * This class has been auto-generated by the Doctrine ORM Framework
 * 
 * @property integer $category_id
 * @property string $name
 * @property string $info
 * @property float $price
 * @property boolean $promotion
 * @property boolean $hidden
 * @property product_categories $category
 * @property Doctrine_Collection $attribute_value
 * 
 * @method integer             getCategoryId()      Returns the current record's "category_id" value
 * @method string              getName()            Returns the current record's "name" value
 * @method string              getInfo()            Returns the current record's "info" value
 * @method float               getPrice()           Returns the current record's "price" value
 * @method boolean             getPromotion()       Returns the current record's "promotion" value
 * @method boolean             getHidden()          Returns the current record's "hidden" value
 * @method product_categories  getCategory()        Returns the current record's "category" value
 * @method Doctrine_Collection getAttributeValue()  Returns the current record's "attribute_value" collection
 * @method product             setCategoryId()      Sets the current record's "category_id" value
 * @method product             setName()            Sets the current record's "name" value
 * @method product             setInfo()            Sets the current record's "info" value
 * @method product             setPrice()           Sets the current record's "price" value
 * @method product             setPromotion()       Sets the current record's "promotion" value
 * @method product             setHidden()          Sets the current record's "hidden" value
 * @method product             setCategory()        Sets the current record's "category" value
 * @method product             setAttributeValue()  Sets the current record's "attribute_value" collection
 * 
 * @package    tnt
 * @subpackage model
 * @author     Tomasz ROGALSKI rogalski.tomaszek@gmail.com
 * @version    SVN: $Id: Builder.php 7490 2010-03-29 19:53:27Z jwage $
 */
abstract class Baseproduct extends sfDoctrineRecord
{
    public function setTableDefinition()
    {
        $this->setTableName('product');
        $this->hasColumn('category_id', 'integer', null, array(
             'type' => 'integer',
             'notnull' => true,
             ));
        $this->hasColumn('name', 'string', 255, array(
             'type' => 'string',
             'notnull' => true,
             'length' => 255,
             ));
        $this->hasColumn('info', 'string', null, array(
             'type' => 'string',
             'notnull' => false,
             ));
        $this->hasColumn('price', 'float', null, array(
             'type' => 'float',
             'notnull' => false,
             ));
        $this->hasColumn('promotion', 'boolean', null, array(
             'type' => 'boolean',
             'default' => 0,
             ));
        $this->hasColumn('hidden', 'boolean', null, array(
             'type' => 'boolean',
             'default' => 0,
             ));
    }

    public function setUp()
    {
        parent::setUp();
        $this->hasOne('product_categories as category', array(
             'local' => 'category_id',
             'foreign' => 'id',
             'onDelete' => 'CASCADE'));

        $this->hasMany('attribute_value', array(
             'local' => 'id',
             'foreign' => 'product_id'));

        $sortable0 = new Doctrine_Template_Sortable(array(
             'uniqueBy' => 
             array(
              0 => 'category_id',
             ),
             ));
        $i18n0 = new Doctrine_Template_I18n(array(
             'fields' => 
             array(
              0 => 'name',
              1 => 'info',
              2 => 'price',
             ),
             ));
        $sluggable1 = new Doctrine_Template_Sluggable(array(
             'fields' => 
             array(
              0 => 'name',
             ),
             'uniqueBy' => 
             array(
              0 => 'lang',
              1 => 'name',
             ),
             ));
        $i18n0->addChild($sluggable1);
        $this->actAs($sortable0);
        $this->actAs($i18n0);
    }
}