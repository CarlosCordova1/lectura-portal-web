<?php
if (isset($details)) {
	?>


    <div class="page-content">
	<div class="row">
  <div class="col-sm-12">
  	 <div class="panel-group">
    <div class="panel panel-default">
      <div class="panel-heading"><h4></h4>

<div class="navbar" role="banner">
 
	                  <nav class="navbar-right" role="navigation">
	                 

      <div class="btn-group">
    
    <div class="btn-group">
     <button type="button" id="mymodalNewConvenio" class="btn btn-info disabled" disabled="disabled" data-toggle="modal" data-target="#myModal" >
                <span data-toggle="tooltip" title="Crear Encuesta" >Nuevo </span><i class="fa fa-file-o" aria-hidden="true"></i>
              </button>
      <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
      Configuracion <i class="fa fa-cogs" aria-hidden="true"></i> <span class="caret"></span></button>
      <ul class="dropdown-menu" role="menu">
      <?php /*?>  <li><a href="#" data-toggle="modal" data-target="#myModalLogin" >Iniciar Sesion <i class="fa fa-unlock"></i></a></li>
      <?php */?>
        <li><a href="#" id="logout">Cerrar Sesion <i class="fa fa-lock" aria-hidden="true"></i></a></li>
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
var permisosJSON=JSON.parse('<?php echo $this->permisos();?>');
var permisosApp=permisosJSON.permisos;
console.log(permisosApp);
  $(document).ready(function($) {
  ShowEncuentas();
      $('[data-toggle="tooltip"]').tooltip();
  });



//validar agregar encuesta a cliente
$("#pageContentRegistrado").on("click", ".agregarAcliente", function(){//Agregar encuesta a cliente
 var idEncuenta=$(this).data("encuestaid");
 $("#nCliente").val("");
 $("#idEncuestaAddCli").val(idEncuenta);
 //alertify.success("id "+idEncuenta);
   // buscarCliente(cliente,idEncuenta);
});

$("#myModalAgregarAcliente").on("click", "#BtnAddCliente", function(){//boton agregar cliente
console.log('-----------------');
if(permisosApp[0]['servicios']['cns']['operativo']==1){
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


























//validar  asignar encuesta a cliente
$("#pageContentRegistrado").on("click", ".validarstatusConv", function(){
    var folio=$(this).data("folio");

if(permisosApp[0].puedeEditar==1){
  alertify.confirm("¿Quieres cambiar el estatus a validar?", function (e) {
        if (e) {
          //alertify.success("El convenio estara en estatus validar");
           estatusValidar(folio,"validar");
        } else {
          alertify.error("Accion Cancelada");
        }
      });
      return false;

}
else{
  alertify.alert("No tienes permisos para realizar esta acción");
}
    
});



//validar documento
$("#pageContentRegistrado").on("click", ".validarstatusConv", function(){
    var folio=$(this).data("folio");

if(permisosApp[0].puedeEditar==1){
  alertify.confirm("¿Quieres cambiar el estatus a validar?", function (e) {
        if (e) {
          //alertify.success("El convenio estara en estatus validar");
           estatusValidar(folio,"validar");
        } else {
          alertify.error("Accion Cancelada");
        }
      });
      return false;

}
else{
  alertify.alert("No tienes permisos para realizar esta acción");
}
    
});

$("#pageContentRegistrado").on("click", ".editarConvenioBack", function(){//regresar a la opcion de editar convenio
    var folio=$(this).data("folio");

if(permisosApp[0].puedeEditar==1){
  alertify.confirm("¿Volver a editar el convenio?", function (e) {
        if (e) {
          //alertify.success("El convenio estara en estatus validar");
           estatusValidar(folio,"editarOtraVez");
        } else {
          alertify.error("Accion Cancelada");
        }
      });
      return false;

}
else{
  alertify.alert("No tienes permisos para realizar esta acción");
}
    
});

$("#pageContentRegistrado").on("click", ".firmarConvenio", function(){//firma el convenio y genera factura
    var folio=$(this).data("folio");

if(permisosApp[0].PuedeFirmar==1){
  alertify.confirm("Firmar el convenio? <br> <b>Esta accion genera la factura para los pagos</b>", function (e) {
        if (e) {
          //alertify.success("El convenio estara en estatus validar");
           estatusfirmarConvenio(folio);
        } else {
          alertify.error("Accion Cancelada");
        }
      });
      return false;

}
else{
  alertify.alert("No tienes permisos para realizar esta acción");
}
    
});
$("#pageContentRegistrado").on("click", ".cancelarConvenio", function(){//cancelar el convenio
    var folio=$(this).data("folio");

if(permisosApp[0].puedeAnular==1){
  alertify.confirm("¿Cancelar convenio?", function (e) {
        if (e) {
          estatusCancelarConvenio(folio);
        } else {
          alertify.error("Accion Cancelada");
        }
      });
      return false;

}
else{
  alertify.alert("No tienes permisos para realizar esta acción");
}
    
});

$("#pageContentRegistrado").on("click", ".nuevoConvenioApartirDeEste", function(){//nuevo apartir de este convenio
    var folio=$(this).data("folio");

if(permisosApp[0].puedeEditar==1){
  alertify.confirm("Crear nuevo apartir de este convenio?", function (e) {
        if (e) {
         alertify.alert("Acción no habillitada");
         alertify.error("Accion Cancelada");
        } else {
          alertify.error("Accion Cancelada");
        }
      });
      return false;

}
else{
  alertify.alert("No tienes permisos para realizar esta acción");
}
    
});


function estatusValidar(folio,accion){

  $.ajax({
    // la URL para la petición
    url : AjaxURL(),
   data : { action : "estatusValidar",folio:folio,accion:accion },

    type : 'POST',

    dataType : 'JSON',

    success : function(JSON) {
      console.log(JSON);
      if (JSON.status==1) {
        alertify.success("El convenio cambio de estatus");
        $("#refreshTable").click();
      }
      else{
        alertify.alert(JSON.msg);
      }
    },

    error : function(xhr, status) {
       alert('Disculpe, existió un problema al cambiar el estatus a validar');
    },
 
    // código a ejecutar sin importar si la petición falló o no
    complete : function(xhr, status) {
        //alert('Petición realizada');
    }
});

}
function estatusfirmarConvenio(folio){

  $.ajax({
    // la URL para la petición
    url : AjaxURL(),
   data : { action : "estatusfirmarC",folio:folio },

    type : 'POST',

    dataType : 'JSON',

    success : function(JSON) {
      console.log(JSON);
      if (JSON.status==1) {
        alertify.success("El convenio se ha firmado");
        $("#refreshTable").click();
      }
      else{
        alertify.alert(JSON.msg);
      }
    },

    error : function(xhr, status) {
       alert('Disculpe, existió un problema al firmar el convenio');
    },
 
    // código a ejecutar sin importar si la petición falló o no
    complete : function(xhr, status) {
        //alert('Petición realizada');
    }
});

}
function estatusCancelarConvenio(folio){

  $.ajax({
    // la URL para la petición
    url : AjaxURL(),
   data : { action : "estatusCancelarC",folio:folio },

    type : 'POST',

    dataType : 'JSON',

    success : function(JSON) {
      console.log(JSON);
      if (JSON.status==1) {
        alertify.success("El convenio se ha cancelado");
        $("#refreshTable").click();
      }
      else{
        alertify.alert(JSON.msg);
      }
    },

    error : function(xhr, status) {
       alert('Disculpe, existió un problema al cancelar el convenio');
    },
 
    // código a ejecutar sin importar si la petición falló o no
    complete : function(xhr, status) {
        //alert('Petición realizada');
    }
});

}

</script>


</div><!-- end page content-->
<?php
}else{echo "Accesso no permitido";}
	?>
