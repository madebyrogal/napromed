<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of components
 *
 * @author Rogal
 */
class newsComponents extends sfComponents
{

    public function executeImageArticle()
    {
        $this->media = mediaTable::getMainMedia('article', $this->article->getId());
    }


    public function executeShowGallery()
    {
        $this->media = mediaTable::getMainMedia('product', $this->product->getId());
        $this->gallery = mediaTable::getGallery('product', $this->product->getId());
    }

}

?>
