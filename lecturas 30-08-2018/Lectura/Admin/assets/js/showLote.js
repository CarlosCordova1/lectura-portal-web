function ShowUsuario_admin(){
   $.ajax({
      url : AjaxURL(),
    data : { action : "showlotes", },
    type : 'POST',
     dataType : 'JSON',
     beforeSend : function(xhr, status) {
     $(".listTable").html(gifLoad());
      
    },
     success : function(json) {
      console.log(json);
     // console.log(JSON.parse(json.data));
if (json.status=="1") {
    var tr="";
    var cont=0;
      $.each(JSON.parse(json.data),function(index, value){
        
          console.log("Ruta");  
             console.log(value.Ruta);      
   $.each(value.Ruta,function(indice, valor){
    cont++;
     //console.log('My array has at position ' + indice + ', this value: ' + valor);
     console.log("valor");
     console.log(valor);
   var soloEditar='';
var estatus="";
var lecturista="";
var ayudalecturista="";


 //$.each(valor.lecturista,function(clave, name){
   lecturista='<label class="label label-success">   '+valor.LECT+ ": "+valor.NOMBRE+" "+valor.APATERNO+'</label><br> ';
//});
$.each(valor.lecturistaAyuda,function(nuevoindice, nuevoval){
 ayudalecturista+='<label class="label label-success">'+nuevoindice+": "+nuevoval+'</label><br> ';
});

var nvruta="";
if (valor.Lote==""){
  nvruta=valor.nameRutalocal;
}
else{
  nvruta=valor.Ruta;
}

var procesar="";
if (valor.estatus=="NVO" && valor.totallectura==0) {
procesar='<br> <a href="#" data-encuestaid="'+valor.ID_ASIG+'" data-toggle="modal" data-target="#my"  class="enviarx7"> <i data-toggle="tooltip" title="Procesar ODT" class="fa fa-paper-plane" aria-hidden="true"></i>';

}
var editarLote="";
if (valor.estatus=="NVO" && valor.Lote!="") {
  //editarLote='<a href="#" data-encuestaid="'+valor.ID_ASIG+'"  data-namelote="'+valor.Lote+'" class="editarLote"><i data-toggle="tooltip" title="Editar Lote" class="fa fa-pencil" aria-hidden="true"></i>';
}
 

    tr+='  <tr class="odd gradeX">'+
          
                '<td class="center" style="text-align: center;">'+cont+'</td>'+//numero
                '<td class="center" style="text-align: center;">'+valor.ID_ASIG+'</td>'+//numero
                '<td class="center" style="text-align: center;"> <span class="label label-info">'+valor.Lote+'</span>   '+         
                  editarLote+
                '</td>'+//Servicio valor.ruta
                '<td class="center" style="text-align: center;"> <span class="label label-success">'+nvruta+'</span> </td>'+//
                '<td class="center" style="text-align: center;"> <span class="label label-success">'+valor.totalmedidor+'</span> </td>'+//
                 '<td class="center" style="text-align: center;">'+lecturista+'</td>'+//lecturista
                '<td class="center" style="text-align: center;">'+ayudalecturista+'</td>'+//lecturista
                '<td class="center" style="text-align: center;">'+valor.estatus+'</td>'+//fecha de creacion
                '<td class="center" style="text-align: center;">'+(valor.totalcap/valor.totalmedidor*100).toFixed(2) +' %    '+procesar+'</td>'+ 
                '<td class="center" style="text-align: center;"> '+valor.FCHCRE +'</td>'+ 
                  //'<td class="center" style="text-align: center;">'+valor.Asignacion+'</td>'+//fecha de creacion
                    '<td class="center" style="text-align: center;">'+valor.Asignacion+'</td>'+//fecha de creacion
                     
               // '<th style="text-align: center;">'+
               // '<a href="#" data-encuestaid="'+cont+'"  data-toggle="modal" data-target="#myModalAgregarAcliente"  class="agregarAcliente">'+
                //'Editar <i data-toggle="tooltip" title="Editar" class="fa fa-pencil" aria-hidden="true"></i>'+
               // '</a></th>'+
               '<td class="center" style="text-align: center;">'+valor.C_operacion+'</td>'+//C_operacion
                '<td class="center" style="text-align: center;">'+
                '<a href="#" data-encuestaid="'+valor.ID_ASIG+'"  data-lote="'+valor.Lote+'"  data-nvruta="'+nvruta+'" data-lecturista="'+valor.NOMBRE+" "+valor.APATERNO+'" data-toggle="modal" data-target="#myModalDetalles"  class="verDetalles"> detalles  '+
                '</td>'+//cantidadPregunta
                               
              '</tr>';
              
});



   
});

          
      var tabla='<table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered table-hover" id="example1">'+
     '<thead>'+
              '<tr >'+
              '<th  style="text-align: center;" ><i data-toggle="tooltip" title="Orden ascendente" class="fa fa-sort fa" aria-hidden="true"></i></th>'+
              ' <th style="text-align: center;" ><i data-toggle="tooltip" title="ODT" class="fa fa-hashtag" aria-hidden="true"></i></th>'+
               ' <th style="text-align: center;" ><i data-toggle="tooltip" title="Lote" class="fa fa-tasks" aria-hidden="true"></i></th>'+
               ' <th style="text-align: center;" ><i data-toggle="tooltip" title="Ruta" class="fa fa-road" aria-hidden="true"></i></th>'+
               ' <th style="text-align: center;" ><i data-toggle="tooltip" title="Total Medidores" class="fa fa-clock-o" aria-hidden="true"></i></th>'+
               '<th  style="text-align: center;" ><i data-toggle="tooltip" title="Lecturista" class="fa fa-user-o" aria-hidden="true"></i></th>'+
               '<th  style="text-align: center;" ><i data-toggle="tooltip" title="Ayuda a Lecturista" class="fa fa-user" aria-hidden="true"></i></th>'+
               ' <th style="text-align: center;" ><i data-toggle="tooltip" title="Estatus" class="fa fa-hourglass-start" aria-hidden="true"></i></th>'+
               //' <th style="text-align: center;" ><i data-toggle="tooltip" title="Estatus telefono" class="fa fa-hourglass-start" aria-hidden="true"></i></th>'+
               ' <th style="text-align: center;" ><i data-toggle="tooltip" title="Porcentaje de avance" class="fa fa-hourglass-start" aria-hidden="true"></i></th>'+
               ' <th style="text-align: center;"> <i data-toggle="tooltip" title="Fecha de creacion" class="fa fa-calendar" aria-hidden="true"></i></th>'+
                ' <th style="text-align: center;"> <i data-toggle="tooltip" title="Fecha de atencion" class="fa fa-calendar" aria-hidden="true"></i></th>'+
               //' <th style="text-align: center;">'+
               //'<i data-toggle="tooltip" title="Editar" class="fa fa-pencil" aria-hidden="true"></i>'+
               //'</th>'+
                  ' <th style="text-align: center;"> <i data-toggle="tooltip" title="Centro operacional" class="fa fa-briefcase" aria-hidden="true"></i></th>'+
               ' <th style="text-align: center;" >Mas detalles</th>'+
                           
             ' </tr>'+
           ' </thead>'+
            '<tbody>'+tr+'</tbody></table>';
//console.log(tabla);
//var url='<script src="assets/Admin-Theme-3-master/vendors/datatables/dataTables.bootstrap.js"></script>';
 // $("#urlTable").html(url); 

  $(".listTable").html(tabla);    
  $('.listTable').find('table').DataTable();
  $('[data-toggle="tooltip"]').tooltip();
}
else{
  console.log("Hubo un error al cargar los lote");

}
    
    },
 
    error : function(xhr, status) {
       alert('Disculpe, existió un problema al mostrar los lote');
      
    },
 
    // código a ejecutar sin importar si la petición falló o no
    complete : function(xhr, status) {
        //alert('Petición realizada');
    }
});

}




function ShowLecturaSoloLectura(){
 //console.log(argument);
  $.ajax({
    url : AjaxURL(),
   data : { action : "showUsuarios", },
    type : 'POST',
    dataType : 'JSON',
    success : function(json) {
      console.log(json);
if (json.status=="1") {
    var tr="";
    var cont=0;
      $.each(json,function(index, value){
              
 if (index=="data") {
   $.each(JSON.parse(json.data),function(indice, valor){
    cont++;
    // console.log('My array has at position ' + indice + ', this value: ' + valor);
     //console.log(valor.id);
   /*/
var estatus="";
if(valor.edicion==1){estatus="Editando";}
else if(valor.validacion==1){estatus="Validando";}
else if(valor.firmado==1){estatus="Firmado";}
else if(valor.anulado==1){estatus="Cancelado";}
/*/
     tr+='  <tr class="odd gradeX">'+
                '<td>'+cont+'</td>'+
                '<td>'+valor.name+'</td>'+
                '<td>'+valor.email+'</td>'+
                '<td>'+valor.name+'</td>'+
                '<td>'+valor.email+'</td>'+
              
                '<td>'+valor.fechaCreacion+'</td>'+//fecha de creacion
                '<td>'+valor.fechaFin+'</td>'+//fecha de creacion
                '<th style="text-align: center;">'+
                '<i data-toggle="tooltip" title="Agregar Servicio" class="fa fa-plus-square-o" aria-hidden="true"></i></th>'+
             
                '<td class="center" style="text-align: center;">'+
                '<a href="#" data-encuestaid="'+valor.id+'" data-toggle="modal" data-target="#myModalPreguntas"  class="verPreguntas"> '+valor.cantidadServicio+'</td>'+//cantidadPregunta
                            
              '</tr>';

});


 }

   
});
  $("#showContentEncuentas").html(tr);    
  $('#example').dataTable();
  $('[data-toggle="tooltip"]').tooltip();
}
else{
  console.log("hubo un error al cargar las encuestas");

}
     
    },
 
    error : function(xhr, status) {
       alert('Disculpe, existió un problema al mostrar las encuestas');
      
    },
 
    // código a ejecutar sin importar si la petición falló o no
    complete : function(xhr, status) {
        //alert('Petición realizada');
    }
});

}


function verFolio(){
 //console.log(argument);
  $.ajax({
    // la URL para la petición
    url : AjaxURL(),
 
    // la información a enviar
    // (también es posible utilizar una cadena de datos)
   data : { action : "verfolio", },
 
    // especifica si será una petición POST o GET
    type : 'POST',
 
    // el tipo de información que se espera de respuesta
    dataType : 'JSON',
 
    // código a ejecutar si la petición es satisfactoria;
    // la respuesta es pasada como argumento a la función

    success : function(json) {
     // console.log(JSON.parse(json.data));
if (json.status=="1") {
    var tr="";
    var cont=0;

}
else{
  console.log("hubo un error al mostrar la encuesta");

}  
       
    },
 
    error : function(xhr, status) {
       alert('Disculpe, existió un problema al mostrar el folio');
      
    },
 
    // código a ejecutar sin importar si la petición falló o no
    complete : function(xhr, status) {
        //alert('Petición realizada');
    }
});

}

function showServicios(idEncuenta){
  $.ajax({
    url : AjaxURL(),
   data : { action : "verServicios",encuesta:idEncuenta },
    type : 'POST',
    dataType : 'JSON',
    success : function(json) {
     console.log(json);
if (json.status=="1") {
  var preg='<div class="well well-sm">'+
            '<div class="row">'+
            '<div class="col-sm-8"><b>{nu}</b> {pre}</div>'+
            '<div class="col-sm-4">'+
            '</div>'+
            '</div>'+ 
          '</div>';
          var cadena="";
          var cont=0;
    var serv=json.data;
    $.each(JSON.parse(serv),function(index, value){
      //console.log(value);
      cont++;
           preg2= preg.replace("{nu}", cont);
        cadena += preg2.replace("{pre}", value.servicio.toUpperCase()+". "+value.descripcion);
    });

   $("#nServicios").html(cadena); 
}
else{
  console.log("hubo un error al mostrar los servicios");

}
    
    },
     error : function(xhr, status) {
       alert('Disculpe, existió un problema al mostrar los servicios');
          },
 
    // código a ejecutar sin importar si la petición falló o no
    complete : function(xhr, status) {
        //alert('Petición realizada');
    }
});

}
function buscaryAgregarCliente(cliente,idEncuenta){
  $.ajax({
    url : AjaxURL(),
   data : { action : "buscaryAgregarclienteEn",encuesta:idEncuenta,cliente:cliente },
    type : 'POST',
    dataType : 'JSON',
    success : function(json) {
     console.log(json);
      //console.log(cliente);
      // console.log(idEncuenta);
if (json.status=="1") {
  alertify.success("Encuesta agregada");
 }
else{
  alertify.alert(json.msg);
  alertify.error("Accion cancelada");

}
    
    },
     error : function(xhr, status) {
       alert('Disculpe, existió un problema al buscar cliente');
          },
 
    // código a ejecutar sin importar si la petición falló o no
    complete : function(xhr, status) {
        //alert('Petición realizada');
    }
});

}
function AgregarClienteAEncuesta(idEncuenta){
  $.ajax({
    url : AjaxURL(),
   data : { action : "verPreguntas",encuesta:idEncuenta },
    type : 'POST',
    dataType : 'JSON',
    success : function(json) {
     //console.log(json);
if (json.status=="1") {
  var preg='<div class="well well-sm">'+
            '<div class="row">'+
            '<div class="col-sm-8"><b>{nu}</b> {pre}</div>'+
            '<div class="col-sm-4">'+
            '</div>'+
            '</div>'+ 
          '</div>';
          var cadena="";
          var cont=0;
    var preguntas=json.data;
    $.each(JSON.parse(preguntas),function(index, value){
      //console.log(value);
      cont++;
           preg2= preg.replace("{nu}", cont);
        cadena += preg2.replace("{pre}", value.pregunta);
    });

   $("#nPreguntas").html(cadena); 
}
else{
  console.log("hubo un error al mostrar las preguntas");

}
    
    },
     error : function(xhr, status) {
       alert('Disculpe, existió un problema al mostrar las preguntas');
          },
 
    // código a ejecutar sin importar si la petición falló o no
    complete : function(xhr, status) {
        //alert('Petición realizada');
    }
});

}
function buscarDatosdeGraficas(idEncuenta){
  
  $.ajax({
    url : AjaxURL(),
   data : { action : "buscarDatosDeGrafica",encuesta:idEncuenta },
    type : 'POST',
    dataType : 'JSON',
    success : function(json) {
       console.log("id encuesta grafica: "+idEncuenta);
     console.log(json);
     
if (json.status=="1") {
   $("#container").html("<h3>No hay datos</h3>");
    $.each(JSON.parse(json.data),function(index, value){
      console.log(value);
      if(value.labelIDpregunta==1){// uno es cerreda si, no
         var grafica = {
          CantidadUsua:value.CantidadUsua,
           CantidadClientes:value.CantidadClientes,
            tipoPreguntaTipo:value.tipoPreguntaTipo,
            si:value.si,
            no:value.no,
            totalSi:value.totalSi,
            totalNo:value.totalNo,
          };
         dibujarGrafica(grafica);
      }else if(value.labelIDpregunta==3){//opcion multiple

         var grafica = {
          CantidadUsua:value.CantidadUsua,
           CantidadClientes:value.CantidadClientes,
            tipoPreguntaTipo:value.tipoPreguntaTipo,
            excelente:value.excelente,
            bueno:value.bueno,
            regular:value.regular,
            malo:value.malo,
            totalexcelente:value.totalExcelente,
            totalbueno:value.totalBueno,
            totalregular:value.totalRegular,
            totalmalo:value.totalMalo,
          };
        dibujarGrafica3(grafica);
      }
      else{
       
//$("#container2").html("");
      }
     
         //  preg2= preg.replace("{nu}", cont);
       // cadena += preg2.replace("{pre}", value.pregunta);
    });
}
else{

  console.log("hubo un error al buscar datos de la grafica");

}
    
    },
     error : function(xhr, status) {
       alert('Disculpe, existió un problema al buscar datos de la grafica');
          },
 
    // código a ejecutar sin importar si la petición falló o no
    complete : function(xhr, status) {
        //alert('Petición realizada');
    }
});

}
function dibujarGrafica(grafica){
console.log(grafica);
      
 var chart = Highcharts.chart('container', {

        chart: {
            type: 'column'
        },

        title: {
            text: 'Tipo de encuesta: '+ grafica.tipoPreguntaTipo
        },

        subtitle: {
            text: ''
        },

        legend: {
            align: 'right',
            verticalAlign: 'middle',
            layout: 'vertical'
        },

        xAxis: {
          //  categories: ['Diciembre', 'Enero', 'Febrero'],
              categories: ['Periodo'],
            labels: {
                x: -10
            }
        },

        yAxis: {
            allowDecimals: false,
            title: {
                text: 'Total'
            }
        },

        series: [

        {
            name: grafica.si,
            data: [parseInt(grafica.totalSi)]
        },
        {
            name: grafica.no,
            data: [parseInt(grafica.totalNo)]
        },
        {
            name: 'Encuestas asignadas a clientes',
            data: [parseInt(grafica.CantidadClientes)]
        },
       
         {
            name: 'Usuarios',
            data: [parseInt(grafica.CantidadUsua)]
        },
       
        ],

        responsive: {
            rules: [{
                condition: {
                    maxWidth: 500
                },
                chartOptions: {
                    legend: {
                        align: 'center',
                        verticalAlign: 'bottom',
                        layout: 'horizontal'
                    },
                    yAxis: {
                        labels: {
                            align: 'center',
                            x: 0,
                            y: -5
                        },
                        title: {
                            text: null
                        }
                    },
                    subtitle: {
                        text: null
                    },
                    credits: {
                        enabled: false
                    }
                }
            }]
        }
    });


 chart.setSize(400, 300);
     


var pie = Highcharts.chart('container2', {
        chart: {
            type: 'pie',
            options3d: {
                enabled: true,
                alpha: 45,
                beta: 0
            }
        },
        title: {
            text: 'Porcentaje'
        },
        tooltip: {
            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                depth: 35,
                dataLabels: {
                    enabled: true,
                    format: '{point.name}'
                }
            }
        },
        series: [{
            type: 'pie',
            name: 'Porcentajes',
            data: [
                [grafica.si, parseInt(grafica.totalSi)],
               
                {
                    name: grafica.no,
                    y: parseInt(grafica.totalNo),
                    sliced: true,
                    selected: true
                },
               
            ]
        }]
    });

 pie.setSize(400, 300);
}
function dibujarGrafica3(grafica){
console.log(grafica);

 var chart = Highcharts.chart('container', {

        chart: {
            type: 'column'
        },

        title: {
            text: 'Tipo de encuesta: '+ grafica.tipoPreguntaTipo
        },

        subtitle: {
            text: ''
        },

        legend: {
            align: 'right',
            verticalAlign: 'middle',
            layout: 'vertical'
        },

        xAxis: {
          //  categories: ['Diciembre', 'Enero', 'Febrero'],
              categories: ['Periodo'],
            labels: {
                x: -10
            }
        },

        yAxis: {
            allowDecimals: false,
            title: {
                text: 'Total'
            }
        },

        series: [

      
       
       
        {
            name: grafica.excelente,
            data: [parseInt(grafica.totalexcelente)]
        },
        {
            name: grafica.bueno,
            data: [parseInt(grafica.totalbueno)]
        },
        {
            name: grafica.regular,
            data: [parseInt(grafica.totalregular)]
        },
        {
            name: grafica.malo,
            data: [parseInt(grafica.totalmalo)]
        },
         {
            name: 'Usuarios',
            data: [parseInt(grafica.CantidadUsua)]
        },
         {
            name: 'Encuestas asignadas a clientes',
            data: [parseInt(grafica.CantidadClientes)]
        },
       
        ],

        responsive: {
            rules: [{
                condition: {
                    maxWidth: 500
                },
                chartOptions: {
                    legend: {
                        align: 'center',
                        verticalAlign: 'bottom',
                        layout: 'horizontal'
                    },
                    yAxis: {
                        labels: {
                            align: 'center',
                            x: 0,
                            y: -5
                        },
                        title: {
                            text: null
                        }
                    },
                    subtitle: {
                        text: null
                    },
                    credits: {
                        enabled: false
                    }
                }
            }]
        }
    });


 chart.setSize(400, 300);
     


var pie = Highcharts.chart('container2', {
        chart: {
            type: 'pie',
            options3d: {
                enabled: true,
                alpha: 45,
                beta: 0
            }
        },
        title: {
            text: 'Porcentaje'
        },
        tooltip: {
            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                depth: 35,
                dataLabels: {
                    enabled: true,
                    format: '{point.name}'
                }
            }
        },
        series: [{
            type: 'pie',
            name: 'Porcentaje',
            data: [
               {
                    name: grafica.excelente,
                    y: parseInt(grafica.totalexcelente),
                    sliced: true,
                    selected: true
                },
                
               
                  {
                    name: grafica.bueno,
                    y: parseInt(grafica.totalbueno),
                    sliced: true,
                    selected: true
                },
                 {
                    name: grafica.regular,
                    y: parseInt(grafica.totalregular),
                   
                },
                {
                    name: grafica.malo,
                    y: parseInt(grafica.totalmalo),
                    
                },

               
            ]
        }]
    });

 pie.setSize(400, 300);
}