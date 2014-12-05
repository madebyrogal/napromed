<header>
    <h1><?= $pageContext[0]->getTitle()?></h1>
</header>
<section class="top">
    <?= $pageContext[0]->getContext(ESC_RAW)?>
</section>
<div class="row marginT10">
    <label>INDEKSY HORMONALNE</label>
    <div>
        <select id="hormonComplex" class="hormonName">
            <option value="0" selected="selected">WYBIERZ INDEKS ...</option>
            <option value="ins">INSULINOOPORNOŚĆ</option>
            <option value="hom">HOMA IR</option>
        </select>
    </div>
</div>
<div class="clear"></div>
<!-- INSULINOOPORNOŚĆ -->
<section id="ins" class="hide hormons">    
    <div class="row clear">
        <div class="left">
            <label>Wartość</label>
            <div>
                <input id="insVal" class="inputVal" type="text" value=""/>
            </div>
        </div>
        <div class="left">
            <label>Jednostka</label>
            <div>
                <select id="insUnit">
                    <option value="pm">pmol/L</option>
                    <option value="mi">µIU/mL (mIU/L)</option>
                </select>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="left">
            <label>Wartość</label>
            <div>
                <input id="insVal2" type="text" value="" disabled="disabled"/>
            </div>
        </div>
        <div class="left">
            <label>Jednostka</label>
            <div>
                <select id="insUnit2">
                    <option value="mi">µIU/mL (mIU/L)</option>
                    <option value="pm">pmol/L</option>
                </select>
            </div>
        </div>
    </div>
    <div class="clearfix"></div>
    <table class="tabelResultDescription">
        <tr>
            <th>Opis</th>
            <th>Wartości</th>
        </tr>
        <tr>
            <td width="35%">Insulina na czczo</td>
            <td width="65%">> 10 µ IU/mL → INSULINOOPORNOŚĆ</td>
        </tr>
        <tr>
            <td width="35%">Insulina po 2 godz. OGTT</td>
            <td width="65%">> 60 µ IU/mL → INSULINOOPORNOŚĆ</td>
        </tr>
    </table>
</section>
<!-- HOMA IR -->
<section id="hom" class="hide hormons">
    <div class="row clear">
        <div class="left">
            <label>Glukoza na czczo</label>
            <div>
                <input id="glukozaVal" class="inputVal" type="text" value=""/>
            </div>
        </div>
        <div class="left">
            <label>Jednostka</label>
            <div>
                <select id="glukozaUnit">
                    <option value="mg">mg/dL</option>
                    <option value="mol">mmol/L</option>
                </select>
            </div>
        </div>
        <div class="clearfix"></div>
        <div class="left marginT10">
            <label>Insulina na czczo</label>
            <div>
                <input id="insulinaVal" class="inputVal" type="text" value=""/>
            </div>
        </div>
        <div class="left marginT10">
            <label>Jednostka</label>
            <div>
                <select id="insulinaUnit" disabled="disabled">
                    <option value="ug" selected="selected">µg/ml</option>
                    <option value="ui">µIU/ml</option>
                </select>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="left">
            <label>Wartość</label>
            <div>
                <input id="odpornoscVal" type="text" value="" disabled="disabled"/>
            </div>
        </div>
    </div>
    <div class="clearfix"></div>
    <table class="tabelResultDescription">
        <tr>
            <th>Opis</th>
            <th>Wartości</th>
        </tr>
        <tr>
            <td width="35%">Glukoza w [mg/dL]</td>
            <td width="65%">jeżeli > 45 → INSULINOOPORNOŚĆ</td>
        </tr>
        <tr>
            <td width="35%">Glukoza w [mmol/L]</td>
            <td width="65%">jeżeli > 2,5 → INSULINOOPORNOŚĆ</td>
        </tr>
    </table>
</section>