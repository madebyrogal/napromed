<?php

/**
 * common actions.
 *
 * @package    madebyrogal
 * @subpackage common
 * @author     Tomasz ROGALSKI rogalski.tomaszek@gmail.com
 * @version    SVN: $Id: actions.class.php 23810 2009-11-12 11:07:44Z Kris.Wallsmith $
 */
class commonActions extends sfActions {

    /**
     * Executes index action
     *
     * @param sfRequest $request A request object
     */
    public function executeGetFile(sfWebRequest $request) {
        $file = $request->getParameter('file');
        if (file_exists( sfConfig::get('sf_web_dir') . $file)) {
            header('Content-Description: File Transfer');
            header('Content-Type: application/octet-stream');
            header('Content-Disposition: attachment; filename=' . basename($file));
            header('Content-Transfer-Encoding: binary');
            header('Expires: 0');
            header('Cache-Control: must-revalidate');
            header('Pragma: public');
            header('Content-Length: ' .  filesize( sfConfig::get('sf_web_dir') . $file));
            ob_clean();
            flush();
            readfile( sfConfig::get('sf_web_dir') . $file);
            exit;
        }
        exit;
    }

}
