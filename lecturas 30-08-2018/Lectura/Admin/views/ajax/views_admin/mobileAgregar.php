<?php 
if($data1){
  //var_dump($mobileAgregar[0]->COPR);
  ?>  
                    <div class="panel panel-default">
  <div class="panel-heading"><label>Agregar</label></div>
  <div class="panel-body">
                  <form id="Formusuario"> 

                         <div class="row">                        
                      <div class="col-xs-2">
                      <label for="estatusaddmobile" class="col-form-label">Estatus</label>
                      </div>
                      <div class="col-xs-4">
                       <input tabindex="1" class="estatusaddmobile" id="estatusaddmobile" value="true" type="checkbox" checked>
                        <label for="estatusaddmobile"><span>Activo</span></label>
              
                      </div>
                       <div class="col-xs-2">
                      <label for="copr" class="col-form-label">Centro operacional</label>
                      </div>
                      <div class="col-xs-4">
                       <select class="form-control" id="copr" name="copr" >
                        <?php   foreach ($mobileAgregar[0]->COPR as $key => $value) { ?>
                         <option value="<?php echo $value->Clave?>"><?php echo $value->Clave?></option>
                            
                                  <?php   } ?>
                                   </select>
              
                      </div>

                      </div>
                        <br>
                  

                       <div class="row">                        
                      <div class="col-xs-4">
                      <label for="lctClave" class="col-form-label">IMEI</label>
                      </div>
                      <div class="col-xs-8">
                      <a href="#" data-toggle="popover"  title="Código IMEI (International Mobile Equipment Identity)" data-content="En tu mobile ve a la opciones de hacer llamada. ingresa el siguiente código *#06# y listo, podras ver el código"><i class="fa fa-question-circle" aria-hidden="true" data-toggle="tooltip" title="Hacer click para abrir o cerrar mensaje">  como ver el IMEI</i></a>
                      <input class="form-control" type="number" name="lctImei"  maxlength="20" id="lctImei" placeholder="clave unica del mobile" required >
                      </div>
                      </div>
                     
                    <br>
                        <div class="row">                        
                      <div class="col-xs-4">
                      <label for="lctObservacion" class="col-form-label">Observacion</label>
                      </div>
                      <div class="col-xs-8">
                      <div class="form-group">  
                    <textarea class="form-control" rows="5"  maxlength="400" name="lctObservacion" id="lctObservacion"></textarea>
                      </div>
                       </div>
                      </div>                  
                  

                      </form>

                        <div class="row">
                        <div class="col-xs-4">
                        <button type="submit" id="btnAddmobile"  class="btn btn-primary">Agregar</button>
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
$('[data-toggle="popover"]').popover(); 
$('[data-toggle="tooltip"]').tooltip();

  $("#Formusuario").on( 'click', function () {
     $('#Formusuario').bootstrapValidator('validate');
    });


  $("#btnAddmobile").click(function(event) {
    // alertify.log("add");
      //console.log(validardatosmobile());
     var datos=validardatosmobile();
if (datos.estatus==true) {
  
 alertify.confirm("¿Estas seguro de realizar esta accion?", function (e) {
        if (e) {
          agregardatosMobile(datos);
            }
      else {
          alertify.error("Accion Cancelada");
        }
      });
      //return false;
}


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
            lctImei: {
                group: '.col-xs-4',
                validators: {
                    notEmpty: {
                        message: ' '
                    }
                }
            },
        
            
                            
        }
    });

$('.estatusaddmobile').on('ifClicked', function(event){
            
            }).iCheck({
              checkboxClass: 'icheckbox_square-green',
              radioClass: 'iradio_square-green',
              increaseArea: '50%'
            });


 });//end document ready

//--------------------------------------------------------------------------
function agregardatosMobile(value){
   //$("#myModalActualizar").modal("show");
   $.ajax({
      url : AjaxURL(),
    data : { action : "datosMobile", data:JSON.stringify(value) },
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
      alertify.alert('Disculpe, existió un problema al procesar los datos del mobile');
      // console.log(status);
    },
       complete : function(xhr, status) {
        //alert('Petición realizada');
       // console.log(status);
    }
});

}
//--------------------------------------------------------------------------

function validardatosmobile(){
  var vandera=true;
  var msg="";

var activo=$('#estatusaddmobile').is(':checked');
var clave=$("#lctImei").val().trim();
var comentario=$("#lctObservacion").val().trim();
var copr=$("#copr").val();

 if(clave==""){
   vandera=false;
   msg="IMEI requerido";
  
   $("#lctImei").focus();
}
/*/else if(comentario==""){
   vandera=false;
   msg="observacion requerida";
  
   $("#lctObservacion").focus();
}/*/

if(vandera==false){ alertify.error(msg);}
  
var datos={
  "activo":activo,
 "clave":clave,
"comentario":comentario,
"copr":copr
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