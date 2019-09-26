<?php 
if($data1){
  //echo "odt -> "+$odt;
  ?>  
   
 <ul class="nav nav-tabs">
    <!--<li class="active"><a    href="#home">Asignar</a></li>-->

<li class="dropdown active"><a   class="dropdown-toggle"  data-toggle="dropdown" href="#">Mas detalles<span class="caret"></span></a>
        <ul class="dropdown-menu">
         <!-- <li id="r-mobile-agregar"><a data-toggle="tab" href="#mobileAgregarGestionar">Agregar</a></li>-->
          <li id="r-detalle-gestionar"><a data-toggle="tab" href="#detalleAgregarGestionar">Gestionar</a></li>
            </ul>
   </li>

  <?php /* ?>  <!--<li><a data-toggle="tab" id="rutalocal" href="#menu1">Crear ruta local</a></li>-->

<li class="dropdown"><a   class="dropdown-toggle"  data-toggle="dropdown" href="#">otro<span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li id="rutalocalCrear--"><a data-toggle="tab" href="#menu1otro">otro</a></li>
         <!-- <li id="rutalocalGestionar"><a data-toggle="tab" href="#menu1">Gestion</a></li>-->
            </ul>
   </li>
    <li><a data-toggle="tab" href="#menu2otro">Estatus</a></li> <?php */ ?>
 </ul>

  <div class="tab-content">
    <div   class="tab-pane fade in active"> 
     <div id="detalleAgregarGestionar">
    
    </div> 
       
   </div>
   <!-- <div id="menu1otro" class="tab-pane fade">
     <div id="Reporte"> sdas dsad </div>
    </div>
    <div id="menu2otro" class="tab-pane fade">
      <h3>Estatus</h3>
      <p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
    </div>-->
    
  </div>


<script type="text/javascript">
  $(document).ready(function($) {
         $('[data-toggle="tooltip"]').tooltip();
 //Showagregarmobile();
  ShowGestionarLotes();

$("#r-detalle-agregar").click(function(event) {
  // Showagregarmobile();
});
$("#r-detalle-gestionar").click(function(event) {
   ShowGestionarLotes();
});

  });
  //-----------------------------------------------------------------------------------------
function Showagregarmobile(){
   $.ajax({
      url : AjaxURL(),
    data : { action : "loadtemplateEditMobile", },
    type : 'POST',
     dataType : 'html',
     beforeSend : function(xhr, status) {
     $("#detalleAgregarGestionar").html(gifLoad());
      
    },
     success : function(html) {
        $("#detalleAgregarGestionar").html(html); 
    },
 
    error : function(xhr, status) {
      alertify.alert('Disculpe, existió un problema al mostrar la pagina de edicion mobile');
      // console.log(status);
    },
       complete : function(xhr, status) {
        //alert('Petición realizada');
       // console.log(status);
    }
});

}
//----------------------------------------------------------------------------------------
function ShowGestionarLotes(){
   $.ajax({
      url : AjaxURL(),
    data : { action : "loadtemplateGestionLote", odt:<?php echo $odt?>, lote:"<?php echo $lote?>", nvruta:"<?php echo $nvruta?>", lecturista:"<?php echo $lecturista?>"   },
    type : 'POST',
     dataType : 'html',
     beforeSend : function(xhr, status) {
     $("#detalleAgregarGestionar").html(gifLoad());
      
    },
     success : function(html) {
        $("#detalleAgregarGestionar").html(html); 
    },
 
    error : function(xhr, status) {
      alertify.alert('Disculpe, existió un problema al mostrar la pagina de gestion de lotes');
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