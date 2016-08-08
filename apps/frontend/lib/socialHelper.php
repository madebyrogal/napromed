<?php

/**
 * Helper class to generate ogTag for socialMedia
 */
class socialHelper 
{
    /**
     * Meta ogTag Data for social media
     * @var array $ogTagData
     */
    private $ogTagData = array();
    
    /**
     * Article object
     * @param Article $article
     */
    public function __construct(sfPatternRouting $routing, sfWebRequest $request)
    {
        switch($routing->getCurrentRouteName()){
            case 'article_show':
                $article = articleTable::getInstance()->find($request->getParameter('id'));
                $this->ogTagData['fb']['title'] = $article->getTitle();
                $this->ogTagData['fb']['description'] = $article->getSneakPeak();
                $this->ogTagData['fb']['type'] = 'article';
                $this->ogTagData['fb']['url'] = sfContext::getInstance()->getRouting()->generate('article_show', array('id'=>$article->getId(), 'slug'=>$article->getSlug()), true);
                $this->ogTagData['fb']['site_name'] = 'Napromed';
                $picture = mediaTable::getMainMedia('article', $article->getId());
                if($picture){
                    $this->ogTagData['fb']['image'] = 'http://' . $request->getHost() . $picture->getFile();
                } else {
                    $this->ogTagData['fb']['image'] = 'http://' . $request->getHost() . '/images/fb-default-photo.jpg';
                }
                $this->ogTagData['fb']['locale'] = 'pl_PL';
                break;
            default :
                $this->ogTagData['fb']['image'] = 'http://' . $request->getHost() . '/images/fb-default-photo.jpg';
                $this->ogTagData['fb']['locale'] = 'pl_PL';
                break;
        }
    }
    
    /**
     * Get ogTagData for social media
     * @return array $ogTagData
     */
    public function getOgTagData(){
        
        return $this->ogTagData;
    }
}

