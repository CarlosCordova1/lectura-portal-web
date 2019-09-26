CREATE OR REPLACE PACKAGE     LCT_PQLCT AS
 PROCEDURE INSERTARUTA (pIdtLotfac VARCHAR, pIdtTrnTyp VARCHAR,pNbrCpr NUMBER);
 PROCEDURE INSERTAEXT(pIdtCpr NUMBER, pIdtCtr VARCHAR, pIdtPntLvr NUMBER, pIdtPntCpg NUMBER, pRngCdr NUMBER);
 PROCEDURE INSERTALECTURA(pIdtOdt NUMBER, pIdtLotfac VARCHAR, pIdtTrnTyp VARCHAR);
 PROCEDURE DELETEEXT(pIdtCpr NUMBER);
END LCT_PQLCT;
/


CREATE OR REPLACE PACKAGE BODY     LCT_PQLCT AS
/*  __________________________________________________________________________________________________  */
PROCEDURE INSERTARUTA(pIdtLotfac VARCHAR, pIdtTrnTyp VARCHAR,  pNbrCpr NUMBER) IS
    vIdtCntOpr X7.CNTOPR.IDTCNTOPR%TYPE;
    BEGIN
        SELECT IdtCntOpr 
        INTO vIdtCntOpr
         FROM X7.TRNTYP 
        WHERE idttrntyp  =pIdtTrnTyp;
        INSERT INTO LCT_LOTES
        VALUES (pIdtLotfac,pIdtTrnTyp,vIdtCntOpr,NVL(pNbrCpr,0),sysdate,sysdate,'NVO', NULL);
    END;
/*  __________________________________________________________________________________________________  */

/*  __________________________________________________________________________________________________  */
PROCEDURE INSERTAEXT(pIdtCpr NUMBER, pIdtCtr VARCHAR, pIdtPntLvr NUMBER, pIdtPntCpg NUMBER, pRngCdr NUMBER) IS
    BEGIN
        INSERT INTO LCT_EXTRLV
        SELECT
          pIdtCpr, NVL (agk_IndAnc_f(pIdtCpr,pIdtPntLvr,pIdtPntCpg, null,1, pRngCdr), 0), NVL (round (x7.agk_hst_cns_f1 (pIdtCtr)), 0)
        FROM DUAL;
    END;
/*  __________________________________________________________________________________________________  */

/*  __________________________________________________________________________________________________  */
PROCEDURE INSERTALECTURA(pIdtOdt NUMBER, pIdtLotfac VARCHAR, pIdtTrnTyp VARCHAR) IS
    BEGIN
        IF pIdtLotfac IS NOT NULL THEN
        INSERT INTO LCT_LECTURAS
            SELECT
                null IdtLec, 
                pIdtOdt IdtOdt, 
                rlv.IdtPntlvr, 
                rlv.IdtPntcpg,
                rlv.IdtCpr,
                rlv.Rng1,
                ctr.IdtCltdst,
                ctr.IdtCtr,  
                sysdate FchCre , 
                sysdate FchUac, 
                null FchLec   ,
                null FchVer   ,
                null Lectura , 
                null LecturaVer  ,
                pntcpg.coordx,
                pntcpg.coordy,
                null mcoordx,
                null mcoordy,
                (select libabr from x7.chpprmtypo where idt(+) = ctr.t1 and idttypo = 'GIRCOM') Giro, 
                lct_extrlv.CnsPrm, 
                lct_extrlv.indanc, 
                null IdtAnm1,
                null IdtAnm2,
                'NVO' EdoAtl,
                '0' BitsCri, 
                '0' BitsCru,
                cpr.numcpr medidor,
                NVL (REPLACE (REPLACE (pntcpg.adrlbr,CHR (13) || CHR (10),' '),CHR (9), ' '),' ') direccion,
                idtacv uso,
                (select libabr from x7.chpprmtypo where clt.t4= idt(+) and clt.idtt4 = 'EDOCLI' ) edocliente,
                (select CnsPrm * (1 - (LimInferior1 / 100)) from lct_extrlv, lct_limites where 
                    CnsPrm between CnsInf and CnsSup and
                    lct_extrlv.idtcpr = cpr.idtcpr and 
                    lct_limites.idtacv= avtctr.idtacv  ) LimInf,
                (select CnsPrm * (1 + (LimSuperior1 / 100)) from lct_extrlv, lct_limites where 
                    CnsPrm between CnsInf and CnsSup and
                    lct_extrlv.idtcpr = cpr.idtcpr and 
                    lct_limites.idtacv= avtctr.idtacv  ) LimSup,
                null note,
                (select CnsPrm * (1 - (LimInferior2 / 100)) from lct_extrlv, lct_limites where 
                    CnsPrm between CnsInf and CnsSup and
                    lct_extrlv.idtcpr = cpr.idtcpr and 
                    lct_limites.idtacv= avtctr.idtacv  ) LimInf2,
                (select CnsPrm * (1 + (LimSuperior2 / 100)) from lct_extrlv, lct_limites where 
                    CnsPrm between CnsInf and CnsSup and
                    lct_extrlv.idtcpr = cpr.idtcpr and 
                    lct_limites.idtacv= avtctr.idtacv  ) LimSup2,
                 typcpr.nbrrou Nruedas,
                 null id_user,
                 X7.PNTCPG.DATCOU,
                 0 intentos,
                 clt.t4 idedocliente
            FROM x7.rlv, x7.clt,  x7.avtctr, x7.ctr, x7.pntcpg, lct_extrlv, x7.cpr, x7.typcpr
            WHERE rlv.idtclt = clt.idtclt AND
             rlv.idtpntcpg = ctr.idtpntcpg AND
             rlv.idtpntlvr = ctr.idtpntlvr AND
             ctr.idtctr = avtctr.idtctr AND
             ctr.sqcavn = avtctr.numavn AND
             rlv.idtpntcpg = pntcpg.idtpntcpg AND
             rlv.idtpntlvr = pntcpg.idtpntlvr AND
             rlv.idtcpr = lct_extrlv.idtcpr (+) AND
             rlv.idtcpr = cpr.idtcpr AND
             cpr.idttypcpr= typcpr.idttypcpr AND
             rlv.idtlotfac = pidtlotfac AND
             rlv.idttrntyp = pidttrntyp;
        ELSE
        INSERT INTO LCT_LECTURAS
            SELECT
                null IdtLec, 
                pIdtOdt IdtOdt, 
                ctr.IdtPntlvr, 
                ctr.IdtPntcpg,
                lct_detrtl.IdtCpr,
                lct_detrtl.ord Rng1,
                ctr.IdtCltdst,
                ctr.IdtCtr,  
                sysdate FchCre , 
                sysdate FchUac, 
                null FchLec   ,
                null FchVer   ,
                null Lectura , 
                null LecturaVer  ,
                pntcpg.coordx,
                pntcpg.coordy,
                null mcoordx,
                null mcoordy,
                (select libabr from x7.chpprmtypo where idt(+) = ctr.t1 and ctr.idtt1 = 'GIRCOM') Giro, 
                NVL (round (x7.agk_hst_cns_f1 (ctr.IdtCtr)), 0) CnsPrm, 
                NVL (agk_IndAnc_f(cpr.idtCpr,pntcpg.IdtPntLvr,pntcpg.IdtPntCpg, null,1, 1), 0) indanc,
                null IdtAnm1,
                null IdtAnm2,
                'NVO' EdoAtl,
                '0' BitsCri, 
                '0' BitsCru,
                cpr.numcpr medidor,
                NVL (REPLACE (REPLACE (pntcpg.adrlbr,CHR (13) || CHR (10),' '),CHR (9), ' '),' ') direccion,
                idtacv uso,
                (select libabr from x7.clt, x7.chpprmtypo where t4= idt(+) and idtt4 = 'EDOCLI' and clt.idtclt =ctr.idtcltdst) edocliente,
                (select  (NVL (round(x7.agk_hst_cns_f1 (ctr.IdtCtr)), 0)) * (1 - (LimInferior1 / 100)) from lct_limites where 
                    (NVL (round(x7.agk_hst_cns_f1 (ctr.IdtCtr)), 0)) between CnsInf and CnsSup and
                    lct_limites.idtacv= avtctr.idtacv  ) LimInf,
                (select (NVL (round(x7.agk_hst_cns_f1 (ctr.IdtCtr)), 0)) * (1 + (LimSuperior1 / 100)) from lct_limites where 
                    (NVL (round(x7.agk_hst_cns_f1 (ctr.IdtCtr)), 0)) between CnsInf and CnsSup and
                    lct_limites.idtacv= avtctr.idtacv  ) LimSup,
                null note,
                (select (NVL (round(x7.agk_hst_cns_f1 (ctr.IdtCtr)), 0)) * (1 - (LimInferior2 / 100)) from lct_limites where 
                    (NVL (round(x7.agk_hst_cns_f1 (ctr.IdtCtr)), 0)) between CnsInf and CnsSup and
                    lct_limites.idtacv= avtctr.idtacv  ) LimInf2,
                (select (NVL (round(x7.agk_hst_cns_f1 (ctr.IdtCtr)), 0)) * (1 + (LimSuperior2 / 100)) from lct_limites where 
                    (NVL (round(x7.agk_hst_cns_f1 (ctr.IdtCtr)), 0)) between CnsInf and CnsSup and
                    lct_limites.idtacv= avtctr.idtacv  ) LimSup2,
                 typcpr.nbrrou Nruedas,
                 null id_user,
                 X7.PNTCPG.DATCOU,
                 0 intentos,
                 (select t4 from x7.clt, x7.chpprmtypo where t4= idt(+) and idtt4 = 'EDOCLI' and clt.idtclt =ctr.idtcltdst)
            FROM lct_detrtl, x7.ctr, x7.cpr, x7.avtctr, x7.pntcpg, x7.typcpr
            WHERE
            lct_detrtl.idtctr = ctr.idtctr AND
            lct_detrtl.idtcpr = cpr.idtcpr AND
            cpr.idttypcpr= typcpr.idttypcpr AND
            ctr.idtctr = avtctr.idtctr AND
            ctr.sqcavn = avtctr.numavn AND
            ctr.idtpntlvr = pntcpg.idtpntlvr AND
            ctr.idtpntcpg = pntcpg.idtpntcpg AND
            lct_detrtl.IDTRTL =  pidttrntyp;           
        END IF;
    END;
/*  __________________________________________________________________________________________________  */

/*  __________________________________________________________________________________________________  */
PROCEDURE DELETEEXT(pIdtCpr NUMBER) IS
    BEGIN
        DELETE FROM LCT_EXTRLV WHERE IDTCPR =pIdtCpr;
    END;
/*  __________________________________________________________________________________________________  */
END LCT_PQLCT;
/
