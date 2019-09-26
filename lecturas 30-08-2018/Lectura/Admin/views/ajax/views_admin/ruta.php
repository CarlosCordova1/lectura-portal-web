<?php 
if($data1){
  ?> 


           
  <ul class="nav nav-tabs">
    <!--<li class="active"><a    href="#home">Asignar</a></li>-->

<li class="dropdown active"><a   class="dropdown-toggle"  data-toggle="dropdown" href="#">Ruta<span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li id="r-Asignar"><a data-toggle="tab" href="#home">Asignar ruta</a></li>
          <!--<li id="r-Asignanada"><a data-toggle="tab" href="#home">Asignacion</a></li>-->
            </ul>
	 </li>

    <!--<li><a data-toggle="tab" id="rutalocal" href="#menu1">Crear ruta local</a></li>-->

<li class="dropdown"><a   class="dropdown-toggle"  data-toggle="dropdown" href="#">Ruta local (Bitácora)<span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li id="rutalocalCrear"><a data-toggle="tab" href="#menu1">Crear/Gestion</a></li>
          <li id="rutalocalOrdenar"><a data-toggle="tab" href="#menu1">Ordenar Secuencia</a></li>
            </ul>
	 </li>
  <!--  <li><a data-toggle="tab" href="#menu2">Estatus</a></li>-->
 </ul>

  <div class="tab-content">
    <div id="home" class="tab-pane fade in active"> 
     <div id="RutaLoadAsignar">
    </div> 
       
   </div>
    <div id="menu1" class="tab-pane fade">
     <div id="RutaLocalLoad"></div>
    </div>
   <!-- <div id="menu2" class="tab-pane fade">
      <h3>Estatus</h3>
      <p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
    </div>-->
    
  </div>
 
<script type="text/javascript">
  $(document).ready(function(e) {
    //$('.listTableUsuarios').find('table').dataTable();
     RutaLoadAsignar();
$("#r-Asignar").click(function(event) {
   RutaLoadAsignar();
});
/*/
$("#r-Asignanada").click(function(event) {
   RutaLoadAsignada();
});
/*/

$("#rutalocalCrear").click(function(event) {
   RutaLocalLoad();
});
$("#rutalocalGestionar").click(function(event) {
   RutaLocalLoadGestionar();
});
$("#rutalocalOrdenar").click(function(event) {
   RutaLocalOrdenarLoad();
});


  });
function RutaLoadAsignar(){
   $.ajax({
      url : AjaxURL(),
    data : { action : "loadtemplateAsignarRuta", },
    type : 'POST',
     dataType : 'html',
     beforeSend : function(xhr, status) {
     $("#RutaLoadAsignar").html(gifLoad());
      
    },
     success : function(html) {
        $("#RutaLoadAsignar").html(html); 

    },
 
    error : function(xhr, status) {
      alertify.alert('Disculpe, existió un problema al mostrar la pagina de asignar ruta');
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
function RutaLocalOrdenarLoad(){
   $.ajax({
      url : AjaxURL(),
    data : { action : "loadtemplateRutaLocalOrdenar", },
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

</script>
       
<?php 
}
else{
  echo "Acceso no permitido...";
}
?>  