<?php

/**
 * Basecontact_form_2
 * 
 * This class has been auto-generated by the Doctrine ORM Framework
 * 
 * @property string $name
 * @property string $firm
 * @property string $phone
 * @property string $email
 * @property boolean $type
 * @property string $message
 * 
 * @method string         getName()    Returns the current record's "name" value
 * @method string         getFirm()    Returns the current record's "firm" value
 * @method string         getPhone()   Returns the current record's "phone" value
 * @method string         getEmail()   Returns the current record's "email" value
 * @method boolean        getType()    Returns the current record's "type" value
 * @method string         getMessage() Returns the current record's "message" value
 * @method contact_form_2 setName()    Sets the current record's "name" value
 * @method contact_form_2 setFirm()    Sets the current record's "firm" value
 * @method contact_form_2 setPhone()   Sets the current record's "phone" value
 * @method contact_form_2 setEmail()   Sets the current record's "email" value
 * @method contact_form_2 setType()    Sets the current record's "type" value
 * @method contact_form_2 setMessage() Sets the current record's "message" value
 * 
 * @package    tnt
 * @subpackage model
 * @author     Tomasz ROGALSKI rogalski.tomaszek@gmail.com
 * @version    SVN: $Id: Builder.php 7490 2010-03-29 19:53:27Z jwage $
 */
abstract class Basecontact_form_2 extends sfDoctrineRecord
{
    public function setTableDefinition()
    {
        $this->setTableName('contact_form_2');
        $this->hasColumn('name', 'string', 255, array(
             'type' => 'string',
             'notnull' => false,
             'length' => 255,
             ));
        $this->hasColumn('firm', 'string', 255, array(
             'type' => 'string',
             'notnull' => false,
             'length' => 255,
             ));
        $this->hasColumn('phone', 'string', 255, array(
             'type' => 'string',
             'notnull' => false,
             'length' => 255,
             ));
        $this->hasColumn('email', 'string', 255, array(
             'type' => 'string',
             'notnull' => false,
             'length' => 255,
             ));
        $this->hasColumn('type', 'boolean', null, array(
             'type' => 'boolean',
             'default' => 0,
             ));
        $this->hasColumn('message', 'string', null, array(
             'type' => 'string',
             'notnull' => false,
             ));
    }

    public function setUp()
    {
        parent::setUp();
        $timestampable0 = new Doctrine_Template_Timestampable(array(
             ));
        $this->actAs($timestampable0);
    }
}