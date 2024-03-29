--------------------------------------------------------
-- Archivo creado  - mi�rcoles-abril-25-2018   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table LCT_LOTETIPO
--------------------------------------------------------

  CREATE TABLE "APP"."LCT_LOTETIPO" 
   (	"LOTE" VARCHAR2(10 BYTE), 
	"RUTA" VARCHAR2(10 BYTE), 
	"IDCOPR" NUMBER(10,0), 
	"COPR" VARCHAR2(20 BYTE), 
	"EDO" NUMBER(1,0) DEFAULT 1
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "AGUAKAN" ;
 

   COMMENT ON COLUMN "APP"."LCT_LOTETIPO"."IDCOPR" IS 'ID CENTRO OPERACIONAL';
 
   COMMENT ON COLUMN "APP"."LCT_LOTETIPO"."COPR" IS 'CENTRO OPERACIONAL';
 
   COMMENT ON COLUMN "APP"."LCT_LOTETIPO"."EDO" IS '1 > ACTIVO, 0 > INACTIVO';
REM INSERTING into APP.LCT_LOTETIPO
SET DEFINE OFF;
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('PTOMOR','PTOM14',2,'Puerto Morelos',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('PTOMOR','PTO41',2,'Puerto Morelos',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('PTOMOR','PTOM13',2,'Puerto Morelos',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('PTOMOR','PTOM12',2,'Puerto Morelos',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('PTOMOR','PTOMO2',2,'Puerto Morelos',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('PTOMOR','PTOMO3',2,'Puerto Morelos',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('PTOMOR','PTOMO4',2,'Puerto Morelos',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('PTOMOR','PTOMO5',2,'Puerto Morelos',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('PTOMOR','PTOMO6',2,'Puerto Morelos',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('PTOMOR','PTOMO7',2,'Puerto Morelos',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('PTOMOR','PTOMO8',2,'Puerto Morelos',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('PTOMOR','PTOM11',2,'Puerto Morelos',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('PTOMOR','PTOMOR',2,'Puerto Morelos',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('B4','ESCUMO',2,'Puerto Morelos',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('B4','TELMM',2,'Puerto Morelos',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('PTOMOR','PTOM15',2,'Puerto Morelos',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('PTOMOR','PTOMO9',2,'Puerto Morelos',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('PTOMOR','PTOM10',2,'Puerto Morelos',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('B4','ESCUIM',3,'Isla Mujeres',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('B4','TELMI',3,'Isla Mujeres',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('GC2','ISLA3',3,'Isla Mujeres',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('D2','LEONA',4,'Leona Vicario',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('B4','ESCULV',4,'Leona Vicario',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('D2','LEONA1',4,'Leona Vicario',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('D2','LEONA2',4,'Leona Vicario',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('D2','LEONA3',4,'Leona Vicario',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('D2','LEONA4',4,'Leona Vicario',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C3','332',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('D1','251J',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('GC','PTOCA4',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('CPLAZA','CPLZA1',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('D2','247M',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('D1','258',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('D1','251M',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C1','311',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C1','318',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('D1','251Q',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C1','317C',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C3','333',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C1','326D',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C3','330B',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C4','250C',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('GC','GCT1',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('D1','251K',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('GC','GCU1',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C3','336B',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C3','330C',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('D1','251�',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('GC','GCT4',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C1','323',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('POLIG1','259O',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C1','325B',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('D2','235B',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C4','249D',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C5','102C',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('POLIG1','259J',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('POLIG1','259�',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('B4','254B',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('D2','234B',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C4','248L',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C1','310C',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('D1','251G',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('D1','251D',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('D1','251B',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('D1','251C',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C1','326B',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C1','326C',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('POLIG1','259I',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('D2','259F',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('D2','259G',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('D2','259H',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C2','40B',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('D1','251F',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('D1','251H',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('D1','251E',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C3','313',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C1','310D',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('POLIG1','259K',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('D2','237C',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C2','240B',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C4','248�',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C4','249',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('D2','260L',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C4','248M',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('D2','236B',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C1','321B',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('D2','246B',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C4','248N',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('GC2','KUKULC',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C4','250',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C2','232B',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('GC','OLAS',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C4','248I',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C4','248J',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('D2','259',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('D2','259B',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('D2','259C',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('POLIG1','259D',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('POLIG1','259E',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('D1','227B',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C1','310B',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('GC','PFINO',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('B4','509',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('D5','DORADA',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C1','57',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C1','56',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('B4','96A',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('B4','96B',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('B4','98',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('B4','ESCUEL',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('D1','BONFIL',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('B4','60',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('B3','61',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('B4','71',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('B4','72',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('B4','73',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('B3','74',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('B3','75A',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('B3','75B',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C2','77A',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C2','77B',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('B3','76',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('B4','89',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C2','90',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C2','91A',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C2','91B',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('B4','92A',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('B4','92B',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C3','94A',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C3','94B',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C3','94C',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C3','95A',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C3','95B',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C3','500',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('B4','209',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('B4','210',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('B4','211',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('B4','216',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('B4','217',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('B4','218',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('B3','225',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C5','103A',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C5','103B',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('B4','226',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('D1','227',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('B3','201',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C2','40',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C1','324',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C3','333B',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('B4','218B',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C1','310E',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C5','100A',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C5','100B',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('B4','219',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('D2','235',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('D2','237',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C3','99',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C5','102',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C5','101A',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C1','310',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C2','231',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C2','232',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C2','233',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('D2','234',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('D2','236',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('D2','239',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C2','240',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C3','502',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C3','505',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('B4','503',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('B4','506',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('B4','507',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C5','512',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('B4','513',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C5','514',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('B4','515',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C5','517',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C5','521',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('B4','523',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('B4','524',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('B3','224',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('GC','GCT',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('POLIG1','259L',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('GC','GCU',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C5','101B',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C4','223',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C3','95C',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('B3','215',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('B3','75C',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('B3','74B',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('B3','201B',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('Condo','Condos',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('B3','76B',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('B4','210B',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('B4','217B',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C2','77C',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('B4','92C',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('B4','92D',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C3','95AB',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C3','95AC',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C3','95AD',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('B4','96C',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('B4','96D',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C2','90B',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C2','90C',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C2','91C',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C2','91D',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C3','94D',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C5','101C',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C5','101D',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C3','99B',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C5','521B',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C5','514B',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C5','100C',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C5','100D',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C5','100E',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C5','517B',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C4','222',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('CPLAZA','CPLAZA',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C3','213',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('B4','212',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('B4','216B',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C3','312',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('D1','309',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C5','529',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C5','526',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('B4','TELMX',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C5','527',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C1','57B',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('B4','ESCUE2',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C4','223B',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('D1','BONFL1',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('D1','251I',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('D1','251N',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('B3','201D',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C3','341',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C4','223C',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('D2','247',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C5','102B',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('D2','247B',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C4','222B',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C5','103C',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('B3','201C',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C5','528',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('D2','246',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('B3','224B',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C1','317',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C4','248',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C1','316',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('B4','523B',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('B3','215B',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('B4','205',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C4','248B',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C1','325',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C4','248C',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C4','248D',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C4','248E',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C4','248F',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C4','248G',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C1','326',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C1','316B',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('GC2','PLAYA',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C1','320',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C1','321',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('GC','GCT2',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('GC2','PTOCAN',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C3','336',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('POLIG1','259M',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C2','231B',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('B4','98B',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C4','248H',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C1','317B',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C2','233B',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('D2','237B',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C4','249C',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C1','325C',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C1','325D',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('B4','219B',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('D1','227C',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('D1','227D',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C4','249B',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('POLIG1','259N',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('B4','216C',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C3','330',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('GC','PTOCA2',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('B4','254C',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('B4','254',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C1','327',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('D1','251',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('GC2','PTOCA3',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C3','213B',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C5','103D',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C5','102D',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C2','214',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('GC2','6',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C4','248K',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('GC','GCT3',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C4','250B',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('D1','251O',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('D1','251P',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('B3','225B',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('B4','92E',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('B4','319',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('D1','251L',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('GC2','PTOCA5',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('C4','250D',1,'Canc�n',1);
Insert into APP.LCT_LOTETIPO (LOTE,RUTA,IDCOPR,COPR,EDO) values ('B4','ESCUE3',1,'Canc�n',1);
--------------------------------------------------------
--  Constraints for Table LCT_LOTETIPO
--------------------------------------------------------

  ALTER TABLE "APP"."LCT_LOTETIPO" MODIFY ("LOTE" NOT NULL ENABLE);
 
  ALTER TABLE "APP"."LCT_LOTETIPO" MODIFY ("RUTA" NOT NULL ENABLE);
 
  ALTER TABLE "APP"."LCT_LOTETIPO" MODIFY ("IDCOPR" NOT NULL ENABLE);
 
  ALTER TABLE "APP"."LCT_LOTETIPO" MODIFY ("COPR" NOT NULL ENABLE);
 
  ALTER TABLE "APP"."LCT_LOTETIPO" MODIFY ("EDO" NOT NULL ENABLE);
