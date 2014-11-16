<?php

/**
 * Basenews
 * 
 * This class has been auto-generated by the Doctrine ORM Framework
 * 
 * @property string $title
 * @property date $date_from
 * @property string $sneak_peak
 * @property string $body
 * @property boolean $hidden
 * 
 * @method string  getTitle()      Returns the current record's "title" value
 * @method date    getDateFrom()   Returns the current record's "date_from" value
 * @method string  getSneakPeak()  Returns the current record's "sneak_peak" value
 * @method string  getBody()       Returns the current record's "body" value
 * @method boolean getHidden()     Returns the current record's "hidden" value
 * @method news    setTitle()      Sets the current record's "title" value
 * @method news    setDateFrom()   Sets the current record's "date_from" value
 * @method news    setSneakPeak()  Sets the current record's "sneak_peak" value
 * @method news    setBody()       Sets the current record's "body" value
 * @method news    setHidden()     Sets the current record's "hidden" value
 * 
 * @package    madebyrogal
 * @subpackage model
 * @author     Tomasz ROGALSKI rogalski.tomaszek@gmail.com
 * @version    SVN: $Id: Builder.php 7490 2010-03-29 19:53:27Z jwage $
 */
abstract class Basenews extends sfDoctrineRecord
{
    public function setTableDefinition()
    {
        $this->setTableName('news');
        $this->hasColumn('title', 'string', 255, array(
             'type' => 'string',
             'notnull' => true,
             'length' => 255,
             ));
        $this->hasColumn('date_from', 'date', null, array(
             'type' => 'date',
             'notnull' => true,
             ));
        $this->hasColumn('sneak_peak', 'string', null, array(
             'type' => 'string',
             'notnull' => false,
             ));
        $this->hasColumn('body', 'string', null, array(
             'type' => 'string',
             'notnull' => false,
             ));
        $this->hasColumn('hidden', 'boolean', null, array(
             'type' => 'boolean',
             'default' => 0,
             ));
    }

    public function setUp()
    {
        parent::setUp();
        $timestampable0 = new Doctrine_Template_Timestampable();
        $i18n0 = new Doctrine_Template_I18n(array(
             'fields' => 
             array(
              0 => 'title',
              1 => 'sneak_peak',
              2 => 'body',
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
        $this->actAs($timestampable0);
        $this->actAs($i18n0);
    }
}