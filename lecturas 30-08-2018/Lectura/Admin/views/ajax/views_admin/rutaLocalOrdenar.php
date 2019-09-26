<?php 
if($data1){
  $asignado= $this->showrutaLocal();
  //echo json_encode($asignado);
  ?> 

      <!-- panel panel-default-->
       <div class="panel panel-default">

  <div class="panel-heading">
    <label>Ordenar Secuencia</label>
      <div class="pull-right panel-options">
                <a href="#" data-rel="collapse" id="ActualizarRutaLocalOrdenar" data-toggle="tooltip" title="Actualizar tabla"><i class="glyphicon glyphicon-refresh"></i></a>                
              </div>
    </div>
   <div class="panel-body">
     
    <div class="row">
  
           <div class="col-sm-12">
        <div class="well well-sm">
<label for="selectrutalocalordenar">Ruta</label>
           <div class="form-group">
<select name="origen"  id="selectrutalocalordenar"  class="form-control" >
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
    <!-- List with handle -->
  <div id="listWithHandle" class="list-group pre-scrollable">
   
  <!--
    <div class="list-group-item move">
       <span class="badge">2</span>
      <span class="glyphicon glyphicon-move" aria-hidden="true"></span>
         </div>-->
 
   
  </div>
<div class="row">
<div class="col-sm-2"> <button id="guardarCAmbiosruta" type="button" class="btn btn-primary">Guardar cambios</button> </div> 
</div>
</div>
  </div> <!-- end panel body -->
 </div> <!-- end panel -->
 
<script type="text/javascript">
var jsonrutaslocales=JSON.parse('<?php echo json_encode($asignado)?>');
    console.log(jsonrutaslocales);

$(document).ready(function(ev) {
$('[data-toggle="tooltip"]').tooltip();

  $("#ActualizarRutaLocalOrdenar").click(function(event) {
  $("#rutalocalOrdenar").click();
  event.preventDefault();
});
//-------------------------------------------------------------------------------------
// List with handle
var listWithHandle = document.getElementById('listWithHandle');
//var sortable = Sortable.create(el);
Sortable.create(listWithHandle, {
  handle: '.move',  
  animation: 150,
  // Element is chosen
  onChoose: function (/**Event*/evt) {
   // evt.oldIndex;  // element index within parent
       //alertify.log("Accion onChoose "+ evt.oldIndex);
      // console.log(evt);
  },
  // Element dragging started
  onStart: function (/**Event*/evt) {
    //evt.oldIndex;  // element index within parent
    //alertify.log("Accion onStart "+ evt.oldIndex);
  },
onSort: function (/**Event*/evt) {
    // same properties as onUpdate
    // alertify.log("Accion onSort "+ evt.oldIndex);
  },
  // Event when you move an item in the list or between lists
  onMove: function (/**Event*/evt, /**Event*/originalEvent) {
    // Example: http://jsbin.com/tuyafe/1/edit?js,output
   // evt.dragged; // dragged HTMLElement
   // evt.draggedRect; // TextRectangle {left, top, right и bottom}
   // evt.related; // HTMLElement on which have guided
   // evt.relatedRect; // TextRectangle
   // originalEvent.clientY; // mouse position
    // return false; — for cancel


  },

});
//---------------------------------------------------------
$('#selectrutalocalordenar').change(function() {
     var idruta=$(this).val().trim();
     console.log(idruta);
   //alertify.success('idruta '+idruta);
$('#listWithHandle').html( Rutalocaldiv(idruta) );
$('[data-toggle="tooltip"]').tooltip();

});

//-----------------------------------------------------------
$("#guardarCAmbiosruta").click(function(event) {
  var idruta=$('#selectrutalocalordenar').val().trim();
   var dato=[];
$("#listWithHandle > div").each(function(index, el) {
   var medidor=$(this).data('medidor');
   var secuencia=$(this).data('secuencia');
   var index2=index+1;
  
  //alertify.success('index2  '+index2 + ' medidor  '+medidor + ' secuencia  '+secuencia);
  //console.log('index2  '+index2 + ' medidor  '+medidor + ' secuencia  '+secuencia);
 dato.push({ "secuencia":secuencia, "Nuevoorden":index2,"IdMedidor":medidor});
});
console.log(dato);

 alertify.confirm("¿Estas seguro de realizar esta accion?", function (e) {
        if (e) {                 
         agregarOrdenSecuenciaRutaLocal(dato,idruta);
        } else {
          alertify.error("Accion Cancelada");
         // return false;
        }
      });
  });


});//end document ready
//-------------------------------------------------------------------------------------
//-----------------------------------------------------
 function Rutalocaldiv(ruta){
if (ruta==0 || ruta=="0") {
//$("#BTN_guardarRutalocalEditado").attr("disabled",'disabled').addClass('disabled');

}
else{
//$("#BTN_guardarRutalocalEditado").removeAttr("disabled").removeClass('disabled');
  var jsonrutaslocales=JSON.parse('<?php echo json_encode($asignado)?>');
  //  console.log(jsonrutaslocales);
var div="";
//console.log("jsonrutaslocales");
//console.log(jsonrutaslocales);
    $.each(jsonrutaslocales.datarespuesta[0].Ruta,function(index, valor){
              //console.log('My array has at position ' + index + ', this value: ' + valor);
             // console.log(valor);
  if (valor.IdRlocal==ruta) {
  var uno=0;
    $.each(valor.Medidor,function(indice, value){
      uno++;
     //  console.log('My array has at position ' + indice + ', this value: ' + value);
     //   console.log(indice);
     // select+='<option class="bg-warning" title="(M '+value.Numeromedidor+') ('+value.Direccion+')" data-option="Medidor"  data-val="'+value.Idmedidor+'"  value="'+value.Idmedidor+'">(M '+value.Numeromedidor+') ('+value.Direccion+')</option>';
      div+='<div class="bg-warning list-group-item move" data-toggle="tooltip" title="Medidor '+value.Numeromedidor+'" data-option="Medidor"  data-medidor="'+value.Idmedidor+'" data-secuencia="'+value.Secuencia+'" >'+
      '<span class="badge secuencia">Secuencia: '+value.Secuencia+' </span> '+
      ' <span class="badge"> Medidor  '+value.Numeromedidor+' </span>&nbsp;&nbsp;  '+value.Direccion+'</div>';
     
});

}
 
 
});

}

   return div;
 }
 //-----------------------------------------------------
function agregarOrdenSecuenciaRutaLocal(value,ruta){
   console.log(value);
console.log("ruta  " + ruta);
   $.ajax({
      url : AjaxURL(),
    data : { action : "OrdenarSecuenciaRutaLocal",ruta:ruta,data:JSON.stringify(value) },
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
         $("#rutalocalOrdenar").click();
         //$('#selectrutalocalordenar option[value='+ruta+']').attr('selected','selected').change();
        //$("#etiquetaAsignacion").val("");
        //$('#selectruta option:selected').remove();
       // RutaLocalLoadGestionar();
          }else{
             alertify.alert(' '+JSON.msg);
              alertify.error("Acion cancelada");
          }
    },
 
    error : function(xhr, status) {
      alertify.alert('Disculpe, existió un problema al ordenar la secuencia');
      console.log(status);
    },
       complete : function(xhr, status) {

    }
});

}
  //_---------------------------------------------------------
</script>
       
<?php 
}
else{
  echo "Acceso no permitido...";
}
?>  
<style type="text/css">
  .move {
  cursor: move;
  cursor: -webkit-grabbing;
}
.secuencia{
  float: left !important;
}
</style>