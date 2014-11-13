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
class mainComponents extends sfComponents {

  public function executeHeaderHP() {
    $carouselHP = carousel_homeTable::getCarousel('home');
    $this->slides = mediaTable::getGallery('carousel_home', $carouselHP->getId(), $carouselHP->getNumberOfSlides());
  }

  public function executeHeader(sfRequest $request) {
    $module = $request->getParameter('module');
    switch ($module){
      case 'page':
        $this->slug = $request->getParameter('id');
        break;
      case 'offer':
        $this->slug = 'offer';
        break;
      case 'map':
        $this->slug = 'map';
        break;
      case 'contact':
        $this->slug = 'contact';
        break;
    }
  }

  public function executeFooter() {
    $gallery = gallery_1Table::getGallery('Nasze portfolio');
    //strony do dynamicznych linków
    $this->pages = pageTable::getPageToDynamicFooter(4);
  }
}

?>
