<?php

/*
* To change this license header, choose License Headers in Project Properties.
* To change this template file, choose Tools | Templates
* and open the template in the editor.
*/

/**
* Description of home_controller
*
* @author Cristhian
*/
View::template('home');
Load::models(
    'formato',
    'muestra',
    'lugartomamuestra',
    'tipoensayo',
    'tempformatotipoensayo',
    'tipomuestra',
        'tomadormuestraaccion',
        'cliente',
        'tipomunicipio',
        'tipodepartamento'
        
);

class HomeController extends AppController
{
    public function before_filter()
    {
        if (!Auth::is_valid()) {
            Router::redirect('login/index');
        }
    }

    //put your code here
    function index()
    {
    }

    function formato($tipocliente_id)
    {
        
        try {
            
            $this->tipocliente_id=$tipocliente_id;
            
            //el que viene
            $this->formato_id = '0';
            $this->escondergrabar=false;
           // $this->tipocliente_id = '0';

            //criferlo
            $xform = new Formato();
            $anio = date("Y");
            $xdato = $xform->maximum("codigoinformesecuencial", "conditions: codigoinformeano = '" . $anio . "'") + 1;
            $this->codigoinforme = "LAT ".$anio."-".$xdato;

            //campos
            $x7 = Input::post('fechaemision');
            $x8 = Input::post('observaciones');

            if (Input::hasPost('cliente')) {
              //combos
              //$x2 = Input::post('tipocliente');
              $x3 = Input::post('lugartomamuestra');
              $x4 = Input::post('empresatomadormuestra');
              $x5 = Input::post('usuario');
              $x6 = Input::post('cliente');
              

              if($tipocliente_id == 2){//externo
                  
                  $formato                           = new Formato();
                  $formato->tomadorexterno           = Input::post("nuevoTomadorMuestra");
                  $formato->estado                   = '0';
                  $formato->fechaemision             = $x7;
                  $formato->tipocliente_id           = $_POST['tipocliente_id'];
                  //$formato->tomadormuestra_id        = $tomadormuestra->id;
                  $formato->observaciones            = $x8;
                  $formato->empresatomadormuestra_id = $tipocliente_id;
                  $formato->lugartomamuestra      = $_POST['lugartomamuestra'];
                  $formato->cliente_id               = $x6['cliente_id'];
                  $formato->codigoinformeano         =  date('Y');
                  $formato->codigoinformeleyenda     = "LAT";
                  $formato->codigoinformesecuencial  = $formato->maximum("codigoinformesecuencial", "conditions: codigoinformeano = '" . $formato->codigoinformeano . "'") + 1;

                if ($formato->save()) {
                  $this->formato_id     = $formato->id;
                  $this->tipocliente_id = $formato->getCliente()->tipocliente_id;
                  Flash::info('Datos grabados correctamente, proceda a crear muestras');
                  $this->escondergrabar=true;
                } else {
                  Flash::error('Ups!! hay un error, intente nuevamente');
                }
                 
              }else{//empopasto


                $formato                           = new Formato();
                $formato->estado                   = '0';
                $formato->fechaemision             = $x7;
                $formato->tipocliente_id           = $_POST['tipocliente_id'];
                $formato->usuario_id        = $x5['usuario_id'];
                $formato->observaciones            = $x8;
                $formato->empresatomadormuestra_id = $tipocliente_id;
                $formato->lugartomamuestra      = $_POST['lugartomamuestra'];
                $formato->cliente_id               = $x6['cliente_id'];
                $formato->codigoinformeano         =  date('Y');
                $formato->codigoinformeleyenda     = "LAT";
                $formato->codigoinformesecuencial  = $formato->maximum("codigoinformesecuencial", "conditions: codigoinformeano = '" . $formato->codigoinformeano . "'") + 1;

                if ($formato->save()) {
                  $this->formato_id     = $formato->id;
                  $this->tipocliente_id = $formato->getCliente()->tipocliente_id;
                  Flash::info('Datos grabados correctamente, proceda a crear muestras');
                   $this->escondergrabar=true;
                } else {
                  Flash::error('Ups!! hay un error, intente nuevamente');
                }

              }


            }
            
        } catch (Exception $exc) {
              Flash::error('Lo sentimos ha ocurrido un error: '.$exc->getTraceAsString());
              Router::redirect("/home/cabecera");
        }

        
    }
    
     function formato_modificar($formato_id)
    {
         
         $this->for = new Formato();
         $this->for = $this->for->find_first($formato_id);
        
        try {
            
            $this->tipocliente_id=$this->for->tipocliente_id;
            
            //el que viene
            $this->formato_id = '0';
            $this->escondergrabar=false;
           // $this->tipocliente_id = '0';

            //criferlo
            $xform = new Formato();
            $anio = date("Y");
            $xdato = $xform->maximum("codigoinformesecuencial", "conditions: codigoinformeano = '" . $anio . "'") + 1;
            $this->codigoinforme = "LAT ".$anio."-".$xdato;

            //campos
            $x7 = Input::post('fechaemision');
            $x8 = Input::post('observaciones');

            if (Input::hasPost('cliente')) {
              //combos
              //$x2 = Input::post('tipocliente');
              $x3 = Input::post('lugartomamuestra');
              $x4 = Input::post('empresatomadormuestra');
              $x5 = Input::post('usuario');
              $x6 = Input::post('cliente');
              

              if($this->for->tipocliente_id == 2){//externo
                  
                  $formato                           = new Formato();
                  $formato = $formato->find_first($formato_id);
                  $formato->tomadorexterno           = Input::post("nuevoTomadorMuestra");                 
                  $formato->fechaemision             = $x7;
                  $formato->tipocliente_id           = $_POST['tipocliente_id'];
                  //$formato->tomadormuestra_id        = $tomadormuestra->id;
                  $formato->observaciones            = $x8;
                  $formato->empresatomadormuestra_id = $this->for->tipocliente_id;
                  $formato->lugartomamuestra      = $x3;
                  $formato->cliente_id               = $x6['cliente_id'];
                  $formato->codigoinformeano         =  date('Y');
                  $formato->codigoinformeleyenda     = "LAT";
                  $formato->codigoinformesecuencial  = $formato->maximum("codigoinformesecuencial", "conditions: codigoinformeano = '" . $formato->codigoinformeano . "'") + 1;

                if ($formato->update()) {
                  $this->formato_id     = $formato->id;
                  $this->tipocliente_id = $formato->getCliente()->tipocliente_id;
                  Flash::info('Datos actualizados correctamente');
                  $this->escondergrabar=true;
                } else {
                  Flash::error('Ups!! hay un error, intente nuevamente');
                }
                 
              }else{//empopasto


                $formato                           = new Formato();
                $formato = $formato->find_first($formato_id);                
                $formato->fechaemision             = $x7;
                $formato->tipocliente_id           = $_POST['tipocliente_id'];
                $formato->usuario_id        = $x5['usuario_id'];
                $formato->observaciones            = $x8;
                $formato->empresatomadormuestra_id = $this->for->tipocliente_id;
                $formato->lugartomamuestra      = $x3;
                $formato->cliente_id               = $x6['cliente_id'];
                $formato->codigoinformeano         =  date('Y');
                $formato->codigoinformeleyenda     = "LAT";
                $formato->codigoinformesecuencial  = $formato->maximum("codigoinformesecuencial", "conditions: codigoinformeano = '" . $formato->codigoinformeano . "'") + 1;

                if ($formato->update()) {
                  $this->formato_id     = $formato->id;
                  $this->tipocliente_id = $formato->getCliente()->tipocliente_id;
                  Flash::info('Datos actualizados correctamente');
                   $this->escondergrabar=true;
                } else {
                  Flash::error('Ups!! hay un error, intente nuevamente');
                }

              }


            }
            
        } catch (Exception $exc) {
              Flash::error('Lo sentimos ha ocurrido un error: '.$exc->getTraceAsString());
              Router::redirect("/home/cabecera");
        }

        
    }

    function cabecerag($id)
    {
      $user = Load::model('usuario')->find(Session::get('usuario_id'));

      if ($user->tipousuario_id == 1) {
          Router::redirect("home/seltipoensayo/$id");
      } else {
          Router::redirect("formato/lista");
      }

    }

    function seleccionarUsuario()   
    {        
        if(Input::hasPost("tipocliente")){
            $x = Input::post("tipocliente");
            $tipoc = $x["tipocliente_id"];
            Router::redirect("home/formato/$tipoc");
        }
    }

    function dartipomuestra()
    {
        View::template(null);
        $muestra = new Tipomuestra();
        $arr = array();
        $arr = $muestra->find();
        $this->res_ = json_encode($arr);
    }

    function darlugartomamuestra()
    {
        header('Access-Control-Allow-Origin: *');
        View::template(null);
        $lugar = new Lugartomamuestra();
        $arr = array();
        $arr = $lugar->find();

        $this->res_ = json_encode($arr);
    }

    /*     * *
    * Selecciona el tipo de ensayo
    * ej. acidez alcalinidad total, aluminio residual
    */

    function seltipoensayo($formato_id)
    {
        $tipensayo        = new Tipoensayo();
        $this->arr        = $tipensayo->find("id!=49 and id!=50 and id!=23 and id!=9 and id!=30");
        $this->formato_id = $formato_id;
    }

    function datos()
    {
        //se graba los datos de los tipo parametro o tipo ensayo que es lo mismo
        //se usa para poder grabar el temporal
        $numero2 = count($_POST);
        $tags2 = array_keys($_POST); // obtiene los nombres de las varibles
        $valores2 = array_values($_POST); // obtiene los valores de las varibles
        $formato_id = $valores2[0];

        $formato = Load::model('formato')->find($formato_id);

        for ($i = 1; $i < $numero2; $i++) {
          $temp                = new Tempformatotipoensayo();
          $temp->formato_id    = $formato_id;
          $temp->tipoensayo_id = $valores2[$i];
          $temp->save();
        }

        $formato->estado = 1;
        $formato->save();

        //Flash::info('Datos grabados correctamente');
        //ahora grabamos los datos temporales que soportan los datos
        Router::redirect("formato/index/$formato_id");
    }

    /*     * *
    * memoria de calculo de la grilla
    */

    function memoria()
    {
    }

    function grabarMuestra()
    {
        View::template(null);

        $muestra = new Muestra();
        $muestra->tomamuestra_fecha      = $_POST['tomamuestra_fecha'];
        $muestra->tomamuestra_hora       = $_POST['tomamuestra_hora'];
        $muestra->recepcionmuestra_fecha = $_POST['recepcionmuestra_fecha'];
        $muestra->recepcionmuestra_hora  = $_POST['recepcionmuestra_hora'];
        $muestra->tipomatrizanalizada_id = $_POST['tipomatrizanalizada_id'];
        $muestra->tipomuestra_id         = $_POST['tipomuestra_id'];
        $muestra->codigomuestra          = $_POST['codigomuestra'];
        $muestra->lugartomamuestra_id    = $_POST['lugarmuestra_id'];
        $muestra->formato_id             = $_POST['formato_id'];

        if ($muestra->save()) {

          $res = array('estado' => 'exito');
        } else {
          $res = array('estado' => 'fracaso');
        }

        $this->res_ = json_encode($res);
    }

    public function filtrar_clientes()
    {
      $nombre = $_POST["nombre"];
      $this->clientes = Load::model('cliente')->find("nombre LIKE '%$nombre%' and activo=1");

      foreach ($this->clientes as $cli) {
        $cli->value        = $cli->id;
        $cli->label        = $cli->nombre;
        $cli->municipio    = $cli->getTipomunicipio();
        $cli->departamento = $cli->municipio->getTipodepartamento();

        if ($cli->tipocliente_id == 1) {
          $cli->direcciones = Load::model('lugartomamuestra')->find("activo=1");
        } else {
          $cli->direcciones = array($cli->direccion);
        }
      }

      View::template(null);
    }
    
    function accion_usuarios($formato_id){
        $this->arr = array();
        $rel = new Tomadormuestraaccion();
        $this->arr = $rel->find("formato_id=".$formato_id);
        $this->formato_id = $formato_id;
        
        if(Input::hasPost("usuario")){
           
            $x = Input::post("usuario");
            $y = Input::post("tipoaccion");
            
            $rel = new Tomadormuestraaccion();
            $rel->usuario_id=$x["usuario_id"];
            $rel->tipoaccion_id=$y["tipoaccion_id"];
            $rel->formato_id=$formato_id;
            $rel->save();
             Flash::info("Agregado correctamente");
            $this->arr = $rel->find("formato_id=".$formato_id);
        }
    }
    
    function accion_usuarios_eliminar($formato_id,$id){
         $rel = new Tomadormuestraaccion();
         $rel->delete($id);
         Router::redirect("home/accion_usuarios/$formato_id");
    }
}
