<?php 
if($data1){
  //var_dump($perm->permisos[0]->servicios->lct->key_value);
  ?>  
   
                      <div class="panel panel-default">
  <div class="panel-heading"><label>Agregar</label></div>
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
                        <!--<option value="">----------</option>-->
                        <?php 

                          if ($perm->permisos[0]->servicios->lct->admin==1) {
                            echo '<option value="" >--------------</option>';
                             foreach ($dataCTrabajo[0]->Centros as $key => $value) {
                           echo '<option value="'.$key.'" >'.$value.'</option>';
                          }
                          }
                          else if ($perm->permisos[0]->servicios->lct->operativo==1){
                             foreach ($dataCTrabajo[0]->Centros as $key => $value) {
                          if ($perm->permisos[0]->servicios->lct->key_value==$key) {
                            echo '<option value="'.$key.'" >'.$value.'</option>';
                          }
                          }

                       
                        
                        } 

                        ?>
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
                      <label for="lctApaterno" class="col-form-label">Apellido Paterno</label>
                      </div>
                      <div class="col-xs-8">
                      <input class="form-control" type="text" name="lctApaterno" minlength="2" maxlength="100" value="" id="lctApaterno" placeholder="Apellido Paterno" required >
                      </div>
                      </div>
                        <br>
                         <div class="row">
                        
                      <div class="col-xs-4">
                      <label for="lctAmaterno" class="col-form-label">Apellido Materno</label>
                      </div>
                      <div class="col-xs-8">
                      <input class="form-control" type="text" name="lctAmaterno" minlength="2" maxlength="100" value="" id="lctAmaterno" placeholder="Apellido Materno" required >
                      </div>
                      </div><br>
                        <div class="row">
                      <div class="col-xs-4">
                      <label for="lctGenero" class="col-form-label">Genero</label>
                      </div>
                     
                        <div class="generoOtorga">
                      <div class="col-xs-4">
                      <input tabindex="4" type="radio" id="radioOtorga1" name="radioOtorga" value="1"
                      checked="checked" >
                              <label for="radioOtorga1"><span>Masculino</span></label>
                      </div>
                      <div class="col-xs-4">
                    <input tabindex="4" type="radio" id="radioOtorga2" name="radioOtorga" value="0">
                                    <label for="radioOtorga2"><span>Femenina</span></label>
                      </div>
                      </div>
                    
                     </div>
                    <br>
                        <div class="row">
                        
                      <div class="col-xs-4">
                      <label for="lctUsuario" class="col-form-label">Usuario</label>
                      </div>
                      <div class="col-xs-8">
                      <input class="form-control" type="text" name="lctUsuario" minlength="3" maxlength="100" value="" id="lctUsuario" placeholder="Usuario" required >
                      </div>
                      </div>
                        <br>
                          <div class="row">
                        
                      <div class="col-xs-4">
                      <label for="lctPassw" class="col-form-label">Contraseña</label>
                      </div>
                      <div class="col-xs-8">
                      <input class="form-control" type="password" name="lctPassw" minlength="5" maxlength="100" value="" id="lctPassw" placeholder="Contraseña" required >
                      </div>
                      </div>
                        <br>
                          <div class="row">
                        
                      <div class="col-xs-4">
                      <label for="lctConPassw" class="col-form-label">Confirmar Contraseña</label>
                      </div>
                      <div class="col-xs-8">
                      <input class="form-control" type="password" name="lctConPassw" minlength="5" maxlength="100" value="" id="lctConPassw" placeholder="Confirma Contraseña" required >
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
                      <div class="row">
                        
                      <div class="col-xs-4">
                      <label for="lctphoto" class="col-form-label">Foto (PNG, JPEG, JPG)</label>
                      </div>
                      <div class="col-xs-8">
                      <input class="form-control" type="file" data-base64="0" accept="image/x-png,image/jpeg" name="lctphoto" id="lctphoto" placeholder="Ingresa foto (este valor es opcional)"  >
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
       

<!--
<input id="inp" type='file'>
<p id="b64"></p>
<img id="img" height="150">
-->
<script type="text/javascript">
  $(document).ready(function($) {

  $("#Formusuario").on( 'click', function () {
     $('#Formusuario').bootstrapValidator('validate');
    });


  $("#btnAddUser").click(function(event) { // alertify.alert("add");
    var datos=validardatosNuevoUsuario();
    if (datos.estatus==true) {
     // alertify.alert("Datos enviados...");
     
 alertify.confirm("¿Estas seguro de realizar esta accion?", function (e) {
        if (e) {
          agregardatos(datos);
            }
      else {
          alertify.error("Accion Cancelada");
        }
      });
      //return false;


    }else{
      // alertify.error("error");
      
    }
//console.log(datos);
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

          
           lctcentro: {
                group: '.col-xs-8',
                validators: {
                    notEmpty: {
                        message: ' '
                    }
                }
            },
             lctperfil: {
                group: '.col-xs-8',
                validators: {
                    notEmpty: {
                        message: ' '
                    }
                }
            },
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
            //  callbacks_list.prepend('<li><span>#' + this.id + '</span> is ' + event.type.replace('if', '').toLowerCase() + '</li>');
            
           // alert(event.type);
           // alert($('.regimen-list input:radio[name=regimen-radio]:checked').val());
            //alert($(this).val());
            }).iCheck({
              checkboxClass: 'icheckbox_square-green',
              radioClass: 'iradio_square-green',
              increaseArea: '50%'
            });


 });//end document ready

//--------------------------------------------------------------------------
function agregardatos(value){
   //$("#myModalActualizar").modal("show");
   $.ajax({
      url : AjaxURL(),
    data : { action : "datoslecturistas", data:JSON.stringify(value) },
    type : 'POST',
     dataType : 'JSON',
     beforeSend : function(xhr, status) {
      //alertify.alert(gifLoad());
       alertify.success("Datos enviado...");
      
    },
     success : function(JSON) {
        //$("#myModalActualizar").html(html); 
        //$("#myModalActualizar").modal("hide");
        
        // $("#myModalActualizar").hide(500).modal("hide");
          //alertify.alert(JSON);
          console.log(JSON);
         // $(".showloadmodal").html(html);
         if (JSON.status==1) {
         	 alertify.success(' '+JSON.msg);
         	}else{
         		 alertify.alert(' '+JSON.msg);
         		  alertify.error("Acion cancelada");
         	}
    },
 
    error : function(xhr, status) {
      alertify.alert('Disculpe, existió un problema al procesar los datos del lecturista');
      // console.log(status);
    },
       complete : function(xhr, status) {
        //alert('Petición realizada');
       // console.log(status);
    }
});

}
//--------------------------------------------------------------------------
function validardatosNuevoUsuario(){
  var vandera=true;
  var msg="";

var lctcentro=$('#lctcentro').val();
var lctperfil=$('#lctperfil').val();

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
var file_base64 = "";
var file_type = "";

 if(lctcentro==""){ vandera=false;  msg="Centro de trabajo requerido";
   $("#lctcentro").focus();
} else if(lctperfil==""){ vandera=false;   msg="Perfil requerido";  
   $("#lctperfil").focus();
}
 else if(clave==""){
   vandera=false;   msg="Clave requerida"; $("#lctClave").focus();
}
else if(clave.length>=5){
   vandera=false;   msg="Clave no valida"; $("#lctClave").focus();
}
else if(nombre==""){
   vandera=false;   msg="Nombre requerido";  
   $("#lctNombre").focus();
}
else if(apaterno==""){ vandera=false; msg="Apellido requerido";  
   $("#lctApaterno").focus();
}
else if(amaterno==""){
   vandera=false; msg="Apellido requerido";  
   $("#lctAmaterno").focus();}
else if(usuario==""){  vandera=false; msg="Usuario requerido";  
   $("#lctUsuario").focus();}
   else if(usuario.length<=2){  vandera=false; msg="Usuario muy corto";  
   $("#lctUsuario").focus();}
else if(pass1!=pass2){ vandera=false;  msg="Las contraseñas no coinciden";  
   $("#lctPassw").focus();
}else if(pass1==""){  vandera=false; msg="Agregar contraseña";  
   $("#lctPassw").focus();}
else if(pass1.length<=4){  vandera=false;  msg="Contraseña muy corta";  
   $("#lctPassw").focus();
}
else if(mail!=""){
  var caract = new RegExp(/^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/);
    if (caract.test(mail) == false){
      vandera=false;  msg="Estructura de correo no valida"; $("#lctPassw").focus();
    }
}
else if(foto.get(0).files.length != 0){
    var fileExtension = ['jpeg', 'jpg', 'png'];
        if ($.inArray(foto.val().split('.').pop().toLowerCase(), fileExtension) == -1) {
          vandera=false;  msg="Archivo no aceptado.";    msg+="Formatos aceptados : "+fileExtension.join(', ');
          //console.log(msg);
}else{
 input = foto[0]; // Getting the element from jQuery
 file = input.files[0]; 
 file_name = file.name; 
 file_type=file.type;
 //console.log(file);
 file_base64=$("#lctphoto").attr("data-base64"); //lee el codigo creado y asignado previamente por la funcion readFile
}
}

if(vandera==false){ alertify.error(msg);}
  
var datos={
'lctcentro':lctcentro,
'lctperfil':lctperfil,
  'activo':activo,
 'clave':clave,
'nombre':nombre,
'apaterno':apaterno,
'amaterno':amaterno,
'genero':genero,
'usuario':usuario,
'pass1':pass1,
'pass2':pass2,
'mail':mail,
//'foto':foto,
//'input':input,
//'file':file,
'file_name':file_name,
'file_base64':file_base64,
'file_type':file_type,
}

return { "estatus":vandera, "msg":msg, "datos":datos};

}
function readFile() { 
  if (this.files && this.files[0]) {    
    var FR= new FileReader();    
    FR.addEventListener("load", function(e) {
      //document.getElementById("img").src       = e.target.result;
      //document.getElementById("b64").innerHTML = e.target.result;
    $("#lctphoto").attr("data-base64",e.target.result);
        }); 

    FR.readAsDataURL( this.files[0] );
  }
 
}
document.getElementById("lctphoto").addEventListener("change", readFile);
</script>

<?php 
}
else{
  echo "Acceso no permitido...";
}
?>  