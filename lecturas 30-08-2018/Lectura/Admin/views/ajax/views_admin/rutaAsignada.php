<?php
if($data1){
 $asignado= $this->showrutaLecturistaYaAsignado();

//echo json_encode($asignado["datarespuesta"][0] );


  ?> 
      <!--  panel panel-default-->
    <div class="panel panel-default">
  <div class="panel-heading"><label>Asignaciones</label>
<div class="pull-right panel-options">
                <a href="#" data-rel="collapse" id="actualizarTablaAsignaciones" data-toggle="tooltip" title="Actualizar tabla"><i class="glyphicon glyphicon-refresh"></i></a>                
              </div>
  </div>
  <div class="panel-body">
  <div class="listTableasinaciones">
   <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered table-hover" id="">
     <thead>
              <tr >
              <th  style="text-align: center;" ><i data-toggle="tooltip" title="Orden ascendente" class="fa fa-sort-numeric-asc" aria-hidden="true"></i></th>
               
                 <th style="text-align: center;" ><i data-toggle="tooltip" title="Lote" class="fa fa-tasks" aria-hidden="true"></i></th>
                <th style="text-align: center;" ><i data-toggle="tooltip" title="Ruta" class="fa fa-road" aria-hidden="true"></i></th>
               <th  style="text-align: center;" ><i data-toggle="tooltip" title="Lecturista" class="fa fa-user-o" aria-hidden="true"></i></th>
               <th  style="text-align: center;" ><i data-toggle="tooltip" title="Asignar ayuda" class="fa fa-user" aria-hidden="true"></i></th>
                              
                <th style="text-align: center;"> <i data-toggle="tooltip" title="Fecha de creacion" class="fa fa-calendar" aria-hidden="true"></i></th>
              <!--   <th style="text-align: center;"> <i data-toggle="tooltip" title="Ultima Modificacion" class="fa fa-calendar" aria-hidden="true"></i></th>-->
                 
               <!-- <th style="text-align: center;">
               <i data-toggle="tooltip" title="Editar" class="fa fa-pencil" aria-hidden="true"></i>
               </th>-->
                <th style="text-align: center;" > <i data-toggle="tooltip" title="Activo/Inactivo" class="fa fa-check-square-o" aria-hidden="true"></i></th>
              <!--   <th style="text-align: center;" ><i data-toggle="tooltip" title="Etiqueta" class="fa fa-tags" aria-hidden="true"></i></th>-->
                           
              </tr>
            </thead>
           
           <?php 
$con=0;
 foreach ($asignado["datarespuesta"][0]->Ruta as $key) {
  //echo "<br> key----".$key."  value--- ".$value;
   foreach ($key as $key2) {
  //var_dump($key2);

  // echo "<br> key----".$key."";
 

           ?>
              <tr class="odd gradeX">
                <td class="center" style="text-align: center;"><?php echo ++$con;?></td>
                
                <td class="center" style="text-align: center;">
                  <span class="label label-info"><?php echo $key2->Lote?></span>
                  
                </td>
                <td class="center" style="text-align: center;">
                  
                  <span class="label label-success"><?php 
                   if ($key2->Lote!="") { echo $key2->Ruta;} else {echo $key2->nameRutalocal; }
                  ?></span>
                  
                </td>


  <td class="center" style="text-align: center;">
 <?php $a="";
                 foreach ($key2->lecturista as $clave => $name) {
                  
                    $a=$a.$clave.": ".$name ."" ;
               echo ' <label class="label label-success"> '.$a .' </label> ' ."  " ;
                      ?>
                         <!-- <button type="button" class="btn btn-success">
                               <?php //echo $name?>   <span class="badge"><i class="fa fa-trash-o" style="color:red;"  aria-hidden="true"></i></span> </button>-->

    
                  <?php
                  
                } ?>
                 <!--</textarea>-->
          <!--<input   disabled="disabled"  placeholder='Lecturista...' data-clave="<?php echo $key2->ID_ASIG?>" value='<?php echo $a;?>'>-->


</td>

                
                <td class="center" style="text-align: center;">
    
                  <script  type="text/javascript">
					
<?php   ?>
//-------------------------------------------------------------------

var nuevolecturista<?php echo $con;?>  =new Array();

for (i = 0; i < lecturista_archivo.length; i++) {
    if (lecturista_archivo[i]!="<?php echo $a;?>"){
nuevolecturista<?php echo $con;?>.push(lecturista_archivo[i]);
    }
}





var input3_<?php echo $con;?> = document.querySelector('input[name=tags3_<?php echo $con;?>]'),
    tagify3_<?php echo $con;?> = new Tagify(input3_<?php echo $con;?>, {
        suggestionsMinChars : 1,
        maxTags             : nuevolecturista<?php echo $con;?>.length,
        blacklist           : ["<?php echo $a;?>"],
        enforeWhitelist     : true,
        callbacks : {
					        add    : onAddTag_<?php echo $con;?>,
					            remove : onRemoveTag_<?php echo $con;?>
					        },
        whitelist           : nuevolecturista<?php echo $con;?>
    })

tagify3_<?php echo $con;?>.on('maxTagsExceed', function(e){
    console.log(e, e.detail);
});

tagify3_<?php echo $con;?>.on('blacklisted', function(e){
    console.log(e, e.detail);
});

tagify3_<?php echo $con;?>.on('notWhitelisted', function(e){
    console.log(e, e.detail);
});
<?php   ?>
function onRemoveTag_<?php echo $con;?>(e){
					    console.log(e, e.detail);
					     console.log(e.detail.value);
					     labeltagAgragarEditar(e.detail.value.slice(0,4),'eliminar',$(".tags3_<?php echo $con;?>"));
					  		}

					function onAddTag_<?php echo $con;?>(e){
							    labeltagAgragarEditar(e.detail.value.slice(0,4),'agregar',$(".tags3_<?php echo $con;?>"));
					      console.log(e.detail.value);
					    }
                  </script>

              <!-- <textarea name="tags_<?php //echo $con;?>" placeholder='Lecturista'>-->
 					
                 <?php $b="";
                 foreach ($key2->lecturistaAyuda as $clave => $name) {
                  
                    $b=$b.$clave.": ".$name ."," ;
               /* // echo ' <label class="label label-success"> '.$name .' </label> ' ."  - " ;
                      ?>
                         <!-- <button type="button" class="btn btn-success">
                               <?php //echo $name?>   <span class="badge"><i class="fa fa-trash-o" style="color:red;"  aria-hidden="true"></i></span> </button>-->

    
                  <?php
                  */
                } ?>
                 <!--</textarea>-->
					<input class="tags3_<?php echo $con;?>" disabled="disabled" name='tags3_<?php echo $con;?>' placeholder='Lecturista...' data-clave="<?php echo $key2->ID_ASIG?>" value='<?php echo $b;?>'>
                </td>
                <td class="center" style="text-align: center;"><?php echo $key2->Asignacion?></td>
               <!-- <td class="center" style="text-align: center;"><?php echo $key2->fechaActualizacion?> </td>-->
                
                <!--<th style="text-align: center;">
                <a href="#" data-encuestaid="valor.encuestaid"  data-toggle="modal" data-target="#myModalAgregarAcliente"  class="agregarAcliente">
                Editar <i data-toggle="tooltip" title="Editar" class="fa fa-pencil" aria-hidden="true"></i>
                </a></th>-->
                <?php if($key2->estatus=='NVO' || $key2->estatus=='EJE'){?>
                 <td class="center" style="text-align: center;">
                 <input   class="estatusAsignacion disabled" disabled="disabled" type="checkbox" <?php echo ($key2->estatus=='NVO' || $key2->estatus=='EJE' ?"checked":"")?> />               
                </td>
                 <?php } else {?>
                   <td class="center" style="text-align: center;">
                 <input   class="estatusAsignacion" data-clave="<?php echo $key2->ID_ASIG?>"  value="<?php echo ($key2->estatus=='NVO' || $key2->estatus=='EJE' ?"0":"1")?>" type="checkbox" <?php echo ($key2->estatus=='NVO'|| $key2->estatus=='EJE' ?"checked":"")?> />               
                </td>
                  <?php } ?>
               <!-- <td class="center" style="text-align: center;"><span class="label label-primary"><?php //echo $key2->Label?></span></td>-->
                               
              </tr>
            <?php  
}
}
            ?>

            </tbody></table>

 </div>
  

  </div> <!-- end panel body -->
</div>

    

<script type="text/javascript">
//console.log("lecturista_archivo"); 
//console.log(lecturista_archivo);

console.log(<?php echo json_encode($asignado) ?>);
  $(document).ready(function(e) {

$( window ).resize(function() {
  //console.log('-------------scroll-----------');
  if ($( window ).width()<=700 ) {
  //  alertify.error("Accion scroll");
    $(".listTableasinaciones").addClass('pre-scrollable');
  }else{
    $(".listTableasinaciones").removeClass('pre-scrollable');
  }
  
});
 //-------------------------------------------------------------------------------------------
  /*/  var options = {
  data: ["blue", "green", "pink", "red", "yellow"]
};

$(".selectTag").easyAutocomplete(options);
/*/
//--------------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------


      


//---------------------------------------------------------------------------------------
$('[data-toggle="tooltip"]').tooltip();
    $('.listTableasinaciones').find('table').dataTable();
$("#actualizarTablaAsignaciones").click(function(event) {
   var date=$('#rutaAsignacionFecha').val();
  RutaLoadAsignada(date);//rutaAsignar.php
  event.preventDefault();
});

//--------------------------------------------------------------------------------------
//$('.estatusAsignacion').iCheck('check');
$('.estatusAsignacion').on('ifClicked', function(event){
  event.preventDefault();
  var clave= $(this).attr("data-clave");
             var val= $(this).val();     var objeto=$(this);
checkHelper(clave, val,objeto);

                       }).iCheck({
              checkboxClass: 'icheckbox_square-green',
              radioClass: 'iradio_square-green',
              increaseArea: '10%'
            });


$("#Asginaciones").on("click",".estatusAsignacion",function(event) {
$('.estatusAsignacion').on('ifClicked', function(event){
  var clave= $(this).attr("data-clave");
             var val= $(this).val();     var objeto=$(this);
checkHelper(clave, val,objeto);

                       }).iCheck({
              checkboxClass: 'icheckbox_square-green',
              radioClass: 'iradio_square-green',
              increaseArea: '10%'
            });
 var clave= $(this).attr("data-clave");
             var val= $(this).val();     var objeto=$(this);
checkHelper(clave, val,objeto);
   
});







  });//end cocument ready

function  checkHelper(clave, val,objeto){
  console.log("clave "+clave+ " val "+ val);


           alertify.confirm("¿Estas seguro de realizar esta accion?", function (e) {
        if (e) {
           cambiarStatusAsignacion(clave,val,objeto);//
        
          //alertify.success("estatus por validar---");
        } else {
          alertify.error("Accion Cancelada");

            if(objeto.prop("checked") == true){
//alert("Checkbox is unchecked." );
objeto.attr("checked",false);
//objeto.iCheck('ckecked');
objeto.parent('div').removeClass('checked');
}
else if(objeto. prop("checked") == false){
  //alert("Checkbox is checked." );
  objeto.attr("checked",true);
  objeto.iCheck('check');
}

         // return false;
        }
      });
       //return false;
}

/*/function cambiarStatusAsignacion(clave, val,objeto){
  alertify.success( clave +"  "+ val);
  if(val=="1"){
objeto.val(0);
  }else{objeto.val(1);}
  
}/*/

//--------------------------------------------------------------------------
function cambiarStatusAsignacion(clave, val,objeto){
  

   $.ajax({
      url : AjaxURL(),
    data : { action : "changeEstatusLecturista",clave:clave,val:val ,change:"asignacionruta" },
    type : 'POST',
     dataType : 'JSON',
     beforeSend : function(xhr, status) {
     //$("#LecturistaPerfil").html(gifLoad());
      
    },
     success : function(JSON) {
       // $("#LecturistaPerfil").html(html); 
 console.log(JSON);
         // $(".showloadmodal").html(html);
         if (JSON.status==1) {
           alertify.success(' '+JSON.msg);
           objeto.addClass('disabled');
           objeto.attr( 'disabled','disabled');

       if(val=="1"){
objeto.val(0);
  }else{objeto.val(1);}

          }else{
             alertify.alert(' '+JSON.msg);
              alertify.error("Acion cancelada");
          }



    },
 
    error : function(xhr, status) {
      alertify.alert('Disculpe, existió un problema al cambiar el estatus');
      // console.log(status);
    },
       complete : function(xhr, status) {
        //alert('Petición realizada');
       // console.log(status);
    }
});

}

//--------------------------------------------------------------------------
function labeltagAgragarEditar(clave, val,objeto){
    console.log("labeltagAgragarEditar");
 //var date=$('#rutaAsignacionFecha').val();
 claveruta= objeto.attr( 'data-clave');
  // alertify.log('claveuser -> '+clave+"  accion-> "+val +" idruta-> "+claveruta);

   $.ajax({
      url : AjaxURL(),
    data : { action : "changeEstatusAsignacion",clave:clave,val:claveruta ,change:val },
    type : 'POST',
     dataType : 'JSON',
     beforeSend : function(xhr, status) {
     //$("#LecturistaPerfil").html(gifLoad());
      
    },
     success : function(JSON) {
       // $("#LecturistaPerfil").html(html); 
 console.log(JSON);
         // $(".showloadmodal").html(html);
         if (JSON.status==1) {
           alertify.success(' '+JSON.msg);
          // objeto.addClass('disabled');
          // objeto.attr( 'disabled','disabled');

       if(val=="1"){
		//objeto.val(0);
  }else{//objeto.val(1);
  }

          }else{
             alertify.alert(' '+JSON.msg);
              alertify.error("Acion cancelada");
          }



    },
 
    error : function(xhr, status) {
      alertify.alert('Disculpe, existió un problema al cambiar el estatus del tag');
      // console.log(status);
    },
       complete : function(xhr, status) {
        //alert('Petición realizada');
       // console.log(status);
    }
});

}

/*/
//--------------------------------------------------------------------------------------------------
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

}/*/

</script>
       
<?php 
}
else{
  echo "Acceso no permitido...";
}
?>