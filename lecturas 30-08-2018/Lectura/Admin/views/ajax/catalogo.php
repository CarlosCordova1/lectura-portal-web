<?php 
if($data1){
  ?> 

           
  <ul class="nav nav-tabs">
    <!--<li class="active"><a    href="#home">Asignar</a></li>-->

<li class="dropdown active"><a   class="dropdown-toggle"  data-toggle="dropdown" href="#">Catálogo<span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li id="r-reporte1111511"><a data-toggle="tab" href="#Catalogo">Giro Comercial</a></li>
          <li id="r-reporte11f11df1"><a data-toggle="tab" href="#Catalogo">Estatus del cliente</a></li>
          <li id="r-reporte11f1s11"><a data-toggle="tab" href="#Catalogo">Metodo de lectura</a></li>
          <li id="r-reporte111f111"><a data-toggle="tab" href="#Catalogo">Tipo de uso</a></li>
          <li id="r-reporte111f11"><a data-toggle="tab" href="#Catalogo">Anomalia del medidor</a></li>
         <!-- <li id="r-Asignanada"><a data-toggle="tab" href="#home">Asignacion</a></li>-->
            </ul>
	 </li>

    <!--<li><a data-toggle="tab" id="rutalocal" href="#menu1">Crear ruta local</a></li>-->

<li class="dropdown"><a   class="dropdown-toggle"  data-toggle="dropdown" href="#">otro Catálogo<span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li id="rutalocalCrear--"><a data-toggle="tab" href="#menu1otroCatalogo">otro Catálogo</a></li>
         <!-- <li id="rutalocalGestionar"><a data-toggle="tab" href="#menu1">Gestion</a></li>-->
            </ul>
	 </li>
    <li><a data-toggle="tab" href="#menu2otroCatalogo">Estatus</a></li>
 </ul>

  <div class="tab-content">
    <div id="Catalogo" class="tab-pane fade in active"> 
     <div id="CatalogoLoadMenu1">
    </div> 
       
   </div>
    <div id="menu1otroCatalogo" class="tab-pane fade">
     <div id="RutaLocalLoad"></div>
    </div>
    <div id="menu2otroCatalogo" class="tab-pane fade">
      <h3>Estatus</h3>
      <p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
    </div>
    
  </div>
 
<script type="text/javascript">
  $(document).ready(function(e) {
    //$('.listTableUsuarios').find('table').dataTable();
     LoadCatalogo();
$("#r-reporte").click(function(event) {
  // RutaLoadAsignar();
});
$("#r-Asignanada").click(function(event) {
   //RutaLoadAsignada();
});


$("#rutalocalCrear").click(function(event) {
   //RutaLocalLoad();
});
$("#rutalocalGestionar").click(function(event) {
   //RutaLocalLoadGestionar();
});


  });
function LoadCatalogo(){
   $.ajax({
      url : AjaxURL(),
    data : { action : "loadtemplateCatalogoMenu1", },
    type : 'POST',
     dataType : 'html',
     beforeSend : function(xhr, status) {
     $("#CatalogoLoadMenu1").html(gifLoad());
      
    },
     success : function(html) {
        $("#CatalogoLoadMenu1").html(html); 

    },
 
    error : function(xhr, status) {
      alertify.alert('Disculpe, existió un problema al mostrar la pagina de catálogo opcion 1');
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