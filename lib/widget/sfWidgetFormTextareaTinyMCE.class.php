<?php

/*
 * This file is part of the symfony package.
 * (c) Fabien Potencier <fabien.potencier@symfony-project.com>
 * 
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

/**
 * sfWidgetFormTextareaTinyMCE represents a Tiny MCE widget.
 *
 * You must include the Tiny MCE JavaScript file by yourself.
 *
 * @package    symfony
 * @subpackage widget
 * @author     Fabien Potencier <fabien.potencier@symfony-project.com>
 * @version    SVN: $Id: sfWidgetFormTextareaTinyMCE.class.php 17192 2009-04-10 07:58:29Z fabien $
 */
class sfWidgetFormTextareaTinyMCE extends sfWidgetFormTextarea {

    /**
     * Constructor.
     *
     * Available options:
     *
     *  * theme:  The Tiny MCE theme
     *  * width:  Width
     *  * height: Height
     *  * config: The javascript configuration
     *
     * @param array $options     An array of options
     * @param array $attributes  An array of default HTML attributes
     *
     * @see sfWidgetForm
     */
    protected function configure($options = array(), $attributes = array()) {
        $this->addOption('theme', 'advanced');
        $this->addOption('width', '700');
        $this->addOption('height', '500');
        $this->addOption('config', '');
    }

    /**
     * @param  string $name        The element name
     * @param  string $value       The value selected in this widget
     * @param  array  $attributes  An array of HTML attributes to be merged with the default HTML attributes
     * @param  array  $errors      An array of errors for the field
     *
     * @return string An HTML tag string
     *
     * @see sfWidgetForm
     */
    public function render($name, $value = null, $attributes = array(), $errors = array()) {

        $this->generateLinks();
        $textarea = parent::render($name, $value, $attributes, $errors);

        $js = sprintf(<<<EOF
<script type="text/javascript">
  tinyMCE.init({
    relative_urls: false,
    convert_urls: false,
    mode: "exact",
    plugins: "advhr, advimage, advlink, advlist, autolink, contextmenu, directionality, emotions, example, fullscreen, iespell, inlinepopups, insertdatetime, layer, legacyoutput, media, nonbreaking, noneditable, pagebreak, paste, preview, print, save, searchreplace, spellchecker, style, tabfocus, table, template, visualchars, wordcount, xhtmlxtras", 
    elements: "%s",
    theme: "%s",
    theme_advanced_buttons1: "pastetext,pasteword,selectall,|,bold,italic,underline,strikethrough,|,justifyleft,justifyright,justifycenter,justifyfull,|,bullist,numlist,|,outdent,indent,|,cut,copy,paste,undo,redo,|,link,unlink,|,search,replace,|,nonbreaking",
    theme_advanced_buttons2: "image,cleanup,hr,|,removeformat,formatselect,fontselect,fontsizeselect,|,sub,sup,|,forecolor,backcolor,|,charmap,visualaid,anchor,blockquote,code",
    theme_advanced_buttons3: "tablecontrols",
    %s
    %s
    theme_advanced_toolbar_location: "top",
    theme_advanced_toolbar_align: "left",
    theme_advanced_statusbar_location: "bottom",
    theme_advanced_resizing_min_width : 320,    
    theme_advanced_resizing_min_height : 240,
    theme_advanced_resizing: true,
    external_link_list_url : "/js/tiny_mce/external-url.js",
    file_browser_callback: "tinyBrowser"
    %s
  });
</script>
EOF
                , $this->generateId($name), $this->getOption('theme'), $this->getOption('width') ? sprintf('width: "%s",', $this->getOption('width')) : '', $this->getOption('height') ? sprintf('height: "%s",', $this->getOption('height')) : '', $this->getOption('config') ? ",\n" . $this->getOption('config') : ''
        );

        return $textarea . $js;
    }
    
    private function generateLinks(){        
        $dictUrl = "/naprotechnologia-slownik.html";
        $dictionary = dictionaryTable::getAll();
        $js = "var tinyMCELinkList  = new Array(";
        foreach($dictionary as $dict){
            $url = $dictUrl.'#'.$dict->getSlug();
            $js .= "['Słownik - {$dict->getTitle()}', '{$url}'],";
        }
        $js = substr($js, 0, strlen($js)-1);
        $js .= ");";
        file_put_contents(sfConfig::get('sf_web_dir').'/js/tiny_mce/external-url.js', $js);
    }

}
