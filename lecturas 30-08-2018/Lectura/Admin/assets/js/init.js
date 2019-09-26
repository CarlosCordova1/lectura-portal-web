$(document).ready(function() {
//ShowLecturaSoloLectura();






//cerrar sesion
$("#pageContentRegistrado").on("click","#logout",function(event) {
  logout();
});



  $("#pageContentRegistrado").on("click","#refreshTable",function(event) {
   // ShowEncuentas();
   ShowUsuario_admin();
});
 $('[data-toggle="tooltip"]').tooltip();




//iniciar sesion
$("#").on("click", function(){
  //alert("");
});
//$("#myModalLogin").modal("show");

$("#loginLectura").on("click", function(){
var datos=validarDatosLogin();
    if (datos.status==1) {
    login(datos);
  }
  else{
    alertify.error("Datos vacios");
  }
  //console.log(datos);
});

$( "#myModalLogin" ).keypress(function(e) {
  if(e.which == 13) {
    $("#loginLectura").click();
        event.preventDefault();
    }

});




//fecha
var dateToday = new Date();
$('#fechainicioconvenio').datepicker({
    format: 'yyyy-mm-dd',
  todayBtn: "linked",
    language: "es",
    startDate: '-3d',
    minDate: 1,
     autoclose: true,
    todayHighlight: true

    
});



//icheck
 // var callbacks_list = $('.demo-callbacks ul');
 //eventos --> ifCreated ifClicked ifChanged ifChecked ifUnchecked ifDisabled ifEnabled ifDestroyed
            $('.regimen-list input').on('ifClicked', function(event){
            //  callbacks_list.prepend('<li><span>#' + this.id + '</span> is ' + event.type.replace('if', '').toLowerCase() + '</li>');
            cargarplantilla($(this).val());
           // alert(event.type);
           // alert($('.regimen-list input:radio[name=regimen-radio]:checked').val());
            //alert($(this).val());
            }).iCheck({
              checkboxClass: 'icheckbox_square-blue',
              radioClass: 'iradio_square-blue',
              increaseArea: '20%'
            });


//alertas

$("#crearUsuario").on( 'click', function () {
      //reset();
      alertify.confirm("¿Estas seguro de realizar esta accion?", function (e) {
        if (e) {
           guardar();//
         //crearNuevoConvenio();
         // alertify.success("Datos Guardados");
        } else {
          alertify.error("Accion Cancelada");
        }
      });
      return false;
    });



$("#BtnGuardar").on( 'click', function () {//guardar antecedente
      //reset();

      alertify.confirm("¿Estas seguro de realizar esta accion?<br>Los datos se guardaran y por ahora no podras editarlos", function (e) {
        if (e) {
        
         //crearNuevoConvenio();
        // datosAntecentes();
         if(typeof datosAntecentes === 'function') {
    //Es seguro ejecutar la función
    var datos= datosAntecentes();
   // console.log(datos);
//si el valor es true lo guardo
if(datos.estatus){
 guardarAntecedentes(datos);
 //alert("datos listos para guardar");
}else{
  alertify.alert("datos vacios");
  alertify.error("Accion Cancelada");
}


}else{
  alertify.alert("funcion no definida");
  alertify.error("Accion Cancelada");
}


         //alertify.success("Datos Guardados");
        } else {
          alertify.error("Accion Cancelada");
        }
      });
      return false;
    });

$("#BtnGuardarDesarrollador").on( 'click', function () {//guardar desarrollador
      //reset();

      alertify.confirm("¿Estas seguro de realizar esta accion?<br>Los datos se guardaran y por ahora no podras editarlos", function (e) {
        if (e) {
        
               alertify.success("Datos Guardados test");
        } else {
          alertify.error("Accion Cancelada");
        }
      });
      return false;
    });



$('#FormConvenio').bootstrapValidator({
    //  live: 'disabled',
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok has-success has-feedback',
            invalid: 'glyphicon glyphicon-remove has-error has-feedback',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            lgnNombre: {
                group: '.col-xs-8',
                validators: {
                    notEmpty: {
                        message: ' '
                    }
                }
            },
        lgnUsuario: {
                group: '.col-xs-4',
                validators: {
                    notEmpty: {
                        message: ' '
                    }
                }
            },
          lgnPassw: {
                group: '.col-sm-4',
                validators: {
                    notEmpty: {
                        message: ' '
                    }
                }
            },
              lgnConPassw: {
                group: '.col-sm-4',
                validators: {
                    notEmpty: {
                        message: ' '
                    }
                }
            },

             lgnEmail: {
                group: '.col-sm-4',
                validators: {
                    notEmpty: {
                        message: ' '
                    }
                }
            },    
       
       
        }
    });


  // Validate the form manually
    $("body").on( 'click','#Formusuario',function() {
        $('#FormConvenio').bootstrapValidator('validate');
        
        //alert();
    });

$("body").on( 'submit','#Formusuario',function(event){

  // prevent default browser behaviour
  event.preventDefault();

  //do stuff with your form here

});
$("body").on( 'keypress','#Formusuario',function(e) {
  if(e.which == 13) {
        event.preventDefault();
    }
});

} );// end $(document).ready