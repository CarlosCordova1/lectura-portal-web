<?php 
if($data1){
  ?> 

    <!-- panel panel-default--> 
             <div class="panel panel-default">
  <div class="panel-heading"><label>imprime reporte</label>
<div class="pull-right panel-options">
                <a href="#" data-rel="collapse" id="" data-toggle="tooltip" title="Actualizar tabla"><i class="glyphicon glyphicon-refresh"></i></a>                
              </div>
  </div>
  <div class="panel-body">
  <div class="listTableUsuarios">
   <!--<table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered table-hover" id="example1">
     <thead>
              <tr >
              <th  style="text-align: center;" >N</th>
                <th style="text-align: center;" >Ruta local</th>
                <th style="text-align: center;" >Medidores</th>
                                            
                <th style="text-align: center;"> <i data-toggle="tooltip" title="Fecha" class="fa fa-calendar" aria-hidden="true"></i></th>
                 
                <th style="text-align: center;">
               <i data-toggle="tooltip" title="Editar" class="fa fa-pencil" aria-hidden="true"></i>
               </th>
                <th style="text-align: center;" >Estatus</th>
                           
              </tr>
            </thead>
           
           <tr class="odd gradeX">
                <td class="center" style="text-align: center;">cont</td>
                <td class="center" style="text-align: center;"><span class="label label-info">Ruta local 5</span></td>
                <td class="center" style="text-align: center;">
                  <span class="label label-success">897 </span>
                </td>
                <td class="center" style="text-align: center;">fecha</td>
                
                <th style="text-align: center;">
                <a href="#" data-encuestaid="valor.encuestaid"  data-toggle="modal" data-target="#myModalAgregarAcliente"  class="agregarAcliente">
                Editar <i data-toggle="tooltip" title="Editar" class="fa fa-pencil" aria-hidden="true"></i>
                </a></th>
                <td class="center" style="text-align: center;">
                <a href="#" data-encuestaid="valor.id" data-toggle="modal" data-target="#myModalPreguntas"  class="verPreguntas"> activo</td>                              
              </tr>
               <tr class="odd gradeX">
                <td class="center" style="text-align: center;">cont</td>
                <td class="center" style="text-align: center;"><span class="label label-info">Ruta local 3</span></td>
                <td class="center" style="text-align: center;">
                  <span class="label label-success">32 </span>
                </td>
                <td class="center" style="text-align: center;">fecha</td>
                
                <th style="text-align: center;">
                <a href="#" data-encuestaid="valor.encuestaid"  data-toggle="modal" data-target="#myModalAgregarAcliente"  class="agregarAcliente">
                Editar <i data-toggle="tooltip" title="Editar" class="fa fa-pencil" aria-hidden="true"></i>
                </a></th>
                <td class="center" style="text-align: center;">
                <a href="#" data-encuestaid="valor.id" data-toggle="modal" data-target="#myModalPreguntas"  class="verPreguntas"> activo</td>                              
              </tr>
              <tr class="odd gradeX">
                <td class="center" style="text-align: center;">cont</td>
                <td class="center" style="text-align: center;"><span class="label label-info">Ruta local 20</span></td>
                <td class="center" style="text-align: center;">
                  <span class="label label-success">512 </span>
                </td>
                <td class="center" style="text-align: center;">fecha</td>
                
                <th style="text-align: center;">
                <a href="#" data-encuestaid="valor.encuestaid"  data-toggle="modal" data-target="#myModalAgregarAcliente"  class="agregarAcliente">
                Editar <i data-toggle="tooltip" title="Editar" class="fa fa-pencil" aria-hidden="true"></i>
                </a></th>
                <td class="center" style="text-align: center;">
                <a href="#" data-encuestaid="valor.id" data-toggle="modal" data-target="#myModalPreguntas"  class="verPreguntas"> activo</td>                              
              </tr>
             

            </tbody></table>-->

 </div>
  

  </div> <!-- end panel body -->
</div> <!-- end panel -->
   
<script type="text/javascript">
  $(document).ready(function($) {
$('[data-toggle="tooltip"]').tooltip();

    $('.listTableUsuarios').find('table').dataTable();




  });


</script>
       
<?php 
}
else{
  echo "Acceso no permitido...";
}
?>  