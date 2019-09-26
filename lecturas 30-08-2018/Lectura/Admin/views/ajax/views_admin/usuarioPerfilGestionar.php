<?php 
if($data1){
  ?>  
   <!-- -->
   <div class="alert alert-info">
  <strong>Info!</strong> Opcion no habilitada.
</div>

  <div class="panel panel-default">
  <div class="panel-heading"><label>perfil Gestionar</label></div>
  <div class="panel-body">
       <div class="pull-right panel-options">
                <a href="#" data-rel="collapse" id="" data-toggle="tooltip" title="Actualizar tabla"><i class="glyphicon glyphicon-refresh"></i></a>
                
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
                 <th style="text-align: center;" >Estatus</th>
                <th style="text-align: center;" ><i data-toggle="tooltip" title="Foto de perfil" class="fa fa-picture-o" aria-hidden="true"></i></th>
                           
              </tr>
            </thead>
            <tbody>
                            <tr class="odd gradeX">
                <td class="center" style="text-align: center;">cont</td>
                <td class="center" style="text-align: center;"><a href="#" data-encuestaid="valor.encuestaid"  data-toggle="modal" data-target="#myModalAgregarAcliente"  class="agregarAcliente">
                Clave <i data-toggle="tooltip" title="Editar clave" class="fa fa-pencil" aria-hidden="true"></i>
                </a></td>
                <td class="center" style="text-align: center;"> <a href="#" data-encuestaid="valor.encuestaid"  data-toggle="modal" data-target="#"  class="agregarAcliente">
                Usuario <i data-toggle="tooltip" title="Editar usuario" class="fa fa-pencil" aria-hidden="true"></i>
                </a></td>
                <td class="center" style="text-align: center;"> <a href="#" data-encuestaid="valor.encuestaid"  data-toggle="modal" data-target="#"  class="agregarAcliente">
                ***** <i data-toggle="tooltip" title="Editar password" class="fa fa-pencil" aria-hidden="true"></i>
                </a></td>
                <td class="center" style="text-align: center;"> <a href="#" data-encuestaid="valor.encuestaid"  data-toggle="modal" data-target="#"  class="agregarAcliente">
                Nombre <i data-toggle="tooltip" title="Editar Nombre" class="fa fa-pencil" aria-hidden="true"></i>
                </a></td>
                <td class="center" style="text-align: center;"> <a href="#" data-encuestaid="valor.encuestaid"  data-toggle="modal" data-target="#"  class="agregarAcliente">
                Apellido <i data-toggle="tooltip" title="Editar Apellidos" class="fa fa-pencil" aria-hidden="true"></i>
                </a></td>                
                <td class="center" style="text-align: center;"> <a href="#" data-encuestaid="valor.encuestaid"  data-toggle="modal" data-target="#"  class="agregarAcliente">
                email <i data-toggle="tooltip" title="Editar Email" class="fa fa-pencil" aria-hidden="true"></i>
                </a></td>
                 <th style="text-align: center;">
                <a href="#" data-encuestaid="valor.encuestaid"  data-toggle="modal" data-target="#"  class="agregarAcliente">
                perfil <i data-toggle="tooltip" title="Editar" class="fa fa-pencil" aria-hidden="true"></i>
                </a></th>
                 <th style="text-align: center;">
                <a href="#" data-encuestaid="valor.encuestaid"  data-toggle="modal" data-target="#myModalAgregarAcliente"  class="agregarAcliente">
                centro <i data-toggle="tooltip" title="Editar" class="fa fa-pencil" aria-hidden="true"></i>
                </a></th>
                 <th style="text-align: center;">
                fecha 1 </th>
                <th style="text-align: center;">
                fecha 2 </th>
                <td class="center" style="text-align: center;">
                <a href="#" data-encuestaid="valor.id" data-toggle="modal" data-target="#myModalPreguntas"  class="verPreguntas"> <a href="#" data-encuestaid="valor.encuestaid"  data-toggle="modal" data-target="#"  class="agregarAcliente">
                estatus <i data-toggle="tooltip" title="Editar estatus" class="fa fa-pencil" aria-hidden="true"></i>
                </a></td>
                <td class="center" style="text-align: center;"> <a href="#" data-encuestaid="valor.encuestaid"  data-toggle="modal" data-target="#"  class="agregarAcliente">
                foto <i data-toggle="tooltip" title="Editar foto" class="fa fa-pencil" aria-hidden="true"></i>
                </a></td>
                               
              </tr>
             

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

});

</script>

<?php 
}
else{
  echo "Acceso no permitido...";
}
?>  