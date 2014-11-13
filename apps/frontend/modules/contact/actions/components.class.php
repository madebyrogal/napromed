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
class contactComponents extends sfComponents {

  public function executeContactWspolnotyForm(sfRequest $request) {
    $form = new contactWspolnotyForm();
    $flagSend = 0;
    if ($request->isMethod(sfWebRequest::POST)) {
      $form->bind($request->getParameter($form->getName()), $request->getFiles($form->getName()));
      if ($form->isValid()) {
        $form->save();
        $flagSend = 1;
        //Potwierdzenie dla klienta
        $mailData = mail_dataTable::getMailData('kontakt');
        $message = $this->getMailer()->compose();
        $message->setFrom(array($mailData->getEmailFrom()));
        $message->setTo(array($form->getValue('email')));
        $message->setSubject($mailData->getSubject());
        $message->setBody($mailData->getBody(ESC_RAW), 'text/html');
        $this->getMailer()->send($message);
        //Notyfikacja
        $message = $this->getMailer()->compose();
        $message->setFrom(array($mailData->getEmailFrom()));
        $message->setTo(array($mailData->getEmailFrom()));
        $message->setSubject('Nowa wiadomość w dziale - Wspólnoty Mieszkaniowe');
        sfContext::getInstance()->getConfiguration()->loadHelpers('Partial');
        $body = get_partial('contact/notification', array('form'=>$form));
        $message->setBody($body, 'text/html');
        $this->getMailer()->send($message);
      }
    }
    $this->form = $form;
    $this->flagSend = $flagSend;
  }

  public function executeContactObiektyKomercyjneForm(sfRequest $request) {
    $form = new contactObiektyKomercyjneForm();
    $flagSend = 0;
    if ($request->isMethod(sfWebRequest::POST)) {
      $form->bind($request->getParameter($form->getName()), $request->getFiles($form->getName()));
      if ($form->isValid()) {
        $form->save();
        $flagSend = 1;
        $mailData = mail_dataTable::getMailData('kontakt');
        $message = $this->getMailer()->compose();
        $message->setFrom(array($mailData->getEmailFrom()));
        $message->setTo(array($form->getValue('email')));
        $message->setSubject($mailData->getSubject());
        $message->setBody($mailData->getBody(ESC_RAW), 'text/html');
        $this->getMailer()->send($message);
        //Notyfikacja
        $message = $this->getMailer()->compose();
        $message->setFrom(array($mailData->getEmailFrom()));
        $message->setTo(array($mailData->getEmailFrom()));
        $message->setSubject('Nowa wiadomość w dziale - Obiekty komercyjne');
        sfContext::getInstance()->getConfiguration()->loadHelpers('Partial');
        $body = get_partial('contact/notification', array('form'=>$form));
        $message->setBody($body, 'text/html');
        $this->getMailer()->send($message);
      }
    }
    $this->form = $form;
    $this->flagSend = $flagSend;
  }

}

?>
