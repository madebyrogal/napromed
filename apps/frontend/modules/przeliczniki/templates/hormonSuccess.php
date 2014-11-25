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
            <option value="0">WYBIERZ HORMON ...</option>
            <option value="17a">17–α-OH-PROGESTERON</option>
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
                <input id="estVal" type="text" value=""/>
            </div>
        </div>
        <div class="left">
            <label>Jednostka</label>
            <div>
                <select id="estUnit">
                    <option value="pmol">pmol/L</option>
                    <option value="pg">pg/mL</option>
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
                    <option value="pg">pg/mL</option>
                    <option value="pmol">pmol/L</option>
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
                <input id="proVal" type="text" value=""/>
            </div>
        </div>
        <div class="left">
            <label>Jednostka</label>
            <div>
                <select id="proUnit">
                    <option value="nmol">nmol/L</option>
                    <option value="ng">1µg/L (ng/mL)</option>
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
                    <option value="ng">1µg/L (ng/mL)</option>
                    <option value="nmol">nmol/L</option>
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
                <input id="tesVal" type="text" value=""/>
            </div>
        </div>
        <div class="left">
            <label>Jednostka</label>
            <div>
                <select id="tesUnit">
                    <option value="nmol">nmol/L</option>
                    <option value="ng">ng/dL</option>
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
                    <option value="ng">ng/dL</option>
                    <option value="nmol">nmol/L</option>
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
                <input id="prlVal" type="text" value=""/>
            </div>
        </div>
        <div class="left">
            <label>Jednostka</label>
            <div>
                <select id="prlUnit">
                    <option value="ng">µg/L (ng/mL)</option>
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
                    <option value="ng">µg/L (ng/mL)</option>
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
                <input id="insVal" type="text" value=""/>
            </div>
        </div>
        <div class="left">
            <label>Jednostka</label>
            <div>
                <select id="insUnit">
                    <option value="pm">pmol/L</option>
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
                    <option value="pm">pmol/L</option>
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
                <input id="gluVal" type="text" value=""/>
            </div>
        </div>
        <div class="left">
            <label>Jednostka</label>
            <div>
                <select id="gluUnit">
                    <option value="mm">mmol/L</option>
                    <option value="mg">mg/dL</option>
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
                    <option value="mg">mg/dL</option>
                    <option value="mm">mmol/L</option>
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
                <input id="dheVal" type="text" value=""/>
            </div>
        </div>
        <div class="left">
            <label>Jednostka</label>
            <div>
                <select id="dheUnit">
                    <option value="nm">nmol/L</option>
                    <option value="ng">µg/L (ng/mL)</option>
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
                    <option value="ng">µg/L (ng/mL)</option>
                    <option value="nm">nmol/L</option>
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
                <input id="andVal" type="text" value=""/>
            </div>
        </div>
        <div class="left">
            <label>Jednostka</label>
            <div>
                <select id="andUnit">
                    <option value="nm">nmol/L</option>
                    <option value="ng">ng/dL</option>
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
                    <option value="ng">ng/dL</option>
                    <option value="nm">nmol/L</option>
                </select>
            </div>
        </div>
    </div>
</section>
<!-- 17–α-OH-PROGESTERON -->
<section id="17a" class="hide hormons">
    <div class="row clear">
        <div class="left">
            <label>Wartość</label>
            <div>
                <input id="17aVal" type="text" value=""/>
            </div>
        </div>
        <div class="left">
            <label>Jednostka</label>
            <div>
                <select id="17aUnit">
                    <option value="nm">nmol/L</option>
                    <option value="ng">µg/L (ng/mL)</option>
                </select>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="left">
            <label>Wartość</label>
            <div>
                <input id="17aVal2" type="text" value="" disabled="disabled"/>
            </div>
        </div>
        <div class="left">
            <label>Jednostka</label>
            <div>
                <select id="17aUnit2">
                    <option value="ng">µg/L (ng/mL)</option>
                    <option value="nm">nmol/L</option>
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
                <input id="esrVal" type="text" value=""/>
            </div>
        </div>
        <div class="left">
            <label>Jednostka</label>
            <div>
                <select id="esrUnit">
                    <option value="pm">pmoI/L</option>
                    <option value="ng">ng/dL</option>
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
                    <option value="ng">ng/dL</option>
                    <option value="pm">pmoI/L</option>
                </select>
            </div>
        </div>
    </div>
</section>