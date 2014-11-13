<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of polishDate
 *
 * @author Tomek
 */
class polishDate {
        
    /**
     * Change Date to format 24 stycznia 2014
     */
    public static function changeDate1($date){
        $MonthEN = array('January','February','March','April','May','June','July','August','September','October','November','December');
        $MonthPL = array('Styczeń','Luty','Marzec','Kwiecień','Maj','Czerwiec','Lipiec','Sierpień','Wrzesień','Październik','Listopad','Grudzień');
        
        return str_replace($MonthEN, $MonthPL,date('d F Y', strtotime($date)));
    }
}

?>
