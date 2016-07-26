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
    private $ogTagData = [];
    
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
                $this->ogTagData['fb']['url'] = '';
                $this->ogTagData['fb']['site_name'] = 'Napromed';
                $this->ogTagData['fb']['image'] = mediaTable::getMainMedia('article', $article->getId());
                $this->ogTagData['fb']['locale'] = 'pl_PL';
                break;
            default :
                $this->ogTagData['fb']['image'] = '/images/fb-default-photo.jpg';
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

