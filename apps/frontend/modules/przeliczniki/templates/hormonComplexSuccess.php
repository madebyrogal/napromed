<header>
    <h1><?= $pageContext[0]->getTitle()?></h1>
</header>
<section class="top">
    <?= $pageContext[0]->getContext(ESC_RAW)?>
</section>
<section>
    <?= $pageContext[1]->getContext(ESC_RAW) ?>
</section>
<div class="row marginT10">
    <label>INDEKSY HORMONALNE</label>
    <div>
        <select id="hormonComplex" class="hormonName">
            <option value="0" selected="selected">WYBIERZ INDEKS ...</option>
            <option value="ins">INSULINOOPORNOŚĆ</option>
            <option value="hom">HOMA IR</option>
            <option value="tes">TESTOSTERON</option>
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
<!-- TESTOSTERON -->
<section id="tes" class="hide hormons">
    <div class="row clear">
        <div class="left">
            <label>Płeć</label>
            <div>
                <select id="plecUnit">
                    <option value="f">żeńska</option>
                    <option value="m">męska</option>
                </select>
            </div>
        </div>
        <div class="clearfix"></div>
        <div class="left marginT10 marginR10">
            <label>Całkowity testosteron</label>
            <div>
                <input id="tesVal" class="inputVal" type="text" value=""/>
            </div>
        </div>
        <div class="left marginT10">
            <label>Jednostka</label>
            <div>
                <select id="tesUnit">
                    <option data="-9" value="ng">ng/dL</option>
                    <option data="-12" value="ng">ng/mL</option>
                    <option data="-9" value="mol">nmol/L</option>
                    <option data="-11" value="mol">nmol/dL</option>
                    <option data="-12" value="mol">nmol/mL</option>
                </select>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="left">
            <label>SHBG</label>
            <div>
                <input id="shbgVal" type="text" value=""/>
            </div>
        </div>
        <div class="left">
            <label>Jednostka</label>
            <div>
                <select id="shbgUnit">
                    <option data="0" value="mol">nmol/L</option>
                </select>
            </div>
        </div>
        <div class="clearfix"></div>
        <div class="left marginT10">
            <label>Albuminy</label>
            <div>
                <input id="albVal" type="text" value=""/>
            </div>
        </div>
        <div class="left marginT10">
            <label>Jednostka</label>
            <div>
                <select id="albUnit">
                    <option data="0" value="g">g/L</option>
                    <option data="-1" value="g">g/dL</option>
                    <option data="0" value="g">mg/mL</option>
                </select>
            </div>
        </div>
    </div>
    <div class="row">
        <button id="tesCal" type="submit">oblicz</button>
    </div>
    <div class="clearfix"></div>
    <table class="tabelResultDescription">
        <tr>
            <th>Metoda obliczeń</th>
            <th>Testosteron biodostępny (bioT)</th>
            <th>Testosteron wolny (FT)</th>
        </tr>
        <tr>
            <td width="33%">Vermeulen</td>
            <td id="bioTV" width="33%"></td>
            <td id ="FTV" width="33%"></td>
        </tr>
        <tr>
            <td width="33%">Sodegard</td>
            <td width="33%"></td>
            <td width="33%"></td>
        </tr>
        <tr>
            <td width="33%">Emadi – Konjin</td>
            <td width="33%"></td>
            <td width="33%"></td>
        </tr>
        <tr>
            <td width="33%">Morris</td>
            <td width="33%"></td>
            <td width="33%"></td>
        </tr>
        <tr>
            <td width="33%">Ly</td>
            <td width="33%"></td>
            <td width="33%"></td>
        </tr>
    </table>
</section>