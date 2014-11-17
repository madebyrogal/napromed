<?php

/**
 * Basepage
 * 
 * This class has been auto-generated by the Doctrine ORM Framework
 * 
 * @property string $title
 * @property string $subtitle
 * @property string $meta_title
 * @property string $meta_keywords
 * @property string $meta_description
 * @property string $template
 * @property string $layout
 * @property string $route_name
 * @property string $route_hash
 * @property integer $parent_id
 * @property boolean $hidden
 * @property boolean $not_in_menu
 * @property string $absolute_link
 * @property page $parent
 * @property Doctrine_Collection $page
 * 
 * @method string              getTitle()            Returns the current record's "title" value
 * @method string              getSubtitle()         Returns the current record's "subtitle" value
 * @method string              getMetaTitle()        Returns the current record's "meta_title" value
 * @method string              getMetaKeywords()     Returns the current record's "meta_keywords" value
 * @method string              getMetaDescription()  Returns the current record's "meta_description" value
 * @method string              getTemplate()         Returns the current record's "template" value
 * @method string              getLayout()           Returns the current record's "layout" value
 * @method string              getRouteName()        Returns the current record's "route_name" value
 * @method string              getRouteHash()        Returns the current record's "route_hash" value
 * @method integer             getParentId()         Returns the current record's "parent_id" value
 * @method boolean             getHidden()           Returns the current record's "hidden" value
 * @method boolean             getNotInMenu()        Returns the current record's "not_in_menu" value
 * @method string              getAbsoluteLink()     Returns the current record's "absolute_link" value
 * @method page                getParent()           Returns the current record's "parent" value
 * @method Doctrine_Collection getPage()             Returns the current record's "page" collection
 * @method page                setTitle()            Sets the current record's "title" value
 * @method page                setSubtitle()         Sets the current record's "subtitle" value
 * @method page                setMetaTitle()        Sets the current record's "meta_title" value
 * @method page                setMetaKeywords()     Sets the current record's "meta_keywords" value
 * @method page                setMetaDescription()  Sets the current record's "meta_description" value
 * @method page                setTemplate()         Sets the current record's "template" value
 * @method page                setLayout()           Sets the current record's "layout" value
 * @method page                setRouteName()        Sets the current record's "route_name" value
 * @method page                setRouteHash()        Sets the current record's "route_hash" value
 * @method page                setParentId()         Sets the current record's "parent_id" value
 * @method page                setHidden()           Sets the current record's "hidden" value
 * @method page                setNotInMenu()        Sets the current record's "not_in_menu" value
 * @method page                setAbsoluteLink()     Sets the current record's "absolute_link" value
 * @method page                setParent()           Sets the current record's "parent" value
 * @method page                setPage()             Sets the current record's "page" collection
 * 
 * @package    madebyrogal
 * @subpackage model
 * @author     Tomasz ROGALSKI rogalski.tomaszek@gmail.com
 * @version    SVN: $Id: Builder.php 7490 2010-03-29 19:53:27Z jwage $
 */
abstract class Basepage extends sfDoctrineRecord
{
    public function setTableDefinition()
    {
        $this->setTableName('page');
        $this->hasColumn('title', 'string', 128, array(
             'type' => 'string',
             'notnull' => true,
             'length' => 128,
             ));
        $this->hasColumn('subtitle', 'string', 128, array(
             'type' => 'string',
             'notnull' => false,
             'length' => 128,
             ));
        $this->hasColumn('meta_title', 'string', null, array(
             'type' => 'string',
             'notnull' => false,
             ));
        $this->hasColumn('meta_keywords', 'string', null, array(
             'type' => 'string',
             'notnull' => false,
             ));
        $this->hasColumn('meta_description', 'string', null, array(
             'type' => 'string',
             'notnull' => false,
             ));
        $this->hasColumn('template', 'string', 64, array(
             'type' => 'string',
             'notnull' => true,
             'length' => 64,
             ));
        $this->hasColumn('layout', 'string', 64, array(
             'type' => 'string',
             'notnull' => true,
             'length' => 64,
             ));
        $this->hasColumn('route_name', 'string', 64, array(
             'type' => 'string',
             'notnull' => true,
             'length' => 64,
             ));
        $this->hasColumn('route_hash', 'string', 64, array(
             'type' => 'string',
             'notnull' => true,
             'unique' => true,
             'length' => 64,
             ));
        $this->hasColumn('parent_id', 'integer', null, array(
             'type' => 'integer',
             'notnull' => false,
             ));
        $this->hasColumn('hidden', 'boolean', null, array(
             'type' => 'boolean',
             'default' => 0,
             ));
        $this->hasColumn('not_in_menu', 'boolean', null, array(
             'type' => 'boolean',
             'default' => 0,
             ));
        $this->hasColumn('absolute_link', 'string', 255, array(
             'type' => 'string',
             'notnull' => false,
             'length' => 255,
             ));
    }

    public function setUp()
    {
        parent::setUp();
        $this->hasOne('page as parent', array(
             'local' => 'parent_id',
             'foreign' => 'id'));

        $this->hasMany('page', array(
             'local' => 'id',
             'foreign' => 'parent_id'));

        $sortable0 = new Doctrine_Template_Sortable(array(
             'uniqueBy' => 
             array(
              0 => 'parent_id',
             ),
             ));
        $i18n0 = new Doctrine_Template_I18n(array(
             'fields' => 
             array(
              0 => 'title',
              1 => 'subtitle',
              2 => 'meta_title',
              3 => 'meta_keywords',
              4 => 'meta_description',
              5 => 'template',
             ),
             ));
        $sluggable1 = new Doctrine_Template_Sluggable(array(
             'fields' => 
             array(
              0 => 'title',
             ),
             'uniqueBy' => 
             array(
              0 => 'lang',
              1 => 'title',
             ),
             ));
        $i18n0->addChild($sluggable1);
        $this->actAs($sortable0);
        $this->actAs($i18n0);
    }
}