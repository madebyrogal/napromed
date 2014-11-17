<?php

/**
 * langTable
 * 
 * This class has been auto-generated by the Doctrine ORM Framework
 */
class langTable extends Doctrine_Table
{
    /**
     * Returns an instance of this class.
     *
     * @return object langTable
     */
    public static function getInstance()
    {
        return Doctrine_Core::getTable('lang');
    }
    
    public static function getAllVisibleLang(){
      return Doctrine_Query::create()
              ->from('lang')
              ->where('hidden = ?', 0)
              ->execute();
    }
    
    /**
     * Zwraca tablice z slugami języków
     */
    public static function getAllVisibleLangToArray(){
      $langs = self::getAllVisibleLang();
      if($langs){
        $aLangs = array();
        foreach ($langs as $lang){
          $aLangs[] = $lang->getSlug();
        }
      }
      return $aLangs;
    }
}