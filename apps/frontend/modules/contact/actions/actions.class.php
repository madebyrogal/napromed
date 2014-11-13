<?php

/**
 * contact actions.
 *
 * @package    tnt
 * @subpackage contact
 * @author     Tomasz ROGALSKI rogalski.tomaszek@gmail.com
 * @version    SVN: $Id: actions.class.php 23810 2009-11-12 11:07:44Z Kris.Wallsmith $
 */
class contactActions extends sfActions {

    public function preExecute() {
        parent::preExecute();
        $this->page = pageTable::getPageByRouteHash('contact');
        $this->setMeta($this->page);
    }

    /**
     * Executes index action
     *
     * @param sfRequest $request A request object
     */
    public function executeIndex(sfWebRequest $request) {
        $this->pageContext = textTable::getPageContext($this->page->getId());

        $this->setLayout($this->page->getLayout());
        $this->setTemplate($this->page->getTemplate());
        $this->setMeta($this->page);
    }

    public function executeSend(sfWebRequest $request) {
        $form = new contactForm();
        if ($request->isMethod(sfWebRequest::POST)) {
            $form->bind($request->getParameter($form->getName()), $request->getFiles($form->getName()));
            if ($form->isValid()) {
                $form->save();
                $mailData = mail_dataTable::getMailData('kontakt');
                //Notyfikacja
                $message = $this->getMailer()->compose();
                $message->setFrom(array($mailData->getEmailFrom()));
                $message->setTo(array($mailData->getEmailFrom()));
                $message->setSubject('Nowa wiadomość ze strony Jolmar');
                sfContext::getInstance()->getConfiguration()->loadHelpers('Partial');
                $body = get_partial('contact/notification', array('form' => $form));
                $message->setBody($body, 'text/html');
                $this->getMailer()->send($message);
                return $this->renderText(1);
            } else {
                return $this->renderText($form->renderGlobalErrors());
            }
        } else {
            return $this->renderText('Data not send');
        }
    }

}
