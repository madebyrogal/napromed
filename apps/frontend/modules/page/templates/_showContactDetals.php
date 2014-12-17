<div class="about">
    <a title="Dane kontaktowe" href="mailto:<?= $mailData->getEmailFrom() ?>"><?= $mailData->getEmailFrom() ?></a>
    <a class="telephon" title="+48 5359 - NAPRO" href="tel:<?= $mailData->getPhone() ?>">+48 5359 - NAPRO</a>
    <a class="telephon" title="<?= $mailData->getPhone() ?>" href="tel:<?= $mailData->getPhone() ?>"><?= $mailData->getPhone() ?></a>
</div>