<?php
if (isset($details)) {
	?>
<!DOCTYPE html>
<html>
  <head>
    <title><?php echo $details["title"];?></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0 user-scalable=no" >
    <!-- Bootstrap -->
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 
<!--<link href="assets/jquery-ui-1.12.1.custom/jquery-ui.min.css" rel="stylesheet">-->
    <!--<link href="assets/Admin-Theme-3-master/bootstrap/css/bootstrap.min.css" rel="stylesheet">-->
  <link href="assets/bootstrap-datepicker-1.6.4-dist/css/bootstrap-datepicker3.min.css" rel="stylesheet">
    <!-- styles -->
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link href="assets/Admin-Theme-3-master/css/styles.css" rel="stylesheet">
<link href="assets/Admin-Theme-3-master/vendors/datatables/dataTables.bootstrap.css" rel="stylesheet" media="screen">
   <link href="assets/icheck-1.x/skins/square/green.css" rel="stylesheet">
<link rel="stylesheet" href="assets/alertify.js-0.3.11/themes/alertify.core.css" />
	<link rel="stylesheet" href="assets/alertify.js-0.3.11/themes/alertify.default.css" id="toggleCSS" />
	<link rel="stylesheet" href="assets/bootstrapvalidator-master/dist/css/bootstrapValidator.min.css"/>
	<link rel="stylesheet" href="assets/font-awesome-4.7.0/css/font-awesome.min.css">
  <!--<link rel="stylesheet" href="assets/EasyAutocomplete-1.3.5/easy-autocomplete.min.css">
  <link rel="stylesheet" href="assets/EasyAutocomplete-1.3.5/easy-autocomplete.themes.min.css">-->
   <link rel="stylesheet" href="assets/tagify-master/dist/tagify.css">
  
  

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
  	<div class="header row">
	     <div class="container" style="text-align: left; float: left;">
	        <div class="row " >
	           <div class="col-md-12">
	              <!-- Logo -->
	              <div class="logo">
	                 <h1><a><?php echo $details["title"]." <span id='soloLectura'>(".$details["usuario"].")</span>";?></a></h1>
	              </div>
	           </div>
	         
	           <div class="col-md-2">
	                </div>
	        </div>
	     </div>
	</div>

    <div class="page-content" id="pageContentRegistrado">
	<div class="row">
  <div class="col-sm-12">
  	 <div class="panel-group">
    <div class="panel panel-default">
      <div class="panel-heading"><h4></h4>
<div class="navbar" role="banner">
 	<nav class="navbar-right" role="navigation">
	         
     <div class="btn-group">
        <div class="btn-group">
     <button type="button"  class="btn btn-info disabled" disabled="disabled">
                <span data-toggle="tooltip" title="Administrar Usuario/Mobile" >Admin </span><i class="fa fa-plus-circle" aria-hidden="true"></i>
              </button>
      <button type="button" class="btn btn-primary dropdown-toggle "  data-toggle="dropdown">
      Configuracion <i class="fa fa-cogs" aria-hidden="true"></i> <span class="caret"></span></button>
      <ul class="dropdown-menu" role="menu">
        <li><a href="#" data-toggle="modal" data-target="#myModalLogin" >Iniciar Sesion <i class="fa fa-unlock"></i></a></li>
        <?php /*?><li><a href="#" id="logout">Cerrar Sesion <i class="fa fa-lock" aria-hidden="true"></i></a></li><?php */?>
      </ul>
    </div>
  </div>
	     </nav>
	      </div>
      </div>
      <div class="panel-body">
     <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered table-hover" id="example">

						<thead>
							<tr >
							<th >N</th>
								<th>Clave empleado</th>
								<th>Nombre Empleado</th>
                <th>EMEI mobile</th>
                 <th>Lote</th>
                  <th>Ruta</th>
								
								<th style="text-align: center;"> <i data-toggle="tooltip" title="Fecha" class="fa fa-calendar" aria-hidden="true"></i></th>
                <th style="text-align: center;"> <i data-toggle="tooltip" title="Ultima conexion" class="fa fa-calendar" aria-hidden="true"></i></th>
																
								<th>Mas detalles</th>
								<!--<th >---</th> -->
								
							</tr>
						</thead>
						<tbody id="showContentEncuentas"></tbody>
					</table>
  				

      </div>
    </div>  
  </div>
  </div>
</div>



</div><!-- end page content-->
   

  </body>

<?php ?>
    <footer>
         <div class="container">
         
            <div class="copy text-center">
             <h4> <span class="label label-info">Copyright &copy; <?php echo date("Y");?> <a href='https://www.aguakan.com/'>www.aguakan.com</a></span> </h4>
            </div>
            
         </div>
      </footer>
      <?php ?>

  <!-- Trigger the modal with a button -->
  <!--<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModalver">Open Modal</button>-->





 <!-- Modal -->
  <div class="modal fade" id="myModalDetalles" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog modal-lg" style="width: 90% !important;">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Mas detalles <b><span class="" ></span></b></h4>
        </div>
        <div class="modal-body "> 
          
<div class="">
            <div class="">
           
            <!--<div class="list-group" id="nPreguntas">-->
            <div class="list-group" id="MasdetallesLoad">
            </div>
          </div>
                   


          </div>
      
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-warning" data-dismiss="modal">Cerrar</button>
        </div>
      </div>
      
    </div>
  </div>
 <!-- Modal -->
  <div class="modal fade" id="myModalAgregarAcliente" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog modal-lg" style="width: 90% !important;">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Editar (por ahora no habilitare esta opcion) <b><span class="" ></span></b></h4>
        </div>
        <div class="modal-body "> 
                        <div class="alert alert-warning">
  <strong>Warning!</strong> por ahora se edita manualmente en DB.
</div>   

 <div class="row">
    <div class="col-sm-6">
       <div class="input-group">
      <span class="input-group-addon"><i class="fa fa-user-o" aria-hidden="true"></i></span>
    <input type="text" class="form-control" value="" maxlength="10" placeholder="" id="nCliente" >
    <input type="hidden" value="" id="idEncuestaAddCli" >
    </div>
    </div>
    <div class="col-sm-6">
      <button type="submit" id="BtnAddCliente--" class="btn btn-default">Agregar</button>
    </div>
    </div><br>
      
        </div>
        <div class="modal-footer">
          <button type="button"  class="btn btn-warning" data-dismiss="modal">Cerrar</button>
        </div>
      </div>
      
    </div>
  </div>

 

 <!-- Modal -->
  <div class="modal fade" id="myModalLogin" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Ingresar (Lectura)</h4>
        </div>
        <div class="modal-body">
        
                   <div class="logo"></div>
<div class="login-block">
    <h1>Acceso</h1>
    <h5>usuario solo Lectura</h5>
    <h5>usuario: Demo@Demo.com</h5>
    <h5>Contraseña: Demo</h5>
    <div class="row">
    <div class="col-sm-12">
       <div class="input-group">
      <span class="input-group-addon"><i class="fa fa-user-o" aria-hidden="true"></i></span>
    <input type="text" class="form-control" value="" maxlength="100" placeholder="E-mail" id="username" >
    </div>
    </div>
    </div><br>
    <div class="row">
    <div class="col-sm-12">
      <div class="input-group">
      <span class="input-group-addon"><i class="fa fa-unlock-alt fa-2" aria-hidden="true"></i></span>
    <input type="password" class="form-control" value="" maxlength="100" placeholder="Contraseña" id="password">
    </div>
    </div>
    </div><br>
 <div class="row">
     <div class="col-sm-12">
      <button type="submit" id="loginLectura" class="btn btn-primary" >Acceder</button>
    </div> 
    </div>   
</div>
        

        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-info" data-dismiss="modal">Continuar solo lectura</button>
        </div>
      </div>
      
    </div>
  </div>

<!-- 
Modal hide
-->



 <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog" style="z-index: 1400;" aria-hidden="true" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog modal-lg" style="width: 90% !important;">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h3 class="modal-title">Lecturista</h3>
        </div>
        <div class="modal-body">
         <!-- <p>This is a large modal.</p>-->
 <div id="loadAgregar"></div>

        </div> <!-- end modal-body -->
        <div class="modal-footer">
          <button type="button" class="btn btn-warning" data-dismiss="modal">Cerrar</button>
        </div>
      </div>
    </div>
  </div><!-- end Modal -->



 <!-- Modal -->
  <div class="modal fade" id="myModalusuario" role="dialog" style="z-index: 1600;" aria-hidden="true" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog modal-lg" style="width: 70% !important; margin-top: 3% !important;">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h3 class="modal-title">Agregar Lecturista</h3>
        </div>
        <div class="modal-body">
          <div id="loadAgregarusuario"></div>
        </div> <!-- end modal-body -->
        <div class="modal-footer">
          <button type="button" class="btn btn-warning" data-dismiss="modal">Cerrar Sin Guardar</button>
        </div>
      </div>
    </div>
  </div><!-- end Modal -->
  <!-- Modal -->
  <div class="modal fade" id="myModalmobile" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog modal-lg" style="width: 90% !important;">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Mobile</h4>
        </div>
        <div class="modal-body">
         <div id="loadAgregarmobil"></div>
           </div>
        <div class="modal-footer">
           <button type="button" class="btn btn-warning" data-dismiss="modal">Cerrar</button>
        </div>
      </div>
      
    </div>
  </div>
<!-- Modal -->
 <!-- Modal -->
  <?php /* ?> <div class="modal fade" id="myModalMobile" role="dialog" style="z-index: 1600;" aria-hidden="true" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog modal-lg" style="width: 70% !important; margin-top: 3% !important;">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h3 class="modal-title">Agregar mobile</h3>
        </div>
        <div class="modal-body">
          <div id="loadAgregarMobile"></div>
        </div> <!-- end modal-body -->
        <div class="modal-footer">
          <button type="button" class="btn btn-warning" data-dismiss="modal">Cerrar Sin Guardar</button>
        </div>
      </div>
    </div>
  </div> <?php */ ?><!-- end Modal -->
 

 <!-- Modal -->
  <div class="modal fade" id="myModalRuta" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog modal-lg" style="width: 90% !important;">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Ruta</h4>
        </div>
        <div class="modal-body">
         <div id="loadtemplateRuta">
    
         </div>
           </div>
        <div class="modal-footer">
           <button type="button" class="btn btn-warning" data-dismiss="modal">Cerrar</button>
        </div>
      </div>
      
    </div>
  </div>
<!-- Modal -->

  <!-- Modal -->
  <div class="modal fade" id="myModalReporte" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog modal-lg" style="width: 90% !important;">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Reporte</h4>
        </div>
        <div class="modal-body">
           <div id="loadtemplateReporte"></div>
           </div>
        <div class="modal-footer">
           <button type="button" class="btn btn-warning" data-dismiss="modal">Cerrar</button>
        </div>
      </div>
      
    </div>
  </div>
<!-- Modal -->
 <!-- Modal -->
  <div class="modal fade" id="myModalCatalogo" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog modal-lg" style="width: 90% !important;">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Catalogo</h4>
        </div>
        <div class="modal-body">
          <div id="loadtemplateCatalogo"></div>
           </div>
        <div class="modal-footer">
           <button type="button" class="btn btn-warning" data-dismiss="modal">Cerrar</button>
        </div>
      </div>
      
    </div>
  </div>
<!-- Modal -->
 <!-- Modal -->
  <div class="modal fade" id="myModalAlerta" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog modal-lg" style="width: 90% !important;">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Alerta</h4>
        </div>
        <div class="modal-body">
          <div id="loadtemplateAlerta"></div>
           </div>
        <div class="modal-footer">
           <button type="button" class="btn btn-warning" data-dismiss="modal">Cerrar</button>
        </div>
      </div>
      
    </div>
  </div>
<!-- Modal -->


 <!-- Modal -->
  <div class="modal fade" id="myModalActualizar" style="z-index: 1600;" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog modal-lg" style="width: 40% !important;">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
           <!--<h4 class="modal-title">Actualizando...</h4>-->
           <div class="showloadmodal">
             
           </div>

        </div>
        <div class="modal-body">
         <div id="Actualizando">
    
         </div>
           </div>
       
      </div>
      
    </div>
  </div>
<!-- Modal -->


 <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->

  <!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>-->
  
<script src="assets/jquery-ui-1.12.1.custom/external/jquery/jquery.js"></script>
  <?php /* ?> <!-- <script src="https://code.jquery.com/jquery.js"></script>-->
    <!--<script src="https://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>-->
   <!-- <script src="assets/jquery-ui-1.12.1.custom/jquery-ui.js"></script>-->
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <!--<script src="assets/Admin-Theme-3-master/bootstrap/js/bootstrap.min.js"></script>--> <?php */ ?>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
   <script src="assets/bootstrap-datepicker-1.6.4-dist/js/bootstrap-datepicker.min.js"></script>
    <script src="assets/Admin-Theme-3-master/js/custom.js"></script>

    <script src="assets/Admin-Theme-3-master/vendors/datatables/js/jquery.dataTables.js"></script>
    <script src="assets/Admin-Theme-3-master/vendors/datatables/dataTables.bootstrap.js"></script>
    <script src="assets/Admin-Theme-3-master/js/tables.js"></script>
  <?php /* ?>  <script src="assets/dropzone/dropzone.js"></script> <?php */ ?>
<script src="assets/icheck-1.x/icheck.js"></script>
<script src="assets/alertify.js-0.3.11/lib/alertify.min.js"></script>
<script type="text/javascript" src="assets/bootstrapvalidator-master/dist/js/bootstrapValidator.min.js"></script>
<!--<script type="text/javascript" src="assets/EasyAutocomplete-1.3.5/jquery.easy-autocomplete.min.js"></script>-->
 <script src="assets/tagify-master/dist/tagify.js"></script>
  <script src="assets/Sortable-master/Sortable.min.js"></script>
 


<?php /* ?>
<script src="assets/js/antecedentes.js"></script>
<script src="assets/js/desarrollador.js"></script>
<script src="assets/js/obligadoSolidario.js"></script>
<script src="assets/js/institucionBancaria.js"></script>
<script src="assets/js/testigo.js"></script>
<script src="assets/js/editarConvenio.js"></script>
<?php */ ?>
<script src="assets/js/functions.js"></script>
<script src="assets/js/showLote.js"></script>

<script src="assets/js/init.js"></script>
<?php /* ?>
<!--graficas-->
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/highcharts-3d.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<?php */ ?>


<?php if(isset($_SESSION['usuarioLogueadoLECT'])){ ?>
  <script type="text/javascript">
  $(document).ready(function($) {
     cargarplantillaParaUsuariosRegistrados();
  });

</script>
<?php
}
?>


<?php if ($details["validainicio"]) {
  ?>
<script type="text/javascript">
  $(document).ready(function($) {
    $("#myModalLogin").modal("show");
  });

</script>
<?php } ?>
<style type="text/css">
  .nav-tabs { border-bottom: 2px solid #DDD; }
    .nav-tabs > li.active > a, .nav-tabs > li.active > a:focus, .nav-tabs > li.active > a:hover { border-width: 0; }
    .nav-tabs > li > a { border: none; color: #666; }
        .nav-tabs > li.active > a, .nav-tabs > li > a:hover { border: none; color: #4285F4 !important; background: transparent; }
        .nav-tabs > li > a::after { content: ""; background: #4285F4; height: 2px; position: absolute; width: 100%; left: 0px; bottom: -1px; transition: all 250ms ease 0s; transform: scale(0); }
    .nav-tabs > li.active > a::after, .nav-tabs > li:hover > a::after { transform: scale(1); }
.tab-nav > li > a::after { background: #21527d none repeat scroll 0% 0%; color: #fff; }
.tab-pane { padding: 15px 0; }
.tab-content{padding:20px}

.card {background: #FFF none repeat scroll 0% 0%; box-shadow: 0px 1px 3px rgba(0, 0, 0, 0.3); margin-bottom: 30px; }
body{ background: #EDECEC; padding:50px}
.form-control-feedback {
        right: 18px !important;}


.navbar-right {
   
    margin-right: 0 !important;
}


.login-block {
    width: 350px;
    padding: 20px;
    background: #fff;
    border-radius: 5px;
    border-top: 5px solid #337ab7;
    margin: 0 auto;
}

.login-block h1 {
    text-align: center;
    color: #000;
    font-size: 18px;
    text-transform: uppercase;
    margin-top: 0;
    margin-bottom: 20px;
}

.login-block input {
    width: 100%;
    height: 42px;
    box-sizing: border-box;
    border-radius: 5px;
    border: 1px solid #ccc;
    margin-bottom: 20px;
    font-size: 14px;
     padding: 0 20px 0 50px;
    outline: none;
}

.login-block input#username {
    /*/background: #fff url('http://i.imgur.com/u0XmBmv.png') 20px top no-repeat;/*/
    background-size: 16px 80px;
}

.login-block input#username:focus {
    /*/background: #fff url('http://i.imgur.com/u0XmBmv.png') 20px bottom no-repeat;/*/
    background-size: 16px 80px;
}

.login-block input#password {
    /*/background: #fff url('http://i.imgur.com/Qf83FTt.png') 20px top no-repeat;/*/
    background-size: 16px 80px;
}

.login-block input#password:focus {
    /*/background: #fff url('http://i.imgur.com/Qf83FTt.png') 20px bottom no-repeat;/*/
    background-size: 16px 80px;
}

.login-block input:active, .login-block input:focus {
    border: 1px solid #5f97c7;
}

.login-block button {
    width: 100%;
    height: 40px;
    background: #337ab7;
    box-sizing: border-box;
    border-radius: 5px;
    border: 1px solid #337ab7;
    color: #fff;
    font-weight: bold;
    text-transform: uppercase;
    font-size: 14px;
    
    outline: none;
    cursor: pointer;
}

.login-block button:hover {
    background: #5f97c7;
}

</style>

</html>
<?php
}else{echo "Accesso no permitido";}
	?>