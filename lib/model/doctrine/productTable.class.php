<?php

/**
 * productTable
 * 
 * This class has been auto-generated by the Doctrine ORM Framework
 */
class productTable extends Doctrine_Table
{
    /**
     * Returns an instance of this class.
     *
     * @return object productTable
     */
    public static function getInstance()
    {
        return Doctrine_Core::getTable('product');
    }
    
    public static function getProductForPager($categoryId){
      return Doctrine_Query::create()
              ->from('product')
              ->where('hidden = ?', 0)
              ->andWhere('category_id = ?', $categoryId)
              ->orderBy('position ASC');
    }
    
    public static function getProductPromoForPager(){
      return Doctrine_Query::create()
              ->from('product')
              ->where('hidden = ?', 0)
              ->andWhere('promotion = ?', 1)
              ->orderBy('position ASC');
    }
}