<?php 
if($data1){
  ?>  
   <div class="alert alert-info">
  <strong>Info!</strong> Opcion no habilitada.
</div>

                      <div class="panel panel-default">
  <div class="panel-heading"><label>Perfil Agregar</label></div>
  <div class="panel-body">
  
                <form id="Formusuario"> 

                         <div class="row">                        
                      <div class="col-xs-4">
                      <label for="estatus" class="col-form-label">Estatus</label>
                      </div>
                      <div class="col-xs-8">
                       <input tabindex="1" class="estatus" id="estatus" value="true" type="checkbox" checked>
                        <label for="estatus"><span>Activo</span></label>
              
                      </div>
                      </div>
                        <br>
                    <div class="row">
                      <div class="col-xs-4">
                      <label for="lctcentro" class="col-form-label">Centro de trabajo</label>
                      </div>
                      <div class="col-xs-8">
                       <select class="form-control" id="lctcentro" name="lctcentro" >
                        <option value="">----------</option>
                        <?php foreach ($dataCTrabajo[0]->Centros as $key => $value) {
                         echo '<option value="'.$key.'" >'.$value.'</option>';
                        } ?>
                        </select>
                      </div>
                      </div>
                        <br>
                    <div class="row">
                      <div class="col-xs-4">
                      <label for="lctperfil" class="col-form-label">Perfil</label>
                      </div>
                      <div class="col-xs-8">
                       <select class="form-control" id="lctperfil" name="lctperfil" >
                        <option value="">----------</option>
                        <?php foreach ($dataCTrabajo[0]->Perfil as $key => $value) {
                         echo '<option value="'.$key.'" >'.$value.'</option>';
                       }
                       ?>
                        </select>
                      </div>
                      </div>
                        <br> 

                       <div class="row">                        
                      <div class="col-xs-4">
                      <label for="lctClave" class="col-form-label">Clave</label>
                      </div>
                      <div class="col-xs-8">
                      <input class="form-control" type="number" name="lctClave" min="1"  max="9999"  id="lctClave" placeholder="clave del trabajador" required >
                      </div>
                      </div>
                        <br>
                   <div class="row">                        
                      <div class="col-xs-4">
                      <label for="lctNombre" class="col-form-label">Nombre</label>
                      </div>
                      <div class="col-xs-8">
                      <input class="form-control" type="text" name="lctNombre" minlength="3" maxlength="100"  id="lctNombre" placeholder="Nombre" required >
                      </div>
                      </div>
                        <br>

                         <div class="row">
                        
                      <div class="col-xs-4">
                      <label for="lctEmail" class="col-form-label">E-mail</label>
                      </div>
                      <div class="col-xs-8">
                      <input class="form-control" type="email" name="lctEmail" maxlength="100" value="" id="lctEmail" placeholder="E-mail (este valor es opcional)"  >
                      </div>
                      </div><br>
                      </form>

                        <div class="row">
                        <div class="col-xs-4">
                        <button type="submit" id="btnAddUser"  class="btn btn-primary">Agregar</button>
                       </div>
                      <div class="col-xs-2">  </div>
                      <div class="col-xs-2"> </div>
                       <div class="col-xs-2">  </div>
                      <div class="col-xs-2"> </div>
                                            
                      </div>


  </div> <!-- end panel body -->
</div>
       




<script type="text/javascript">
  $(document).ready(function($) {

  $("#Formusuario").on( 'click', function () {
     $('#Formusuario').bootstrapValidator('validate');
    });


  $("#btnAddUser").click(function(event) {
    // alertify.alert("add");

console.log(validardatosNuevoUsuario());


    });

$('#Formusuario').bootstrapValidator({
    //  live: 'disabled',
        message: 'Este valor no es valido',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok has-success has-feedback',
            invalid: 'glyphicon glyphicon-remove has-error has-feedback',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            lctClave: {
                group: '.col-xs-8',
                validators: {
                    notEmpty: {
                        message: ' '
                    }
                }
            },
            lctNombre: {
                group: '.col-xs-8',
                validators: {
                    notEmpty: {
                        message: ' '
                    }
                }
            }, 
              lctApaterno: {
                group: '.col-xs-8',
                validators: {
                    notEmpty: {
                        message: ' '
                    }
                }
            }, 
            lctAmaterno: {
                group: '.col-xs-8',
                validators: {
                    notEmpty: {
                        message: ' '
                    }
                }
            }, 
             lctUsuario: {
                group: '.col-xs-8',
                validators: {
                    notEmpty: {
                        message: ' '
                    }
                }
            }, 
             lctPassw: {
                group: '.col-xs-8',
                validators: {
                    notEmpty: {
                        message: ' '
                    }
                }
            }, 
             lctConPassw: {
                group: '.col-xs-8',
                validators: {
                    notEmpty: {
                        message: ' '
                    }
                }
            }, 
             lctphoto: {
                group: '.col-xs-8',
                validators: {
                    Empty: {
                        message: ' '
                    }
                }
            }, 
            
                            
        }
    });

$('.generoOtorga input,.estatus').on('ifClicked', function(event){
       
            }).iCheck({
              checkboxClass: 'icheckbox_square-green',
              radioClass: 'iradio_square-green',
              increaseArea: '50%'
            });


 });//end document ready

function validardatosNuevoUsuario(){
  var vandera=true;
  var msg="";

var activo=$('#estatus').is(':checked');
var clave=$("#lctClave").val().trim();
var nombre=$("#lctNombre").val().trim();
var apaterno=$("#lctApaterno").val().trim();
var amaterno=$("#lctAmaterno").val().trim();
var genero=$(".generoOtorga input[name='radioOtorga']:checked").val();
var usuario=$("#lctUsuario").val().trim();
var pass1=$("#lctPassw").val().trim();
var pass2=$("#lctConPassw").val().trim();
var mail=$("#lctEmail").val().trim();
var foto=$("#lctphoto");
var input = "";
var file = "";
var file_name = "";

 if(clave==""){
   vandera=false;
   msg="Clave requerida";
  
   $("#lctClave").focus();
}
else if(nombre==""){
   vandera=false;
   msg="Nombre requerido";
  
   $("#lctNombre").focus();
}
else if(apaterno==""){
   vandera=false;
   msg="Apellido requerido";
  
   $("#lctApaterno").focus();
}
else if(amaterno==""){
   vandera=false;
   msg="Apellido requerido";
  
   $("#lctAmaterno").focus();
}
else if(usuario==""){
   vandera=false;
   msg="Usuario requerido";
  
   $("#lctUsuario").focus();
}
else
if(pass1!=pass2){
   vandera=false;
   msg="Las contraseñas no coinciden";
  
   $("#lctPassw").focus();
}else if(pass1==""){
   vandera=false;
   msg="Agregar contraseña";
  
   $("#lctPassw").focus();
}
else if(mail!=""){
  var caract = new RegExp(/^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/);
    if (caract.test(mail) == false){
      vandera=false;
   msg="Estructura de correo no valida";

   $("#lctPassw").focus();

    }
}
else if(foto.get(0).files.length != 0){
  
  var fileExtension = ['jpeg', 'jpg', 'png'];
        if ($.inArray(foto.val().split('.').pop().toLowerCase(), fileExtension) == -1) {
          vandera=false;
   msg="Archivo no aceptado.";
            msg+="Formatos aceptados : "+fileExtension.join(', ');
}else{
 input = foto[0]; // Getting the element from jQuery
 file = input.files[0]; // The file
 file_name = file.name; // The file
}
}













if(vandera==false){ alertify.error(msg);}
  
var datos={
  "activo":activo,
 "clave":clave,
"nombre":nombre,
"apaterno":apaterno,
"amaterno":amaterno,
"genero":genero,
"usuario":usuario,
"pass1":pass1,
"pass2":pass2,
"mail":mail,
"foto":foto,
"input":input,
"file":file,
"file_name":file_name,
}

return { "estatus":vandera, "msg":msg, "datos":datos};

}


</script>

<?php 
}
else{
  echo "Acceso no permitido...";
}
?>  