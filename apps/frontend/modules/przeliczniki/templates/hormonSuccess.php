<header>
    <h1><?= $pageContext[0]->getTitle() ?></h1>
</header>
<section class="top">
    <?= $pageContext[0]->getContext(ESC_RAW) ?>
</section>
<div class="row marginT10">
    <label>Hormony</label>
    <div>
        <select id="hormon" class="hormonName">
            <option value="0" selected="selected">WYBIERZ HORMON ...</option>
            <option value="a17">17–α-OH-PROGESTERON</option>
            <option value="and">ANDROSTENDION</option>
            <option value="dhe">DHEA</option>
            <option value="est">ESTRADIOL</option>
            <option value="esr">ESTRON</option>
            <option value="glu">GLUKOZA</option>
            <option value="ins">INSULINA</option>
            <option value="pro">PROGESTERON</option>
            <option value="prl">PROLAKTYNA</option>
            <option value="tes">TESTOSTERON</option>
        </select>
    </div>
</div>
<div class="clear"></div>
<!-- ESTRADIOL -->
<section id="est" class="hide hormons">
    <div class="row clear">
        <div class="left">
            <label>Wartość</label>
            <div>
                <input id="estVal" class="inputVal" type="text" value=""/>
            </div>
        </div>
        <div class="left">
            <label>Jednostka</label>
            <div>
                <select id="estUnit">
                    <option data="-9" value="pmol">mmol/L</option>
                    <option data="-10" value="pmol">mmol/dL</option>
                    <option data="-12" value="pmol">mmol/mL</option>
                    <option data="-6" value="pmol">µmol/L</option>
                    <option data="-7" value="pmol">µmol/dL</option>
                    <option data="-9" value="pmol">µmol/mL</option>
                    <option data="-3" value="pmol">nmol/L</option>
                    <option data="-4" value="pmol">nmol/dL</option>
                    <option data="-6" value="pmol">nmol/mL</option>
                    <option data="0" value="pmol">pmol/L</option>
                    <option data="-1" value="pmol">pmol/dL</option>
                    <option data="-3" value="pmol">pmol/mL</option>
                    <option data="-9" value="pg">g/L</option>
                    <option data="-10" value="pg">g/dL</option>
                    <option data="-12" value="pg">g/mL</option>
                    <option data="-6" value="pg">mg/L</option>
                    <option data="-7" value="pg">mg/dL</option>
                    <option data="-9" value="pg">mg/mL</option>
                    <option data="-3" value="pg">µg/L</option>
                    <option data="-4" value="pg">µg/dL</option>
                    <option data="-6" value="pg">µg/mL</option>
                    <option data="0" value="pg">ng/L</option>
                    <option data="-1" value="pg">ng/dL</option>
                    <option data="-3" value="pg">ng/mL</option>
                    <option data="3" value="pg">pg/L</option>
                    <option data="2" value="pg">pg/dL</option>
                    <option data="0" value="pg">pg/mL</option>
                </select>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="left">
            <label>Wartość</label>
            <div>
                <input id="estVal2" type="text" value="" disabled="disabled"/>
            </div>
        </div>
        <div class="left">
            <label>Jednostka</label>
            <div>
                <select id="estUnit2">
                    <option data="-9" value="pg">g/L</option>
                    <option data="-10" value="pg">g/dL</option>
                    <option data="-12" value="pg">g/mL</option>
                    <option data="-6" value="pg">mg/L</option>
                    <option data="-7" value="pg">mg/dL</option>
                    <option data="-9" value="pg">mg/mL</option>
                    <option data="-3" value="pg">µg/L</option>
                    <option data="-4" value="pg">µg/dL</option>
                    <option data="-6" value="pg">µg/mL</option>
                    <option data="0" value="pg">ng/L</option>
                    <option data="-1" value="pg">ng/dL</option>
                    <option data="-3" value="pg">ng/mL</option>
                    <option data="3" value="pg">pg/L</option>
                    <option data="2" value="pg">pg/dL</option>
                    <option data="0" value="pg">pg/mL</option>
                    <option data="-9" value="pmol">mmol/L</option>
                    <option data="-10" value="pmol">mmol/dL</option>
                    <option data="-12" value="pmol">mmol/mL</option>
                    <option data="-6" value="pmol">µmol/L</option>
                    <option data="-7" value="pmol">µmol/dL</option>
                    <option data="-9" value="pmol">µmol/mL</option>
                    <option data="-3" value="pmol">nmol/L</option>
                    <option data="-4" value="pmol">nmol/dL</option>
                    <option data="-6" value="pmol">nmol/mL</option>
                    <option data="0" value="pmol">pmol/L</option>
                    <option data="-1" value="pmol">pmol/dL</option>
                    <option data="-3" value="pmol">pmol/mL</option>
                </select>
            </div>
        </div>
    </div>
</section>
<!-- PROGESTERON -->
<section id="pro" class="hide hormons">
    <div class="row clear">
        <div class="left">
            <label>Wartość</label>
            <div>
                <input id="proVal" class="inputVal" type="text" value=""/>
            </div>
        </div>
        <div class="left">
            <label>Jednostka</label>
            <div>
                <select id="proUnit">
                    <option data="-6" value="nmol">mmol/L</option>
                    <option data="-7" value="nmol">mmol/dL</option>
                    <option data="-9" value="nmol">mmol/mL</option>
                    <option data="-3" value="nmol">µmol/L</option>
                    <option data="-4" value="nmol">µmol/dL</option>
                    <option data="-6" value="nmol">µmol/mL</option>
                    <option data="0" value="nmol">nmol/L</option>
                    <option data="-1" value="nmol">nmol/dL</option>
                    <option data="-3" value="nmol">nmol/mL</option>
                    <option data="3" value="nmol">pmol/L</option>
                    <option data="2" value="nmol">pmol/dL</option>
                    <option data="0" value="nmol">pmol/mL</option>
                    <option data="-6" value="ng">g/L</option>
                    <option data="-7" value="ng">g/dL</option>
                    <option data="-9" value="ng">g/mL</option>
                    <option data="-3" value="ng">mg/L</option>
                    <option data="-4" value="ng">mg/dL</option>
                    <option data="-6" value="ng">mg/mL</option>
                    <option data="0" value="ng">µg/L</option>
                    <option data="-1" value="ng">µg/dL</option>
                    <option data="-3" value="ng">µg/mL</option>
                    <option data="3" value="ng">ng/L</option>
                    <option data="2" value="ng">ng/dL</option>
                    <option data="0" value="ng">ng/mL</option>
                    <option data="6" value="ng">pg/L</option>
                    <option data="5" value="ng">pg/dL</option>
                    <option data="3" value="ng">pg/mL</option>
                </select>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="left">
            <label>Wartość</label>
            <div>
                <input id="proVal2" type="text" value="" disabled="disabled"/>
            </div>
        </div>
        <div class="left">
            <label>Jednostka</label>
            <div>
                <select id="proUnit2">
                    <option data="-6" value="ng">g/L</option>
                    <option data="-7" value="ng">g/dL</option>
                    <option data="-9" value="ng">g/mL</option>
                    <option data="-3" value="ng">mg/L</option>
                    <option data="-4" value="ng">mg/dL</option>
                    <option data="-6" value="ng">mg/mL</option>
                    <option data="0" value="ng">µg/L</option>
                    <option data="-1" value="ng">µg/dL</option>
                    <option data="-3" value="ng">µg/mL</option>
                    <option data="3" value="ng">ng/L</option>
                    <option data="2" value="ng">ng/dL</option>
                    <option data="0" value="ng">ng/mL</option>
                    <option data="6" value="ng">pg/L</option>
                    <option data="5" value="ng">pg/dL</option>
                    <option data="3" value="ng">pg/mL</option>
                    <option data="-6" value="nmol">mmol/L</option>
                    <option data="-7" value="nmol">mmol/dL</option>
                    <option data="-9" value="nmol">mmol/mL</option>
                    <option data="-3" value="nmol">µmol/L</option>
                    <option data="-4" value="nmol">µmol/dL</option>
                    <option data="-6" value="nmol">µmol/mL</option>
                    <option data="0" value="nmol">nmol/L</option>
                    <option data="-1" value="nmol">nmol/dL</option>
                    <option data="-3" value="nmol">nmol/mL</option>
                    <option data="3" value="nmol">pmol/L</option>
                    <option data="2" value="nmol">pmol/dL</option>
                    <option data="0" value="nmol">pmol/mL</option>
                </select>
            </div>
        </div>
    </div>
</section>
<!-- TESTOSTERON -->
<section id="tes" class="hide hormons">
    <div class="row clear">
        <div class="left">
            <label>Wartość</label>
            <div>
                <input id="tesVal" class="inputVal" type="text" value=""/>
            </div>
        </div>
        <div class="left">
            <label>Jednostka</label>
            <div>
                <select id="tesUnit">
                    <option data="-6" value="nmol">mmol/L</option>
                    <option data="-7" value="nmol">mmol/dL</option>
                    <option data="-9" value="nmol">mmol/mL</option>
                    <option data="-3" value="nmol">µmol/L</option>
                    <option data="-4" value="nmol">µmol/dL</option>
                    <option data="-6" value="nmol">µmol/mL</option>
                    <option data="0" value="nmol">nmol/L</option>
                    <option data="-1" value="nmol">nmol/dL</option>
                    <option data="-3" value="nmol">nmol/mL</option>
                    <option data="3" value="nmol">pmol/L</option>
                    <option data="2" value="nmol">pmol/dL</option>
                    <option data="0" value="nmol">pmol/mL</option>
                    <option data="-8" value="ng">g/L</option>
                    <option data="-9" value="ng">g/dL</option>
                    <option data="-11" value="ng">g/mL</option>
                    <option data="-5" value="ng">mg/L</option>
                    <option data="-6" value="ng">mg/dL</option>
                    <option data="-8" value="ng">mg/mL</option>
                    <option data="-2" value="ng">µg/L</option>
                    <option data="-3" value="ng">µg/dL</option>
                    <option data="-5" value="ng">µg/mL</option>
                    <option data="1" value="ng">ng/L</option>
                    <option data="0" value="ng">ng/dL</option>
                    <option data="-2" value="ng">ng/mL</option>
                    <option data="4" value="ng">pg/L</option>
                    <option data="3" value="ng">pg/dL</option>
                    <option data="1" value="ng">pg/mL</option>
                </select>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="left">
            <label>Wartość</label>
            <div>
                <input id="tesVal2" type="text" value="" disabled="disabled"/>
            </div>
        </div>
        <div class="left">
            <label>Jednostka</label>
            <div>
                <select id="tesUnit2">
                    <option data="-8" value="ng">g/L</option>
                    <option data="-9" value="ng">g/dL</option>
                    <option data="-11" value="ng">g/mL</option>
                    <option data="-5" value="ng">mg/L</option>
                    <option data="-6" value="ng">mg/dL</option>
                    <option data="-8" value="ng">mg/mL</option>
                    <option data="-2" value="ng">µg/L</option>
                    <option data="-3" value="ng">µg/dL</option>
                    <option data="-5" value="ng">µg/mL</option>
                    <option data="1" value="ng">ng/L</option>
                    <option data="0" value="ng">ng/dL</option>
                    <option data="-2" value="ng">ng/mL</option>
                    <option data="4" value="ng">pg/L</option>
                    <option data="3" value="ng">pg/dL</option>
                    <option data="1" value="ng">pg/mL</option>
                    <option data="-6" value="nmol">mmol/L</option>
                    <option data="-7" value="nmol">mmol/dL</option>
                    <option data="-9" value="nmol">mmol/mL</option>
                    <option data="-3" value="nmol">µmol/L</option>
                    <option data="-4" value="nmol">µmol/dL</option>
                    <option data="-6" value="nmol">µmol/mL</option>
                    <option data="0" value="nmol">nmol/L</option>
                    <option data="-1" value="nmol">nmol/dL</option>
                    <option data="-3" value="nmol">nmol/mL</option>
                    <option data="3" value="nmol">pmol/L</option>
                    <option data="2" value="nmol">pmol/dL</option>
                    <option data="0" value="nmol">pmol/mL</option>
                </select>
            </div>
        </div>
    </div>
</section>
<!-- PROLAKTYNA -->
<section id="prl" class="hide hormons">
    <div class="row clear">
        <div class="left">
            <label>Wartość</label>
            <div>
                <input id="prlVal" class="inputVal" type="text" value=""/>
            </div>
        </div>
        <div class="left">
            <label>Jednostka</label>
            <div>
                <select id="prlUnit">
                    <option data="-6" value="ng">g/L</option>
                    <option data="-7" value="ng">g/dL</option>
                    <option data="-9" value="ng">g/mL</option>
                    <option data="-3" value="ng">mg/L</option>
                    <option data="-4" value="ng">mg/dL</option>
                    <option data="-6" value="ng">mg/mL</option>
                    <option data="0" value="ng">µg/L</option>
                    <option data="-1" value="ng">µg/dL</option>
                    <option data="-3" value="ng">µg/mL</option>
                    <option data="3" value="ng">ng/L</option>
                    <option data="2" value="ng">ng/dL</option>
                    <option data="0" value="ng">ng/mL</option>
                    <option data="6" value="ng">pg/L</option>
                    <option data="5" value="ng">pg/dL</option>
                    <option data="3" value="ng">pg/mL</option>
                    <option value="mi">mIU/L</option>
                </select>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="left">
            <label>Wartość</label>
            <div>
                <input id="prlVal2" type="text" value="" disabled="disabled"/>
            </div>
        </div>
        <div class="left">
            <label>Jednostka</label>
            <div>
                <select id="prlUnit2">
                    <option value="mi">mIU/L</option>
                    <option data="-6" value="ng">g/L</option>
                    <option data="-7" value="ng">g/dL</option>
                    <option data="-9" value="ng">g/mL</option>
                    <option data="-3" value="ng">mg/L</option>
                    <option data="-4" value="ng">mg/dL</option>
                    <option data="-6" value="ng">mg/mL</option>
                    <option data="0" value="ng">µg/L</option>
                    <option data="-1" value="ng">µg/dL</option>
                    <option data="-3" value="ng">µg/mL</option>
                    <option data="3" value="ng">ng/L</option>
                    <option data="2" value="ng">ng/dL</option>
                    <option data="0" value="ng">ng/mL</option>
                    <option data="6" value="ng">pg/L</option>
                    <option data="5" value="ng">pg/dL</option>
                    <option data="3" value="ng">pg/mL</option>
                </select>
            </div>
        </div>
    </div>
</section>
<!-- INSULINA -->
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
                    <option data="-9" value="pm">mmol/L</option>
                    <option data="-10" value="pm">mmol/dL</option>
                    <option data="-12" value="pm">mmol/mL</option>
                    <option data="-6" value="pm">µmol/L</option>
                    <option data="-7" value="pm">µmol/dL</option>
                    <option data="-9" value="pm">µmol/mL</option>
                    <option data="-3" value="pm">nmol/L</option>
                    <option data="-4" value="pm">nmol/dL</option>
                    <option data="-6" value="pm">nmol/mL</option>
                    <option data="0" value="pm">pmol/L</option>
                    <option data="-1" value="pm">pmol/dL</option>
                    <option data="-3" value="pm">pmol/mL</option>
                    <option value="mi">mIU/L (µIU/mL)</option>
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
                    <option value="mi">mIU/L (µIU/mL)</option>
                    <option data="-9" value="pm">mmol/L</option>
                    <option data="-10" value="pm">mmol/dL</option>
                    <option data="-12" value="pm">mmol/mL</option>
                    <option data="-6" value="pm">µmol/L</option>
                    <option data="-7" value="pm">µmol/dL</option>
                    <option data="-9" value="pm">µmol/mL</option>
                    <option data="-3" value="pm">nmol/L</option>
                    <option data="-4" value="pm">nmol/dL</option>
                    <option data="-6" value="pm">nmol/mL</option>
                    <option data="0" value="pm">pmol/L</option>
                    <option data="-1" value="pm">pmol/dL</option>
                    <option data="-3" value="pm">pmol/mL</option>
                </select>
            </div>
        </div>
    </div>
</section>
<!-- GLUKOZA -->
<section id="glu" class="hide hormons">
    <div class="row clear">
        <div class="left">
            <label>Wartość</label>
            <div>
                <input id="gluVal" class="inputVal" type="text" value=""/>
            </div>
        </div>
        <div class="left">
            <label>Jednostka</label>
            <div>
                <select id="gluUnit">
                    <option data="0" value="mm">mmol/L</option>
                    <option data="-1" value="mm">mmol/dL</option>
                    <option data="-3" value="mm">mmol/mL</option>
                    <option data="3" value="mm">µmol/L</option>
                    <option data="2" value="mm">µmol/dL</option>
                    <option data="0" value="mm">µmol/mL</option>
                    <option data="6" value="mm">nmol/L</option>
                    <option data="5" value="mm">nmol/dL</option>
                    <option data="3" value="mm">nmol/mL</option>
                    <option data="9" value="mm">pmol/L</option>
                    <option data="8" value="mm">pmol/dL</option>
                    <option data="6" value="mm">pmol/mL</option>
                    <option data="-2" value="mg">g/L</option>
                    <option data="-3" value="mg">g/dL</option>
                    <option data="-5" value="mg">g/mL</option>
                    <option data="1" value="mg">mg/L</option>
                    <option data="0" value="mg">mg/dL</option>
                    <option data="-2" value="mg">mg/mL</option>
                    <option data="4" value="mg">µg/L</option>
                    <option data="3" value="mg">µg/dL</option>
                    <option data="1" value="mg">µg/mL</option>
                    <option data="7" value="mg">ng/L</option>
                    <option data="6" value="mg">ng/dL</option>
                    <option data="4" value="mg">ng/mL</option>
                    <option data="10" value="mg">pg/L</option>
                    <option data="9" value="mg">pg/dL</option>
                    <option data="7" value="mg">pg/mL</option>
                </select>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="left">
            <label>Wartość</label>
            <div>
                <input id="gluVal2" type="text" value="" disabled="disabled"/>
            </div>
        </div>
        <div class="left">
            <label>Jednostka</label>
            <div>
                <select id="gluUnit2">
                    <option data="-2" value="mg">g/L</option>
                    <option data="-3" value="mg">g/dL</option>
                    <option data="-5" value="mg">g/mL</option>
                    <option data="1" value="mg">mg/L</option>
                    <option data="0" value="mg">mg/dL</option>
                    <option data="-2" value="mg">mg/mL</option>
                    <option data="4" value="mg">µg/L</option>
                    <option data="3" value="mg">µg/dL</option>
                    <option data="1" value="mg">µg/mL</option>
                    <option data="7" value="mg">ng/L</option>
                    <option data="6" value="mg">ng/dL</option>
                    <option data="4" value="mg">ng/mL</option>
                    <option data="10" value="mg">pg/L</option>
                    <option data="9" value="mg">pg/dL</option>
                    <option data="7" value="mg">pg/mL</option>
                    <option data="0" value="mm">mmol/L</option>
                    <option data="-1" value="mm">mmol/dL</option>
                    <option data="-3" value="mm">mmol/mL</option>
                    <option data="3" value="mm">µmol/L</option>
                    <option data="2" value="mm">µmol/dL</option>
                    <option data="0" value="mm">µmol/mL</option>
                    <option data="6" value="mm">nmol/L</option>
                    <option data="5" value="mm">nmol/dL</option>
                    <option data="3" value="mm">nmol/mL</option>
                    <option data="9" value="mm">pmol/L</option>
                    <option data="8" value="mm">pmol/dL</option>
                    <option data="6" value="mm">pmol/mL</option>
                </select>
            </div>
        </div>
    </div>
</section>
<!-- DHEA -->
<section id="dhe" class="hide hormons">
    <div class="row clear">
        <div class="left">
            <label>Wartość</label>
            <div>
                <input id="dheVal" class="inputVal" type="text" value=""/>
            </div>
        </div>
        <div class="left">
            <label>Jednostka</label>
            <div>
                <select id="dheUnit">
                    <option data="-6" value="nm">mmol/L</option>
                    <option data="-7" value="nm">mmol/dL</option>
                    <option data="-9" value="nm">mmol/mL</option>
                    <option data="-3" value="nm">µmol/L</option>
                    <option data="-4" value="nm">µmol/dL</option>
                    <option data="-6" value="nm">µmol/mL</option>
                    <option data="0" value="nm">nmol/L</option>
                    <option data="-1" value="nm">nmol/dL</option>
                    <option data="-3" value="nm">nmol/mL</option>
                    <option data="3" value="nm">pmol/L</option>
                    <option data="2" value="nm">pmol/dL</option>
                    <option data="0" value="nm">pmol/mL</option>
                    <option data="-6" value="ng">g/L</option>
                    <option data="-7" value="ng">g/dL</option>
                    <option data="-9" value="ng">g/mL</option>
                    <option data="-3" value="ng">mg/L</option>
                    <option data="-4" value="ng">mg/dL</option>
                    <option data="-6" value="ng">mg/mL</option>
                    <option data="0" value="ng">µg/L</option>
                    <option data="-1" value="ng">µg/dL</option>
                    <option data="-3" value="ng">µg/mL</option>
                    <option data="3" value="ng">ng/L</option>
                    <option data="2" value="ng">ng/dL</option>
                    <option data="0" value="ng">ng/mL</option>
                    <option data="6" value="ng">pg/L</option>
                    <option data="5" value="ng">pg/dL</option>
                    <option data="3" value="ng">pg/mL</option>
                </select>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="left">
            <label>Wartość</label>
            <div>
                <input id="dheVal2" type="text" value="" disabled="disabled"/>
            </div>
        </div>
        <div class="left">
            <label>Jednostka</label>
            <div>
                <select id="dheUnit2">
                    <option data="-6" value="ng">g/L</option>
                    <option data="-7" value="ng">g/dL</option>
                    <option data="-9" value="ng">g/mL</option>
                    <option data="-3" value="ng">mg/L</option>
                    <option data="-4" value="ng">mg/dL</option>
                    <option data="-6" value="ng">mg/mL</option>
                    <option data="0" value="ng">µg/L</option>
                    <option data="-1" value="ng">µg/dL</option>
                    <option data="-3" value="ng">µg/mL</option>
                    <option data="3" value="ng">ng/L</option>
                    <option data="2" value="ng">ng/dL</option>
                    <option data="0" value="ng">ng/mL</option>
                    <option data="6" value="ng">pg/L</option>
                    <option data="5" value="ng">pg/dL</option>
                    <option data="3" value="ng">pg/mL</option>
                    <option data="-6" value="nm">mmol/L</option>
                    <option data="-7" value="nm">mmol/dL</option>
                    <option data="-9" value="nm">mmol/mL</option>
                    <option data="-3" value="nm">µmol/L</option>
                    <option data="-4" value="nm">µmol/dL</option>
                    <option data="-6" value="nm">µmol/mL</option>
                    <option data="0" value="nm">nmol/L</option>
                    <option data="-1" value="nm">nmol/dL</option>
                    <option data="-3" value="nm">nmol/mL</option>
                    <option data="3" value="nm">pmol/L</option>
                    <option data="2" value="nm">pmol/dL</option>
                    <option data="0" value="nm">pmol/mL</option>
                </select>
            </div>
        </div>
    </div>
</section>
<!-- ANDROSTENDION -->
<section id="and" class="hide hormons">
    <div class="row clear">
        <div class="left">
            <label>Wartość</label>
            <div>
                <input id="andVal" class="inputVal" type="text" value=""/>
            </div>
        </div>
        <div class="left">
            <label>Jednostka</label>
            <div>
                <select id="andUnit">
                    <option data="-6" value="nm">mmol/L</option>
                    <option data="-7" value="nm">mmol/dL</option>
                    <option data="-9" value="nm">mmol/mL</option>
                    <option data="-3" value="nm">µmol/L</option>
                    <option data="-4" value="nm">µmol/dL</option>
                    <option data="-6" value="nm">µmol/mL</option>
                    <option data="0" value="nm">nmol/L</option>
                    <option data="-1" value="nm">nmol/dL</option>
                    <option data="-3" value="nm">nmol/mL</option>
                    <option data="3" value="nm">pmol/L</option>
                    <option data="2" value="nm">pmol/dL</option>
                    <option data="0" value="nm">pmol/mL</option>
                    <option data="-8" value="ng">g/L</option>
                    <option data="-9" value="ng">g/dL</option>
                    <option data="-11" value="ng">g/mL</option>
                    <option data="-5" value="ng">mg/L</option>
                    <option data="-6" value="ng">mg/dL</option>
                    <option data="-8" value="ng">mg/mL</option>
                    <option data="-2" value="ng">µg/L</option>
                    <option data="-3" value="ng">µg/dL</option>
                    <option data="-5" value="ng">µg/mL</option>
                    <option data="1" value="ng">ng/L</option>
                    <option data="0" value="ng">ng/dL</option>
                    <option data="-2" value="ng">ng/mL</option>
                    <option data="4" value="ng">pg/L</option>
                    <option data="3" value="ng">pg/dL</option>
                    <option data="1" value="ng">pg/mL</option>
                </select>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="left">
            <label>Wartość</label>
            <div>
                <input id="andVal2" type="text" value="" disabled="disabled"/>
            </div>
        </div>
        <div class="left">
            <label>Jednostka</label>
            <div>
                <select id="andUnit2">
                    <option data="-8" value="ng">g/L</option>
                    <option data="-9" value="ng">g/dL</option>
                    <option data="-11" value="ng">g/mL</option>
                    <option data="-5" value="ng">mg/L</option>
                    <option data="-6" value="ng">mg/dL</option>
                    <option data="-8" value="ng">mg/mL</option>
                    <option data="-2" value="ng">µg/L</option>
                    <option data="-3" value="ng">µg/dL</option>
                    <option data="-5" value="ng">µg/mL</option>
                    <option data="1" value="ng">ng/L</option>
                    <option data="0" value="ng">ng/dL</option>
                    <option data="-2" value="ng">ng/mL</option>
                    <option data="4" value="ng">pg/L</option>
                    <option data="3" value="ng">pg/dL</option>
                    <option data="1" value="ng">pg/mL</option>
                    <option data="-6" value="nm">mmol/L</option>
                    <option data="-7" value="nm">mmol/dL</option>
                    <option data="-9" value="nm">mmol/mL</option>
                    <option data="-3" value="nm">µmol/L</option>
                    <option data="-4" value="nm">µmol/dL</option>
                    <option data="-6" value="nm">µmol/mL</option>
                    <option data="0" value="nm">nmol/L</option>
                    <option data="-1" value="nm">nmol/dL</option>
                    <option data="-3" value="nm">nmol/mL</option>
                    <option data="3" value="nm">pmol/L</option>
                    <option data="2" value="nm">pmol/dL</option>
                    <option data="0" value="nm">pmol/mL</option>
                </select>
            </div>
        </div>
    </div>
</section>
<!-- 17–α-OH-PROGESTERON -->
<section id="a17" class="hide hormons">
    <div class="row clear">
        <div class="left">
            <label>Wartość</label>
            <div>
                <input id="a17Val" class="inputVal" type="text" value=""/>
            </div>
        </div>
        <div class="left">
            <label>Jednostka</label>
            <div>
                <select id="a17Unit">
                    <option data="-6" value="nm">mmol/L</option>
                    <option data="-7" value="nm">mmol/dL</option>
                    <option data="-9" value="nm">mmol/mL</option>
                    <option data="-3" value="nm">µmol/L</option>
                    <option data="-4" value="nm">µmol/dL</option>
                    <option data="-6" value="nm">µmol/mL</option>
                    <option data="0" value="nm">nmol/L</option>
                    <option data="-1" value="nm">nmol/dL</option>
                    <option data="-3" value="nm">nmol/mL</option>
                    <option data="3" value="nm">pmol/L</option>
                    <option data="2" value="nm">pmol/dL</option>
                    <option data="0" value="nm">pmol/mL</option>
                    <option data="-6" value="ng">g/L</option>
                    <option data="-7" value="ng">g/dL</option>
                    <option data="-9" value="ng">g/mL</option>
                    <option data="-3" value="ng">mg/L</option>
                    <option data="-4" value="ng">mg/dL</option>
                    <option data="-6" value="ng">mg/mL</option>
                    <option data="0" value="ng">µg/L</option>
                    <option data="-1" value="ng">µg/dL</option>
                    <option data="-3" value="ng">µg/mL</option>
                    <option data="3" value="ng">ng/L</option>
                    <option data="2" value="ng">ng/dL</option>
                    <option data="0" value="ng">ng/mL</option>
                    <option data="6" value="ng">pg/L</option>
                    <option data="5" value="ng">pg/dL</option>
                    <option data="3" value="ng">pg/mL</option>
                </select>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="left">
            <label>Wartość</label>
            <div>
                <input id="a17Val2" type="text" value="" disabled="disabled"/>
            </div>
        </div>
        <div class="left">
            <label>Jednostka</label>
            <div>
                <select id="a17Unit2">
                    <option data="-6" value="ng">g/L</option>
                    <option data="-7" value="ng">g/dL</option>
                    <option data="-9" value="ng">g/mL</option>
                    <option data="-3" value="ng">mg/L</option>
                    <option data="-4" value="ng">mg/dL</option>
                    <option data="-6" value="ng">mg/mL</option>
                    <option data="0" value="ng">µg/L</option>
                    <option data="-1" value="ng">µg/dL</option>
                    <option data="-3" value="ng">µg/mL</option>
                    <option data="3" value="ng">ng/L</option>
                    <option data="2" value="ng">ng/dL</option>
                    <option data="0" value="ng">ng/mL</option>
                    <option data="6" value="ng">pg/L</option>
                    <option data="5" value="ng">pg/dL</option>
                    <option data="3" value="ng">pg/mL</option>
                    <option data="-6" value="nm">mmol/L</option>
                    <option data="-7" value="nm">mmol/dL</option>
                    <option data="-9" value="nm">mmol/mL</option>
                    <option data="-3" value="nm">µmol/L</option>
                    <option data="-4" value="nm">µmol/dL</option>
                    <option data="-6" value="nm">µmol/mL</option>
                    <option data="0" value="nm">nmol/L</option>
                    <option data="-1" value="nm">nmol/dL</option>
                    <option data="-3" value="nm">nmol/mL</option>
                    <option data="3" value="nm">pmol/L</option>
                    <option data="2" value="nm">pmol/dL</option>
                    <option data="0" value="nm">pmol/mL</option>
                </select>
            </div>
        </div>
    </div>
</section>
<!-- ESTRON -->
<section id="esr" class="hide hormons">
    <div class="row clear">
        <div class="left">
            <label>Wartość</label>
            <div>
                <input id="esrVal" class="inputVal" type="text" value=""/>
            </div>
        </div>
        <div class="left">
            <label>Jednostka</label>
            <div>
                <select id="esrUnit">
                    <option data="-9" value="pm">mmol/L</option>
                    <option data="-10" value="pm">mmol/dL</option>
                    <option data="-12" value="pm">mmol/mL</option>
                    <option data="-6" value="pm">µmol/L</option>
                    <option data="-7" value="pm">µmol/dL</option>
                    <option data="-9" value="pm">µmol/mL</option>
                    <option data="-3" value="pm">nmol/L</option>
                    <option data="-4" value="pm">nmol/dL</option>
                    <option data="-6" value="pm">nmol/mL</option>
                    <option data="0" value="pm">pmol/L</option>
                    <option data="-1" value="pm">pmol/dL</option>
                    <option data="-3" value="pm">pmol/mL</option>
                    <option data="-8" value="ng">g/L</option>
                    <option data="-9" value="ng">g/dL</option>
                    <option data="-11" value="ng">g/mL</option>
                    <option data="-5" value="ng">mg/L</option>
                    <option data="-6" value="ng">mg/dL</option>
                    <option data="-8" value="ng">mg/mL</option>
                    <option data="-2" value="ng">µg/L</option>
                    <option data="-3" value="ng">µg/dL</option>
                    <option data="-5" value="ng">µg/mL</option>
                    <option data="1" value="ng">ng/L</option>
                    <option data="0" value="ng">ng/dL</option>
                    <option data="-2" value="ng">ng/mL</option>
                    <option data="4" value="ng">pg/L</option>
                    <option data="3" value="ng">pg/dL</option>
                    <option data="1" value="ng">pg/mL</option>
                </select>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="left">
            <label>Wartość</label>
            <div>
                <input id="esrVal2" type="text" value="" disabled="disabled"/>
            </div>
        </div>
        <div class="left">
            <label>Jednostka</label>
            <div>
                <select id="esrUnit2">
                    <option data="-8" value="ng">g/L</option>
                    <option data="-9" value="ng">g/dL</option>
                    <option data="-11" value="ng">g/mL</option>
                    <option data="-5" value="ng">mg/L</option>
                    <option data="-6" value="ng">mg/dL</option>
                    <option data="-8" value="ng">mg/mL</option>
                    <option data="-2" value="ng">µg/L</option>
                    <option data="-3" value="ng">µg/dL</option>
                    <option data="-5" value="ng">µg/mL</option>
                    <option data="1" value="ng">ng/L</option>
                    <option data="0" value="ng">ng/dL</option>
                    <option data="-2" value="ng">ng/mL</option>
                    <option data="4" value="ng">pg/L</option>
                    <option data="3" value="ng">pg/dL</option>
                    <option data="1" value="ng">pg/mL</option>
                    <option data="-9" value="pm">mmol/L</option>
                    <option data="-10" value="pm">mmol/dL</option>
                    <option data="-12" value="pm">mmol/mL</option>
                    <option data="-6" value="pm">µmol/L</option>
                    <option data="-7" value="pm">µmol/dL</option>
                    <option data="-9" value="pm">µmol/mL</option>
                    <option data="-3" value="pm">nmol/L</option>
                    <option data="-4" value="pm">nmol/dL</option>
                    <option data="-6" value="pm">nmol/mL</option>
                    <option data="0" value="pm">pmol/L</option>
                    <option data="-1" value="pm">pmol/dL</option>
                    <option data="-3" value="pm">pmol/mL</option>
                </select>
            </div>
        </div>
    </div>
</section>