<?php 
if($data1){
  $asignado= $this->showrutaLocal();
  //echo json_encode($asignado);
  ?> 

      <!-- panel panel-default-->
       <div class="panel panel-default">

  <div class="panel-heading">
    <label>Crear/Gestion</label>
      <div class="pull-right panel-options">
                <a href="#" data-rel="collapse" id="ActualizarRutaLocal" data-toggle="tooltip" title="Actualizar tabla"><i class="glyphicon glyphicon-refresh"></i></a>                
              </div>
    </div>
   <div class="panel-body">
     
    <div class="row">
    <div class="col-sm-6">
         <div class="well well-sm">
         <label for="rutalocalSelec1">Buscar Contrato</label>
         <div class="input-group">

      <input type="text" id="search" value='13401,1072' class="form-control" maxlength="1000" placeholder=" Buscar... Contrato,Contrato2,Contrato3,Contrato4,etc..." name="search">
      <div class="input-group-btn">
        <button id="contrato"  class="btn btn-default"  data-toggle="tooltip" title="Buscar Contrato" type="button"><i class="glyphicon glyphicon-search"></i></button>
      </div> 
          
         </div>
          </div>
          </div> 
           <div class="col-sm-6">
        <div class="well well-sm">
<label for="rutalocalSelec1">Editar</label>
           <div class="addruta form-group">
<select name="origen"  id="rutalocalSelec1"  class="form-control" >
<option class="bg-warning" value="0" >Ruta (R). Total Medidores (TM)</option>
<!--<option class="bg-info"  value="2">ruta 2 (asignada)</option>-->
               <?php 
$con=0;
 foreach ($asignado["datarespuesta"][0]->Ruta as $key) {
?>
                
<option class="bg-info" data-value='<?php echo $key->IdRlocal?>' value="<?php echo $key->IdRlocal?>" >(R. <?php echo $key->Ruta?>) (TM. <?php echo $key->TotMedidor?>)</option>              
             

<?php } ?>

</select>
</div>
   </div>
          </div> 
      
      
    </div>
    
<div class="well well-sm">
  <div class="row">
  <div class="col-sm-5">
   <div class="row">
   <div class="col-xs-12">
          <label for="selectrutalocal" class="col-form-label">Medidores</label>
<div class="addruta form-group">
<select name="origen[]" id="selectrutalocal" multiple="multiple" class="form-control" size="8">

</select>
</div>
</div>
   </div>
  
    
  
  </div>
  <div class="col-sm-3">  <br><br><br>
   <div class="row">
  <div class="col-xs-6">
     <button type="button" data-toggle="tooltip" title="Agregar Seleccion" class="pasar izq btn btn-info" value="">
       <i class="fa fa-arrow-right" aria-hidden="true"></i> <i class="fa fa-arrow-right" aria-hidden="true"></i>
     </button>
  </div>
  <div class="col-xs-6">
    <button  type="button" data-toggle="tooltip" title="Quitar Seleccion" class="quitar der btn btn-warning" value="">
    <i class="fa fa-arrow-left" aria-hidden="true"></i> <i class="fa fa-arrow-left" aria-hidden="true"></i> </button>
  </div>

 </div><br>
  <div class="row">
    <div class="col-xs-6">
    <button type="button" data-toggle="tooltip" title="Agregar todos" class="pasartodos izq btn btn-info" value=""> 
    <i class="fa fa-arrow-circle-right" aria-hidden="true"> </i> <i class="fa fa-arrow-circle-right" aria-hidden="true"> </i></button>
    </div>
    <div class="col-xs-6">
    <button type="button" data-toggle="tooltip" title="Quitar todos" class="quitartodos der btn btn-danger" value="">
    <i class="fa fa-arrow-circle-o-left" aria-hidden="true"></i> <i class="fa fa-arrow-circle-o-left" aria-hidden="true"></i> </button>
    </div>
  </div>


  </div>
  <div class="col-sm-4">
    <div class="row">
    <div class="col-xs-12">
     <label for="selectAsignacion" class="col-form-label">Asignación</label>
      <div class="form-group">
<select name="destino[]" multiple="multiple" id="selectAsignacion" class="form-control" size="8"></select>
</div>
    </div>
    </div>
    <div class="row">
    <div class="col-xs-7">   
    <input type="text" class="form-control" id="LBNrutaLocal" maxlength="20" placeholder="Nombre de ruta local">   
    </div>
    <div class="col-xs-2">
    <button type="button" data-toggle="tooltip" title="Nuevo" id="BTN_agregarRutalocal" class="submit btn btn-primary" value=""><i class="fa fa-floppy-o" aria-hidden="true"></i></button>      
    </div>
    <div class="col-xs-2">
    <button type="button" data-toggle="tooltip" title="Actualizar" id="BTN_guardarRutalocalEditado" disabled="disabled" class="submit btn btn-info disabled" value=""> <i class="fa fa-refresh" aria-hidden="true"></i></button>      
    </div>
    
    </div>

  </div>
</div>
</div>
 <div id="AsginacionesRutasLocales">
  
    </div>

  </div> <!-- end panel body -->
 </div> <!-- end panel -->
 
<script type="text/javascript">
  $(document).ready(function($) {
   // var jsonrutaslocales=JSON.parse('<?php //echo json_encode($asignado)?>');
    //console.log(jsonrutaslocales);
$('[data-toggle="tooltip"]').tooltip();

$("#ActualizarRutaLocal").click(function(event) {
  $("#rutalocalCrear").click();
  event.preventDefault();
});
//-------------------------------------------------------------------------------------
$('#contrato').click(function(event) {
  var contrato=$('#search').val().trim();
  console.log(contrato);
showContratosbuscado(contrato);
});

$('#search').keypress(function (e) {
   var contrato=$(this).val().trim();
 var key = e.which;
 if(key == 13)  // the enter key code
  {
     console.log(contrato);
    showContratosbuscado(contrato);
    return false;  
  }
}); 

//-------------------------------------------------------------------------------------
 RutaLocalLoadGestionar();

//-------------------------------------------------------------------------------------

$('.pasar').click(function() { 
 
  var valida=true;
   //var validaruta=true;
  $('#selectAsignacion option').each(function() { 
     //alertify.error('-->'+$(this).attr("data-val"));
      var data=$(this).attr("data-val");
   //if($('#selectruta option:selected').attr("data-val")==data){
   //    valida=false;
   //}
   if($('#selectrutalocal option:selected').attr("data-val")==data){
       valida=false;   }

     });

    if(valida){
      //$('#selectruta option:selected').clone().appendTo('#destino');
       $('#selectrutalocal option:selected').clone().appendTo('#selectAsignacion');
    }else{
      alertify.error('No se permite duplicar');
    }
  
   });

//-------------------------------------------------------------------------------------
$('#rutalocalSelec1').change(function() {
     var idruta=$(this).val().trim();
   //alertify.success('idruta '+idruta);
$('#selectAsignacion').html( addrutaslocalesselect(idruta) );


});
//-------------------------------------------------------------------------------------
//$('.pasar').click(function() { return !$('#selectrutalocal option:selected').remove().appendTo('#selectAsignacion'); });
//$('.pasar').click(function() { return !$('#origen2 option:selected').remove().appendTo('#selectAsignacion'); });

    //$('.quitar').click(function() { return !$('#selectAsignacion option:selected').remove().appendTo('#selectrutalocal'); });
    $('.quitar').click(function() { return !$('#selectAsignacion option:selected').remove(); });

    $('.pasartodos').click(function() {
      $('#selectAsignacion option').each(function() { $(this).remove(); });
     $('#selectrutalocal option').each(function() { $(this).remove().appendTo('#selectAsignacion'); }); });
    $('.quitartodos').click(function() { $('#selectAsignacion option').each(function() { $(this).remove(); }); });
    $('.submit').click(function() { $('#selectAsignacion option').prop('selected', 'selected'); });
    

//----------------------------------------------------------------------------
$("#BTN_agregarRutalocal").click(function(event) {
  var labelruta=$("#LBNrutaLocal").val().trim();
var valasignacion=$('#selectAsignacion').val();

var medidor = [];
var contrato = [];
 $('#selectAsignacion option').each(function() { 
    opciones =$(this).attr("data-val");
     opcionescontrato =$(this).attr("data-contrato");
   // dataopciones =$(this).attr("data-option");
    // alertify.error('opciones --> '+opciones+ 'dataopciones --> '+dataopciones);
     medidor.push(opciones);
      contrato.push(opcionescontrato);
      //if (dataopciones=="lecturista") { haylecturista=true;  }
   });




if (valasignacion) {
 
  if (labelruta!="") {
   alertify.confirm("¿Estas seguro de realizar esta accion?", function (e) {
        if (e) {
          agregarRutaLocal(medidor,labelruta,contrato);
        
          //alertify.success("AgregarAsignacion");
        } else {
          alertify.error("Accion Cancelada");
         // return false;
        }
      });



  }else{
    alertify.error("Agregue nombre a la ruta local");
    $("#LBNrutaLocal").focus();
  }


}
else{
   alertify.error("Agregue un medidor");
    $("#LBNrutaLocal").focus();
}



  
  });

//----------------------------------------------------------------------------
$("#BTN_guardarRutalocalEditado").click(function(event) {
  
  var idlabel=$('#rutalocalSelec1').val();
var valasignacion=$('#selectAsignacion').val();

var medidor = [];
var contrato = [];
 $('#selectAsignacion option').each(function() { 
    opciones =$(this).attr("data-val");
    opcionescontrato =$(this).attr("data-contrato");
   // dataopciones =$(this).attr("data-option");
    // alertify.error('opciones --> '+opciones+ 'dataopciones --> '+dataopciones);
     medidor.push(opciones);
      contrato.push(opcionescontrato);
      //if (dataopciones=="lecturista") { haylecturista=true;  }
   });

   alertify.confirm("¿Estas seguro de realizar esta accion?", function (e) {
        if (e) {                 
          RutaLocalEditado(medidor,idlabel,contrato);
                  //alertify.success("AgregarAsignacion");
        } else {
          alertify.error("Accion Cancelada");
         // return false;
        }
      });
  });

  });//end document ready
//-------------------------------------------------------------------------------------
    //_---------------------------------------------------------
function showContratosbuscado(contrato){
  $('#destino option').each(function() { $(this).remove(); });
  //alertify.log(contrato);
   $.ajax({
      url : AjaxURL(),
    data : { action : "show.contrato",contrato:contrato },
    type : 'POST',
     dataType : 'JSON',
     beforeSend : function(xhr, status) {
    var befored='<option class="bg-warning" >Buscando...</option>';
    // $('#selectLecturista').html(befored);
       $('#selectrutalocal').html(befored);

      
    },
     success : function(json) {
       console.log(json);  
     // RutaLoadAsignada(contrato);
       // $("#loadAgregarusuario").html(json); 
        console.log(json);
         if (json.status==1) {
           //alertify.success('sss  '+json.msg);
             var cont=0;
             var lecturista="";
             var Medidor="";
  /*
      $.each(json.datarespuesta[0].Lecturista,function(index, value){
               //console.log('My array has at position ' + index + ', this value: ' + value);
                //console.log(index);     
                //console.log(value);
                lecturista+='<option  class="bg-success" data-option="lecturista"  data-val="'+value.Clave+'" value="'+value.Clave+'">'+value.Nombre+" "+value.Apaterno +'</option>';
                lecturista_archivo.push(value.Clave+": "+value.Nombre+" "+value.Apaterno);
   $.each(value,function(indice, valor){
    cont++;
     //console.log('My array has at position ' + indice + ', this value: ' + valor);
    //console.log(valor); // var soloEditar="";
              
});
  //console.log(lecturista);
 
});
*/

     //  Medidor='<option   value="0">-------------------------------------------------------------</option>';
        Medidor='';
          $.each(json.datarespuesta[0].Medidor,function(index, value){
               //console.log('My array has at position ' + index + ', this value: ' + value);
                //console.log(index);     
                //console.log(value);
              //  Medidor+='<option class="bg-info" data-option="Medidor" data-lote="'+value.Lote+'" data-val="'+value.Medidor+'"  value="'+value.Medidor+'">(M '+value.Medidor+') (CLT '+value.Cliente+') (CTR '+value.Contrato+') (DIR '+value.Direccion+')    </option>';

Medidor+='<option class="bg-info" title="(M '+value.Medidor+') ('+value.Direccion+')" data-option="Medidor"  data-val="'+value.Idmedidor+'"  data-contrato="'+value.contrato+'"  value="'+value.Idmedidor+'">(M '+value.Medidor+') ('+value.Direccion+')</option>';

   $.each(value,function(indice, valor){
    cont++;
     //console.log('My array has at position ' + indice + ', this value: ' + valor);
    //console.log(valor); // var soloEditar="";
              
});
  //console.log(lecturista);
 
});
       //$('#selectLecturista').html(lecturista);
       $('#selectrutalocal').html(Medidor);

          }else{
             alertify.error(''+json.msg);
              //alertify.error("Acion cancelada");
          }
    },
 
    error : function(xhr, status) {
      alertify.alert('Disculpe, existió un problema al buscar contrato');
      // console.log(status);
    },
       complete : function(xhr, status) {
        //alert('Petición realizada');
       // console.log(status);
    }
});

}

//-----------------------------------------------------
 function addrutaslocalesselect(ruta){
if (ruta==0 || ruta=="0") {
$("#BTN_guardarRutalocalEditado").attr("disabled",'disabled').addClass('disabled');

}
else{
$("#BTN_guardarRutalocalEditado").removeAttr("disabled").removeClass('disabled');
  var jsonrutaslocales=JSON.parse('<?php echo json_encode($asignado)?>');
  //  console.log(jsonrutaslocales);
var select="";
console.log("jsonrutaslocales");
console.log(jsonrutaslocales);
    $.each(jsonrutaslocales.datarespuesta[0].Ruta,function(index, valor){
             //  console.log('My array has at position ' + index + ', this ruta: ' + ruta);
  
if (valor.IdRlocal==ruta) {
    $.each(valor.Medidor,function(indice, value){
      // console.log('My array has at position ' + indice + ', this value: ' + value);
      select+='<option class="bg-warning" title="(M '+value.Numeromedidor+') ('+value.Direccion+')" data-option="Medidor"  data-val="'+value.Idmedidor+'" data-contrato="'+value.contrato+'"  value="'+value.Idmedidor+'">(M '+value.Numeromedidor+') ('+value.Direccion+')</option>';
     
});

}
 
 
});

}

   return select;
 }


//-----------------------------------------------------
function RutaLocalEditado(value,idlabel,contrato){
   console.log(value);
    console.log(idlabel);
  $.ajax({
      url : AjaxURL(),
    data : { action : "AgregarAsignacionRutaLocalEditado",idetiqueta:idlabel,data:JSON.stringify(value),contrato:JSON.stringify(contrato) },
    type : 'POST',
     dataType : 'JSON',
     beforeSend : function(xhr, status) {
     //$("#Asginaciones").html(gifLoad());
   //alertify.success('enviando...');
      
      
    },
     success : function(JSON) {
                console.log(JSON);
  if (JSON.status==1) {
           alertify.success(' '+JSON.msg);
          // RutaLoadAsignada(date);
        //$("#etiquetaAsignacion").val("");
        //$('#selectruta option:selected').remove();
        RutaLocalLoadGestionar();
          }else{
             alertify.alert(' '+JSON.msg);
              alertify.error("Acion cancelada");
          }
    },
 
    error : function(xhr, status) {
      alertify.alert('Disculpe, existió un problema al editar ruta local');
      console.log(status);
    },
       complete : function(xhr, status) {

    }
});

}
  //_---------------------------------------------------------

//-----------------------------------------------------
function agregarRutaLocal(value,label,contrato){
   console.log(value);
    console.log(label);
   $.ajax({
      url : AjaxURL(),
    data : { action : "AgregarAsignacionRutaLocal",etiqueta:label,data:JSON.stringify(value),contrato:JSON.stringify(contrato) },
    type : 'POST',
     dataType : 'JSON',
     beforeSend : function(xhr, status) {
     //$("#Asginaciones").html(gifLoad());
   //alertify.success('enviando...');
      
      
    },
     success : function(JSON) {
                console.log(JSON);
  if (JSON.status==1) {
           alertify.success(' '+JSON.msg);
          // RutaLoadAsignada(date);
        //$("#etiquetaAsignacion").val("");
        //$('#selectruta option:selected').remove();
        RutaLocalLoadGestionar();
          }else{
             alertify.alert(' '+JSON.msg);
              alertify.error("Acion cancelada");
          }
    },
 
    error : function(xhr, status) {
      alertify.alert('Disculpe, existió un problema al agregar ruta local');
      console.log(status);
    },
       complete : function(xhr, status) {

    }
});

}
  //_---------------------------------------------------------

//-----------------------------------------------------
function RutaLocalLoadGestionar(){
   $.ajax({
      url : AjaxURL(),
    data : { action : "loadtemplateRutaLocalGestionar", },
    type : 'POST',
     dataType : 'html',
     beforeSend : function(xhr, status) {
     $("#AsginacionesRutasLocales").html(gifLoad());
      
    },
     success : function(html) {
        $("#AsginacionesRutasLocales").html(html); 

    },
 
    error : function(xhr, status) {
      alertify.alert('Disculpe, existió un problema al mostrar la pagina de ruta local gestionar');
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