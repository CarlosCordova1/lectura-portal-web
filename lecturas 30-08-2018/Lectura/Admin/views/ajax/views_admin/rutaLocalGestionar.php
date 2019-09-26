<?php 
if($data1){
  $asignado= $this->showrutaLocal();
  //var_dump($asignado);
  ?> 

    <!-- panel panel-default--> 
             <div class="panel panel-default">
  <div class="panel-heading"><label>Rutas locales</label>
<div class="pull-right panel-options">
                <a href="#" data-rel="collapse" id="rutaslocalgestiodana" data-toggle="tooltip" title="Actualizar tabla"><i class="glyphicon glyphicon-refresh"></i></a>                
              </div>
  </div>
  <div class="panel-body">
  <div class="listTablerutalocal">
   <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered table-hover" id="example1">
     <thead>
              <tr >
              <th  style="text-align: center;" ><i data-toggle="tooltip" title="Orden ascendente" class="fa fa-sort-numeric-asc" aria-hidden="true"></i></th>
                <th style="text-align: center;" ><i data-toggle="tooltip" title="Ruta" class="fa fa-road" aria-hidden="true"></i></th>
                 <th style="text-align: center;" ><i data-toggle="tooltip" title="Medidor" class="fa fa-clock-o" aria-hidden="true"></i></th>
                                            
                <th style="text-align: center;"> <i data-toggle="tooltip" title="Fecha Creacion" class="fa fa-calendar" aria-hidden="true"></i></th>
                <th style="text-align: center;"> <i data-toggle="tooltip" title="Fecha Actualizacion" class="fa fa-calendar" aria-hidden="true"></i></th>
                 <th style="text-align: center;" > <i data-toggle="tooltip" title="Activo/Inactivo" class="fa fa-check-square-o" aria-hidden="true"></i></th>    
              </tr>
            </thead>
               <?php 
$con=0;
 foreach ($asignado["datarespuesta"][0]->Ruta as $key) {
?>
           <tr class="odd gradeX">
                <td class="center" style="text-align: center;"><?php echo ++$con;?></td>
              <td class="center" style="text-align: center;">
                                <span class="label label-info" data-toggle="tooltip" title="<?php echo $key->Ruta?>"><?php echo $key->Ruta?></span>
                            </td>                
               
                <td class="center" style="text-align: center;">                  
                  <span class="label label-success" data-toggle="tooltip" title="<?php echo $key->TotMedidor?>" ><?php echo $key->TotMedidor?> </span>              
                  
                </td>
                <td class="center"  style="text-align: center;">
                <span data-toggle="tooltip" title="Fecha Creacion" ><?php echo $key->Asignacion?></span></td>
                <td class="center"  style="text-align: center;">
                <span data-toggle="tooltip" title="Fecha Actualizacion" ><?php echo $key->fechaFin?></span></td>
                    <td class="center" style="text-align: center;">
               <!--  <input   class="estatusAsignacion" data-clave="<?php echo $key->IdRlocal?>"  value="<?php echo ($key->estatus==1?"0":"1")?>" type="checkbox" <?php echo ($key->estatus==1?"checked":"")?> />  -->             
                </td>
                 
                
                
                                             
              </tr>
             
             <?php 
          }
                 ?>
             

            </tbody></table>

 </div>
  

  </div> <!-- end panel body -->
</div> <!-- end panel -->
   
<script type="text/javascript">
  console.log(<?php echo json_encode($asignado) ?>);
  
  $(document).ready(function($) {

$( window ).resize(function() {
  //console.log('-------------scroll-----------');
  if ($( window ).width()<=700 ) {
  //  alertify.error("Accion scroll");
    $(".listTablerutalocal").addClass('pre-scrollable');
  }else{
    $(".listTablerutalocal").removeClass('pre-scrollable');
  }
  
});
 //-------------------------------------------------------------------------------------------


$("#rutaslocalgestiodana").click(function(event) {
   RutaLocalLoadGestionar();
  event.preventDefault();
});
    
$('[data-toggle="tooltip"]').tooltip();

    $('.listTablerutalocal').find('table').dataTable();

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

  });//end document ready
//----------------------------------------------------------------------------------------------
function  checkHelper(clave, val,objeto){
  //console.log(objeto.attr('checked', true));


           alertify.confirm("¿Estas seguro de realizar esta accion?", function (e) {
        if (e) {
           cambiarStatusrutalocalAsignacion(clave,val,objeto);//
        
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
//--------------------------------------------------------------------------
function cambiarStatusrutalocalAsignacion(clave, val,objeto){
  console.log(clave);
  console.log(val);
  console.log(objeto);

   $.ajax({
      url : AjaxURL(),
    data : { action : "changeEstatusRutaLocal",clave:clave,val:val ,change:"estatusrutalocal" },
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

</script>
       
<?php 
}
else{
  echo "Acceso no permitido...";
}
?>  