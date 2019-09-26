
<!--<iframe src="https://www.google.com/maps/d/embed?mid=1TVahrg-Ewt8nuxCqHWFvCmLX3aQ" width="640" height="480"></iframe>-->
<?php
if (isset($details)) {
 
	?>


    <div class="page-content">
	<div class="row">
  <div class="col-sm-12">
  	 <div class="panel-group">
    <div class="panel panel-default">
      <div class="panel-heading"><h4></h4>

  <div class="row">
      <div class="col-sm-12">
      <nav class="navbar-right" role="navigation"> 
    <div class="btn-group">
<button type="button" class="btn btn-success  pull-right disabled " data-toggle="tooltip" title="Usuario Logueado" > 
<span class="badge  badge-info" style="    color: #5cb85c !important;  background-color: #fff !important;"><i class="fa fa-user-o" aria-hidden="true"></i></span> <?php echo $dat->permisos[0]->display_name;?> </button>
       </div>
        </nav>
</div>
</div><br>
			<div class="navbar" role="banner">
 
	                  <nav class="navbar-right" role="navigation">
	                 

      <div class="btn-group">
    
    <div class="btn-group">
     <button type="button" id="mymodalNewConvenio" class="btn btn-info dropdown-toggle" data-toggle="dropdown"  >
          <span data-toggle="tooltip" title="lecturista, mobile , ruta..." >Admin </span><i class="fa fa-plus-circle" aria-hidden="true"></i> <span class="caret"></span>
        </button>
        <ul class="dropdown-menu" role="menu">
            <?php /*?> <li><a href="#" data-toggle="modal" id="modalusarioopen" data-target="#myModal" >Lecturista <i class="fa fa-address-card-o" aria-hidden="true"></i></a>
             </li><<?php */?>
              <li><a href="#" id="modalmobileopen" data-toggle="modal" data-target="#myModalmobile" >Mobile <i class="fa fa-mobile" aria-hidden="true" style="font-size: 20px !important;"></i></a>
              </li>

        <li><a href="#"  id="modalRutaopen" data-toggle="modal" data-target="#myModalRuta" >Ruta <i class="fa fa-paper-plane-o" aria-hidden="true"></i></a>
        </li>
        <?php /*?> <li><a href="#"  id="myModalReporteOpen" data-toggle="modal" data-target="#myModalReporte" >Reporte <i class="fa fa-files-o" aria-hidden="true"></i></a>
        </li>
        <li><a href="#"  id="myModalCatalogoOpen" data-toggle="modal" data-target="#myModalCatalogo" >Catálogo <i class="fa fa-book" aria-hidden="true"></i></a>
        </li>
        <li><a href="#"  id="myModalAlertaOpen" data-toggle="modal" data-target="#myModalAlerta" >Alerta <i class="fa fa-bell-o" aria-hidden="true"></i></a>
        </li>
       
<?php */?>
      </ul>

</div>
<div class="btn-group">
      <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
      Configuracion <i class="fa fa-cogs" aria-hidden="true"></i> <span class="caret"></span></button>
      <ul class="dropdown-menu" role="menu">
      <?php /*?>  <li><a href="#" data-toggle="modal" data-target="#myModalLogin" >Iniciar Sesion <i class="fa fa-unlock"></i></a></li>
      <?php */?>
      
        <!--<li><a href="#" id="ActualizarData"  >Actualizar <i class="fa fa-refresh" aria-hidden="true"></i></a></li>-->
        <li><a href="#" id="logout">Cerrar Sesion <i class="fa fa-lock" aria-hidden="true"></i></a>
        </li>
      </ul>
    </div>

  </div>
	                    </nav>
	              </div>

    


      </div>
        <div class="panel-body">
        <div class="pull-right panel-options">
                <a href="#" data-rel="collapse" id="refreshTable" data-toggle="tooltip" title="Actualizar tabla"><i class="glyphicon glyphicon-refresh"></i></a>
                
              </div>
            <div class="listTable"></div>
          
          

      </div>


    
    </div>  
  </div>
  </div>


</div>
<script type="text/javascript">
window.onbeforeunload = function(event) {
    event.returnValue = "¿Cerrar la ventana?";  
}
if ($( window ).width()<=700 ) {
  //  alertify.error("Accion scroll");
    $(".listTable").addClass('pre-scrollable');
  }else{
    $(".listTable").removeClass('pre-scrollable');
  }


console.log('------------------------');
var permisosJSON=JSON.parse('<?php echo $this->permisos();?>');
var permisosApp=permisosJSON.permisos;
console.log(permisosApp);
  $(document).ready(function($) {

$( window ).resize(function() {
  //console.log('-------------scroll-----------');
  if ($( window ).width()<=700 ) {
  //  alertify.error("Accion scroll");
    $(".listTable").addClass('pre-scrollable');
  }else{
    $(".listTable").removeClass('pre-scrollable');
  }
  
});


 ShowUsuario_admin();
      $('[data-toggle="tooltip"]').tooltip();
  });


$("#pageContentRegistrado").on("click", "#modalusarioopen", function(){//Agraegar encuesta a cliente
 //var idEncuenta=$(this).data("encuestaid");
 //$("#nCliente").val("");
// $("#idEncuestaAddCli").val(idEncuenta);
 //alertify.success("id "+idEncuenta);
   // buscarCliente(cliente,idEncuenta);
   ShowloadUsuario();
   
});
$("#pageContentRegistrado").on("click", "#modalmobileopen", function(){//Agraegar encuesta a cliente
   ShowloadMobile();
   
});
$("#pageContentRegistrado").on("click", "#modalRutaopen", function(){//Agraegar encuesta a cliente
   ShowloadRuta();
   
});

$("#pageContentRegistrado").on("click", "#myModalReporteOpen", function(){//Agraegar encuesta a cliente
   ShowloadReporte();   
});
$("#pageContentRegistrado").on("click", "#myModalCatalogoOpen", function(){//Agraegar encuesta a cliente
   ShowloadCatalogo();   
});
$("#pageContentRegistrado").on("click", "#myModalAlertaOpen", function(){//Agraegar encuesta a cliente
   ShowloadAlerta();   
});


$("#pageContentRegistrado").on("click", "#ActualizarData", function(){//Agraegar encuesta a cliente
  alertify.confirm("¿Estas seguro de realizar esta accion?", function (e) {
        if (e) {
          alertify.success("Accion realizada");
          //data-toggle="modal" data-target="#myModalActualizar"
           $("#myModalActualizar").modal("show");
           Showloadactualizar();
            }
      else {
          alertify.error("Accion Cancelada");

        }
      });
  return false;
   
});

$("#pageContentRegistrado").on("click", ".verDetalles", function(){//ver preguntas
 var idodt=$(this).data("encuestaid");
 var lote=$(this).data("lote");
 var nvruta=$(this).data("nvruta");
 var lecturista=$(this).data("lecturista");

 //alertify.success("id "+idEncuenta);
    ShowloadMasdetalles(idodt,  lote,nvruta,lecturista  );
});
$("#pageContentRegistrado").on("click", ".enviarx7", function(){//ver preguntas
 var idodt=$(this).data("encuestaid");
 //alertify.success("id "+idodt);
    enviarx7data(idodt);
});


$("#pageContentRegistrado").on("click", ".editarLote", function(){//ver preguntas
 var idodt=$(this).data("encuestaid");
  var namelote=$(this).data("namelote")+"";
 
 //alertify.success("namelote  "+namelote);
  //  enviarx7data(idodt);
//alertify.prompt("¿Esta seguro de realizar esta acción?",namelote);
 alertify.prompt("<h3>Si esta seguro de realizar esta acción, inserte un nuevo lote</h3>", function (evt, value) {
 if (evt) {
   //alertify.success('Deacuerdo: ' + value);
    CambiarLoteFact(value,namelote);
 }
 else
 {
   alertify.error('Accion Cancelada');
 }
   
   

 }, namelote);

 
});



/*/$("#usuarioAdd").click(function(event) {
   ShowloadUsuario();
});/*/



//validar agregar encuesta a cliente
$("#pageContentRegistrado").on("click", ".agregarAcliente", function(){//Agraegar encuesta a cliente
 var idEncuenta=$(this).data("encuestaid");
 $("#nCliente").val("");
 $("#idEncuestaAddCli").val(idEncuenta);
 //alertify.success("id "+idEncuenta);
   // buscarCliente(cliente,idEncuenta);
});

$("#myModalAgregarAcliente").on("click", "#BtnAddCliente", function(){//boton agregar cliente
  console.log(permisosApp[0]['servicios']['cns']);
if(permisosApp[0]['servicios']['cns']['admin']==1){
//if(permisosApp[0].PuedeAsignarClienteAapp==1){
  var cliente= $("#nCliente").val().trim();
  var idEncuesta= $("#idEncuestaAddCli").val();
 alertify.confirm("¿Estas seguro de realizar esta accion?", function (e) {
        if (e) {
          buscaryAgregarCliente(cliente,idEncuesta);
            }
      else {
          alertify.error("Accion Cancelada");
        }
      });
      return false;
}
  else{
    alertify.alert("No tienes permisos para realizar esta accion");
    alertify.error("Accion Cancelada");
  }
  
  
});
//-----------------------------------------------------------------------------
function ShowloadUsuario(){
   $.ajax({
      url : AjaxURL(),
    data : { action : "loadtemplateusuario", },//cuando cargo plantillas no valido la disponiblidad del servicio ORA
    type : 'POST',
     dataType : 'html',
     beforeSend : function(xhr, status) {
     $("#loadAgregar").html(gifLoad());
      
    },
     success : function(html) {
        $("#loadAgregar").html(html); 
    },
 
    error : function(xhr, status) {
      alertify.alert('Disculpe, existió un problema al mostrar la pagina de Usuario');
      // console.log(status);
    },
       complete : function(xhr, status) {
        //alert('Petición realizada');
       // console.log(status);
    }
});

}

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function ShowloadMobile(){
   $.ajax({
      url : AjaxURL(),
    data : { action : "loadtemplatemobile", },//cuando cargo plantillas no valido la disponiblidad del servicio ORA
    type : 'POST',
     dataType : 'html',
     beforeSend : function(xhr, status) {
     $("#loadAgregarmobil").html(gifLoad());
      
    },
     success : function(html) {
        $("#loadAgregarmobil").html(html); 
    },
 
    error : function(xhr, status) {
      alertify.alert('Disculpe, existió un problema al mostrar la pagina de mobile');
      // console.log(status);
    },
       complete : function(xhr, status) {
        //alert('Petición realizada');
       // console.log(status);
    }
});

}
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function ShowloadRuta(){
   $.ajax({
      url : AjaxURL(),
    data : { action : "loadtemplateRuta", },//cuando cargo plantillas no valido la disponiblidad del servicio ORA
    type : 'POST',
     dataType : 'html',
     beforeSend : function(xhr, status) {
     $("#loadtemplateRuta").html(gifLoad());
      
    },
     success : function(html) {
        $("#loadtemplateRuta").html(html); 
    },
 
    error : function(xhr, status) {
      alertify.alert('Disculpe, existió un problema al mostrar la pagina de ruta');
      // console.log(status);
    },
       complete : function(xhr, status) {
        //alert('Petición realizada');
       // console.log(status);
    }
});

}
//-----------------------------------------------------------------------------
function ShowloadReporte(){
   $.ajax({
      url : AjaxURL(),
    data : { action : "loadtemplateReporte", },//cuando cargo plantillas no valido la disponiblidad del servicio ORA
    type : 'POST',
     dataType : 'html',
     beforeSend : function(xhr, status) {
     $("#loadtemplateReporte").html(gifLoad());
      
    },
     success : function(html) {
        $("#loadtemplateReporte").html(html); 
    },
 
    error : function(xhr, status) {
      alertify.alert('Disculpe, existió un problema al mostrar la pagina de reporte');
      // console.log(status);
    },
       complete : function(xhr, status) {
        //alert('Petición realizada');
       // console.log(status);
    }
});

}
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function ShowloadCatalogo(){
   $.ajax({
      url : AjaxURL(),
    data : { action : "loadtemplateCatalogo", },//cuando cargo plantillas no valido la disponiblidad del servicio ORA
    type : 'POST',
     dataType : 'html',
     beforeSend : function(xhr, status) {
     $("#loadtemplateCatalogo").html(gifLoad());
      
    },
     success : function(html) {
        $("#loadtemplateCatalogo").html(html); 
    },
 
    error : function(xhr, status) {
      alertify.alert('Disculpe, existió un problema al mostrar la pagina de catálogo');
      // console.log(status);
    },
       complete : function(xhr, status) {
        //alert('Petición realizada');
       // console.log(status);
    }
});

}
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function ShowloadAlerta(){
   $.ajax({
      url : AjaxURL(),
    data : { action : "loadtemplateAlerta", },//cuando cargo plantillas no valido la disponiblidad del servicio ORA
    type : 'POST',
     dataType : 'html',
     beforeSend : function(xhr, status) {
     $("#loadtemplateAlerta").html(gifLoad());
      
    },
     success : function(html) {
        $("#loadtemplateAlerta").html(html); 
    },
 
    error : function(xhr, status) {
      alertify.alert('Disculpe, existió un problema al mostrar la pagina de alerta');
      // console.log(status);
    },
       complete : function(xhr, status) {
        //alert('Petición realizada');
       // console.log(status);
    }
});

}
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function Showloadactualizar(){
   $.ajax({
      url : AjaxURL(),
    data : { action : "loadtemplateRuta", },//cuando cargo plantillas no valido la disponiblidad del servicio ORA
    type : 'POST',
     dataType : 'html',
     beforeSend : function(xhr, status) {
     $("#Actualizando").html(gifLoad());
      
    },
     success : function(html) {
       // $("#Actualizando").html(html); 
         $("#Actualizando").html(gifLoad());
    },
 
    error : function(xhr, status) {
       $("#Actualizando").html('Disculpe, existió un problema al actualizar');
      // console.log(status);
    },
       complete : function(xhr, status) {
        //$("#myModalActualizar").modal("hide");
    }
});

}
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function CambiarLoteFact(nuevodata,odt){
   $.ajax({
      url : AjaxURL(),
    data : { action : "CambiarLoteFact", nuevodata:nuevodata,odt:odt},//cuando cargo plantillas no valido la disponiblidad del servicio ORA
    type : 'POST',
     dataType : 'JSON',
     beforeSend : function(xhr, status) {
     //$("#MasdetallesLoad").html(gifLoad());
      
    },
     success : function(JSON) {
       // $("#MasdetallesLoad").html(html); 
      //   alertify.alert(JSON.response[0].msg);
       console.log(JSON);

       if (JSON.status==1) {
          if (JSON.response[0].status==1) {
            alertify.alert("<h3>"+JSON.response[0].msg+"</h3>");
          }else{
        alertify.error(JSON.response[0].msg);
         alertify.alert("<h3>"+JSON.response[0].msg+"</h3>");
          }

 
       }
       else{
        alertify.error(JSON.msg);
         alertify.alert("<h3>"+JSON.msg+"</h3>");
       }
    },
 
    error : function(xhr, status) {
      alertify.alert('Disculpe, existió un problema al enviar a X7');
      // console.log(status);
    },
       complete : function(xhr, status) {
        //alert('Petición realizada');
       // console.log(status);
    }
});

}
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function enviarx7data(odt){
   $.ajax({
      url : AjaxURL(),
    data : { action : "enviarAx7", odt:odt},//cuando cargo plantillas no valido la disponiblidad del servicio ORA
    type : 'POST',
     dataType : 'JSON',
     beforeSend : function(xhr, status) {
     //$("#MasdetallesLoad").html(gifLoad());
      
    },
     success : function(JSON) {
       // $("#MasdetallesLoad").html(html); 
       console.log(JSON);

       if (JSON.status==1) {
          if (JSON.response[0].status==1) {
            alertify.success(JSON.response[0].msg);
          }else{
alertify.error(JSON.response[0].msg);
          }

 
       }
       else{
        alertify.error(JSON.msg);
       }
    },
 
    error : function(xhr, status) {
      alertify.alert('Disculpe, existió un problema al enviar a X7');
      // console.log(status);
    },
       complete : function(xhr, status) {
        //alert('Petición realizada');
       // console.log(status);
    }
});

}
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function ShowloadMasdetalles(odt ,  lote,nvruta,lecturista){
   $.ajax({
      url : AjaxURL(),
    data : { action : "loadtemplateMasDetalles", odt:odt ,  lote:lote ,nvruta:nvruta ,lecturista:lecturista },//cuando cargo plantillas no valido la disponiblidad del servicio ORA
    type : 'POST',
     dataType : 'html',
     beforeSend : function(xhr, status) {
     $("#MasdetallesLoad").html(gifLoad());
      
    },
     success : function(html) {
        $("#MasdetallesLoad").html(html); 
    },
 
    error : function(xhr, status) {
      alertify.alert('Disculpe, existió un problema al mostrar la pagina de mas detalles');
      // console.log(status);
    },
       complete : function(xhr, status) {
        //alert('Petición realizada');
       // console.log(status);
    }
});

}
//-----------------------------------------------------------------------------

</script>


</div><!-- end page content-->
<?php
}else{echo "Accesso no permitido";}
	?>
