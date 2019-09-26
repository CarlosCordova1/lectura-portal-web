--------------------------------------------------------
-- Archivo creado  - viernes-agosto-31-2018   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table LCT_VARIABLES
--------------------------------------------------------

  CREATE TABLE "APP"."LCT_VARIABLES" 
   (	"IDTVAR" VARCHAR2(6 BYTE), 
	"TPOVAR" VARCHAR2(6 BYTE), 
	"VALOR" VARCHAR2(1000 BYTE), 
	"DESCRIPCION" VARCHAR2(2000 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "AGUAKAN" ;
 

   COMMENT ON COLUMN "APP"."LCT_VARIABLES"."IDTVAR" IS 'id de la variable';
 
   COMMENT ON COLUMN "APP"."LCT_VARIABLES"."TPOVAR" IS 'tipo de variable
';
 
   COMMENT ON COLUMN "APP"."LCT_VARIABLES"."VALOR" IS 'valor';
 
   COMMENT ON COLUMN "APP"."LCT_VARIABLES"."DESCRIPCION" IS 'descripción';
 
   COMMENT ON TABLE "APP"."LCT_VARIABLES"  IS 'variables de contactos';
REM INSERTING into APP.LCT_VARIABLES
SET DEFINE OFF;
Insert into APP.LCT_VARIABLES (IDTVAR,TPOVAR,VALOR,DESCRIPCION) values ('APPLCT','PRMSIS','1','Habilita (1) o deshabilita (0) el servicio de cálculo de las reconexiones y facturación automática de Reconexiones.');
Insert into APP.LCT_VARIABLES (IDTVAR,TPOVAR,VALOR,DESCRIPCION) values ('VERBD','INFO','0.1','Versión de la Base de Datos del módulo');
Insert into APP.LCT_VARIABLES (IDTVAR,TPOVAR,VALOR,DESCRIPCION) values ('FUABD','INFO','12/04/18 16:48:22','Fecha de actualización  dd/mm/yy hh24:mi:ss');
Insert into APP.LCT_VARIABLES (IDTVAR,TPOVAR,VALOR,DESCRIPCION) values ('LCT001','MSGAPI','Solicitud incorrecta del servicio','La invocación y/o parámetros no corresponde a la interpretación para su tratamiento.');
Insert into APP.LCT_VARIABLES (IDTVAR,TPOVAR,VALOR,DESCRIPCION) values ('LCT002','MSGAPI','Los servicios del API LCT estan desactivados','El servicio NO esta operando, cualquier aclaración favor de ponerse en contacto con la Mesa de Servicios.');
Insert into APP.LCT_VARIABLES (IDTVAR,TPOVAR,VALOR,DESCRIPCION) values ('LCT003','MSGAPI','No existe el servicio solicitado','El servicio solicitado no se encuentra dentro de las definiciones del API LCT.');
Insert into APP.LCT_VARIABLES (IDTVAR,TPOVAR,VALOR,DESCRIPCION) values ('DB000','MSGAPI','Sin resultados','Ha ocurrido un problema con la BD, la actividad fue interrumpida.');
Insert into APP.LCT_VARIABLES (IDTVAR,TPOVAR,VALOR,DESCRIPCION) values ('CAN','CENOPR','["2617"]','centro operacional cancun -> IDTAG');
Insert into APP.LCT_VARIABLES (IDTVAR,TPOVAR,VALOR,DESCRIPCION) values ('PDC','CENOPR',null,'centro operacional playa del carmen -> IDTAG');
Insert into APP.LCT_VARIABLES (IDTVAR,TPOVAR,VALOR,DESCRIPCION) values ('PMR','CENOPR',null,'centro operacional puerto morelos -> IDTAG');
Insert into APP.LCT_VARIABLES (IDTVAR,TPOVAR,VALOR,DESCRIPCION) values ('LEV','CENOPR',null,'centro operacional leona vicario -> IDTAG');
Insert into APP.LCT_VARIABLES (IDTVAR,TPOVAR,VALOR,DESCRIPCION) values ('ISM','CENOPR',null,'centro operacional isla mujeres -> IDTAG');
--------------------------------------------------------
--  DDL for Index PKLCT_VARIABLES_IDTVAR
--------------------------------------------------------

  CREATE UNIQUE INDEX "APP"."PKLCT_VARIABLES_IDTVAR" ON "APP"."LCT_VARIABLES" ("IDTVAR") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "AGUAKAN" ;
--------------------------------------------------------
--  Constraints for Table LCT_VARIABLES
--------------------------------------------------------

  ALTER TABLE "APP"."LCT_VARIABLES" ADD CONSTRAINT "PKLCT_VARIABLES_IDTVAR" PRIMARY KEY ("IDTVAR")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "AGUAKAN"  ENABLE;
 
  ALTER TABLE "APP"."LCT_VARIABLES" MODIFY ("IDTVAR" NOT NULL ENABLE);
 
  ALTER TABLE "APP"."LCT_VARIABLES" MODIFY ("TPOVAR" NOT NULL ENABLE);
