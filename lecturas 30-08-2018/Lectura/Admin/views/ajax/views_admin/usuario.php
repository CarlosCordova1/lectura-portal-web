<?php 
if($data1){
  ?>  
   
  
   <ul class="nav nav-tabs">
    <!--<li class="active"><a    href="#home">Asignar</a></li>-->

<li class="dropdown active"><a   class="dropdown-toggle"  data-toggle="dropdown" href="#">Lecturista<span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li id="LecturistaCrear1"><a data-toggle="tab" href="#LecturistaCrear">Crear</a></li>
          <li id="LecturistaCrearGestionar"><a data-toggle="tab" href="#LecturistaCrear">Gestionar</a></li>
            </ul>
   </li>

    <!--<li><a data-toggle="tab" id="rutalocal" href="#menu1">Crear ruta local</a></li>-->

<li class="dropdown"><a   class="dropdown-toggle"  data-toggle="dropdown" href="#">Perfil<span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li id="LecturistaPerfilCrear"><a data-toggle="tab" href="#LecturistaPerfil">Crear</a></li>
         <li id="LecturistaPerfilGestionar"><a data-toggle="tab" href="#LecturistaPerfil">Gestionar</a></li>
            </ul>
   </li>
      <!--<li><a data-toggle="tab" href="#menu2otroLecturista">Estatus</a></li>-->
 </ul>

  <div class="tab-content">
    <div id="LecturistaCrear" class="tab-pane fade in active"> 
     <div id="">
     <h2>Crear gestionar Lecturista</h2>
    </div> 
       
   </div>
    <div id="LecturistaPerfil" class="tab-pane fade">
     <div id=""></div>
      <h2>Crear gestionar perfil</h2>
    </div>
<!--
    <div id="menu2otroLecturista" class="tab-pane fade">
      <h3>Estatus</h3>
      <p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
    </div>-->
    
  </div>


<script type="text/javascript">

  $(document).ready(function($) {

  
$('[data-toggle="tooltip"]').tooltip();


 ShowagregarUsuario();
$("#LecturistaCrear1").click(function(event) {
   ShowagregarUsuario();
});
$("#LecturistaCrearGestionar").click(function(event) {
   ShowagregarUsuarioGestionar();
});

$("#LecturistaPerfilCrear").click(function(event) {
   ShowUsuarioPerfilCrear();
});
$("#LecturistaPerfilGestionar").click(function(event) {
   ShowaUsuarioPerfilGestionar();
});

  });
  //--------------------------------------------------------------------------
function ShowagregarUsuario(){
   $.ajax({
      url : AjaxURL(),
    data : { action : "loadtemplateEditUsuario", },
    type : 'POST',
     dataType : 'html',
     beforeSend : function(xhr, status) {
     $("#LecturistaCrear").html(gifLoad());
      
    },
     success : function(html) {
        $("#LecturistaCrear").html(html); 
    },
 
    error : function(xhr, status) {
      alertify.alert('Disculpe, existió un problema al mostrar la pagina de agregar Lecturista');
      // console.log(status);
    },
       complete : function(xhr, status) {
        //alert('Petición realizada');
       // console.log(status);
    }
});

}
//--------------------------------------------------------------------------
function ShowagregarUsuarioGestionar(){
   $.ajax({
      url : AjaxURL(),
    data : { action : "loadtemplateUsuarioGestionar", },
    type : 'POST',
     dataType : 'html',
     beforeSend : function(xhr, status) {
     $("#LecturistaCrear").html(gifLoad());
      
    },
     success : function(html) {
        $("#LecturistaCrear").html(html); 
    },
 
    error : function(xhr, status) {
      alertify.alert('Disculpe, existió un problema al mostrar la pagina de edicion usuario');
      // console.log(status);
    },
       complete : function(xhr, status) {
        //alert('Petición realizada');
       // console.log(status);
    }
});

}
//--------------------------------------------------------------------------
function ShowUsuarioPerfilCrear(){
   $.ajax({
      url : AjaxURL(),
    data : { action : "loadtemplateUsuarioPerfilCrear", },
    type : 'POST',
     dataType : 'html',
     beforeSend : function(xhr, status) {
     $("#LecturistaPerfil").html(gifLoad());
      
    },
     success : function(html) {
        $("#LecturistaPerfil").html(html); 
    },
 
    error : function(xhr, status) {
      alertify.alert('Disculpe, existió un problema al mostrar la pagina de crear perfil Lecturista');
      // console.log(status);
    },
       complete : function(xhr, status) {
        //alert('Petición realizada');
       // console.log(status);
    }
});

}
//--------------------------------------------------------------------------
function ShowaUsuarioPerfilGestionar(){
   $.ajax({
      url : AjaxURL(),
    data : { action : "loadtemplateUsuarioPerfilGestionar", },
    type : 'POST',
     dataType : 'html',
     beforeSend : function(xhr, status) {
     $("#LecturistaPerfil").html(gifLoad());
      
    },
     success : function(html) {
        $("#LecturistaPerfil").html(html); 
    },
 
    error : function(xhr, status) {
      alertify.alert('Disculpe, existió un problema al mostrar la pagina de gestionar perfil de usuario');
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