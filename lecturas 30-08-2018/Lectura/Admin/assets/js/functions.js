function AjaxURL(){
  return 'controllers/ajax.php';
}
 function gifLoad(){
  return '<img class="img-responsive center-block" src="assets/img/load.gif" alt="Load" height="112" width="112">';
 }



function login(datos){

console.log(datos);
  $.ajax({
    url : AjaxURL(),
   data : { action : "login",  u:datos.username, p:datos.password },
    type : 'POST',
    dataType : 'JSON',
    success : function(json) {
     console.log(json);
            if(json.status==1){
            alertify.success("Acceso permitido");
            cargarplantillaParaUsuariosRegistrados();
            $("#myModalLogin").modal("hide");
            }
            else{
               alertify.error("Acceso denegado");
            }      
        
    },
    error : function(xhr, status) {
       alert('Disculpe, existió un problema al validar Usuario');
          },
 
    // código a ejecutar sin importar si la petición falló o no
    complete : function(xhr, status) {
        //alert('Petición realizada');
    }
});

}
function validarDatosLogin(){
  var estatus=0;
var username=$("#username").val().trim();
var password=$("#password").val().trim();
if (username!="" && password!="") {
  estatus=1;
}
 var datos = {
    "status":estatus,

    "username":username,
    "password":password,
   
   };

  return datos;
}
function cargarplantillaParaUsuariosRegistrados(){


  $.ajax({
    // la URL para la petición
    url : AjaxURL(),
 
    // la información a enviar
    // (también es posible utilizar una cadena de datos)
   data : { action : "lgr" },
 
    // especifica si será una petición POST o GET
    type : 'POST',
 
    // el tipo de información que se espera de respuesta
    dataType : 'html',
 
    // código a ejecutar si la petición es satisfactoria;
    // la respuesta es pasada como argumento a la función

    success : function(html) {
    $("#pageContentRegistrado").html(html);
    $("#soloLectura").html("");
    
 
    },
 

    error : function(xhr, status) {
       alert('Disculpe, existió un problema al cargar usuario registrado');
    },
 
    complete : function(xhr, status) {
        //alert('Petición realizada');
    }
});

}
function logout(){


  $.ajax({
    // la URL para la petición
    url : AjaxURL(),
 
    // la información a enviar
    // (también es posible utilizar una cadena de datos)
   data : { action : "logout" },
 
    // especifica si será una petición POST o GET
    type : 'POST',
 
    // el tipo de información que se espera de respuesta
    dataType : 'JSON',
 
    // código a ejecutar si la petición es satisfactoria;
    // la respuesta es pasada como argumento a la función

    success : function(JSON) {
  
    location.reload();
    },
 
        error : function(xhr, status) {
       alert('Disculpe, existió un problema al cerrar sesion');
          },
 
        complete : function(xhr, status) {
          }
});

}
function cargarplantillaParaCargarArchivos(folio){


  $.ajax({
        url : AjaxURL(),
 
   data : { action : "loadFile",folio:folio },
 
    type : 'POST',
     dataType : 'html',
     success : function(html) {
     $(".contentfileAttached").html(html);
  
    },

    error : function(xhr, status) {
       alert('Disculpe, existió un problema al cargar la plantilla de archivos');
     
    },
 
    // código a ejecutar sin importar si la petición falló o no
    complete : function(xhr, status) {
        //alert('Petición realizada');
    }
});

}