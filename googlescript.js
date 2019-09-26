function onOpen() {
  var spreadsheet = SpreadsheetApp.getActive();
  var menuItems = [
    {name: 'Descargar Ruta', functionName: 'GetRuta'},
      {name: 'getURLImage', functionName: 'getURLImage'},
     {name: 'Cargar Ruta a X7', functionName: 'GetvalueToX7'}
    
   
  ];
  spreadsheet.addMenu('Ruta x7', menuItems);
  //var json =  getodt();
  //var orden =json[0].ODT[9];
 
}//---------------------------------------------------

function onEdit(e){
  // Set a comment on the edited cell to indicate when it was changed.
  //var range = e.range;
  //range.setNote('Last modified: ' + new Date());
  //SpreadsheetApp.getActiveSheet().getRange('S4' ).setValue(new Date());
  
  
   var cell = SpreadsheetApp.getActive().getActiveCell();
  var row = cell.getRow();
  var col = cell.getColumn();

  //if col > A && col < K ...
  if(col == 11){ //B4:J6
    //do something
     //SpreadsheetApp.getUi().alert('You Edited a Cell OUTSIDE the Range!');//Com
     SpreadsheetApp.getActiveSheet().getRange('T'+row ).setValue(new Date());
  }else
  { //SpreadsheetApp.getUi().alert('nada!');//Com
  }
  
  
}//---------------------------------------------------

    function getURLImage() {
      var carpeta = Browser.inputBox('Ingrese nombre de la carpeta donde se localizan las fotografias', Browser.Buttons.OK_CANCEL);
      var img ='';
  //var ss = SpreadsheetApp.getActiveSpreadsheet();
  //var sheet = ss.getSheets()[0];
      //var folders = DriveApp.getFoldersByName('P11303_Images');
       var folders = DriveApp.getFolders();
       //DriveApp.getFilesByName(baseFolder).next();
      var a='';
     var  img=''; 
       while (folders.hasNext()) {
   var folder = folders.next();
  
         
         if(folder.getName()==carpeta){
         //a+=folder.getName()+'     -     ';
            var files = folder.getFiles(); 
          // var files = DriveApp.getFiles();
           while (files.hasNext()) {
             var file = files.next();
             //Logger.log(file.getName());
             
            // var file = files.next();
             img = Drive.Files.get(file.getId()).webContentLink+'    ';
             
              img = img.replace("&export=download", "");
             var ind=GetNamevalue(file.getName());
             
             if(ind!=0){
               SpreadsheetApp.getActiveSheet().getRange('U'+ind ).setValue(img);
             }
             
              
             
           }
         }
         
         
 }
      
      
      
      
     //SpreadsheetApp.getActiveSheet().getRange('T4' ).setValue(a); 
       //SpreadsheetApp.getActiveSheet().getRange('T5' ).setValue(img); 
           
           /* 
      
  if (folders.hasNext()) {
    // Assume folder name is unique, so use first match
    var folder = folders.next();

    var files = folder.getFiles(); 
    if (files.hasNext()) {
      // For this test, use first found file
      var file = files.next();
       img = Drive.Files.get(file.getId()).webContentLink;
     // sheet.insertImage(img, 2, 2);  // In Class Sheet method 'insertImage(url, column, row)'
      
      //SpreadsheetApp.getActiveSheet().getRange('A1').setValue(img);
      SpreadsheetApp.getActiveSheet().getRange('T2' ).setValue(img);
    }
    // else error: no file found
   }
   */   
      
   // else error: no folder found
    //  return img;
       // SpreadsheetApp.getActiveSheet().getRange('T3' ).setValue(folders);
 }//---------------------------------------------------

function GetNamevalue(filename) {
  val=0;
  var totrows=500;
     var ss = SpreadsheetApp.getActiveSpreadsheet();
 var sheet = ss.getSheets()[0];
  for(var i=1;i<=totrows;i++){
   //var range = sheet.getRange("B1:D4");
  var range = sheet.getRange("O"+i);

 // The row and column here are relative to the range
 // getCell(1,1) in this code returns the cell at B2, B2
 var cell = range.getCell(1, 1);
// Logger.log(cell.getValue());
      //SpreadsheetApp.getActiveSheet().getRange('A1' ).setValue(cell.getValue());
    var nameimg=cell.getValue();
      nameimg=nameimg.split('/');
      // SpreadsheetApp.getActiveSheet().getRange('T6' ).setValue(d[0]);
      //SpreadsheetApp.getActiveSheet().getRange('T8' ).setValue(d[1]);
    
    if(nameimg[1]==filename){
   val= i;
    }
    
    
  }
  
  return val;
  
}






function GetvalueToX7() {
  
  
  var ui = SpreadsheetApp.getUi();
 var response = ui.alert('Are you sure you want to continue?', ui.ButtonSet.YES_NO);

 // Process the user's response.
 if (response == ui.Button.YES) {
   //Logger.log('The user clicked "Yes."');
   
   
   var ss = SpreadsheetApp.getActiveSpreadsheet();
 var sheet = ss.getSheets()[0];

 //var range = sheet.getRange("B1:D4");
  var range = sheet.getRange("B1");

 // The row and column here are relative to the range
 // getCell(1,1) in this code returns the cell at B2, B2
 var cell = range.getCell(1, 1);
// Logger.log(cell.getValue());
  
//SpreadsheetApp.getActiveSheet().getRange('A1' ).setValue(cell.getValue());
   SpreadsheetApp.getUi().alert('say ok . value -> '+cell.getValue());
   
 } else {
  
 SpreadsheetApp.getUi().alert('you said no . value -> ');
 }

}



function GetRuta() {

var ruta = Browser.inputBox('Ingrese nombre de ruta ejemplo "P21302"', Browser.Buttons.OK_CANCEL);
    if (ruta=="cancel")
    {  //SpreadsheetApp.getActiveSheet().getRange('A1' ).setValue(ruta);
    }
    else {
  
  try{

    //var json =  login();
     var json =  getAPI(ruta);
    //   Logger.log(json);
    
     var odt=1;
     SpreadsheetApp.getActiveSheet().getRange('A1' ).setValue('Lote');
    SpreadsheetApp.getActiveSheet().getRange('B1' ).setValue('Ruta');
    SpreadsheetApp.getActiveSheet().getRange('C1' ).setValue('Secuencia');
    SpreadsheetApp.getActiveSheet().getRange('D1' ).setValue('Edocliente');
    SpreadsheetApp.getActiveSheet().getRange('E1' ).setValue('Nombre');
    SpreadsheetApp.getActiveSheet().getRange('F1' ).setValue('Direccion');
    SpreadsheetApp.getActiveSheet().getRange('G1' ).setValue('Uso');
    SpreadsheetApp.getActiveSheet().getRange('H1' ).setValue('Giro');
    SpreadsheetApp.getActiveSheet().getRange('I1' ).setValue('Diametro');
    SpreadsheetApp.getActiveSheet().getRange('J1' ).setValue('Medidor');
    SpreadsheetApp.getActiveSheet().getRange('K1' ).setValue('Lectura');
    SpreadsheetApp.getActiveSheet().getRange('L1' ).setValue('Anomalia1');
    SpreadsheetApp.getActiveSheet().getRange('M1' ).setValue('Anomalia2');
    SpreadsheetApp.getActiveSheet().getRange('N1' ).setValue('Observacion');
    SpreadsheetApp.getActiveSheet().getRange('O1' ).setValue('Foto');
    SpreadsheetApp.getActiveSheet().getRange('P1' ).setValue('Cliente');
    SpreadsheetApp.getActiveSheet().getRange('Q1' ).setValue('LecturaAnterior');
    SpreadsheetApp.getActiveSheet().getRange('R1' ).setValue('Promedio');
     SpreadsheetApp.getActiveSheet().getRange('S1' ).setValue('Estado');
     SpreadsheetApp.getActiveSheet().getRange('T1' ).setValue('Fechalectura');
    SpreadsheetApp.getActiveSheet().getRange('U1' ).setValue('URL Foto');
    SpreadsheetApp.getActiveSheet().getRange('V1' ).setValue('IDTAGT');

    
    // SpreadsheetApp.getActiveSheet().getRange('A'+5).setValue(json);
     for (a in json){
    for (x in json[a].medidores){
      odt++;
  //    SpreadsheetApp.getActiveSheet().getRange('A'+odt).setValue(json.medidores[x]);
   var dtmedidor= json[a].medidores[x];
  for (y in dtmedidor){
     SpreadsheetApp.getActiveSheet().getRange('A'+odt ).setValue(dtmedidor.Lote);
     SpreadsheetApp.getActiveSheet().getRange('B'+odt ).setValue(dtmedidor.Ruta);
    SpreadsheetApp.getActiveSheet().getRange('C'+odt ).setValue(dtmedidor.Secuencia);
    SpreadsheetApp.getActiveSheet().getRange('D'+odt ).setValue(dtmedidor.Edocliente);
    SpreadsheetApp.getActiveSheet().getRange('E'+odt ).setValue(dtmedidor.Nombre);
    SpreadsheetApp.getActiveSheet().getRange('F'+odt ).setValue(dtmedidor.Direccion);
    SpreadsheetApp.getActiveSheet().getRange('G'+odt ).setValue(dtmedidor.Uso);
    SpreadsheetApp.getActiveSheet().getRange('H'+odt ).setValue(dtmedidor.Giro);
    SpreadsheetApp.getActiveSheet().getRange('I'+odt ).setValue(dtmedidor.Diametro);
    SpreadsheetApp.getActiveSheet().getRange('J'+odt ).setValue(dtmedidor.Medidor);
    SpreadsheetApp.getActiveSheet().getRange('K'+odt ).setValue(dtmedidor.Lectura);
    SpreadsheetApp.getActiveSheet().getRange('L'+odt ).setValue(dtmedidor.Anomalia1);
    SpreadsheetApp.getActiveSheet().getRange('M'+odt ).setValue(dtmedidor.Anomalia2);
    SpreadsheetApp.getActiveSheet().getRange('N'+odt ).setValue(dtmedidor.Observacion);
    SpreadsheetApp.getActiveSheet().getRange('O'+odt ).setValue(dtmedidor.Foto);
    SpreadsheetApp.getActiveSheet().getRange('P'+odt ).setValue(dtmedidor.Cliente);
    SpreadsheetApp.getActiveSheet().getRange('Q'+odt ).setValue(dtmedidor.LecturaAnterior);
    SpreadsheetApp.getActiveSheet().getRange('R'+odt ).setValue(dtmedidor.Promedio);
     SpreadsheetApp.getActiveSheet().getRange('S'+odt ).setValue(dtmedidor.Estado);
     SpreadsheetApp.getActiveSheet().getRange('T'+odt ).setValue(dtmedidor.Fechalectura);
  
  }
   }
        }

    
  }
  catch(err){
      return "Error getting data";  
  }
}



}

//-------------------------------------------------------------------------
function getAPI(ruta) {
   //var json =  login();
  
  
  var total=gettotalruta(ruta);
var seccion=50;
var paginas = Math.round(total/seccion)+1;
var val=[];
for(var f=0; f<paginas ; f++) {
 var MIN=(seccion*f)+1;
    var MAX=seccion*f+seccion;
//val.push(paginas );
  val.push(getAPIall(ruta,MAX, MIN) );

}
  return val;
  
   
  
}//---------------------------------------

function getAPIall(ruta,max, min) {
 // var json =  login();
   try{
    
     var formData = {
   //'auth': '',
   //'oratkn': json[0].oratkn,
   //'action': 'getodt'
        'ruta': ruta,
       'minimo':min ,
       'maximo': max,
 };
 
 var options = {
   'method' : 'post',
   'payload' : formData
 };
        
    
    
    var res = UrlFetchApp.fetch('https://www.aguakan.com/git/api/webt.php?urlget=lec/1.0/descargarutas',options);
    var content = res.getContentText();
    var json = JSON.parse(content);
        //Logger.log(json);
    
      //SpreadsheetApp.getActiveSheet().getRange('A1').setValue(json[0].mail);
    return json;
    
  }
  catch(err){
      return false;  
  }
}
//---------------------------------------

function gettotalruta(ruta) {
 // var json =  login();
   try{
    
     var formData = {
        'ruta': ruta,
       
 };
 
 var options = {
   'method' : 'post',
   'payload' : formData
 };
        
    
    
    var res = UrlFetchApp.fetch('https://www.aguakan.com/git/api/webt.php?urlget=lec/1.0/totalregistros',options);
    var content = res.getContentText();
    var json = JSON.parse(content);
        //Logger.log(json);
    
      //SpreadsheetApp.getActiveSheet().getRange('A1').setValue(json[0].mail);
    return json.totalregistros;
    
  }
  catch(err){
      return false;  
  }
}