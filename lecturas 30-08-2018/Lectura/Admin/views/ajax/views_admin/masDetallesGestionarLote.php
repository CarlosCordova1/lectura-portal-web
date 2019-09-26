<?php 
if($data1){
  //echo json_encode($mobileGestionar[0]->Lote);
 //echo "odt gestion-> "+$odt;
  ?>  
   <!-- -->
  <div class="panel panel-default">
  <div class="panel-heading"><label>Gestionar (ODT <?php echo $odt?>)</label></div>
  <div class="panel-body">
       <div class="pull-right panel-options">
                <a href="#" data-rel="collapse" id="actualizarTmobile2" data-toggle="tooltip" title="Actualizar tabla"><i class="glyphicon glyphicon-refresh"></i></a>
                
              </div>
 <div class="listTablegestionar">
   <!--<table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered table-hover" id="exampledetalle">-->
    
     <table  class="table table-striped table-bordered datatable-buttons"   width="100%">
      <thead>
              <tr >
                <th  style="text-align: center;" >Lote </th>
                <th  style="text-align: center;" >Ruta </th>
                <th  style="text-align: center;" >Lecturista </th>
              <th  style="text-align: center;" >Secuencia  <i data-toggle="tooltip" title="Secuencia" class="fa fa-sort-numeric-asc" aria-hidden="true"></i></th>
                <th style="text-align: center;" >Contrato  <i data-toggle="tooltip" title="Contrato"  class="fa fa-handshake-o" aria-hidden="true"></i></th>
                <th style="text-align: center;" >Medidor  <i data-toggle="tooltip" title="Medidor"  class="fa fa-clock-o" aria-hidden="true"></i></th>
                <th style="text-align: center;" >Lectura  <i data-toggle="tooltip" title="Lectura" class="fa fa-pencil" aria-hidden="true"></i></th>
               <!-- <th style="text-align: center;" ><i data-toggle="tooltip" title="Lectura verificada" class="fa fa-pencil" aria-hidden="true"></i></th>
                <th style="text-align: center;" ><i data-toggle="tooltip" title="Marca" class="fa fa-info-circle" aria-hidden="true"></i></th>
                <th style="text-align: center;" ><i data-toggle="tooltip" title="Modelo" class="fa fa-info-circle" aria-hidden="true"></i></th>  -->                          
                <th style="text-align: center;">Fecha de lectura  <i data-toggle="tooltip" title="Fecha de lectura" class="fa fa-calendar" aria-hidden="true"></i></th>
                <!-- <th style="text-align: center;"> <i data-toggle="tooltip" title="Fecha de verificacion" class="fa fa-calendar" aria-hidden="true"></i></th>-->
                 <th style="text-align: center;" >Anomalia 1  <i data-toggle="tooltip" title="Anomalia 1" class="fa fa-exclamation" aria-hidden="true"></i></th>
                 <th style="text-align: center;" >Anomalia 2  <i data-toggle="tooltip" title="Anomalia 2" class="fa fa-exclamation" aria-hidden="true"></i></th>
                 <th style="text-align: center;" >Comentario  <i data-toggle="tooltip" title="Comentario" class="fa fa-comment" aria-hidden="true"></i></th>
                  <th style="text-align: center;" >Foto  <i data-toggle="tooltip" title="Foto" class="fa fa-camera" aria-hidden="true"></i></th>
                  <th style="text-align: center;" >Estado de la lectura  <i data-toggle="tooltip" title="Estado de la lectura" class="fa fa-tags" aria-hidden="true"></i></th>
                  <th style="text-align: center;" >Intentos de captura  <i data-toggle="tooltip" title="Intentos de captura" class="fa fa-tags" aria-hidden="true"></i></th>
              
              
               
                           
              </tr>
            </thead>
            <tbody>

                
   

            <?php  $cont=0;
            foreach ($mobileGestionar[0]->Lote as $key => $value) {
              $cont++;
 
 /*
 gobj.put('secuencia',ind.SECUENCIA);
          gobj.put('MEDIDOR',ind.MEDIDOR);
          gobj.put('fchlec',ind.fchlec);
          
            gobj.put('LECTURA',ind.LECTURA);
             gobj.put('lecturaver',ind.lecturaver);
              gobj.put('lecturaver',ind.lecturaver);
               gobj.put('idtanm1',ind.idtanm1);
                gobj.put('idtanm2',ind.lecturaver);
                 gobj.put('edoatl',ind.edoatl);
                  gobj.put('claveLEC',vclave);
                  gobj.put('lecturista',vlecturista);
 */
     ?> 
                            <tr class="odd gradeX">
<td   style="text-align: center;" ><label><?php echo $lote;?>  </label></td>
                <td   style="text-align: center;" ><label><?php echo $nvruta;?></label></td>
                <td   style="text-align: center;" ><label><?php echo "(".$value->claveLEC .") ".$value->lecturista;?></label></td>
                <td class="center" style="text-align: center;"><?php echo $value->secuencia?></td>
                <td class="center" style="text-align: center;">
                <label data-toggle="tooltip" title="Contrato" ><?php echo $value->contrato?> </label></td>

                <td class="center" style="text-align: center;">
                <label data-toggle="tooltip" title="Medidor" ><?php echo $value->MEDIDOR?> </label></td>
                <td class="center" style="text-align: center;"> 
                <label data-toggle="tooltip" title="Lectura" > <?php echo $value->LECTURA?> </label>
                </td>
                <!--  <td class="center" style="text-align: center;"> 
                <label data-toggle="tooltip" title="lectura verificada" > <?php echo $value->lecturaver?> </label>
                </td>
               <td class="center" style="text-align: center;">
                <label data-toggle="tooltip" title="Marca" ><?php //echo $value->Marca?></label>               
                </td>
                <td class="center" style="text-align: center;"> <a href="#" data-encuestaid="valor.encuestaid"  data-toggle="modal" data-target="#"  class="agregarAcliente1">
                <label data-toggle="tooltip" title="Modelo" >
                <?php //echo $value->Modelo?> </label>
                 
                </a></td>-->
                               
               
                 <th style="text-align: center;">
                 <label data-toggle="tooltip" title="Fecha lectura" >
                <?php echo $value->fchlec?> </label></th>
                <!-- <th style="text-align: center;">
                <label data-toggle="tooltip" title="Fecha Verificacion" >
                <?php echo $value->FCHVER?> </label></th> -->
                   
                   <td class="center" style="text-align: center;">
                <label data-toggle="tooltip" title="Anomalia 1" >
                <?php echo $value->idtanm1?> </label>
               </td> 
                <td class="center" style="text-align: center;">
                <label data-toggle="tooltip" title="Anomalia 2" >
                <?php echo $value->idtanm2?> </label>
               </td> 



                    <td class="center" style="text-align: center;">
                <label data-toggle="tooltip" title="Comentario" >
                <?php echo $value->comentario?> </label>
               </td> 
               <td class="center" style="text-align: center;">
                <?php  foreach ($value->foto as $keyf => $valuef) {?>
                <label data-toggle="tooltip" title="Foto contrato" > <?php echo $valuef->contrato?>        </label>
                <a target="_blank" data-toggle="tooltip" title="Ver Foto"  href="http://192.168.223.100/git/test/imgLectura/foto/odt_<?php echo $odt."/".$valuef->nombre?> "> <i   class="fa fa-camera" aria-hidden="true"></i></a>
                <br>
                 <?php  } ?>
               </td> 
                <td class="center" style="text-align: center;">
                <label data-toggle="tooltip" title="<?php echo $value->descrip_edo?>" >
                <?php echo $value->edoatl?> </label>
               </td> 
                <td class="center" style="text-align: center;">
                <label data-toggle="tooltip" title="Intentos de captura" >
                <?php echo $value->intentos?> </label>
               </td> 
              
             

                               
              </tr>
              <?php 
              }
             ?>
             

            </tbody></table>

 </div>
  

  </div> <!-- end panel body -->
</div>



<!-- Datatables -->
    <link href="assets/gentelella-master/vendors/datatables.net-bs/css/dataTables.bootstrap.min.css" rel="stylesheet">
    <link href="assets/gentelella-master/vendors/datatables.net-buttons-bs/css/buttons.bootstrap.min.css" rel="stylesheet">
    <link href="assets/gentelella-master/vendors/datatables.net-fixedheader-bs/css/fixedHeader.bootstrap.min.css" rel="stylesheet">
    <link href="assets/gentelella-master/vendors/datatables.net-responsive-bs/css/responsive.bootstrap.min.css" rel="stylesheet">
    <link href="assets/gentelella-master/vendors/datatables.net-scroller-bs/css/scroller.bootstrap.min.css" rel="stylesheet">

<!-- Datatables -->
    <script src="assets/gentelella-master/vendors/datatables.net/js/jquery.dataTables.min.js"></script>
    <script src="assets/gentelella-master/vendors/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
    <script src="assets/gentelella-master/vendors/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
    <script src="assets/gentelella-master/vendors/datatables.net-buttons-bs/js/buttons.bootstrap.min.js"></script>
    <script src="assets/gentelella-master/vendors/datatables.net-buttons/js/buttons.flash.min.js"></script>
    <script src="assets/gentelella-master/vendors/datatables.net-buttons/js/buttons.html5.min.js"></script>
    <script src="assets/gentelella-master/vendors/datatables.net-buttons/js/buttons.print.min.js"></script>
    <script src="assets/gentelella-master/vendors/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js"></script>
    <script src="assets/gentelella-master/vendors/datatables.net-keytable/js/dataTables.keyTable.min.js"></script>
    <script src="assets/gentelella-master/vendors/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
    <script src="assets/gentelella-master/vendors/datatables.net-responsive-bs/js/responsive.bootstrap.js"></script>
    <script src="assets/gentelella-master/vendors/datatables.net-scroller/js/dataTables.scroller.min.js"></script>
    <script src="assets/gentelella-master/vendors/jszip/dist/jszip.min.js"></script>
    <script src="assets/gentelella-master/vendors/pdfmake/build/pdfmake.min.js"></script>
    <script src="assets/gentelella-master/vendors/pdfmake/build/vfs_fonts.js"></script>
    <!-- Custom Theme Style -->
  <!--  <link href="assets/gentelella-master/build/css/custom.min.css" rel="stylesheet">-->
 <script src="assets/gentelella-master/build/js/custom.js"></script> 
<script type="text/javascript">
//console.log('-------------scroll-----------');
if ($( window ).width()<=856 ) {
  //  alertify.error("Accion scroll");
    $(".listTablegestionar").addClass('pre-scrollable');
  }else{
    $(".listTablegestionar").removeClass('pre-scrollable');
  }
//console.log('-------------scroll-----------');

  $(document).ready(function(e) {
$( window ).resize(function() {
  //console.log('-------------scroll-----------');
  if ($( window ).width()<=856 ) {
  //  alertify.error("Accion scroll");
    $(".listTablegestionar").addClass('pre-scrollable');
  }else{
    $(".listTablegestionar").removeClass('pre-scrollable');
  }
  
});
//console.log('-------------scroll-----------');

    $('.listTablegestionar').find('table').dataTable();
$('[data-toggle="tooltip"]').tooltip();

$("#actualizarTmobile2").click(function(event) {
   $("#r-detalle-gestionar").click();
});



//$('.estatusGM').iCheck('check');
/*
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
*/

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