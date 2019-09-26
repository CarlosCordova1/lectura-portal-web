/*SELECT A.IDTAGT "# Agente", INITCAP(A.PRN ||' '|| A.NOM) "Nombre",
A.NOMCNX "Conexion",
A.DATENT "Fecha Alta",A.DATSRT "Fecha Baja", A.IDTSTR "Estructura",  
DECODE(A.IDTSTR, 'GECO-INGR-LECT-CCAN', 'CAN',
                    'GECO-INGR-LECT-SOLD', 'PDC'
                   )   cpo
FROM AGT A INNER JOIN PRF B 
ON A.IDTPRF = B.IDTPRF INNER JOIN FCT C ON A.IDTFCT = C.IDTFCT
--AND A.IDTSTR IN ('GECO-INGR-LECT-CCAN','GECO-INGR-LECT-SOLD','GPMO-LECT')
AND A.IDTSTR IN ('GECO-INGR-LECT-CCAN','GECO-INGR-LECT-SOLD')
and A.DATSRT is null
ORDER BY 4 ASC;
*/
 INSERT INTO LCT_USER
            (ID_USER,
            CLAVE, 
            NOMBRE,
            AMATERNO, 
            APATERNO,
           -- EMAIL, 
            USUARIO, 
            PASS,
            GENERO, 
            IDPERFIL, 
            IDTCNTOPR,
            FECHAIN,
            FECHAMODIF,
            ESTATUS
            ) 
  -- VALUES (LCT_SQUSE.NEXTVAL, clave1, nombre, amaterno, apaterno, mail, usuario1, pass,genero, 1, idtcntopre,SYSDATE,SYSDATE,1);
          SELECT
       -- (SELECT  LCT_SQUSE.NEXTVAL FROM DUAL)
        --(SELECT count(*)+1 FROM app.LCT_USER)
         ROWNUM as ID_USER,
          to_number(REPLACE (A.IDTAGT,'EXT',''))  as CLAVE,
         
          INITCAP(A.PRN) as NOMBRE,
          ' ' as AMATERNO,
          INITCAP(A.NOM) as APATERNO,
            A.NOMCNX as USUARIO,
             concat(A.NOMCNX,A.IDTAGT) as pass,
            3 as  GENERO, 
             1 as IDPERFIL,
              
         --   A.DATENT "Fecha Alta",A.DATSRT "Fecha Baja", A.IDTSTR "Estructura",  
            DECODE(A.IDTSTR, 'GECO-INGR-LECT-CCAN', 'CAN',
                    'GECO-INGR-LECT-SOLD', 'PDC'
                   ) as  IDTCNTOPR,
                  sysdate as  FECHAIN,
                   sysdate as  FECHAMODIF,
                  1 as status
                   
FROM AGT A INNER JOIN PRF B 
ON A.IDTPRF = B.IDTPRF INNER JOIN FCT C ON A.IDTFCT = C.IDTFCT
--AND A.IDTSTR IN ('GECO-INGR-LECT-CCAN','GECO-INGR-LECT-SOLD','GPMO-LECT')
AND A.IDTSTR IN ('GECO-INGR-LECT-CCAN','GECO-INGR-LECT-SOLD')
and A.DATSRT is null
ORDER BY 4 ASC     
                   --   COMMIT;
                      
                      
 
                      
                      
                      
                      
                      