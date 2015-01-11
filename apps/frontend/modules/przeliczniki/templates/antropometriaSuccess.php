<header>
    <h1><?= $pageContext[0]->getTitle() ?></h1>
</header>
<section class="top">
    <?= $pageContext[0]->getContext(ESC_RAW) ?>
</section>
<section>
    <?= $pageContext[1]->getContext(ESC_RAW) ?>
</section>
<section class="hormons">    
    <div class="row marginT10">
        <div class="left">
            <label>Waga [kg]</label>
            <div>
                <input id="wagaVal" class="inputVal" type="text" value=""/>
            </div>
        </div>
        <div class="left">
            <label>Obwód w talii [cm]</label>
            <div>
                <input id="taliaVal" class="inputVal" type="text" value=""/>
            </div>
        </div>

    </div>
    <div class="row marginT10">
        <div class="left">
            <label>Wiek [lata]</label>
            <div>
                <select id="lataUnit">
                    <option value="1">0 - 5 lat</option>
                    <option value="2">6 - 10 lat</option>
                    <option value="3">11 - 15 lat</option>
                    <option value="4">16 - 20 lat</option>
                    <option value="5">21 - 25 lat</option>
                    <option value="6">26 - 30 lat</option>
                    <option value="7">31 - 35 lat</option>
                    <option value="8">36 - 40 lat</option>
                    <option value="9">41 - 45 lat</option>
                    <option value="10">46 - 50 lat</option>
                    <option value="11">51 - 55 lat</option>
                    <option value="12">56 - 60 lat</option>
                    <option value="13">61 - 65 lat</option>
                    <option value="14">66 - 70 lat</option>
                    <option value="15">71 - 75 lat</option>
                    <option value="16">76 - 80 lat</option>
                    <option value="17">81 - 85 lat</option>
                    <option value="18">86 - powyżej lat</option>
                </select>
            </div>
        </div>
    </div>
    <div class="row clear">
        <div class="left">
            <label>Wzrost [cm]</label>
            <div>
                <input id="wzrostVal" type="text" value="" />
            </div>
        </div>
        <div class="left">
            <label>Obwód w biodrach [cm]</label>
            <div>
                <input id="biodraVal" type="text" value="" />
            </div>
        </div>
    </div>
    <div class="row">
        <div class="left">
            <label>Płeć</label>
            <div>
                <select id="plecUnit">
                    <option value="f">żeńska</option>
                    <option value="m">męska</option>
                </select>
            </div>
        </div>
    </div>
    <div class="row clear">
        <div class="left">
            <label>Stężenie kreatyniny</label>
            <div>
                <input id="kreatyninaVal" type="text" value="" />
            </div>
        </div>
        <div class="left">
            <label>Jednostka</label>
            <div>
                <select id="kreatyninaUnit">
                    <option value="mg">mg/dL</option>
                </select>
            </div>
        </div>
    </div>
    <div class="row clear">
        <button id="antropometriaCal" type="submit">oblicz</button>
    </div>
    <div class="clearfix"></div>
    <table id="antropometriaResult" class="tabelResultDescription hide">
        <tr>
            <th>Opis</th>
            <th>Wyniki</th>
        </tr>
        <tr>
            <td width="35%">Powierzchnia ciała (Mosteller)</td>
            <td width="65%"><span id="mosteller"></span> m<sup>2</sup></td>
        </tr>
        <tr>
            <td width="35%">Indeks masy ciała BMI</td>
            <td width="65%"><span id="bmi"></span> kg / m<sup>2</sup></td>
        </tr>
        <tr>
            <td width="35%">Idealna masa ciała wynosi (Lorenz)</td>
            <td width="65%"><span id="lorenz"></span> kg</td>
        </tr>
        <tr>
            <td width="35%">Beztłuszczowa masa ciała</td>
            <td width="65%"><span id="bmc"></span> kg</td>
        </tr>
        <tr>
            <td width="35%">Waga należna (Tatoń)</td>
            <td width="65%"><span id="taton"></span> </td>
        </tr>
        <tr>
            <td width="35%">Obwód talia / biodro (WHR)</td>
            <td width="65%"><span id="whr"></span></td>
        </tr>
        <tr>
            <td width="35%">Talia / wzrost (WHtR)</td>
            <td width="65%">
                <span id="whtr"></span><br />
                &GreaterEqual; 0,52 - ryzyko rozwoju cukrzycy typu 2<br />
                &GreaterEqual; 0,55 - wskaźnik ryzyka rozwoju nadciśnienia
            </td>
        </tr>
        <tr>
            <td width="35%">Klirens kreatyniny (e GFR)</td>
            <td width="65%"><span id="kre"></span> mL/min</td>
        </tr>
        <tr>
            <td width="35%">Podstawowa przemiana materii (BMR)</td>
            <td width="65%"><span id="bmr"></span> kcal/dzień</td>
        </tr>
    </table>
</section>