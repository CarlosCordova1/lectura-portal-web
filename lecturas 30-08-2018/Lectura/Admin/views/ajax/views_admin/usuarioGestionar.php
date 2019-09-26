<?php 
if($data1){
 // var_dump($usuarioGestionar[0]->Lecturista);
 
  ?>  
   <!-- -->
 <div class="alert alert-info">
  <strong>Info!</strong> Opcion de estatus unicamente habilitado.
</div>

  <div class="panel panel-default">
  <div class="panel-heading"><label>Gestionar</label></div>
  <div class="panel-body">
       <div class="pull-right panel-options">
                <a href="#" data-rel="collapse" id="actualizarTlectu" data-toggle="tooltip" title="Actualizar tabla"><i class="glyphicon glyphicon-refresh"></i></a>
                
              </div>
 <div class="listTableLecturista">
   <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered table-hover" id="example1">
     <thead>
              <tr >
              <th  style="text-align: center;" ><i data-toggle="tooltip" title="Orden ascendente" class="fa fa-sort-numeric-asc" aria-hidden="true"></i></th>
                <th style="text-align: center;" ><i data-toggle="tooltip" title="Clave"  class="fa fa-slack" aria-hidden="true"></i></th>
                <th style="text-align: center;" ><i data-toggle="tooltip" title="Usuario" class="fa fa-user-secret" aria-hidden="true"></i></th>
                <th style="text-align: center;" ><i data-toggle="tooltip" title="Password" class="fa fa-user-secret" aria-hidden="true"></i></th>
                <th style="text-align: center;" ><i data-toggle="tooltip" title="Nombre" class="fa fa-user-circle" aria-hidden="true"></i></th>

               <th  style="text-align: center;" ><i data-toggle="tooltip" title="Apellido" class="fa fa-user-circle" aria-hidden="true"></i></th>
                <th style="text-align: center;" ><i data-toggle="tooltip" title="Email" class="fa fa-envelope-o" aria-hidden="true"></i></th>
                  <th style="text-align: center;" ><i data-toggle="tooltip" title="Perfil" class="fa fa-male" aria-hidden="true"></i></th>
                  <th style="text-align: center;" ><i data-toggle="tooltip" title="Centro de trabajo" class="fa fa-briefcase" aria-hidden="true"></i></th>

                <th style="text-align: center;"> <i data-toggle="tooltip" title="Fecha de creacion" class="fa fa-calendar" aria-hidden="true"></i></th>
                 <th style="text-align: center;"> <i data-toggle="tooltip" title="Ultima Modificacion" class="fa fa-calendar" aria-hidden="true"></i></th>
                 <th style="text-align: center;" > <i data-toggle="tooltip" title="Activo/Inactivo" class="fa fa-check-square-o" aria-hidden="true"></i></th>
                <th style="text-align: center;" ><i data-toggle="tooltip" title="Foto de perfil" class="fa fa-picture-o" aria-hidden="true"></i></th>
                           
              </tr>
            </thead>
            <tbody>
            <?php  $cont=0;
            foreach ($usuarioGestionar[0]->Lecturista as $key => $value) {
              $cont++;
 
     ?>
                            <tr class="odd gradeX">
                <td class="center" style="text-align: center;"><?php echo $cont?></td>
                <td class="center" style="text-align: center;">
                <label data-toggle="tooltip" title="Clave" ><?php echo $value->Clave?> </label></td>
                <td class="center" style="text-align: center;"> 
                <label data-toggle="tooltip" title="Usuario" > <?php echo $value->Usuario?> </label>
                </td>
                <td class="center" style="text-align: center;">
                <a href="#" data-encuestaid="valor.encuestaid"  data-toggle="modal" data-target="#"  class="agregarAcliente1">  
               <label data-toggle="tooltip" title="Password" >*****</label>

               <i data-toggle="tooltip" title="Editar password" class="fa fa-pencil" aria-hidden="true"></i></a>
                </td>
                <td class="center" style="text-align: center;"> <a href="#" data-encuestaid="valor.encuestaid"  data-toggle="modal" data-target="#"  class="agregarAcliente1">
                <label data-toggle="tooltip" title="Nombre" >
                <?php echo $value->Nombre?> </label>
                 <i data-toggle="tooltip" title="Editar Nombre" class="fa fa-pencil" aria-hidden="true"></i>
                </a></td>
                <td class="center" style="text-align: center;"> <a href="#" data-encuestaid="valor.encuestaid"  data-toggle="modal" data-target="#"  class="agregarAcliente1">
                <label data-toggle="tooltip" title="Apellido" >
                <?php echo $value->Paterno." ".$value->Materno?></label> <i data-toggle="tooltip" title="Editar Apellidos" class="fa fa-pencil" aria-hidden="true"></i>
                </a></td>                
                <td class="center" style="text-align: center;"> <a href="#" data-encuestaid="valor.encuestaid"  data-toggle="modal" data-target="#"  class="agregarAcliente1">
                <label data-toggle="tooltip" title="email" >
                <?php echo $value->Email?> </label>
                <i data-toggle="tooltip" title="Editar Email" class="fa fa-pencil" aria-hidden="true"></i>
                </a></td>
                <th style="text-align: center;">
                <label data-toggle="tooltip" title="Perfil" >
                <?php echo $value->Perfiltext?> </label>
                </th>
                 <th style="text-align: center;">
                <label data-toggle="tooltip" title="Centro operacional" >
                <?php echo $value->centroOperacionTEXT?> </label>
                </th>
                 <th style="text-align: center;">
                 <label data-toggle="tooltip" title="Fecha de Creacion" >
                <?php echo $value->Fecharegistro?> </label></th>
                <th style="text-align: center;">
                <label data-toggle="tooltip" title="Ultima modificacion" >
                <?php echo $value->Fechamodificacion?> </label></th>
                <td class="center" style="text-align: center;">
                 <input   class="estatusGL" data-clave="<?php echo $value->Clave?>"  value="<?php echo ($value->Estatus==1?"0":"1")?>" type="checkbox" <?php echo ($value->Estatus==1?"checked":"")?> />
                
                </td>
                <td class="center" style="text-align: center;"> <a href="#" data-encuestaid="valor.encuestaid"  data-toggle="modal" data-target="#"  class="agregarAcliente1">
                <label data-toggle="tooltip" title="Foto"  >
                <?php echo $value->Foto?> </label>  <i data-toggle="tooltip" title="Editar foto" class="fa fa-pencil" aria-hidden="true"></i>
                </a></td>
                               
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

$("#actualizarTlectu").click(function(event) {
   $("#LecturistaCrearGestionar").click();
});

//$('.estatusGL').iCheck('check');
$('.estatusGL').on('ifClicked', function(event){
  event.preventDefault();
  var clave= $(this).attr("data-clave");
             var val= $(this).val();     var objeto=$(this);
checkHelper(clave, val,objeto);

                       }).iCheck({
              checkboxClass: 'icheckbox_square-green',
              radioClass: 'iradio_square-green',
              increaseArea: '10%'
            });


$(".listTableLecturista").on("click",".estatusGL",function(event) {
$('.estatusGL').on('ifClicked', function(event){
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
           cambiarStatusLecturista(clave,val,objeto);//
        
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

/*/function cambiarStatusLecturista(clave, val,objeto){
  alertify.success( clave +"  "+ val);
  if(val=="1"){
objeto.val(0);
  }else{objeto.val(1);}
  
}/*/

//--------------------------------------------------------------------------
function cambiarStatusLecturista(clave, val,objeto){
  

   $.ajax({
      url : AjaxURL(),
    data : { action : "changeEstatusLecturista",clave:clave,val:val ,change:"lecturista" },
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