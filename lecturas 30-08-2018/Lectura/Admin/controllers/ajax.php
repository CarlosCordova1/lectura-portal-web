<?php 

class Funciones 
{     public function validaAlgo($algo)
    {
        return $this->Algo($algo) ;
    }
     private function Algo($algo)
    {
        return 'Funciones esta validando  : ' . $algo ;
    }

 public function cifrar($string){

 return "";
}

public function descifrar($string){
 return "";
}
}//termina clase Funciones




class Login extends Funciones
{ private $post;
	//	private $urlAPIAGK_login='https://www.aguakan.com/git/api/apiweb.php?';// x7rptyax01.aguakan
		private $urlAPIAGK_login='https://www.aguakan.com/git/api/webt.php?';// app.aguakan
  
//_-------------------------------------------------------------------------------------------   
     public function init($post,$accion)
    {
    	$this->post=$post;
       
    	switch ($accion) {
    		case 'existeUsuario':
    			echo $this->validaSiexiste();
    			break;
    		case 'lgr':
    			$perm=json_decode($this->permisos());    			
    		if($perm->permisos[0]->servicios->lct->admin==1 || $perm->permisos[0]->servicios->lct->operativo==1 )
    		{//|| $perm->permisos[0]->servicios->lgn->supervisor==1){
    			echo $this->cargarPlantillaregistradoAdmin();//operador
    		}else if($perm->permisos[0]->servicios->lgn->invitado==1){
    			echo $this->cargarPlantillaregistrado();//invitado
    			
    		}else{
    			echo $this->cargarPlantillaregistrado();//invitado
    		}
   			
    			break;
    			case 'permisos':
    			return $this->permisos();
    			break;
    			case 'logout':
    			echo $this->logout();
    			break;
    		default:
    			echo json_encode( array('status' =>"No hay accion"));
    			break;
    	}
    }
   
//_-------------------------------------------------------------------------------------------
     private function validaSiexiste()
    {
    	session_start();
    	//$cifrar=Funciones::cifrar($this->post["p"]);
    	//$Descifrado=Funciones::descifrar($cifrar);
    	$cifrar=md5($this->post["p"]);
    	//$Descifrado=Funciones::descifrar($cifrar);
    	$usuario=$this->post["u"];
    	$passw=$this->post["p"];

$cadena["tb"]="LuE";
$cadena["u"]=$usuario;
$cadena["p"]=$cifrar;
$status=0;
$acce= json_decode($this->apiAGK_login('login',array('mail'=>$usuario,'pass'=>$passw)));
if (isset($acce[0]->status)&& $acce[0]->status==1) {
	$status=1;
	$msg ="el usuario existe";
	if($acce[0]->servicios->lct->admin==1 || $acce[0]->servicios->lct->operativo==1)
	{// || $acce[0]->servicios->lgn->supervisor==1 || $acce[0]->servicios->lgn->invitado==1 ){
		$_SESSION['usuarioLogueadoLECT']=true;//poner nombre de esta sesion en el theme-3-master de la vista
	$_SESSION['DatosusuarioLogueadoLECT']=$acce;
	}
	else{
		$status=0;
	$msg ="El usuario existe pero no tiene permisos";
	}
}else{
	$msg= "El usuario no Existe";
	$status=0;
}

	return  json_encode( array('status'=>$status,'msg'=>$msg,'data' =>$acce));

        
    }
//_-------------------------------------------------------------------------------------------
private function apiAGK_login($action,  $data){
 $get='urlget=';
 		$build=array();
 switch ($action) {
 	case 'login':
 	$get.='lgn/1.0/lgn/';
 	$build = array('action' => $action,'login' => $data['mail'],'pass'=>$data['pass'],'auth'=>'auth'  );
 		break;
 		default:
 		# code...
 		break;
 }
 $urlLogin=$this->urlAPIAGK_login.$get;
$curl = curl_init($urlLogin);			 
			curl_setopt($curl, CURLOPT_CONNECTTIMEOUT,5);
			curl_setopt($curl, CURLOPT_POST,true);  
			curl_setopt($curl, CURLOPT_POSTFIELDS, $build); 
			curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
			$response = curl_exec ($curl);  
			curl_close($curl);	
			return $response;   
}

//_-------------------------------------------------------------------------------------------
private function permisos(){
session_start();
$status=0;
$msg="";
$respuesta=0;
$nameSesion="datosUsuarioLTC";//tambien debe de estar declarada en ajax.php
if (isset($_SESSION[$nameSesion])) {
	$msg="permisos del usuario";
	$status=1;
	$respuesta=$_SESSION['DatosusuarioLogueadoLECT'];
}else{
	$msg="usuario no registrado o sesion caducada";
}
return  json_encode( array('status'=>$status,'msg'=>$msg,'permisos' =>$respuesta));
}
//_-------------------------------------------------------------------------------------------
    private function cargarPlantillaregistrado(){//operador
$details=true;
include_once("../views/ajax/views.php");
    }
//_-------------------------------------------------------------------------------------------
 private function cargarPlantillaregistradoAdmin(){//admin
$details=true;
$dat=json_decode($this->permisos());
//echo "este es la plantilla para el admin";
include_once("../views/ajax/views_admin/views_admin.php");
    }
//_-------------------------------------------------------------------------------------------
    private function logout(){
session_start();
session_destroy();
return  json_encode( array('logout'=>1));
    }
//_-------------------------------------------------------------------------------------------
    
}//termina clase Login

//_-------------------------------------------------------------------------------------------//_-------------------------------------------------------------------------------------------//_-------------------------------------------------------------------------------------------//_-------------------------------------------------------------------------------------------
class Ajax extends Login
{
private $post;
private $action;


private $mensajeError="La aplicacion esta desabilitada por el administrador de sistema, favor de ponerse en contacto con el departamento de TI para mas informacion";
private $mensajePermisos="No tiene suficientes permisos para realizar esta accion, pongase en contacto con el administrador del sistema";
//private $urlAPIAGK='https://www.aguakan.com/git/api/apiweb.php?';//x7rptyax01.aguakan
private $urlAPIAGK='https://www.aguakan.com/git/api/webt.php?';//pbayax01.aguakan

	function __construct($argument)
	{


  $this->post=$argument;//toda la entrada de datos por $_POST
$this->action=$this->post["action"];
if ($this->post["action"]=="c") {
$this->fechaConvenio=str_replace("/","-",$this->post["date"]);//formato db
$this->dataJson=$this->post["data"];
 $valjson=json_decode($this->post["data"]);

}
else{

}

	}
//_-------------------------------------------------------------------------------------------
private function validaStatusApp(){
		$status=false;
		   $Acceso= json_decode($this->apiAGK('status',array()));
        if(isset($Acceso[0]->estatusAplicacion) && $Acceso[0]->estatusAplicacion==1){
           $status=true;
        }
             return $status; 
	}
//_-------------------------------------------------------------------------------------------
	private function apiAGK($action,  $data){
 $get='urlget=';
 
 		$build=array();
 switch ($action) {

  		case 'verCeTrabajo':
  		$get.='lct/1.0/lct/'; 		
 			$build = array('action' => $action,'auth'=>'auth');
 		break;
 		case 'showTable':
  		$get.='lct/1.0/lct/'; 		
 			$build = array('action' => $action,'auth'=>'auth','oratkn'=>$data['oratkn'],'switch'=>'');
 		break;
 		case 'show.R.L.A.':
  		$get.='lct/1.0/lct/'; 		
 			$build = array('action' => $action,'auth'=>'auth','date'=>$data['date'],'oratkn'=>$data['oratkn']);
 		break;
 		case 'show.contrato.ruta.local':
  		$get.='lct/1.0/lct/'; 		
 			$build = array('action' => $action,'auth'=>'auth','contrato'=>$data['contrato'],'oratkn'=>$data['oratkn']);
 		break;
 		
 		case 'showRutasAsginada':
  		$get.='lct/1.0/lct/'; 		
 			$build = array('action' => $action,'auth'=>'auth','date'=>$data['date'],'oratkn'=>$data['oratkn']);
 		break;
 		case 'showRutaslocal':
  		$get.='lct/1.0/lct/'; 		
 			$build = array('action' => $action,'auth'=>'auth','oratkn'=>$data['oratkn']);
 		break;
 		case 'addRutaAsginacion':
  		$get.='lct/1.0/lct/'; 		
 			$build = array('action' => $action,'auth'=>'auth','oratkn'=>$data['oratkn'],'datos'=>$data['datos']);
 		break;
 		case 'addRutaLocalAsginacion':
  		$get.='lct/1.0/lct/'; 		
 			$build = array('action' => $action,'auth'=>'auth','oratkn'=>$data['oratkn'],'datos'=>$data['datos']);
 		break;
 		
 		case 'RutaLocalOrdeSec':
  		$get.='lct/1.0/lct/'; 		
 			$build = array('action' => $action,'auth'=>'auth','oratkn'=>$data['oratkn'],'datos'=>$data['datos']);
 		break;


 		case 'editarRutaLocalAsg':
  		$get.='lct/1.0/lct/'; 		
 			$build = array('action' => $action,'auth'=>'auth','oratkn'=>$data['oratkn'],'datos'=>$data['datos']);
 		break;

 		case 'status':
 		$get.='lct/1.0/status/';
 	$build = array('action' => $action,'auth'=>'auth');
 		break;
  		case 'Agregarlecturista': 	
 		$get.='lct/1.0/lct/'; 		
 		$build = array('action' => $action,'oratkn'=>$data['oratkn'],'datos'=>$data['datos'],'auth'=>'auth');
 		break;	
 		case 'AgregarMobile': 	
 		$get.='lct/1.0/lct/'; 		
 		$build = array('action' => $action,'oratkn'=>$data['oratkn'],'datos'=>$data['datos'],'auth'=>'auth');
 		break;			
 		case 'usuarioGestionar':
 		$get.='lct/1.0/lct/';
 		$build = array('action' => $action,'oratkn'=>$data['oratkn'],'auth'=>'auth');
 		break;	
 		case 'mobileGestionar':
 		$get.='lct/1.0/lct/';
 		$build = array('action' => $action,'oratkn'=>$data['oratkn'],'auth'=>'auth','switch'=>'');
 		break;

 		case 'showLotemasDetalles':
 		$get.='lct/1.0/lct/';
 		$build = array('action' => $action,'oratkn'=>$data['oratkn'],'odt'=>$data['odt'],'auth'=>'auth','switch'=>'');
 		break;

 		case 'enviarx7complete':
 		$get.='lct/1.0/lct/';
 		$build = array('action' => $action,'oratkn'=>$data['oratkn'],'odt'=>$data['odt'],'auth'=>'auth','switch'=>'');
 		break;
 		case 'CambiarLoteFact':
 		$get.='lct/1.0/lct/';
 		$build = array('action' => $action,'oratkn'=>$data['oratkn'],'odt'=>$data['odt'],'nuevodata'=>$data['nuevodata'],'auth'=>'auth','switch'=>'');
 		break;
 		

 		case 'showCentroOperac':
 		$get.='lct/1.0/lct/';
 		$build = array('action' => $action,'oratkn'=>$data['oratkn'],'auth'=>'auth','switch'=>'');
 		break;	

 		
 		case 'ChageEstatus_lect_mob':
 		$get.='lct/1.0/lct/';
 		$build = array('action' => $action,
 			'oratkn'=>$data['oratkn'],
 			'clave'=>$data['clave'],
 			'value'=>$data['val'],
 			'change'=>$data['change'],
 			'auth'=>'auth');
 		break;
 		case 'ChageEstatus_asignacion':
 		$get.='lct/1.0/lct/';
 		$build = array('action' => $action,
 			'oratkn'=>$data['oratkn'],
 			'clave'=>$data['clave'],
 			'value'=>$data['val'],
 			'change'=>$data['change'],
 			'auth'=>'auth');
 		break;
 			
 		
 		
 	
 	default:
 		$get.='lct/1.0/lct/'; 		
 		$build = array('action' => $action);
 		break;
 }
 $urlLogin=$this->urlAPIAGK.$get;
$curl = curl_init($urlLogin);			 
			curl_setopt($curl, CURLOPT_CONNECTTIMEOUT,5);
			curl_setopt($curl, CURLOPT_POST,true);  
			curl_setopt($curl, CURLOPT_POSTFIELDS, $build); 
			curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
			$response = curl_exec ($curl);  
			curl_close($curl);	
			return $response;
   
}
//_-------------------------------------------------------------------------------------------
	public function init (){
		$this->accion();
	}
//_-------------------------------------------------------------------------------------------
	private function accion (){
				switch ($this->action) {
			
						case 'login'://valido acceso a la aplicacion
						if($this->validaStatusApp()){
					Login::init($this->post,"existeUsuario");
					//echo json_encode(array("status"=>0,"msg"=>"otro error"));
				}else{
					echo json_encode(array("status"=>0,"msg"=>$this->mensajeError));
				}
				break;
					case 'lgr'://valido acceso a la aplicacion
					if($this->validaStatusApp()){
					Login::init($this->post,"lgr");
				}else{
					echo json_encode(array("status"=>0,"msg"=>$this->mensajeError));
				}
				break;
				case 'logout'://valido acceso a la aplicacion
					if($this->validaStatusApp()){
					Login::init($this->post,"logout");
				}else{
					echo json_encode(array("status"=>0,"msg"=>$this->mensajeError));
				}
				break;
				

/*/
			case 'c':
			//$dato=Login::init("","permisos");
			//$permisos= json_decode($dato );
					if($this->validaStatusApp()){
						$permisos= json_decode( Login::init($this->post,"permisos"));
						$var=$permisos->permisos;
						//if($permisos->status==1 && $var[0]->soloLectura==1){
							if($permisos->permisos[0]->servicios->lgn->admin==1){
							//$this->insertarConvenio($permisos->permisos);
								$this->insertarUsuario($permisos);
								//echo json_encode(array("status"=>1,"msg"=>'Aqui creare el usuario'));
							
						}else{
							echo json_encode(array("status"=>0,"msg"=>$permisos->msg,"permisos"=>$permisos->permisos[0]->servicios->lgn));
						}
				
				}else{
					echo json_encode(array("status"=>0,"msg"=>$this->mensajeError));
				}
				
				
				//echo json_encode(array("status"=>0,"msg"=>$this->mensajeError,"permisos"=>$permisos->permisos));
				break;
				/*/
					case 'PermisosPlantilla':
				$permisos= json_decode( Login::init($this->post,"permisos"));
					$this->loadtemplatePermisos($permisos);
					break;
					case 'PermisosGuardar':
				$permisos= json_decode( Login::init($this->post,"permisos"));
					$this->PermisosGuardar($permisos);
					break;

					case 'showlotes'://cargo tabla que muestra las encuentas creadas
					//if($this->validaStatusApp()){	
						//$this->showEncuestas();	$this->showlotes();	/**/	
					//					}
							if($this->validaStatusApp()){
						$permisos= json_decode( Login::init($this->post,"permisos"));
						$var=$permisos->permisos;
								if($permisos->permisos[0]->servicios->lct->admin==1 ){//|| $permisos->permisos[0]->servicios->lct->operativo==1){
											$this->showlotes($permisos);										
						}else{
							echo json_encode(array("status"=>0,"msg"=>$this->mensajePermisos));
						}				
				}else{
					echo json_encode(array("status"=>0,"msg"=>$this->mensajeError));
				}
					break;
					
					case 'loadtemplateusuario':
				$permisos= json_decode( Login::init($this->post,"permisos"));
					$this->loadtemplateusuario($permisos);
					break;
					case 'loadtemplateEditUsuario':
				$permisos= json_decode( Login::init($this->post,"permisos"));
					$this->loadtemplateEditarUsuario($permisos);
					break;
					case 'loadtemplateUsuarioGestionar':
				$permisos= json_decode( Login::init($this->post,"permisos"));
					$this->loadtemplateUsuarioGestionar($permisos);
					break;

						case 'loadtemplateUsuarioPerfilCrear':
				$permisos= json_decode( Login::init($this->post,"permisos"));
					$this->loadtemplateUsuarioPerfilCrear($permisos);
					break;
					case 'loadtemplateUsuarioPerfilGestionar':
				$permisos= json_decode( Login::init($this->post,"permisos"));
					$this->loadtemplateUsuarioPerfilGestionar($permisos);
					break;

					case 'loadtemplatemobile':
				$permisos= json_decode( Login::init($this->post,"permisos"));
					$this->loadtemplatemobile($permisos);
					break;
					case 'loadtemplateMasDetalles':
				$permisos= json_decode( Login::init($this->post,"permisos"));
					$this->loadtemplateMasDetalles($permisos);
					break;
					case 'enviarAx7':
				$permisos= json_decode( Login::init($this->post,"permisos"));
					$this->loadenviarAx7($permisos);
					break;

					case 'CambiarLoteFact':
				$permisos= json_decode( Login::init($this->post,"permisos"));
					$this->CambiarLoteFact($permisos);
					break;

					
					case 'loadtemplateEditMobile':
				$permisos= json_decode( Login::init($this->post,"permisos"));
					$this->loadtemplateEditarMobile($permisos);
					break;
					case 'loadtemplateEditMobileGestion':
				$permisos= json_decode( Login::init($this->post,"permisos"));
					$this->loadtemplateEditMobileGestion($permisos);
					break;

					case 'loadtemplateGestionLote':
				$permisos= json_decode( Login::init($this->post,"permisos"));
					$this->loadtemplateGestionLote($permisos);
					break;

					case 'loadtemplateRuta':
				$permisos= json_decode( Login::init($this->post,"permisos"));
					$this->loadtemplateRuta($permisos);
					break;
					case 'loadtemplateAsignarRuta':
				$permisos= json_decode( Login::init($this->post,"permisos"));
					$this->loadtemplateAsignarRuta($permisos);
					break;
					case 'loadtemplateAsignadaRuta':
				$permisos= json_decode( Login::init($this->post,"permisos"));
					$this->loadtemplateAsignadaRuta($permisos);
					break;
						case 'loadtemplateRutaLocal':
				$permisos= json_decode( Login::init($this->post,"permisos"));
					$this->loadtemplateRutaLocal($permisos);
					break;
					case 'loadtemplateRutaLocalOrdenar':
				$permisos= json_decode( Login::init($this->post,"permisos"));
					$this->loadtemplateRutaLocalOrdenar($permisos);
					break;

					case 'loadtemplateRutaLocalGestionar':
				$permisos= json_decode( Login::init($this->post,"permisos"));
					$this->loadtemplateRutaLocalGestionar($permisos);
					break;
					case 'loadtemplateReporte':
				$permisos= json_decode( Login::init($this->post,"permisos"));
					$this->loadtemplateReporte($permisos);
					break;
					case 'loadtemplateReporteMenu1':
				$permisos= json_decode( Login::init($this->post,"permisos"));
					$this->loadtemplateReporteMenu1($permisos);
					break;
					case 'loadtemplateCatalogo':
				$permisos= json_decode( Login::init($this->post,"permisos"));
					$this->loadtemplateCatalogo($permisos);
					break;
					case 'loadtemplateCatalogoMenu1':
				$permisos= json_decode( Login::init($this->post,"permisos"));
					$this->loadtemplateCatalogoMenu1($permisos);
					break;
					case 'loadtemplateAlerta':
				$permisos= json_decode( Login::init($this->post,"permisos"));
					$this->loadtemplateAlerta($permisos);
					break;
					case 'loadtemplateAlertaMenu1':
				$permisos= json_decode( Login::init($this->post,"permisos"));
					$this->loadtemplateAlertaMenu1($permisos);
					break;
				
	//--------------------------------------------------------------------------------------------
						case 'datoslecturistas':
					if($this->validaStatusApp()){
						$permisos= json_decode( Login::init($this->post,"permisos"));
						$var=$permisos->permisos;
								if($permisos->permisos[0]->servicios->lct->admin==1 ){//|| $permisos->permisos[0]->servicios->lct->operativo==1){
											$this->insertarUsuariolect($permisos);										
						}else{
							echo json_encode(array("status"=>0,"msg"=>$this->mensajePermisos));
						}				
				}else{
					echo json_encode(array("status"=>0,"msg"=>$this->mensajeError));
				}
				break;
	//--------------------------------------------------------------------------------------------
				//--------------------------------------------------------------------------------------------
						case 'datosMobile':
					if($this->validaStatusApp()){
						$permisos= json_decode( Login::init($this->post,"permisos"));
						$var=$permisos->permisos;
								if($permisos->permisos[0]->servicios->lct->admin==1 ){//|| $permisos->permisos[0]->servicios->lct->operativo==1){
											$this->insertarDatosMobile($permisos);										
						}else{
							echo json_encode(array("status"=>0,"msg"=>$this->mensajePermisos));
						}				
				}else{
					echo json_encode(array("status"=>0,"msg"=>$this->mensajeError));
				}
				break;
	//--------------------------------------------------------------------------------------------
				case 'changeEstatusLecturista':
					if($this->validaStatusApp()){
						$permisos= json_decode( Login::init($this->post,"permisos"));
						$var=$permisos->permisos;
								if($permisos->permisos[0]->servicios->lct->admin==1 ){//|| $permisos->permisos[0]->servicios->lct->operativo==1){
											$this->changeEstatusLecturista($permisos);										
						}else{
							echo json_encode(array("status"=>0,"msg"=>$this->mensajePermisos));
						}				
				}else{
					echo json_encode(array("status"=>0,"msg"=>$this->mensajeError));
				}
				break;
	//--------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------
				case 'changeEstatusRutaLocal':
					if($this->validaStatusApp()){
						$permisos= json_decode( Login::init($this->post,"permisos"));
						$var=$permisos->permisos;
								if($permisos->permisos[0]->servicios->lct->admin==1 ){//|| $permisos->permisos[0]->servicios->lct->operativo==1){
											$this->changeEstatusRutaLocal($permisos);										
						}else{
							echo json_encode(array("status"=>0,"msg"=>$this->mensajePermisos));
						}				
				}else{
					echo json_encode(array("status"=>0,"msg"=>$this->mensajeError));
				}
				break;
	//--------------------------------------------------------------------------------------------

				//--------------------------------------------------------------------------------------------
				case 'changeEstatusAsignacion':
					if($this->validaStatusApp()){
						$permisos= json_decode( Login::init($this->post,"permisos"));
						$var=$permisos->permisos;
								if($permisos->permisos[0]->servicios->lct->admin==1 ){//|| $permisos->permisos[0]->servicios->lct->operativo==1){
											$this->changeEstatusAsignacion($permisos);										
						}else{
							echo json_encode(array("status"=>0,"msg"=>$this->mensajePermisos));
						}				
				}else{
					echo json_encode(array("status"=>0,"msg"=>$this->mensajeError));
				}
				break;
	//--------------------------------------------------------------------------------------------
						case 'show.R.L.A.':
					if($this->validaStatusApp()){
						$permisos= json_decode( Login::init($this->post,"permisos"));
						$var=$permisos->permisos;
								if($permisos->permisos[0]->servicios->lct->admin==1){// || $permisos->permisos[0]->servicios->lct->operativo==1){
											$this->showrutaLecturistaAsginaciones($permisos);									
						}else{
							echo json_encode(array("status"=>0,"msg"=>$this->mensajePermisos));
						}				
				}else{
					echo json_encode(array("status"=>0,"msg"=>$this->mensajeError));
				}
				break;
	//--------------------------------------------------------------------------------------------
				//--------------------------------------------------------------------------------------------
						case 'show.contrato':
					if($this->validaStatusApp()){
						$permisos= json_decode( Login::init($this->post,"permisos"));
						$var=$permisos->permisos;
								if($permisos->permisos[0]->servicios->lct->admin==1){// || $permisos->permisos[0]->servicios->lct->operativo==1){
											$this->buscarcontrato($permisos);									
						}else{
							echo json_encode(array("status"=>0,"msg"=>$this->mensajePermisos));
						}				
				}else{
					echo json_encode(array("status"=>0,"msg"=>$this->mensajeError));
				}
				break;
	//--------------------------------------------------------------------------------------------
				//--------------------------------------------------------------------------------------------
						case 'AgregarAsignacionRuta':
					if($this->validaStatusApp()){
						$permisos= json_decode( Login::init($this->post,"permisos"));
						$var=$permisos->permisos;
								if($permisos->permisos[0]->servicios->lct->admin==1 ){//|| $permisos->permisos[0]->servicios->lct->operativo==1){
											$this->addRutaAsginacion($permisos);									
						}else{
							echo json_encode(array("status"=>0,"msg"=>$this->mensajePermisos));
						}				
				}else{
					echo json_encode(array("status"=>0,"msg"=>$this->mensajeError));
				}
				break;
	//--------------------------------------------------------------------------------------------
				//--------------------------------------------------------------------------------------------
				//--------------------------------------------------------------------------------------------
						case 'AgregarAsignacionRutaLocal':
					if($this->validaStatusApp()){
						$permisos= json_decode( Login::init($this->post,"permisos"));
						$var=$permisos->permisos;
								if($permisos->permisos[0]->servicios->lct->admin==1 ){//|| $permisos->permisos[0]->servicios->lct->operativo==1){
											$this->addRutaLocalAsginacion($permisos);
																				
						}else{
							echo json_encode(array("status"=>0,"msg"=>$this->mensajePermisos));
						}				
				}else{
					echo json_encode(array("status"=>0,"msg"=>$this->mensajeError));
				}
				break;
	//--------------------------------------------------------------------------------------------
					//--------------------------------------------------------------------------------------------
						case 'OrdenarSecuenciaRutaLocal':
					if($this->validaStatusApp()){
						$permisos= json_decode( Login::init($this->post,"permisos"));
						$var=$permisos->permisos;
								if($permisos->permisos[0]->servicios->lct->admin==1 ){//|| $permisos->permisos[0]->servicios->lct->operativo==1){
											$this->RutaLocalOrdenarSecuencia($permisos);
																				
						}else{
							echo json_encode(array("status"=>0,"msg"=>$this->mensajePermisos));
						}				
				}else{
					echo json_encode(array("status"=>0,"msg"=>$this->mensajeError));
				}
				break;
	//--------------------------------------------------------------------------------------------
				//--------------------------------------------------------------------------------------------
						case 'AgregarAsignacionRutaLocalEditado':

					if($this->validaStatusApp()){
						$permisos= json_decode( Login::init($this->post,"permisos"));
						$var=$permisos->permisos;
								if($permisos->permisos[0]->servicios->lct->admin==1 ){//|| $permisos->permisos[0]->servicios->lct->operativo==1){
											$this->editarRutaLocalAsginacion($permisos);
																				
						}else{
							echo json_encode(array("status"=>0,"msg"=>$this->mensajePermisos));
						}				
				}else{
					echo json_encode(array("status"=>0,"msg"=>$this->mensajeError));
				}
				break;
	//--------------------------------------------------------------------------------------------
				default:
				echo "No hay accion";
				break;
		}

		
	}
//_-------------------------------------------------------------------------------------------
private function showlotes($permisos){
$respuesta2= $this->apiAGK('showTable',array('oratkn'=>$permisos->permisos[0]->oratkn));
	$status=0;
	
	$msg="";
if ($respuesta2) {
	$msg ="Usuario listo";
	$status=1;
	
}else{
	$msg= "Error al mostrar lotes";
	$status=0;
}

//echo json_encode(array("url"=>$this->urlUpdateTables.$parametro,"msg"=>$msg,"status"=>$status,"data"=>$respuesta));
echo json_encode(array("msg"=>$msg,"status"=>$status,"data"=>$respuesta2));
}

//_-------------------------------------------------------------------------------------------
//_-------------------------------------------------------------------------------------------
private function showrutaLecturistaAsginaciones($permisos){
	//$todopost=json_decode($this->post["data"]);

$datos['date']= trim($this->post["date"]);
$status=1;
	$msg= "";
	
if($status!=0){
	$respuesta2= json_decode($this->apiAGK('show.R.L.A.',
		array('oratkn'=>$permisos->permisos[0]->oratkn,'date'=>$datos['date'])));
if (isset($respuesta2[0]->status) && $respuesta2[0]->status==0) {
	$msg =$respuesta2[0]->msg;
	$status=0;
	
}else if (isset($respuesta2[0]->status) && $respuesta2[0]->status==1){
$msg =$respuesta2[0]->msg;
	$status=1;

}
else{
	$msg ="error";
	$status=0;
}
}
//echo json_encode(array("msg"=>$msg,"status"=>$status,"datarespuesta"=>$respuesta2,"datosrecibido"=>$datos));
echo json_encode(array("msg"=>$msg,"status"=>$status,"datarespuesta"=>$respuesta2));
}
//_-------------------------------------------------------------------------------------------
//_-------------------------------------------------------------------------------------------
private function buscarcontrato($permisos){
	//$todopost=json_decode($this->post["data"]);
	
$array = explode(",", trim($this->post["contrato"]));
$arrayContrato=array();
foreach ($array as $key => $value) {
	array_push($arrayContrato, intval($value));
}

//$arrayContrato =$this->post["contrato"];
//$datos['contrato']= trim($this->post["contrato"]);
$status=1;
	$msg= "";
	
if($status!=0){
	$respuesta2= json_decode($this->apiAGK('show.contrato.ruta.local',
		array('oratkn'=>$permisos->permisos[0]->oratkn,'contrato'=>json_encode($arrayContrato))));
if (isset($respuesta2[0]->status) && $respuesta2[0]->status==0) {
	$msg =$respuesta2[0]->msg;
	$status=0;
	
}else if (isset($respuesta2[0]->status) && $respuesta2[0]->status==1){
$msg =$respuesta2[0]->msg;
	$status=1;

}
else{
	$msg ="error";
	$status=0;
}
}
//echo json_encode(array("msg"=>$msg,"status"=>$status,"datarespuesta"=>$respuesta2,"datosrecibido"=>$datos));
echo json_encode(array("msg"=>$msg,"status"=>$status,"datarespuesta"=>$respuesta2,"arrayContrato"=>json_encode($arrayContrato)));
}
//_-------------------------------------------------------------------------------------------
//_-------------------------------------------------------------------------------------------
private function addRutaAsginacion($permisos){
	$todopost=json_decode($this->post["data"]);

$datos['date']= trim($this->post["date"]);
$datos['lecturista']= $todopost;
//$datos['etiqueta']= trim($this->post["etiqueta"]);
$datos['ruta']= trim($this->post["ruta"]);
$datos['lote']= trim($this->post["lote"]);


$status=1;
	$msg= "";
	
if($status!=0){
	$respuesta2= json_decode($this->apiAGK('addRutaAsginacion',
		array('oratkn'=>$permisos->permisos[0]->oratkn,'datos'=>json_encode($datos))));
if (isset($respuesta2[0]->status) && $respuesta2[0]->status==0) {
	$msg =$respuesta2[0]->msg;
	$status=0;
	
}else if (isset($respuesta2[0]->status) && $respuesta2[0]->status==1){
$msg =$respuesta2[0]->msg;
	$status=1;

}
else{
	$msg ="error";
	$status=0;
}
}
echo json_encode(array("msg"=>$msg,"status"=>$status,"datarespuesta"=>$respuesta2,"datosrecibido"=>$datos));
//echo json_encode(array("msg"=>$msg,"status"=>$status,"datarespuesta"=>$respuesta2));
}
//_-------------------------------------------------------------------------------------------
//_-------------------------------------------------------------------------------------------
private function addRutaLocalAsginacion($permisos){
	$todopost=json_decode($this->post["data"]);
	$todopostcontraro=json_decode($this->post["contrato"]);

$datos['label']= trim($this->post["etiqueta"]);
//$datos['medidor']= $this->post["data"];

$arrayContrato=array();
foreach ($todopost as $key => $value) {
	array_push($arrayContrato, intval($value));
}
$datos['medidor']= $arrayContrato;


$arrayContrato2=array();
foreach ($todopostcontraro as $key => $value) {
	array_push($arrayContrato2, intval($value));
}
$datos['contrato']= $arrayContrato2;


//$datos['lote']= trim($this->post["lote"]);


$status=1;
	$msg= "";
	
if($status!=0){
	$respuesta2= json_decode($this->apiAGK('addRutaLocalAsginacion',
		array('oratkn'=>$permisos->permisos[0]->oratkn,'datos'=>json_encode($datos))));
if (isset($respuesta2[0]->status) && $respuesta2[0]->status==0) {
	$msg =$respuesta2[0]->msg;
	$status=0;
	
}else if (isset($respuesta2[0]->status) && $respuesta2[0]->status==1){
$msg =$respuesta2[0]->msg;
	$status=1;

}
else{
	$msg ="error";
	$status=0;
}
}
echo json_encode(array("msg"=>$msg,"status"=>$status,"datarespuesta"=>$respuesta2,"datosrecibido"=>$datos));
//echo json_encode(array("msg"=>$msg,"status"=>$status,"datarespuesta"=>$respuesta2));
}
//_-------------------------------------------------------------------------------------------

//_-------------------------------------------------------------------------------------------
private function RutaLocalOrdenarSecuencia($permisos){
	$todopost=json_decode($this->post["data"]);

$datos['ruta']= intval (trim($this->post["ruta"]));
//$datos['medidor']= $this->post["data"];
/*
$arraySecuencia=array();
foreach ($todopost as $key => $value) {
	array_push($arraySecuencia, intval($value));
}
*/
$datos['secuencia']= $todopost;

//$datos['lote']= trim($this->post["lote"]);


$status=1;
	$msg= "";
	
if($status!=0){//
	$respuesta2= json_decode($this->apiAGK('RutaLocalOrdeSec',
		array('oratkn'=>$permisos->permisos[0]->oratkn,'datos'=>json_encode($datos))));
if (isset($respuesta2[0]->status) && $respuesta2[0]->status==0) {
	$msg =$respuesta2[0]->msg;
	$status=0;
	
}else if (isset($respuesta2[0]->status) && $respuesta2[0]->status==1){
$msg =$respuesta2[0]->msg;
	$status=1;

}
else{
	$msg ="error";
	$status=0;
}
}
echo json_encode(array("msg"=>$msg,"status"=>$status,"datarespuesta"=>$respuesta2,"datosrecibido"=>$datos));
//echo json_encode(array("msg"=>$msg,"status"=>$status,"datarespuesta"=>$respuesta2));
}
//_-------------------------------------------------------------------------------------------

//_-------------------------------------------------------------------------------------------
private function editarRutaLocalAsginacion($permisos){
	$todopost=json_decode($this->post["data"]);
	$todopostcontrato=json_decode($this->post["contrato"]);

$datos['idlabel']= trim($this->post["idetiqueta"]);
//$datos['medidor']= $this->post["data"];

$arrayContrato=array();
foreach ($todopost as $key => $value) {
	array_push($arrayContrato, intval($value));
}
$datos['medidor']= $arrayContrato;


$arrayContrato2=array();
foreach ($todopostcontrato as $key => $value) {
	array_push($arrayContrato2, intval($value));
}
$datos['contrato']= $arrayContrato2;

//$datos['lote']= trim($this->post["lote"]);


$status=1;
	$msg= "";
	
if($status!=0){
	$respuesta2= json_decode($this->apiAGK('editarRutaLocalAsg',
		array('oratkn'=>$permisos->permisos[0]->oratkn,'datos'=>json_encode($datos))));
if (isset($respuesta2[0]->status) && $respuesta2[0]->status==0) {
	$msg =$respuesta2[0]->msg;
	$status=0;
	
}else if (isset($respuesta2[0]->status) && $respuesta2[0]->status==1){
$msg =$respuesta2[0]->msg;
	$status=1;

}
else{
	$msg ="error";
	$status=0;
}
}
echo json_encode(array("msg"=>$msg,"status"=>$status,"datarespuesta"=>$respuesta2,"datosrecibido"=>$datos));
//echo json_encode(array("msg"=>$msg,"status"=>$status,"datarespuesta"=>$respuesta2));
}
//_-------------------------------------------------------------------------------------------
private function showrutaLecturistaYaAsignado(){
	//$todopost=json_decode($this->post["data"]);
$permisos= json_decode( Login::init($this->post,"permisos"));
$datos['date']= trim($this->post["date"]);
$status=1;
	$msg= "";
	
if($status!=0){
	$respuesta2= json_decode($this->apiAGK('showRutasAsginada',
		array('oratkn'=>$permisos->permisos[0]->oratkn,'date'=>$datos['date'])));
if (isset($respuesta2[0]->status) && $respuesta2[0]->status==0) {
	$msg =$respuesta2[0]->msg;
	$status=0;
	
}else if (isset($respuesta2[0]->status) && $respuesta2[0]->status==1){
$msg =$respuesta2[0]->msg;
	$status=1;

}
else{
	$msg ="error";
	$status=0;
}
}
//echo json_encode(array("msg"=>$msg,"status"=>$status,"datarespuesta"=>$respuesta2,"datosrecibido"=>$datos));
return array("msg"=>$msg,"status"=>$status,"datarespuesta"=>$respuesta2);
}
//_-------------------------------------------------------------------------------------------
//_-------------------------------------------------------------------------------------------
private function showrutaLocal(){
	$permisos= json_decode( Login::init($this->post,"permisos"));
$status=1;
	$msg= "";
	
if($status!=0){
	$respuesta2= json_decode($this->apiAGK('showRutaslocal',
		array('oratkn'=>$permisos->permisos[0]->oratkn)));
if (isset($respuesta2[0]->status) && $respuesta2[0]->status==0) {
	$msg =$respuesta2[0]->msg;
	$status=0;
	
}else if (isset($respuesta2[0]->status) && $respuesta2[0]->status==1){
$msg =$respuesta2[0]->msg;
	$status=1;

}
else{
	$msg ="error";
	$status=0;
}
}
//echo json_encode(array("msg"=>$msg,"status"=>$status,"datarespuesta"=>$respuesta2,"datosrecibido"=>$datos));
return array("msg"=>$msg,"status"=>$status,"datarespuesta"=>$respuesta2);
}
//_-------------------------------------------------------------------------------------------



private function insertarUsuariolect($permisos){
$todopost=json_decode($this->post["data"]);
//echo json_encode($todopost);
//exit();

$todopost=$todopost->datos;
//"{"lgnNombre":"Nombre","lgnUsuario":"Usuario","lgnPassw":"Contraseña","lgnConPassw":"Confirmar Contraseña","lgnEmail":"mail@mail.com"}"
$datos['lctcentro']= (int) trim($todopost->lctcentro);
$datos['lctperfil']= (int) trim($todopost->lctperfil);
$datos['activo']= (int) trim($todopost->activo);
$datos['clave']= (int) trim($todopost->clave);
$datos['nombre']= trim($todopost->nombre);

$datos['apaterno']= trim($todopost->apaterno);
$datos['amaterno']= trim($todopost->amaterno);
$datos['genero']= (int) trim($todopost->genero);
$datos['usuario']= trim($todopost->usuario);
//$datos['pass1']= md5(trim($todopost->pass1));
$datos['pass1']= trim($todopost->pass1);

$datos['pass2']= trim($todopost->pass2);
$datos['mail']= trim($todopost->mail);
$datos['file_name']=$datos['clave']."_".trim($todopost->file_name);

$file_base64= trim($todopost->file_base64);
$datos['file_type']= trim($todopost->file_type);
	if($file_base64=="") {
	$datos['file_name']="default-user.png";
}

//echo json_encode($datos);exit();

/*/
$mail=$datos["lgnEmail"];/*/
	$status=1;
	$msg= "";
/*/
if (strlen($datos["lgnNombre"])<5) {
	$msg= "Nombre muy corto, minimo 5 caractares";
	$status=0;
}else if (strlen($datos["lgnUsuario"])<3) {
	$msg= "Usuario muy corto, minimo 3 caractares";
	$status=0;
}else if (strlen($datos["lgnPassw"])<6) {
	$msg= "Contraseña muy corto, minimo 6 caractares";
	$status=0;
} else if ($datos["lgnPassw"]!=$datos["lgnConPassw"]) {
	$msg= "Contraseña no coincide";
	$status=0;
} else if (!ereg("^([a-zA-Z0-9._]+)@([a-zA-Z0-9.-]+).([a-zA-Z]{2,4})$",$datos["lgnEmail"])){
	$msg= "E-mail no valido";
	$status=0;
}else if (!preg_match("/@aguakan.com/i", $datos["lgnEmail"])) {
$msg= "E-mail debe ser dominio aguakan";
	$status=0;
}/*/


if($status!=0){
	$respuesta2= json_decode($this->apiAGK('Agregarlecturista',
		array('oratkn'=>$permisos->permisos[0]->oratkn,'datos'=>json_encode($datos))));
if (isset($respuesta2[0]->status) && $respuesta2[0]->status==0) {
	
	//$msg= "Error al insertar usuario";
	$msg =$respuesta2[0]->msg;
	$status=0;
	
}else if (isset($respuesta2[0]->status) && $respuesta2[0]->status==1){
$msg =$respuesta2[0]->msg;
	$status=1;
	if($file_base64!="") {
	$this->cargaryconvertirIMG($file_base64,$datos['file_name']);
}
}
else{
	$msg ="error";
	$status=0;
}
}



//echo json_encode(array("url"=>$this->urlUpdateTables.$parametro,"msg"=>$msg,"status"=>$status,"data"=>$respuesta));
echo json_encode(array("msg"=>$msg,"status"=>$status,"datarespuesta"=>$respuesta2,"datosrecibido"=>$datos));
}
//_-------------------------------------------------------------------------------------------
//_-------------------------------------------------------------------------------------------
private function insertarDatosMobile($permisos){
$todopost=json_decode($this->post["data"]);
$todopost=$todopost->datos;

$datos['activo']= (int) trim($todopost->activo);
$datos['clave']= (int) trim($todopost->clave);
$datos['comentario']= trim($todopost->comentario);
$datos['copr']= trim($todopost->copr);
//echo json_encode($datos);exit();
	$status=1;
	$msg= "";
if($status!=0){
	$respuesta2= json_decode($this->apiAGK('AgregarMobile',
		array('oratkn'=>$permisos->permisos[0]->oratkn,'datos'=>json_encode($datos))));
if (isset($respuesta2[0]->status) && $respuesta2[0]->status==0) {
		//$msg= "Error al insertar usuario";
	$msg =$respuesta2[0]->msg;
	$status=0;
	
}else if (isset($respuesta2[0]->status) && $respuesta2[0]->status==1){
$msg =$respuesta2[0]->msg;
	$status=1;
}
else{
	$msg ="error";
	$status=0;
}
}

echo json_encode(array("msg"=>$msg,"status"=>$status,"datarespuesta"=>$respuesta2,"datosrecibido"=>$datos));
}
//_-------------------------------------------------------------------------------------------

//_-------------------------------------------------------------------------------------------
private function changeEstatusLecturista($permisos){
//$todopost=json_decode($this->post["data"]);
//$todopost=$todopost->datos;

$datos['clave']= (int) trim($this->post["clave"]);
$datos['val']= (int) trim($this->post["val"]);
$datos['change']= trim($this->post["change"]);//agregue nueva variable para con una sola fucion editar estatus tanto para lecturista como para mobile.
	$status=1;
	$msg= "";

if($status!=0){
	$respuesta2= json_decode($this->apiAGK('ChageEstatus_lect_mob',
		array('oratkn'=>$permisos->permisos[0]->oratkn,'clave'=>$datos['clave'],"val"=>$datos['val'],"change"=>$datos['change'])));
if (isset($respuesta2[0]->status) && $respuesta2[0]->status==0) {
	
	//$msg= "Error al insertar usuario";
	$msg =$respuesta2[0]->msg;
	$status=0;
	
}else if (isset($respuesta2[0]->status) && $respuesta2[0]->status==1){
$msg =$respuesta2[0]->msg;
	$status=1;
}
else{
	$msg ="error";
	$status=0;
}
}

echo json_encode(array("msg"=>$msg,"status"=>$status,"datarespuesta"=>$respuesta2,"datosrecibido"=>$datos));
}
//_-------------------------------------------------------------------------------------------

//_-------------------------------------------------------------------------------------------
private function changeEstatusRutaLocal($permisos){
//$todopost=json_decode($this->post["data"]);
//$todopost=$todopost->datos;

$datos['clave']= (int) trim($this->post["clave"]);
$datos['val']= (int) trim($this->post["val"]);
$datos['change']= trim($this->post["change"]);//agregue nueva variable para con una sola fucion editar estatus tanto para lecturista como para mobile.
	$status=1;
	$msg= "";

if($status!=0){
	$respuesta2= json_decode($this->apiAGK('ChageEstatus_lect_mob',
		array('oratkn'=>$permisos->permisos[0]->oratkn,'clave'=>$datos['clave'],"val"=>$datos['val'],"change"=>$datos['change'])));
if (isset($respuesta2[0]->status) && $respuesta2[0]->status==0) {
	
	//$msg= "Error al insertar usuario";
	$msg =$respuesta2[0]->msg;
	$status=0;
	
}else if (isset($respuesta2[0]->status) && $respuesta2[0]->status==1){
$msg =$respuesta2[0]->msg;
	$status=1;
}
else{
	$msg ="error";
	$status=0;
}
}

echo json_encode(array("msg"=>$msg,"status"=>$status,"datarespuesta"=>$respuesta2,"datosrecibido"=>$datos));
}
//_-------------------------------------------------------------------------------------------


//_-------------------------------------------------------------------------------------------
private function changeEstatusAsignacion($permisos){
//$todopost=json_decode($this->post["data"]);
//$todopost=$todopost->datos;

$datos['clave']= (int) trim($this->post["clave"]);
$datos['val']= (int) trim($this->post["val"]);
$datos['change']= trim($this->post["change"]);//agregue nueva variable para con una sola fucion editar estatus tanto para lecturista como para mobile.
	$status=1;
	$msg= "";

if($status!=0){
	$respuesta2= json_decode($this->apiAGK('ChageEstatus_asignacion',
		array('oratkn'=>$permisos->permisos[0]->oratkn,'clave'=>$datos['clave'],"val"=>$datos['val'],"change"=>$datos['change'])));
if (isset($respuesta2[0]->status) && $respuesta2[0]->status==0) {
	
	//$msg= "Error al insertar usuario";
	$msg =$respuesta2[0]->msg;
	$status=0;
	
}else if (isset($respuesta2[0]->status) && $respuesta2[0]->status==1){
$msg =$respuesta2[0]->msg;
	$status=1;
}
else{
	$msg ="error";
	$status=0;
}
}

echo json_encode(array("msg"=>$msg,"status"=>$status,"datarespuesta"=>$respuesta2,"datosrecibido"=>$datos));

//echo json_encode(array("msg"=>"test","status"=>0,"datarespuesta"=>$respuesta2,"datosrecibido"=>$datos));

}
//_-------------------------------------------------------------------------------------------



private function cargaryconvertirIMG($value,$name){

list($type, $value) = explode(';', $value);
list(, $value)      = explode(',', $value);
$value = base64_decode($value);

file_put_contents('../image/lecturista/'.$name, $value);


}

//_-------------------------------------------------------------------------------------------
private function loadtemplateusuario($data2){
/*
	$data=json_decode($this->post["data"]);

	$valores=array();

	$mail="";

	if($data->mail){
		$mail=$data->mail;
	}else{
		$mail=str_replace('"','',$this->post["data"]);

	}
	*/
/*/
$antecedente=json_decode($this->apiAGK('buscarFolio',array('folio'=>$folio,'info'=>'antecedente','oratkn'=>$data2->permisos[0]->oratkn)));
var_dump($antecedente);
$dataconvenio=json_decode($this->apiAGK('buscarFolio',array('folio'=>$folio,'info'=>'convenio','oratkn'=>$data2->permisos[0]->oratkn)));

echo '<br><br>';
	var_dump($dataconvenio);
	echo '<br><br>';
	var_dump($data);
	/*/
	$data1=true;

include_once("../views/ajax/views_admin/usuario.php");
}
//_-------------------------------------------------------------------------------------------
private function loadtemplateEditarUsuario($perm){
	$dataCTrabajo=$this->apiAGK('verCeTrabajo',array('oratkn'=>$perm->permisos[0]->oratkn));
$dataCTrabajo=json_decode($dataCTrabajo);
//echo $dataCTrabajo[0]->status."<br>";
//print_r($dataCTrabajo);

//var_dump($dataCTrabajo[0]->Centros);

	$data1=true;
include_once("../views/ajax/views_admin/usuarioAgregar.php");
}
//_-------------------------------------------------------------------------------------------
//_-------------------------------------------------------------------------------------------
private function loadtemplateUsuarioGestionar($perm){
	$data1=true;
	$usuarioGestionar=$this->apiAGK('usuarioGestionar',array('oratkn'=>$perm->permisos[0]->oratkn));
	$usuarioGestionar=json_decode($usuarioGestionar);
	include_once("../views/ajax/views_admin/usuarioGestionar.php");
}
//_-------------------------------------------------------------------------------------------

//_-------------------------------------------------------------------------------------------
private function loadtemplateUsuarioPerfilCrear($perm){
	$usuarioPerfilGestionar=$this->apiAGK('usuarioPerfilGestionar',array('oratkn'=>$perm->permisos[0]->oratkn));
$usuarioPerfilGestionar=json_decode($usuarioPerfilGestionar);
	$data1=true;
include_once("../views/ajax/views_admin/usuarioPerfilAgregar.php");
}
//_-------------------------------------------------------------------------------------------
//_-------------------------------------------------------------------------------------------
private function loadtemplateUsuarioPerfilGestionar($data2){
	$data1=true;
include_once("../views/ajax/views_admin/usuarioPerfilGestionar.php");
}
//_-------------------------------------------------------------------------------------------
private function loadtemplatemobile($data2){
	$data1=true;
include_once("../views/ajax/views_admin/mobile.php");
}
//_-------------------------------------------------------------------------------------------

//_-------------------------------------------------------------------------------------------
private function loadtemplateMasDetalles($data2){
	$data1=true;
	$odt= (int) trim($this->post["odt"]);

$lote =trim($this->post["lote"]);
$nvruta=trim($this->post["nvruta"]);
$lecturista=trim($this->post["lecturista"]);
    
//var_dump($lote);
include_once("../views/ajax/views_admin/masDetalles.php");
}
//_-------------------------------------------------------------------------------------------
//_-------------------------------------------------------------------------------------------
private function loadenviarAx7($data2){
	$data1=true;
	$odt= (int) trim($this->post["odt"]);
	$permisos= json_decode( Login::init($this->post,"permisos"));
	$data=$this->apiAGK('enviarx7complete',array('oratkn'=>$permisos->permisos[0]->oratkn,"odt"=>$odt));


$da=json_decode($data);
if ($da) {
	echo json_encode(array("status"=>1,"msg"=>"API ok","odt"=>$odt,"response"=>$da));
}else{
	echo json_encode(array("status"=>0,"msg"=>"Error al invocar el servicio","odt"=>$odt,"response"=>$da));
}

//include_once("../views/ajax/views_admin/masDetalles.php");
}
//_-------------------------------------------------------------------------------------------
//_-------------------------------------------------------------------------------------------
private function CambiarLoteFact($data2){
	$data1=true;
	$odt= (int) trim($this->post["odt"]);
	$nuevodata= (int) trim($this->post["nuevodata"]);
	$permisos= json_decode( Login::init($this->post,"permisos"));
	$data=$this->apiAGK('CambiarLoteFact',array('oratkn'=>$permisos->permisos[0]->oratkn,"odt"=>$odt,"nuevodata"=>$nuevodata));


$da=json_decode($data);
if ($da) {
	echo json_encode(array("status"=>1,"msg"=>"API ok","odt"=>$odt,"response"=>$da));
}else{
	echo json_encode(array("status"=>0,"msg"=>"Error al invocar el servicio","odt"=>$odt,"response"=>$da));
}

//include_once("../views/ajax/views_admin/masDetalles.php");
}
//_-------------------------------------------------------------------------------------------




//_-------------------------------------------------------------------------------------------
private function loadtemplateEditarMobile($data2){
	$data1=true;
	$permisos= json_decode( Login::init($this->post,"permisos"));
	$mobileAgregar=$this->apiAGK('showCentroOperac',array('oratkn'=>$permisos->permisos[0]->oratkn));
	$mobileAgregar=json_decode($mobileAgregar);
include_once("../views/ajax/views_admin/mobileAgregar.php");
}
//_-------------------------------------------------------------------------------------------
//_-------------------------------------------------------------------------------------------
private function loadtemplateEditMobileGestion($data2){
	$data1=true;
	$permisos= json_decode( Login::init($this->post,"permisos"));
	$mobileGestionar=$this->apiAGK('mobileGestionar',array('oratkn'=>$permisos->permisos[0]->oratkn));
	$mobileGestionar=json_decode($mobileGestionar);
include_once("../views/ajax/views_admin/mobileGestionar.php");
}
//_-------------------------------------------------------------------------------------------
//_-------------------------------------------------------------------------------------------
private function loadtemplateGestionLote($data2){
	$data1=true;
	$odt= (int) trim($this->post["odt"]);

	$lote =trim($this->post["lote"]);
$nvruta=trim($this->post["nvruta"]);
$lecturista=trim($this->post["lecturista"]);
	$permisos= json_decode( Login::init($this->post,"permisos"));
	$mobileGestionar=$this->apiAGK('showLotemasDetalles',array('oratkn'=>$permisos->permisos[0]->oratkn,"odt"=>$odt));
	$mobileGestionar=json_decode($mobileGestionar);
include_once("../views/ajax/views_admin/masDetallesGestionarLote.php");
}
//_-------------------------------------------------------------------------------------------
//_-------------------------------------------------------------------------------------------
private function loadtemplateRuta($data2){
	$data1=true;
include_once("../views/ajax/views_admin/ruta.php");
}
//_-------------------------------------------------------------------------------------------
//_-------------------------------------------------------------------------------------------
private function loadtemplateAsignarRuta($data2){
	$data1=true;
include_once("../views/ajax/views_admin/rutaAsignar.php");
}
//_-------------------------------------------------------------------------------------------
//_-------------------------------------------------------------------------------------------
private function loadtemplateAsignadaRuta($data2){
	$data1=true;

	include_once("../views/ajax/views_admin/rutaAsignada.php");
}
//_-------------------------------------------------------------------------------------------
//_-------------------------------------------------------------------------------------------
private function loadtemplateRutaLocal($data2){
	$data1=true;
include_once("../views/ajax/views_admin/rutaLocal.php");
}
//_-------------------------------------------------------------------------------------------
//_-------------------------------------------------------------------------------------------
private function loadtemplateRutaLocalGestionar($data2){
	$data1=true;
include_once("../views/ajax/views_admin/rutaLocalGestionar.php");
}
//_-------------------------------------------------------------------------------------------
private function loadtemplateRutaLocalOrdenar($data2){
	$data1=true;
include_once("../views/ajax/views_admin/rutaLocalOrdenar.php");
}
//_-------------------------------------------------------------------------------------------
//_-------------------------------------------------------------------------------------------
private function loadtemplateReporte($data2){
	$data1=true;
include_once("../views/ajax/reporte.php");
}
//_-------------------------------------------------------------------------------------------
//_-------------------------------------------------------------------------------------------
private function loadtemplateReporteMenu1($data2){
	$data1=true;
include_once("../views/ajax/reporteMenu1.php");
}
//_-------------------------------------------------------------------------------------------
//_-------------------------------------------------------------------------------------------
private function loadtemplateCatalogo($data2){
	$data1=true;
include_once("../views/ajax/catalogo.php");
}
//_-------------------------------------------------------------------------------------------
private function loadtemplateCatalogoMenu1($data2){
	$data1=true;
include_once("../views/ajax/catalogoMenu1.php");
}
//_-------------------------------------------------------------------------------------------
//_-------------------------------------------------------------------------------------------
private function loadtemplateAlerta($data2){
	$data1=true;
include_once("../views/ajax/alerta.php");
}
//_-------------------------------------------------------------------------------------------
//_-------------------------------------------------------------------------------------------
private function loadtemplateAlertaMenu1($data2){
	$data1=true;
include_once("../views/ajax/alertaMenu1.php");
}
//_-------------------------------------------------------------------------------------------
//_-------------------------------------------------------------------------------------------

}//end Class ajax



if(
   !empty($_SERVER['HTTP_X_REQUESTED_WITH']) &&
   strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest'
){
   # Ejecuta si la petición es a través de AJAX.

$imprime= new Ajax($_POST);
$imprime->init();

}else{

	if (isset($_GET["folio"]) && $_GET["folio"]!="") {
		$valida=true;
		$data=0;
	}else
	{
		echo "Accion no permitida";
	}

   
  
}


?>
