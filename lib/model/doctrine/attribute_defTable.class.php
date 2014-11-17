<?php

/**
 * attribute_defTable
 * 
 * This class has been auto-generated by the Doctrine ORM Framework
 */
class attribute_defTable extends Doctrine_Table
{
    /**
     * Returns an instance of this class.
     *
     * @return object attribute_defTable
     */
    public static function getInstance()
    {
        return Doctrine_Core::getTable('attribute_def');
    }
    
    /**
     * Pobiera definicje atrybutów dla kategorii produktów
     */
    public static function getCategoriesAttributes( $categorieIds ){
      $attributes = Doctrine_Query::create()
              ->from('attribute_def')
              ->where('module = ?', 'product_categories')
              ->andWhereIn('parent_id', $categorieIds)
              ->execute();
      
      if( $attributes ){
        $attribteIds = array();
        foreach ($attributes as $attribute){
          $attribteIds[] = $attribute->getId();
        }
        return $attribteIds;
      }
      else{
        return false;
      }
    }
    
    public static function getAttributeByIds( $ids ){
      return Doctrine_Query::create()
              ->from('attribute_def')
              ->whereIn('id', $ids)
              ->execute();
    }
}