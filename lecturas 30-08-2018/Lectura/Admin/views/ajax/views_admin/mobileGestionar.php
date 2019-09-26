<?php 
if($data1){
 // var_dump($mobileGestionar);
 
  ?>  
   <!-- -->
  <div class="panel panel-default">
  <div class="panel-heading"><label>Gestionar</label></div>
  <div class="panel-body">
       <div class="pull-right panel-options">
                <a href="#" data-rel="collapse" id="actualizarTmobile" data-toggle="tooltip" title="Actualizar tabla"><i class="glyphicon glyphicon-refresh"></i></a>
                
              </div>
 <div class="listTableLecturista">
   <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered table-hover" id="example1">
     <thead>
              <tr >
              <th  style="text-align: center;" ><i data-toggle="tooltip" title="Orden ascendente" class="fa fa-sort-numeric-asc" aria-hidden="true"></i></th>
                <th style="text-align: center;" ><i data-toggle="tooltip" title="Folio"  class="fa fa-slack" aria-hidden="true"></i></th>
                <th style="text-align: center;" ><i data-toggle="tooltip" title="IMEI" class="fa fa-key" aria-hidden="true"></i></th>
                <!--<th style="text-align: center;" ><i data-toggle="tooltip" title="Marca" class="fa fa-info-circle" aria-hidden="true"></i></th>
                <th style="text-align: center;" ><i data-toggle="tooltip" title="Modelo" class="fa fa-info-circle" aria-hidden="true"></i></th>  -->                          
                <th style="text-align: center;"> <i data-toggle="tooltip" title="Fecha de creacion" class="fa fa-calendar" aria-hidden="true"></i></th>
                 <th style="text-align: center;"> <i data-toggle="tooltip" title="Ultima Modificacion" class="fa fa-calendar" aria-hidden="true"></i></th>
                 <th style="text-align: center;" ><i data-toggle="tooltip" title="Comentario" class="fa fa-comment" aria-hidden="true"></i></th>
                 <th style="text-align: center;" > <i data-toggle="tooltip" title="Activo/Inactivo" class="fa fa-check-square-o" aria-hidden="true"></i></th>
                                   <th style="text-align: center;" ><i data-toggle="tooltip" title="Centro de operacion" class="fa fa-briefcase" aria-hidden="true"></i></th>
               
               
                           
              </tr>
            </thead>
            <tbody>
            <?php  $cont=0;
            foreach ($mobileGestionar[0]->Mobile as $key => $value) {
              $cont++;
 
     ?>
                            <tr class="odd gradeX">
                <td class="center" style="text-align: center;"><?php echo $cont?></td>
                <td class="center" style="text-align: center;">
                <label data-toggle="tooltip" title="Folio" ><?php echo $value->Folio?> </label></td>
                <td class="center" style="text-align: center;"> 
                <label data-toggle="tooltip" title="IMEI" > <?php echo $value->Clave?> </label>
                </td>
               <!-- <td class="center" style="text-align: center;">
                <label data-toggle="tooltip" title="Marca" ><?php //echo $value->Marca?></label>               
                </td>
                <td class="center" style="text-align: center;"> <a href="#" data-encuestaid="valor.encuestaid"  data-toggle="modal" data-target="#"  class="agregarAcliente1">
                <label data-toggle="tooltip" title="Modelo" >
                <?php //echo $value->Modelo?> </label>
                 
                </a></td>-->
                               
               
                 <th style="text-align: center;">
                 <label data-toggle="tooltip" title="Fecha de Creacion" >
                <?php echo $value->Fecharegistro?> </label></th>
                <th style="text-align: center;">
                <label data-toggle="tooltip" title="Ultima modificacion" >
                <?php echo $value->Fechamodificacion?> </label></th>
                   
                    <td class="center" style="text-align: center;">
                <label data-toggle="tooltip" title="Comentario" >
                <?php echo $value->Comentario?> </label>
               </td> 
              
              <td class="center" style="text-align: center;">
                 <input   class="estatusGM" data-clave="<?php echo $value->Clave?>"  value="<?php echo ($value->Estatus==1?"0":"1")?>" type="checkbox" <?php echo ($value->Estatus==1?"checked":"")?> />
                
                </td>
                <td class="center" style="text-align: center;">
                <label data-toggle="tooltip" title="Centro de operacion" >
                <?php echo $value->copr?> </label>
               </td> 

                               
              </tr>
              <?php 
              }
             ?>
             

            </tbody></table>

 </div>
  

  </div> <!-- end panel body -->
</div>
<script type="text/javascript">
//console.log('-------------scroll-----------');
if ($( window ).width()<=856 ) {
  //  alertify.error("Accion scroll");
    $(".listTableLecturista").addClass('pre-scrollable');
  }else{
    $(".listTableLecturista").removeClass('pre-scrollable');
  }
//console.log('-------------scroll-----------');

  $(document).ready(function(e) {
$( window ).resize(function() {
  //console.log('-------------scroll-----------');
  if ($( window ).width()<=856 ) {
  //  alertify.error("Accion scroll");
    $(".listTableLecturista").addClass('pre-scrollable');
  }else{
    $(".listTableLecturista").removeClass('pre-scrollable');
  }
  
});
//console.log('-------------scroll-----------');

    $('.listTableLecturista').find('table').dataTable();
$('[data-toggle="tooltip"]').tooltip();

$("#actualizarTmobile").click(function(event) {
   $("#r-mobile-gestionar").click();
});



//$('.estatusGM').iCheck('check');
$('.estatusGM').on('ifClicked', function(event){
  event.preventDefault();
  var clave= $(this).attr("data-clave");
             var val= $(this).val();     var objeto=$(this);
checkHelper(clave, val,objeto);

                       }).iCheck({
              checkboxClass: 'icheckbox_square-green',
              radioClass: 'iradio_square-green',
              increaseArea: '10%'
            });


$(".listTableLecturista").on("click",".estatusGM",function(event) {
$('.estatusGM').on('ifClicked', function(event){
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

function  checkHelper(clave, val,objeto){
  //console.log(objeto.attr('checked', true));


           alertify.confirm("¿Estas seguro de realizar esta accion?", function (e) {
        if (e) {
           cambiarStatusMobile(clave,val,objeto);//
        
          //alertify.success("estatus ok---");
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

/*/function cambiarStatusMobile(clave, val,objeto){
  alertify.success( clave +"  "+ val);
  if(val=="1"){
objeto.val(0);
  }else{objeto.val(1);}
  
}/*/

//--------------------------------------------------------------------------
function cambiarStatusMobile(clave, val,objeto){
  

   $.ajax({
      url : AjaxURL(),
    data : { action : "changeEstatusLecturista",clave:clave,val:val ,change:"mobile" },
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

</script>

<?php 
}
else{
  echo "Acceso no permitido...";
}
?>  