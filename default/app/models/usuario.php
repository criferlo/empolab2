<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of usuario
 *
 * @author Cristhian
 */
class Usuario extends ActiveRecord{
    //put your code here
    
    function getUsuarioTomador(){
        return $this->find("estomador='S'");
    }
}
