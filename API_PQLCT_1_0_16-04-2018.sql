CREATE OR REPLACE PACKAGE API_PQLCT_1_0 AS 
gobj json;
 function INVOCA(pjsontxt VARCHAR2) return clob;
END API_PQLCT_1_0;
/


CREATE OR REPLACE PACKAGE BODY API_PQLCT_1_0 AS
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
 
	FUNCTION showRutaLecturistaLotes(fecha in varchar2)  RETURN clob IS
    valdata json;
    paso json;
    	BEGIN
        valdata:=json();
    DECLARE
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
SELECT IDTLOTFAC lote,IDTTRNTYP ruta,NBRCPR TOTAL FROM lct_lotes where EDOLTE='NVO' 
AND trunc(FCHCRE)=TO_DATE(fecha,'DD/MM/YYYY') GROUP BY  IDTLOTFAC,IDTTRNTYP,NBRCPR order by IDTTRNTYP asc;

		      	BEGIN
              paso:=json();
         gobj:=json();
          FOR ind IN C_LECTURA LOOP
         --CentroOperacional.put('IDLABEL',ind.IDLABEL);
         --IF ind.EXISTERUTA IS NULL THEN
            gobj.put('Ruta',ind.ruta);
         gobj.put('TotalMedidor',ind.TOTAL);
         gobj.put('Lote',ind.lote);
           paso.put(to_char(ind.ruta),gobj);
         --  END IF;
           
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
    FROM LCT_RTALOCAL LOC ORDER BY LOC.IDTRTL DESC;
 
		      	BEGIN
              paso:=json();
         gobj:=json();
          FOR ind IN C_LECTURA LOOP
         --CentroOperacional.put('IDLABEL',ind.IDLABEL);
            gobj.put('Ruta',ind.IDTRTL);
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

	FUNCTION showRutalocalContrato(Cadenacontrato in varchar2)  RETURN clob IS
    valdata json;
      Cadenacontrato2  varchar2(4000);
    paso json;
    cont number(10):=0;
    	BEGIN
        valdata:=json();
   --  vcontratos :=json_list (Cadenacontrato);
  Cadenacontrato2:= REPLACE(Cadenacontrato,'[');  
  Cadenacontrato2:= REPLACE(Cadenacontrato2,']');
     DECLARE
         CURSOR C_LECTURA is
    SELECT  
    CLT.IDTCLT CLIENTE,
    CTR.IDTCTR CONTRATO,
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

	FUNCTION showRutaAsginado(fecha in varchar2)  RETURN clob IS
    valdata json;
    paso json;
      paso2 json;
     lecturista json;
     contar number(20):=0;
    	BEGIN
        valdata:=json();
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
FROM LCT_ORDENES WHERE   trunc(FCHATH)=TO_DATE(fecha,'DD/MM/YYYY') ;--AND EDOODT IS NULL;
		      	BEGIN
              paso:=json();
               paso2:=json();
        
          FOR ind IN C_LECTURA LOOP
          contar:=contar+1;
           gobj:=json();
           lecturista:=json();
         --CentroOperacional.put('IDLABEL',ind.IDLABEL);
           gobj.put('ID_ASIG',ind.ID_ASIG);
            gobj.put('Ruta',ind.ruta);
             --gobj.put('Label',ind.LABEL);
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
                      FOR tt IN C_LECTURISTA LOOP
                      lecturista.put(to_char(tt.LECT),tt.NOMBRE||' '||tt.APATERNO);
                                  END LOOP;
                       
                    END;       
          
              gobj.put('lecturista',lecturista);
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

	FUNCTION showLote  RETURN clob IS
  valdata json;
  cadena clob;
    paso json;
     paso2 json;
     cont number(20):=0;
     lecturista json;
    	BEGIN
        valdata:=json();
    DECLARE
         CURSOR C_LECTURA is

--SELECT IDTODT AS ID_ASIG, IDTTRNTYP as ruta, IDTLOTFAC as lote,FCHASG as asignacion, edoasr as estatus FROM LCT_ASIGRUTAS
--WHERE EDOASR='1'--trunc(FCHASG)=TO_DATE('19/05/2017','DD/MM/YYYY')
--ORDER BY IDTODT DESC;
--SELECT idtusrlct IDUSER, IDTODT ID_ASIG,  IDTTRNTYP  ruta,IDTLOTFAC  lote, FCHATH  asignacion, EDOODT estatus FROM LCT_ORDENES ORDER BY IDTODT DESC;
		
 SELECT ord.idtusrlct IDUSER, ord.IDTODT ID_ASIG,  ord.IDTTRNTYP  ruta,
ord.IDTLOTFAC  lote, ord.FCHATH  asignacion, ord.EDOODT estatus,
luser.CLAVE   LECT,luser. NOMBRE, luser.APATERNO, lot.NBRCPR totalmedidor
FROM LCT_ORDENES ord,LCT_USER luser, LCT_LOTES lot where ord.idtusrlct =luser.ID_USER (+) and luser.ESTATUS(+)=1
and ord.IDTTRNTYP =lot.IDTTRNTYP(+) and  ord.IDTLOTFAC =lot.IDTLOTFAC(+)
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
             gobj.put('LECT',ind.LECT);
              gobj.put('LECT',ind.LECT);
              gobj.put('NOMBRE',ind.NOMBRE);
               gobj.put('APATERNO',ind.APATERNO);
               gobj.put('totalmedidor',ind.totalmedidor);
              gobj.put('Asignacion',TO_CHAR(ind.asignacion,'dd/mm/yyyy'));
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

	FUNCTION showRutaLocal  RETURN clob IS
  valdata json;
  cadena clob;
    paso json;
     paso2 json;
     cont number(20):=0;
     lecturista json;
    	BEGIN
        valdata:=json();
    DECLARE
         CURSOR C_LECTURA is
 
    SELECT LOC.IDTRTL,LOC.NOMBRERL,LOC.EDO,LOC.fchcre asignacion,--LOC.fchuac fechaFin,
    (SELECT  COUNT(*) TOTAL FROM LCT_DETRTL WHERE LCT_DETRTL.IDTRTL=LOC.IDTRTL) TOTAL
    FROM LCT_RTALOCAL LOC ORDER BY LOC.IDTRTL DESC;
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
           paso3.put('Numeromedidor',sec.IDTPNTLVR);
            paso3.put('Idmedidor',sec.IDTPNTLVR);
            paso3.put('Direccion','alguna direccion');
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
	FUNCTION showGestionarMobile  RETURN clob IS
    valdata json;
    cont number:=0;
     lista json;
    	BEGIN
       valdata:=json();
    DECLARE
      CURSOR C_mobile is
       SELECT * FROM LCT_MOBILE  ORDER BY IDtMOB DESC;
		      	BEGIN
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
              gobj.put('Folio',ind.IDTMOB);
                 lista.put(to_char(cont),gobj);
          END LOOP;
    valdata.put('Mobile',lista);
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
          
          SELECT COUNT(*) TOTAL INTO TOT FROM LCT_MOBILE WHERE IMEI=claveEmei;
      IF TOT=0 THEN        
          INSERT INTO LCT_MOBILE
            ( IMEI, FCHCRE,NOTAS,EDOOPR) 
   VALUES ( claveEmei,SYSDATE,comentario,ESTADO);
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
             
          
         -- SELECT COUNT(*) TOTAL INTO TOT FROM LCT_ASIGRUTAS WHERE IDTTRNTYP=ruta;
     -- IF TOT=0 THEN        
         --  INSERT INTO LCT_ASIGRUTAS 
         ----  (IDTODT, IDTLOTFAC,IDTTRNTYP,IDTCNTOPR, FCHASG,EDOASR) 
            --     VALUES (LCT_SQASI.NEXTVAL, lote,ruta,centroOperacion,TO_DATE(fecha,'dd/mm/yyyy'),'0');
              --        COMMIT;  
                      valdata.put('status',1);
                       valdata.put('msg','Se asigno la ruta');
               valdata.put('lecturista',lecturista);
              valdata.put('datos2',datos2);
           
         --  SELECT IDTODT INTO IDRUTA FROM LCT_ASIGRUTAS WHERE IDTTRNTYP=ruta AND FCHASG=TO_DATE(fecha,'DD/MM/YYYY');
           --  valdata.put('IDRUTA',IDRUTA);
              FOR i IN 1 .. lecturista.COUNT
              loop
              begin 
              
                 SELECT ID_USER INTO IDUSER1 FROM LCT_USER WHERE CLAVE=TO_NUMBER(REPLACE(lecturista.get(i).to_char(), '"',''));
                  --   valdata.put('IDUSER1_'||i,IDUSER1);
                  --  valdata.put('lecturista_'||i, lecturista.get(i).to_char());
                  -- INSERT INTO LCT_RUTA_TO_USER
       --  (ID_RUTA_A_USER,IDASIGRUTA,IDUSER,ESTATUS ) 
        --  VALUES (LCT_SQRUTATOUSER.NEXTVAL, IDRUTA,IDUSER1 , 1);         
             --       COMMIT; 
                    
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
                 
                    'CUN',
                    SYSDATE,
                    TO_DATE(fecha,'DD/MM/YYYY'),
                     SYSDATE,
                     lote,
                     ruta
                    );
                     COMMIT; 
                    
                    
                    
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
       ELSE
        valdata.put('status',0);
                       valdata.put('msg','No se Actualizo Estatus - opcion no valida');
                       -- valdata.put('val',val);
                        -- valdata.put('clave',clave2);
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
       UPDATE  LCT_RUTA_TO_USER SET ESTATUS=0 WHERE IDUSER=(SELECT ID_USER FROM LCT_USER WHERE CLAVE = clave2) AND IDASIGRUTA=val;
        COMMIT; 
          valdata.put('status',1);
                      valdata.put('msg','Se desasigno el lecturista');
                       -- valdata.put('val',val);
                       --  valdata.put('clave',clave2);
       ELSE IF cambio='agregar' THEN
       
       SELECT COUNT(*) INTO existeuser FROM LCT_RUTA_TO_USER 
       WHERE IDUSER=(SELECT ID_USER FROM LCT_USER WHERE CLAVE = clave2) AND IDASIGRUTA=val AND  ESTATUS=0;
       IF existeuser =0 THEN
       INSERT INTO LCT_RUTA_TO_USER
         (ID_RUTA_A_USER,IDASIGRUTA,IDUSER,ESTATUS ) 
          VALUES (LCT_SQRUTATOUSER.NEXTVAL, val,(SELECT ID_USER FROM LCT_USER WHERE CLAVE = clave2) , 1); 
            COMMIT;
           valdata.put('status',1);
                       valdata.put('msg','Se agrego el lecturista');
       ELSE
        UPDATE  LCT_RUTA_TO_USER SET ESTATUS=1 WHERE IDUSER=(SELECT ID_USER FROM LCT_USER WHERE CLAVE = clave2) AND IDASIGRUTA=val;
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
             
          
         -- SELECT COUNT(*) TOTAL INTO TOT FROM LCT_ASIGRUTAS WHERE IDTTRNTYP=ruta;
     -- IF TOT=0 THEN        
         --  INSERT INTO LCT_ASIGRUTAS 
         ----  (IDTODT, IDTLOTFAC,IDTTRNTYP,IDTCNTOPR, FCHASG,EDOASR) 
            --     VALUES (LCT_SQASI.NEXTVAL, lote,ruta,centroOperacion,TO_DATE(fecha,'dd/mm/yyyy'),'0');
              --        COMMIT;  
                      valdata.put('status',1);
                       valdata.put('msg','Se creo la ruta local');
               valdata.put('medidor',medidor);
              valdata.put('datos2',datos2);
              
              INSERT INTO LCT_RTALOCAL (nombrerl,edo,fchcre) VALUES (etiqueta,'NVO',SYSDATE);
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
                 idtpntlvr,
                 idtcntpng,
                 edo,
                 fchcre,
                 FCHUAC
                   
                    )
                    VALUES(
                    LCT_SQRTL.currval,
                    i,
                   TO_NUMBER(medidor.get(i).TO_CHAR()),
                  TO_NUMBER( medidor.get(i).TO_CHAR()),
                 
                     'NVO',
                       SYSDATE,
                        SYSDATE
                                      
                    );
                    
                    
                    
                    
                 end;
               end loop;
              
                 COMMIT; 
        
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
   --    servicios_ref_admin number(10);
    --     servicios_ref_operativo number(10);
			BEGIN
      
       descifrar:=UTILERIA_CIFRAR.DESCIFRAR(oratkn);
    
      temp2 :=json();
        respuesta :=json();
        jsondescifrar:= json(descifrar);
       if ValidaToken(descifrar) then 
        
        respuesta.put('msg','todo ok');
          iduser:=json_ext.get_number(jsondescifrar,'iduser');
          DECLARE
               CURSOR C_ODT IS  SELECT * FROM LCT_ORDENES WHERE IDTUSRLCT=iduser AND EDOODT='NVO';
                    BEGIN
                     
                 FOR ind IN C_ODT LOOP
                        temp :=json();
                         --  temp.put('idtodt',ind.idtodt);
                           -- temp.put('uso',ind.idtlotfac);
                            temp.put('Ruta',ind.idttrntyp);
                               DECLARE
                                temp3  json ;
                                  LECT  json ;
                        -- CURSOR C_ODT IS  SELECT * FROM LCT_ORDENES WHERE IDTUSRLCT=iduser AND EDOODT='NVO';
                        CURSOR C_medidor IS  SELECT * FROM LCT_LECTURAS where IDTODT =ind.idtodt  AND EDOATL='NVO' and ROWNUM<60 ORDER BY idtlec DESC;
                              BEGIN
                             LECT :=json();
                                FOR iv IN C_medidor LOOP
                                 temp3 :=json();
                                  temp3.put('idtlec' ,iv.idtlec);
                                   temp3.put('rng1' ,iv.rng1);
                                    temp3.put('giro' ,iv.giro);
                                    temp3.put('coordx' ,iv.coordx);
                                    temp3.put('coordy' ,iv.coordy);
                                     temp3.put('cliente' ,iv.idtclt);
                                      temp3.put('idtctr' ,iv.idtctr);
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
    
	respuesta.put('status',1);
  	respuesta.put('ODT',temp2);
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



	FUNCTION funciones_lct( datajon json)  RETURN clob IS
          action varchar2(100);
           datos varchar2(20000);
            oratkn varchar2(2000);
             clave number(20);
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
             return showLote();
        -------------------------------------------------- 
          --------------------------------------------------  
	     	when action='show.R.L.A.'	then --ruta-lecturista-asignaciones
             return showRutaLecturistaLotes(fecha);
             -- return '{}';
        -------------------------------------------------- 
          --------------------------------------------------  
	     	when action='showRutaslocal'	then --ruta-local-contrato
             return showRutaLocal();
        -------------------------------------------------- 
          --------------------------------------------------  
	     	when action='show.contrato.ruta.local'	then --ruta-local-contrato
             return showRutalocalContrato(contrato);
        -------------------------------------------------- 
           --------------------------------------------------  
	     	when action='showRutasAsginada'	then --ruta-lecturista-asignaciones
             return showRutaAsginado(fecha);
        -------------------------------------------------- 
         -------------------------------------------------- 
          	when action='addRutaAsginacion'	then 
               return agregarRutaAsginacion(datos,oratkn);
        --------------------------------------------------  
           -------------------------------------------------- 
          	when action='addRutaLocalAsginacion'	then 
               return addRutaLocalAsginacion(datos,oratkn);
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
                return showGestionarMobile(); 
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
                
               	BEGIN
               action:=json_ext.get_string(datajon,'action');
               datos:=json_ext.get_string(datajon,'datos');
                oratkn:=json_ext.get_string(datajon,'oratkn');
                  cambio:=json_ext.get_string(datajon,'change');
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
