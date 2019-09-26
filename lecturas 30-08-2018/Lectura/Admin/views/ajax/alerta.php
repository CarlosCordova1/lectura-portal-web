<?php 
if($data1){
  ?> 

           
  <ul class="nav nav-tabs">
    <!--<li class="active"><a    href="#home">Asignar</a></li>-->

<li class="dropdown active"><a   class="dropdown-toggle"  data-toggle="dropdown" href="#">Alerta<span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li id="r-reporte"><a data-toggle="tab" href="#Alerta">Crear</a></li>
          <li id="r-Asignanada"><a data-toggle="tab" href="#Alerta">Gestionar</a></li>
            </ul>
	 </li>

    <!--<li><a data-toggle="tab" id="rutalocal" href="#menu1">Crear ruta local</a></li>-->

<li class="dropdown"><a   class="dropdown-toggle"  data-toggle="dropdown" href="#">otra Alerta<span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li id="rutalocalCrear--"><a data-toggle="tab" href="#menu1otroAlerta">otro</a></li>
         <!-- <li id="rutalocalGestionar"><a data-toggle="tab" href="#menu1">Gestion</a></li>-->
            </ul>
	 </li>
    <li><a data-toggle="tab" href="#menu2otroAlerta">Estatus</a></li>
 </ul>

  <div class="tab-content">
    <div id="Alerta" class="tab-pane fade in active"> 
     <div id="alertaLoadMenu1">
    </div> 
       
   </div>
    <div id="menu1otroAlerta" class="tab-pane fade">
     <div id="RutaLocalLoad"></div>
    </div>
    <div id="menu2otroAlerta" class="tab-pane fade">
      <h3>Estatus</h3>
      <p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
    </div>
    
  </div>
 
<script type="text/javascript">
  $(document).ready(function(e) {
    //$('.listTableUsuarios').find('table').dataTable();
     RutaLoadAlerta();
$("#r-reporte").click(function(event) {
  // RutaLoadAsignar();
});
$("#r-Asignanada").click(function(event) {
   //RutaLoadAsignada();
});


$("#rutalocalCrear").click(function(event) {
   //LocalLoad();
});
$("#rutalocalGestionar").click(function(event) {
   //RutaLocalLoadGestionar();
});


  });
function RutaLoadAlerta(){
   $.ajax({
      url : AjaxURL(),
    data : { action : "loadtemplateAlertaMenu1", },
    type : 'POST',
     dataType : 'html',
     beforeSend : function(xhr, status) {
     $("#alertaLoadMenu1").html(gifLoad());
      
    },
     success : function(html) {
        $("#alertaLoadMenu1").html(html); 

    },
 
    error : function(xhr, status) {
      alertify.alert('Disculpe, existió un problema al mostrar la pagina de alerta opcion 1');
      // console.log(status);
    },
       complete : function(xhr, status) {
        //alert('Petición realizada');
       // console.log(status);
    }
});

}
//-----------------------------------------------------
function RutaLoadAsignada(){
   $.ajax({
      url : AjaxURL(),
    data : { action : "loadtemplateAsignadaRuta", },
    type : 'POST',
     dataType : 'html',
     beforeSend : function(xhr, status) {
     $("#RutaLoadAsignar").html(gifLoad());
      
    },
     success : function(html) {
        $("#RutaLoadAsignar").html(html); 

    },
 
    error : function(xhr, status) {
      alertify.alert('Disculpe, existió un problema al mostrar la pagina de ruta asignada');
      // console.log(status);
    },
       complete : function(xhr, status) {
        //alert('Petición realizada');
       // console.log(status);
    }
});

}
//-----------------------------------------------------
function RutaLocalLoad(){
   $.ajax({
      url : AjaxURL(),
    data : { action : "loadtemplateRutaLocal", },
    type : 'POST',
     dataType : 'html',
     beforeSend : function(xhr, status) {
     $("#RutaLocalLoad").html(gifLoad());
      
    },
     success : function(html) {
        $("#RutaLocalLoad").html(html); 

    },
 
    error : function(xhr, status) {
      alertify.alert('Disculpe, existió un problema al mostrar la pagina de ruta local');
      // console.log(status);
    },
       complete : function(xhr, status) {
        //alert('Petición realizada');
       // console.log(status);
    }
});

}
//-----------------------------------------------------
function RutaLocalLoadGestionar(){
   $.ajax({
      url : AjaxURL(),
    data : { action : "loadtemplateRutaLocalGestionar", },
    type : 'POST',
     dataType : 'html',
     beforeSend : function(xhr, status) {
     $("#RutaLocalLoad").html(gifLoad());
      
    },
     success : function(html) {
        $("#RutaLocalLoad").html(html); 

    },
 
    error : function(xhr, status) {
      alertify.alert('Disculpe, existió un problema al mostrar la pagina de ruta local gestionar');
      // console.log(status);
    },
       complete : function(xhr, status) {
        //alert('Petición realizada');
       // console.log(status);
    }
});

}

</script>
       
<?php 
}
else{
  echo "Acceso no permitido...";
}
?>  