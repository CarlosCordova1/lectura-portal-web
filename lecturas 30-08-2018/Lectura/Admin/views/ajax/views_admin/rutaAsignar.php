<?php 
if($data1){
// $asignadoRUTALOCAL= $this->showrutaLocal();
  ?> 

          
<!-- panel-default -->
       <div class="panel panel-default">

  <div class="panel-heading">
    <label>Agregue rutas y/o lecturistas</label>
      <div class="pull-right panel-options">
                <a href="#" data-rel="collapse" id="actualizarTruta" data-toggle="tooltip" title="Actualizar tabla"><i class="glyphicon glyphicon-refresh"></i></a>                
              </div>
    </div>
   <div class="panel-body">
     
    <div class="row">
    <div class="col-sm-5">
         <div class="well well-sm">
         <label for="rutaAsignacionFecha">Programado para la fecha:</label>
           <div class="input-group date">
                          <input id="rutaAsignacionFecha" name="rutaAsignacionFecha" type="text" placeholder="Ingresa Fecha" class="form-control" value="<?php echo date("d/m/Y");?>">
                          <div class="input-group-addon" style="cursor: default;">
                              <label for="rutaAsignacionFecha" style="cursor: pointer;"><span class="glyphicon glyphicon-th" for="rutaAsignacionFecha"></span></label>
                          </div>
                        </div>
                       </div>
      </div> 
      <div class="col-sm-7">
        
      <div class="well well-sm">
      <label for="selectruta">Lote (L). Ruta (R). Total Medidores (TM)</label>
                 <div class="addruta form-group">
      <select name="origen[]"  id="selectruta"  class="form-control" >
      <option class="bg-warning" >Lote (L). Ruta (R). Total Medidores (TM)</option>
      <!--<option class="bg-info"  value="2">ruta 2 (asignada)</option>-->

      </select>
      </div>
         
         <br>
 

</div>
         </div>

      </div>
      
   
    
<div class="well well-sm">
  <div class="row">
  <div class="col-sm-5">
   <div class="row">
   <div class="col-xs-12">
         <!-- <label for="selectruta" class="col-form-label">Lote (L). Ruta (R). Total Medidores (TM)</label>-->

</div>
   </div>
   <div class="row">
<div class="col-xs-12">
      <label for="selectLecturista" class="col-form-label">Lecturista</label>
<div class="addruta form-group">
<select name="origen[]"  id="selectLecturista"  multiple="multiple" class="form-control" size="8">
<!--<option class="bg-warning" value="1">ruta 1</option>
<option class="bg-info"  value="2"> ruta 2 (asignado)</option>-->
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
     <label for="selectAsignacion" class="col-form-label">Asignacion</label>
     <!-- <div class="form-group">
<select name="destino[]" id="destino" multiple="multiple" id="selectAsignacion" class="form-control" size="8"></select>
</div>-->
<div class="form-group">
<select name="destino[]" id="destino" id="selectAsignacion"  multiple="multiple" class="form-control" size="8"></select>
</div>
    </div>
    </div>
    <div class="row">
   
    <div class="col-xs-8">
    <button type="button" class="submit btn btn-primary" id="addetiquetaAsignacion" value="">Agregar <i class="fa fa-floppy-o" aria-hidden="true"></i></button>      
    </div>
     <div class="col-xs-4">   
   <!-- <input type="text" class="form-control" maxlength="30" id="etiquetaAsignacion" placeholder="Etiqueta"> -->  
    </div>
    
    </div>

  </div>
</div>

</div>
<!--  -->
 <div id="Asginaciones">
  
    </div>
 </div>


  </div> <!-- end panel body -->
 </div> 

<style type="text/css">
.easy-autocomplete{ width: 100% !important;}
	</style>
  <link href="assets/select2-develop/dist/css/select2.min.css" rel="stylesheet" />
<script src="assets/select2-develop/dist/js/select2.min.js"></script>

<script type="text/javascript">
var lecturista_archivo=new Array();//para el archivo de rutaAsignada.php
  $(document).ready(function(evn) {
     $('.js-example-basic-single').select2();
 //-------------------------------------------------------------------------------------------
 /* 	var options = {
	data: ["blue", "green", "pink", "red", "yellow"]
};

$("#etiquetaAsignacion").easyAutocomplete(options);
*/
//--------------------------------------------------------------------------------------------
$('[data-toggle="tooltip"]').tooltip();
$('#selectruta').click(function(event) {
  //$("#selectLecturista option:selected").removeAttr("selected");
});

$('#selectLecturista').click(function(event) {
 // $("#selectruta option:selected").removeAttr("selected");
});

//$('.pasar').click(function() {  return !$('#selectruta option:selected').clone().appendTo('#destino'); });

$('.pasar').click(function() { 
 
  var valida=true;
   //var validaruta=true;
  $('#destino option').each(function() { 
     //alertify.error('-->'+$(this).attr("data-val"));
      var data=$(this).attr("data-val");
   //if($('#selectruta option:selected').attr("data-val")==data){
   //    valida=false;
   //}
   if($('#selectLecturista option:selected').attr("data-val")==data){
       valida=false;   }

     });

    if(valida){
      //$('#selectruta option:selected').clone().appendTo('#destino');
       $('#selectLecturista option:selected').clone().appendTo('#destino');
    }else{
      alertify.error('No se permite duplicar');
    }
  
   });

    $('.quitar').click(function() { return !$('#destino option:selected').remove(); });

    $('.pasartodos').click(function() { 
       $('#destino option').each(function() { $(this).remove(); });
      //$('#selectruta option').each(function() { $(this).clone().appendTo('#destino'); });
      $('#selectLecturista option').each(function() { $(this).clone().appendTo('#destino'); });
       });
    $('.quitartodos').click(function() { 
     // $('#destino option').each(function() { $(this).remove().appendTo('#selectruta'); });
      $('#destino option').each(function() { $(this).remove(); });
       });
   //$('.submit').click(function() { $('#destino option').prop('selected', 'selected'); });

//--------------------------------------------------------------------------------

$('#addetiquetaAsignacion').click(function(event) {
		var opciones ="";
		var dataopciones="";
		var haylecturista=false;
		var hayruta=false;
		var valruta=$('#selectruta').val();
		var lote =$('#selectruta option:selected').attr("data-lote");
		var lecturistas = [];

		if (valruta!="0" && valruta!="") {	hayruta=true;	 }

	 $('#destino option').each(function() { 
	 	opciones =$(this).attr("data-val");
	 	dataopciones =$(this).attr("data-option");
	 	// alertify.error('opciones --> '+opciones+ 'dataopciones --> '+dataopciones);
	 	 lecturistas.push(opciones);
	 	  if (dataopciones=="lecturista") {	haylecturista=true;	 }
	 });

	//var etiqueta= $("#etiquetaAsignacion").val().trim();
	var etiqueta="";
	  //alertify.log('etiqueta --> '+ etiqueta);

if(haylecturista){
	if(hayruta){
		//if(etiqueta!=""){
      var date=$('#rutaAsignacionFecha').val();

          alertify.confirm("¿Estas seguro de realizar esta accion?", function (e) {
        if (e) {
          AgregarAsignacion(etiqueta,date,valruta,lote,lecturistas);
        
          //alertify.success("AgregarAsignacion");
        } else {
          alertify.error("Accion Cancelada");
         // return false;
        }
      });



			
			//alertify.success('Agregar '+valruta);
			//$("#etiquetaAsignacion").val("");
			//console.log('Fecha '+date);
			//console.log('ruta '+valruta);
			//console.log('lecturistas ');
			//console.log(lecturistas);
		//}
			//else{
			//	$("#etiquetaAsignacion").focus();
			//	 alertify.log('Agregue una etiqueta a la asignacion');
			//}

	}else{

$("#selectruta").focus();
		 alertify.log('Seleccione una ruta');
	}

}
else{
	
	$("#selectLecturista").focus();
	 alertify.log('Agregue un lecturista como minimo');
}

});
//--------------------------------------------------------------------------------


var dateToday = new Date();
$('#rutaAsignacionFecha').datepicker({
    format: 'dd/mm/yyyy',
  todayBtn: "linked",
    language: "es",
    //startDate: '-3d',
    //minDate: 1,
     autoclose: true,
    todayHighlight: true

    
});

$("#actualizarTruta").click(function(event) {
  $("#r-Asignar").click();
  event.preventDefault();
});
//changeDate('<?php echo date("d/m/Y");?>');
$('#rutaAsignacionFecha').change(function(event) {
changeDate($(this).val());
});
    

//$("#r-Asignanada").click(function(event) {
   //RutaLoadAsignada('<?php echo date("d/m/Y");?>');
//});

$("#btnAddUsernuevo").click(function(event) {
   //ShowagregarUsuario();
});

  });

    //_---------------------------------------------------------
function changeDate(date){
  $('#destino option').each(function() { $(this).remove(); });
  console.log(date);
   $.ajax({
      url : AjaxURL(),
    data : { action : "show.R.L.A.",date:date },
    type : 'POST',
     dataType : 'JSON',
     beforeSend : function(xhr, status) {
    var befored='<option class="bg-warning" >Cargando...</option>';
     $('#selectLecturista').html(befored);
       $('#selectruta').html(befored);

      
    },
     success : function(json) {
     	RutaLoadAsignada(date);
       // $("#loadAgregarusuario").html(json); 
        console.log(json);
         if (json.status==1) {
           //alertify.success('sss  '+json.msg);
           	 var cont=0;
           	 var lecturista="";
           	 var Ruta="";
      $.each(json.datarespuesta[0].Lecturista,function(index, value){
               //console.log('My array has at position ' + index + ', this value: ' + value);
              lecturista+='<option class="bg-success" data-option="lecturista"  data-val="'+value.Clave+'" value="'+value.Clave+'">'+value.Nombre+" " +'</option>';
                lecturista_archivo.push((value.Clave+": "+value.Nombre).trim());
   $.each(value,function(indice, valor){
    cont++;
     //console.log('My array has at position ' + indice + ', this value: ' + valor);
             
});
 
});
       Ruta='<option   value="0">-------------------------------------------------------------</option>';
          $.each(json.datarespuesta[0].Ruta,function(index, value){
               //console.log('My array has at position ' + index + ', this value: ' + value);
                Ruta+='<option class="bg-info" data-option="ruta" data-lote="'+value.Lote+'" data-val="'+value.Ruta+'"  value="'+value.Ruta+'">(L '+value.Lote+') (R '+value.Ruta+") (TM "+value.TotalMedidor+') </option>';
 
});
//-----------------------------------------------------------------------------------------------------

  //var jsonrutaslocales=JSON.parse('<?php //echo json_encode($asignadoRUTALOCAL)?>');
    //console.log("jsonrutaslocales");
    //console.log(jsonrutaslocales);
var rutalocal="";
//console.log("jsonrutaslocales");
//console.log(jsonrutaslocales);
   // $.each(jsonrutaslocales.datarespuesta[0].Ruta,function(index, valor){
    $.each(json.datarespuesta[0].RutaLocal,function(index, valor){
              // console.log('My array has at position ' + index + ', this value: ' + valor);
        // console.log('My array has at position ' + indice + ', this value: ' + value);
      rutalocal+='<option class="bg-warning" data-option="ruta" data-lote="none" data-val="'+valor.Ruta+'"  value="'+valor.Ruta+'" > (R '+valor.Rutanombre+') (TM '+valor.TotMedidor+') Bitácora</option>'; 
});
   
//-----------------------------------------------------------------------------------------------------


       $('#selectLecturista').html(lecturista);
       $('#selectruta').html(Ruta+rutalocal);
       // console.log("------------------Ruta---------Ruta-----------------------");
       //console.log(Ruta);
       //console.log("------------rutalocal------------rutalocal--------------------------");
         //console.log(rutalocal);
          }else{
             alertify.error(''+json.msg);
              //alertify.error("Acion cancelada");
          }
    },
 
    error : function(xhr, status) {
      alertify.alert('Disculpe, existió un problema al actualizar la fecha');
       console.log(status);
    },
       complete : function(xhr, status) {
        //alert('Petición realizada');
       // console.log(status);
    }
});

}

//-----------------------------------------------------
function AgregarAsignacion(etiqueta,date,ruta,lote,value){
   $.ajax({
      url : AjaxURL(),
    data : { action : "AgregarAsignacionRuta",etiqueta:etiqueta,date:date,ruta:ruta,lote:lote,data:JSON.stringify(value) },
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
           RutaLoadAsignada(date);
        //$("#etiquetaAsignacion").val("");
        $('#selectruta option:selected').remove();
          }else{
             alertify.alert(' '+JSON.msg);
              alertify.error("Acion cancelada");
          }


        
    },
 
    error : function(xhr, status) {
      alertify.alert('Disculpe, existió un problema al asginar rutas y lecturistas');
      // console.log(status);
    },
       complete : function(xhr, status) {
        //alert('Petición realizada');
       // console.log(status);
    }
});

}
  //_---------------------------------------------------------


//-----------------------------------------------------
function RutaLoadAsignada(date){
   console.log("RutaLoadAsignada");
   $.ajax({
      url : AjaxURL(),
    data : { action : "loadtemplateAsignadaRuta",date:date },
    type : 'POST',
     dataType : 'html',
     beforeSend : function(xhr, status) {
     //$("#Asginaciones").html(gifLoad());
     $("#Asginaciones").fadeOut("fast");
      
    },
     success : function(html) {
        $("#Asginaciones").html(html); 
         $("#Asginaciones").fadeIn("slow");
        //alertify.log('Actualizado...');
    },
 
    error : function(xhr, status) {
      alertify.alert('Disculpe, existió un problema al mostrar la pagina de ruta asignada');
      console.log(status);
    },
       complete : function(xhr, status) {
        //alert('Petición realizada');
       // console.log(status);
    }
});

}
  //_---------------------------------------------------------
function ShowagregarUsuario(){
   $.ajax({
      url : AjaxURL(),
    data : { action : "loadtemplateEditUsuario", },
    type : 'POST',
     dataType : 'html',
     beforeSend : function(xhr, status) {
     $("#loadAgregarusuario").html(gifLoad());
      
    },
     success : function(html) {
        $("#loadAgregarusuario").html(html); 
    },
 
    error : function(xhr, status) {
      alertify.alert('Disculpe, existió un problema al mostrar la pagina de edicion');
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