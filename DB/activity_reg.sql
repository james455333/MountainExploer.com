--------------------------------------------------------
--  已建立檔案 - 星期二-十月-13-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table ACTIVITY_REG
--------------------------------------------------------

  CREATE TABLE "ACTIVITY_REG" 
   (	"POST_ID" NUMBER, 
	"REG_MEMBER" BLOB
   ) ;
REM INSERTING into ACTIVITY_REG
SET DEFINE OFF;
--------------------------------------------------------
--  DDL for Index TABLE1_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "TABLE1_PK" ON "ACTIVITY_REG" ("POST_ID") 
  ;
--------------------------------------------------------
--  Constraints for Table ACTIVITY_REG
--------------------------------------------------------

  ALTER TABLE "ACTIVITY_REG" MODIFY ("POST_ID" NOT NULL ENABLE);
  ALTER TABLE "ACTIVITY_REG" ADD CONSTRAINT "TABLE1_PK" PRIMARY KEY ("POST_ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table ACTIVITY_REG
--------------------------------------------------------

  ALTER TABLE "ACTIVITY_REG" ADD CONSTRAINT "TABLE1_FK1" FOREIGN KEY ("POST_ID")
	  REFERENCES "ACTIVITY_SUMMARY" ("POST_ID") ON DELETE CASCADE ENABLE;
