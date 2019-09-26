CREATE OR REPLACE PACKAGE API_PQLCT_1_0 AS 
gobj json;
 function INVOCA(pjsontxt VARCHAR2) return clob;
END API_PQLCT_1_0;
/


CREATE OR REPLACE PACKAGE BODY     API_PQLCT_1_0 AS
/*  __________________________________________________________________________________________________  */

	FUNCTION VJSON (pjsontxt in varchar2) RETURN boolean IS
		scanner_exception exception; 
		pragma exception_init(scanner_exception, -20100);
		parser_exception exception;
		pragma exception_init(parser_exception, -20101);
		jext_exception exception;
		pragma exception_init(jext_exception, -20110);
	BEGIN
		gobj:=json(pjsontxt);
		return true;
	EXCEPTION
		when scanner_exception or parser_exception or jext_exception then return false;
	END;
/*  __________________________________________________________________________________________________  */

	PROCEDURE DATAVARAPI (pvar in  LGN_VARIABLE.IDVARIABLE%TYPE,
					      pval out APP.LGN_VARIABLE.VALOR%TYPE,
						  pdes out APP.LGN_VARIABLE.DESCRIPCION%TYPE) IS
	BEGIN
		select trim(valor),trim(descripcion) into pval,pdes from APP.LGN_VARIABLE where IDVARIABLE=pvar;
	EXCEPTION
		when NO_DATA_FOUND then 
			pval:=null;	pdes:=null;
		when OTHERS then
			pval:=null;	pdes:=null;
	END;
/*  __________________________________________________________________________________________________  */

	FUNCTION JMSGERR (pcgo in varchar2) RETURN varchar2 IS
		vmsg APP.LCT_VARIABLES.VALOR%TYPE;
		vdes APP.LCT_VARIABLES.DESCRIPCION%TYPE;
	BEGIN
		gobj:=json();
    gobj.put('status',0);
		gobj.put('code',pcgo);
		datavarapi(pcgo,vmsg,vdes);
		gobj.put('msg',nvl(vmsg,'null'));
		gobj.put('description',nvl(vdes,'null'));		
		RETURN '['||gobj.to_char()||']';
	END;
/*  __________________________________________________________________________________________________  */
--funciones de configuracion para el json
/*  __________________________________________________________________________________________________  */

	FUNCTION ValidaToken(token in varchar2)  RETURN boolean is
            --desdifrar VARCHAR2(4000);
            fecha varchar2(40);
            jsontoken json;
            BEGIN
            jsontoken:=json(token);
           
            --desdifrar:=UTILERIA_CIFRAR.DESCIFRAR(token);
          --if not vjson(desdifrar) then return false; end if;
        
		fecha:=json_ext.get_string(jsontoken,'timeNow');
     if fecha is null then return false; else
     
    if fecha=to_char(SYSDATE) then 
     return true;
     else return false; end if; 
     end if;
      --RETURN true;
    EXCEPTION
		when OTHERS then
			return false;    
	END;
/*  __________________________________________________________________________________________________  */

/*  __________________________________________________________________________________________________  */

	FUNCTION login (pobj json) RETURN clob IS
	    aplic    APP.LGN_VARIABLE.VALOR%TYPE;
     metodoJson     VARCHAR2(50);
     action VARCHAR2(100);
     loginjs VARCHAR2(200);
      codeEMIE VARCHAR2(200);
     serviciojs VARCHAR2(200);
     passjs VARCHAR2(100);
     idusuario number(10);
     --datosJSON json;
       datostoken VARCHAR2(4000);
        datosusuario json;
        datoinfo VARCHAR2(100);
	
	BEGIN
   --datosJSON :=pobj;
		metodoJson:=json_ext.get_string(pobj,'action');
    loginjs:=json_ext.get_string(pobj,'login');--se tiene que enviar por post
    passjs:=json_ext.get_string(pobj,'pass');--se tiene que enviar por post
    serviciojs:=json_ext.get_string(pobj,'servicio');--se tiene que enviar por post
     datostoken:=json_ext.get_string(pobj,'oratkn');--se tiene que enviar por post
      datoinfo:=json_ext.get_string(pobj,'info');--se tiene que enviar por post
       datosusuario:=json_ext.get_json(pobj,'datos');--se tiene que enviar por post
 idusuario:=TO_NUMBER(json_ext.get_string(pobj,'idusuario'));--se tiene que enviar por post
 
  codeEMIE:=json_ext.get_string(pobj,'code');--se tiene que enviar por post
 
    	gobj:=json();
     action:=metodoJson;
      --gobj.put('action',action);
     case		-----------------------------------------------------------------------------	
		/*	when action='verstatus'	then--muestra el status de la aplicacion
       SELECT VALOR into aplic from APP.LGN_VARIABLE  WHERE IDVARIABLE='status';
       --gobj.put('estatsssusAplicacion1','ss');
	  gobj.put('estatusAplicacion',aplic);
    return gobj.to_char(); 
  */
   -------------------------------------------------------------------------------------  
         when action='login2prueba'	then--muestra concentrado de respuesta segun su encuesta      	
          if loginjs is null then return jmsgerr('LGN0003'); end if;
          --if serviciojs is null then return jmsgerr('LGN0003'); end if;
           if passjs is null then return jmsgerr('LGN0003');
            else 
         return jmsgerr('LGN0003');
        end if;
         -------------------------------------------------------------------------------------  
        -------------------------------------------------------------------------------------  
         when action='login'	then--muestra concentrado de respuesta segun su encuesta      	
          if loginjs is null then return jmsgerr('LGN0003'); end if;
          --if serviciojs is null then return jmsgerr('LGN0003'); end if;
           if passjs is null then return jmsgerr('LGN0003');
            else 
         return jmsgerr('LGN0003');
        end if;
         -------------------------------------------------------------------------------------  
         when action='accesox7'	then     	
        --  if loginjs is null then return jmsgerr('LGN0003'); end if;
          --if serviciojs is null then return jmsgerr('LGN0003'); end if;
        --   if passjs is null then return jmsgerr('LGN0003');
         --   else  
        -- return buscar_usuario(loginjs,passjs);
       -- end if;
        
       gobj.put('LGN','conexion a x7');
    gobj.put('msg','accion no encontrada');
    gobj.put('status',1);
     gobj.put('action',action);
     return '['||gobj.to_char()||']';
     --------------------------------------------------------------------------------------------
    when action='verstatus'	then--muestra el status de la aplicacion
       SELECT VALOR into aplic from APP.LGN_VARIABLE  WHERE IDVARIABLE='status';
       --gobj.put('estatsssusAplicacion1','ss');
	  gobj.put('estatusAplicacion',aplic);
    return '['||gobj.to_char()||']';
    	-------------------------------------------------------------------------------------

      
      -------------------------------------------------------------------------------------
     
    else--valor default
     gobj.put('LGN','default');
    gobj.put('msg','accion no encontrada');
    gobj.put('status',0);
     return '['||gobj.to_char()||']';
		end case;
     	
		
	EXCEPTION
		when NO_DATA_FOUND then
    return jmsgerr('LGN0001');
      -- return 'algun mensaje de error';
		when OTHERS then
			--return jmsgerr('AP1002');
     gobj:=json();
        	gobj.put('msg','Por favor reporte este error al adminitrador de la aplicacion');
			gobj.put('error',SQLERRM);
    gobj.put('status',0);
      return '['||gobj.to_char()||']'; 
	END;  
  /*  __________________________________________________________________________________________________  */

	FUNCTION status RETURN boolean IS
		      aplic    LCT_VARIABLES.VALOR%TYPE;
	BEGIN
	    SELECT to_number(VALOR) into aplic from APP.LCT_VARIABLES  WHERE IDTVAR='APPLCT';
      if aplic=1 then return true ;
      else return false;  
      end if;
       EXCEPTION
		when OTHERS then
			return false;   
	END;
/*  __________________________________________________________________________________________________  */
/*  __________________________________________________________________________________________________  */

	FUNCTION statusaplicacion  RETURN varchar2 IS
          st int(1):=0;
		      	BEGIN
            if status()=true then st:= 1 ;  end if;
		gobj:=json();
   
      gobj.put('status',1);
	  gobj.put('estatusAplicacion',st);
    return '['||gobj.to_char()||']';
    EXCEPTION
		when OTHERS then
			--return jmsgerr('wCVN0003');
      	gobj:=json();
		gobj.put('msg','ocurrio un error en la accion');
    gobj.put('error',SQLERRM);
    gobj.put('status',0);
        return '['||gobj.to_char()||']';
	END;
/*  __________________________________________________________________________________________________  */
/*  __________________________________________________________________________________________________  */

	FUNCTION showCtrabajoAndPerfil  RETURN clob IS
    valdata json;
    	BEGIN
      
         valdata:=json(); 
    DECLARE
     
         CURSOR C_CENTROOPERACIONAL is
    SELECT IDTCNTOPR,LIB FROM  X7.cntopr WHERE IDTCNTOPR!='Z' ORDER BY IDTCNTOPR;
		      	BEGIN
       gobj:=json();
          FOR ind IN C_CENTROOPERACIONAL LOOP
         --CentroOperacional.put('IDLABEL',ind.IDLABEL);
         gobj.put(to_char(ind.IDTCNTOPR),ind.LIB);
          END LOOP;
    valdata.put('Centros',gobj);
   END;
   
     DECLARE
         CURSOR C_PERFIL is
    SELECT IDPERFIL,P_NAME FROM  LCT_PERFIL WHERE STATUS=1 ORDER BY IDPERFIL;
		      	BEGIN
         gobj:=json();
          FOR ind IN C_PERFIL LOOP
         --CentroOperacional.put('IDLABEL',ind.IDLABEL);
         gobj.put(to_char(ind.IDPERFIL),ind.P_NAME);
   END LOOP;
   valdata.put('Perfil',gobj);
   END;
   
   valdata.put('status',1);
     
    return '['||valdata.to_char()||']';
    EXCEPTION
		when OTHERS then
			--return jmsgerr('wCVN0003');
      	gobj:=json();
		gobj.put('msg','ocurrio un error en la accion');
    gobj.put('error',SQLERRM);
    gobj.put('status',0);
        return '['||gobj.to_char()||']';
	END;
/*  __________________________________________________________________________________________________  */
/*  __________________________________________________________________________________________________  */
 
	FUNCTION showRutaLecturistaLotes(fecha in varchar2, token in varchar2)  RETURN clob IS
    valdata json;
    paso json;
    cadena clob;
    cont number:=0;
     lista json;
      descifrar VARCHAR2(4000);
      jsondescifrar json;
           servicios json;
            servi_LCT json;
          agente_IDTAGT VARCHAR2(20);
            Vcnopr VARCHAR2(10);
             Vcancunplaya VARCHAR2(20);
              
         -- iduser number(10);
         useradmin number(10);
    	BEGIN
        
           descifrar:=UTILERIA_CIFRAR.DESCIFRAR(token);
      jsondescifrar:= json(descifrar);
      agente_IDTAGT:=json_ext.get_string(jsondescifrar,'IDTAGT');
      --iduser :=json_ext.get_number(jsondescifrar,'iduser');
       servicios  :=json_ext.get_json(jsondescifrar,'servicios'); 
       servi_LCT  :=json_ext.get_json(servicios,'lct');
       useradmin  :=json_ext.get_number(servi_LCT,'admin');  
     -- if ValidaToken(descifrar) and useradmin=1 then 
   --SELECT IDTVAR into Vcnopr FROM app.LCT_VARIABLES where TPOVAR ='CENOPR' and valor is not null AND VALOR LIKE '%'||agente_IDTAGT||'%';
        /* if Vcnopr ='CAN' then
         Vcancunplaya :='GECO-INGR-LECT-CCAN';
         else if Vcnopr='PDC' then
         Vcancunplaya :='GECO-INGR-LECT-SOLD';
         end if;
            end if;
            
            */
        
        valdata:=json();
    DECLARE
         CURSOR C_USER is
  /* 
    SELECT A.IDTAGT Agente, INITCAP(A.PRN ||' '|| A.NOM) Nombre, A.NOMCNX "Conexion", A.DATENT "Fecha Alta",A.DATSRT "Fecha Baja", A.IDTSTR "Estructura"
FROM AGT A INNER JOIN PRF B 
ON A.IDTPRF = B.IDTPRF INNER JOIN FCT C ON A.IDTFCT = C.IDTFCT
AND A.IDTSTR IN (Vcancunplaya,'GPMO-LECT') 
and A.DATSRT is null
ORDER BY 4 ASC;
*/
   select * from APP.lct_user 
   where estatus =1 and
   IDTCNTOPR in (SELECT IDTVAR   FROM app.LCT_VARIABLES where TPOVAR ='CENOPR' and valor is not null AND VALOR LIKE '%'||agente_IDTAGT||'%') ;
   
		      	BEGIN
              paso:=json();
       gobj:=json();
          FOR ind IN C_USER LOOP
         gobj.put('copr',ind.IDTCNTOPR);
         gobj.put('Clave',ind.clave);
          gobj.put('Nombre',ind.nombre||' '||ind.apaterno ||' '||ind.amaterno);
          -- gobj.put('Apaterno',ind.APATERNO);
            -- gobj.put('Amaterno',ind.AMATERNO);
              paso.put(to_char(ind.clave),gobj);
          END LOOP;
    valdata.put('Lecturista',paso);
   END;
   -----------------------------------------------------------------------------------------
     DECLARE
         CURSOR C_LECTURA is
/*
SELECT LCT_LECTURAS.IDTTRNTYP as ruta,COUNT(*) AS TOTAL, LCT_LECTURAS.IDTLOTFAC as lote,LCT_ASIGRUTAS.IDTTRNTYP AS EXISTERUTA 
FROM LCT_LECTURAS 
LEFT OUTER JOIN LCT_ASIGRUTAS ON LCT_LECTURAS.IDTTRNTYP=LCT_ASIGRUTAS.IDTTRNTYP
AND LCT_ASIGRUTAS.FCHASG=TO_DATE(fecha,'DD/MM/YYYY')
WHERE trunc(LCT_LECTURAS.FCHCRE)=TO_DATE(fecha,'DD/MM/YYYY') 
--AND trunc(LCT_ASIGRUTAS.FCHASG)=TO_DATE('19/05/2017','DD/MM/YYYY')
AND EDOATL='NVO'
GROUP BY LCT_LECTURAS.IDTTRNTYP, LCT_LECTURAS.IDTLOTFAC,LCT_ASIGRUTAS.IDTTRNTYP 
ORDER BY LCT_LECTURAS.IDTTRNTYP ASC;
*/
/*
SELECT LCT_LECTURAS.IDTLEC as ruta,COUNT(*) AS TOTAL, LCT_LECTURAS.idtodt as lote,LCT_ASIGRUTAS.IDTTRNTYP AS EXISTERUTA 
FROM LCT_LECTURAS 
LEFT OUTER JOIN LCT_ASIGRUTAS ON LCT_LECTURAS.IDTLEC=LCT_ASIGRUTAS.IDTTRNTYP
AND LCT_ASIGRUTAS.FCHASG=TO_DATE(fecha,'DD/MM/YYYY')
WHERE trunc(LCT_LECTURAS.FCHCRE)=TO_DATE(fecha,'DD/MM/YYYY') 
--AND trunc(LCT_ASIGRUTAS.FCHASG)=TO_DATE('19/05/2017','DD/MM/YYYY')
AND EDOATL='NVO'
GROUP BY LCT_LECTURAS.IDTLEC, LCT_LECTURAS.idtodt,LCT_ASIGRUTAS.IDTTRNTYP 
ORDER BY LCT_LECTURAS.IDTLEC ASC;*/
--SELECT  IDTLEC ruta,COUNT(*) AS TOTAL,idtodt lote  FROM  LCT_LECTURAS  GROUP BY  IDTLEC,idtodt;
SELECT IDTLOTFAC lote,IDTTRNTYP ruta,NBRCPR TOTAL,idtcntopr, DECODE(idtcntopr,'1','CAN','PDC') CNTOPR FROM lct_lotes where EDOLTE='NVO' 
AND trunc(FCHCRE)=TO_DATE(fecha,'DD/MM/YYYY') 
AND DECODE(idtcntopr,'1','CAN','PDC')IN (SELECT IDTVAR   FROM app.LCT_VARIABLES where TPOVAR ='CENOPR' and valor is not null AND VALOR LIKE '%'||agente_IDTAGT||'%')
GROUP BY  IDTLOTFAC,IDTTRNTYP,NBRCPR,idtcntopr order by IDTTRNTYP asc;

--vIDTVAR varchar2(10):='';
		      	BEGIN
              paso:=json();
         gobj:=json();
         
        -- SELECT IDTVAR into vIDTVAR  FROM app.LCT_VARIABLES where TPOVAR ='CENOPR' and valor is not null AND VALOR LIKE '%'||agente_IDTAGT||'%';
          FOR ind IN C_LECTURA LOOP
         --CentroOperacional.put('IDLABEL',ind.IDLABEL);
         --IF ind.EXISTERUTA IS NULL THEN
         
       
            gobj.put('Ruta',ind.ruta);
             gobj.put('idtcntopr',ind.idtcntopr);
               gobj.put('TotalMedidor',ind.TOTAL);
         gobj.put('Lote',ind.lote);
           paso.put(to_char(ind.lote||ind.ruta),gobj);
     
          
   END LOOP;
   valdata.put('Ruta',paso);
   END;
   
   ---------------------------------------------------------------------------------------------
    DECLARE
         CURSOR C_LECTURA is
   -- SELECT IDTTRNTYP,COUNT(*) AS TOTAL FROM LCT_LECTURAS 
--WHERE trunc(FCHCRE)=TO_DATE(fecha,'DD/MM/YYYY')
--AND EDOATL='NVO' GROUP BY IDTTRNTYP ORDER BY IDTTRNTYP ASC;
/* SELECT IDTTRNTYP as ruta, IDTLOTFAC as lote,FCHASG as asignacion FROM LCT_ASIGRUTAS
WHERE trunc(FCHASG)=TO_DATE(fecha,'DD/MM/YYYY')
ORDER BY IDTTRNTYP ASC;

*/
  SELECT LOC.IDTRTL,LOC.NOMBRERL,LOC.EDO,
    (SELECT  COUNT(*) TOTAL FROM LCT_DETRTL WHERE LCT_DETRTL.IDTRTL=LOC.IDTRTL) TOTAL
    FROM LCT_RTALOCAL LOC where CNTOPR in (SELECT IDTVAR  FROM app.LCT_VARIABLES where TPOVAR ='CENOPR' and valor is not null AND VALOR LIKE '%'||agente_IDTAGT||'%')
    ORDER BY LOC.IDTRTL DESC;
 
		      	BEGIN
              paso:=json();
         gobj:=json();
          FOR ind IN C_LECTURA LOOP
         --CentroOperacional.put('IDLABEL',ind.IDLABEL);
            gobj.put('Ruta',ind.IDTRTL);
             DECLARE
             VNOMBRERL VARCHAR2(300);
            BEGIN
            SELECT NOMBRERL INTO VNOMBRERL FROM APP.LCT_RTALOCAL WHERE IDTRTL=ind.IDTRTL;
             gobj.put('Rutanombre',VNOMBRERL);
            END;
            -- paso.put(TotMedidor,ind.TOTAL);
             -- gobj.put('Asignacion',TO_CHAR(ind.asignacion,'dd/mm/yyyy'));
         gobj.put('TotMedidor',ind.TOTAL);
       -- gobj.put('Lote',ind.IDTRTL);
          paso.put(to_char(ind.IDTRTL),gobj);
   END LOOP;
   valdata.put('RutaLocal',paso);
   END;
    
   ---------------------------------------------------------------------
   valdata.put('fecha',fecha);
   valdata.put('status',1);
     valdata.put('msg','ok');
     
     
       cadena := empty_clob();
  dbms_lob.createtemporary(cadena, true);
  valdata.to_clob(cadena, true);
     
    return '['||cadena||']';
   -- return '['||valdata.to_char()||']';
    
    
    EXCEPTION
		when OTHERS then
			--return jmsgerr('wCVN0003');
      	gobj:=json();
		gobj.put('msg','ocurrio un error en la accion');
    gobj.put('error',SQLERRM);
    gobj.put('lineaError',' lineaError -> '||DBMS_UTILITY.Format_Error_BackTrace);
    gobj.put('status',0);
        return '['||gobj.to_char()||']';
	END;
  
/*  __________________________________________________________________________________________________  */
/*  __________________________________________________________________________________________________  */

	FUNCTION showRutalocalContrato(Cadenacontrato in varchar2, token in varchar2)  RETURN clob IS
    valdata json;
      Cadenacontrato2  varchar2(4000);
    paso json;
    cont number(10):=0;
    	 descifrar VARCHAR2(4000);
      jsondescifrar json;
           servicios json;
            servi_LCT json;
          agente_IDTAGT VARCHAR2(20);
            Vcnopr VARCHAR2(10);
             Vcancunplaya VARCHAR2(20);
              
         -- iduser number(10);
         useradmin number(10);
    	BEGIN
        
           descifrar:=UTILERIA_CIFRAR.DESCIFRAR(token);
      jsondescifrar:= json(descifrar);
      agente_IDTAGT:=json_ext.get_string(jsondescifrar,'IDTAGT');
      --iduser :=json_ext.get_number(jsondescifrar,'iduser');
       servicios  :=json_ext.get_json(jsondescifrar,'servicios'); 
       servi_LCT  :=json_ext.get_json(servicios,'lct');
       useradmin  :=json_ext.get_number(servi_LCT,'admin');  
       
       
        valdata:=json();
   --  vcontratos :=json_list (Cadenacontrato);
  Cadenacontrato2:= REPLACE(Cadenacontrato,'[');  
  Cadenacontrato2:= REPLACE(Cadenacontrato2,']');
     DECLARE
         CURSOR C_LECTURA is
    SELECT  
    CLT.IDTCLT CLIENTE,
    CTR.IDTCTR CONTRATO,
     DECODE(CTR.IDTCNTOPR,'1','CAN','PDC') CNTOPR,
    NVL (REPLACE (REPLACE (CLT.ADRLBR, CHR (13) || CHR (10), ''),CHR (9),''),'') DIRECCION,
     CPR.IDTCPR IDMEDIDOR,
    CPR.NUMCPR MEDIDOR,
    CPRPNTCPG.DATDPS FECHARETIRO,
    CPRPNTCPG.DATPOS FECHAINSTALACION,
    USGCPR.LIB USOMEDIDOR
    FROM  x7.clt, x7.ctr, x7.cprpntcpg, x7.cpr, x7.usgcpr
    WHERE 
    CLT.IDTCLT = CTR.IDTCLTDST  AND
    CTR.IDTPNTCPG = CPRPNTCPG.IDTPNTCPG AND
    CTR.IDTPNTLVR = CPRPNTCPG.IDTPNTLVR AND
    CPR.IDTCPR = CPRPNTCPG.IDTCPR AND
    CPRPNTCPG.IDTUSGCPR = USGCPR.IDTUSGCPR AND
    CPRPNTCPG.DATDPS IS NULL AND
    CTR.DATRSL IS NULL 
     AND DECODE(CTR.IDTCNTOPR,'1','CAN','PDC')IN (SELECT IDTVAR   FROM app.LCT_VARIABLES where TPOVAR ='CENOPR' and valor is not null AND VALOR LIKE '%'||agente_IDTAGT||'%')
    /* AND (
   -- CTR.IDTCTR= '13401' --Este es el parametron del numero de contrato
     OR CTR.IDTCTR= '1072'
      OR CTR.IDTCTR= '1072'
     ) --Este es el parametron del numero de contrato
     */
   -- and CTR.IDTCTR in ('13401','1072')
     and CTR.IDTCTR in (SELECT REGEXP_SUBSTR (Cadenacontrato2,
                                         '[^,]+',
                                         1,
                                         LEVEL)
                             TXT
                     FROM DUAL
               CONNECT BY REGEXP_SUBSTR (Cadenacontrato2,
                                         '[^,]+',
                                         1,
                                         LEVEL)
                             IS NOT NULL)
    
    order by CPRPNTCPG.DATPOS;

		      	BEGIN
              paso:=json();
         gobj:=json();
          FOR ind IN C_LECTURA LOOP
          cont:=cont+1;
         --CentroOperacional.put('IDLABEL',ind.IDLABEL);
                  gobj.put('Medidor',ind.MEDIDOR);
         gobj.put('Direccion',ind.DIRECCION);
         gobj.put('contrato',ind.CONTRATO);
         gobj.put('Idmedidor',ind.IDMEDIDOR);
           paso.put(cont,gobj);
          
           
   END LOOP;
   valdata.put('Medidor',paso);
   valdata.put('cadenacontrato',Cadenacontrato);
  -- valdata.put('vcontratos',vcontratos);
   END;
   ---------------------------------------------------------------------------------------------
  
   ---------------------------------------------------------------------
   
   valdata.put('status',1);
     valdata.put('msg','ok');
    return '['||valdata.to_char()||']';
    EXCEPTION
		when OTHERS then
			--return jmsgerr('wCVN0003');
      	gobj:=json();
		gobj.put('msg','ocurrio un error en la accion');
    gobj.put('error',SQLERRM);
    gobj.put('lineaError',' lineaError -> '||DBMS_UTILITY.Format_Error_BackTrace);
    gobj.put('status',0);
        return '['||gobj.to_char()||']';
	END;
/*  __________________________________________________________________________________________________  */
/*  __________________________________________________________________________________________________  */

	FUNCTION showRutaAsginado(fecha in varchar2, token in varchar2)  RETURN clob IS
    valdata json;
    paso json;
      paso2 json;
     lecturista json;
     contar number(20):=0;
      descifrar VARCHAR2(4000);
          jsondescifrar json;
           servicios json;
            servi_LCT json;
              --lecturista json;
             -- lecturista json_list;
          agente_IDTAGT VARCHAR2(20);
         -- iduser number(10);
          --keyvalue number(38);
         --  namekeyvalue  VARCHAR2(200);
         useradmin number(10);
          IDRUTA number(10):=0;
           IDUSER1 number(10):=0;
            vcentroop varchar(10);
    	BEGIN
        valdata:=json();
        descifrar:=UTILERIA_CIFRAR.DESCIFRAR(token);
      jsondescifrar:= json(descifrar);
      agente_IDTAGT:=json_ext.get_string(jsondescifrar,'IDTAGT');
      --iduser :=json_ext.get_number(jsondescifrar,'iduser');
       servicios  :=json_ext.get_json(jsondescifrar,'servicios'); 
       servi_LCT  :=json_ext.get_json(servicios,'lct');
       useradmin  :=json_ext.get_number(servi_LCT,'admin');  
       
        --namekeyvalue:=json_ext.get_string(servi_LCT,'key');--ID Centro operaciona x7
        --keyvalue  :=json_ext.get_number(servi_LCT,'key_value');  
         --centroOperacion  :=TO_CHAR(json_ext.get_number(servi_LCT,'key_value'));  
    /* DECLARE
         CURSOR C_USER is
    SELECT CLAVE,NOMBRE, APATERNO,AMATERNO FROM LCT_USER WHERE ESTATUS=1 ORDER BY ID_USER ASC;
		      	BEGIN
              paso:=json();
       gobj:=json();
          FOR ind IN C_USER LOOP
         --CentroOperacional.put('IDLABEL',ind.IDLABEL);
         gobj.put('Clave',ind.CLAVE);
          gobj.put('Nombre',ind.NOMBRE);
           gobj.put('Apaterno',ind.APATERNO);
             gobj.put('Amaterno',ind.AMATERNO);
              paso.put(to_char(ind.CLAVE),gobj);
          END LOOP;
    valdata.put('Lecturista',paso);
   END;*/
   
     DECLARE
         CURSOR C_LECTURA is
   -- SELECT IDTTRNTYP,COUNT(*) AS TOTAL FROM LCT_LECTURAS 
--WHERE trunc(FCHCRE)=TO_DATE(fecha,'DD/MM/YYYY')
--AND EDOATL='NVO' GROUP BY IDTTRNTYP ORDER BY IDTTRNTYP ASC;
/*SELECT IDTODT AS ID_ASIG, IDTTRNTYP as ruta, IDTLOTFAC as lote,FCHASG as asignacion, edoasr as estatus FROM LCT_ASIGRUTAS
WHERE trunc(FCHASG)=TO_DATE(fecha,'DD/MM/YYYY')
ORDER BY IDTODT DESC;*/

SELECT IDTODT AS ID_ASIG,FCHATH as asignacion ,
 IDTTRNTYP as ruta, IDTLOTFAC as lote,idtusrlct LECTU,EDOODT estatus
FROM LCT_ORDENES WHERE   trunc(FCHATH)=TO_DATE(fecha,'DD/MM/YYYY') 
and IDTCNTOPR in ( SELECT IDTVAR FROM APP.LCT_VARIABLES  where TPOVAR ='CENOPR' and valor is not null AND VALOR LIKE '%'||agente_IDTAGT||'%')
order by ID_ASIG desc; --AND EDOODT IS NULL;
		      	BEGIN
             
               paso2:=json();
        
          FOR ind IN C_LECTURA LOOP
           paso:=json();
          contar:=contar+1;
           gobj:=json();
         
         --CentroOperacional.put('IDLABEL',ind.IDLABEL);
           gobj.put('ID_ASIG',ind.ID_ASIG);
            gobj.put('Ruta',ind.ruta);
            -- gobj.put('nameRutalocal',ind.LABEL);
            if ind.lote is null then
            declare
            vNOMBRERL varchar2(300);
            begin
            select NOMBRERL into vNOMBRERL from app.lct_rtalocal where IDTRTL=ind.ruta;
               gobj.put('nameRutalocal',vNOMBRERL);
            end;
            end if;
            
            
              gobj.put('Asignacion',TO_CHAR(ind.asignacion,'dd/mm/yyyy'));
             gobj.put('estatus',ind.estatus);
             gobj.put('Lote',ind.lote);
             
             
                    DECLARE
                    CURSOR C_LECTURISTA IS
                          /*SELECT LCT_USER.CLAVE AS LECT, LCT_USER.NOMBRE,LCT_USER.APATERNO  FROM LCT_RUTA_TO_USER,LCT_USER 
                          WHERE LCT_RUTA_TO_USER.IDASIGRUTA=
                          (SELECT IDTODT  FROM LCT_ASIGRUTAS WHERE LCT_ASIGRUTAS.IDTODT=ind.ID_ASIG) 
                          AND LCT_RUTA_TO_USER.ESTATUS=1 AND LCT_RUTA_TO_USER.IDUSER=LCT_USER.ID_USER ;
                         */ 
                           SELECT LCT_USER.CLAVE AS LECT, LCT_USER.NOMBRE,LCT_USER.APATERNO  FROM  LCT_USER 
                          WHERE ID_USER=ind.LECTU;
                    BEGIN
                      lecturista:=json();
                      FOR tt IN C_LECTURISTA LOOP
                      lecturista.put(to_char(tt.LECT),tt.NOMBRE||' '||tt.APATERNO);
                                  END LOOP;
                        gobj.put('lecturista',lecturista); 
                    END; 
                    
                    -----------------
                    
                    DECLARE
                    CURSOR C_LECTURISTA IS
                          /*SELECT LCT_USER.CLAVE AS LECT, LCT_USER.NOMBRE,LCT_USER.APATERNO  FROM LCT_RUTA_TO_USER,LCT_USER 
                          WHERE LCT_RUTA_TO_USER.IDASIGRUTA=
                          (SELECT IDTODT  FROM LCT_ASIGRUTAS WHERE LCT_ASIGRUTAS.IDTODT=ind.ID_ASIG) 
                          AND LCT_RUTA_TO_USER.ESTATUS=1 AND LCT_RUTA_TO_USER.IDUSER=LCT_USER.ID_USER ;
                         */ 
                         /*
                           SELECT LCT_USER.CLAVE AS LECT, LCT_USER.NOMBRE,LCT_USER.APATERNO  FROM  LCT_USER 
                          WHERE ID_USER=ind.LECTU;*/
                          
                          SELECT LCT_USER.CLAVE AS LECT, LCT_USER.NOMBRE,LCT_USER.APATERNO  FROM LCT_RUTA_TO_USER,LCT_USER 
                          WHERE LCT_RUTA_TO_USER.IDTODT =ind.ID_ASIG 
                          AND LCT_RUTA_TO_USER.ESTATUS=1 AND LCT_RUTA_TO_USER.IDUSER=LCT_USER.ID_USER ;
                          
                    BEGIN
                      lecturista:=json();
                      FOR tt IN C_LECTURISTA LOOP
                      lecturista.put(to_char(tt.LECT),tt.NOMBRE||' '||tt.APATERNO);
                                  END LOOP;
                        gobj.put('lecturistaAyuda',lecturista);
                    END;       
                    
                    
           paso.put(to_char(ind.ruta),gobj);
             
          
            paso2.put(contar,paso);
           
           
           
   END LOOP;
   valdata.put('Ruta',paso2);
   END;
   
   valdata.put('status',1);
     valdata.put('msg','ok');
    return '['||valdata.to_char()||']';
    EXCEPTION
		when OTHERS then
			--return jmsgerr('wCVN0003');
      	gobj:=json();
		gobj.put('msg','ocurrio un error en la accion');
    gobj.put('error',SQLERRM);
    gobj.put('lineaError',' lineaError -> '||DBMS_UTILITY.Format_Error_BackTrace);
    gobj.put('status',0);
        return '['||gobj.to_char()||']';
	END;
/*  __________________________________________________________________________________________________  */
/*  __________________________________________________________________________________________________  */

	FUNCTION showLote (token in varchar2)  RETURN clob IS
  valdata json;
  cadena clob;
    paso json;
     paso2 json;
     cont number(20):=0;
     lecturista json;
     ayudalecturista json;
     
      descifrar VARCHAR2(4000);
          jsondescifrar json;
           servicios json;
            servi_LCT json;
              --lecturista json;
             -- lecturista json_list;
          agente_IDTAGT VARCHAR2(20);
         -- iduser number(10);
          --keyvalue number(38);
         --  namekeyvalue  VARCHAR2(200);
         useradmin number(10);
    	BEGIN
        valdata:=json();
          descifrar:=UTILERIA_CIFRAR.DESCIFRAR(token);
      jsondescifrar:= json(descifrar);
      agente_IDTAGT:=json_ext.get_string(jsondescifrar,'IDTAGT');
      --iduser :=json_ext.get_number(jsondescifrar,'iduser');
       servicios  :=json_ext.get_json(jsondescifrar,'servicios'); 
       servi_LCT  :=json_ext.get_json(servicios,'lct');
       useradmin  :=json_ext.get_number(servi_LCT,'admin'); 
        
        
    DECLARE
         CURSOR C_LECTURA is

--SELECT IDTODT AS ID_ASIG, IDTTRNTYP as ruta, IDTLOTFAC as lote,FCHASG as asignacion, edoasr as estatus FROM LCT_ASIGRUTAS
--WHERE EDOASR='1'--trunc(FCHASG)=TO_DATE('19/05/2017','DD/MM/YYYY')
--ORDER BY IDTODT DESC;
--SELECT idtusrlct IDUSER, IDTODT ID_ASIG,  IDTTRNTYP  ruta,IDTLOTFAC  lote, FCHATH  asignacion, EDOODT estatus FROM LCT_ORDENES ORDER BY IDTODT DESC;
		
 SELECT ord.idtusrlct IDUSER, ord.IDTODT ID_ASIG,  ord.IDTTRNTYP  ruta,
ord.IDTLOTFAC  lote, ord.FCHATH  asignacion, ord.EDOODT estatus,
luser.CLAVE   LECT,luser. NOMBRE, luser.APATERNO, lot.NBRCPR totalmedidor,ord.IDTCNTOPR,
(SELECT    count(* )  FROM lct_lecturas where idtodt=ord.IDTODT and edoatl='CAP') totalcap,
(SELECT    count(* )  FROM lct_lecturas where idtodt=ord.IDTODT and edoatl='NVO') totallectura,
ord.FCHCRE,
ord.FCHUAC
FROM LCT_ORDENES ord,LCT_USER luser, LCT_LOTES lot where ord.idtusrlct =luser.ID_USER (+) and luser.ESTATUS(+)=1
and ord.IDTTRNTYP =lot.IDTTRNTYP(+) and  ord.IDTLOTFAC =lot.IDTLOTFAC(+)
and ord.IDTCNTOPR in ( SELECT IDTVAR FROM APP.LCT_VARIABLES  where TPOVAR ='CENOPR' and valor is not null AND VALOR LIKE '%'||agente_IDTAGT||'%')
and ord.EDOODT is not null
ORDER BY ord.IDTODT DESC;

          	BEGIN
              paso:=json();
               paso2:=json();
         lecturista:=json();
          FOR ind IN C_LECTURA LOOP
           gobj:=json();
          cont:=cont+1;
          
         --CentroOperacional.put('IDLABEL',ind.IDLABEL);
           gobj.put('ID_ASIG',ind.ID_ASIG);
            gobj.put('Ruta',ind.ruta);
            if ind.lote is null then
            declare
            vNOMBRERL varchar2(300);
            begin
            select NOMBRERL into vNOMBRERL from app.lct_rtalocal where IDTRTL=ind.ruta;
               gobj.put('nameRutalocal',vNOMBRERL);
            end;
            end if;
            
            if ind.totalmedidor is null then
            declare
            vtotalmedidor number(10);
            begin
            select count(*) into vtotalmedidor from app.lct_lecturas where IDTODT=ind.ID_ASIG;
              gobj.put('totalmedidor',vtotalmedidor);
            end;
            else
            gobj.put('totalmedidor',ind.totalmedidor);
            end if;
            
            
             gobj.put('LECT',ind.LECT);
              gobj.put('LECT',ind.LECT);
              gobj.put('NOMBRE',ind.NOMBRE);
               gobj.put('APATERNO',ind.APATERNO);
               
               gobj.put('totalcap',ind.totalcap);
               gobj.put('totallectura',ind.totallectura);
                gobj.put('C_operacion',ind.IDTCNTOPR);
              gobj.put('Asignacion',TO_CHAR(ind.asignacion,'dd/mm/yyyy'));
              gobj.put('FCHCRE',TO_CHAR(ind.FCHCRE,'dd/mm/yyyy'));
              
              
                   DECLARE
                    CURSOR C_LECTURISTA IS
                          /*SELECT LCT_USER.CLAVE AS LECT, LCT_USER.NOMBRE,LCT_USER.APATERNO  FROM LCT_RUTA_TO_USER,LCT_USER 
                          WHERE LCT_RUTA_TO_USER.IDASIGRUTA=
                          (SELECT IDTODT  FROM LCT_ASIGRUTAS WHERE LCT_ASIGRUTAS.IDTODT=ind.ID_ASIG) 
                          AND LCT_RUTA_TO_USER.ESTATUS=1 AND LCT_RUTA_TO_USER.IDUSER=LCT_USER.ID_USER ;
                         */ 
                         /*
                           SELECT LCT_USER.CLAVE AS LECT, LCT_USER.NOMBRE,LCT_USER.APATERNO  FROM  LCT_USER 
                          WHERE ID_USER=ind.LECTU;*/
                          
                          SELECT LCT_USER.CLAVE AS LECT, LCT_USER.NOMBRE,LCT_USER.APATERNO  FROM LCT_RUTA_TO_USER,LCT_USER 
                          WHERE LCT_RUTA_TO_USER.IDTODT =ind.ID_ASIG 
                          AND LCT_RUTA_TO_USER.ESTATUS=1 AND LCT_RUTA_TO_USER.IDUSER=LCT_USER.ID_USER ;
                          
                    BEGIN
                      ayudalecturista:=json();
                      FOR tt IN C_LECTURISTA LOOP
                      ayudalecturista.put(to_char(tt.LECT),tt.NOMBRE||' '||tt.APATERNO);
                                  END LOOP;
                        gobj.put('lecturistaAyuda',ayudalecturista);
                    END;    
              
              
         gobj.put('estatus',ind.estatus);
         
        gobj.put('Lote',ind.lote);
            /*        DECLARE
                    CURSOR C_LECTURISTA IS
                         -- SELECT LCT_USER.CLAVE AS LECT, LCT_USER.NOMBRE,LCT_USER.APATERNO  FROM LCT_RUTA_TO_USER,LCT_USER 
                         -- WHERE LCT_RUTA_TO_USER.IDASIGRUTA in
                         -- (SELECT IDTODT  FROM LCT_ASIGRUTAS WHERE LCT_ASIGRUTAS.IDTODT=ind.ID_ASIG) 
                          --AND LCT_RUTA_TO_USER.ESTATUS=1 AND LCT_RUTA_TO_USER.IDUSER=LCT_USER.ID_USER ;
                          SELECT LCT_USER.CLAVE AS LECT, NOMBRE,APATERNO  FROM LCT_USER 
                          WHERE ID_USER =ind.IDUSER  AND ESTATUS=1;
                          
                    BEGIN
                      FOR tt IN C_LECTURISTA LOOP
                      lecturista.put(to_char(tt.LECT),tt.NOMBRE||' '||tt.APATERNO);
                                  END LOOP;
                       
                    END;       
          */
            lecturista.put(cont,gobj);
          -- paso.put(to_char(ind.ruta),gobj);
           -- paso2.put(cont,paso);
           
           
           
   END LOOP;
   valdata.put('Ruta',lecturista);
   END;
   
   valdata.put('status',1);
     valdata.put('msg','ok');
     
         cadena := empty_clob();
  dbms_lob.createtemporary(cadena, true);
  valdata.to_clob(cadena, true);
     
    return '['||cadena||']';
    EXCEPTION
		when OTHERS then
			--return jmsgerr('wCVN0003');
      	gobj:=json();
		gobj.put('msg','ocurrio un error en la accion');
    gobj.put('error',SQLERRM);
    		gobj.put('lineaError',' lineaError -> '||DBMS_UTILITY.Format_Error_BackTrace);
    gobj.put('status',0);
        return '['||gobj.to_char()||']';
	END;
/*  __________________________________________________________________________________________________  */

/*  __________________________________________________________________________________________________  */

	FUNCTION showRutaLocal (token in varchar2) RETURN clob IS
  valdata json;
  cadena clob;
    paso json;
     paso2 json;
     cont number(20):=0;
     lecturista json;
     
      descifrar VARCHAR2(4000);
          jsondescifrar json;
           servicios json;
            servi_LCT json;
              --lecturista json;
             -- lecturista json_list;
          agente_IDTAGT VARCHAR2(20);
         -- iduser number(10);
          --keyvalue number(38);
         --  namekeyvalue  VARCHAR2(200);
         useradmin number(10);
     
     
    	BEGIN
        valdata:=json();
        
         descifrar:=UTILERIA_CIFRAR.DESCIFRAR(token);
      jsondescifrar:= json(descifrar);
      agente_IDTAGT:=json_ext.get_string(jsondescifrar,'IDTAGT');
      --iduser :=json_ext.get_number(jsondescifrar,'iduser');
       servicios  :=json_ext.get_json(jsondescifrar,'servicios'); 
       servi_LCT  :=json_ext.get_json(servicios,'lct');
       useradmin  :=json_ext.get_number(servi_LCT,'admin'); 
        
        
        
        --( SELECT IDTVAR FROM APP.LCT_VARIABLES  where TPOVAR ='CENOPR' and valor is not null AND VALOR LIKE '%'||agente_IDTAGT||'%')
    DECLARE
         CURSOR C_LECTURA is
 
   SELECT LOC.IDTRTL,LOC.NOMBRERL,LOC.EDO,LOC.fchcre asignacion,--LOC.fchuac fechaFin,
    (SELECT  COUNT(*) TOTAL FROM LCT_DETRTL WHERE LCT_DETRTL.IDTRTL=LOC.IDTRTL) TOTAL
    FROM LCT_RTALOCAL LOC
    WHERE loc.idtrtl IN (SELECT idtrtl  FROM APP.lct_rtalocal WHERE cntopr IN ( SELECT IDTVAR FROM APP.LCT_VARIABLES  where TPOVAR ='CENOPR' and valor is not null AND VALOR LIKE '%'||agente_IDTAGT||'%'))
    ORDER BY LOC.IDTRTL DESC;
          	BEGIN
              paso:=json();
              
         lecturista:=json();
          FOR ind IN C_LECTURA LOOP
           gobj:=json();
          cont:=cont+1;
          
         --CentroOperacional.put('IDLABEL',ind.IDLABEL);
          -- gobj.put('ID_ASIG',ind.ID_ASIG);
            gobj.put('IdRlocal',ind.IDTRTL);
           --  gobj.put('LECT',ind.LECT);
            --  gobj.put('LECT',ind.LECT);
              gobj.put('Ruta',ind.NOMBRERL);
              -- gobj.put('APATERNO',ind.APATERNO);
               gobj.put('TotMedidor',ind.TOTAL);
            gobj.put('Asignacion',TO_CHAR(ind.asignacion,'dd/mm/yyyy'));
          --   gobj.put('fechaFin',TO_CHAR(ind.fechaFin,'dd/mm/yyyy'));
         gobj.put('estatus',ind.EDO);
         
         DECLARE
          paso3 json ;
         CURSOR C_MEDIDOR IS
          SELECT * FROM LCT_DETRTL WHERE IDTRTL= ind.IDTRTL ORDER BY ORD ASC;
         BEGIN
          paso2:=json();
         
           FOR sec IN C_MEDIDOR LOOP
            paso3:=json();
          paso3.put('Secuencia',sec.ORD);
          
            paso3.put('Idmedidor',sec.IDTCPR);
           
          
             
             DECLARE
             VDIRECCION VARCHAR2(300);
             VMEDIDOR  VARCHAR2(300);
             BEGIN
             SELECT  
                   -- CLT.IDTCLT CLIENTE,
                   -- CTR.IDTCTR CONTRATO,
                    NVL (REPLACE (REPLACE (CLT.ADRLBR, CHR (13) || CHR (10), ''),CHR (9),''),'') DIRECCION,
                   --  CPR.IDTCPR IDMEDIDOR,
                    CPR.NUMCPR MEDIDOR
                    --CPRPNTCPG.DATDPS FECHARETIRO,
                    --CPRPNTCPG.DATPOS FECHAINSTALACION,
                   -- USGCPR.LIB USOMEDIDOR
                   INTO VDIRECCION, VMEDIDOR
                    FROM  x7.clt, x7.ctr, x7.cprpntcpg, x7.cpr, x7.usgcpr
                    WHERE 
                    CLT.IDTCLT = CTR.IDTCLTDST  AND
                    CTR.IDTPNTCPG = CPRPNTCPG.IDTPNTCPG AND
                    CTR.IDTPNTLVR = CPRPNTCPG.IDTPNTLVR AND
                    CPR.IDTCPR = CPRPNTCPG.IDTCPR AND
                    CPRPNTCPG.IDTUSGCPR = USGCPR.IDTUSGCPR AND
                    CPRPNTCPG.DATDPS IS NULL AND
                    CTR.DATRSL IS NULL 
                 and  CPR.IDTCPR=sec.IDTCPR    
                    order by CPRPNTCPG.DATPOS;
                    
                     paso3.put('Numeromedidor',VMEDIDOR);
                      paso3.put('Direccion',VDIRECCION);
                    
                      EXCEPTION
                      WHEN NO_DATA_FOUND THEN
                       VDIRECCION :='';
                         VMEDIDOR :='';
                      
             END;
             
             
                paso2.put(''||sec.ORD,paso3);
             END LOOP;
           gobj.put('Medidor',paso2);
         END;
       -- gobj.put('Lote',ind.lote);
   
            lecturista.put(cont,gobj);
          -- paso.put(to_char(ind.ruta),gobj);
           -- paso2.put(cont,paso);
           
           
           
   END LOOP;
   valdata.put('Ruta',lecturista);
   END;
   
   valdata.put('status',1);
     valdata.put('msg','ok');
     
         cadena := empty_clob();
  dbms_lob.createtemporary(cadena, true);
  valdata.to_clob(cadena, true);
     
    return '['||cadena||']';
    EXCEPTION
		when OTHERS then
			--return jmsgerr('wCVN0003');
      	gobj:=json();
		gobj.put('msg','ocurrio un error en la accion');
    gobj.put('error',SQLERRM);
    		gobj.put('lineaError',' lineaError -> '||DBMS_UTILITY.Format_Error_BackTrace);
    gobj.put('status',0);
        return '['||gobj.to_char()||']';
	END;
/*  __________________________________________________________________________________________________  */

/*  __________________________________________________________________________________________________  */
	FUNCTION showGestionarUsuario  RETURN clob IS
    valdata json;
    cont number:=0;
     lista json;
    	BEGIN
       valdata:=json();
    DECLARE
      CURSOR C_lecturista is
       SELECT * FROM LCT_USER  ORDER BY ID_USER DESC;
		      	BEGIN
      lista:=json();
          FOR ind IN C_lecturista LOOP
          cont:=cont+1;
            gobj:=json();
          gobj.put('Clave',ind.CLAVE);
          gobj.put('Nombre',ind.NOMBRE);
          gobj.put('Paterno',ind.APATERNO);
          gobj.put('Materno',ind.AMATERNO);
          gobj.put('Email',ind.EMAIL);
          gobj.put('Usuario',ind.USUARIO);
          gobj.put('Genero',ind.GENERO);
          gobj.put('IdPerfil',ind.IDPERFIL);
            gobj.put('Idcentrooperacional',ind.IDTCNTOPR);
           gobj.put('Fecharegistro',ind.FECHAIN);
            gobj.put('Fechamodificacion',ind.FECHAMODIF);
             gobj.put('Estatus',ind.ESTATUS);
              gobj.put('Foto',ind.PHOTO);
                           
              --gobj.put(to_char(ind.ID_USER),ind.ID_USER);
                 lista.put(to_char(cont),gobj);
          END LOOP;
    valdata.put('Lecturista',lista);
   END;
   
   valdata.put('status',1);
     
    return '['||valdata.to_char()||']';
    EXCEPTION
		when OTHERS then
			--return jmsgerr('wCVN0003');
      	gobj:=json();
		gobj.put('msg','ocurrio un error en la accion');
    gobj.put('error',SQLERRM);
    gobj.put('status',0);
        return '['||gobj.to_char()||']';
	END;
/*  __________________________________________________________________________________________________  */
/*  __________________________________________________________________________________________________  */
	FUNCTION showGestionarMobile ( token in varchar2 ) RETURN clob IS
  
    valdata json;
    cont number:=0;
     lista json;
      descifrar VARCHAR2(4000);
      jsondescifrar json;
           servicios json;
            servi_LCT json;
          agente_IDTAGT VARCHAR2(20);
         -- iduser number(10);
         useradmin number(10);
     
    	BEGIN
       valdata:=json();
    DECLARE
          	BEGIN
                 descifrar:=UTILERIA_CIFRAR.DESCIFRAR(token);
      jsondescifrar:= json(descifrar);
      agente_IDTAGT:=json_ext.get_string(jsondescifrar,'IDTAGT');
      --iduser :=json_ext.get_number(jsondescifrar,'iduser');
       servicios  :=json_ext.get_json(jsondescifrar,'servicios'); 
       servi_LCT  :=json_ext.get_json(servicios,'lct');
       useradmin  :=json_ext.get_number(servi_LCT,'admin'); 
                 valdata:=json();
          --    if ValidaToken(descifrar) and useradmin=1 then 
                
            declare
             CURSOR C_mobile is
       SELECT * FROM LCT_MOBILE 
       WHERE COPR  IN (SELECT IDTVAR FROM APP.LCT_VARIABLES  where TPOVAR ='CENOPR' and valor is not null AND VALOR LIKE '%'||agente_IDTAGT||'%')
       ORDER BY IDtMOB DESC;
            begin 
                    
      lista:=json();
          FOR ind IN C_mobile LOOP
          cont:=cont+1;
            gobj:=json();
          gobj.put('Clave',ind.IMEI);
          gobj.put('Marca',ind.MARCA);
          gobj.put('Modelo',ind.MIODELO);
          --gobj.put('user',ind.ID_USER);
              
           gobj.put('Fecharegistro',ind.FCHCRE);
            gobj.put('Fechamodificacion',ind.FCHUAC);
             gobj.put('Estatus',ind.EDOOPR);
                gobj.put('Comentario',ind.NOTAS); 
                gobj.put('copr',ind.COPR);
                 
              gobj.put('Folio',ind.IDTMOB);
                 lista.put(to_char(cont),gobj);
          END LOOP;
         
    valdata.put('Mobile',lista);
   END;
   
   valdata.put('status',1);
            end;
    
     
    return '['||valdata.to_char()||']';
    EXCEPTION
		when OTHERS then
			--return jmsgerr('wCVN0003');
      	gobj:=json();
		gobj.put('msg','ocurrio un error en la accion');
    gobj.put('msg','ocurrio un error.'|| ' lineaError -> '||DBMS_UTILITY.Format_Error_BackTrace );
		gobj.put('error',SQLERRM);
		gobj.put('lineaError',' lineaError -> '||DBMS_UTILITY.Format_Error_BackTrace);
    gobj.put('status',0);
        return '['||gobj.to_char()||']';
	END;
/*  __________________________________________________________________________________________________  */

/*  __________________________________________________________________________________________________  */
	FUNCTION showLoteMasdetalle ( token in varchar2 ,vODT in number) RETURN clob IS
  cadena			clob;
    valdata json;
    cont number:=0;
     lista json;
      descifrar VARCHAR2(4000);
      jsondescifrar json;
           servicios json;
           foto json;
         fototemp json;
            servi_LCT json;
          agente_IDTAGT VARCHAR2(20);
          vidtanm1 VARCHAR2(200);
          vidtanm2 VARCHAR2(200);
         -- iduser number(10);
         useradmin number(10);
     
    	BEGIN
       valdata:=json();
    DECLARE
          	BEGIN
                 descifrar:=UTILERIA_CIFRAR.DESCIFRAR(token);
      jsondescifrar:= json(descifrar);
      agente_IDTAGT:=json_ext.get_string(jsondescifrar,'IDTAGT');
      --iduser :=json_ext.get_number(jsondescifrar,'iduser');
       servicios  :=json_ext.get_json(jsondescifrar,'servicios'); 
       servi_LCT  :=json_ext.get_json(servicios,'lct');
       useradmin  :=json_ext.get_number(servi_LCT,'admin'); 
                 valdata:=json();
          --    if ValidaToken(descifrar) and useradmin=1 then 
                
            declare
             CURSOR C_lecturas is
       /*SELECT * FROM LCT_MOBILE 
       WHERE COPR  IN (SELECT IDTVAR FROM APP.LCT_VARIABLES  where TPOVAR ='CENOPR' and valor is not null AND VALOR LIKE '%'||agente_IDTAGT||'%')
       ORDER BY IDtMOB DESC;
       */
       SELECT  IDTLEC, IDTCTR, RNG1 SECUENCIA, NUMCPR MEDIDOR,fchlec,FCHVER, LECTURA, lecturaver,idtanm1,idtanm2, edoatl, NOTE, intentos,id_user lecturista FROM app.lct_lecturas where idtodt =vODT and edoatl in ('CAP','MOD')
       order by RNG1 asc;
            begin 
                    
      lista:=json();
      
          FOR ind IN C_lecturas LOOP
           fototemp:=json();
          cont:=cont+1;
            gobj:=json();
          gobj.put('secuencia',ind.SECUENCIA);
          gobj.put('MEDIDOR',ind.MEDIDOR);
          gobj.put('contrato',ind.IDTCTR);
             gobj.put('fchlec',TO_CHAR(ind.fchlec,'dd/mm/yyyy HH24:MI:SS'));
              gobj.put('FCHVER',TO_CHAR(ind.FCHVER,'dd/mm/yyyy HH24:MI:SS'));
         gobj.put('intentos',ind.intentos);
         if ind.edoatl='CAP' then 
          gobj.put('descrip_edo','Capturado');
         else if ind.edoatl='MOD' then 
      
          gobj.put('descrip_edo','Capturado y Modificado');
           end if;
             end if;
          
            gobj.put('LECTURA',ind.LECTURA);
             gobj.put('lecturaver',ind.lecturaver);
              gobj.put('lecturaver',ind.lecturaver);
               gobj.put('comentario',ind.NOTE);
               declare
              vclave  number(10);
               vlecturista  varchar2(300);
              begin
                select  clave,CONCAT (CONCAT( NOMBRE,AMATERNO), APATERNO) into vclave, vlecturista from  APP.lct_user  where id_user =ind.lecturista;
                 gobj.put('claveLEC',vclave);
                  gobj.put('lecturista',vlecturista);
               end;
               
              declare
              code1  number(4);
              begin
                code1:=to_number(ind.idtanm1);
                if code1 >9 then
              select  libabr anomalia into vidtanm1 from x7.codobs where utl=1 and OBSINT= 0 and SAICNS= 0 and codobs=to_char(ind.idtanm1);
              else
               select  libabr anomalia into vidtanm1 from x7.codobs where utl=1 and OBSINT= 0 and SAICNS= 0 and codobs=to_char('0'||ind.idtanm1);
              end if;
              --- select  libabr anomalia into vidtanm2 from x7.codobs where utl=1 and OBSINT= 0 and SAICNS= 0 and codobs=to_char(ind.idtanm2);
                EXCEPTION
                when NO_DATA_FOUND  then
                vidtanm1:='';
               -- vidtanm2:='';
               end;
               declare
                 code2  number(4);
              begin
              code2:=to_number(ind.idtanm2);
             -- select  libabr anomalia into vidtanm1 from x7.codobs where utl=1 and OBSINT= 0 and SAICNS= 0 and codobs=to_char(ind.idtanm1);
              if code2 >9 then
               select  libabr anomalia into vidtanm2 from x7.codobs where utl=1 and OBSINT= 0 and SAICNS= 0 and codobs=to_char(ind.idtanm2);
               else
                select  libabr anomalia into vidtanm2 from x7.codobs where utl=1 and OBSINT= 0 and SAICNS= 0 and codobs=to_char('0'||ind.idtanm2);
                end if;
                EXCEPTION
                when NO_DATA_FOUND  then
                --vidtanm1:='';
                vidtanm2:='';
               end;
               
                declare
             vcont number (10):=0;
               CURSOR C_foto is
               select  NOMBRE,contrato  from APP.LCT_FOTO where IDTODT=vODT and IDTLEC = ind.IDTLEC;
                begin
                foto:=json();
          FOR vind IN C_foto LOOP
          vcont:=vcont+1;
           foto.put('nombre',vind.NOMBRE  );
            foto.put('contrato',vind.contrato  );
            foto.put('contrato',vind.contrato  );
             fototemp.put(to_char(vcont),foto);
                     END LOOP;
                
               end;
               
                gobj.put('foto',fototemp);
                if ind.idtanm1 is null then 
                 gobj.put('idtanm1','');
                 else
               gobj.put('idtanm1','('|| ind.idtanm1 ||') '||vidtanm1);
               end if;
                if ind.idtanm2 is null then 
                gobj.put('idtanm2','');
                else
                 gobj.put('idtanm2','('||ind.idtanm2||') '||vidtanm2 );
                end if;
                
                
                
                 gobj.put('edoatl',ind.edoatl);
          
                 lista.put(to_char(cont),gobj);
          END LOOP;
         
    valdata.put('Lote',lista);
   END;
   
   valdata.put('status',1);
            end;
    cadena := empty_clob();
	dbms_lob.createtemporary(cadena, true);
	valdata.to_clob(cadena, true);
     
    return '['||cadena||']';
    EXCEPTION
		when OTHERS then
			--return jmsgerr('wCVN0003');
      	gobj:=json();
		gobj.put('msg','ocurrio un error en la accion');
    gobj.put('msg','ocurrio un error.'|| ' lineaError -> '||DBMS_UTILITY.Format_Error_BackTrace );
		gobj.put('error',SQLERRM);
		gobj.put('lineaError',' lineaError -> '||DBMS_UTILITY.Format_Error_BackTrace);
    gobj.put('status',0);
        return '['||gobj.to_char()||']';
	END;
/*  __________________________________________________________________________________________________  */

/*  __________________________________________________________________________________________________  */
	FUNCTION insertatox7complete ( token in varchar2 ,vODT in number) RETURN clob IS
     PRAGMA AUTONOMOUS_TRANSACTION;
  cadena			clob;
    valdata json;
    cont number ;
     lista json;
      descifrar VARCHAR2(4000);
      jsondescifrar json;
           servicios json;
           foto json;
         fototemp json;
            servi_LCT json;
          agente_IDTAGT VARCHAR2(20);
          vidtanm1 VARCHAR2(200);
          vidtanm2 VARCHAR2(200);
         -- iduser number(10);
         useradmin number(10);
     
    	BEGIN
       valdata:=json();
    DECLARE
          	BEGIN
                 descifrar:=UTILERIA_CIFRAR.DESCIFRAR(token);
      jsondescifrar:= json(descifrar);
      agente_IDTAGT:=json_ext.get_string(jsondescifrar,'IDTAGT');
      --iduser :=json_ext.get_number(jsondescifrar,'iduser');
       servicios  :=json_ext.get_json(jsondescifrar,'servicios'); 
       servi_LCT  :=json_ext.get_json(servicios,'lct');
       useradmin  :=json_ext.get_number(servi_LCT,'admin'); 
                 valdata:=json();
             if ValidaToken(descifrar) and useradmin=1 then 
             SELECT   count(*) into cont FROM app.lct_lecturas where idtodt=vODT and edoatl='NVO';
             
             if cont=0 then
             DECLARE
             VCUENTA NUMBER;
             VAGENTE APP.lct_ordenes.IDTUSRCRE%TYPE;
             VLOTE APP.lct_ordenes.IDTLOTFAC%TYPE;
                VRUTA APP.lct_ordenes.IDTTRNTYP%TYPE;
             BEGIN
             SELECT --COUNT(*),
            (SELECT  clave FROM app.lct_user where id_user= IDTUSRLCT) AGT, IDTLOTFAC LOTE, IDTTRNTYP RUTA INTO --VCUENTA,
             VAGENTE, VLOTE,VRUTA  FROM APP.lct_ordenes WHERE idtodt=vODT;-- AND IDTLOTFAC IS NOT NULL;
             
             IF --VCUENTA=1 AND 
             VLOTE IS NOT NULL THEN
                       Insert into X7.AGK_RLVTP
               (IDTLOTFAC, IDTCTR, IDTCPR, IND, DATRLV, CODOBS, CODOBS2, NOTE, NUMCPR, IDTAGT, VERIFICADO)
               SELECT  VLOTE, IDTCTR,IDTCPR IDTCPR, LECTURA IND, FCHLEC DATRLV,    IDTANM1,  IDTANM2 ,NOTE, NUMCPR ,VAGENTE ,0
        FROM app.lct_lecturas where   edoatl='CAP' AND idtodt= (SELECT idtodt FROM APP.lct_ordenes WHERE idtodt=vODT AND IDTLOTFAC IS NOT NULL);
        
        UPDATE APP.lct_ordenes SET EDOODT='EJE' WHERE  idtodt=vODT;
        COMMIT;
        
             
             ELSE
             UPDATE APP.lct_ordenes SET EDOODT='EJE' WHERE  idtodt=vODT;
        COMMIT;
             
             END IF;
             
             END;
             /*
              select count(1) into vnum from x7.agk_rlvtp where idtcpr= vidtcpr   and  idtlotfac=vlote and   idtctr=vcontrato;
        if vnum = 0 then
            begin     
             Insert into X7.AGK_RLVTP
               (IDTLOTFAC, IDTCTR, IDTCPR, IND, DATRLV, CODOBS, CODOBS2, NOTE, NUMCPR, IDTAGT, VERIFICADO)
             Values
               (vlote, vcontrato, vidtcpr,vlectura, vfechalectura, vidtcodobs1, vidtcodobs2, vnota, vmedidor, vidtagt, 0);
             commit;
            exception when others  then       
              gobj:=json();
              gobj.put('success','false');
              gobj.put('message', SQLERRM);
              return gobj.to_char;
            end;
        else
            begin     
             update X7.AGK_RLVTP set IND = vlectura,  DATRLV = vfechalectura, CODOBS = vidtcodobs1, CODOBS2 =vidtcodobs2, NOTE=vnota, IDTAGT=vidtagt
             where idtcpr= vidtcpr   and  idtlotfac=vlote and   idtctr=vcontrato;
             commit;
            exception when others  then       
              gobj:=json();
              gobj.put('success','false');
              gobj.put('message', SQLERRM);
              return gobj.to_char;
            end;   
        end if;
             */
             
             
             valdata.put('status',1);
                valdata.put('msg','La ODT se proceso correctamente');
                
                
                
                else
                 valdata.put('status',0);
                valdata.put('msg','La ODT no esta al 100% completada, no se pudo Procesar');
                end if;
             
             else
             valdata.put('status',0);
   valdata.put('msg','usuario no permitido');
             end if;
                
   
   
            end;
    cadena := empty_clob();
	dbms_lob.createtemporary(cadena, true);
	valdata.to_clob(cadena, true);
     
    return '['||cadena||']';
    EXCEPTION
		when OTHERS then
			--return jmsgerr('wCVN0003');
      	gobj:=json();
		gobj.put('msg','ocurrio un error en la accion');
    gobj.put('msg','ocurrio un error.'|| ' lineaError -> '||DBMS_UTILITY.Format_Error_BackTrace );
		gobj.put('error',SQLERRM);
		gobj.put('lineaError',' lineaError -> '||DBMS_UTILITY.Format_Error_BackTrace);
    gobj.put('status',0);
        return '['||gobj.to_char()||']';
	END;
/*  __________________________________________________________________________________________________  */




/*  __________________________________________________________________________________________________  */
	FUNCTION showCentroOperac ( token in varchar2 ) RETURN clob IS
  
    valdata json;
    cont number:=0;
     lista json;
      descifrar VARCHAR2(4000);
      jsondescifrar json;
           servicios json;
            servi_LCT json;
          agente_IDTAGT VARCHAR2(20);
         -- iduser number(10);
         useradmin number(10);
     
    	BEGIN
       valdata:=json();
    DECLARE
          	BEGIN
                 descifrar:=UTILERIA_CIFRAR.DESCIFRAR(token);
      jsondescifrar:= json(descifrar);
      agente_IDTAGT:=json_ext.get_string(jsondescifrar,'IDTAGT');
      --iduser :=json_ext.get_number(jsondescifrar,'iduser');
       servicios  :=json_ext.get_json(jsondescifrar,'servicios'); 
       servi_LCT  :=json_ext.get_json(servicios,'lct');
       useradmin  :=json_ext.get_number(servi_LCT,'admin'); 
                 valdata:=json();
          --    if ValidaToken(descifrar) and useradmin=1 then 
                
            declare
             CURSOR C_mobile is
       SELECT IDTVAR FROM APP.LCT_VARIABLES  where TPOVAR ='CENOPR' and valor is not null AND VALOR LIKE '%'||agente_IDTAGT||'%'
       ORDER BY TPOVAR DESC;
            begin 
                    
      lista:=json();
          FOR ind IN C_mobile LOOP
          cont:=cont+1;
            gobj:=json();
          gobj.put('Clave',ind.IDTVAR);
          lista.put(to_char(cont),gobj);
          END LOOP;
         
    valdata.put('COPR',lista);
   END;
   
   valdata.put('status',1);
            end;
    
     
    return '['||valdata.to_char()||']';
    EXCEPTION
		when OTHERS then
			--return jmsgerr('wCVN0003');
      	gobj:=json();
		gobj.put('msg','ocurrio un error en la accion');
    gobj.put('msg','ocurrio un error.'|| ' lineaError -> '||DBMS_UTILITY.Format_Error_BackTrace );
		gobj.put('error',SQLERRM);
		gobj.put('lineaError',' lineaError -> '||DBMS_UTILITY.Format_Error_BackTrace);
    gobj.put('status',0);
        return '['||gobj.to_char()||']';
	END;
/*  __________________________________________________________________________________________________  */


/*  __________________________________________________________________________________________________  */

	FUNCTION agregarlecturista(datos in varchar2, token in varchar2)  RETURN clob IS
  PRAGMA AUTONOMOUS_TRANSACTION;
    valdata json;
    TOT NUMBER(1):=0;
    datos2 json;
       reple varchar2(5000);
       
           clave1 APP.LCT_USER.CLAVE%TYPE;
        nombre APP.LCT_USER.NOMBRE%TYPE;
        amaterno APP.LCT_USER.AMATERNO%TYPE;
        apaterno APP.LCT_USER.APATERNO%TYPE;
        mail APP.LCT_USER.EMAIL%TYPE;
        usuario1 APP.LCT_USER.USUARIO%TYPE;
        pass APP.LCT_USER.PASS%TYPE;
        genero APP.LCT_USER.GENERO%TYPE;
        idperfil APP.LCT_USER.IDPERFIL%TYPE;
        idtcntopre APP.LCT_USER.IDTCNTOPR%TYPE;
         activo APP.LCT_USER.ESTATUS%TYPE;
          photo APP.LCT_USER.PHOTO%TYPE;
          descifrar VARCHAR2(4000);
          jsondescifrar json;
           servicios json;
            servi_LCT json;
          --agente_IDTAGT VARCHAR2(20);
         -- iduser number(10);
         useradmin number(10);
    	BEGIN 
      
      descifrar:=UTILERIA_CIFRAR.DESCIFRAR(token);
      jsondescifrar:= json(descifrar);
      --agente_IDTAGT:=json_ext.get_string(jsondescifrar,'IDTAGT');
      --iduser :=json_ext.get_number(jsondescifrar,'iduser');
       servicios  :=json_ext.get_json(jsondescifrar,'servicios'); 
       servi_LCT  :=json_ext.get_json(servicios,'lct');
       useradmin  :=json_ext.get_number(servi_LCT,'admin');  
      if ValidaToken(descifrar) and useradmin=1 then 
     
      
          reple:= REPLACE(datos, ';quot;','"');
           if not vjson(reple) then return jmsgerr('LCT001'); end if;
             valdata:=json();
       datos2:=json(reple);              
           clave1:=json_ext.get_number(datos2,'clave');
          nombre:=json_ext.get_string(datos2,'nombre');
          amaterno:=json_ext.get_string(datos2,'amaterno');
          apaterno:=json_ext.get_string(datos2,'apaterno');
          mail:=json_ext.get_string(datos2,'mail');
          usuario1:=json_ext.get_string(datos2,'usuario');
          pass:=UTILERIA_CIFRAR.cifrar( json_ext.get_string(datos2,'pass1'));
          genero:=json_ext.get_number(datos2,'genero');
          idperfil:=json_ext.get_number(datos2,'lctperfil');
          idtcntopre:=json_ext.get_number(datos2,'lctcentro');
          activo:=json_ext.get_number(datos2,'activo');
          photo:=json_ext.get_string(datos2,'file_name');
        
          SELECT COUNT(*) TOTAL INTO TOT FROM LCT_USER WHERE CLAVE=clave1 OR USUARIO=usuario1 OR EMAIL=mail;
      IF TOT=0 THEN        
   
        INSERT INTO LCT_USER
            (ID_USER, CLAVE, NOMBRE, AMATERNO, APATERNO, EMAIL, USUARIO, PASS, GENERO, IDPERFIL, IDTCNTOPR,FECHAIN,FECHAMODIF,ESTATUS,PHOTO) 
   VALUES (LCT_SQUSE.NEXTVAL, clave1, nombre, amaterno, apaterno, mail, usuario1, pass,genero, idperfil, idtcntopre,SYSDATE,SYSDATE,activo,photo);
                      COMMIT; 
                      valdata.put('status',1);
                      -- valdata.put('servicios',servicios);
                        --valdata.put('servi_LCT',servi_LCT);
                       valdata.put('msg','Se agrego lecturista');
        
        ELSE
             valdata.put('status',0);
              valdata.put('msg','Clave, Usuario o contraseña ya existe. Agregue uno diferente');
          END IF;
        
         valdata.put('activo',activo);
       
    valdata.put('datos',datos2);
    valdata.put('token',token);
    ELSE
   valdata.put('status',0);
            --valdata.put('opcion',estadoValidar);
             valdata.put('error','Token expirado o usuario no permitido');
					valdata.put('msg','No se pudo agregar');
    end if;
  
     
    return '['||valdata.to_char()||']';
    EXCEPTION
		when OTHERS then
			--return jmsgerr('wCVN0003');
      	gobj:=json();
		gobj.put('msg','ocurrio un error en la accion');
    gobj.put('error',SQLERRM);
    gobj.put('status',0);
        return '['||gobj.to_char()||']';
	END;
/*  __________________________________________________________________________________________________  */
/*  __________________________________________________________________________________________________  */

	FUNCTION agregarmobile(datos in varchar2, token in varchar2)  RETURN clob IS
  PRAGMA AUTONOMOUS_TRANSACTION;
    valdata json;
    TOT NUMBER(1):=0;
    datos2 json;
       reple varchar2(5000);
       
           claveEmei APP.LCT_MOBILE.IMEI%TYPE;
        ESTADO APP.LCT_MOBILE.EDOOPR%TYPE;
        comentario APP.LCT_MOBILE.NOTAS%TYPE;
        vcopr APP.LCT_MOBILE.copr%TYPE;
        
         descifrar VARCHAR2(4000);
          jsondescifrar json;
           servicios json;
            servi_LCT json;
          --agente_IDTAGT VARCHAR2(20);
         -- iduser number(10);
         useradmin number(10);
     
    	BEGIN 
       descifrar:=UTILERIA_CIFRAR.DESCIFRAR(token);
      jsondescifrar:= json(descifrar);
      --agente_IDTAGT:=json_ext.get_string(jsondescifrar,'IDTAGT');
      --iduser :=json_ext.get_number(jsondescifrar,'iduser');
       servicios  :=json_ext.get_json(jsondescifrar,'servicios'); 
       servi_LCT  :=json_ext.get_json(servicios,'lct');
       useradmin  :=json_ext.get_number(servi_LCT,'admin');  
      if ValidaToken(descifrar) and useradmin=1 then 
      
          reple:= REPLACE(datos, ';quot;','"');
           if not vjson(reple) then return jmsgerr('LCT001'); end if;
             valdata:=json();
       datos2:=json(reple);              
           claveEmei:=json_ext.get_number(datos2,'clave');
          ESTADO:=json_ext.get_number(datos2,'activo');
          comentario:=json_ext.get_string(datos2,'comentario');
          vcopr:=json_ext.get_string(datos2,'copr');
          
          SELECT COUNT(*) TOTAL INTO TOT FROM LCT_MOBILE WHERE IMEI=claveEmei;
      IF TOT=0 THEN        
          INSERT INTO LCT_MOBILE
            ( IMEI, FCHCRE,NOTAS,EDOOPR,COPR) 
   VALUES ( claveEmei,SYSDATE,comentario,ESTADO,vcopr);
                      COMMIT; 
                      valdata.put('status',1);
                       valdata.put('msg','Se agrego Mobile');
                        -- valdata.put('servicios',servicios);
                        --valdata.put('servi_LCT',servi_LCT);
        
        ELSE
             valdata.put('status',0);
              valdata.put('msg','Clave IMEI ya existe. Agregue uno diferente');
          END IF;
       ELSE
   valdata.put('status',0);
            --valdata.put('opcion',estadoValidar);
             valdata.put('error','Token expirado o usuario no permitido');
					valdata.put('msg','No se pudo agregar');
    end if;  
        -- valdata.put('activo','activo');
       
    valdata.put('datos',datos2);
    valdata.put('token',token);
   
  
     
    return '['||valdata.to_char()||']';
    EXCEPTION
		when OTHERS then
			--return jmsgerr('wCVN0003');
      	gobj:=json();
		gobj.put('msg','ocurrio un error en la accion');
    gobj.put('error',SQLERRM);
    gobj.put('status',0);
        return '['||gobj.to_char()||']';
	END;
/*  __________________________________________________________________________________________________  */
/*  __________________________________________________________________________________________________  */

	FUNCTION agregarRutaAsginacion(datos in varchar2, token in varchar2)  RETURN clob IS
  PRAGMA AUTONOMOUS_TRANSACTION;
    valdata json;
    TOT NUMBER(1):=0;
    datos2 json;
       reple varchar2(5000);
        
         fecha  varchar2(5000);
        --etiqueta varchar2(30);
        ruta LCT_ASIGRUTAS.IDTTRNTYP%TYPE;
         lote LCT_ASIGRUTAS.IDTLOTFAC%TYPE;
          centroOperacion LCT_ASIGRUTAS.IDTCNTOPR%TYPE;
        
         descifrar VARCHAR2(4000);
          jsondescifrar json;
           servicios json;
            servi_LCT json;
              --lecturista json;
              lecturista json_list;
          agente_IDTAGT VARCHAR2(20);
         -- iduser number(10);
          --keyvalue number(38);
           namekeyvalue  VARCHAR2(200);
         useradmin number(10);
          IDRUTA number(10):=0;
           IDUSER1 number(10):=0;
            vcentroop varchar(10);
     
    	BEGIN 
       descifrar:=UTILERIA_CIFRAR.DESCIFRAR(token);
      jsondescifrar:= json(descifrar);
      agente_IDTAGT:=json_ext.get_string(jsondescifrar,'IDTAGT');
      --iduser :=json_ext.get_number(jsondescifrar,'iduser');
       servicios  :=json_ext.get_json(jsondescifrar,'servicios'); 
       servi_LCT  :=json_ext.get_json(servicios,'lct');
       useradmin  :=json_ext.get_number(servi_LCT,'admin');  
       
        namekeyvalue:=json_ext.get_string(servi_LCT,'key');--ID Centro operaciona x7
        --keyvalue  :=json_ext.get_number(servi_LCT,'key_value');  
         centroOperacion  :=TO_CHAR(json_ext.get_number(servi_LCT,'key_value'));  
       
      IF ValidaToken(descifrar) and useradmin=1 THEN 
      
          reple:= REPLACE(datos, ';quot;','"');
           IF not vjson(reple) then return jmsgerr('LCT001'); end IF;
             valdata:=json();
       datos2:=json(reple);              
           --etiqueta:=json_ext.get_string(datos2,'etiqueta');
          ruta:=json_ext.get_string(datos2,'ruta');
           lote:=json_ext.get_string(datos2,'lote');
            fecha:=json_ext.get_string(datos2,'date');
            -- lecturista  :=json_ext.get_json(datos2,'lecturista');
              lecturista :=json_list (datos2.get ('lecturista'));
             
          
        -- SELECT COUNT(*) TOTAL INTO TOT FROM LCT_ORDENES WHERE IDTTRNTYP=ruta and  FCHATH=TO_DATE(fecha,'DD/MM/YYYY') and IDTUSRLCT;
     -- IF TOT=0 THEN        
         --  INSERT INTO LCT_ASIGRUTAS 
         ----  (IDTODT, IDTLOTFAC,IDTTRNTYP,IDTCNTOPR, FCHASG,EDOASR) 
            --     VALUES (LCT_SQASI.NEXTVAL, lote,ruta,centroOperacion,TO_DATE(fecha,'dd/mm/yyyy'),'0');
              --        COMMIT;  
                      
               valdata.put('lecturista',lecturista);
              valdata.put('datos2',datos2);
           
         --  SELECT IDTODT INTO IDRUTA FROM LCT_ASIGRUTAS WHERE IDTTRNTYP=ruta AND FCHASG=TO_DATE(fecha,'DD/MM/YYYY');
           --  valdata.put('IDRUTA',IDRUTA);
              FOR i IN 1 .. lecturista.COUNT
              loop
              begin 
              
                 SELECT ID_USER INTO IDUSER1  FROM LCT_USER WHERE CLAVE=TO_NUMBER(REPLACE(lecturista.get(i).to_char(), '"',''));
                  SELECT IDTVAR into vcentroop FROM APP.LCT_VARIABLES  where TPOVAR ='CENOPR' and valor is not null AND VALOR LIKE '%'||agente_IDTAGT||'%'
       ORDER BY TPOVAR DESC;
                  --   valdata.put('IDUSER1_'||i,IDUSER1);
                  --  valdata.put('lecturista_'||i, lecturista.get(i).to_char());
                  -- INSERT INTO LCT_RUTA_TO_USER
       --  (ID_RUTA_A_USER,IDASIGRUTA,IDUSER,ESTATUS ) 
        --  VALUES (LCT_SQRUTATOUSER.NEXTVAL, IDRUTA,IDUSER1 , 1);         
             --       COMMIT; 
             
             
             SELECT COUNT(*) TOTAL INTO TOT FROM LCT_ORDENES WHERE IDTTRNTYP=ruta and  FCHATH=TO_DATE(fecha,'DD/MM/YYYY');-- and IDTUSRLCT=IDUSER1;
     IF TOT=0 THEN  
                    
                    INSERT INTO  LCT_ORDENES(
                    IDTUSRCRE,
                    IDTUSRLCT,
                    IDTCNTOPR,
                    FCHCRE,
                    FCHATH,
                    FCHUAC,
                    --FCHFIN,
                    IDTLOTFAC,
                    IDTTRNTYP
                    --IDTRTALOC
                   
                    )
                    VALUES(
                    to_number(agente_IDTAGT),
                   IDUSER1,
                 
                    vcentroop,
                    SYSDATE,
                    TO_DATE(fecha,'DD/MM/YYYY'),
                     SYSDATE,
                     --lote,
                     DECODE(lote, 'none', null, lote),
                     ruta
                    );
                    IF lote !='none' then 
                    UPDATE APP.LCT_LOTES SET EDOLTE='ASG' WHERE IDTLOTFAC=lote AND IDTTRNTYP=ruta;
                    end if;
                     COMMIT; 
                     valdata.put('status',1);
                       valdata.put('msg','Se asigno la ruta');
            else
            valdata.put('status',0);
                       valdata.put('msg','La asginacion ya existe');
            end if;
                    
                    
                 end;
               end loop;
                
        
      --  ELSE
      --       valdata.put('status',0);
       --       valdata.put('msg','La ruta ya existe');
        --      --valdata.put('datos2',datos2);
        --  END IF;
       ELSE
   valdata.put('status',0);
            --valdata.put('opcion',estadoValidar);
             valdata.put('error','Token expirado o usuario no permitido');
					valdata.put('msg','No se pudo agregar');
    end IF;  
        -- valdata.put('activo','activo');
       
   -- valdata.put('datos',datos2);
    --valdata.put('token',token);
   
  
     
    return '['||valdata.to_char()||']';
    EXCEPTION
		when OTHERS then
			--return jmsgerr('wCVN0003');
      	gobj:=json();
		gobj.put('msg','ocurrio un error en la accion');
    gobj.put('error',SQLERRM);
      gobj.put('lineaError',' lineaError -> '||DBMS_UTILITY.Format_Error_BackTrace);
    gobj.put('status',0);
        return '['||gobj.to_char()||']';
	END;
/*  __________________________________________________________________________________________________  */
/*  __________________________________________________________________________________________________  */

	FUNCTION ChangeStatusLecturista(clave2 in number, val in number, cambio varchar2,token in varchar2)  RETURN clob IS
  PRAGMA AUTONOMOUS_TRANSACTION;
    valdata json; 
      -- 	vidtusrlct APP.LCT_ORDENES.idtusrlct%TYPE;
        	vfchath APP.LCT_ORDENES.fchath%TYPE;
          	vidtlotfac APP.LCT_ORDENES.idtlotfac%TYPE;
    	vidttrntyp APP.LCT_ORDENES.idttrntyp%TYPE;
      descifrar VARCHAR2(4000);
      
      
          jsondescifrar json;
           servicios json;
            servi_LCT json;
          --agente_IDTAGT VARCHAR2(20);
         -- iduser number(10);
         useradmin number(10);
             	BEGIN 
              descifrar:=UTILERIA_CIFRAR.DESCIFRAR(token);
      jsondescifrar:= json(descifrar);
      --agente_IDTAGT:=json_ext.get_string(jsondescifrar,'IDTAGT');
      --iduser :=json_ext.get_number(jsondescifrar,'iduser');
       servicios  :=json_ext.get_json(jsondescifrar,'servicios'); 
       servi_LCT  :=json_ext.get_json(servicios,'lct');
       useradmin  :=json_ext.get_number(servi_LCT,'admin'); 
              
              
             valdata:=json();
              if ValidaToken(descifrar) and useradmin=1 then 
             
             IF cambio='lecturista' THEN
       UPDATE  LCT_USER SET FECHAMODIF=SYSDATE,ESTATUS=val WHERE ID_USER=(SELECT ID_USER FROM LCT_USER WHERE CLAVE = clave2);
       COMMIT; 
          valdata.put('status',1);
                       valdata.put('msg','Se Actualizo Estatus');
                       -- valdata.put('val',val);
                       --  valdata.put('clave',clave2);
       ELSE IF cambio='mobile' THEN
       -- ES mobile
        UPDATE  LCT_MOBILE SET FCHUAC=SYSDATE,EDOOPR=val WHERE IDTMOB=(SELECT IDTMOB FROM LCT_MOBILE WHERE IMEI = clave2);
        COMMIT; 
           valdata.put('status',1);
                       valdata.put('msg','Se Actualizo Estatus');
                       -- valdata.put('val',val);
                        -- valdata.put('clave',clave2);
       ELSE IF cambio='asignacionruta' THEN
       -- ES mobile
     --  UPDATE  LCT_ASIGRUTAS SET FCHUAC=SYSDATE,EDOASR='1' WHERE IDTODT= TO_NUMBER(clave2);
       --select IDTLOTFAC lote,IDTTRNTYP ruta, FCHASG from LCT_ASIGRUTAS  WHERE IDTODT= 41 and EDOASR='1';
       --   COMMIT;
       
   -- SELECT IDTLOTFAC lote, IDTTRNTYP ruta, FCHASG 
   -- INTO 	vidtlotfac,  	vidttrntyp  , 	vfchath  	
--FROM LCT_ASIGRUTAS  WHERE IDTODT= TO_NUMBER(clave2) and EDOASR='1';
       
          UPDATE  LCT_ORDENES SET edoodt='NVO' WHERE  
          --IDTLOTFAC=vidtlotfac AND IDTTRNTYP=vidttrntyp AND fchath=vfchath
           idtodt =TO_NUMBER(clave2) ;--and edoodt is null;
          COMMIT;
       
       
       
           valdata.put('status',1);
                       valdata.put('msg','Se Actualizo Estatus');
                        valdata.put('clave2',clave2);
                        -- valdata.put('clave',clave2);
       ELSE IF cambio ='estatusrutalocal' then
        valdata.put('status',0);
                       valdata.put('msg','Se Actualizo Estatus (opcion pendiente por evaluar');
                        valdata.put('clave2',clave2);
                        valdata.put('val',val);
       ELSE
        valdata.put('status',0);
                       valdata.put('msg','No se Actualizo Estatus - opcion no valida');
                       -- valdata.put('val',val);
                        -- valdata.put('clave',clave2);
       END IF;
        END IF;
        END IF;
         END IF;
             ELSE
   valdata.put('status',0);
            --valdata.put('opcion',estadoValidar);
             valdata.put('error','Token expirado o usuario no permitido');
					valdata.put('msg','No se pudo cambiar estatus');
    end if;           
                    
      
    return '['||valdata.to_char()||']';
    EXCEPTION
		when OTHERS then
			--return jmsgerr('wCVN0003');
      	gobj:=json();
		gobj.put('msg','ocurrio un error en la accion actualizar estatus');
    gobj.put('error',SQLERRM);
    gobj.put('lineaError',' lineaError -> '||DBMS_UTILITY.Format_Error_BackTrace);
    gobj.put('status',0);
    gobj.put('clave',clave2);
    gobj.put('cambio',cambio);
        return '['||gobj.to_char()||']';
	END;
/*  __________________________________________________________________________________________________  */
/*  __________________________________________________________________________________________________  */

	FUNCTION ChangeStatusAsignacion(clave2 in number, val in number, cambio varchar2,token in varchar2)  RETURN clob IS
  PRAGMA AUTONOMOUS_TRANSACTION;
    valdata json; 
    
      descifrar VARCHAR2(4000);
          jsondescifrar json;
           servicios json;
            servi_LCT json;
          --agente_IDTAGT VARCHAR2(20);
         -- iduser number(10);
         useradmin number(10);
           existeuser number(10);
             	BEGIN 
              descifrar:=UTILERIA_CIFRAR.DESCIFRAR(token);
      jsondescifrar:= json(descifrar);
      --agente_IDTAGT:=json_ext.get_string(jsondescifrar,'IDTAGT');
      --iduser :=json_ext.get_number(jsondescifrar,'iduser');
       servicios  :=json_ext.get_json(jsondescifrar,'servicios'); 
       servi_LCT  :=json_ext.get_json(servicios,'lct');
       useradmin  :=json_ext.get_number(servi_LCT,'admin'); 
              
              
             valdata:=json();
              if ValidaToken(descifrar) and useradmin=1 then 
             
             IF cambio='eliminar' THEN
       UPDATE  LCT_RUTA_TO_USER SET ESTATUS=0 WHERE IDUSER=(SELECT ID_USER FROM LCT_USER WHERE CLAVE = clave2) AND IDTODT=val;
        COMMIT; 
          valdata.put('status',1);
                      valdata.put('msg','Se desasigno el lecturista');
                       -- valdata.put('val',val);
                       --  valdata.put('clave',clave2);
       ELSE IF cambio='agregar' THEN
       
       SELECT COUNT(*) INTO existeuser FROM LCT_RUTA_TO_USER 
       WHERE IDUSER=(SELECT ID_USER FROM LCT_USER WHERE CLAVE = clave2) AND IDTODT=val AND  ESTATUS=0;
       IF existeuser =0 THEN
       INSERT INTO LCT_RUTA_TO_USER
         (ID_RUTA_A_USER,IDTODT,IDUSER,ESTATUS ) 
          VALUES (LCT_SQRUTATOUSER.NEXTVAL, val,(SELECT ID_USER FROM LCT_USER WHERE CLAVE = clave2) , 1); 
            COMMIT;
           valdata.put('status',1);
                       valdata.put('msg','Se agrego el lecturista');
       ELSE
        UPDATE  LCT_RUTA_TO_USER SET ESTATUS=1 WHERE IDUSER=(SELECT ID_USER FROM LCT_USER WHERE CLAVE = clave2) AND IDTODT=val;
        COMMIT; 
         valdata.put('status',1);
                       valdata.put('msg','Se asigno el lecturista');
       END IF;
          
        --   valdata.put('status',1);
                  --     valdata.put('msg','Se desasigno el lecturista');
                       -- valdata.put('val',val);
                        -- valdata.put('clave',clave2);
      
       ELSE
        valdata.put('status',0);
                       valdata.put('msg','No se Actualizo Estatus - opcion no valida');
                       -- valdata.put('val',val);
                        -- valdata.put('clave',clave2);
       END IF;
        END IF;
      
             ELSE
   valdata.put('status',0);
            --valdata.put('opcion',estadoValidar);
             valdata.put('error','Token expirado o usuario no permitido');
					valdata.put('msg','No se pudo cambiar estatus');
    end if;           
                    
      
    return '['||valdata.to_char()||']';
    EXCEPTION
		when OTHERS then
			--return jmsgerr('wCVN0003');
      	gobj:=json();
		gobj.put('msg','ocurrio un error en la accion actualizar estatus');
    gobj.put('error',SQLERRM);
    gobj.put('status',0);
        return '['||gobj.to_char()||']';
	END;
/*  __________________________________________________________________________________________________  */
/*  __________________________________________________________________________________________________  */

	FUNCTION addRutaLocalAsginacion(datos in varchar2, token in varchar2)  RETURN clob IS
  PRAGMA AUTONOMOUS_TRANSACTION;
    valdata json;
    TOT NUMBER(1):=0;
    datos2 json;
       reple varchar2(5000);
        
         fecha  varchar2(5000);
        etiqueta varchar2(30);
        ruta LCT_ASIGRUTAS.IDTTRNTYP%TYPE;
         lote LCT_ASIGRUTAS.IDTLOTFAC%TYPE;
          centroOperacion LCT_ASIGRUTAS.IDTCNTOPR%TYPE;
        
         descifrar VARCHAR2(4000);
          jsondescifrar json;
           servicios json;
            servi_LCT json;
              --lecturista json;
              medidor json_list;
                ArrayContraro json_list;
          agente_IDTAGT VARCHAR2(20);
         -- iduser number(10);
          --keyvalue number(38);
           namekeyvalue  VARCHAR2(200);
         useradmin number(10);
         -- IDRUTA number(10):=0;
          -- IDUSER1 number(10):=0;
           --ContSc NUMBER (10):=0;
     
    	BEGIN 
       descifrar:=UTILERIA_CIFRAR.DESCIFRAR(token);
      jsondescifrar:= json(descifrar);
      agente_IDTAGT:=json_ext.get_string(jsondescifrar,'IDTAGT');
      --iduser :=json_ext.get_number(jsondescifrar,'iduser');
       servicios  :=json_ext.get_json(jsondescifrar,'servicios'); 
       servi_LCT  :=json_ext.get_json(servicios,'lct');
       useradmin  :=json_ext.get_number(servi_LCT,'admin');  
       
        namekeyvalue:=json_ext.get_string(servi_LCT,'key');--ID Centro operaciona x7
        --keyvalue  :=json_ext.get_number(servi_LCT,'key_value');  
         centroOperacion  :=TO_CHAR(json_ext.get_number(servi_LCT,'key_value'));  
       
      IF ValidaToken(descifrar) and useradmin=1 THEN 
      
          reple:= REPLACE(datos, ';quot;','"');
           IF not vjson(reple) then return jmsgerr('LCT001'); end IF;
             valdata:=json();
       datos2:=json(reple);              
          etiqueta:=json_ext.get_string(datos2,'label');
        --  ruta:=json_ext.get_string(datos2,'ruta');
           --lote:=json_ext.get_string(datos2,'lote');
           -- fecha:=json_ext.get_string(datos2,'date');
            -- lecturista  :=json_ext.get_json(datos2,'lecturista');
              medidor :=json_list (datos2.get ('medidor'));
              ArrayContraro:=json_list (datos2.get ('contrato'));
             
          
          SELECT COUNT(*) TOTAL INTO TOT FROM APP.LCT_RTALOCAL WHERE NOMBRERL=etiqueta;
      IF TOT=0 THEN        
         --  INSERT INTO LCT_ASIGRUTAS 
         ----  (IDTODT, IDTLOTFAC,IDTTRNTYP,IDTCNTOPR, FCHASG,EDOASR) 
            --     VALUES (LCT_SQASI.NEXTVAL, lote,ruta,centroOperacion,TO_DATE(fecha,'dd/mm/yyyy'),'0');
              --        COMMIT; 
              
              if  medidor.COUNT!=0 then
              
                      valdata.put('status',1);
                       valdata.put('msg','Se creo la ruta local');
               valdata.put('medidor',medidor);
                valdata.put('contraro',ArrayContraro);
              valdata.put('datos2',datos2);
              
              INSERT INTO LCT_RTALOCAL (nombrerl,edo,fchcre,CNTOPR) VALUES (etiqueta,'NVO',SYSDATE,
              (SELECT IDTVAR   FROM app.LCT_VARIABLES where TPOVAR ='CENOPR' and valor is not null AND VALOR LIKE '%'||agente_IDTAGT||'%' and rownum <=1));
            --  COMMIT;
             valdata.put('SECUENCIA',LCT_SQRTL.currval);
           
           
         --  SELECT IDTODT INTO IDRUTA FROM LCT_ASIGRUTAS WHERE IDTTRNTYP=ruta AND FCHASG=TO_DATE(fecha,'DD/MM/YYYY');
           --  valdata.put('IDRUTA',IDRUTA);
             FOR i IN 1 .. medidor.COUNT
              loop
              begin 
             -- ContSc:=ContSc+1;
                -- SELECT ID_USER INTO IDUSER1 FROM LCT_USER WHERE CLAVE=TO_NUMBER(REPLACE(lecturista.get(i).to_char(), '"',''));
                  --   valdata.put('IDUSER1_'||i,IDUSER1);
                  --  valdata.put('lecturista_'||i, lecturista.get(i).to_char());
                  -- INSERT INTO LCT_RUTA_TO_USER
       --  (ID_RUTA_A_USER,IDASIGRUTA,IDUSER,ESTATUS ) 
        --  VALUES (LCT_SQRUTATOUSER.NEXTVAL, IDRUTA,IDUSER1 , 1);         
             --       COMMIT; 
                    
                    INSERT INTO  LCT_DETRTL(
                    idtrtl,
                 ord,
              --   idtpntlvr,
                 --IDTPNTCPG,
                 edo,
                 fchcre,
                 FCHUAC,
                 IDTCPR,
                 IDTCTR
                   
                    )
                    VALUES(
                    LCT_SQRTL.currval,
                    i,
                  -- TO_NUMBER(medidor.get(i).TO_CHAR()),
                  --TO_NUMBER( medidor.get(i).TO_CHAR()),
                 
                     'NVO',
                       SYSDATE,
                        SYSDATE,
                         TO_NUMBER( medidor.get(i).TO_CHAR()),
                          TO_NUMBER( ArrayContraro.get(i).TO_CHAR())
                                      
                    );
                    
                    
                    
                    
                 end;
               end loop;
              
                 COMMIT; 
                 
                  ELSE
            valdata.put('status',0);
             valdata.put('msg','La ruta local no contiene medidores para agregar');
           valdata.put('datos2',datos2);
        END IF;
                 
        
        ELSE
            valdata.put('status',0);
             valdata.put('msg','La ruta local ya existe, intenta con otro nombre');
           valdata.put('datos2',datos2);
        END IF;
       ELSE
   valdata.put('status',0);
            --valdata.put('opcion',estadoValidar);
             valdata.put('error','Token expirado o usuario no permitido');
					valdata.put('msg','No se pudo agregar');
    end IF;  
        -- valdata.put('activo','activo');
       
   -- valdata.put('datos',datos2);
    --valdata.put('token',token);
   
  
     
    return '['||valdata.to_char()||']';
    EXCEPTION
		when OTHERS then
			--return jmsgerr('wCVN0003');
      	gobj:=json();
        gobj.put('msg','ocurrio un error en la accion');
		gobj.put('datos',datos);
    gobj.put('error',SQLERRM);
      gobj.put('lineaError',' lineaError -> '||DBMS_UTILITY.Format_Error_BackTrace);
    gobj.put('status',0);
        return '['||gobj.to_char()||']';
	END;
/*  __________________________________________________________________________________________________  */
/*  __________________________________________________________________________________________________  */

	FUNCTION editarRutaLocalAsginacion(datos in varchar2, token in varchar2)  RETURN clob IS
  PRAGMA AUTONOMOUS_TRANSACTION;
    valdata json;
    TOT NUMBER(1):=0;
    datos2 json;
       reple varchar2(5000);
        
         fecha  varchar2(5000);
        etiqueta varchar2(30);
         idlabel number(10);
        ruta LCT_ASIGRUTAS.IDTTRNTYP%TYPE;
         lote LCT_ASIGRUTAS.IDTLOTFAC%TYPE;
          centroOperacion LCT_ASIGRUTAS.IDTCNTOPR%TYPE;
        
         descifrar VARCHAR2(4000);
          jsondescifrar json;
           servicios json;
            servi_LCT json;
              --lecturista json;
              medidor json_list;
              Arraycontrato json_list;
          agente_IDTAGT VARCHAR2(20);
         -- iduser number(10);
          --keyvalue number(38);
           namekeyvalue  VARCHAR2(200);
         useradmin number(10);
         -- IDRUTA number(10):=0;
          -- IDUSER1 number(10):=0;
           --ContSc NUMBER (10):=0;
     
    	BEGIN 
       descifrar:=UTILERIA_CIFRAR.DESCIFRAR(token);
      jsondescifrar:= json(descifrar);
      agente_IDTAGT:=json_ext.get_string(jsondescifrar,'IDTAGT');
      --iduser :=json_ext.get_number(jsondescifrar,'iduser');
       servicios  :=json_ext.get_json(jsondescifrar,'servicios'); 
       servi_LCT  :=json_ext.get_json(servicios,'lct');
       useradmin  :=json_ext.get_number(servi_LCT,'admin');  
       
        namekeyvalue:=json_ext.get_string(servi_LCT,'key');--ID Centro operaciona x7
        --keyvalue  :=json_ext.get_number(servi_LCT,'key_value');  
         centroOperacion  :=TO_CHAR(json_ext.get_number(servi_LCT,'key_value'));  
       
      IF ValidaToken(descifrar) and useradmin=1 THEN 
      
          reple:= REPLACE(datos, ';quot;','"');
           IF not vjson(reple) then return jmsgerr('LCT001'); end IF;
             valdata:=json();
       datos2:=json(reple);              
          etiqueta:=json_ext.get_string(datos2,'label');
           idlabel:=to_number(json_ext.get_string(datos2,'idlabel'));
        --  ruta:=json_ext.get_string(datos2,'ruta');
           --lote:=json_ext.get_string(datos2,'lote');
           -- fecha:=json_ext.get_string(datos2,'date');
            -- lecturista  :=json_ext.get_json(datos2,'lecturista');
              medidor :=json_list (datos2.get ('medidor'));
               Arraycontrato :=json_list (datos2.get ('contrato'));
             
          
          SELECT COUNT(*) TOTAL INTO TOT FROM APP.LCT_RTALOCAL WHERE IDTRTL=idlabel and EDO='NVO';
      IF TOT!=0 THEN        
         --  INSERT INTO LCT_ASIGRUTAS 
         ----  (IDTODT, IDTLOTFAC,IDTTRNTYP,IDTCNTOPR, FCHASG,EDOASR) 
            --     VALUES (LCT_SQASI.NEXTVAL, lote,ruta,centroOperacion,TO_DATE(fecha,'dd/mm/yyyy'),'0');
              --        COMMIT;  
              
              IF medidor.COUNT!= 0 THEN
                      valdata.put('status',1);
                       valdata.put('msg','Se  actualizo local');
               valdata.put('medidor',medidor);
                valdata.put('contrato',Arraycontrato);
              valdata.put('datos2',datos2);
               valdata.put('datalabel',idlabel);
              
            --  INSERT INTO LCT_RTALOCAL (nombrerl,edo,fchcre) VALUES (etiqueta,'NVO',SYSDATE);
            
            -- valdata.put('SECUENCIA',LCT_SQRTL.currval);
           DELETE   FROM   APP.LCT_DETRTL  WHERE  IDTRTL=idlabel ;
            COMMIT;
           
         --  SELECT IDTODT INTO IDRUTA FROM LCT_ASIGRUTAS WHERE IDTTRNTYP=ruta AND FCHASG=TO_DATE(fecha,'DD/MM/YYYY');
           --  valdata.put('IDRUTA',IDRUTA);
          
             FOR i IN 1 .. medidor.COUNT
              loop
              begin 
             -- ContSc:=ContSc+1;
                -- SELECT ID_USER INTO IDUSER1 FROM LCT_USER WHERE CLAVE=TO_NUMBER(REPLACE(lecturista.get(i).to_char(), '"',''));
                  --   valdata.put('IDUSER1_'||i,IDUSER1);
                  --  valdata.put('lecturista_'||i, lecturista.get(i).to_char());
                  -- INSERT INTO LCT_RUTA_TO_USER
       --  (ID_RUTA_A_USER,IDASIGRUTA,IDUSER,ESTATUS ) 
        --  VALUES (LCT_SQRUTATOUSER.NEXTVAL, IDRUTA,IDUSER1 , 1);         
             --       COMMIT; 
                    
                    INSERT INTO  LCT_DETRTL(
                    idtrtl,
                 ord,
               --  idtpntlvr,
               --  IDTPNTCPG,
                 edo,
                 fchcre,
                 FCHUAC,
                 IDTCPR,
                 IDTCTR
                   
                    )
                    VALUES(
                    idlabel,
                    i,
                 --  TO_NUMBER(medidor.get(i).TO_CHAR()),
                 -- TO_NUMBER( medidor.get(i).TO_CHAR()),
                 
                     'NVO',
                       SYSDATE,
                        SYSDATE,
                        TO_NUMBER( medidor.get(i).TO_CHAR()),
                         TO_NUMBER( Arraycontrato.get(i).TO_CHAR())
                                      
                    );
                    
                    
                    
                    
                 end;
               end loop;
                      COMMIT; 
                     
         ELSE
            valdata.put('status',0);
             valdata.put('msg','La ruta local no contiene medidores para agregar');
           valdata.put('datos2',datos2);
        END IF;
        
        
        ELSE
            valdata.put('status',0);
             valdata.put('msg','La ruta local ya asignada, intenta actualizar cuando no este en uso');
           valdata.put('datos2',datos2);
        END IF;
       ELSE
   valdata.put('status',0);
            --valdata.put('opcion',estadoValidar);
             valdata.put('error','Token expirado o usuario no permitido');
					valdata.put('msg','No se pudo agregar');
    end IF;  
        -- valdata.put('activo','activo');
       
   -- valdata.put('datos',datos2);
    --valdata.put('token',token);
   
  
     
    return '['||valdata.to_char()||']';
    EXCEPTION
		when OTHERS then
			--return jmsgerr('wCVN0003');
      	gobj:=json();
        gobj.put('msg','ocurrio un error en la accion');
		gobj.put('datos',datos);
    gobj.put('error',SQLERRM);
      gobj.put('lineaError',' lineaError -> '||DBMS_UTILITY.Format_Error_BackTrace);
    gobj.put('status',0);
        return '['||gobj.to_char()||']';
	END;
/*  __________________________________________________________________________________________________  */
/*  __________________________________________________________________________________________________  */

	FUNCTION ordenSecuencia(datos in varchar2, token in varchar2)  RETURN clob IS
  PRAGMA AUTONOMOUS_TRANSACTION;
    valdata json;
    TOT NUMBER(1):=0;
    datos2 json;
       reple varchar2(5000);
        cadena clob;
         fecha  varchar2(5000);
        etiqueta varchar2(30);
         vruta number(10);
        ruta LCT_ASIGRUTAS.IDTTRNTYP%TYPE;
         lote LCT_ASIGRUTAS.IDTLOTFAC%TYPE;
          centroOperacion LCT_ASIGRUTAS.IDTCNTOPR%TYPE;
        
         descifrar VARCHAR2(4000);
          jsondescifrar json;
           servicios json;
            servi_LCT json;
              --lecturista json;
              medidor json_list;
          agente_IDTAGT VARCHAR2(20);
         -- iduser number(10);
          --keyvalue number(38);
           namekeyvalue  VARCHAR2(200);
         useradmin number(10);
         -- IDRUTA number(10):=0;
          -- IDUSER1 number(10):=0;
           --ContSc NUMBER (10):=0;
     
    	BEGIN 
       descifrar:=UTILERIA_CIFRAR.DESCIFRAR(token);
      jsondescifrar:= json(descifrar);
      agente_IDTAGT:=json_ext.get_string(jsondescifrar,'IDTAGT');
      --iduser :=json_ext.get_number(jsondescifrar,'iduser');
       servicios  :=json_ext.get_json(jsondescifrar,'servicios'); 
       servi_LCT  :=json_ext.get_json(servicios,'lct');
       useradmin  :=json_ext.get_number(servi_LCT,'admin');  
       
        namekeyvalue:=json_ext.get_string(servi_LCT,'key');--ID Centro operaciona x7
        --keyvalue  :=json_ext.get_number(servi_LCT,'key_value');  
         centroOperacion  :=TO_CHAR(json_ext.get_number(servi_LCT,'key_value'));  
       
      IF ValidaToken(descifrar) and useradmin=1 THEN 
      
          reple:= REPLACE(datos, ';quot;','"');
           IF not vjson(reple) then return jmsgerr('LCT001'); end IF;
             valdata:=json();
       datos2:=json(reple);              
          etiqueta:=json_ext.get_string(datos2,'label');
           vruta:=json_ext.get_number(datos2,'ruta');
 
              medidor :=json_list (datos2.get ('secuencia'));
             
          
         -- SELECT COUNT(*) TOTAL INTO TOT FROM APP.LCT_RTALOCAL WHERE IDTRTL=vruta and EDO='NVO';
     -- IF TOT!=0 THEN        
                           valdata.put('status',1);
                       valdata.put('msg','Se  re-ordeno la ruta local');
               valdata.put('medidor',medidor);
              valdata.put('datos2',datos2);
               valdata.put('vruta',vruta);
     
             FOR i IN 1 .. medidor.COUNT
              loop
              begin 
              -- valdata.put('secuencia||i',vruta);
          update app.lct_detrtl set ORD=json_ext.get_number(json(medidor.get(i)),'Nuevoorden') where IDTRTL=vruta and IDTCPR=json_ext.get_number(json(medidor.get(i)),'IdMedidor');
         
                   COMMIT; 
                   
                    
                 end;
               end loop;
                      COMMIT; 
                      
                     
        /*
        ELSE
            valdata.put('status',0);
             valdata.put('msg','ruta local (bitacora) orden de secuencia');
           valdata.put('datos2',datos2);
            valdata.put('vruta',vruta);
        END IF;
        */
       ELSE
   valdata.put('status',0);
            --valdata.put('opcion',estadoValidar);
             valdata.put('error','Token expirado o usuario no permitido');
					valdata.put('msg','No se pudo ordenar');
    end IF;  
        -- valdata.put('activo','activo');
       
   -- valdata.put('datos',datos2);
    --valdata.put('token',token);
   
         cadena := empty_clob();
  dbms_lob.createtemporary(cadena, true);
  valdata.to_clob(cadena, true);
          
       RETURN  '['||cadena||']';
     
    --return '['||valdata.to_char()||']';
    EXCEPTION
		when OTHERS then
			--return jmsgerr('wCVN0003');
      	gobj:=json();
        gobj.put('msg','ocurrio un error en la accion');
		gobj.put('datos',datos);
    gobj.put('error',SQLERRM);
      gobj.put('lineaError',' lineaError -> '||DBMS_UTILITY.Format_Error_BackTrace);
    gobj.put('status',0);
        return '['||gobj.to_char()||']';
	END;
/*  __________________________________________________________________________________________________  */

/*  __________________________________________________________________________________________________  */

---------------funciones mobile -------------------------------------------------------------------------
/*  __________________________________________________________________________________________________  */

	FUNCTION buscar_usuario (Vusuario in varchar2, passw in varchar2) RETURN varchar2 IS
	     PRAGMA AUTONOMOUS_TRANSACTION;
      identificador    LCT_USER.ID_USER%TYPE;
     mail    LCT_USER.EMAIL%TYPE;
      nameusuario    LCT_USER.NOMBRE%TYPE;
      F_resgistro    LCT_USER.FECHAIN%TYPE;
      v_APATERNO   LCT_USER.APATERNO%TYPE;
       Serv    LGN_SERVICIO.SERVICIO%TYPE;
           cadena clob;    lista json_list;
       
       -- CURSOR c_x7 is
       -- SELECT trim(NOM) n FROM  X7.AGT where IDTAGT='2158';
        --SELECT USER_EMAIL as n from  APP.LGN_USER;
        --select * from webx7.www_infoclient_view where CLIENTE='231231';
        --select * from x7.agt where nomcnx='MCALAN';
        -- select * from x7.fct;
        --SELECT * FROM  X7.AGT 
--select * from x7.fct;
--select * from x7.prf;
--select * from x7.hbl;
	permisosjson json ;  serviciosjson json ; varjson json ; 
	BEGIN
    	gobj:=json();  serviciosjson:=json(); varjson:=json(); 
      ----------------------------busco usuario
     /* SELECT id_user,USER_EMAIL,DISPLAY_NAME,TO_CHAR(USER_REGISTRADO,'DD/MM/YYYY') 
      into identificador,mail,nameusuario,F_resgistro 
      from APP.LGN_USER  
      WHERE (USER_EMAIL=usuario OR USER_LOGIN=usuario) and (USER_PASS=passw OR USER_PASS=UTILERIA_CIFRAR.CIFRAR(passw));
     */ 
      SELECT ID_USER id_user,EMAIL USER_EMAIL,NOMBRE DISPLAY_NAME, TO_CHAR(FECHAIN,'DD/MM/YYYY') , APATERNO
      into identificador,mail,nameusuario,F_resgistro , v_APATERNO
      from APP.LCT_USER 
      WHERE (EMAIL=  TRIM(Vusuario) OR USUARIO= TRIM(Vusuario)) and (PASS=passw OR PASS=UTILERIA_CIFRAR.CIFRAR(passw)) 
      and ESTATUS=1;
      
      IF identificador  IS NOT NULL THEN
      UPDATE LCT_USER SET LAST_CONEXION=SYSDATE WHERE ID_USER=identificador;
      COMMIT;
      END IF;
      
     DECLARE 
       ----------------------------busco PERMISOS
    CURSOR C_permisos IS SELECT ID_SERVICIO,ADMINISTRADOR,OPERATIVO,SUPERVISOR,INVITADO,KEY,KEY_VALUE,KEY_DESCRIPTION
      --into lgn_Admin,lgn_Operativo,lgn_Supervis,lgn_Invitado,lgn_Key,lgn_Key_value,lgn_Key_descrip
      from APP.LGN_PERMISO  
      WHERE ID_USER=identificador;
     -- contar NUMBER(10):=0;
           BEGIN         
        FOR indice IN C_permisos LOOP
       -- contar:=contar+1;
        permisosjson:=json();
      
        permisosjson.put('admin',indice.ADMINISTRADOR);
        permisosjson.put('supervisor',indice.SUPERVISOR);
      permisosjson.put('operativo',indice.OPERATIVO);
       permisosjson.put('invitado',indice.INVITADO);
        permisosjson.put('key',indice.KEY);
         permisosjson.put('key_value',indice.KEY_VALUE);
          permisosjson.put('key_description',indice.KEY_DESCRIPTION);
        --------------------------------------------------------------------------------------            
               DECLARE 
                SERV    LGN_SERVICIO.SERVICIO%TYPE;
                begin
                  SELECT SERVICIO  INTO SERV   from APP.LGN_SERVICIO   WHERE ID_SERVICIO=indice.ID_SERVICIO;
                   serviciosjson.put(SERV,permisosjson);   
                 END;
                    
              END LOOP;
              END;  
   --------------------------------------------------------------------------------------   
               DECLARE 
                IDTAGT_ID    X7.AGT.IDTAGT%TYPE;
                begin
                  SELECT IDTAGT INTO IDTAGT_ID FROM X7.AGT WHERE nomcnx=upper(Vusuario) OR EMAIL=Vusuario OR EMAIL=upper(Vusuario) ;
                   gobj.put('IDTAGT',IDTAGT_ID);   
                   EXCEPTION 
                	when NO_DATA_FOUND then
                  gobj.put('IDTAGT',IDTAGT_ID); 
                 END;
      
       --------------------------------------------------------------------------------------   
        --------------------------------------------------------------------------------------   
               DECLARE 
                --IDTAGT_ID    X7.AGT.IDTAGT%TYPE;
                varjson2 json ;
                 CURSOR C_var is  
                 SELECT * FROM LCT_VARIABLES  ;
                begin
              
                  FOR iv IN C_var LOOP
                   varjson2:=json();
                   varjson2.put('idtvar',iv.idtvar); 
                    varjson2.put('tpovar',iv.tpovar);
                    varjson2.put('valor',iv.valor);
                     varjson2.put('descripcion',iv.descripcion);
                     
                       varjson.put(iv.idtvar,varjson2);
                     
                   END LOOP;
                 
                 
                    
                   --EXCEPTION 
                	--when NO_DATA_FOUND then
                 -- varjson.put('idtvar',null); 
                 END;
      
       --------------------------------------------------------------------------------------  
       
       
      gobj.put('status',1);   
       --lista.append(''||gobj.to_char()||'');
        gobj.put('iduser',identificador);
       --  gobj.put('usuario',Vusuario);
       gobj.put('mail',mail);
       gobj.put('display_name',nameusuario||' '||v_APATERNO);
        gobj.put('fechaRegistro', TO_CHAR(F_resgistro,'DD/MM/YYYY') );
        -- gobj.put('servicios',serviciosjson);
         
         -- gobj.put('timeNow', TO_CHAR(sysdate,'DD/MM/YYYY'));
          gobj.put('timeNow', sysdate);
          --gobj:=json();
          -- lista.append(Permi);
         --gobj.put('oratkn descifrado',UTILERIA_CIFRAR.DESCIFRAR('B6874EA7027FFA533F8A9D8004174B85'));
         gobj.put('oratkn',UTILERIA_CIFRAR.CIFRAR(gobj.to_char()));
          gobj.put('var',varjson);
          
            cadena := empty_clob();
  dbms_lob.createtemporary(cadena, true);
  gobj.to_clob(cadena, true);
          
       RETURN  '['||cadena||']';
      --cadena:='['||gobj.to_char()||','||gobj.to_char()||']';
		--RETURN cadena;
	EXCEPTION 
		when NO_DATA_FOUND then
   -- return jmsgerr('LCTMB004');
     gobj:=json();
        	gobj.put('msg','usuario no encontrado');
				gobj.put('usuario',Vusuario);
      gobj.put('pass',passw);
    gobj.put('status',0);
     RETURN '['||gobj.to_char()||']';
     
     	when OTHERS then
		gobj:=json();
        	gobj.put('msg','Por favor reporte este error al adminitrador de la aplicacion');
			gobj.put('error',SQLERRM);
    gobj.put('status','0');
    gobj.put('lineaError',' lineaError -> '||DBMS_UTILITY.Format_Error_BackTrace);
     RETURN '['||gobj.to_char()||']';
	END;  
/*  __________________________________________________________________________________________________  */
/*  __________________________________________________________________________________________________  */

	FUNCTION buscar_usuario_token (Vusuario in varchar2, passw in varchar2,  vimei in varchar2) RETURN VARCHAR2 IS
	     PRAGMA AUTONOMOUS_TRANSACTION;
      identificador    LCT_USER.ID_USER%TYPE;
     mail    LCT_USER.EMAIL%TYPE;
      nameusuario    LCT_USER.NOMBRE%TYPE;
      F_resgistro    LCT_USER.FECHAIN%TYPE;
      v_APATERNO   LCT_USER.APATERNO%TYPE;
       Serv    LGN_SERVICIO.SERVICIO%TYPE;
           cadena clob;    lista json_list;
  
	permisosjson json ;  serviciosjson json ; varjson json ; 
	BEGIN
    	gobj:=json();  serviciosjson:=json(); varjson:=json(); 
  
      SELECT ID_USER id_user,EMAIL USER_EMAIL,NOMBRE DISPLAY_NAME, TO_CHAR(FECHAIN,'DD/MM/YYYY') , APATERNO
      into identificador,mail,nameusuario,F_resgistro , v_APATERNO
      from APP.LCT_USER 
      WHERE (EMAIL=  TRIM(Vusuario) OR USUARIO= TRIM(Vusuario)) and (PASS=passw OR PASS=UTILERIA_CIFRAR.CIFRAR(passw)) 
      and ESTATUS=1;
      
      IF identificador  IS NOT NULL THEN
      UPDATE LCT_USER SET LAST_CONEXION=SYSDATE WHERE ID_USER=identificador;
      COMMIT;
      END IF;
      
     DECLARE 
       ----------------------------busco PERMISOS
    CURSOR C_permisos IS SELECT ID_SERVICIO,ADMINISTRADOR,OPERATIVO,SUPERVISOR,INVITADO,KEY,KEY_VALUE,KEY_DESCRIPTION
      --into lgn_Admin,lgn_Operativo,lgn_Supervis,lgn_Invitado,lgn_Key,lgn_Key_value,lgn_Key_descrip
      from APP.LGN_PERMISO  
      WHERE ID_USER=identificador;
     -- contar NUMBER(10):=0;
           BEGIN         
        FOR indice IN C_permisos LOOP
       -- contar:=contar+1;
        permisosjson:=json();
      
        permisosjson.put('admin',indice.ADMINISTRADOR);
        permisosjson.put('supervisor',indice.SUPERVISOR);
      permisosjson.put('operativo',indice.OPERATIVO);
       permisosjson.put('invitado',indice.INVITADO);
        permisosjson.put('key',indice.KEY);
         permisosjson.put('key_value',indice.KEY_VALUE);
          permisosjson.put('key_description',indice.KEY_DESCRIPTION);
        --------------------------------------------------------------------------------------            
               DECLARE 
                SERV    LGN_SERVICIO.SERVICIO%TYPE;
                begin
                  SELECT SERVICIO  INTO SERV   from APP.LGN_SERVICIO   WHERE ID_SERVICIO=indice.ID_SERVICIO;
                   serviciosjson.put(SERV,permisosjson);   
                 END;
                    
              END LOOP;
              END;  
   --------------------------------------------------------------------------------------   
               DECLARE 
                IDTAGT_ID    X7.AGT.IDTAGT%TYPE;
                begin
                  SELECT IDTAGT INTO IDTAGT_ID FROM X7.AGT WHERE nomcnx=upper(Vusuario) OR EMAIL=Vusuario OR EMAIL=upper(Vusuario) ;
                   gobj.put('IDTAGT',IDTAGT_ID);   
                   EXCEPTION 
                	when NO_DATA_FOUND then
                  gobj.put('IDTAGT',IDTAGT_ID); 
                 END;
      
       --------------------------------------------------------------------------------------   
      
       
      gobj.put('status',1);   
       --lista.append(''||gobj.to_char()||'');
        gobj.put('iduser',identificador);
         gobj.put('vimei',vimei);
       gobj.put('mail',mail);
       gobj.put('display_name',nameusuario||' '||v_APATERNO);
        gobj.put('fechaRegistro', TO_CHAR(F_resgistro,'DD/MM/YYYY') );

          gobj.put('timeNow', sysdate);

         --gobj.put('oratkn',UTILERIA_CIFRAR.CIFRAR(gobj.to_char()));
       
          
            cadena := empty_clob();
  dbms_lob.createtemporary(cadena, true);
  gobj.to_clob(cadena, true);
          
      RETURN UTILERIA_CIFRAR.CIFRAR(gobj.to_char());
        --RETURN  '['||cadena||']';
		--RETURN cadena;
	EXCEPTION 
		when NO_DATA_FOUND then
   -- return jmsgerr('LCTMB004');
     gobj:=json();
        	gobj.put('msg','usuario no encontrado');
				gobj.put('usuario',Vusuario);
      gobj.put('pass',passw);
    gobj.put('status',0);
       RETURN  UTILERIA_CIFRAR.CIFRAR(gobj.to_char());
     
     	when OTHERS then
		gobj:=json();
        	gobj.put('msg','Por favor reporte este error al adminitrador de la aplicacion');
			gobj.put('error',SQLERRM);
    gobj.put('status','0');
    gobj.put('lineaError',' lineaError -> '||DBMS_UTILITY.Format_Error_BackTrace);
       RETURN  UTILERIA_CIFRAR.CIFRAR(gobj.to_char());
	END;  
/*  __________________________________________________________________________________________________  */

        /*  __________________________________________________________________________________________________  */
FUNCTION get_ordenTrabajo (  oratkn varchar2) RETURN clob IS
	cadena			clob;
	temp			json;
	temp2			json;
	respuesta		json;
	--datacliente		json;
  
  jsondescifrar json;
  --jsonservicios json;
 -- jsonservicios_ref json;
   descifrar VARCHAR2(4000);
     -- agente_IDTAGT VARCHAR2(20);
     iduser number(10);
     vimei VARCHAR2(30);
   --    servicios_ref_admin number(10);
    --     servicios_ref_operativo number(10);
     validaimei number(10);
     vtotalcursor number (10):=0;
			BEGIN
      
       descifrar:=UTILERIA_CIFRAR.DESCIFRAR(oratkn);
    
      temp2 :=json();
        respuesta :=json();
        jsondescifrar:= json(descifrar);
       if ValidaToken(descifrar) then 
        
        respuesta.put('msg','todo ok');
          iduser:=json_ext.get_number(jsondescifrar,'iduser');
           vimei:=json_ext.get_string(jsondescifrar,'vimei');
             respuesta.put('iduser',iduser);
           
            SELECT COUNT (*)  INTO validaimei  FROM APP.LCT_MOBILE WHERE IMEI=vimei  AND EDOOPR='1';
       IF validaimei!=0 THEN
         ----------------------------------------------------------- 
         DECLARE
            --   CURSOR C_ODT IS  SELECT * FROM LCT_ORDENES WHERE IDTUSRLCT=iduser AND EDOODT='NVO';
             CURSOR C_ODT IS    SELECT * FROM LCT_ORDENES WHERE  (IDTUSRLCT=iduser or IDTODT IN ( SELECT  IDTODT   FROM app.lct_ruta_to_user where IDUSER=iduser and ESTATUS=1))  AND
       EDOODT='NVO' ;
               
               
                    BEGIN
                     
                 FOR ind IN C_ODT LOOP
                 vtotalcursor:= 1;
                        temp :=json();
                         --  temp.put('idtodt',ind.idtodt);
                           -- temp.put('uso',ind.idtlotfac);
                           
                            
                            if ind.IDTLOTFAC is null then
                                    declare
                                    vNOMBRERL varchar2(300);
                                    begin
                                    select NOMBRERL into vNOMBRERL from app.lct_rtalocal where IDTRTL=ind.idttrntyp;
                                       temp.put('Ruta',vNOMBRERL);
                                    end;
                                    else
                                     temp.put('Ruta',ind.idttrntyp);
                                    end if;
                            
                            
                            
                            
                               DECLARE
                                temp3  json ;
                                  LECT  json ;
                        -- CURSOR C_ODT IS  SELECT * FROM LCT_ORDENES WHERE IDTUSRLCT=iduser AND EDOODT='NVO';
                        CURSOR C_medidor IS  SELECT * FROM LCT_LECTURAS where IDTODT =ind.idtodt
                        -- AND EDOATL='NVO' 
                        --and ROWNUM<60 
                        ORDER BY idtlec DESC;
                              BEGIN
                             LECT :=json();
                                FOR iv IN C_medidor LOOP
                                 temp3 :=json();
                                  temp3.put('idtlec' ,iv.idtlec);
                                   temp3.put('IDTCPR' ,iv.IDTCPR);
                                  
                                   temp3.put('secuencia' ,iv.rng1);-- secuencia
                                    temp3.put('giro' ,iv.giro);
                                   -- temp3.put('coordx' ,iv.coordx);
                                   -- temp3.put('coordy' ,iv.coordy);
                                     temp3.put('cliente' ,iv.idtclt);
                                      temp3.put('medidor' ,iv.numcpr);
                                                                        
                                      temp3.put('idtctr' ,iv.idtctr);
                                      temp3.put('LECTURAPROM' ,iv.LECTURAPROM);
                                      temp3.put('LECTURAANT' ,iv.LECTURAANT);
                                      temp3.put('direccion' ,iv.direccion);
                                      temp3.put('uso' ,iv.idtacv);
                                       temp3.put('edocliente' ,iv.edocliente);
                                        temp3.put('limitedown' ,iv.LIMINF);
                                         temp3.put('limiteup' ,iv.LIMSUP);
                                          temp3.put('EDOATL' ,iv.EDOATL);
                                          
                                          temp3.put('LIMINF2' ,iv.LIMINF2);
                                          temp3.put('LIMSUP2' ,iv.LIMSUP2);
                                          temp3.put('NRUEDAS' ,iv.NRUEDAS);
                                          temp3.put('DATCOU' ,iv.DATCOU);
                                           temp3.put('IDEDOCLIENTE' ,iv.IDEDOCLIENTE);
                                          
                                      
                                LECT.put(''||iv.idtlec,temp3);
                                 
                                
                               END LOOP;
                                temp.put('medidor',LECT);
                              END; 
                              
                             -- temp.put('rfr',ind.serie||ind.folio);
                              -- temp.put('edo',ind.edotim);
                            temp2.put(ind.idtodt,temp);
              
                       END LOOP;
              
               
              END;
   
          
         -- respuesta.put('iduser',iduser);
        
         -- respuesta.put('jsondescifrar',jsondescifrar);
        --    agente_IDTAGT:=json_ext.get_string(jsondescifrar,'IDTAGT');
      --    jsonservicios:=json_ext.get_json(jsondescifrar,'servicios');
     --     jsonservicios_ref:=json_ext.get_json(jsonservicios,'ref');
      --              servicios_ref_admin:=json_ext.get_number(jsonservicios_ref,'admin');
      --               servicios_ref_operativo:=json_ext.get_number(jsonservicios_ref,'operativo');
         --  respuesta.put('jsonservicios',jsonservicios);
           -- respuesta.put('jsonservicios_cnc',jsonservicios_cnc);
      --       respuesta.put('servicios_ref_admin',servicios_ref_admin);
	--respuesta.put('datacliente',datacliente);
  /* if servicios_ref_admin=1 or servicios_ref_operativo=1 then  
    respuesta.put('permiso','ok');
      
     
    else
      respuesta.put('permiso','negado');
    end if;
    */
   if vtotalcursor=0 then 
   respuesta.put('status',0);
    respuesta.put('msg',' No hay ODT ');
   else
	respuesta.put('status',1);
    respuesta.put('msg','ODT descargada correctamente');
  	respuesta.put('ODT',temp2);
    end if;
         ------------------------------------------------------------
         ELSE
         respuesta.put('status',0);
  	--respuesta.put('ODT',temp2);
     respuesta.put('msg',' No se pudo descagar odt imei no valido');
         END IF;
           
           
           
           
          
else
    respuesta.put('status',0);
             respuesta.put('error','Token expirado');
                    respuesta.put('msg','No se pudo descagar odt');
    end if;
	

	

	cadena := empty_clob();
	dbms_lob.createtemporary(cadena, true);
	respuesta.to_clob(cadena, true);
	--dbms_output.put_line(cadena);
	--dbms_lob.freetemporary(cadena);
	RETURN '['||cadena||']';
EXCEPTION
	when NO_DATA_FOUND then
		respuesta:=json();
		respuesta.put('status',0);
		respuesta.put('msg','No se encontro datos');
		return '['||respuesta.to_char()||']';
	when OTHERS then
		respuesta:=json();
		respuesta.put('msg','ocurrio un error.'|| ' lineaError -> '||DBMS_UTILITY.Format_Error_BackTrace );
		respuesta.put('error',SQLERRM);
		respuesta.put('lineaError',' lineaError -> '||DBMS_UTILITY.Format_Error_BackTrace);
		respuesta.put('status',0);
		return '['||respuesta.to_char()||']';
END;
/*  __________________________________________________________________________________________________  */
        /*  __________________________________________________________________________________________________  */
FUNCTION set_ordenTrabajo (  oratkn varchar2,vdata clob) RETURN clob IS
	cadena			clob;
	temp			json;
	temp2			json;
    temp3			json;
	respuesta		json;
	dataodt		json;
    datafoto		json;
    datalectura		json_list;
     datafotoarray		json_list;
  
  jsondescifrar json;
  --jsonservicios json;
 -- jsonservicios_ref json;
   descifrar VARCHAR2(4000);
     -- agente_IDTAGT VARCHAR2(20);
     iduser number(10);
      VALIDAFOTO number(10);
   --    servicios_ref_admin number(10);
    --     servicios_ref_operativo number(10);
     vimei VARCHAR2(30);
       validaimei number(10);
       totalodt  number(10);
			BEGIN
      
       descifrar:=UTILERIA_CIFRAR.DESCIFRAR(oratkn);
    
      temp3 :=json(); 
        respuesta :=json();
        jsondescifrar:= json(descifrar);
        dataodt	:=	json(vdata);
      if ValidaToken(descifrar) then 
         respuesta.put('idusuario',json_ext.get_number(dataodt,'idusuario'));
          respuesta.put('iduser',json_ext.get_number(jsondescifrar,'iduser'));
           vimei:=json_ext.get_string(jsondescifrar,'vimei');
           
           iduser:=json_ext.get_number(jsondescifrar,'iduser');
        
         SELECT COUNT (*)  INTO validaimei  FROM APP.LCT_MOBILE WHERE IMEI=vimei AND EDOOPR='1';
         
           SELECT count(*) into totalodt FROM LCT_ORDENES WHERE  (IDTUSRLCT=iduser or IDTODT IN ( SELECT  IDTODT   FROM app.lct_ruta_to_user where IDUSER=iduser and ESTATUS=1))  AND
       EDOODT='NVO' ;
         
         
       IF validaimei!=0 and totalodt!=0 THEN
         ----------------------------------------------------------- 
         
                 datalectura :=json_ext.get_json_list(dataodt,'lectura');
               -- respuesta.put('datalectura',datalectura);
                
                                    FOR Lcntr IN 1..datalectura.count
                                    LOOP
                                temp2 :=json();      
                            
                              --  temp2.put('fchlec',json_ext.get_string(json(datalectura.get(Lcntr)),'fchlec'));
                           temp2.put('idtodt',json_ext.get_number(json(datalectura.get(Lcntr)),'idtodt'));
                           temp2.put('idlec',json_ext.get_number(json(datalectura.get(Lcntr)),'idlec'));
                           -- temp2.put('lectura',json_ext.get_number(json(datalectura.get(Lcntr)),'lectura'));
                            -- temp2.put('idtanm1',json_ext.get_string(json(datalectura.get(Lcntr)),'idtanm1'));
                             -- temp2.put('idtanm2',json_ext.get_string(json(datalectura.get(Lcntr)),'idtanm2'));
                             -- temp2.put('comentario',json_ext.get_string(json(datalectura.get(Lcntr)),'comentario'));
                              
                            --  TO_DATE(json_ext.get_string(datos2,'fh_registro'),'dd/mm/yyyy HH24:MI'),
                              UPDATE APP.lct_lecturas SET 
                              fchlec=TO_DATE (json_ext.get_string(json(datalectura.get(Lcntr)),'fchlec'),'dd-mm-yyyy-HH24:MI:SS'), 
                              lectura=json_ext.get_number(json(datalectura.get(Lcntr)),'lectura'),
                              IDTANM1=json_ext.get_string(json(datalectura.get(Lcntr)),'idtanm1'),
                              IDTANM2=json_ext.get_string(json(datalectura.get(Lcntr)),'idtanm2'),
                              EDOATL=json_ext.get_string(json(datalectura.get(Lcntr)),'edo'),
                              NOTE=json_ext.get_string(json(datalectura.get(Lcntr)),'comentario'),
                               INTENTOS=json_ext.get_number(json(datalectura.get(Lcntr)),'intentos'),
                               ID_USER=iduser
                                WHERE idtodt =json_ext.get_number(json(datalectura.get(Lcntr)),'idtodt')
                                AND idtlec =json_ext.get_number(json(datalectura.get(Lcntr)),'idlec') 
                             AND edoatl in ('NVO')
                             -- AND edoatl in ('NVO','CAP','MOD')
                                ;
                               
                               datafotoarray:=json_ext.get_json_list(json(datalectura.get(Lcntr)),'foto');
                              
                               -- temp2.put('foto',json_ext.get_json(json(datalectura.get(Lcntr)),'foto'));
                                 temp2.put('datafotoarray',datafotoarray);
                                
                              
                                
                              
                               if datafotoarray is not null  then   --fotos
                              --  datafotoarray:=json_ext.get_json_list(json(datalectura.get(Lcntr)),'foto');
                            -- if datafotoarray.count !=0 then   --fotos
                             
                              --  temp2.put('foto',json_ext.get_json(json(datalectura.get(Lcntr)),'foto'));
                               -- datafoto:=json_ext.get_json(json(datalectura.get(Lcntr)),'foto');
                                -- temp2.put('contrato',json_ext.get_string(datafoto,'contrato'));
                                --  temp2.put('nombre',json_ext.get_string(datafoto,'nombre'));
                                 --  temp2.put('fecha',json_ext.get_string(datafoto,'fecha'));
                                 
                                  FOR fot IN 1..datafotoarray.count
                                    LOOP
                                   
                                   SELECT COUNT (*) INTO VALIDAFOTO FROM APP.LCT_FOTO WHERE 
                                     idtodt =json_ext.get_number(json(datalectura.get(Lcntr)),'idtodt')
                                AND idtlec =json_ext.get_number(json(datalectura.get(Lcntr)),'idlec') 
                                AND NOMBRE= json_ext.get_string(json(datafotoarray.get(fot)),'nombre');
                                IF VALIDAFOTO=0 THEN
                                   
                                   INSERT INTO APP.LCT_FOTO 
                                   ( ID,
                                   IDTODT,
                                    IDTLEC,
                                    CONTRATO,
                                    NOMBRE,
                                    FECHA)
                                   VALUES
                                   ( LCT_SQFOTO.nextval,
                                   json_ext.get_number(json(datalectura.get(Lcntr)),'idtodt'),
                                   json_ext.get_number(json(datalectura.get(Lcntr)),'idlec'),
                                   json_ext.get_string(json(datafotoarray.get(fot)),'contrato'),
                                   json_ext.get_string(json(datafotoarray.get(fot)),'nombre'),
                                   TO_DATE (json_ext.get_string(json(datafotoarray.get(fot)),'fecha'),'dd-mm-yyyy-HH24:MI:SS')
                                    );
                                  --  COMMIT;
                                    END IF;
                                    END LOOP;
                               end if;
                           
                              
                               
                                temp3.put(''||Lcntr,temp2);
                                   
                                    END LOOP;
                commit;
                
                
                      
                 
                
                 -- json_ext.get_string(json(transaccion.get(i)),'nu_operaion');
        
          --respuesta.put('jsondescifrar',jsondescifrar);
        
        
        IF datalectura.count=0 then
         respuesta.put('msg','No hay ODT para actualizar');
         respuesta.put('status',0);
        else
        respuesta.put('msg','datos recibido');
       --  respuesta.put('data',vdata);
         -- respuesta.put('dataodt',dataodt);
         
	respuesta.put('status',1);
  	respuesta.put('actualizado',temp3);
    end if;
    
    ELSE
         respuesta.put('status',0);
  	--respuesta.put('ODT',temp2);
     IF validaimei=0  THEN
      respuesta.put('msg','No se pudo cargar odt imei no valido');
     else
      respuesta.put('msg','La ODT ya no esta asignada');
     end if;
    
         END IF;
    
    
    else
    respuesta.put('status',0);
             respuesta.put('error','Token expirado');
                    respuesta.put('msg','No se pudo cargar odt. Token expirado');
    end if;
	

	

	cadena := empty_clob();
	dbms_lob.createtemporary(cadena, true);
	respuesta.to_clob(cadena, true);
	--dbms_output.put_line(cadena);
	--dbms_lob.freetemporary(cadena);
	RETURN '['||cadena||']';
EXCEPTION
	when NO_DATA_FOUND then
		respuesta:=json();
		respuesta.put('status',0);
		respuesta.put('msg','No se encontro datos');
		return '['||respuesta.to_char()||']';
	when OTHERS then
		respuesta:=json();
		respuesta.put('msg','ocurrio un error.'|| ' lineaError -> '||DBMS_UTILITY.Format_Error_BackTrace );
		respuesta.put('error',SQLERRM);
		respuesta.put('lineaError',' lineaError -> '||DBMS_UTILITY.Format_Error_BackTrace);
		respuesta.put('status',0);
		return '['||respuesta.to_char()||']';
END;
/*  __________________________________________________________________________________________________  */

    /*  __________________________________________________________________________________________________  */
FUNCTION get_datadefault (  vimei varchar2) RETURN clob IS
	cadena			clob;
	temp			json;
	temp2			json;
  temp3			json;
   temp4			json;
	respuesta		json;
	--datacliente		json;
  
  jsondescifrar json;
  --jsonservicios json;
 -- jsonservicios_ref json;
   descifrar VARCHAR2(4000);
     -- agente_IDTAGT VARCHAR2(20);
     iduser number(10);
      validaimei number(10);
       vcopr varchar2(20);
   --    servicios_ref_admin number(10);
    --     servicios_ref_operativo number(10);
			BEGIN
      
       
    
      temp2 :=json();
      temp3 :=json();
       temp4 :=json();
        respuesta :=json();
   
        SELECT COUNT (*)  INTO validaimei  FROM APP.LCT_MOBILE WHERE IMEI=vimei and  EDOOPR='1';
       IF validaimei!=0 THEN
         ----------------------------------------------------------- 
          DECLARE
          conanomalia number(10):=0;
               CURSOR C_anomalia is select codobs codigo, libabr anomalia from x7.codobs where utl=1 and OBSINT= 0 and SAICNS= 0;
                    BEGIN              
                 FOR ind IN C_anomalia LOOP
                 conanomalia :=conanomalia+1;
                        temp :=json();
                            temp.put('codigo',ind.codigo);
                            temp.put('descripcion',ind.anomalia);
                             temp2.put(conanomalia,temp);
                       END LOOP;               
              END;
     ----------------------------------------------------------- 
      ----------------------------------------------------------- 
          DECLARE
          conanomalia number(10):=0;
           CIFRADAusuario VARCHAR2(500):='';
           CIFRADApass VARCHAR2(500):='';
               CURSOR C_user is SELECT * FROM APP.LCT_USER where ESTATUS=1 and  IDTCNTOPR in (SELECT COPR     FROM APP.LCT_MOBILE WHERE IMEI=vimei AND EDOOPR='1'  
               );
                    BEGIN              
                 FOR ind IN C_user LOOP
                 conanomalia :=conanomalia+1;
                                                                                 
              SELECT dbms_obfuscation_toolkit.md5( input => UTL_RAW.cast_to_raw(ind.USUARIO))   INTO CIFRADAusuario from dual;
               SELECT dbms_obfuscation_toolkit.md5( input => UTL_RAW.cast_to_raw(ind.PASS))   INTO CIFRADApass from dual;
              
                 
                        temp :=json();
                            temp.put('idportal',ind.ID_USER);
                            temp.put('nombre',ind.NOMBRE||' '||ind.APATERNO||' '||ind.AMATERNO);
                             --temp.put('imei','111111' );
                             temp.put('token',buscar_usuario_token(ind.USUARIO,ind.PASS, vimei ) );
                             temp.put('userlogin',LOWER(CIFRADAusuario) );
                              temp.put('passwlogin',LOWER(CIFRADApass) );
                             temp3.put(conanomalia,temp);
                       END LOOP;               
              END;
     ----------------------------------------------------------- 
        ----------------------------------------------------------- 
         /* DECLARE
          conanomalia number(10):=0;
               CURSOR C_variable is SELECT * FROM LCT_VARIABLES;
                    BEGIN              
                 FOR ind IN C_variable LOOP
                 conanomalia :=conanomalia+1;
                        temp :=json();
                            temp.put('name',ind.IDTVAR);
                             temp.put('tipovalor',ind.TPOVAR );
                             temp.put('valor',ind.VALOR );
                              temp.put('descripcion',ind.DESCRIPCION );
                              temp4.put(conanomalia,temp);
                       END LOOP;               
              END;
              */
     ----------------------------------------------------------- 
      respuesta.put('msg','todo ok');
	respuesta.put('status',1);
      	respuesta.put('anomalia',temp2);
    respuesta.put('usuario',temp3);
    --respuesta.put('variable',temp4);
 ELSE 
  respuesta.put('msg','Codigo IMEI no valido');
  --respuesta.put('imei',vimei);
	respuesta.put('status',0);
 END IF;

	

	cadena := empty_clob();
	dbms_lob.createtemporary(cadena, true);
	respuesta.to_clob(cadena, true);
	--dbms_output.put_line(cadena);
	--dbms_lob.freetemporary(cadena);
	RETURN '['||cadena||']';
EXCEPTION
	when NO_DATA_FOUND then
		respuesta:=json();
		respuesta.put('status',0);
		respuesta.put('msg','No se encontro datos');
		return '['||respuesta.to_char()||']';
	when OTHERS then
		respuesta:=json();
		respuesta.put('msg','ocurrio un error.'|| ' lineaError -> '||DBMS_UTILITY.Format_Error_BackTrace );
		respuesta.put('error',SQLERRM);
		respuesta.put('lineaError',' lineaError -> '||DBMS_UTILITY.Format_Error_BackTrace);
		respuesta.put('status',0);
		return '['||respuesta.to_char()||']';
END;
/*  __________________________________________________________________________________________________  */



	FUNCTION funciones_lct( datajon json)  RETURN clob IS
          action varchar2(100);
           datos varchar2(20000);
            oratkn varchar2(2000);
             clave number(20);
               vODT number(20);
             valueVal number(10);
               cambio varchar2(20);
                contrato varchar2(1000);
                fecha varchar2(10);
               	BEGIN
               action:=json_ext.get_string(datajon,'action');
               datos:=json_ext.get_string(datajon,'datos');
                oratkn:=json_ext.get_string(datajon,'oratkn');
                  cambio:=json_ext.get_string(datajon,'change');
                clave:=to_number(json_ext.get_string(datajon,'clave'));
                valueVal:=to_number(json_ext.get_string(datajon,'value'));
                 vODT:=to_number(json_ext.get_string(datajon,'odt'));
                  fecha:=json_ext.get_string(datajon,'date');
                    contrato:=json_ext.get_string(datajon,'contrato');
                  
                gobj:=json();
           
           	case	
         --------------------------------------------------  
	     	when action='verCeTrabajo'	then 
             return showCtrabajoAndPerfil();
        -------------------------------------------------- 
         --------------------------------------------------  
	     	when action='showTable'	then 
             return showLote(oratkn);
        -------------------------------------------------- 
          --------------------------------------------------  
	     	when action='show.R.L.A.'	then --ruta-lecturista-asignaciones
             return showRutaLecturistaLotes(fecha,oratkn);
             -- return '{}';
        -------------------------------------------------- 
          --------------------------------------------------  
	     	when action='showRutaslocal'	then --ruta-local-contrato
             return showRutaLocal(oratkn);
        -------------------------------------------------- 
          --------------------------------------------------  
	     	when action='show.contrato.ruta.local'	then --ruta-local-contrato
             return showRutalocalContrato(contrato,oratkn);
        -------------------------------------------------- 
           --------------------------------------------------  
	     	when action='showRutasAsginada'	then --ruta-lecturista-asignaciones
             return showRutaAsginado(fecha, oratkn);
        -------------------------------------------------- 
         -------------------------------------------------- 
          	when action='addRutaAsginacion'	then 
               return agregarRutaAsginacion(datos,oratkn);
        --------------------------------------------------  
           -------------------------------------------------- 
          	when action='addRutaLocalAsginacion'	then 
               return addRutaLocalAsginacion(datos,oratkn);
        --------------------------------------------------  
         -------------------------------------------------- 
          	when action='editarRutaLocalAsg'	then 
               return editarRutaLocalAsginacion(datos,oratkn);
        --------------------------------------------------  
          -------------------------------------------------- 
          	when action='RutaLocalOrdeSec'	then 
               return ordenSecuencia(datos,oratkn);
        --------------------------------------------------
        
        
          	when action='Agregarlecturista'	then 
                return agregarlecturista(datos,oratkn); 
        --------------------------------------------------  
         -------------------------------------------------- 
          	when action='AgregarMobile'	then 
                return agregarmobile(datos,oratkn); 
        --------------------------------------------------          
          	when action='usuarioGestionar'	then 
                return showGestionarUsuario(); 
                -------------------------------------------------- 
        --------------------------------------------------          
          	when action='mobileGestionar'	then 
                return showGestionarMobile(oratkn); 
                -------------------------------------------------- 
                 --------------------------------------------------          
          	when action='showLotemasDetalles'	then 
                return showLoteMasdetalle(oratkn,vODT); 
                -------------------------------------------------- 
                   --------------------------------------------------          
          	when action='enviarx7complete'	then 
                return insertatox7complete(oratkn,vODT); 
                -------------------------------------------------- 
                  --------------------------------------------------          
          	when action='showCentroOperac'	then 
                return showCentroOperac(oratkn); 
                -------------------------------------------------- 
                
          	when action='ChageEstatus_lect_mob'	then 
              return ChangeStatusLecturista(clave,valueVal,cambio,oratkn);    
                   -------------------------------------------------- 
          	when action='ChageEstatus_asignacion'	then 
              return ChangeStatusAsignacion(clave,valueVal,cambio,oratkn);    
        else
          gobj.put('status',0);
          gobj.put('msg','No hay opcion en el case'); 
       		end case;       
        
    return '['||gobj.to_char()||']';
    EXCEPTION
		when OTHERS then
			--return jmsgerr('wCVN0003');
      	gobj:=json();
		gobj.put('msg','ocurrio un error en la accion');
    gobj.put('error',SQLERRM);
    gobj.put('status',0);
        return '['||gobj.to_char()||']';
	END;
/*  __________________________________________________________________________________________________  */
/*  __________________________________________________________________________________________________  */

	FUNCTION funciones_mobile( datajon json)  RETURN clob IS
          action varchar2(100);
           datos varchar2(20000);
            oratkn varchar2(2000);
             vdata clob;
             clave number(20);
             valueVal number(10);
               cambio varchar2(20);
                contrato varchar2(1000);
                fecha varchar2(10);
                
                metodoJson     VARCHAR2(50);
     
     loginjs VARCHAR2(200);
     serviciojs VARCHAR2(200);
     passjs VARCHAR2(100);
     idusuario number(10);
      VuserServicio number(10);
     --datosJSON json;
       datostoken VARCHAR2(4000);
        datosusuario json;
        datoinfo VARCHAR2(100); 
         dataimei VARCHAR2(100); 
                
               	BEGIN
               action:=json_ext.get_string(datajon,'action');
               datos:=json_ext.get_string(datajon,'datos');
                dataimei:=json_ext.get_string(datajon,'imei');
                oratkn:=json_ext.get_string(datajon,'oratkn');
                  cambio:=json_ext.get_string(datajon,'change');
                   vdata:=json_ext.get_string(datajon,'data');
                clave:=to_number(json_ext.get_string(datajon,'clave'));
                valueVal:=to_number(json_ext.get_string(datajon,'value'));
                  fecha:=json_ext.get_string(datajon,'date');
                    contrato:=json_ext.get_string(datajon,'contrato');
                    
            --datosJSON :=pobj;
		metodoJson:=json_ext.get_string(datajon,'action');
    loginjs:=json_ext.get_string(datajon,'login');--se tiene que enviar por post
    passjs:=json_ext.get_string(datajon,'pass');--se tiene que enviar por post
    serviciojs:=json_ext.get_string(datajon,'servicio');--se tiene que enviar por post
     datostoken:=json_ext.get_string(datajon,'oratkn');--se tiene que enviar por post        
                    
                  
                gobj:=json();
           
           	case	
         --------------------------------------------------  
	       -------------------------------------------------------------------------------------  
         when action='login'	then--muestra concentrado de respuesta segun su encuesta      	
          if loginjs is null then return jmsgerr('LCTMB001'); end if;
          --if serviciojs is null then return jmsgerr('LGN0003'); end if;
           if passjs is null then return jmsgerr('LCTMB001');
            else 
         return buscar_usuario(loginjs,passjs);
        -- return jmsgerr('LCT001');
        end if;
         -------------------------------------------------------------------------------------  
        -------------------------------------------------------------------------------------  
         when action='getodt'	then--muestra concentrado de respuesta segun su encuesta      	
          if datostoken is null then return jmsgerr('LCTMB001'); 
           else 
         return get_ordenTrabajo(datostoken);
        -- return jmsgerr('LCT001');
        end if;
         ------------------------------------------------------------------------------------- 
            -------------------------------------------------------------------------------------  
         when action='setodt'	then--muestra concentrado de respuesta segun su encuesta      	
          if datostoken is null then return jmsgerr('LCTMB001'); 
           else 
         return set_ordenTrabajo(datostoken,vdata);
        -- return datajon.to_char();
        end if;
         ------------------------------------------------------------------------------------- 
         -------------------------------------------------------------------------------------  
         when action='actualizar'	then--muestra concentrado de respuesta segun su encuesta      	
          if dataimei is null then return jmsgerr('LCTMB001'); 
           else 
         return get_datadefault(dataimei);
        -- return jmsgerr('LCT001');
        end if;
         ------------------------------------------------------------------------------------- 
         
         
        else
          gobj.put('status',0);
          gobj.put('msg','No hay opcion en el case'); 
       		end case;       
        
    return '['||gobj.to_char()||']';
    EXCEPTION
		when OTHERS then
			--return jmsgerr('wCVN0003');
      	gobj:=json();
		gobj.put('msg','ocurrio un error en la accion');
    gobj.put('error',SQLERRM);
    gobj.put('status',0);
        return '['||gobj.to_char()||']';
	END;
/*  __________________________________________________________________________________________________  */
/*  __________________________________________________________________________________________________  */
FUNCTION INVOCA(pjsontxt in varchar2) return clob is
		--vval APP.LGN_VARIABLE.VALOR%TYPE;
		--vdes APP.LGN_VARIABLE.DESCRIPCION%TYPE;
		japi varchar2(6);
		jver varchar2(6);
		jmtd varchar2(40);
  
	BEGIN
		if not vjson(pjsontxt) then return jmsgerr('LCT001'); end if;
		japi:=json_ext.get_string(gobj,'api');
		jver:=json_ext.get_string(gobj,'ver');
		jmtd:=json_ext.get_string(gobj,'mtd');
  
    
		-- if (japi is null or jver is null or jmtd is null) then return jmsgerr('E0001'); end if;
		gobj.remove('api');
	  gobj.remove('ver');
		gobj.remove('mtd');
		--datavarapi('status',vval,vdes);
		--if vval<>'1' then return jmsgerr('LGN0002'); end if;			
		--las invocaciones de versión estan primeramente filtradas por el APIAGK o APIWWW 
		--según el caso y comienzan con la versión 1.0
		case	
	     	when jmtd='lct'	then return funciones_lct(gobj);
        when jmtd='mobile'	then return funciones_mobile(gobj);
      	when jmtd='status'	then        
        return statusaplicacion();
		end case;
				
		return jmsgerr('LCT001');
	EXCEPTION
		when OTHERS then
			return jmsgerr('LCT001');
	END;
/*  __________________________________________________________________________________________________  */
END API_PQLCT_1_0;
/
