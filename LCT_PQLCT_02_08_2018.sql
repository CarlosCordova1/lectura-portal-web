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
        VALUES (pIdtLotfac,pIdtTrnTyp,vIdtCntOpr,NVL(pNbrCpr,0),sysdate,sysdate,'NVO');
    END;
/*  __________________________________________________________________________________________________  */

/*  __________________________________________________________________________________________________  */
PROCEDURE INSERTAEXT(pIdtCpr NUMBER, pIdtCtr VARCHAR, pIdtPntLvr NUMBER, pIdtPntCpg NUMBER, pRngCdr NUMBER) IS
    BEGIN
        INSERT INTO LCT_EXTRLV
        SELECT
          pIdtCpr, NVL (agk_IndAnc_f(pIdtCpr,pIdtPntLvr,pIdtPntCpg, null,1, pRngCdr), 0), NVL (x7.agk_hst_cns_f1 (pIdtCtr), 0)
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
                (select libabr from x7.chpprmtypo where idt(+) = ctr.t1 and ctr.idtt1 = 'GIRCOM') Giro, 
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
                (select libabr from x7.clt, x7.chpprmtypo where t4= idt(+) and idtt4 = 'EDOCLI' and clt.idtclt =rlv.idtclt) edocliente,
                AGK_LIM_MIN_CNS (ctr.idtctr) LimInf,
                AGK_LIM_MAX_CNS (ctr.idtctr) LimSup
            FROM x7.rlv, x7.avtctr, x7.ctr, x7.pntcpg, lct_extrlv, x7.cpr
            WHERE rlv.idtpntcpg = ctr.idtpntcpg AND
             rlv.idtpntlvr = ctr.idtpntlvr AND
             ctr.idtctr = avtctr.idtctr AND
             sqcavn = numavn AND
             rlv.idtpntcpg = pntcpg.idtpntcpg AND
             rlv.idtpntlvr = pntcpg.idtpntlvr AND
             rlv.idtcpr = lct_extrlv.idtcpr (+) AND
             rlv.idtcpr = cpr.idtcpr AND
             rlv.idtlotfac = pidtlotfac AND
             rlv.idttrntyp = pidttrntyp;
        ELSE
       /* INSERT INTO LCT_LECTURAS
            SELECT 
            null IdtLec, 
            pIdtOdt IdtOdt, 
            ctr.IdtPntlvr, 
            ctr.IdtPntcpg,
            lct_rutalocal.IdtCpr,
            pntcpg.Rng1,
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
            ctr.t1 Giro, 
            null CnsPrm,
            null indanc, 
            null IdtAnm1,
            null IdtAnm2,
            'NVO' EdoAtl,
            '0' BitsCri, 
            '0' BitsCru
            FROM lct_rutalocal, x7.pntcpg, x7.ctr, x7.cprpntcpg
            WHERE lct_rutalocal.idtcpr = cprpntcpg.idtcpr AND
            ctr.idtpntlvr = pntcpg.idtpntlvr AND
            ctr.idtpntcpg = pntcpg.idtpntcpg AND
            ctr.idtpntlvr = cprpntcpg.idtpntlvr AND
            ctr.idtpntcpg = cprpntcpg.idtpntcpg AND
            cprpntcpg.datdps IS NULL AND
            lct_rutalocal.folioruta = pidttrntyp;*/
             INSERT INTO LCT_LECTURAS
             SELECT 
             null IdtLec, 
                pIdtOdt IdtOdt, 
               123,-- rlv.IdtPntlvr, 
               123, --rlv.IdtPntcpg,
               123,-- rlv.IdtCpr,
               -- rlv.Rng1,
                123 Rng1,
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
               --null lct_extrlv.CnsPrm,
               --null lct_extrlv.indanc,
               null CnsPrm,
               null indanc,
                null IdtAnm1,
                null IdtAnm2,
                'NVO' EdoAtl,
                '0' BitsCri, 
                '0' BitsCru,
                --cpr.numcpr medidor,
                lct_detrtl.IDTPNTLVR medidor,
                NVL (REPLACE (REPLACE (pntcpg.adrlbr,CHR (13) || CHR (10),' '),CHR (9), ' '),' ') direccion,
                null uso,
                --(select libabr from x7.clt, x7.chpprmtypo where t4= idt(+) and idtt4 = 'EDOCLI' and clt.idtclt =rlv.idtclt) edocliente,
                null,
                AGK_LIM_MIN_CNS (ctr.idtctr) LimInf,
                AGK_LIM_MAX_CNS (ctr.idtctr) LimSup
            FROM app.lct_detrtl,
            x7.pntcpg, x7.ctr, x7.cprpntcpg
            WHERE --lct_detrtl.IDTPNTLVR = cprpntcpg.IDTPNTLVR AND
            ctr.idtpntlvr = pntcpg.idtpntlvr AND
            ctr.idtpntcpg = pntcpg.idtpntcpg AND
            ctr.idtpntlvr = cprpntcpg.idtpntlvr AND
            ctr.idtpntcpg = cprpntcpg.idtpntcpg AND
            cprpntcpg.datdps IS NULL AND
            lct_detrtl.IDTRTL =  pidttrntyp
           and cprpntcpg.IDTPNTLVR  in (1072,1073)
            ;
            
            
            
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
