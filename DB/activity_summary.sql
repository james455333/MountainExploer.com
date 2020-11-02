--------------------------------------------------------
--  已建立檔案 - 星期二-十月-13-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table ACTIVITY_SUMMARY
--------------------------------------------------------

  CREATE TABLE "ACTIVITY_SUMMARY" 
   (	"POST_ID" NUMBER(10,0), 
	"MEMBER_MEMBER_ID" VARCHAR2(150), 
	"NATIONAL_PARK_NAME" VARCHAR2(100), 
	"ROUTE_SUMMARY_NAME" VARCHAR2(150), 
	"ACT_NAME" VARCHAR2(150), 
	"ACT_PAY" NUMBER(7,0), 
	"START_DATE" DATE, 
	"END_DATE" DATE, 
	"TOTAL_DAY" VARCHAR2(50), 
	"REG_END_DATE" DATE, 
	"REG_TOP_NUM" NUMBER(2,0), 
	"ACT_OTHER" BLOB, 
	"POST_DATE" DATE, 
	"REG_NUM" NUMBER(3,0), 
	"MEMBER_EMAIL" VARCHAR2(150), 
	"MEMBER_NAME" VARCHAR2(150), 
	"MEMBER_EXP" VARCHAR2(150), 
	"NEAKNAME" VARCHAR2(150)
   ) ;
--------------------------------------------------------
--  DDL for Table NATIONAL_PARK
--------------------------------------------------------

  CREATE TABLE "NATIONAL_PARK" 
   (	"NAME" VARCHAR2(100)
   ) ;
--------------------------------------------------------
--  DDL for Table ROUTE_SUMMARY
--------------------------------------------------------

  CREATE TABLE "ROUTE_SUMMARY" 
   (	"NAME" VARCHAR2(150), 
	"DESCRIPTION" BLOB, 
	"ADVICE" BLOB, 
	"TRAFFIC" BLOB, 
	"NATIONAL_PARK_NAME" VARCHAR2(100), 
	"IMG_URL" BLOB
   ) ;
--------------------------------------------------------
--  DDL for Table ACTIVITY_SUMMARY
--------------------------------------------------------

  CREATE TABLE "ACTIVITY_SUMMARY" 
   (	"POST_ID" NUMBER(10,0), 
	"MEMBER_MEMBER_ID" VARCHAR2(150), 
	"NATIONAL_PARK_NAME" VARCHAR2(100), 
	"ROUTE_SUMMARY_NAME" VARCHAR2(150), 
	"ACT_NAME" VARCHAR2(150), 
	"ACT_PAY" NUMBER(7,0), 
	"START_DATE" DATE, 
	"END_DATE" DATE, 
	"TOTAL_DAY" VARCHAR2(50), 
	"REG_END_DATE" DATE, 
	"REG_TOP_NUM" NUMBER(2,0), 
	"ACT_OTHER" BLOB, 
	"POST_DATE" DATE, 
	"REG_NUM" NUMBER(3,0), 
	"MEMBER_EMAIL" VARCHAR2(150), 
	"MEMBER_NAME" VARCHAR2(150), 
	"MEMBER_EXP" VARCHAR2(150), 
	"NEAKNAME" VARCHAR2(150)
   ) ;
REM INSERTING into ACTIVITY_SUMMARY
SET DEFINE OFF;
--------------------------------------------------------
--  DDL for Index MEMBER_ACTIVITY_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MEMBER_ACTIVITY_PK" ON "ACTIVITY_SUMMARY" ("POST_ID") 
  ;
--------------------------------------------------------
--  Constraints for Table ACTIVITY_SUMMARY
--------------------------------------------------------

  ALTER TABLE "ACTIVITY_SUMMARY" MODIFY ("POST_ID" NOT NULL ENABLE);
  ALTER TABLE "ACTIVITY_SUMMARY" MODIFY ("MEMBER_MEMBER_ID" NOT NULL ENABLE);
  ALTER TABLE "ACTIVITY_SUMMARY" MODIFY ("NATIONAL_PARK_NAME" NOT NULL ENABLE);
  ALTER TABLE "ACTIVITY_SUMMARY" MODIFY ("ROUTE_SUMMARY_NAME" NOT NULL ENABLE);
  ALTER TABLE "ACTIVITY_SUMMARY" MODIFY ("ACT_NAME" NOT NULL ENABLE);
  ALTER TABLE "ACTIVITY_SUMMARY" ADD CONSTRAINT "MEMBER_ACTIVITY_PK" PRIMARY KEY ("POST_ID")
  USING INDEX  ENABLE;
  ALTER TABLE "ACTIVITY_SUMMARY" MODIFY ("ACT_PAY" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table ACTIVITY_SUMMARY
--------------------------------------------------------

  ALTER TABLE "ACTIVITY_SUMMARY" ADD CONSTRAINT "ACTIVITY_SUMMARY_NATIONAL_PARK_FK" FOREIGN KEY ("NATIONAL_PARK_NAME")
	  REFERENCES "NATIONAL_PARK" ("NAME") ON DELETE CASCADE ENABLE;
  ALTER TABLE "ACTIVITY_SUMMARY" ADD CONSTRAINT "ACTIVITY_SUMMARY_ROUTE_SUMMARY_FK" FOREIGN KEY ("ROUTE_SUMMARY_NAME")
	  REFERENCES "ROUTE_SUMMARY" ("NAME") ON DELETE CASCADE ENABLE;
