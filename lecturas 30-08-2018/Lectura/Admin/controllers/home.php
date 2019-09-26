<?php

class Home //extends AnotherClass
{
		function __construct()
	{}
	public function init(){
		session_start();
			$inicio=true;
		$sesion="";
		$nameSesion="datosUsuarioLTC";
		if(isset($_SESSION[$nameSesion])){
			$inicio=false;
			$sesion=$_SESSION[$nameSesion];
		}
		else{
		$_SESSION[$nameSesion]=true;
		$sesion=$_SESSION[$nameSesion];
		}

			
		$details=array("title"=>"Administrador Lectura" , "sesion"=>$sesion,"usuario"=>"Invitado","validainicio"=>$inicio);


$a=$this->apiAGK('status',array("auth"=>"ss"));
if ($a) {
			$Acceso= json_decode($a);
		
				if(isset($Acceso->code)){
echo '<h3> Mensaje de error: '.$Acceso->message.' '.$Acceso->description.'</h3>'; //var_dump($Acceso);
				}
	else{
								 	//if(isset($Acceso[0]->estatusAplicacion)){
						 			if($Acceso[0]->estatusAplicacion==1){
					            $this->viewsLectura($details);
					            	       }
					        else{        	
					            echo "La aplicacion Ha sido desactivada por el administrador del sistema";
					        }
						 	//}
						 	//else{	echo '<h3> mensaje de error: '.$Acceso[0]->msg.'</h3>'; //var_dump($Acceso);
						 	//}
}

      }
      else{
      	echo '<h3>Servicio no disponible, El API no responde</h3>';
            	      }  
        
	}//----------------------------------------------------------------------------------------------------
	private function viewsLectura($details){
			include_once("views/index.php");
	}


	private function apiAGK($action,  $data){
 $get='urlget=';
 //$get.='lct/1.0/lct/';
 $get.='lct/1.0/status/';
 		$build=array();
 switch ($action) {
 	/*case 'login':
 	//$get.='lgn/1.0/lgn/';
 	$build = array('action' => $action,'login' => $data['mail'],'pass'=>$data['pass']  );
 		break;
 		case 'lct':
 		//$get.='cns/1.0/encuestas/';
 	$build = array('action' => $action,'auth'=>$data['auth']);
 		break;*/
 		case 'status':
 		//$get.='cns/1.0/encuestas/';
 	$build = array('action' => $action,'auth'=>$data['auth']);
 		break;
 	
 	default:
 		# code...
 		break;
 }

//$urlLogin='https://www.aguakan.com/git/api/apiweb.php?'.$get;//x7rptyax01.aguakan
$urlLogin='https://www.aguakan.com/git/api/webt.php?'.$get;//pbayax01.aguakan


//echo $urlLogin;
$curl = curl_init($urlLogin);			 
			curl_setopt($curl, CURLOPT_CONNECTTIMEOUT,5);
			curl_setopt($curl, CURLOPT_POST,true);  
			curl_setopt($curl, CURLOPT_POSTFIELDS, $build); 
			curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
			$response = curl_exec ($curl);  
			curl_close($curl);	
			return $response;   
}

}
?>