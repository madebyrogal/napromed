<div class="sf_admin_list">
  <table cellspacing="0">
    <thead>
      <tr>
        <th id="sf_admin_list_batch_actions">Nazwa pola</th>
        <th id="sf_admin_list_th_actions">Wartość</th>
      </tr>
    </thead>
    <tfoot>
      <tr>
        <th colspan="7">
          <a href="javascript:history.back()">Back to list</a>
        </th>
      </tr>
    </tfoot>
    <tbody>
      <tr class="sf_admin_row odd">
        <td>Imię i nazwisko</td>
        <td><?= $contact_form_1->getName(); ?></td>
      </tr>
      <tr class="sf_admin_row even">
        <td>Nazwa firmy</td>
        <td><?= $contact_form_1->getFirm(); ?></td>
      </tr>
      <tr class="sf_admin_row odd">
        <td>Telefon</td>
        <td><?= $contact_form_1->getPhone(); ?></td>
      </tr>
      <tr class="sf_admin_row even">
        <td>E-mail</td>
        <td><?= $contact_form_1->getEmail(); ?></td>
      </tr>
      <tr class="sf_admin_row even">
        <td>Wiadomość</td>
        <td><?= $contact_form_1->getMessage(); ?></td>
      </tr>
      <tr class="sf_admin_row odd">
        <td>Data utworzenia</td>
        <td><?= $contact_form_1->getCreatedAt(); ?></td>
      </tr>
    </tbody>
  </table>
</div>