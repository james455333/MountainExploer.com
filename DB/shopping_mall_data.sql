--------------------------------------------------------
--  已建立檔案 - 星期六-十月-03-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table BACKPACK_CLASS
--------------------------------------------------------

  CREATE TABLE "BACKPACK_CLASS" 
   (	"NAME" VARCHAR2(200), 
	"TYPE" VARCHAR2(100), 
	"PRICE" NUMBER(7,0), 
	"IMG_URL" BLOB, 
	"DESCRIPTION" BLOB, 
	"SECOND_CLASS" VARCHAR2(100), 
	"STOCK" NUMBER(6,0), 
	"FIRST_CLASS_ID" NUMBER(3,0), 
	"FIRST_CLASS_NAME" VARCHAR2(100)
   ) ;
--------------------------------------------------------
--  DDL for Table CLOTH_CLASS
--------------------------------------------------------

  CREATE TABLE "CLOTH_CLASS" 
   (	"NAME" VARCHAR2(200), 
	"TYPE" VARCHAR2(100), 
	"PRICE" NUMBER(7,0), 
	"IMG_URL" BLOB, 
	"DESCRIPTION" BLOB, 
	"SECOND_CLASS" VARCHAR2(100), 
	"STOCK" NUMBER(6,0), 
	"FIRST_CLASS_ID" NUMBER(3,0), 
	"FIRST_CLASS_NAME" VARCHAR2(100)
   ) ;
--------------------------------------------------------
--  DDL for Table FIRST_CLASS
--------------------------------------------------------

  CREATE TABLE "FIRST_CLASS" 
   (	"ID" NUMBER(3,0), 
	"NAME" VARCHAR2(100)
   ) ;
--------------------------------------------------------
--  DDL for Table KITCHEN_CLASS
--------------------------------------------------------

  CREATE TABLE "KITCHEN_CLASS" 
   (	"NAME" VARCHAR2(200), 
	"TYPE" VARCHAR2(100), 
	"PRICE" NUMBER(7,0), 
	"IMG_URL" BLOB, 
	"DESCRIPTION" BLOB, 
	"SECOND_CLASS" VARCHAR2(100), 
	"STOCK" NUMBER(6,0), 
	"FIRST_CLASS_ID" NUMBER(3,0), 
	"FIRST_CLASS_NAME" VARCHAR2(100)
   ) ;
--------------------------------------------------------
--  DDL for Table LIGHT_CLASS
--------------------------------------------------------

  CREATE TABLE "LIGHT_CLASS" 
   (	"NAME" VARCHAR2(200), 
	"TYPE" VARCHAR2(100), 
	"PRICE" NUMBER(7,0), 
	"IMG_URL" BLOB, 
	"DESCRIPTION" BLOB, 
	"SECOND_CLASS" VARCHAR2(100), 
	"STOCK" NUMBER(6,0), 
	"FIRST_CLASS_ID" NUMBER(3,0), 
	"FIRST_CLASS_NAME" VARCHAR2(100)
   ) ;
--------------------------------------------------------
--  DDL for Table OTHER_CLASS
--------------------------------------------------------

  CREATE TABLE "OTHER_CLASS" 
   (	"NAME" VARCHAR2(200), 
	"TYPE" VARCHAR2(100), 
	"PRICE" NUMBER(7,0), 
	"IMG_URL" BLOB, 
	"DESCRIPTION" BLOB, 
	"SECOND_CLASS" VARCHAR2(100), 
	"STOCK" NUMBER(6,0), 
	"FIRST_CLASS_ID" NUMBER(3,0), 
	"FIRST_CLASS_NAME" VARCHAR2(100)
   ) ;
--------------------------------------------------------
--  DDL for Table PERSONAL_CLASS
--------------------------------------------------------

  CREATE TABLE "PERSONAL_CLASS" 
   (	"NAME" VARCHAR2(200), 
	"TYPE" VARCHAR2(100), 
	"PRICE" NUMBER(7,0), 
	"IMG_URL" BLOB, 
	"DESCRIPTION" BLOB, 
	"SECOND_CLASS" VARCHAR2(100), 
	"STOCK" NUMBER(6,0), 
	"FIRST_CLASS_ID" NUMBER(3,0), 
	"FIRST_CLASS_NAME" VARCHAR2(100)
   ) ;
--------------------------------------------------------
--  DDL for Table PROCLIMB_CLASS
--------------------------------------------------------

  CREATE TABLE "PROCLIMB_CLASS" 
   (	"NAME" VARCHAR2(200), 
	"TYPE" VARCHAR2(100), 
	"PRICE" NUMBER(7,0), 
	"IMG_URL" BLOB, 
	"DESCRIPTION" BLOB, 
	"SECOND_CLASS" VARCHAR2(100), 
	"STOCK" NUMBER(6,0), 
	"FIRST_CLASS_ID" NUMBER(3,0), 
	"FIRST_CLASS_NAME" VARCHAR2(100)
   ) ;
--------------------------------------------------------
--  DDL for Table PROMECH_CLASS
--------------------------------------------------------

  CREATE TABLE "PROMECH_CLASS" 
   (	"NAME" VARCHAR2(200), 
	"TYPE" VARCHAR2(100), 
	"PRICE" NUMBER(7,0), 
	"IMG_URL" BLOB, 
	"DESCRIPTION" BLOB, 
	"SECOND_CLASS" VARCHAR2(100), 
	"STOCK" NUMBER(6,0), 
	"FIRST_CLASS_ID" NUMBER(3,0), 
	"FIRST_CLASS_NAME" VARCHAR2(100)
   ) ;
--------------------------------------------------------
--  DDL for Table SHOES_CLASS
--------------------------------------------------------

  CREATE TABLE "SHOES_CLASS" 
   (	"NAME" VARCHAR2(200), 
	"TYPE" VARCHAR2(100), 
	"PRICE" NUMBER(7,0), 
	"IMG_URL" BLOB, 
	"DESCRIPTION" BLOB, 
	"SECOND_CLASS" VARCHAR2(100), 
	"STOCK" NUMBER(6,0), 
	"FIRST_CLASS_ID" NUMBER(3,0), 
	"FIRST_CLASS_NAME" VARCHAR2(100)
   ) ;
--------------------------------------------------------
--  DDL for Table TENT_CLASS
--------------------------------------------------------

  CREATE TABLE "TENT_CLASS" 
   (	"NAME" VARCHAR2(200), 
	"TYPE" VARCHAR2(100), 
	"PRICE" NUMBER(7,0), 
	"IMG_URL" BLOB, 
	"DESCRIPTION" BLOB, 
	"SECOND_CLASS" VARCHAR2(100), 
	"STOCK" NUMBER(6,0), 
	"FIRST_CLASS_ID" NUMBER(3,0), 
	"FIRST_CLASS_NAME" VARCHAR2(100)
   ) ;
--------------------------------------------------------
--  DDL for Table WATER_CLASS
--------------------------------------------------------

  CREATE TABLE "WATER_CLASS" 
   (	"NAME" VARCHAR2(200), 
	"TYPE" VARCHAR2(100), 
	"PRICE" NUMBER(7,0), 
	"IMG_URL" BLOB, 
	"DESCRIPTION" BLOB, 
	"SECOND_CLASS" VARCHAR2(100), 
	"STOCK" NUMBER(6,0), 
	"FIRST_CLASS_ID" NUMBER(3,0), 
	"FIRST_CLASS_NAME" VARCHAR2(100)
   ) ;
REM INSERTING into BACKPACK_CLASS
SET DEFINE OFF;
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Osprey DayLite Plus 輕便小背包 20L 黑 10000409','型號：10000409',2610,'30公升以下小型背包',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Osprey 輕量背包 18L 黑 Hikelite 18 10001555','型號：10001555',3600,'30公升以下小型背包',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('EXPED 防水背包 25L 紅寶石 CLOUDBURST 25 1203000449','型號：1203000449',1680,'30公升以下小型背包',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Hanchor 可卸式快扣組-2入 YKK AC60 MOLLE Buckle','型號：AC60',100,'30公升以下小型背包',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('DEUTER 3400118 FUTURA 24 網架透氣背包 24L 湖綠','型號：3400118-3388',3400,'30公升以下小型背包',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Osprey Arcane Small Day 10 輕便小背包 星空藍 10002443','型號：10002443',3510,'30公升以下小型背包',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('MYSTERY RANCH 神秘農場 RIP RUCK 24 背包 綠灰 61273','型號：61273-Foliage',4950,'30公升以下小型背包',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('mont-bell #1123649 Pocketable 輕量攻頂小背包 20L 黑','型號：1123649-BLK',1090,'30公升以下小型背包',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('MYSTERY RANCH 神秘農場 RIP RUCK 24 背包 黑 61273','型號：61273-Black',4950,'30公升以下小型背包',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Fjallraven 多功能背包 20L 石頭灰 Singi 20 #23319','型號：23319-018',2970,'30公升以下小型背包',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Hanchor 輕量快收攻頂背包 18L 黑 CINDER','型號：CINDER',2690,'30公升以下小型背包',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Fjallraven 小狐狸 登山健行背包 女 風暴藍/暗深藍 Keb 52 W #27344','型號：27344-638-555',8820,'45公升以上大型背包、登山背包',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Mystery Ranch 神秘農場 Pack Fly 背包套 L 幻影灰 70-105L 60060','型號：60060-Charcoal',1000,'45公升以上大型背包、登山背包',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Mystery Ranch 神秘農場 登山健行背包 男 深海藍 TERRAFRAME 65 #61245','型號：61245',15300,'45公升以上大型背包、登山背包',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Gregory 網架透氣背包 JADE 33 女 優雅灰 111571','型號：111571-7414',6100,'30-45公升中型背包',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Gregory 登山背包 Stout 45L 男 茴香綠 126872','型號：126872-1333',5920,'30-45公升中型背包',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Fjallraven 登山健行網架式背包 45L 深森綠 Abisko Friluft 45 27211-662','型號：27211-662',5850,'30-45公升中型背包',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Fjallraven 登山健行網架式背包 女 45L 深森綠 Abisko Friluft 45W 27213-662','型號：27213-662',5850,'30-45公升中型背包',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Deuter FOX 登山健行/休閒旅遊拔熱背包 40+4L 藍/深藍 3613118','型號：3613118-3033',3240,'30-45公升中型背包',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Grivel Zen 30 輕量技術攀登背包 30L 重量820g！','型號：ZAZEN30',4900,'30-45公升中型背包',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('RHINO 犀牛 G633 攻頂包 33L 黃/黑','型號：G633-y',840,'30-45公升中型背包',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Mystery Ranch 神秘農場 Scree 多功能後背包 32L 黑 61202','型號：61202-Black',6480,'30-45公升中型背包',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Osprey TEMPEST 30 輕量背包 30L 神秘紅','型號：10000877/10000876',4950,'30-45公升中型背包',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Fjallraven 健行中背包 海軍藍 Kaipak 38 27085','型號：27085-560',5850,'30-45公升中型背包',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Fjallraven 小狐狸 17吋電腦雙肩後背包 紫紅 20L Kanken Laptop 17" 27173','型號：27173-420',2200,'Fjallraven Kanken 後背包(小狐狸包)',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Mystery Ranch 神秘農場 登山健行背包 男 草綠 TERRAFRAME 50 #61246','型號：61246',13500,'45公升以上大型背包、登山背包',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('HANCHOR MARL 輕量化登山背包 51L 藍','型號：OD20',7990,'45公升以上大型背包、登山背包',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('DEUTER 3400118 FUTURA 24 網架透氣背包 24L 梅紅/紫紅','型號：3400118-5528',3400,'30公升以下小型背包',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('OSPREY HIKELITE 18L 輕量背包 椎茸灰 10001559','型號：10001559',3600,'30公升以下小型背包',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('RHINO Dry Stuff Pack 捲頂式攻頂背包 26L 黑/橘','型號：G526-BK/YL',880,'30公升以下小型背包',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Mammut Seon 3-Way 三用旅行背包/攀登包 18L 黑','型號：03910-001',5380,'30公升以下小型背包',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Mystery Ranch 神秘農場 Booty Bag 背包 20L 黑','型號：60004-Black',1800,'30公升以下小型背包',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Mammut Trion Zip 輕量攀登背包 22L 黯青','型號：2510-03490-5611',3940,'30公升以下小型背包',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Osprey 輕量背包 20L 女 TEMPEST 20 #10000891','型號：10000891',3960,'30公升以下小型背包',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Mystery Ranch 神秘農場 Booty Bag 背包 20L 梨紅','型號：60004-Plum',1800,'30公升以下小型背包',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Mystery Ranch 神秘農場 Booty Bag 背包 20L 炭灰','型號：60004-Charcoal',1800,'30公升以下小型背包',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Fjallraven 小狐狸 23501 Chest Strap Long 長胸扣帶 粉紅','型號：23501-312',20,'Kanken 背包配件',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Fjallraven K?nken Mini Shoulder Pads 背包減壓墊 霧灰','型號：23504-021',50,'Kanken 背包配件',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Fjallraven 小狐狸 23504 Kanken Mini 背包減壓肩墊 聯合藍','型號：23504-525',50,'Kanken 背包配件',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('HILLEBERG 史特龍裝備袋 180L 黑 Carrier Bag 0321961','型號：0321961',990,'裝備袋',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('KAZMI 經典民族風裝備收納袋120L 紅','型號：K5T3B001',490,'裝備袋',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('KAZMI 經典民族風裝備收納袋 70L 紅色','型號：K5T3B010',90,'裝備袋',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('嘉隆 BG-014 420D防潑水中型裝備袋','型號：BG-014',0,'裝備袋',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('100mountain 安納普娜遠征裝備袋 100L','型號：MK-100-06',760,'裝備袋',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Pacsafe 550 夜燈密碼鎖 黑','型號：PA-PE269BK',48,'旅行袋、行李箱',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Osprey Shuttle 28" 80L 旅行箱 / 拖輪旅行背包 綠','型號：139628-juniper',910,'旅行袋、行李箱',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Lowe Alpine FTR26 AT Explorer 自助旅行子母拖輪背包/行李箱 70+30L 煤炭黑','型號：FTR-26-AN',1730,'旅行袋、行李箱',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Pacsafe 550 夜燈密碼鎖 綠','型號：PA-PE269GR',48,'旅行袋、行李箱',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('DEUTER 3320319 AIRCONTACT 55+10 拔熱式透氣背包 55+10L 藍','型號：3320319-3365',6800,'45公升以上大型背包、登山背包',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Osprey Aether AG 70 輕量登山背包 70L 男 日落橙 10000659/10000660','型號：10000659/10000660',12150,'45公升以上大型背包、登山背包',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Osprey Archeon 45 牧草綠 男 10002404','型號：10002404',10800,'45公升以上大型背包、登山背包',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Osprey 10001801 VOLT 登山健行背包 60L 波特藍','型號：10001801',8280,'45公升以上大型背包、登山背包',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('OSPREY KYTE 46 輕量健行登山背包 女 46L 桑葚紫 10001833/10001834','型號：10001833/10001834',7020,'45公升以上大型背包、登山背包',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Osprey Kestrel 48 輕量背包 48L 叢林綠','型號：10000152/151',6840,'45公升以上大型背包、登山背包',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('OSPREY AETHER AG 85 登山健行背包 男 85L 海星藍','型號：10000653/10000654',13050,'45公升以上大型背包、登山背包',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Gregory Deva 登山背包 70L 女 安地卡綠 91625','型號：91625-6399',13050,'45公升以上大型背包、登山背包',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Osprey Xenith 75 輕量登山背包 男 藍','型號：010475-607',13050,'45公升以上大型背包、登山背包',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('GREGORY STOUT 45L 登山背包 煤灰 77838-5588','型號：77838-5588',5920,'45公升以上大型背包、登山背包',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Fjallraven 小狐狸 23612-976 Kanken Art Laptop 13" 電腦雙肩後背包 13L 寓言綠','型號：23612-976',2970,'Fjallraven Kanken 後背包(小狐狸包)',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Fjallraven Kanken Classic 小狐狸經典後背包 16L 黑/條紋','型號：23510-550-901',2610,'Fjallraven Kanken 後背包(小狐狸包)',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Fjallraven Kanken Classic 小狐狸經典後背包 16L 深藍','型號：23510-527',2610,'Fjallraven Kanken 後背包(小狐狸包)',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Fjallraven 小狐狸 Kanken Art 15 吋電腦背包 18L 白樺森林 23613-977','型號：23613-977',3240,'Fjallraven Kanken 後背包(小狐狸包)',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Fjallraven 小狐狸 27172 Kanken Laptop 15&quot; 電腦雙肩後背包18L 公牛紅','型號：27172-326',2000,'Fjallraven Kanken 後背包(小狐狸包)',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Fjallraven 小狐狸 23510 Kanken Classic 經典後背包16L 空氣藍','型號：23510-508',1500,'Fjallraven Kanken 後背包(小狐狸包)',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Fjallraven 小狐狸 23568 Kanken No.2 Laptop 15吋電腦後背包18L 黑','型號：23568-550',4950,'Fjallraven Kanken 後背包(小狐狸包)',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Fjallraven 小狐狸 23548 Re-Kanken 後背包16L 春綠 環保愛地球','型號：23548-607',2610,'Fjallraven Kanken 後背包(小狐狸包)',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Fjallraven 小狐狸 23561 Kanken Mini 經典迷你後背包7L 深紫/紫羅蘭','型號：23561-580/465',2250,'Fjallraven Kanken 後背包(小狐狸包)',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Fjallraven 小狐狸 23500 Chest Strap 胸扣帶 溫暖黃','型號：23500-141',80,'Kanken 背包配件',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Fjallraven 小狐狸 23503 Kanken Classic 背包減壓肩墊 粉紅','型號：23503-312',40,'Kanken 背包配件',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('犀牛 #685-1 大空鋁架','型號：#685-1',680,'登山背架',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('鋁製空背架 柴山揹水 標準款','型號：1201000319',100,'登山背架',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('犀牛 ＃685 豪華型大外架背包 85L','型號：#685',280,'登山背架',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('100mountain 不銹鋼擔架背包','型號：1015318018',0,'登山背架',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('透氣型鋁製空背架 柴山揹水 舒適款','型號：00121200',410,'登山背架',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Osprey Poco AG Raincover 孩童背架遮雨罩 電光綠','型號：10000126',390,'嬰兒登山背架',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('OSPREY POCO AG CARRYING CASE 攜行袋 黑','型號：10000125',800,'嬰兒登山背架',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Osprey Ultralight Padded Organizer 配件包 灰','型號：242003-514',50,'登山配件包',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Mystery Ranch 神秘農場 Bottle Pocket 水壺配件包 黑','型號：60061-Black',0,'登山配件包',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Hanchor OD21-X50 X-PAC 手機包 黑迷彩','型號：OD21-X50 MULTICAM ARMY BLACK',690,'登山配件包',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Osprey Ultralight Padded Organizer 配件包 橘','型號：242003-801',50,'登山配件包',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Osprey Ultralight Padded Organizer 配件包 綠','型號：242003-719',50,'登山配件包',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('MYSTERY RANCH 神秘農場 拖輪行李箱/裝備袋 Mission Wheelie 80 黑 80L 61250','型號：61250',2420,'旅行袋、行李箱',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Hanchor Surface Mini 輕量斜背包 黑','型號：OD05-BK',80,'斜背包、胸前包',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Mystery Ranch 神秘農場 Quick Draw Binocular Harness 胸前袋 狼棕','型號：61082-Coyote',520,'斜背包、胸前包',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Mystery Ranch 神秘農場 Big Bop 隨身包 2.4L 黑','型號：60041-Black',980,'斜背包、胸前包',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Hanchor OD24 FACET 輕量隨身斜背小包 寶石藍-黃','型號：OD24-BY',290,'斜背包、胸前包',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Fjallraven 單肩背包 2.5L 公牛紅 Kanken Sling 23797-326','型號：23797-326',160,'單肩背包、側背包',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Stream Trail Sucker Mini 防水隨身包 瑪瑙黑','型號：1203000436',180,'單肩背包、側背包',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Fjallraven 單肩小背包 2.5L 粉紅 Kanken Sling 23797-312','型號：23797-312',160,'單肩背包、側背包',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Fjallraven Vardag Totepack 托特包 20L 風暴藍 27240-638','型號：27240-638',340,'單肩背包、側背包',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('ArcTeryx 始祖鳥 14263 Lunara 10 輕便防水側背包/斜背包 紫羅蘭 出清特賣','型號：14263-23263',10,'單肩背包、側背包',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Fjallraven 小狐狸 24250 Kiruna 雙肩筆電背包 15L 深橄欖','型號：24250-633',880,'筆電包',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('FJALLRAVEN K?NKEN LAPTOP CASE 13 筆電保護袋 黑','型號：23787-550',800,'筆電包',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Fjallraven 小狐狸 24250 Kiruna 雙肩筆電背包 15L 海軍藍','型號：24250-560',880,'筆電包',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Fjallraven 小狐狸 24251 Kiruna 雙肩筆電背包 22L 黑','型號：24251-550',420,'筆電包',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Fjallraven 小狐狸 24250 Kiruna 雙肩筆電背包 15L 黑','型號：24250-550',880,'筆電包',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Hanchor Surface Mini 輕量斜背包 藍橘','型號：OD05-BO',80,'斜背包、胸前包',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('LowePro Photo Sport Sling 100 AW 攝影單肩相機包 橘','型號：11844808',200,'相機包',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('LowePro Classified 200 AW 克萊斯相機包','型號：10509005',320,'相機包',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('MYSTERY RANCH 神秘農場 相機包 DSLR Chest Rig 3L 黑 61255','型號：61255',420,'相機包',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('LowePro Classified Sling 180 AW 克萊斯彈弓相機背包','型號：10576700',40,'相機包',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Mountainsmith Hobo FX 相機包','型號：D48115065',60,'相機包',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Osprey POCO Sunshade 孩童背架遮陽罩','型號：015016',0,'嬰兒登山背架',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Kelty Pathfinder 3.0 孩童背架背包 21L 藍','型號：20651212-BL',1520,'嬰兒登山背架',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Deuter 3690219 Kid Comfort 嬰兒背架遮陽罩 墨黑','型號：3690219',80,'嬰兒登山背架',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('100mountain 百岳背包套 狼棕 MK-100-01','型號：MK-100-01',399,'背包套',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('The Peak 百岳地圖 背包套 XXL 鈦灰 (適用70L ? 90L)','型號：The Peak 70L-90L',480,'背包套',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('The Peak 百岳地圖 背包套 XL 冰雪藍 (適用55L ? 70L)','型號：The Peak 55L-70L',480,'背包套',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('The Peak 百岳地圖 背包套 S 冰雪藍 (適用20L ? 30L)','型號：The Peak 20L-30L',480,'背包套',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('The Peak 百岳地圖 背包套 L 橄欖 (適用40L ? 55L)','型號：The Peak 40L-55L',480,'背包套',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('嘉隆 背包頭帶背帶','型號：E-230',130,'背包套',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Mystery Ranch 神秘農場 Hooded Pack Fly 背包套 附頭套 M 45-70L 炭灰','型號：60059-M',2230,'背包套',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Mystery Ranch 神秘農場 Hooded Pack Fly 背包套 附頭套 L 70-105L 炭灰','型號：60059-L',2320,'背包套',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Fjallraven 小狐狸 旅行護照包 海軍藍 Passport Wallet 24220','型號：24220-560',1530,'旅行隨身袋、護照包、錢包',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Sea to Summit RFID 旅行用安全錢包 L 藍','型號：ATLTWRFIDLBL',1240,'旅行隨身袋、護照包、錢包',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Fjallraven 收納袋 綠 Gear Pocket 24215-620','型號：24215-620',630,'旅行隨身袋、護照包、錢包',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Fjallraven 小狐狸 皮夾 綠 Zip Wallet 24216','型號：24216-620',1260,'旅行隨身袋、護照包、錢包',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Fjallraven 小狐狸 皮夾 深灰 Zip Wallet 24216','型號：24216-030',1260,'旅行隨身袋、護照包、錢包',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Deuter 隱藏式錢包 黑 Security Wallet I 3942016','型號：3942016-7000',310,'旅行隨身袋、護照包、錢包',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Sea To Summit Money Belt RFID 旅行安全藏錢腰包','型號：ATLMBRFID',990,'旅行隨身袋、護照包、錢包',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Deuter 隱藏式錢包 卡其 Security Wallet I 3942016','型號：3942016-6010',310,'旅行隨身袋、護照包、錢包',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Sea to Summit Passport Pouch RFID 旅行安全頸掛式證件袋 2袋口','型號：ATLNPRFIDS',760,'旅行隨身袋、護照包、錢包',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Fjallraven 小狐狸 24219 Travel Wallet 旅行大護照包 深紅','型號：24219-325',1710,'旅行隨身袋、護照包、錢包',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Lowe Alpine Mesh Stuffsac 網狀收納袋 黑 M','型號：FAE-58-BL-M',290,'衣物收納袋、盥洗包',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Lowe Alpine TT Wash Bag 立體盥洗包-大','型號：LS0071-089',890,'衣物收納袋、盥洗包',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Sea To Summit Padded Soft Cell 輕量防撞收納包 S號 桃紅','型號：ATLPSCSBE',880,'衣物收納袋、盥洗包',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Sea To Summit Toiletry Bags 旅行用盥洗袋 藍/淺灰','型號：ATLTBSBL / ATLTBLBL',880,'衣物收納袋、盥洗包',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('ARC''TERYX 始祖鳥 腰包 深女神紅 MAKA 1 #17171','型號：17171-28695',1590,'腰包',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Arc''Teryx 始祖鳥 多功能腰包 黑 Mantis 2L 25818','型號：25818-BLK',1880,'腰包',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Fjallraven 小狐狸 腰包 4L 黑 Ulvo Hip Pack Large 23166','型號：23166-550',2250,'腰包',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('ARC''TERYX 始祖鳥 MAKA 1 腰包 叢林綠 17171','型號：17171-27763',1590,'腰包',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('DEUTER 39024 ORGANIZER BELT 腰包 1.8L 紫','型號：39024-5026',630,'腰包',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Lowe Alpine FAD36 Lightflite 5 健行跑步腰包 青蘋綠','型號：FAD36-CI',720,'腰包',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Lowe Alpine FAD36 Lightflite 5 健行跑步腰包 波斯綠','型號：FAD36-PE',720,'腰包',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Lowe Alpine FAD36 Lightflite 5 健行跑步腰包 天堂藍','型號：FAD36-OL',720,'腰包',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('MYSTERY RANCH 神秘農場 HIP MONKE 腰背包 8L 黑 60064','型號：60064-Black',2250,'腰包',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Coghlans #1955 Silicone Travel Bottles 矽膠旅行瓶罐 透明','型號：#1955',225,'衣物收納袋、盥洗包',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Coghlans #8525 旅行瓶罐組 Contain-alls','型號：#8525',297,'衣物收納袋、盥洗包',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Sea To Summit Travelling Light Shoe Bag 輕量旅遊鞋袋 L號 黑','型號：ATLSBLBK',880,'衣物收納袋、盥洗包',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Coghlans #9869 網狀收納袋 Mesh Ditty Bag Set','型號：9869',126,'衣物收納袋、盥洗包',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Coghlans #658 肥皂便攜盒 Soap Holder','型號：#658',72,'衣物收納袋、盥洗包',100,50,'backpack_class');
Insert into BACKPACK_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Coghlans #8319 粗網收納袋 Nylon Dunk Bag 19 x 23','型號：#8319',99,'衣物收納袋、盥洗包',100,50,'backpack_class');
REM INSERTING into CLOTH_CLASS
SET DEFINE OFF;
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('CRAFT 全天候長袖涼感排汗衣 男 深灰 COOL COMFORT RN LS 1904917','型號：1904917-1998',980,'長袖排汗衣(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Mont-bell 防曬長袖快乾排汗衣/防曬外套 男 鮮黃綠 Cool Parka 1114460','型號：1114460-FRGN',1680,'長袖排汗衣(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Craft 長袖圓領排汗衣 男 瑞典藍 ADV Essence LS T 1908754','型號：1908754-360000',970,'長袖排汗衣(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Mammut 長袖圓領排汗衣 辛辣紅 Sertig 00020','型號：00020-3445',2520,'長袖排汗衣(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('MAMMUT PERFORMANCE THERMAL ZIP LONG SLEEVE 長袖排汗衣 男 深水鴨綠','型號：00090-4494',3130,'長袖排汗衣(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Fjallraven Bergtagen Woolterry Hoodie 羊毛衫 男 灰','型號：F83990-020',4680,'長袖排汗衣(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('ODLO #152022 機能保暖型排汗內衣 男 軍綠','型號：152022-40141',1660,'長袖排汗衣(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Mammut 長袖圓領排汗衣 龍膽花 Sertig 00020','型號：00020-5213',2520,'長袖排汗衣(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Mammut Sertig Longsleeve 長袖排汗衣 男 黑','型號：00020-0001',2410,'長袖排汗衣(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('ARCTERYX 始祖鳥 PHASE AR 開襟保暖排汗衣 男 機長灰','型號：16261-25787',3400,'長袖排汗衣(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('100MOUNTAIN 保暖排汗內衣V領 男 鐵灰色 全程台灣製造，第二件只要600元','型號：MA07-93',1200,'長袖排汗衣(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Fjallraven Varmland Woolterry Half Zip M 羊毛排汗衣 男 石頭灰 90838-018','型號：90838-018',4680,'長袖排汗衣(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('mont-bell #1114124 Wickron Zip 長袖半門襟排汗衣 男 黑','型號：1114124-BK',1500,'長袖排汗衣(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Craft Wool Comfort 全天候長袖羊毛衣 男 黑','型號：1905345-999975',1850,'長袖排汗衣(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('RAB INTERVAL LONG SLEEVE ZIP TEE 長袖拉鍊排汗衣 男 墨藍','型號：QBT-77-IK',1530,'長袖排汗衣(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Fjallraven Pine Half Zip 保暖排汗衣 亞洲版 男 風暴藍','型號：81446-638',2340,'長袖排汗衣(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Mont-bell 快乾排汗衣 中性 深藍 Wickron T Zero-Point Logo Ganpeki 1114476','型號：1114476-DKNV',990,'短袖排汗衣(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Snow Peak Lounge Shell 印花T恤 白','型號：TS-20SU1060-WH',1500,'短袖排汗衣(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('CRAFT 短袖排汗衣 男 深灰 ADV Essence SS Tee 1908753','型號：1908753-975000',830,'短袖排汗衣(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('CRAFT 短袖排汗衣 男 墨綠 ADV Essence SS Tee 1908753','型號：1908753-664000',830,'短袖排汗衣(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Mont-bell 防曬長袖快乾排汗衣/防曬外套 女 石墨藍 Cool Parka W 1114461','型號：1114461-GRBL',1680,'長袖排汗衣(女)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Mammut 長袖拉鍊排汗衣 女 火龍果 Performance Thermal Zip LS W 00101-3547','型號：00101-3547',3130,'長袖排汗衣(女)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('CRAFT 長袖拉鍊排汗衣 女 粉紅 1903173','型號：1903173-2403',1250,'長袖排汗衣(女)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Craft 長袖圓領排汗衣 女 螢光桃紅 ADV Essence LS T W 1908769','型號：1908769-410000',970,'長袖排汗衣(女)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Fjallraven 小狐狸 Abisko Wool LS W 長袖羊毛排汗衣 女 暗深藍 84102','型號：84102-555',2340,'長袖排汗衣(女)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Mammut Performance Dry Zip 長袖排汗衣 女 桃紅','型號：00210-6085',2680,'長袖排汗衣(女)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('CRAFT 輕量保暖長袖圓領排汗衣 女 黑 WARM COMFORT #1906583','型號：1906583-999000',910,'長袖排汗衣(女)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Mammut Sertig T-Shirt 圓領長袖排汗衣 女 桃紅','型號：00040-6085',2410,'長袖排汗衣(女)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('MAMMUT MOENCH ADVANCED HALF ZIP 長袖排汗衣 女 夜藍 艾格極限EXTREME系列','型號：09940-5924',4480,'長袖排汗衣(女)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('RAB POWER STRETCH PRO PULL-ON 保暖排汗衣 女 醬果紫 POWER STRETCH? PRO','型號：QFE-63-BY',2980,'長袖排汗衣(女)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('ODLO #110211 Revolution X-Warm 加強保暖型前開襟羊毛內衣 女 麻紫紅','型號：110211-30225',4140,'長袖排汗衣(女)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('ODLO #110151 Revolution Warm 機能保暖型羊毛內衣 女 海軍藍','型號：110151-20227',3240,'長袖排汗衣(女)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('ArcTeryx 始祖鳥 Phase AR 開襟保暖排汗衣 女 杜鵑花紫','型號：16251-25864',3400,'長袖排汗衣(女)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('100mountain 3635 銀纖維長袖排汗衣 女 暗紅','型號：3635.6571',500,'長袖排汗衣(女)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('ODLO #152022 機能保暖型排汗內衣 男 鈷藍','型號：152022-20221',1660,'長袖排汗衣(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('ODLO #152022 機能保暖型排汗內衣 男 深灰','型號：152022-18900',1660,'長袖排汗衣(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('ODLO #110152 Revolution Warm 機能保暖型羊毛內衣 男 黑','型號：110152-15015',3240,'長袖排汗衣(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('ODLO #152012 高領機能保暖型排汗內衣 男 灰','型號：152012-15700',1840,'長袖排汗衣(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Craft Zero Extreme 長袖拉鍊T領排汗衣 男 黑','型號：194610-2999',1320,'長袖排汗衣(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Craft Zero Extreme 長袖圓領排汗衣 男 白','型號：1900254-3900',990,'長袖排汗衣(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Craft Zero Extreme 長袖立領排汗衣 男 亮藍 六折出清','型號：190983-2330',990,'長袖排汗衣(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Craft Zero Extreme 長袖圓領排汗衣 男 黑/白','型號：1900254-9920',1400,'長袖排汗衣(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Craft Keep Warm Wool 長袖圓領保暖羊毛衣 男 黑','型號：1901648-9980',3120,'長袖排汗衣(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('ODLO #152021 機能保暖型排汗內衣 女 白','型號：152021-10000',1660,'長袖排汗衣(女)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Craft 1903409 Active Extreme 長袖圓領排汗衣 女 紫格紋','型號：1903409-2463',1400,'長袖排汗衣(女)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Craft Zero Extreme 長袖圓領排汗衣 女 黑','型號：1900245-2999',1400,'長袖排汗衣(女)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Craft Zero Extreme 長袖圓領排汗衣 女 桃紅','型號：1900245-1477',1400,'長袖排汗衣(女)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Craft Keep Warm Wool 長袖圓領保暖羊毛衣 女 桃紅','型號：1902342-1475',3120,'長袖排汗衣(女)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Craft Wool Comfort 全天候長袖拉練羊毛排汗衣 女 黑','型號：1904483-9999',1850,'長袖排汗衣(女)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Mammut Atacazo Light Zip T-SHIRT 短袖排汗衣 男 鈦金灰','型號：07690-00013',2250,'短袖排汗衣(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Mammut Atacazo Light Zip T-SHIRT 短袖排汗衣 男 獵戶藍','型號：07690-5870',2250,'短袖排汗衣(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Fjallraven 有機棉T恤 女 石灰岩 Deer Print T-Shirt W 89879','型號：89879-217',1260,'短袖排汗衣(女)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Mammut 短袖排汗衣 女 日落紅 Moench Light W 00060','型號：00060-3500',2950,'短袖排汗衣(女)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Fjallraven 有機棉T恤 男 石頭灰 L?gerplats T-Shirt 81950','型號：81950-018',1260,'短袖排汗衣(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('ArcTeryx 始祖鳥 15518 Cormac Crew SS 短袖圓領排汗衣 男 葉綠','型號：15518-27781',2540,'短袖排汗衣(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Fjallraven 小狐狸 短袖羊毛排汗衣 淺橄欖 Abisko Wool Taltplats M 87001','型號：87001-622',1980,'短袖排汗衣(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Mont-bell #1107181 ZEOLINE COOL MESH V-NECK TEE V領短袖內衣 男 白','型號：1107181-WT',800,'短袖排汗衣(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Mammut Mountain T-Shirt 短袖排汗衣 男 波賽頓藍','型號：09842-50171',1780,'短袖排汗衣(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Mont-bell #1114154 Wickron T mont-bell 短袖快乾T恤 中性款 橙紅','型號：1114154-OGRD',990,'短袖排汗衣(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Icebreaker Anatomica 美麗諾彈性短袖排汗衣 男 條紋海水藍','型號：102202-301',2590,'短袖排汗衣(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('MAMMUT PERFORMANCE DRY ZIP T-SHIRT 短袖排汗衣 男 海洋藍','型號：00440-5118',2320,'短袖排汗衣(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('ODLO #347652 銀離子短袖排汗衣 男 橘紅 七折出清','型號：347652-30211',1540,'短袖排汗衣(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Montane Mojave 莫哈維四向彈性衫 男 影灰出清特賣!','型號：MMOSHSHA',1248,'短袖排汗衣(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Mammut MTR 71 Advanced T-Shirt 短袖排汗衣 男 大西洋藍','型號：09350-5865',2070,'短袖排汗衣(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Craft 1903249 PR 輕量網布排汗背心 男 水藍 七折出清','型號：1903249-2317',616,'短袖排汗衣(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Mammut Trovat Advanced T-Shirt 快乾短袖排汗衣 男 空氣藍','型號：09840-5906',1780,'短袖排汗衣(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Mammut Massone T-Shirt 棉質休閒T恤 男 石墨灰','型號：07091-0397',1600,'短袖排汗衣(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Mammut Pacific Crest 快乾短袖襯衫 男 海草綠','型號：01970-4546',610,'快乾襯衫(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Mont-bell #1104582 Wickron Light 女款輕爽快乾長袖襯衫 藍格','型號：1104582-SKB',560,'快乾襯衫(女)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Arc&#039;Teryx 始祖鳥 15580 Fernie Shirt 短袖襯衫 女 復古象牙白','型號：15580-23285',240,'快乾襯衫(女)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Fjallraven 小狐狸 長袖混紡襯衫 女 霧灰 Ovik Travel Shirt LS W 89843','型號：89843-021',880,'快乾襯衫(女)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('ODLO #522881 彈性快乾短袖襯衫 女 深紫 七折出清','型號：522881-70147',680,'快乾襯衫(女)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('MAMMUT KIRSI SHORTSLEEVE SHIRT 短袖襯衫 女 大理石白/紅','型號：02021-00107',410,'快乾襯衫(女)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Mammut Runbold Shorts 快乾短褲 男 海洋藍','型號：06873-5118',860,'快乾短褲、七分褲(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Craft 1907229 Casual Shorts M 休閒短褲 男 黑','型號：1907229-999000',420,'快乾短褲、七分褲(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('MAMMUT RUNBOLD LIGHT SHORTS 快乾透氣戶外短褲 男 冠藍鴉','型號：09872-50011',680,'快乾短褲、七分褲(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('HOUDINI 267634 M''s Crux Shorts 快乾短褲 男 蘆葦米','型號：267634-967',220,'快乾短褲、七分褲(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Mammut 短袖排汗衣 女 藏青 QD Logo Print T-Shirt AF W02020-50339','型號：02020-50339',2140,'短袖排汗衣(女)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Arc''Teryx 始祖鳥 快乾圓領短袖排汗衣 女 黑 TOLU TOP SS 23034','型號：23034-BLK',2350,'短袖排汗衣(女)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Fjallraven 89878 Owl Print T-Shirt W 有機棉T恤 女 大叔藍','型號：89878-520',1260,'短袖排汗衣(女)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Icebreaker 101003 Aero 美麗諾彈性短袖圓領排汗衣 女 天使紅','型號：101003-603',2320,'短袖排汗衣(女)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('ODLO #22216 削肩排汗POLO衫 女 松石綠 七折出清','型號：222161-40157',1680,'短袖排汗衣(女)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('ArcTeryx 始祖鳥 Taema Crew SS W 18909 短袖圓領快乾排汗衣 女 雅典娜灰','型號：18909-25406',2640,'短袖排汗衣(女)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('ArcTeryx 始祖鳥 18915 PHASIC EVOLUTION CREW SS 圓領短袖排汗衣 女 野花粉','型號：18915-26266',2830,'短袖排汗衣(女)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Icebreaker Cool-Lite 美麗諾羊毛輕涼紗短袖排汗衣 女 條紋淡紫','型號：104067-501',1680,'短袖排汗衣(女)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Craft 198842 小LOGO短袖圓領排汗衣 女 黑','型號：198842-1999',474,'短袖排汗衣(女)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Mammut MTR 71 Advanced T-Shirt 短袖排汗衣 女 大西洋藍','型號：09360-5865',2070,'短袖排汗衣(女)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Craft COOL 短袖圓領排汗衣 女 桃紅 七折出清','型號：193684-1474',1176,'短袖排汗衣(女)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Mammut MTR 71 Advanced T-Shirt 短袖排汗衣 女 小檗紅','型號：09360-3218',2070,'短袖排汗衣(女)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Craft COOL 短袖圓領排汗衣 女 水藍 七折出清','型號：193684-1334',1176,'短袖排汗衣(女)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Fjallraven Singi Trekking Shirt LS G1000 長袖襯衫 男 深灰 81838','型號：81838-030',420,'快乾襯衫(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('MAMMUT 長袖襯衫 男 水鴨藍/藍寶石 Alvra Longsleeve Shirt M''s Wing Teal-Sapphire 00510-50266','型號：00510-50266',320,'快乾襯衫(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Mammut Trovat Trail Shortsleeve Shirt 短袖襯衫 男 波賽頓藍','型號：00071-50134',520,'快乾襯衫(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('MAMMUT ASKO SHIRT 短袖襯衫 男 石墨灰/紅','型號：01533-00101',520,'快乾襯衫(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Fjallraven 小狐狸 輕量健行短褲 女 草原棕/淺橄欖 Abisko Midsummer Shorts W 89857','型號：89857-235-622',240,'快乾短褲、七分褲(女)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Mammut Runbold Light 透氣快乾短褲 女 空氣藍','型號：09921-5906',680,'快乾短褲、七分褲(女)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Mammut Runbold Light Shorts 快乾短褲 女 翡翠綠','型號：09920-4534',680,'快乾短褲、七分褲(女)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Craft Joy shorts 超輕量飄飄褲 女 桃紅印花','型號：1903958-2070',70,'快乾短褲、七分褲(女)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Mont-bell #1105572 Cliff Light Pants 彈性快乾長褲 男 石灰藍','型號：1105572-SLBL',2190,'快乾長褲(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('100mountain 吸濕排汗休閒褲 灰','型號：99011S-Grey',1280,'快乾長褲(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('ArcTeryx 始祖鳥 23026 SABREO PANT 彈性快乾長褲 男 黑','型號：23026-BLK',5010,'快乾長褲(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Fjallraven 81535-220-246 Abisko Lite Trekking Zip-Off Trousers 兩截褲 男 沙棕/暗棕綠','型號：81535-220-246',5670,'快乾長褲(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Mammut SOFtech Trekkers 快乾軟殼長褲 男 波賽頓藍','型號：09760-50134',3940,'快乾長褲(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Montane Terra Pants 泰拉輕量耐磨長褲 男 石墨灰 七折出清','型號：MTEPRGRA (MTEPAGRA)',2975,'快乾長褲(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Fjallraven 81761 Barents Pro Trousers G1000-Original 耐磨長褲 男 鐵鏽','型號：81761-372',4320,'快乾長褲(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('ODLO #331782 快乾彈性長褲 男 淺卡其','型號：331782-14600',1980,'快乾長褲(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Fjallraven 81185 Ruaha G1000-Lite 耐磨長褲 男 淺卡其','型號：81185-236',3780,'快乾長褲(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Arc''Teryx 始祖鳥 彈性短褲 女 夜月藍 CRESTON SHORT 4.5 #23015','型號：23015-28705',400,'快乾短褲、七分褲(女)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Mammut Aenergy SO Pants 軟殼長褲 男 石墨灰','型號：10480-0121',7110,'快乾長褲(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('ODLO #347341 彈性快乾跑步運動長褲 女 黑','型號：347341-15000',2340,'快乾長褲(女)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Fjallraven 89634 High Coast Trousers 耐磨長褲 女 山灰','型號：89634-032',2970,'快乾長褲(女)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('ArcTeryx 始祖鳥 23012 CRESTON PANT 彈性快乾長褲 女 黑','型號：23012-BLK',4630,'快乾長褲(女)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('ArcTeryx 始祖鳥 20930 MICA PANT 彈性快乾長褲 女 威爾斯灰','型號：20930-26283',4730,'快乾長褲(女)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('ArcTeryx 始祖鳥 彈性快乾長褲 女 月夜藍 CRESTON PANT #23012','型號：23012-28705',4630,'快乾長褲(女)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('RAB MOTIVE PANTS W 登山長褲 女 丁香棕','型號：QFT-89-CV',2580,'快乾長褲(女)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('FJALLRAVEN KEB TOURING TROUSERS W 彈性長褲 女 深榴紅/夜空藍','型號：89799S-356-575',7200,'快乾長褲(女)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Fjallraven 小狐狸 輕量健行長褲 鯊魚灰/超級灰 Abisko Midsummer Trousers 81152R','型號：81152R-016-046',4680,'快乾長褲(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Fjallraven 小狐狸 兩截長褲 男 深灰/黑 Abisko Lite Trekking Zip-Off Trousers 81535','型號：81535R-030-550',5670,'快乾長褲(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Fjallraven Vidda Pro Ventilated Trousers Reg M 耐磨長褲 男 月桂綠/深森綠 81160R-625-662','型號：81160R-625-662',4950,'快乾長褲(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Fjallraven 小狐狸 G1000 短褲 男 Barents Pro Shorts 82467','型號：82467-030-030',240,'快乾短褲、七分褲(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Fjallraven 小狐狸 輕量健行長褲 草原棕/淺橄欖 Abisko Midsummer Trousers 81152R','型號：81152R-235-622',4680,'快乾長褲(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Fjallraven Vidda Pro Ventilated Trousers Reg M 耐磨長褲 男 深灰/黑 81160R-030-550','型號：81160R-030-550',4950,'快乾長褲(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('HOUDINI 羊毛三角內褲 女 丁香紫 W''S Desoli Hipsters 158414-075','型號：158414-075',510,'排汗內褲、運動內衣(女)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('CRAFT 四角排汗內褲 女 印花藍 Greatness Waistband Boxer W 1906044','型號：1906044-134007',60,'排汗內褲、運動內衣(女)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('ODLO #140271 Boxer CUBIC 排汗四角內褲 女 淺藍 六折出清','型號：140271-26702',30,'排汗內褲、運動內衣(女)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Outdoor Research 96435 VOODOO 彈性抗風軟殼褲 女 灰','型號：243896(96435)-890',3560,'機能保暖褲(女)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Outdoor Research 92371 Radiant Hybrid Tights 彈性刷毛保暖褲 女 黑','型號：92371-001',1980,'機能保暖褲(女)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Craft 1903661 Light Wool 輕羊毛長袖拉鍊中層衣 男 灰','型號：1903661-2995',950,'刷毛中層衣(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Fjallraven Singi Fleece Jacket M 中層刷毛保暖夾克 男 石頭灰 87305-018','型號：87305-018',930,'刷毛中層衣(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Fjallraven 89456 Nilla G1000-Original/Silent 耐磨長褲 女 沙棕','型號：89456-220',3780,'快乾長褲(女)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('ODLO #524231 彈性休閒長褲 女 黑 100mount','型號：524231-15000',990,'快乾長褲(女)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Montane Terra Alpine Pants 泰拉彈性耐磨長褲 女 深褐 七折出清','型號：FTAPATAU',2590,'快乾長褲(女)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('ODLO #160242 Ceramicool 排汗四角內褲 男 鋼鐵灰/黑','型號：160242-10401',20,'排汗內褲、運動內衣(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('ODLO #140272 Boxer CUBIC 排汗四角內褲 男 鐵灰','型號：140272-93090',40,'排汗內褲、運動內衣(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('HOUDINI 257954 M''s Dynamic Boxers 排汗四角內褲 男 憂傷藍','型號：257954-047',510,'排汗內褲、運動內衣(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('HOUDINI 258414 M''s Desoli Boxers 羊毛四角內褲 男 純黑','型號：258414-900',510,'排汗內褲、運動內衣(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Icebreaker Anatomica 美麗諾羊毛四角內褲 灰','型號：103029-002',780,'排汗內褲、運動內衣(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('TESS WSP805 Silver Fresh Platinum保暖型排汗褲-男款-深藍','型號：WSP805-2',2000,'機能保暖褲(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Wildland 彈性抗風保暖長褲 男 沙丘褐 #OA72306','型號：OA72306-107',2220,'機能保暖褲(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('mont-bell #1105441 Lining Cargo 防潑水彈性軟殼褲 男 淺卡其','型號：1105441-LTN',2960,'機能保暖褲(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Mammut 保暖排汗褲 男 黑 Aconcagua ML Tights Men 00210-00205','型號：00210-00205',4140,'機能保暖褲(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('ODLO #152042 機能保暖型衛生褲 男 軍綠','型號：152042-43700',1570,'機能保暖褲(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Craft Extreme UnderPants 排汗長褲 男 黑/白','型號：190985-9920',1400,'機能保暖褲(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Craft PR 保暖競跑長褲 男 黑','型號：1903019-9999',1850,'機能保暖褲(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Outdoor Research 52372 Radiant Hybrid Tights 彈性刷毛保暖褲 男 黑','型號：52372-001',2200,'機能保暖褲(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Craft Zero Extreme UnderPants 排汗長褲 男 黑','型號：190985-2999',1400,'機能保暖褲(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Craft PR 保暖競跑長褲 男 黑/藍','型號：1903019-9345',1850,'機能保暖褲(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('100mountain 1312 抗風防潑水保暖雪褲 softshell 女 黑','型號：1312-01',1000,'機能保暖褲(女)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Craft Zero Extreme UnderPants 排汗長褲 女 黑','型號：190989-2999',1400,'機能保暖褲(女)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('ArcTeryx 始祖鳥 16249 Phase AR 保暖排汗褲 女 黑','型號：16249-BLK',3110,'機能保暖褲(女)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Dare 2b DWW399 Attract II 防水保暖透氣吊帶滑雪褲 女 女爵粉','型號：DWW399-5BG',3480,'機能保暖褲(女)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Wildland 抗風防潑水保暖褲 softshell 女 黑 #0A72305','型號：0A72305-54',1980,'機能保暖褲(女)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Outdoor Research 96435 VOODOO 彈性抗風軟殼褲 女 綠','型號：96435-824',3560,'機能保暖褲(女)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('ODLO #110101 Revolution Light 機能排汗型羊毛內褲 女 深麻灰','型號：110101-15700',440,'排汗內褲、運動內衣(女)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('ODLO #130281 Medium Padded Sports Bra 彈性寬肩運動型內衣 女 桃紅/橘/印花','型號：130281-70357',800,'排汗內褲、運動內衣(女)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Pajak Shadow 輕量羽絨背心 男 黑 歐規 750FP','型號：Shadow-men-black',950,'多功能背心、保暖背心(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Fjallraven Greenland Down Liner Vest M 羽絨背心 男 暮灰 82973-042','型號：82973-042',990,'多功能背心、保暖背心(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('mont-bell 刷毛保暖背心 男 牙白','型號：1106529-IV',970,'多功能背心、保暖背心(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Craft Safety Vest 反光背心 螢光黃','型號：192480-1850',20,'多功能背心、保暖背心(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Icebreaker Sierra 260 美麗諾羊毛保暖背心 女 黑','型號：100542-001',920,'多功能背心、保暖背心(女)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('MONT-BELL 羽絨背心 女 黑 800FP、129G SUPERIOR DOWN VEST #1101469','型號：1101469-BK',100,'多功能背心、保暖背心(女)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('mont-bell #1106560 Light Shell Vest Women''s 防風軟殼背心 女 榴紅','型號：1106560-GARN',860,'多功能背心、保暖背心(女)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Mont-Bell #1101364 Light Alpine 羽絨背心 女 綠','型號：1101364-LEGN',800,'多功能背心、保暖背心(女)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('mont-bell #1103256 O.D. HOOD 防風連帽薄背心 女 海軍藍','型號：1103256-NV',10,'多功能背心、保暖背心(女)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Fjallraven 89663 Vika 套頭羊毛衫 女 冰河藍','型號：89663-511',780,'刷毛中層衣(女)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Fjallraven 89765A Keb Fleece 羊毛混紡保暖刷毛夾克 女 深榴紅','型號：89765A-356',670,'刷毛中層衣(女)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Fjallraven 89765A Keb Fleece 羊毛混紡保暖刷毛夾克 女 冰河綠','型號：89765A-646',670,'刷毛中層衣(女)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Fjallraven 88755 Louise 套頭羊毛衫 女 亞麻','型號：88755-107',600,'刷毛中層衣(女)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Fjallraven Bergtagen Woolterry Hoodie W 羊毛衫 女 灰','型號：F89871-020',680,'刷毛中層衣(女)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Craft 1903208 輕量網格防潑外套 男 藍彩印 Performance Run跑者系列','型號：1903208-2344',530,'風衣(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Mammut Convey WB Hoooded Windbreaker Jacket 輕量風衣 男 黑/白','型號：00110-00226',760,'風衣(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('FJALLRAVEN 89847-042 High Coast Shade Jacket W 輕量透氣夾克 女 暮灰','型號：89847-042',950,'風衣(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('FJALLRAVEN 82997-217 High Coast Shade Jacket M 輕量透氣夾克 男 石灰岩','型號：82997-217',950,'風衣(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Montane Lite-Speed Jacket 光點輕量風衣 男 旗幟紅','型號：MLIJA_RED',140,'風衣(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Fjallraven 小狐狸 輕量風衣 女 草原棕/淺橄欖 Abisko Midsummer Jacket W 89826','型號：89826-235-622',480,'風衣(女)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Mont-bell #1103215 Ultra Light 防撥水終極輕量化風衣 女 黃 七折出清','型號：1103215-CYL',485,'風衣(女)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Mammut Convey WB Hoooded Windbreaker Jacket 輕量風衣 女 黑/白','型號：00120-00226',760,'風衣(女)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Mont-bell #1103215Ultra Light 防撥水終極輕量化風衣 女 天藍 七折出清','型號：1103215-FRBL',485,'風衣(女)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Craft 1902205 PR 反光防風跑步外套 女 橘紅','型號：1902205-2825',970,'風衣(女)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('MONT-BELL #1101564 COLORADO VEST MEN''S 雙面羽絨背心 男 靛藍/日落橙 650 FILL POWER、393G','型號：1101564-ID/SO',490,'多功能背心、保暖背心(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('MAMMUT CRUISE MIDLAYER PULLOVER ZIPPED M 彈性保暖衣 男 帝國藍','型號：00290-F079',400,'刷毛中層衣(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('mont-bell Trail Action Pullover Men''s 保暖半襟上衣 男 黑 1106632-BK','型號：1106632-BK',880,'刷毛中層衣(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('KAMA 458 美麗諾羊毛保暖衫 男 白','型號：458-101',650,'刷毛中層衣(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('MONT-BELL 羽絨長版外套 男 紅褐 Husky Coat #1101547','型號：1101547-RUST',7020,'羽絨外套、化纖保暖外套(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('MAMMUT 羽絨外套 男 水鴨藍/藍寶石 Broad Peak Hooded Jacket M''s 01140-50266','型號：01140-50266',12420,'羽絨外套、化纖保暖外套(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Mont-Bell #1101493 Plasma 1000 Down 極致超輕羽絨外套 男 黑','型號：1101493-BK',10800,'羽絨外套、化纖保暖外套(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Mammut Broad Peak Light IN 保暖羽絨外套 男 獵戶藍','型號：18380-5325',10080,'羽絨外套、化纖保暖外套(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Mont-Bell #1101528 Plasma 1000 頂級羽絨連帽外套 男 磚紅','型號：1101528-RDBR',12630,'羽絨外套、化纖保暖外套(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Mont-Bell #1101474 Ex Light Down 極致超輕羽絨外套 男 黃綠','型號：1101474-CHARS',7920,'羽絨外套、化纖保暖外套(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Mont-Bell #1101416 Ex Light Down 極致超輕羽絨外套 男 藍','型號：1101416-CBL',7980,'羽絨外套、化纖保暖外套(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Mammut Broad Peak in Hooded Jacket 保暖羽絨連帽外套 男 鈦金灰','型號：1010-18460-0051',10620,'羽絨外套、化纖保暖外套(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Mammut Broad Peak in Hooded Jacket 保暖羽絨連帽外套 男 大西洋','型號：1010-18460-5865',10620,'羽絨外套、化纖保暖外套(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Mammut Rime Pro in Hooded Jacket 保暖化纖連帽外套 男 石墨灰','型號：1010-21880-0129',10620,'羽絨外套、化纖保暖外套(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Rab Microlight Alpine Jacket 輕量羽絨保暖外套 男 亮綠','型號：QDA-42-KW',6970,'羽絨外套、化纖保暖外套(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Mammut Whitehorn 兩面穿保暖羽絨外套 男 鈦金灰/大西洋藍','型號：22200-0094',6990,'羽絨外套、化纖保暖外套(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Mammut Meron IN Hooded 羽絨外套 女 黑 900FP','型號：01200-0001',17280,'羽絨外套、化纖保暖外套(女)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Mammut Eigerjoch Pro Hooded Down Jacket 抗水羽絨化纖保暖外套 女 黑 00230-0001','型號：00230-0001',22320,'羽絨外套、化纖保暖外套(女)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Arcteryx 始祖鳥 Durant Coat Women''s 防水化纖保暖外套 女 黑','型號：18156-BLK',20800,'羽絨外套、化纖保暖外套(女)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('ArcTeryx 始祖鳥 24006 Proton LT Hoddy Women''s 化纖保暖連帽外套 女 神話綠','型號：24006-27777',12160,'羽絨外套、化纖保暖外套(女)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('MAMMUT XERON DOWN HOODY 羽絨外套 女 水相藍','型號：00080-5009',12420,'羽絨外套、化纖保暖外套(女)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Mont-Bell #1101345 Ex Light Down 極致超輕羽絨外套 女 白','型號：1101345-OF',7450,'羽絨外套、化纖保暖外套(女)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Mont-Bell #1101475 Ex Light Down 極致超輕羽絨外套 女 白','型號：1101475-OF',7560,'羽絨外套、化纖保暖外套(女)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('ArcTeryx 始祖鳥 24007 Proton LT Hoddy Men''s 化纖保暖連帽外套 男 海王星','型號：24007-23893',12160,'羽絨外套、化纖保暖外套(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Mont-Bell #1101407 Alpine Down Parka Men''s 羽絨外套 男 黑','型號：1101407-BK',6140,'羽絨外套、化纖保暖外套(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('RAB Photon Pro 化纖保暖外套 男 神聖藍','型號：QIO-46-CE',5930,'羽絨外套、化纖保暖外套(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Mammut Miva in Hooded Jacket 保暖羽絨連帽外套 女 黑','型號：1010-18500-0001',10620,'羽絨外套、化纖保暖外套(女)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Mammut Whitehorn 兩面穿保暖羽絨外套 女 石墨灰/熔岩紅','型號：21690-0963',6990,'羽絨外套、化纖保暖外套(女)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Mont-bell #1106445 Ultra Light 防潑水彈性保暖風衣 女 紅寶/卡其 七折出清','型號：1106445-RBPB',2590,'刷毛保暖外套、軟殼衣(女)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Fjallraven Greenland Jacket W G-1000 小狐狸夾克 女 霜綠','型號：89997A-664',7920,'刷毛保暖外套、軟殼衣(女)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Mammut Ultimate Hoody 防風保暖軟殼外套 女 黑','型號：1010-14931-0052',11520,'刷毛保暖外套、軟殼衣(女)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Mammut Ultimate Hoody 防風保暖軟殼外套 女 紫絨藤','型號：1010-14931-6225',11520,'刷毛保暖外套、軟殼衣(女)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Outdoor Research 96400 Transfer Jacket 軟殼外套 女 黑 六折出清','型號：96400-001',3720,'刷毛保暖外套、軟殼衣(女)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Craft Merch Leisure FZ Hood 連帽保暖外套 女 瑞典藍 瑞典滑雪隊服','型號：1902132-3336',1788,'刷毛保暖外套、軟殼衣(女)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('MAMMUT 軟殼外套 女 速克達/火龍果 Ultimate V Hooded Softshell Jacket W''s 00341-3568','型號：00341-3568',11250,'刷毛保暖外套、軟殼衣(女)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Montane Volt Hoodie 刷毛保暖連帽外套 女 黑','型號：FVOHO-BLA',4970,'刷毛保暖外套、軟殼衣(女)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Craft 1903651 Warm Hood 連帽刷毛保暖外套 女 黑/桃紅','型號：1903651-9410',1680,'刷毛保暖外套、軟殼衣(女)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('FJALLRAVEN KEB TOURING JACKET M G1000 彈性夾克 男 黑','型號：87210-550',9900,'刷毛保暖外套、軟殼衣(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('CRAFT SOFTSHELL HIGHLAND JACKET M 連帽防風保暖外套 男 灰藍','型號：1905072-947563',2270,'刷毛保暖外套、軟殼衣(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Fjallraven Keb Fleece Hoodie 連帽保暖夾克 男 深灰/黑 #81878','型號：81878-030-550',5670,'刷毛保暖外套、軟殼衣(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('RAB Shadow Hoody M 保暖軟殼外套 男 墨藍','型號：QFE-85-IK',4230,'刷毛保暖外套、軟殼衣(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('MAMMUT 軟殼外套 男 速克達/黑 Ultimate V Hooded Softshell Jacket M''s 00351-3567','型號：00351-3567',11250,'刷毛保暖外套、軟殼衣(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Fjallraven 82257 Abisko Trail 刷毛連帽夾克/外套 男 冰河綠','型號：82257-646',3870,'刷毛保暖外套、軟殼衣(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Craft Active Full Zip Hood 連帽保暖外套 男 灰/紅','型號：1901680-2395',2440,'刷毛保暖外套、軟殼衣(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Craft 1903659 Warm Hood 連帽刷毛保暖外套 男 深灰','型號：1903659-2995',1680,'刷毛保暖外套、軟殼衣(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Montane Volt 刷毛保暖外套 男 閃電藍','型號：MVOJA-ELE',4530,'刷毛保暖外套、軟殼衣(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Craft 1903659 Warm Hood 連帽刷毛保暖外套 男 藍','型號：1903659-2344',1680,'刷毛保暖外套、軟殼衣(男)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('FJALLRAVEN KEB LITE JACKET W 彈性夾克 女 石頭灰/黑','型號：89996-018-550',7380,'刷毛保暖外套、軟殼衣(女)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('mont-bell #1101479 Colorado 兩面穿羽絨連帽外套 女 藍紫/薰衣草紫','型號：1101479-IB/LA',6840,'羽絨外套、化纖保暖外套(女)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Mont-Bell #1101345 Ex Light Down 極致超輕羽絨外套 女 紫紅','型號：1101345-MULB',7450,'羽絨外套、化纖保暖外套(女)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Fjallraven 89309 Kiruna 化纖保暖外套 女 深藍','型號：89309-555',9450,'羽絨外套、化纖保暖外套(女)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Mammut Rime Tour 保暖化纖外套 女 黑','型號：21900-0001',4320,'羽絨外套、化纖保暖外套(女)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Outdoor Research 97800 Chaos Jacket 化纖保暖外套 女 黑 WINDSTOPPER、PRIMALOFT','型號：978000-001',6720,'羽絨外套、化纖保暖外套(女)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Mammut Miva in Hooded Jacket 保暖羽絨連帽外套 女 大西洋藍','型號：1010-18500-5865',10620,'羽絨外套、化纖保暖外套(女)',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Mammut Nordwand Advanced HS Hooded 風雨衣 男 黑','型號：26910-0001',26820,'GoreTex風雨衣',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('MAMMUT GTX 風雨衣外套 男 橄欖綠/藍 CONVEY TOUR HS 27840','型號：27840-40123',8800,'GoreTex風雨衣',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('MAMMUT GTX 超輕量防水外套 女 藏青 Convey Tour HS 27850','型號：27850-50125',8800,'GoreTex風雨衣',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Mont-bell 雨中舞者 GTX 風雨衣 女 鈷藍 Rain Dancer Jacket Women''s 1128619','型號：1128619-SLBL',6100,'GoreTex風雨衣',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Arc''Teryx 始祖鳥 防水風雨衣 男 神話綠 Beta LT 18007','型號：18007-2777',19760,'GoreTex風雨衣',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('MAMMUT MERON LIGHT HS GORE-TEX 風雨衣 女 甜菜根 GORE-TEX ACTIVE','型號：25990-3490',16020,'GoreTex風雨衣',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Mammut Meron Light HS Gore-Tex 風雨衣 男 帝國藍','型號：25970-5528',16020,'GoreTex風雨衣',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Grifone 西班牙 brenva Gore-Tex Performance 兩件式風雨衣 女 綠 Gore-Tex 羽絨衣，六折特價！','型號：A5C009D-432',5850,'GoreTex風雨衣',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Haglofs 602495 L.I.M Versa 輕量風雨衣 男 紅/藍','型號：602495-2CP',8000,'GoreTex風雨衣',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Mountain Equipment Arcadia 輕量風雨衣 女 藍 GORE-TEX Active 六折出清','型號：Me-000572-01012',10140,'GoreTex風雨衣',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Mammut Teton Jacket 風雨衣 男 海洋藍 Gore-Tex','型號：17421-5118',19350,'GoreTex風雨衣',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Mammut Nordwand Pro 風雨衣 男 黯青 Gore-Tex Pro、Extreme系列','型號：1010-18170-5359',30420,'GoreTex風雨衣',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Mammut Teton HS Jacket 風雨衣 男 大西洋藍 Gore-Tex','型號：17423-5872',19350,'GoreTex風雨衣',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Mountain Equipment Arcadia 輕量風雨衣 男 影灰 GORE-TEX Active 六折出清','型號：Me-000571-01011',10140,'GoreTex風雨衣',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Mammut Ridge HS Hooded Jacket 風雨衣 女 空氣藍Gore-Tex','型號：21861-5906',17820,'GoreTex風雨衣',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('RAB Nexus JKT 高透氣防水外套 男 紋章藍 Polartec? NeoShell ，直接透氣！','型號：QWE-85-BZ',1810,'防水透氣風雨衣',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Mont-bell 防水透氣風雨衣 女 紫紅/粉紅 Thunder Pass Jacket W 1128636','型號：1128636-PL/CP',960,'防水透氣風雨衣',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Mont-bell 防水透氣風雨衣 女 藍莓/午夜藍 Thunder Pass Jacket W 1128636','型號：1128636-BB/MB',960,'防水透氣風雨衣',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Mont-bell 防水透氣外套 男 初級藍 Rain Hiker Jacket 1128600','型號：1128600-PRBL',790,'防水透氣風雨衣',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Buff Polar 保暖頭巾 Plus 只近黃昏 BF120918','型號：BF120918-555',70,'保暖頭巾',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('BUFF Polartec 雙面保暖頭巾 蕨類叢生','型號：BF101162',70,'保暖頭巾',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('BUFF Thermal Pro 保暖頭巾 復古拼接','型號：BF108952',150,'保暖頭巾',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('BUFF WINDSTOPPER 防風抽繩領巾 PURITO','型號：BF108726',420,'保暖頭巾',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Buff 雙面 Polar 保暖頭巾 Plus 黑白撞色 BF121501','型號：BF121501-937',70,'保暖頭巾',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('BUFF MASK 針織保暖帽 冷灰藍 BFL120824','型號：BFL120824-787',1060,'保暖帽、毛帽',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Fjallraven 小狐狸 羊毛帽 中性款 石墨灰 Byron Hat 77388','型號：77388-031',1350,'保暖帽、毛帽',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Fjallraven 小狐狸 保暖帽 深灰 Singi Field Cap 77295','型號：77295-030',1710,'保暖帽、毛帽',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Fjallraven Keb Eco-Shell W 防水外套 女 暗深藍 89600-555','型號：89600-555',2000,'防水透氣風雨衣',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('mont-bell #1128347 Thunder Pass 防水透氣風雨褲 女 灰黑','型號：1128347-GM',610,'防水透氣雨褲',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Haglofs 602407 VANDRA II Q PANT 防水透氣風雨褲 女 鋼琴黑','型號：602407-2C5',250,'防水透氣雨褲',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('ArcTeryx 始祖鳥 Gore-tex 防水雨褲 女 黑 Zeta SL # 21781','型號：21781-BLK',480,'防水透氣雨褲',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('mont-bell #1128574 Thunder Pass 防水透氣雨褲 男 灰','型號：1128574-GM',340,'防水透氣雨褲',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Mountain Equipment FireLite 輕量GTX防水透氣雨褲 男 黑','型號：22078',780,'防水透氣雨褲',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Outdoor Research Wrigley Cap 保暖護耳棒球帽 藍 271532-1566','型號：271532-1566',1620,'保暖帽、毛帽',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Fjallraven 小狐狸 羊毛保暖帽 中性款 深灰/灰 BYRON HAT 77388','型號：77388-030/020',1350,'保暖帽、毛帽',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Mammut Snow Beanie 羊毛保暖帽 水鴨藍/椒橙','型號：00101-50265',1150,'保暖帽、毛帽',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Craft 197614 BIG LOGO HAT保暖帽 黑','型號：197614-2999',810,'保暖帽、毛帽',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('MAMMUT SNOW BEANIE 造型保暖帽 海洋藍','型號：00100-F036',1150,'保暖帽、毛帽',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('SnowTravel AR-64 保暖帽 花紋紅 Polartec Classic 100','型號：AR-64-red',490,'保暖帽、毛帽',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('SnowTravel AR-13 保暖帽 中性款 黃','型號：AR-13-YELLOW',400,'保暖帽、毛帽',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Komperdell Fleece Balaclava Hood 刷毛保暖頭罩(魔鬼帽)','型號：6210-02',880,'保暖帽、毛帽',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Outdoor Research 243358 ARETE 二件式保暖手套 男 灰黑','型號：243358-0189(74944-189)',2980,'保暖手套',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Outdoor Research 71892 ALTI MITTS 保暖併指手套 黑','型號：71892-001',7200,'保暖手套',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Fjallraven 小狐狸 經典棒球帽 綠 Fikapaus 78140','型號：78140-620',1080,'遮陽帽',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Fjallraven 小狐狸 透氣棒球帽 草原棕 Abisko Hike Lite Cap 77402','型號：77402-235',1080,'遮陽帽',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Arc''Teryx 始祖鳥 LOGO 網帽 粉灰/藻綠/提洛斯灰 BIRD TRUCKER HAT 23968','型號：23968-28748',1400,'遮陽帽',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Fjallraven 小狐狸 遮陽圓盤帽 深灰 Hatfield Hat 79258','型號：79258-030',1530,'遮陽帽',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Mammut 防水圓盤帽 橄欖綠 Machu Hat 02914','型號：02914-4072',1890,'遮陽帽',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Mont-bell 超輕量折疊傘 藍 超輕量 150g TREKKING UMBRELLA 1128550','型號：1128550-BLBK',1580,'遮陽帽',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Mammut 00020-00240 Lhasa Cap 鴨舌帽 亞麻','型號：00020-00240',990,'遮陽帽',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Snow Peak 防潑水漁夫帽 黑 UG-824BK','型號：UG-824BK',2600,'遮陽帽',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Buff 健行帽 摩登森林 Trek Cap BF123158','型號：BF123158-851',970,'遮陽帽',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Snow Peak TAKIBI 漁夫帽 橄欖綠 UG-823OL','型號：UG-823OL',2300,'遮陽帽',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Outdoor Research 透氣棒球帽/遮陽網帽/鴨舌帽 咖啡/石榴紅 Advocate Trucker Cap 243525','型號：243525-1440(82523-1440)',1040,'遮陽帽',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Sunday Afternoons 透氣護頸圓盤帽 粉紫 ADVENTURE HAT','型號：SAS2A01001B-933',1240,'遮陽帽',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Mont-bell 工作帽 深海軍藍 Stretch O.D. Work Cap 1118191','型號：1118191-DKNV',800,'遮陽帽',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('ENO 卡車司機帽 棕/卡其 Logo turcker hat 0302000646','型號：0302000646',750,'遮陽帽',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Outdoor Research Arete Gloves GORE-TEX防水可拆卸保暖手套 男 狼棕','型號：271615-0014',2980,'保暖手套',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Montane Prism 化纖保暖手套 男 黑 PrimaLoft&reg; GOLD','型號：GPRGLBLA',1970,'保暖手套',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Outdoor Research StormTracker Gloves 防風保暖手套 男 狼棕/黑','型號：244881-0104',2700,'保暖手套',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('HESTRA 牛皮羊毛保暖手套 軟木棕 #30720','型號：30720-710750',5400,'保暖手套',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Pajak MITTENS LYNX 羽絨併指手套 中性款 野地山貓-青綠','型號：MITTENS-LYNX-TEAL',1980,'保暖手套',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Aropec Fort 防寒手套 溯溪手套','型號：G-505',670,'保暖手套',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Craft 1903014 Hybrid Weather 2合1運動保暖手套 紅','型號：1903014-2430',1000,'保暖手套',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Craft 1903666 Shield Split Finger Glove 史巴克連指保暖手套 黑','型號：1903666-9999',1680,'保暖手套',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Buff 耐寒素色 美麗諾羊毛領巾 丹寧藍 BF110964','型號：BF110964',420,'圍巾',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('BUFF Thermal Pro 抽繩保暖領巾 胭脂紅','型號：BF110951',150,'圍巾',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('BUFF XMAS VARSITY 聖誕禮盒 完美冬季針織圍巾 黑','型號：UB1775-999',280,'圍巾',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Buff 超輕半透明交差羊毛保暖圍巾 黑/深灰','型號：UB342084',230,'圍巾',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Buff 雙色圓筒美麗諾羊毛保暖圍巾 黑/灰','型號：UB341092',690,'圍巾',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Mont-bell 快乾排汗衣 童 藍 Wickron T Kid''s 1114210','型號：1114210-ORBL',0,'兒童排汗衣',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Icebreaker Tech Lite 美麗諾彈性短袖排汗衣 女童 蓮花海水藍','型號：102189-301',510,'兒童排汗衣',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Fjallraven 小狐狸 80528 Kids Trek Logo T-Shirt 有機棉T恤 聯合藍 童','型號：80528-525',80,'兒童排汗衣',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('mont-bell #1101524 兩面穿化纖保暖外套 兒童 深綠/橘 THERMAWRAP','型號：1101524-DG/OR',2820,'兒童保暖衣',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('ODLO #150509 兒童機能保暖排汗內衣 粉紅 (女生成人適用)','型號：150509-31100',1260,'兒童保暖衣',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Outdoor Research 抗紫外線透氣袖套 灰 Activeice Sun Sleeves','型號：250148-0893',40,'防曬手套、袖套',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('SNOW TRAVEL AH-28 雪之旅 防曬手套 桃紅','型號：AH-28-PH',90,'防曬手套、袖套',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('SnowTravel AH-6 抗UV遮陽袖套 水藍','型號：AH-6_water',50,'防曬手套、袖套',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('SNOW TRAVEL AH-27 雪之旅 貼身平口用排汗袖套 寶藍','型號：AH-27-BL',90,'防曬手套、袖套',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('SNOW TRAVEL AH-28 雪之旅 防曬手套 黑','型號：AH-28-BK',90,'防曬手套、袖套',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('ODLO #10459 機能保暖型排汗內衣 兒童 粉紅/軍綠條紋 (女生成人適用)','型號：10459-70346',1170,'兒童保暖衣',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Fjallraven 小狐狸 遮陽圓盤帽 暗深藍 Abisko Summer Hat 77273','型號：77273-555',1620,'遮陽帽',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Outdoor Research 80600 Swift Cap 透氣快乾棒球帽 卡其','型號：80600-808',820,'遮陽帽',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Outdoor Research 82505 Layback Cap&trade; 網眼透氣 女 藍','型號：82505-52C',860,'遮陽帽',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('SnowTravel AH-4 遮陽透氣三用帽 淺紫','型號：AH-4-LP',530,'遮陽帽',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('SnowTravel AH-4 遮陽透氣三用帽 灰','型號：AH-4-GY',530,'遮陽帽',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Golite Mesh Cap 透氣棒球帽 白/黃 70 g 六折出清','型號：AC0214-SUN',468,'遮陽帽',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('EuroSCHIRM Swing 輕量直傘 方格紅','型號：W2U6-cws4',260,'遮陽傘/雨傘',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('多用型雨傘拐杖 可分離兩用','型號：201H',350,'遮陽傘/雨傘',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Snow Peak UG-135 超輕折疊傘 灰 150g','型號：UG-135GY',470,'遮陽傘/雨傘',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('EuroSCHIRM Birdiepal Outdoor 戶外專用直傘 方格紅','型號：W208-CWS4',390,'遮陽傘/雨傘',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Mont-bell 超輕量折疊傘 L 號 嬰粟紅 Trekking Umbrella 128644','型號：1128644-POP',800,'遮陽傘/雨傘',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('MONT-BELL #1114319 Wickron Long Sleeve T 兒童長袖排汗上衣 藍','型號：1114319-NV',30,'兒童排汗衣',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('ZIV Champion 可換鏡片太陽眼鏡 鋁光銀 變色鏡片','型號：(28) B103006',700,'墨鏡/太陽眼鏡',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('ZIV Flying 運動太陽眼鏡 白藍 專為近視人士設計','型號：(51) B104018-BU',580,'墨鏡/太陽眼鏡',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('ZIV ZIV1 可換鏡片太陽眼鏡 CARBON色框 偏光鏡片','型號：(77)TB108009',870,'墨鏡/太陽眼鏡',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('ZIV Hit 可換鏡片太陽眼鏡 白 變色鏡片','型號：(26) B102018',700,'墨鏡/太陽眼鏡',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Slastik Metro 運動太陽眼鏡 Magic Silver 銀/灰 淺水銀鍍膜','型號：MT-006',480,'墨鏡/太陽眼鏡',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('mont-bell #1114259 Wickron Long Sleeve T 兒童長袖排汗上衣 灰','型號：1114259-HCH',30,'兒童排汗衣',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('ODLO #150409 兒童機能保暖型衛生衣褲套裝組 寶藍/深海藍印花 (女生成人適用)','型號：150409-70400',2430,'兒童保暖衣',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('ODLO #10459 機能保暖型排汗內衣 兒童 橘紅/玫瑰粉條紋 (女生成人適用)','型號：10459-70407',1170,'兒童保暖衣',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Regatta RKN047 Icebound 化纖保暖外套 童 橘','型號：RKN047-3N9',2270,'兒童保暖衣',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Dare 2b DBN300 Shatter 雙面穿化纖保暖外套 童 黑','型號：DBN300-800',2360,'兒童保暖衣',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Dare 2b DKW301 Take On 兒童防水保暖彈性吊帶滑雪褲 紅','型號：DKW301-1WC',3480,'兒童保暖衣',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Dare 2b DKW304 Whirlwind 兒童防水保暖吊帶滑雪褲 藍','型號：DKW304-5NN',2690,'兒童保暖衣',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Dare 2b DKL029 Pendulum 防水軟殼外套 童 紫格紋','型號：DKL029-6IP',2270,'兒童保暖衣',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Buff Original 經典款頭巾 兒童 大眼磨菇','型號：BF111283',20,'兒童遮楊帽、兒童頭巾',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Buff 寶寶經典頭巾 Plus 可愛怪物 BF121617-555','型號：BF121617-555',50,'兒童遮楊帽、兒童頭巾',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Buff Hello Kitty授權兒童頭巾 蘿絲凱蒂','型號：BF110903',50,'兒童遮楊帽、兒童頭巾',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('BUFF COOLMAX 抗UV防曬頭巾 寶寶 彩虹積木','型號：BF117121-555-10',10,'兒童遮楊帽、兒童頭巾',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Buff CoolMax 抗UV防曬頭巾 青少年 小惡魔的日常','型號：BF111601-786',10,'兒童遮楊帽、兒童頭巾',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('BUFF 雙面針織刷毛保暖領巾 兒童 瓢蟲物語','型號：BF111063',150,'兒童保暖帽、兒童保暖手套',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Outdoor Research 84422 Barrow 針織保暖帽 兒童 藍','型號：84422-757',20,'兒童保暖帽、兒童保暖手套',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Dare2b Watch Out Beanie Cat 造型保暖帽 貓 童','型號：DGC313-610',70,'兒童保暖帽、兒童保暖手套',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Buff Hello Kitty授權Polar兒童保暖頭巾 滑雪季節','型號：BF115420-789',0,'兒童保暖帽、兒童保暖手套',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('KAMA B02 兒童保暖排汗帽 桃紅','型號：B02-114',60,'兒童保暖帽、兒童保暖手套',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('BOLLE Scarlett 防霧雪鏡 亮麗黑/朱紅金 雙層鏡片設計','型號：21479',860,'滑雪鏡',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('BOLLE Y6 OTG 防霧雪鏡 亮麗黑/檸檬黃 雙層鏡片設計','型號：20506',680,'滑雪鏡',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('BOLLE Y6 OTG 防霧雪鏡 亮麗黑/鉻黑 雙層鏡片設計','型號：21786',860,'滑雪鏡',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Bolle 21608 Z5 OTG 防霧雪鏡 消光黑/朝陽紅','型號：21608',680,'滑雪鏡',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Fjallraven 小狐狸 帆布腰帶 3cm 深橄欖 Merano Canvas Belt 77028','型號：77028-633',0,'腰帶',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('CAP 1304006-1 掀扣迷彩腰帶 深綠','型號：1304006-1',30,'腰帶',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Fjallraven 彈性腰帶 暗深藍 Keb Trekking Belt #77316','型號：77316-555',80,'腰帶',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Mammut 03251-0001 Alpine Belt 中性休閒腰帶','無型號資料',90,'腰帶',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Fjallraven 小狐狸 77281 Sarek Belt 皮帶 皮革棕','型號：77281-250',160,'腰帶',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Sea To Summit Tek Towel 舒適快乾毛巾2入&amp;清潔組 灰綠/萊姆綠','型號：ATTKITMEG',80,'運動毛巾',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Sea To Summit Tek Towel 舒適快乾毛巾1入 XL 六折出清','型號：ATTTEKXL',90,'運動毛巾',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('PackTowl personal 吸水快乾浴巾 野藍莓','型號：09864',0,'運動毛巾',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('PackTowl personal 吸水快乾汗巾 多色可選','型號：09855/09857/09858',60,'運動毛巾',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Coghlans #0170 豪華露營毛巾 Deluxe Camp Towel','型號：#0170',70,'運動毛巾',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Buff Coolnet 抗 UV 驅蟲頭巾 鋼青韜光 BF122532','型號：BF122532-701',90,'頭巾',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Buff Coolnet 抗 UV 反光頭巾 天天天藍 BF119300','型號：BF119300-707',0,'頭巾',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Buff Coolnet 抗 UV 頭巾 寶藍叢林 BF119358','型號：BF119358-707',10,'頭巾',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('BUFF 經典反光頭巾 螢紅幻影','型號：BF117039-522-10',0,'頭巾',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Buff Coolnet 抗 UV 反光頭巾 清甜萊姆 BF122016','型號：BF122016-801',0,'頭巾',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Mammut Logo Leggings 攀岩長褲 女 獵戶藍','型號：11140-5870',520,'登山壓縮褲',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Craft PB 專業自行車短褲 女 黑/紅','型號：1901269-9444',60,'登山壓縮褲',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Enforma 41054 Compression 運動壓縮小腿套 白 一對','型號：41054-C5',60,'登山壓縮褲',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Enforma 41054 Compression 運動壓縮小腿套 黑/紅 一對','型號：41054-C3',60,'登山壓縮褲',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Craft 1903231 Delta 壓縮長褲 女 黑/粉紅','型號：1903231-9471',900,'登山壓縮褲',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('OverBoard OB1051 Pro-Sports 防水臂套 黑','型號：OB1051BLK',20,'運動臂套',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Nathan NA4920 SuperSonic iPhone 手機臂套 桃紅 六折出清','型號：NA4920NFF',28,'運動臂套',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Gibbon Slackline Shoe Laces 鞋帶 出清特賣','型號：11112600',5,'鞋帶',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Zamberlan 扁鞋帶 橘 義大利製造 FLAT LACES A06209','型號：A06209-025',80,'鞋帶',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Nathan NA1160 Lock Laces 快扣鞋帶 藍','型號：NA1160NR',50,'鞋帶',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Grivel Warm Sleeve 保暖袖套/臂套 黑','型號：ACSLEE',70,'運動臂套',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Enforma 41070 Arm sleeve 運動壓縮臂套 黑/紅 一對','型號：41070-C1',20,'運動臂套',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Nathan NA4920 SuperSonic iPhone 手機臂套 螢光黃 六折出清','型號：NA4920NVY',28,'運動臂套',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('NATHAN NA1171 反光快扣鞋帶 棕綠','型號：NA1171BG',50,'鞋帶',100,10,'cloth_class');
Insert into CLOTH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('NATHAN NA1171 反光快扣鞋帶 灰','型號：NA1171NB',50,'鞋帶',100,10,'cloth_class');
REM INSERTING into FIRST_CLASS
SET DEFINE OFF;
Insert into FIRST_CLASS (ID,NAME) values (10,'cloth_class');
Insert into FIRST_CLASS (ID,NAME) values (20,'shoes_class');
Insert into FIRST_CLASS (ID,NAME) values (30,'kitchen_class');
Insert into FIRST_CLASS (ID,NAME) values (40,'tent_class');
Insert into FIRST_CLASS (ID,NAME) values (50,'backpack_class');
Insert into FIRST_CLASS (ID,NAME) values (60,'light_class');
Insert into FIRST_CLASS (ID,NAME) values (70,'personal_class');
Insert into FIRST_CLASS (ID,NAME) values (80,'promech_class');
Insert into FIRST_CLASS (ID,NAME) values (90,'proclimb_class');
Insert into FIRST_CLASS (ID,NAME) values (100,'water_class');
Insert into FIRST_CLASS (ID,NAME) values (110,'other_class');
REM INSERTING into KITCHEN_CLASS
SET DEFINE OFF;
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('ZOKU 伸縮式304不鏽鋼吸管附收納盒 莓果粉 ZK307-BY','型號：ZK307-BY',290,'登山餐具',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Snow Peak FES-106 雪峰矽膠杯蓋 淺褐色','型號：FES-106',400,'登山餐具',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('SOTO 鈦杯/不鏽鋼杯料理組 SOD-521','型號：SOD-521',2810,'登山餐具',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Trangia T-Spoon 環保二用叉勺 550010','型號：550010',335,'登山餐具',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('EVERNEW CA349 鈦合金叉匙組','型號：CA349',1020,'登山餐具',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('台灣製文樑 爐具維修包 In Good Repair A workbag','型號：NO.9710-1',100,'登山瓦斯爐',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('台灣製文樑 #9705-2 雪峰爐','型號：9705-2',650,'登山瓦斯爐',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('台灣製文樑 ST-2001-2 卡式轉接頭(有腳) Gas Candle Adapter','無型號資料',200,'登山瓦斯爐',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('MSR Reactor 效率系統爐 1L Reactor Stove Systems 06898','型號：06898',7200,'登山瓦斯爐',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('SNOW PEAK GS-100AR GP不鏽鋼自動點火小型瓦斯爐 2,500 KCAL/H','型號：GS-100AR',2250,'登山瓦斯爐',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('CampingAce ARC-2110 魔羯星快速瓦斯爐','型號：ARC-2110',899,'登山瓦斯爐',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Primus 普及型瓦斯爐 Mimer 224394','型號：224394',960,'登山瓦斯爐',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Primus 327793 Easy Fuel? II 經典分離式瓦斯爐 再送230g瓦斯','型號：327793',3360,'登山瓦斯爐',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('台灣製文樑 #9705 個人攻頂爐','型號：9705',500,'登山瓦斯爐',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Kovea KB-9602 蜘蛛高山爐','型號：KB-9602',1600,'登山瓦斯爐',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Primus 321985 Omni Ti? 多燃料鈦合金遠征汽化爐 瓦斯、去漬油、煤油、柴油','型號：321985',360,'汽化爐',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Primus 328985 Omni Fuel? 多燃料遠征汽化爐 瓦斯、去漬油、煤油、柴油','型號：328985',800,'汽化爐',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('OPTIMUS 8016301 Funnel 漏斗','型號：8016301',25,'汽化爐',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('OPTIMUS 8016278 HIKER+ 古典汽化爐','型號：8016278',900,'汽化爐',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('OPTIMUS 8016279 Svea 經典汽化爐','型號：8016279',230,'汽化爐',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Snow Peak TW-122 雪峰鈦合金雙層杯 H450','型號：TW-122',1300,'登山餐具',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Snow 卡式瓦斯爐攜行袋 UG-551','型號：UG-551',0,'露營卡式爐',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Snow Peak GS-400 GP單口爐','型號：GS-400',800,'露營卡式爐',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Snow Peak HOME & CAMP 卡式瓦斯爐 黑色 GS-600BK','型號：GS-600BK',280,'露營卡式爐',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('KOOKE 酷客炫卡爐 黑 S-1','型號：S-1 KOOKE',280,'露營卡式爐',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Uniflame U610329 瓦斯雙口爐 US-1900 香檳金','型號：U610329',800,'露營卡式爐',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Victorinox Swiss Classic Paring Knife 瑞士廚刀 橘','型號：6.7606.L119',200,'登山餐具',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Coghlans #9907 輕量砧板 Flexible Cutting Mat','型號：9907',126,'登山餐具',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Snow Peak TW-032 不鏽鋼湯碟','型號：TW-032',380,'登山餐具',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Snow Peak NT-056 不鏽鋼湯匙','型號：NT-056',230,'登山餐具',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Snow Peak MG-053R 鈦合金雙層杯-折疊把手 450ml','型號：MG-053R',1610,'登山餐具',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Snow Peak SCS-004TR Mini Solo鈦金屬個人鍋','型號：SCS-004TR',650,'登山鍋具、鈦合金炊鍋具',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Snow Peak SCS-020T 鈦合金個人雙鍋組','型號：SCS-020T',860,'登山鍋具、鈦合金炊鍋具',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Snow Peak SCS-008T 鈦合金鍋具 900ml','型號：SCS-008T',640,'登山鍋具、鈦合金炊鍋具',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Coghlans #8309 折合杯 Fold-A-Cup 隨機出色','型號：#8309',162,'登山餐具',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Coghlans #9166 個人餐具組(刀、叉、湯匙) Cutlery Set','型號：#9166',189,'登山餐具',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Captain Stag 鹿牌 M-9682 真空杯 280ml','型號：M-9682',490,'登山餐具',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Coghlans #721BP 個人餐具組 Chow Kit (刀、叉、湯匙)','型號：#721BP',108,'登山餐具',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Coghlans #1314 家庭套鍋組 Carbon Steel Family Cookset','型號：#1314',880,'不鏽鋼炊鍋具',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('台灣製文樑 不鏽鋼個人餐具組 Individual Tableware','型號：ST-2011',50,'不鏽鋼炊鍋具',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Sea To Summit Sigma 不鏽鋼折疊鍋 1.2L','型號：STSAPOTSIGSSI1.2L',240,'不鏽鋼炊鍋具',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Snow Peak CS-021 不鏽鋼鍋具組 L 五件組','型號：CS-021',660,'不鏽鋼炊鍋具',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Petromax Fire Skillets 單柄鑄鐵煎鍋 30cm 通過德國食品安全認證(LFGB)','型號：fp30-t',1440,'鑄鐵鍋(荷蘭鍋)',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Coghlans 鑄鐵雙漢堡烤夾 Cast Iron Double Broiler #2046','型號：#2046',945,'鑄鐵鍋(荷蘭鍋)',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('PETROMAX FT4.5-T DUTCH OVEN 鑄鐵荷蘭鍋10吋 (平底) 通過德國食品安全認證(LFGB)','型號：ft4.5-t',2250,'鑄鐵鍋(荷蘭鍋)',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Snow Peak SCS-009T 鈦合金鍋具 1400ml','型號：SCS-009T',790,'登山鍋具、鈦合金炊鍋具',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('SNOW PEAK SET-160 60TH 鍋具爐具組','型號：SET-160',900,'登山鍋具、鈦合金炊鍋具',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Petromax Chain Mail Cleaner 不鏽鋼潔鍋鏈網 (大)','型號：scrub-XL',900,'鑄鐵鍋(荷蘭鍋)',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Truvii 木柄白鐵杯 400ml 叢林','型號：0706000083',495,'露營餐具',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('UNIFLAME 耐熱波浪煎鏟 U662427','型號：U662427',300,'露營餐具',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('UNIFLAME 拼圖矽鍋墊 (4片入) 綠 U661871','型號：U661871',550,'露營餐具',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('SOLO STOVE 多功能不銹鋼火鉗 Fire Pit Tools FP-TOOLS','型號：FP-TOOLS',2350,'露營餐具',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Truvii 木柄白鐵杯 400ml 煙褐','型號：0706000085',495,'露營餐具',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('ROXON 六合一多功能燒烤工具組 附收納袋 MBT 3 S601','型號：S601',1440,'露營餐具',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('PLATCHAMP 日本製琺瑯杯 墨黑','型號：PC005-BLK',1080,'露營餐具',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('PLATCHAMP 日本製琺瑯餐盤 25CM 湖綠','型號：PC003-GRN',1350,'露營餐具',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('PLATCHAMP 日本製琺瑯碗 墨黑','型號：PC001-BLK',1260,'露營餐具',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('KAZMI K8T3K004 不鏽鋼雙層杯5入組 啞光黑','型號：K8T3K004',1380,'露營餐具',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Ridge Line廚房用具8件組 彩虹','型號：CK818050RA',1580,'露營餐具',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Snow Peak CS-208 戶外砧板 / 刀組 L','型號：CS-208',1890,'露營餐具',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Snow Peak GK-100 戶外刀/剪組','型號：GK-100',2930,'露營餐具',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Petromax Enamel Plates 琺瑯盤 2入 黑','型號：px-plate-s',580,'露營餐具',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Snow Peak TW-254 強化瓷器盤 L','型號：TW-254',760,'露營餐具',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('LOGOS #81428210 折疊式砧板組 (含刀、刨刀) 出清特賣','型號：81428210',1020,'露營餐具',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Truvii 琺瑯圓盤24cm 波斯藍','型號：00986502',1060,'露營餐具',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('LOGOS #81285015 愛地球摩登三人碗盤組 出清特賣','型號：81285015',900,'露營餐具',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('UNIFLAME U665770 波浪木炭鏟','型號：U665770',510,'露營餐具',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('OPINEL 001452 廚房用刀 一組四入','型號：001452',1635,'露營餐具',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Petromax za1 BBQ and Coal Tongs 木柄火夾 41cm 通過德國食品安全認證(LFGB)','型號：za1',540,'露營餐具',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Captain Stag M-8087 藍琺瑯碗','型號：M-8087',410,'露營餐具',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Coghlans #1660 野餐餐盤 Picnic Plate','型號：#1660',180,'露營餐具',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Coghlans #1217 露營碗 Polypropylene Bowl','型號：#1217',77,'露營餐具',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Petromax Flexible Spatula for Grill and Pans 短木柄不鏽鋼煎鏟 通過德國食品安全認證(LFGB)','型號：flex1',790,'露營餐具',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Snow Peak E-103 不鏽鋼登山杯','型號：E-103',60,'不鏽鋼炊鍋具',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Coghlans #1324 鋁合金套鍋組 Hard Anodized Aluminum Cookset','型號：1324',3060,'登山鍋具、鋁合金炊鍋具',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Sea To Summit APOTA2.7L ALPHA POT 鋁合金折疊鍋 2.7L','型號：APOTA2.7L',1690,'登山鍋具、鋁合金炊鍋具',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Snow Peak CS-600 鋁合金鍋具三件組 Pancooker','型號：CS-600',12690,'登山鍋具、鋁合金炊鍋具',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('CB北歐系列 琺瑯原木單柄牛奶鍋 土耳其藍','型號：705000018',72,'琺瑯鍋',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Lodge Enamel 3QT紅蘋果琺瑯鍋 E3AP40','型號：E3AP40',750,'琺瑯鍋',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('CB北歐系列 琺瑯泡茶兩用壺 微笑橘','型號：per-14-le',430,'琺瑯鍋',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Lodge Enamel 3QT綠蘋果琺瑯鍋 E3AP50','型號：E3AP50',750,'琺瑯鍋',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('GSI H2JO! 咖啡 / 茶葉濾網','型號：73020',90,'咖啡壺',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Coghlans #1342 不鏽鋼咖啡壺 12杯 Stainless Steel Coffee Pot 12 Cup','型號：#1342',475,'咖啡壺',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Coghlans #1340 不鏽鋼咖啡壺 9杯 Stainless Steel Coffee Pot 9 Cup','型號：#1340',782,'咖啡壺',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Snow Peak CS-110 鈦合金咖啡、奶泡組','型號：CS-110',750,'咖啡壺',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Snow Peak 營地咖啡師 咖啡濾杯 CS-117','型號：CS-117',890,'咖啡壺',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('RHINO 犀牛 鋁合金聚熱強效茶壺 1.5L K-54','型號：k-54',20,'茶壺',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('RHINO 犀牛 鋁合金聚熱強效茶壺 1L k-24','型號：k-24',40,'茶壺',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Trangia Kettle 超輕鋁水壺 1.4L 200245','型號：200245',10,'茶壺',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Petromax Teakettle TK1 不鏽鋼煮水壺 1.5L','型號：tk1',70,'茶壺',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Petromax Teakettle TK2 不鏽鋼煮水壺 3L','型號：tk2',340,'茶壺',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('UNIFLAME 小黑鍋蓋 U666388','型號：U666388',400,'鑄鐵鍋(荷蘭鍋)',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Snow Peak CS-521 荷蘭鍋蒸烤網 26cm','型號：CS-521',630,'鑄鐵鍋(荷蘭鍋)',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('嘉隆 BG-010 長柄10" 荷蘭鍋專用外袋','型號：BG-010',320,'鑄鐵鍋(荷蘭鍋)',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Petromax Transport Bag 鍛鐵燒烤盤 56cm 攜行袋 適用fs56','型號：TA-fs56',1530,'鑄鐵鍋(荷蘭鍋)',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Petromax Scraper 鑄鐵鍋清潔刮片','型號：os',135,'鑄鐵鍋(荷蘭鍋)',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Petromax Cast-iron Stack Grate 鑄鐵三角鍋墊 23cm','型號：gr-s',720,'鑄鐵鍋(荷蘭鍋)',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Petromax 鍛鐵燒烤盤 fs48 48cm Griddle and Fire Bowl','型號：fs48',790,'煎盤',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Lodge Mini Guitar Skillet 迷你鑄鐵吉他盤 LGSK3','型號：LGSK3',10,'煎盤',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Old Mountain 10168 Handle Hot Mitt 鑄鐵鍋防燙手柄套','型號：10168',0,'煎盤',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Lodge Silicone Hot Handle Holder 長鍋柄矽膠防燙握把 黑','型號：ASCRHH11',45,'煎盤',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Lodge Enamel Square Grill Pan 琺瑯牛排煎盤 ECSGP83','型號：ECSGP83',750,'煎盤',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Sea To Summit X-摺疊杯 (大) 萊姆綠 STSAXMUGLM','型號：STSAXMUGLM',430,'登山鍋具、鋁合金炊鍋具',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Sea To Summit X-折疊鍋 橘 1.4L STSAXPOT1.4OR','型號：STSAXPOT1.4OR',1600,'登山鍋具、鋁合金炊鍋具',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Sea To Summit X-折疊鍋 洋藍 2.8L STSAXPOT2.8PB','型號：STSAXPOT2.8PB',1960,'登山鍋具、鋁合金炊鍋具',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Sea To Summit ALPHA SET 4.2 鋁合金折疊鍋具組 4.2 STSAPOTACKSETSSI4.2','型號：STSAPOTACKSETSSI4.2',3670,'登山鍋具、鋁合金炊鍋具',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('UNIFLAME 深型不沾調理煎鍋 17cm 附收納袋 日本製 U667606','型號：U667606',1220,'登山鍋具、鋁合金炊鍋具',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('台灣製文樑 超輕量鋁碗 Lightweight Aluminum bowl','型號：ST-2019-2',400,'登山鍋具、鋁合金炊鍋具',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Snow Peak SCS-004R Mini Solo鋁合金個人鍋','型號：SCS-004R',1650,'登山鍋具、鋁合金炊鍋具',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Nalgene Everyday 寬嘴流線型嘴水壺 750ml 粉紅 BPA-Free','型號：2190-1007',360,'運動水壺',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Nalgene Easy Sipper Drink Cap 喝水套片 藍','型號：2575-3063',120,'運動水壺',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Nalgene Everyday 1000 ml 寬嘴水壺 Tritan Bottle BPA-Free 煙霧灰','型號：2178-2025',440,'運動水壺',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Camelbak Ergo HydroLock 水流調節閥','型號：90121',70,'吸管水袋',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Platypus 高流量咬嘴 HYFLO? BITE VALVE 11005','型號：11005',80,'吸管水袋',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Hydrapak SEEKER 大容量軟式水壺 2L 甜酒藍 可與 Katadyn BeFree 濾蕊結合使用','型號：A812HP',20,'吸管水袋',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Camelbak Crux? 快拆吸管水袋 3L BPA free','型號：CB1228401003',690,'吸管水袋',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('CamelBak Magnetic Tube Trap 水管定位磁吸夾','型號：CB91025',40,'吸管水袋',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Camelbak Eddy 咬嘴吸管組 藍 咬嘴x2、吸管x2','型號：CB90834',430,'運動水壺',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('NALGENE EVERYDAY 1000 ML 寬嘴水壺 TRITAN BOTTLE 木柴色','型號：2178-2060',440,'運動水壺',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Camelbak CB1274111040 Eddy 兒童吸管運動水瓶 400ml 運動之星','型號：CB1274111040',490,'運動水壺',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Camelbak 兒童咬嘴吸管組(含兩咬嘴兩吸管) EDDY?+ KIDS CB2298101000','型號：CB2298101000',310,'運動水壺',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Nalgene 寬嘴壺蓋 63mm 粉紅 2180-0006','型號：2180-0006',120,'運動水壺',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Nalgene 寬嘴壺蓋 63mm 黑色 2180-0005','型號：2180-0005',120,'運動水壺',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Nalgene Everyday 1000 ml 寬嘴水壺 Tritan BottleBPA-Free 莓紅','型號：2178-2032',400,'運動水壺',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Nalgene Everyday 375 ml 迷你易握水壺 Tritan Bottle BPA-Free 粉紅','型號：2178-7012',320,'運動水壺',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Nalgene 寬嘴水壺 軍藍 Everyday 1000 ml Tritan Bottle BPA-Free 2178-2056','型號：2178-2056',440,'運動水壺',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Nalgene 寬嘴壺蓋 63mm 黃','型號：2180-0001',120,'運動水壺',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Nalgene Everyday 1000 ml 寬嘴水壺 Tritan Bottle BPA-Free 鱒魚綠','型號：2178-2040',440,'運動水壺',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Snow Peak T-012 鈦合金隨身酒壺 140ml','型號：T-012',430,'酒壺',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('GSI GLACIER STAINLESS 5 FL. OZ. CLASSIC FLASK 經典不鏽鋼酒壺 148ML','型號：66205',20,'酒壺',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Nalgene 2181-0008 FLASK 攜帶型酒壺 紅','型號：2181-0008',84,'酒壺',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Crosspace 艾菲爾純鈦隨型酒壺 (晨曦藍) #A200001','型號：A200001',830,'酒壺',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Vinaera MV6 電子氣壓醒酒器 台灣設計精品 RedDot紅點設計獎','型號：MV6',88,'酒壺',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Platypus 軟式水瓶 1L 海岸線 SoftBottle 10966','型號：10966',20,'摺疊水袋',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('妙管家 安控瓦斯罐 3入','型號：MCRV-001',115,'瓦斯、燃料',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('領航家 ProCamping 安控瓦斯罐 三入 PC-001','型號：PC-001',109,'瓦斯、燃料',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('領航家 ProCamping 高山瓦斯罐 450g PC-450','型號：PC-450',150,'瓦斯、燃料',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Snow Peak GP-110SR 標準型瓦斯 銀色','型號：GP-110SR',120,'瓦斯、燃料',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('IRODA Butane Gas 愛烙達 噴火槍專用瓦斯','型號：BU-015',130,'瓦斯、燃料',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('OPTIMUS 8017607 Fuel Bottle 燃料油瓶 0.6L','型號：8017607',720,'瓦斯、燃料',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('尾西 乾燥飯三角飯糰 什錦五目','型號：OO-02',165,'登山食品、乾燥飯',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('PALIER Guatemala 有機咖啡 瓜地馬拉 CoffeeBrewer','型號：0902000047',88,'登山食品、乾燥飯',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('aminoMax 邁克仕 能量晶凍 Energy Jelly 青梅 / 荔枝','型號：A088/A090',35,'登山食品、乾燥飯',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('PALIER TeaBrewer 有機伯爵茶 Earl Grey Organic','型號：0902000043',98,'登山食品、乾燥飯',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('POCARI 寶礦力粉末 隨身包','型號：995002',45,'登山食品、乾燥飯',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Coghlans #511A 蛋盒12粒 Egg Holder 12 Size','型號：#511A',144,'登山食品、乾燥飯',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('GoSport 蛋盒6粒','型號：50300',55,'登山食品、乾燥飯',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Coghlans #1012 蛋盒2粒 Egg Holder 2 Size','型號：#1012',90,'登山食品、乾燥飯',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('GoSport 蛋盒2粒','型號：50303',35,'登山食品、乾燥飯',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Coghlans #812A 蛋盒6粒 Egg Holder 6 Size','型號：#812A',117,'登山食品、乾燥飯',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Coghlans #8800 輕量化濾水器 Water Filter','型號：#8800',431,'戶外濾水器',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('MSR AutoFlow 輕量化免幫浦濾水器','型號：56501',670,'戶外濾水器',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('KATADYN Befree 個人隨身濾水器 0.6L 榮獲 2017 Backpacker 編輯推薦獎 8019946','型號：8019946',200,'戶外濾水器',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('KATADYN 8019256 CAMP SERIES SHOWER ADAPTOR 水袋淋浴配件','型號：8019256',42,'戶外濾水器',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Katadyn MyBottle 專用濾芯','型號：8018087',620,'戶外濾水器',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Petromax Mini Torch 迷你點火槍','型號：HF1',585,'瓦斯、燃料',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('OPTIMUS 8017606 Fuel Bottle 燃料油瓶 0.4L','型號：8017606',630,'瓦斯、燃料',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Petromax Alkan 專用燃料油','型號：Alkan',225,'瓦斯、燃料',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Coghlans #0150 點火棒 Fire Lighters','型號：0150',198,'瓦斯、燃料',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('SOLO STOVE Ranger Shelter 防水保護罩 (中)','型號：SSRAN-SHELTER',750,'擋風板、爐具配件',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Hydro Flask 寬口 58mm 不鏽鋼真空保溫瓶 時尚黑 20oz / 591ml HFW20BTS001','型號：HFW20BTS001',1150,'保溫瓶',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Hydro Flask 寬口 58mm 不鏽鋼真空保溫瓶 經典白 12oz / 355ml HFW12BTS110','型號：HFW12BTS110',790,'保溫瓶',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Klean Kanteen 窄口配件：快扣不銹鋼水瓶蓋 Stainless Swing Lok Cap','型號：KCSLK',600,'保溫瓶',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Hydro Flask 寬口 58mm 不鏽鋼真空保溫瓶 石板灰 20oz / 591ml HFW20BTS010','型號：HFW20BTS010',1150,'保溫瓶',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('SOLO STOVE Bonfire Shelter 防水保護罩 (大)','型號：SSBON-SHELTER',800,'擋風板、爐具配件',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('OPTIMUS 8016302 Windfoil 擋風板 適用Nova、Nova+','型號：8016302',5,'擋風板、爐具配件',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('嘉隆 TB-002 高承載萬用爐架M 高12cm 適用單口爐','型號：TB-002M',0,'擋風板、爐具配件',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Optimus Clip-On Windshield 擋風板','型號：8018907',95,'擋風板、爐具配件',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Mont-bell 保溫瓶 0.75L 鮮紅 Alpine Thermo Bottle 1124766','型號：1124766-RD',1340,'保溫瓶',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Klean Kanteen Insulated TKWide 不鏽鋼寬口保溫瓶 32oz/946ml 鮮梨綠','型號：K32TKWSSL-JP',1600,'保溫瓶',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Hydro Flask HFW12TS001 寬口58mm不鏽鋼保溫瓶 時尚黑 12oz','型號：HFW12TS001',790,'保溫瓶',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Klean Kanteen Insulated TKPro 不鏽鋼保溫瓶 32oz/1.0L 消光黑','型號：KTKP1.0L-SB',2000,'保溫瓶',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Nalgene Everyday 1000 ml 寬嘴水壺 Tritan BottleBPA-Free 橘色','型號：2178-2029',440,'運動水壺',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Klean Kanteen Insulated TKWide 不鏽鋼寬口保溫瓶 20oz/592ml 原鋼色','型號：K20TKWPCC-BS',1320,'保溫瓶',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Hydro Flask HFW18TS415 寬口58mm不鏽鋼保溫瓶 海洋藍 18oz','型號：HFW18TS415',1060,'保溫瓶',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Snow Peak TW-070R-PW 隨行保溫瓶350 珍珠白','型號：TW-070R-PW',2550,'保溫瓶',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Platypus 軟式水瓶 1L 野狼 SoftBottle 10964','型號：10964',20,'摺疊水袋',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Sea To Summit 標準儲水袋 ST 6L Watercell ST AWATCELST6','型號：AWATCELST6',80,'摺疊水袋',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('MSR 09588 Dromedary 強化尼龍水袋 10L 黑','型號：09588',50,'摺疊水袋',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Sea To Summit 標準儲水袋 ST 10L Watercell ST AWATCELST10','型號：AWATCELST10',70,'摺疊水袋',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Mont-bell Alpine Thermo Bottle 保溫瓶 0.5L 鮮紅','型號：1124617-RD',1160,'保溫瓶',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Snow Peak TW-070R-WR 隨行保溫瓶350 酒紅','型號：TW-070R-WR',2550,'保溫瓶',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Snow Peak TW-071R-DS 隨行保溫瓶500 銀','型號：TW-071R-DS',2980,'保溫瓶',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Klean Kanteen Insulated Wide 寬口不鏽鋼保溫瓶 20oz/592ml 原色鋼','型號：K20VWPCC-BS',1320,'保溫瓶',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Zippo Filigree Flame and Wing Design 防風打火機 29881 買就送原廠專用油','型號：29881',1800,'Zippo 經典打火機',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Zippo Coils 防風打火機 立交橋 29422 買就送原廠專用油','型號：29422',2340,'Zippo 經典打火機',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Zippo 防風打火機 Flame Tech Design 49221 買就送原廠專用油','型號：49221',900,'Zippo 經典打火機',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Zippo 噴射型防風打火機內膽(雙火焰) Double Torch Butane Insert 65827','型號：65827',990,'Zippo 經典打火機',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Zippo 噴射型防風打火機內膽(單火焰) Single Torch Butane Insert 65826','型號：65826',990,'Zippo 經典打火機',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Zippo Classic Black Ice? 防風打火機 黑冰-PVD浸染 150 買就送原廠專用油','型號：150',1170,'Zippo 經典打火機',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Zippo Zippo Antique Stamp 防風打火機 仿古銅衝壓商標 28994 買就送原廠專用油','型號：28994',1260,'Zippo 經典打火機',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Zippo Zippo Button Logo 防風打火機 Stree Chrome/Color Image 29872 買就送原廠專用油','型號：29872',900,'Zippo 經典打火機',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Zippo Line Grid 防風打火機 29914(29885) 買就送原廠專用油','型號：29914(29885)',1080,'Zippo 經典打火機',100,30,'kitchen_class');
Insert into KITCHEN_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Zippo Slim? Brushed Chrome 防風打火機 纖巧沙子-拉絲鍍鉻 1600 買就送原廠專用油','型號：1600',765,'Zippo 經典打火機',100,30,'kitchen_class');
REM INSERTING into LIGHT_CLASS
SET DEFINE OFF;
Insert into LIGHT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Petzl E093 TIKKA 頭燈 綠 300流明','型號：E093FA02',1280,'LED 頭燈',100,60,'light_class');
Insert into LIGHT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('LED LENSER MH3 專業伸縮調焦頭燈 200流明 登山露營入門推薦 黃 502149','型號：502149',1440,'LED 頭燈',100,60,'light_class');
Insert into LIGHT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Petzl E099 Actik? 頭燈 黑 350流明 IPX4','型號：E099FA00',1680,'LED 頭燈',100,60,'light_class');
Insert into LIGHT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Petzl ACTIK CORE 頭燈 450流明 黑','型號：E099GA00',2480,'LED 頭燈',100,60,'light_class');
Insert into LIGHT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Petzl E089 Tactikka+ 頭燈 黑 350流明','型號：E089EA00',1780,'LED 頭燈',100,60,'light_class');
Insert into LIGHT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('LED LENSER MH3 專業伸縮調焦頭燈 200流明 黑 登山露營入門推薦款','型號：501597',1440,'LED 頭燈',100,60,'light_class');
Insert into LIGHT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('LED LENSER 配件 原廠專用充電電池 適用於MH7/MH8','型號：500987',800,'LED 頭燈',100,60,'light_class');
Insert into LIGHT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Petzl E93 Zipka? 輕量化頭燈 紅 200流明，CLASSIC 經典入門款','型號：E93ABB',1180,'LED 頭燈',100,60,'light_class');
Insert into LIGHT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('LED LENSER MH3 專業伸縮調焦頭燈 200流明 藍/白 登山露營入門推薦款','型號：501594',1440,'LED 頭燈',100,60,'light_class');
Insert into LIGHT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Petzl E93 ZIPKA 輕量化頭燈 紅 100流明 CLASSIC 經典入門款','型號：E93ZMA',690,'LED 頭燈',100,60,'light_class');
Insert into LIGHT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('LED LENSER NEO 慢跑頭燈 90流明 藍','型號：6110',799,'LED 頭燈',100,60,'light_class');
Insert into LIGHT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('LED LENSER 配件 0373 SEO專用頭燈帶 綠色','型號：0373',300,'LED 頭燈',100,60,'light_class');
Insert into LIGHT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('LED LENSER 7319-RG XEO19R 專業多功能強光頭燈-綠 2000流明','型號：7319-RG',5940,'LED 頭燈',100,60,'light_class');
Insert into LIGHT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('LED LENSER 7399-R H14R.2 四合一充電式伸縮調焦頭燈 850流明','型號：7399-R',4800,'LED 頭燈',100,60,'light_class');
Insert into LIGHT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('LED LENSER 7319-R XEO19R 專業多功能強光頭燈 黑 2000流明','型號：7319-R',5940,'LED 頭燈',100,60,'light_class');
Insert into LIGHT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Petromax 零件 #123-500 Hood 燈帽 消光鎳 (適用HK350/500)','型號：#123-500bw',1700,'Petromax 燈具零件專區',100,60,'light_class');
Insert into LIGHT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('N9 LUMENA 行動電源照明LED燈 三色溫 1300流明 黑','型號：0602000027',2480,'露營燈',100,60,'light_class');
Insert into LIGHT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Snow Peak ES-040R 迷你戶外夜燈 燈籠花果 哆啦A夢限定版 Snow Peak X 哆啦A夢','型號：ES-040R-BD',1650,'露營燈',100,60,'light_class');
Insert into LIGHT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('LED LENSER 502006 iW5R-flex 專業充電式工作燈 600流明','型號：502006',2700,'露營燈',100,60,'light_class');
Insert into LIGHT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('SOTO ST-233 二代 230W 驅蚊瓦斯營燈','型號：ST-233',3510,'露營燈',100,60,'light_class');
Insert into LIGHT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('N9 LUMENA 行動電源照明LED燈 三色溫 1300流明 沙漠迷彩','型號：0602000030',2480,'露營燈',100,60,'light_class');
Insert into LIGHT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('ENO Twilights 朦朧露營燈 白光','型號：A1203',760,'露營燈',100,60,'light_class');
Insert into LIGHT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('ENO Moonshine Lantern 月光營燈 藍','型號：A1251',935,'露營燈',100,60,'light_class');
Insert into LIGHT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Coghlans #0842 LED Micro Lantern 鑰匙燈','型號：#0842',414,'露營燈',100,60,'light_class');
Insert into LIGHT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Coghlans #0902 戶外冰箱LED照明燈 Cooler Light','型號：0902',252,'露營燈',100,60,'light_class');
Insert into LIGHT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('ENO Moonshine Lantern 月光營燈 綠','型號：A1252',935,'露營燈',100,60,'light_class');
Insert into LIGHT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Snow Peak GP-034 燈芯-L (2入)','型號：GP-034',20,'瓦斯燈、汽化燈、煤油燈',100,60,'light_class');
Insert into LIGHT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Feuerhand 火手燈 古典煤油燈 桃紅 Baby Special 276','型號：276-4010',350,'瓦斯燈、汽化燈、煤油燈',100,60,'light_class');
Insert into LIGHT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Feuerhand 火手燈 古典煤油燈 亮藍 Baby Special 276','型號：276-5007',350,'瓦斯燈、汽化燈、煤油燈',100,60,'light_class');
Insert into LIGHT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Snow Peak GP-050 燈芯-M (3入)','型號：GP-050',50,'瓦斯燈、汽化燈、煤油燈',100,60,'light_class');
Insert into LIGHT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('SNOW PEAK GT-110R FOLDING TORCH GP折疊瓦斯噴燈','型號：GT-110R',890,'瓦斯燈、汽化燈、煤油燈',100,60,'light_class');
Insert into LIGHT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('LED LENSER K4R 充電式手電筒 60流明 502066/502132','型號：502066/502132',899,'手電筒',100,60,'light_class');
Insert into LIGHT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('LED LENSER 藍月光系列 P3BM 伸縮調焦手電筒 16流明','型號：8603',600,'手電筒',100,60,'light_class');
Insert into LIGHT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('LED LENSER 工業系列 i7 伸縮調焦手電筒 105流明','型號：5507',1320,'手電筒',100,60,'light_class');
Insert into LIGHT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('SOLIDLINE 航空鋁合金充電型手電筒 ST6R 900 流明 502212','型號：502212',2250,'手電筒',100,60,'light_class');
Insert into LIGHT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('LED LENSER 502070 MT14專業伸縮調焦手電筒 1000流明 贈送限定行動電源','型號：502070',6300,'手電筒',100,60,'light_class');
Insert into LIGHT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('LED LENSER 配件 0317 手電筒專用旋轉夾(大)','型號：0317',210,'手電筒',100,60,'light_class');
Insert into LIGHT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('LED LENSER 配件 0335 專用尼龍袋','型號：0335',230,'手電筒',100,60,'light_class');
Insert into LIGHT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('LED LENSER MT14 專用線控配件','型號：501025',810,'手電筒',100,60,'light_class');
Insert into LIGHT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('LED LENSER 配件 7482 紅色訊號棒(大)','型號：7482',180,'手電筒',100,60,'light_class');
Insert into LIGHT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('LED LENSER 鑰匙圈系列 P3 AFSP 伸縮調焦手電筒 75流明 藍 6折出清','型號：1019',1020,'手電筒',100,60,'light_class');
Insert into LIGHT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Petromax Screw for bottom matt 燈架固定螺絲 銀 (適用HK150/350/500)','型號：14C',70,'Petromax 燈具零件專區',100,60,'light_class');
Insert into LIGHT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Petromax Pump Valve with Washer 打氣幫浦逆止閥(含鉛墊片) 適用HK150/250/350/500','型號：10-83',320,'Petromax 燈具零件專區',100,60,'light_class');
Insert into LIGHT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Petromax 零件 #34-500 Mixing Chamber 混合轉接套管 (適用HK350/500)','型號：#34-500',390,'Petromax 燈具零件專區',100,60,'light_class');
Insert into LIGHT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Petromax TA1 Transport & Reflector case 燈&頂蓋攜行袋(適用HK150)','型號：TA1',1440,'Petromax 燈具零件專區',100,60,'light_class');
Insert into LIGHT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Petromax Helox Mantle 煤油汽化燈燈芯(1入) 適用HK500','型號：Helox-500',80,'Petromax 燈具零件專區',100,60,'light_class');
Insert into LIGHT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Petromax TA5 Transport & Reflector case 燈 & 頂蓋攜行袋 (適用HK350/500)','型號：TA5',1485,'Petromax 燈具零件專區',100,60,'light_class');
Insert into LIGHT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Petromax POL Cleaning Polish 金屬拋光保養油','型號：POL',360,'Petromax 燈具零件專區',100,60,'light_class');
Insert into LIGHT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Petromax PX101 Mantle 煤油汽化燈燈芯(1入) 適用HK150','型號：PX101',80,'Petromax 燈具零件專區',100,60,'light_class');
Insert into LIGHT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Petromax Rapid pre-heater german army 預熱槍總成 金 (適用HK350/500)','型號：226-500M',1050,'Petromax 燈具零件專區',100,60,'light_class');
Insert into LIGHT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Petromax Top Reflector 反射頂蓋 銀 (適用HK150)','型號：top1c',1305,'Petromax 燈具零件專區',100,60,'light_class');
Insert into LIGHT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Petromax G5M Glass 玻璃燈罩(霧面) 適用HK350/500','型號：G5M',540,'Petromax 燈具零件專區',100,60,'light_class');
Insert into LIGHT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Petromax 零件 #46 Pump leather 打氣幫浦皮碗 (適用HK150/250/350/500)','型號：#46',180,'Petromax 燈具零件專區',100,60,'light_class');
Insert into LIGHT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Petromax Stove Adapter 炊煮鍋架 (適用HK350/500)','型號：ez-cook',2115,'Petromax 燈具零件專區',100,60,'light_class');
Insert into LIGHT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Petromax 零件 #11 Washer for pressure gauge 壓力表橡膠墊圈 (適用HK150/250/350/500)','型號：#11',60,'Petromax 燈具零件專區',100,60,'light_class');
REM INSERTING into OTHER_CLASS
SET DEFINE OFF;
Insert into OTHER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('EXOTAC 防水易刮可換打火棒 銅灰 美國製 NANOSTRIKER XL 003100','型號：003100-GUN',170,'打火石、傘繩',100,110,'other_class');
Insert into OTHER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Coghlans #8408 輕便鏟/貓鏟 Backpackers Trowel','型號：#8408',1,'登山貓鏟',100,110,'other_class');
Insert into OTHER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Sea To Summit 戶外多功能鋁合金鏟 APTROWEL','型號：APTROWEL',10,'登山貓鏟',100,110,'other_class');
Insert into OTHER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Mont-bell 便攜不鏽鋼衛生瓢/貓鏟 40 g Handy Scoop #1124258','型號：1124258',50,'登山貓鏟',100,110,'other_class');
Insert into OTHER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('MORAKNIV Companion 不鏽鋼直刀 綠','型號：12158 / 12091',650,'戶外直刀',100,110,'other_class');
Insert into OTHER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('MORAKNIV Eldris LightDuty 不鏽鋼短直刀 莫蘭迪薄荷綠 #13855','型號：13855',720,'戶外直刀',100,110,'other_class');
Insert into OTHER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('MORAKNIV Eldris Neck Knife Kit 不鏽鋼短直刀組 橘 附掛繩、打火石','型號：13502',1620,'戶外直刀',100,110,'other_class');
Insert into OTHER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Coghlans #8765 緊急避難袋 Survival Bag','型號：#8765',225,'急難救助、身體防護',100,110,'other_class');
Insert into OTHER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Coghlans #0758 熊鈴 黃 Colored Bear Bell with Magnetic Silencer','型號：#0758',108,'急難救助、身體防護',100,110,'other_class');
Insert into OTHER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Coghlans #8908 安全剪刀 Safety Scissors','型號：8908',216,'急難救助、身體防護',100,110,'other_class');
Insert into OTHER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Coghlans #0045 四用哨 Four Function Whistles','型號：#0045',171,'急難救助、身體防護',100,110,'other_class');
Insert into OTHER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Coghlans #0905 緊急救難反光鏡 Sight-Grid Signal Mirror','型號：0905',666,'急難救助、身體防護',100,110,'other_class');
Insert into OTHER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Coghlans #0562 輕便鋸子 Pocket Sierra Saw','型號：#0562',360,'急難救助、身體防護',100,110,'other_class');
Insert into OTHER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Coghlans #8304 線鋸 Commando Saw','型號：#8304',315,'急難救助、身體防護',100,110,'other_class');
Insert into OTHER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Coghlans #7925 膠囊式真空毒液吸取器 Snake Bite Kit','型號：7925',216,'急難救助、身體防護',100,110,'other_class');
Insert into OTHER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Coghlans #8530 隨身懷爐 Hand Warmer','型號：8530',200,'急難救助、身體防護',100,110,'other_class');
Insert into OTHER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Coghlans #704 簡易線鋸 Sportsman’s Saw','型號：#704',180,'急難救助、身體防護',100,110,'other_class');
Insert into OTHER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('MORAKNIV Eldris Neck Knife Kit 不鏽鋼短直刀組 紅 附掛繩、打火石','型號：12630',1620,'戶外直刀',100,110,'other_class');
Insert into OTHER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('GEAR AID 鞋類專用修補膠 Freesole? Urethane Formula Shoe Repair #10410','型號：10410',380,'裝備清洗、保養、修補',100,110,'other_class');
Insert into OTHER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('GEAR AID 修補貼片 野生動物 黑 Tattoos #10820','型號：10820',490,'裝備清洗、保養、修補',100,110,'other_class');
Insert into OTHER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Optimus Nova / Nova+ 簡易維修包','型號：8016305',585,'裝備清洗、保養、修補',100,110,'other_class');
Insert into OTHER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('GEAR AID 矽膠尼龍製品修補膠 Silnet? Silicone Seam Sealer #10440','型號：10440',360,'裝備清洗、保養、修補',100,110,'other_class');
Insert into OTHER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('K2 萬用清潔4件組 K2-0261','型號：K2-0261',315,'裝備清洗、保養、修補',100,110,'other_class');
Insert into OTHER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Coghlans #8407 帳篷清潔組 Coghlans Tent Whisk','型號：#8407',144,'裝備清洗、保養、修補',100,110,'other_class');
Insert into OTHER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Coghlans #9944 拉鍊環 Zipper Pulls','型號：#9944',63,'裝備清洗、保養、修補',100,110,'other_class');
Insert into OTHER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('EXOTAC 防水可換打火棒 橘 美國製 FIREROD 002005','型號：002005-ORG',35,'打火石、傘繩',100,110,'other_class');
Insert into OTHER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('MORAKNIV Eldris 打火石組 Fire kit for Eldris 12888','型號：12888',30,'打火石、傘繩',100,110,'other_class');
Insert into OTHER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Petromax 擊火器 plgx','型號：plgx',800,'打火石、傘繩',100,110,'other_class');
Insert into OTHER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('MORAKNIV Fire Starter 打火石','型號：11859',90,'打火石、傘繩',100,110,'other_class');
Insert into OTHER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Victorinox Deluxe Tinker 豪華修補匠瑞士刀 17用 91 mm 1.4723','型號：1.4723',1800,'瑞士刀、折疊刀',100,110,'other_class');
Insert into OTHER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Victorinox 0.8623.MWN RescueTool 救生工具瑞士刀 15用 111mm','型號：0.8623.MWN',3220,'瑞士刀、折疊刀',100,110,'other_class');
Insert into OTHER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Nordic Pocket Saw 北歐口袋鏈鋸 紅 11001/NPSR','型號：11001/NPSR',660,'鏟子、鏈鋸',100,110,'other_class');
Insert into OTHER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Nordic Pocket Saw 北歐口袋鏈鋸 綠 11002/NPSG','型號：11002/NPSG',660,'鏟子、鏈鋸',100,110,'other_class');
Insert into OTHER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Nordic Pocket Saw PREMIUM 北歐豪華皮革口袋鏈鋸 11210','型號：11210',970,'鏟子、鏈鋸',100,110,'other_class');
Insert into OTHER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Coghlans #9065 折疊鐵鏟 Folding Shovel','型號：#9065',40,'鏟子、鏈鋸',100,110,'other_class');
Insert into OTHER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Coghlans #9725 折疊鏟 Shovel with Saw','型號：#9725',10,'鏟子、鏈鋸',100,110,'other_class');
Insert into OTHER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('MORAKNIV 12248 Flex 不鏽鋼直刀 黑/水藍','型號：12248',630,'戶外直刀',100,110,'other_class');
Insert into OTHER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('MORAKNIV BASIC 511 高碳鋼直刀 暗紅','型號：12147',360,'戶外直刀',100,110,'other_class');
Insert into OTHER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('MORAKNIV Classic Scout 39 Safe 經典木柄不鏽鋼短直刀 莓紅','型號：12024',1350,'戶外直刀',100,110,'other_class');
Insert into OTHER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('MORAKNIV Classic 2 高碳鋼經典木工刀 赭紅','型號：1-0002',720,'戶外直刀',100,110,'other_class');
Insert into OTHER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('MORAKNIV Diamond Sharpener L fine 鑽石磨刀石','型號：11883',810,'戶外直刀',100,110,'other_class');
Insert into OTHER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('UNIFLAME U662069 頂級磨刀器','型號：U662069',1640,'戶外直刀',100,110,'other_class');
Insert into OTHER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('UST #20-12128 Tool a long 10合1不鏽鋼隨身工具組 TSA可登機 熊','型號：#20-12128',56,'工具鉗、救生卡、潛水刀',100,110,'other_class');
Insert into OTHER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Aropec Birch 不鏽鋼潛水刀 尖頭','型號：K1-631',30,'工具鉗、救生卡、潛水刀',100,110,'other_class');
Insert into OTHER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('ROXON WP01 Football Keycain Multi Tool 足球工具卡','型號：WP01',0,'工具鉗、救生卡、潛水刀',100,110,'other_class');
Insert into OTHER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('UST #20-02989 Tool a long 8合1不鏽鋼隨身工具組 TSA可登機 北美野人','型號：#20-02989',56,'工具鉗、救生卡、潛水刀',100,110,'other_class');
Insert into OTHER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Leatherman 831941 JUICE S2 工具鉗 橘','型號：831941',770,'工具鉗、救生卡、潛水刀',100,110,'other_class');
Insert into OTHER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('NiteIze S-BINER S型雙面金屬扣環 #2-不銹鋼色','型號：SB2-03-11',95,'多用途登山扣環、束物帶',100,110,'other_class');
Insert into OTHER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Coghlans #9060 野營斧頭 Camp Axe','型號：#9060',86,'斧頭、獵刀',100,110,'other_class');
Insert into OTHER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Coghlans #1160 野營斧 Pack Axe','型號：#1160',92,'斧頭、獵刀',100,110,'other_class');
Insert into OTHER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('MORAKNIV Outdoor Axe 野營斧頭(硼鋼) 軍綠','型號：1-1991',340,'斧頭、獵刀',100,110,'other_class');
Insert into OTHER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('MORAKNIV Outdoor Kit 野營斧頭暨直刀組 橘','型號：12096',420,'斧頭、獵刀',100,110,'other_class');
Insert into OTHER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('MORAKNIV Outdoor Kit 野營斧頭暨直刀組 軍綠','型號：1-2001',420,'斧頭、獵刀',100,110,'other_class');
Insert into OTHER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Victorinox Classic 瑞士刀 7用 瑞士自由式摔角 58 mm 0.6223.L2009','型號：0.6223.L2009',830,'瑞士刀、折疊刀',100,110,'other_class');
Insert into OTHER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Victorinox 2019 全球限量聖誕雪花瑞士刀 14用 1.4703.7E1','型號：1.4703.7E1',2340,'瑞士刀、折疊刀',100,110,'other_class');
Insert into OTHER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Victorinox Classic Alox 5用鋁殼瑞士刀 藍 2020年限量版 58mm 0.6221.L20','型號：0.6221.L20',1560,'瑞士刀、折疊刀',100,110,'other_class');
Insert into OTHER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Victorinox Classic 瑞士刀 7用 騎單車 58 mm 0.6223.L2001','型號：0.6223.L2001',830,'瑞士刀、折疊刀',100,110,'other_class');
Insert into OTHER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Victorinox Classic 瑞士刀 7用 滑板運動 58 mm 0.6223.L2003','型號：0.6223.L2003',830,'瑞士刀、折疊刀',100,110,'other_class');
Insert into OTHER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Victorinox 0.9561.63 RabgerWood 55 瑞士刀 10用 130mm','型號：0.9561.63',3580,'瑞士刀、折疊刀',100,110,'other_class');
Insert into OTHER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('deejo 1CB021 不銹鋼折疊刀 37g 骷顱頭/百香果木刀柄','型號：1CB021',1400,'瑞士刀、折疊刀',100,110,'other_class');
Insert into OTHER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Victorinox 0.6223 瑞士刀 7用 58mm Mexican','型號：0.6223.L1602',760,'瑞士刀、折疊刀',100,110,'other_class');
Insert into OTHER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('deejo 1CB016 不銹鋼折疊刀 37g 翅膀/玫瑰木刀柄','型號：1CB016',1400,'瑞士刀、折疊刀',100,110,'other_class');
Insert into OTHER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('VICTORINOX Classic SD Desert Camouflage 瑞士刀 58mm','型號：0.6223.941',830,'瑞士刀、折疊刀',100,110,'other_class');
Insert into OTHER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Victorinox Camper 露營者瑞士刀 13 用 91 mm 1.3613','型號：1.3613',1080,'瑞士刀、折疊刀',100,110,'other_class');
Insert into OTHER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Victorinox 0.6365.T2 Manager Ruby 瑞士刀 11用 58mm 透藍','型號：0.6365.T2',1080,'瑞士刀、折疊刀',100,110,'other_class');
Insert into OTHER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Mammut Pocket Knife 瑞士刀 13用 Mammut X Victorinox 聯名款','型號：01780-0001',2500,'瑞士刀、折疊刀',100,110,'other_class');
Insert into OTHER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Sea to Summit Field Repair Buckles 日字扣零件 25mm','型號：AFRB25LLP',130,'多用途登山扣環、束物帶',100,110,'other_class');
Insert into OTHER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Coghlans #9695 縫線液 seam seal water-based','型號：9695',25,'帳蓬修補',100,110,'other_class');
Insert into OTHER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Coghlans #8812 營帳金屬扣環 Grommet Kit','型號：#8812',16,'帳蓬修補',100,110,'other_class');
Insert into OTHER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Coghlans #0196 營柱彈性繩維修包','型號：0196',0,'帳蓬修補',100,110,'other_class');
Insert into OTHER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Coghlans #8150 帳棚網布修補包 Screen Patches','型號：#8150',9,'帳蓬修補',100,110,'other_class');
Insert into OTHER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Coghlans #706 營帳塑膠扣環 Plastic Grommets','型號：#706',2,'帳蓬修補',100,110,'other_class');
Insert into OTHER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('NiteIze SlideLock #4 KeyRack 大耳垂鑰匙扣','型號：KCK-11-R3',420,'Nite Ize 扣、鑰匙圈',100,110,'other_class');
Insert into OTHER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('NiteIze CSLA#2 鋁製C型扣 藍','型號：CSLA2-03-R6',125,'Nite Ize 扣、鑰匙圈',100,110,'other_class');
Insert into OTHER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('NiteIze CSLA#3 鋁製C型扣 紅','型號：CSLA3-10-R6',150,'Nite Ize 扣、鑰匙圈',100,110,'other_class');
Insert into OTHER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('mont-bell #1124174 牛皮鎖匙扣/鑰匙圈 淺棕','型號：1124174-BN',330,'Nite Ize 扣、鑰匙圈',100,110,'other_class');
Insert into OTHER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('mont-bell #1124174 牛皮鎖匙扣/鑰匙圈 黑','型號：1124174-BK',330,'Nite Ize 扣、鑰匙圈',100,110,'other_class');
Insert into OTHER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('NiteIze S-BINER #4 雙面扣環 #4 黑','型號：SBP4-03-01',65,'Nite Ize 扣、鑰匙圈',100,110,'other_class');
Insert into OTHER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('SAC #452 青銅鑰匙圈掛飾 滑板','型號：#452/K452',630,'Nite Ize 扣、鑰匙圈',100,110,'other_class');
Insert into OTHER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('NITEIZE S-BINER 帶鎖S型雙面金屬扣環 #4-黑色','型號：LSB4-01-R3',170,'Nite Ize 扣、鑰匙圈',100,110,'other_class');
Insert into OTHER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('SAC #39 青銅鑰匙圈掛飾 鉤環+GRIGRI','型號：#39',630,'Nite Ize 扣、鑰匙圈',100,110,'other_class');
Insert into OTHER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('SAC #253 青銅鑰匙圈掛飾 加州哈雷','型號：#253/K253',810,'Nite Ize 扣、鑰匙圈',100,110,'other_class');
Insert into OTHER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('SAC #202 青銅鑰匙圈掛飾 登山車','型號：#202/K202',630,'Nite Ize 扣、鑰匙圈',100,110,'other_class');
Insert into OTHER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('SAC #9 青銅鑰匙圈掛飾 背包','型號：#9/K9',630,'Nite Ize 扣、鑰匙圈',100,110,'other_class');
Insert into OTHER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('SAC #12 青銅鑰匙圈掛飾 徒手攀登','型號：#12/K12',630,'Nite Ize 扣、鑰匙圈',100,110,'other_class');
Insert into OTHER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('RUFFWEAR Swamp Cooler 寵物反光水冷涼感衣 石墨灰','型號：05401-033',930,'寵物配件',100,110,'other_class');
Insert into OTHER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('BUFF 寵物頭巾 汪星人變形蟲 M/L','型號：BF111258',40,'寵物配件',100,110,'other_class');
Insert into OTHER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('RUFFWEAR K-9 Float Coat 寵物反光救生衣(可牽引) 蒲公英黃','型號：45101-755',880,'寵物配件',100,110,'other_class');
Insert into OTHER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('RUFFWEAR Bivy Bota 寵物反光防漏水碗 M','型號：2045-815',70,'寵物配件',100,110,'other_class');
Insert into OTHER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('RUFFWEAR Approach Pack 寵物反光固定式背包 藍','型號：50101-430',590,'寵物配件',100,110,'other_class');
Insert into OTHER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('SAC #022 青銅項鍊吊飾 滑雪者(雪板 Snowboarder)','型號：#022/N22A',630,'飾品、配件',100,110,'other_class');
Insert into OTHER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('SAC N55AOT 青銅項鍊吊飾 下降器組','型號：N55AOT',630,'飾品、配件',100,110,'other_class');
Insert into OTHER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('SAC #014 鍍金/銀耳環一對 快扣鉤環 金','型號：#014/E14OA',630,'飾品、配件',100,110,'other_class');
Insert into OTHER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('SAC E14 Spit''Express 琺瑯釉鍍金/銀耳環 快扣鉤環 成對 藍','型號：E14SBO/SBA',630,'飾品、配件',100,110,'other_class');
Insert into OTHER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Mammut Toy 經典絨毛小象玩偶 S','型號：00200-0001',440,'飾品、配件',100,110,'other_class');
Insert into OTHER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('SAC #021 青銅項鍊吊飾 岩楔','型號：#021/N21A',630,'飾品、配件',100,110,'other_class');
Insert into OTHER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('SAC #020 青銅項鍊吊飾 岩鞋','型號：#020/N20A',630,'飾品、配件',100,110,'other_class');
Insert into OTHER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('SAC #024 青銅項鍊吊飾 快扣','型號：#024/N24AO',630,'飾品、配件',100,110,'other_class');
Insert into OTHER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('SAC #028 青銅項鍊吊飾 健行冰斧','型號：#028/N28A',630,'飾品、配件',100,110,'other_class');
Insert into OTHER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('SAC #023 青銅項鍊吊飾 抱石者','型號：#023/N23A',630,'飾品、配件',100,110,'other_class');
Insert into OTHER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('MORAKNIV 13234 Roofing Felt Knife 皮革/毛氈製品切割刀 木柄','型號：13234',10,'木雕刀、電工刀',100,110,'other_class');
Insert into OTHER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('MORAKNIV Electrician 不鏽鋼專業電工刀','型號：12201',20,'木雕刀、電工刀',100,110,'other_class');
Insert into OTHER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('MORAKNIV Wood Carving Hook 162S 不鏽鋼彎勾木雕刀 原木色','型號：12817',80,'木雕刀、電工刀',100,110,'other_class');
Insert into OTHER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Morakniv Rookie 兒童用安全木雕刀 #12991','型號：12991',20,'木雕刀、電工刀',100,110,'other_class');
Insert into OTHER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('MORAKNIV Wood Carving Hook 163S 不鏽鋼彎勾木雕刀 原木色','型號：12819',80,'木雕刀、電工刀',100,110,'other_class');
Insert into OTHER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Sea To Summit Straps 勾型束物帶 2cm x 1.5m','型號：ATDASH201.5',360,'多用途登山扣環、束物帶',100,110,'other_class');
Insert into OTHER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('NiteIze S-BINER #4 雙面扣環 #4 透軍綠','型號：SBP4-03-17T',75,'多用途登山扣環、束物帶',100,110,'other_class');
Insert into OTHER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('OUTDOOR ELEMENT FIREBINER 多功能鉤環 極光','型號：F1RB',490,'多用途登山扣環、束物帶',100,110,'other_class');
Insert into OTHER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('NiteIze S-BINER S型雙面金屬扣環 #2-全黑','型號：SB2-03-01',95,'多用途登山扣環、束物帶',100,110,'other_class');
Insert into OTHER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Coghlans #0178 8mm小鉤環 Mini-Biners','型號：#0178',54,'多用途登山扣環、束物帶',100,110,'other_class');
Insert into OTHER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Sea to Summit Field Repair Buckles 快扣零件 20mm/1Pin','型號：AFRB20SRPA',150,'多用途登山扣環、束物帶',100,110,'other_class');
Insert into OTHER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Coghlans #512 雙勾彈力繩2入 Stretch Cords','型號：#512',117,'多用途登山扣環、束物帶',100,110,'other_class');
Insert into OTHER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Sea to Summit Field Repair Buckles 快扣零件 25mm/1Pin','型號：AFRB25SRPA',170,'多用途登山扣環、束物帶',100,110,'other_class');
REM INSERTING into PERSONAL_CLASS
SET DEFINE OFF;
Insert into PERSONAL_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('ODLO #421642 彈性自行車短褲 男 黑','型號：421642-15000',240,'單車衣、單車機能褲',100,70,'personal_class');
Insert into PERSONAL_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Aropec Wave 二件式三鐵緊身衣褲 男 黑/紅','型號：SS-3T-213M-BKRD',210,'單車衣、單車機能褲',100,70,'personal_class');
Insert into PERSONAL_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('ODLO #776080 半指單車手套 黑/墨灰','型號：776080-60056',300,'單車帽、手套、腿套',100,70,'personal_class');
Insert into PERSONAL_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Nathan NA4836 QuickShot Plus 手握壺300ml 黑 六折出清','型號：NA4836NB',70,'跑步用品、反光配件',100,70,'personal_class');
Insert into PERSONAL_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Nathan NA4632 Mercury2 水星雙水壺腰包 桃紅 六折出清','型號：NA4632NFFP',48,'跑步用品、反光配件',100,70,'personal_class');
Insert into PERSONAL_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Nathan NA5070 ClipLight 超亮LED輕巧夾 紅','型號：NA5070NTD',30,'跑步用品、反光配件',100,70,'personal_class');
Insert into PERSONAL_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Nathan NA4849 保冷反光手握水壺 綠 六折出清','型號：NA4849NLP',20,'跑步用品、反光配件',100,70,'personal_class');
Insert into PERSONAL_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Nathan NA4836 QuickShot Plus 手握壺300ml 紫紅 六折出清','型號：NA4836NPTL',70,'跑步用品、反光配件',100,70,'personal_class');
Insert into PERSONAL_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('deuter 32748 DS Rack Pack 單車馬鞍袋(一對) 六折特賣','型號：32748',340,'車架包、坐墊包、車前包',100,70,'personal_class');
Insert into PERSONAL_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Deuter 32689 City Bag 單車車頭袋 1.4L','型號：32689',99,'車架包、坐墊包、車前包',100,70,'personal_class');
Insert into PERSONAL_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Deuter 32668 Bike Bag S 單車座墊包 0.5L','型號：32668',99,'車架包、坐墊包、車前包',100,70,'personal_class');
Insert into PERSONAL_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Deuter 32698 Triangle Bag 單車車架包 1L','型號：32698',99,'車架包、坐墊包、車前包',100,70,'personal_class');
Insert into PERSONAL_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Deuter 32658 Bike Bag XS 單車座墊包 0.3L','型號：32658',99,'車架包、坐墊包、車前包',100,70,'personal_class');
Insert into PERSONAL_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('OSPREY REV 6 運動水袋背包 5L 綠','型號：032506-738',420,'單車背包',100,70,'personal_class');
Insert into PERSONAL_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Deuter 32114 Super Bike 單車背包 18+4L 綠','型號：32114-2704',100,'單車背包',100,70,'personal_class');
Insert into PERSONAL_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Deuter 32114 Super Bike 單車背包 18+4L 黑','型號：32114-7410',100,'單車背包',100,70,'personal_class');
Insert into PERSONAL_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('ODLO #776080 半指單車手套 黑/橘紅','型號：776080-15162',300,'單車帽、手套、腿套',100,70,'personal_class');
Insert into PERSONAL_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('ODLO #776080 半指單車手套 白/螢光綠','型號：776080-10102',300,'單車帽、手套、腿套',100,70,'personal_class');
Insert into PERSONAL_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Outdoor Research 皮革工作手套/確保手套/工程皮革手套 琥珀橘 Direct Route Gloves 264362','型號：264362-1828',620,'單車帽、手套、腿套',100,70,'personal_class');
Insert into PERSONAL_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('ODLO #421211 彈性自行車七分褲 女 黑','型號：421211-15000',330,'單車衣、單車機能褲',100,70,'personal_class');
Insert into PERSONAL_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('ODLO #410271 銀離子前開襟短袖車衣 女 水藍','型號：410271-64210',970,'單車衣、單車機能褲',100,70,'personal_class');
Insert into PERSONAL_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Craft AB 休閒短袖自行車衣 女 櫻桃紅','型號：1901284-2444',680,'單車衣、單車機能褲',100,70,'personal_class');
Insert into PERSONAL_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Outdoor Research 皮革工作手套/確保手套/工程皮革手套 綠 Direct Route Gloves 264362','型號：264362-1829',620,'單車帽、手套、腿套',100,70,'personal_class');
REM INSERTING into PROCLIMB_CLASS
SET DEFINE OFF;
Insert into PROCLIMB_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Grivel The Machine 3.0 冰攀全鍛造技術冰斧','型號：PIMAC3.0',9460,'頭盔、冰斧、雪樁、雪鏟',100,90,'proclimb_class');
Insert into PROCLIMB_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Grivel PI027 Air Tech Evo 雪地攀登鍛造技術冰斧','型號：PI027',5750,'頭盔、冰斧、雪樁、雪鏟',100,90,'proclimb_class');
Insert into PROCLIMB_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Gibbon Tree Wear XL 樹木保護套','型號：13098',20,'GIBBON 走繩',100,90,'proclimb_class');
Insert into PROCLIMB_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Gibbon RATPAD 棘輪保護套','型號：12536',40,'GIBBON 走繩',100,90,'proclimb_class');
Insert into PROCLIMB_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Gibbon Trickline The Epic Pro 特別款走繩扁帶 25M','型號：13874',380,'GIBBON 走繩',100,90,'proclimb_class');
Insert into PROCLIMB_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Gibbon Line Grip AL 鋁合金夾繩器 長走繩架設器材 出清特賣','型號：Linegrip-AL',0,'GIBBON 走繩',100,90,'proclimb_class');
Insert into PROCLIMB_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Gibbon SLACKRACK CLASSIC 3M 走繩架','型號：16117',8000,'GIBBON 走繩',100,90,'proclimb_class');
Insert into PROCLIMB_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Grivel Stealth 岩盔 / 頭盔 鈦色','型號：HESTE.TIT',3600,'頭盔、冰斧、雪樁、雪鏟',100,90,'proclimb_class');
Insert into PROCLIMB_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('CAMP CA1427 NEVE 雪地健行冰斧','型號：CA1427',2970,'頭盔、冰斧、雪樁、雪鏟',100,90,'proclimb_class');
Insert into PROCLIMB_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Petzl A15A VIZIR 頭盔面罩','型號：A15A',1840,'頭盔、冰斧、雪樁、雪鏟',100,90,'proclimb_class');
Insert into PROCLIMB_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Rock Exotica F1 Mini-Eight Figure EIGHT 迷你8字環','型號：F1',1260,'確保、上升、下降器',100,90,'proclimb_class');
Insert into PROCLIMB_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Grivel RTADR A&amp;D 上升及下降器 右手 創新設計','型號：RTADR',2250,'確保、上升、下降器',100,90,'proclimb_class');
Insert into PROCLIMB_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Petzl B51 MACROCENDER 大型繩索用上升、防墜器','型號：B51',4270,'確保、上升、下降器',100,90,'proclimb_class');
Insert into PROCLIMB_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('PETZL B17ARA ASCENSION 上升器 右','型號：B17ARA',2380,'確保、上升、下降器',100,90,'proclimb_class');
Insert into PROCLIMB_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('DMM A1160 Pivote 確保器 綠','型號：A1160GR',1390,'確保、上升、下降器',100,90,'proclimb_class');
Insert into PROCLIMB_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Beal Hold up 胸式上升器','型號：MHO',1530,'確保、上升、下降器',100,90,'proclimb_class');
Insert into PROCLIMB_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Beal Dynaclip 輕量挽索 40公分','型號：LDC40',765,'確保、上升、下降器',100,90,'proclimb_class');
Insert into PROCLIMB_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Beal Dynaclip 輕量挽索 75公分','型號：LDC75',810,'確保、上升、下降器',100,90,'proclimb_class');
Insert into PROCLIMB_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Beal Hands up 上升器','型號：MBHAR',1980,'確保、上升、下降器',100,90,'proclimb_class');
Insert into PROCLIMB_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Beal Air Force 3 確保下降器(豬鼻子) 綠','型號：MDAF3.G',990,'確保、上升、下降器',100,90,'proclimb_class');
Insert into PROCLIMB_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Beal Transf''air fixe B 固定式滑輪(滾珠承軸)','型號：MPFB',1350,'滑輪、分力盤、工作手套',100,90,'proclimb_class');
Insert into PROCLIMB_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Beal Rappel Gloves 皮革工作手套 CE認證','型號：GBR.',1170,'滑輪、分力盤、工作手套',100,90,'proclimb_class');
Insert into PROCLIMB_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('B.R. 台灣製 B2302 輔助繩 2mm x 20m 彩色','型號：07003004',190,'登山繩、扁帶、繩袋',100,90,'proclimb_class');
Insert into PROCLIMB_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('B.R. 金絲帶環 EG 25mm寬 雙耳環 五種長度','無型號資料',105,'登山繩、扁帶、繩袋',100,90,'proclimb_class');
Insert into PROCLIMB_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('B.R. 台灣製 B2304 輔助繩 4mm x 20m 彩色','型號：07003202',320,'登山繩、扁帶、繩袋',100,90,'proclimb_class');
Insert into PROCLIMB_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('MAMMUT CRAG ROPE BAG 繩袋 冠藍鴉','型號：00040-F011',3130,'登山繩、扁帶、繩袋',100,90,'proclimb_class');
Insert into PROCLIMB_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('B.R. 台灣製 AG32 金絲扁帶(傘帶) 32mmx3mm 長度50M','無型號資料',2650,'登山繩、扁帶、繩袋',100,90,'proclimb_class');
Insert into PROCLIMB_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Beal Rope Brush 繩子清潔刷','型號：RB',630,'登山繩、扁帶、繩袋',100,90,'proclimb_class');
Insert into PROCLIMB_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Beal Flat Tape 扁帶 26mm 黑 每單位公尺 CE認證','型號：SP26UNI.100.BK',59,'登山繩、扁帶、繩袋',100,90,'proclimb_class');
Insert into PROCLIMB_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Beal Cordelettes 輔助繩 3mm 橘 10公尺','型號：C03.10O',180,'登山繩、扁帶、繩袋',100,90,'proclimb_class');
Insert into PROCLIMB_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Beal Cordelettes 輔助繩 6mm 橘 每單位公尺','型號：C06.O',36,'登山繩、扁帶、繩袋',100,90,'proclimb_class');
Insert into PROCLIMB_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Beal Tubular Sling 縫合扁帶環 16mm x 60cm','型號：SAT60',180,'登山繩、扁帶、繩袋',100,90,'proclimb_class');
Insert into PROCLIMB_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Beal Mercury Group 安全頭盔 橘','型號：KMG.O',1800,'頭盔、冰斧、雪樁、雪鏟',100,90,'proclimb_class');
Insert into PROCLIMB_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Grivel PI022 Monte Bianco 雪地健行鍛造冰斧 經典木柄','型號：PI022',5700,'頭盔、冰斧、雪樁、雪鏟',100,90,'proclimb_class');
Insert into PROCLIMB_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Beal Mercury 安全頭盔 紅','型號：KM.R',1980,'頭盔、冰斧、雪樁、雪鏟',100,90,'proclimb_class');
Insert into PROCLIMB_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Komperdell Avalanche Shovel Carbon 超輕量碳纖維兩用雪鏟','型號：448-02',4500,'頭盔、冰斧、雪樁、雪鏟',100,90,'proclimb_class');
Insert into PROCLIMB_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Beal Mercury Group 安全頭盔 黃','型號：KMG.Y',1800,'頭盔、冰斧、雪樁、雪鏟',100,90,'proclimb_class');
Insert into PROCLIMB_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Grivel G1 NC Crampons 綁帶式冰爪 10爪 初學推薦！','型號：RAG01',900,'冰爪、防滑鞋套、熊掌鞋',100,90,'proclimb_class');
Insert into PROCLIMB_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Grivel G14 COM Crampons 全快扣式冰爪 12爪','型號：RA075A01',400,'冰爪、防滑鞋套、熊掌鞋',100,90,'proclimb_class');
Insert into PROCLIMB_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Grivel Spider 簡易冰爪 10爪','型號：AS500B01G',430,'冰爪、防滑鞋套、熊掌鞋',100,90,'proclimb_class');
Insert into PROCLIMB_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Grivel G12 Cramp-O-Matic 全快扣冰爪 12爪','型號：RA074A01',150,'冰爪、防滑鞋套、熊掌鞋',100,90,'proclimb_class');
Insert into PROCLIMB_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Grivel G14 NM Crampons 半快扣式冰爪 12爪','型號：RA075A02',400,'冰爪、防滑鞋套、熊掌鞋',100,90,'proclimb_class');
Insert into PROCLIMB_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Rock Exotica P21 單滑輪 1.1" MIni Machined Pulley','型號：P21',2160,'滑輪、分力盤、工作手套',100,90,'proclimb_class');
Insert into PROCLIMB_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('DMM PUL100 Hitch Climber Triple Attachment Pulley 三孔滑輪 灰','型號：PUL100BLT',1660,'滑輪、分力盤、工作手套',100,90,'proclimb_class');
Insert into PROCLIMB_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Beal Transf''air Twin B 雙滑輪(滾珠承軸) 適用鋼索、繩索','型號：MPTB',1800,'滑輪、分力盤、工作手套',100,90,'proclimb_class');
Insert into PROCLIMB_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('CAMP CA1879 Axion 全指皮革工作手套','型號：CA1879',1710,'滑輪、分力盤、工作手套',100,90,'proclimb_class');
Insert into PROCLIMB_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('DMM PUL100RAPIDE Hitch Pulley Rapide 三孔滑輪','型號：PUL100BLT',1980,'滑輪、分力盤、工作手套',100,90,'proclimb_class');
Insert into PROCLIMB_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Beal Transf''air 2B 側擺式大雙滑輪 滾珠承軸','型號：MP2B',2070,'滑輪、分力盤、工作手套',100,90,'proclimb_class');
Insert into PROCLIMB_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Rock Exotica P53-D 萬向雙滑輪 2.0" Omni-Block Swivel Pulley','型號：P53-D',6660,'滑輪、分力盤、工作手套',100,90,'proclimb_class');
Insert into PROCLIMB_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Beal Rope Tech Gloves 全指工作手套 CE認證','型號：GRT.',1080,'滑輪、分力盤、工作手套',100,90,'proclimb_class');
Insert into PROCLIMB_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Beal Twin Smith Captive 鋼製梨型雙閘門鉤環 Twin Gate 創新設計！50kN','型號：MCTSC',450,'安全確保鉤環、D環',100,90,'proclimb_class');
Insert into PROCLIMB_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Petzl M93000 CAPTIV 鉤環定位桿 2入','型號：M93000',134,'安全確保鉤環、D環',100,90,'proclimb_class');
Insert into PROCLIMB_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Beal Be Lock 3 Matic 鋁合金梨型三段自動上鎖鉤環','型號：MCLBL3',612,'安全確保鉤環、D環',100,90,'proclimb_class');
Insert into PROCLIMB_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Grivel Plume Quickdraws 輕量鍛造鉤環快扣組','型號：K3W+K3W',820,'快扣鉤環組、繩鍊、Sling',100,90,'proclimb_class');
Insert into PROCLIMB_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Beal Dyneema Sling 縫合扁帶環 紫 6mm x 120cm','型號：SAD06.120',486,'快扣鉤環組、繩鍊、Sling',100,90,'proclimb_class');
Insert into PROCLIMB_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Beal Flat Sling 縫合扁帶環 藍 18mm x 80cm','型號：SA80',180,'快扣鉤環組、繩鍊、Sling',100,90,'proclimb_class');
Insert into PROCLIMB_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('DMM Trad Bag 粉袋 藍','型號：CB23BL',90,'岩鞋、粉袋、抱石墊',100,90,'proclimb_class');
Insert into PROCLIMB_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Beal Ball-it 碳酸鎂粉球 56g','型號：BALL56',80,'岩鞋、粉袋、抱石墊',100,90,'proclimb_class');
Insert into PROCLIMB_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('DMM Trad Bag 粉袋 紅','型號：CB23RD',90,'岩鞋、粉袋、抱石墊',100,90,'proclimb_class');
Insert into PROCLIMB_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Hanchor Sublime 攀岩毛刷 黑','型號：OS13-BK',90,'岩鞋、粉袋、抱石墊',100,90,'proclimb_class');
Insert into PROCLIMB_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Beal Ball-it 碳酸鎂粉球 2x35g','型號：BALL35',70,'岩鞋、粉袋、抱石墊',100,90,'proclimb_class');
Insert into PROCLIMB_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Grivel Thor Hammer 雷神索爾岩槌','型號：RTTHOR',100,'岩楔、冰螺絲、固定點',100,90,'proclimb_class');
Insert into PROCLIMB_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('DMM A1618A Wallnut 岩楔 #8 水藍','型號：A1618A',10,'岩楔、冰螺絲、固定點',100,90,'proclimb_class');
Insert into PROCLIMB_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Beal Bucket Hat 工具掛袋蓋','型號：SAC.BH',95,'安全吊帶',100,90,'proclimb_class');
Insert into PROCLIMB_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('EDELRID 71599 MOE II 登山攀岩安全吊帶 綠','型號：71599-774',70,'安全吊帶',100,90,'proclimb_class');
Insert into PROCLIMB_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Grivel is251 360° 冰螺絲S 12cm','型號：IS251S',970,'岩楔、冰螺絲、固定點',100,90,'proclimb_class');
Insert into PROCLIMB_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Grivel is251 360° 冰螺絲 L 20cm','型號：IS251L',970,'岩楔、冰螺絲、固定點',100,90,'proclimb_class');
Insert into PROCLIMB_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('DMM A1613A Wallnut 岩楔 #3 銀','型號：A1613A',90,'岩楔、冰螺絲、固定點',100,90,'proclimb_class');
Insert into PROCLIMB_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('B.R. 金絲帶環 FG 32mm寬 縫合繩環 五種長度','型號：702093',160,'快扣鉤環組、繩鍊、Sling',100,90,'proclimb_class');
Insert into PROCLIMB_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Beal Flat Sling 縫合扁帶環 30mm x 120cm','型號：SA30.120',324,'快扣鉤環組、繩鍊、Sling',100,90,'proclimb_class');
Insert into PROCLIMB_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Grivel Dyneema Ring 縫合扁帶環(繩環) 10mm x 240cm','型號：RTRING240',930,'快扣鉤環組、繩鍊、Sling',100,90,'proclimb_class');
Insert into PROCLIMB_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Grivel rock safety carabiner HELP 鉤環','型號：RSK15BH',450,'安全確保鉤環、D環',100,90,'proclimb_class');
Insert into PROCLIMB_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Grivel rock safety carabiner K10G CLEPSYDRA S TWIN GATE 鉤環','型號：RSK10GS',780,'安全確保鉤環、D環',100,90,'proclimb_class');
Insert into PROCLIMB_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Rock Exotica C81A SwivaBiner Carabiner 萬向鉤環連接器(雙鉤環)','型號：C81A',3330,'安全確保鉤環、D環',100,90,'proclimb_class');
Insert into PROCLIMB_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Rock Exotica C2 S RockD Screw-LOCK 手轉上鎖鋁合金D型鉤環 軍警黑','型號：C2 S-B',680,'安全確保鉤環、D環',100,90,'proclimb_class');
Insert into PROCLIMB_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Rock Exotica C2 BW RockD Bi-Wire 鋁合金雙閘門D型鉤環','型號：C2 BW',630,'安全確保鉤環、D環',100,90,'proclimb_class');
Insert into PROCLIMB_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Beal Flat Link 2 Matic 鋁合金二段自動上鎖鉤環','型號：MCLFL',630,'安全確保鉤環、D環',100,90,'proclimb_class');
Insert into PROCLIMB_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Grivel Rotor 萬向鉤環連結器 (非個人保護裝備)','型號：RTROTN',450,'安全確保鉤環、D環',100,90,'proclimb_class');
Insert into PROCLIMB_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Beal Attrac''s Tool 磁吸工具墊','型號：AAT',20,'安全吊帶',100,90,'proclimb_class');
Insert into PROCLIMB_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Beal Tool-Bucket 工具掛袋','型號：SAC.TB',30,'安全吊帶',100,90,'proclimb_class');
Insert into PROCLIMB_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Beal Air-leash 工具吊環(失手繩)','型號：AL',10,'安全吊帶',100,90,'proclimb_class');
Insert into PROCLIMB_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('EDELRID E83794 ROKA-e 攀樹樹皮保護器','型號：E83794',50,'攀樹用具',100,90,'proclimb_class');
Insert into PROCLIMB_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('DMM Captain 攀樹投擲勾','型號：TH100',400,'攀樹用具',100,90,'proclimb_class');
Insert into PROCLIMB_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('EDELRID Conecto Swivel 萬向轉軸連接器','型號：71766-130',50,'攀樹用具',100,90,'proclimb_class');
Insert into PROCLIMB_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Petzl AIRLINE 攀樹投擲線 60公尺','型號：R02Y 060',160,'攀樹用具',100,90,'proclimb_class');
REM INSERTING into PROMECH_CLASS
SET DEFINE OFF;
Insert into PROMECH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('NIKON 8x25 Sportstar EX 雙筒望遠鏡 公司貨','型號：033005',840,'望遠鏡、測距儀、運動攝影機',100,80,'promech_class');
Insert into PROMECH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Nikon COOLSHOT 雷射測距望遠鏡','型號：037446',3520,'望遠鏡、測距儀、運動攝影機',100,80,'promech_class');
Insert into PROMECH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Coghlans #0235 兒童用望遠鏡 Binoculars for Kids','型號：#0235',15,'望遠鏡、測距儀、運動攝影機',100,80,'promech_class');
Insert into PROMECH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('GARMIN Lithium-ion Battery Pack 鋰電池 適用Montana、Virb','型號：010-11654-03',45,'電池、儲電設備',100,80,'promech_class');
Insert into PROMECH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('GoPro Rechargeable Li-Ion Battery HERO3專用電池','型號：AHDBT-301',0,'電池、儲電設備',100,80,'promech_class');
Insert into PROMECH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('GARMIN RAM Mounting Kit Montana專用機車用固定座配件','型號：010-10962-00',700,'儀器配件',100,80,'promech_class');
Insert into PROMECH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('GARMIN Handlebar Mount 手把式固定座','型號：010-11023-00',20,'儀器配件',100,80,'promech_class');
Insert into PROMECH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Polaroid 寶麗萊 Helmet Mount 安全帽快拆座','型號：POLC3HM',80,'儀器配件',100,80,'promech_class');
Insert into PROMECH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('GARMIN Vented Helmet Strap Mount VIRB專用自行車安全帽固定座','型號：010-11921-08',70,'儀器配件',100,80,'promech_class');
Insert into PROMECH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('GARMIN Mount Base Kit VIRB專用固定座底座(平面/弧面)','型號：010-11921-02',35,'儀器配件',100,80,'promech_class');
Insert into PROMECH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Garmin Forerunner 935 腕式心率全方位鐵人運動錶 黑','型號：010-01746-10',3990,'運動錶、運動手環',100,80,'promech_class');
Insert into PROMECH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('GARMIN 戶外GPS腕錶 玫瑰金 FENIX 6S 010-02159-72','型號：010-02159-72',2990,'運動錶、運動手環',100,80,'promech_class');
Insert into PROMECH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('CASIO PRW-6000 Pro Trek 登山錶 橡膠(含碳纖維)錶帶 黑/綠 指針數位雙顯、太陽能電力、電波對時、氣壓變化警示','型號：PRW-6000Y-1A',7100,'運動錶、運動手環',100,80,'promech_class');
Insert into PROMECH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('SUUNTO SPARTAN TRAINER WRIST HR GPS 智慧運動錶 黑色','型號：SS022996000',990,'運動錶、運動手環',100,80,'promech_class');
Insert into PROMECH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('GARMIN 戶外GPS腕錶 戶外探險款 FENIX 6 010-02158-42','型號：010-02158-42',3990,'運動錶、運動手環',100,80,'promech_class');
Insert into PROMECH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Thuraya XT-LITE 舒拉亞衛星電話 中華電信授權，僅限百岳門市申辦','型號：XT-LITE',4200,'衛星電話',100,80,'promech_class');
Insert into PROMECH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Thuraya XT-PRO 舒拉亞衛星電話 專業款 中華電信授權，僅限百岳門市申辦','型號：XT-PRO',7000,'衛星電話',100,80,'promech_class');
Insert into PROMECH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Thuraya XT-PRO 舒拉亞衛星電話 儲值預付卡 160單位','型號：XT-PRO-160',300,'衛星電話',100,80,'promech_class');
Insert into PROMECH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('SILVA Field 森林式指北針','型號：37501',50,'指北針、高度計、計步器',100,80,'promech_class');
Insert into PROMECH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Baladeo PLR203 觀測指南針','型號：PLR203',20,'指北針、高度計、計步器',100,80,'promech_class');
Insert into PROMECH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Coghlans #9685 地圖指北針 Map Compass','型號：#9685',52,'指北針、高度計、計步器',100,80,'promech_class');
Insert into PROMECH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Coghlans #9714 溫度、指北針鑰匙圈 Campass Thermometer','型號：#9714',17,'指北針、高度計、計步器',100,80,'promech_class');
Insert into PROMECH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Coghlans #8162 地圖指北針 Map Compass','型號：#8162',16,'指北針、高度計、計步器',100,80,'promech_class');
Insert into PROMECH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('GARMIN eTrex 30x 掌上型衛星導航儀 GPS、GLONASS雙星定位','型號：010-01508-18',999,'Garmin GPS 衛星導航',100,80,'promech_class');
Insert into PROMECH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('GARMIN eTrex 32x 掌上型雙星定位導航儀 GPS、GLONASS 雙星定位 010-02257-05','型號：010-02257-05',990,'Garmin GPS 衛星導航',100,80,'promech_class');
Insert into PROMECH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('NIKON 防水型輕便雙筒望遠鏡 黃 Aculon W10 8x21 公司貨','型號：00371209',120,'望遠鏡、測距儀、運動攝影機',100,80,'promech_class');
Insert into PROMECH_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('NIKON 10x25DCF Sportstar EX 雙筒望遠鏡 公司貨','型號：033006',240,'望遠鏡、測距儀、運動攝影機',100,80,'promech_class');
REM INSERTING into SHOES_CLASS
SET DEFINE OFF;
Insert into SHOES_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Pajak Slippers 羽絨拖鞋 中性款 黑','型號：Slippers-BLK',1800,'中高筒登山鞋',100,20,'shoes_class');
Insert into SHOES_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Merrell MOAB FST MID GORE-TEX 中筒健行鞋 淺灰/灰','型號：J37561',4540,'中高筒登山鞋',100,20,'shoes_class');
Insert into SHOES_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Alico TAHOE 全皮革登山鞋 - 反毛皮駝色款 義大利製造 3折出清','型號：61043',1900,'中高筒登山鞋',100,20,'shoes_class');
Insert into SHOES_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Merrell 中筒健行鞋 男 圓石色 MOAB 2 MID GORE-TEX J033317','型號：J033317',3660,'中高筒登山鞋',100,20,'shoes_class');
Insert into SHOES_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Zamberlan 輕量中筒健行鞋 棕 325 CORNELL LITE GTX 0325PM','型號：0325PM0G-M0',6900,'中高筒登山鞋',100,20,'shoes_class');
Insert into SHOES_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Merrell 中筒健行鞋 男 橄欖綠 ALVERSTONE GORE-TEX J034281','型號：J034281',3420,'中高筒登山鞋',100,20,'shoes_class');
Insert into SHOES_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Merrell 中筒健行鞋 女 淺咖啡 ALVERSTONE GORE-TEX J033022','型號：J033022',3420,'中高筒登山鞋',100,20,'shoes_class');
Insert into SHOES_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Merrell 寬楦中筒健行鞋 女 灰/淺藍 MOAB 2 MID GORE-TEX J06060W','型號：J06060W',3980,'中高筒登山鞋',100,20,'shoes_class');
Insert into SHOES_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('LOWA 310537 ZEPHYR GTX MID TF 中筒多功能軍用鞋 鼠尾草綠','型號：LW310537-0934',7180,'中高筒登山鞋',100,20,'shoes_class');
Insert into SHOES_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Keen 防水中筒健行鞋 男 咖啡 Targhee Exp Mid WP 1023022','型號：1023022',4180,'中高筒登山鞋',100,20,'shoes_class');
Insert into SHOES_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('On 岩石雲 輕量健行鞋 男 鋼琴黑 CloudrockWP 2399854','型號：2399854',5840,'中高筒登山鞋',100,20,'shoes_class');
Insert into SHOES_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('MERRELL MOAB FST 2 MID GORE-TEX 中筒健行鞋 女 淺藍灰','型號：J49182',4540,'中高筒登山鞋',100,20,'shoes_class');
Insert into SHOES_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Keen 1018178 Targhee III Waterproof Mid 防水中筒健行鞋 女 咖啡/紫紅','型號：1018178',4480,'中高筒登山鞋',100,20,'shoes_class');
Insert into SHOES_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Mammut Chamuera Mid WP 防水健行鞋 男 墨灰/木材褐','型號：05840-00091',6840,'中高筒登山鞋',100,20,'shoes_class');
Insert into SHOES_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Merrell MOAB 2 MID GORE-TEX 中筒健行鞋 男 棕色','型號：J06057',3660,'中高筒登山鞋',100,20,'shoes_class');
Insert into SHOES_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Mammut Mercury Tour High GTX&reg; 防水高筒登山鞋 男 樹皮棕','型號：05510-0574',7290,'中高筒登山鞋',100,20,'shoes_class');
Insert into SHOES_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('MERRELL MOAB 2 GORE-TEX 低筒健行鞋 男 淺棕','型號：12133',3420,'低筒健行鞋',100,20,'shoes_class');
Insert into SHOES_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Zamberlan 輕量低筒健行鞋 棕 205 STROLL GTX 0205PM','型號：0205PM0G-M0',5380,'低筒健行鞋',100,20,'shoes_class');
Insert into SHOES_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('KEEN 低筒健行鞋 男 黑/黃/紅 JASPER ROCKS SP 1023017','型號：1023017',3580,'低筒健行鞋',100,20,'shoes_class');
Insert into SHOES_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Merrell MOAB 2 GORE-TEX 低筒健行鞋 3E寬楦 女 灰/淺藍','型號：J06036W',3660,'低筒健行鞋',100,20,'shoes_class');
Insert into SHOES_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('ON 輕量雲跑鞋 男 風格黑 CLOUDX M BLACK/ASPHALT 204005','型號：204005',380,'慢跑鞋',100,20,'shoes_class');
Insert into SHOES_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('On 2999845 Cloudstratus 雙層雲跑鞋 男 星際黑','型號：2999845',230,'慢跑鞋',100,20,'shoes_class');
Insert into SHOES_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('On 2999844 Cloudstratus 雙層雲跑鞋 女 星際黑','型號：2999844',230,'慢跑鞋',100,20,'shoes_class');
Insert into SHOES_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('On 2999866 Cloudstratus 雙層雲跑鞋 女 月光藍','型號：2999866',230,'慢跑鞋',100,20,'shoes_class');
Insert into SHOES_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('On 074306 Cloudracer 競速雲跑鞋 男 萊姆綠','型號：74306',630,'慢跑鞋',100,20,'shoes_class');
Insert into SHOES_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Merrell 運動涼鞋 女 深藍 KAHUNA WEB J002052','型號：J002052',2620,'運動涼鞋',100,20,'shoes_class');
Insert into SHOES_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('BEDROCK 越野運動涼鞋 中性款 黑 Cairn 3D PRO II Adventure Sandals','型號：Cairn 3D PRO II-Black',4500,'運動涼鞋',100,20,'shoes_class');
Insert into SHOES_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('OOFOS 紓壓拖鞋 女 黑 201-W1100-BLK','型號：201-W1100-BLK',1480,'運動涼鞋',100,20,'shoes_class');
Insert into SHOES_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Alico EVEREST 全皮革超級重裝靴 義大利製造 3 折出清','型號：61035',4000,'中高筒登山鞋',100,20,'shoes_class');
Insert into SHOES_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Alico TAHOE 全皮革登山鞋 - 亮面皮深咖啡色 義大利製造 3折出清','型號：61042',1900,'中高筒登山鞋',100,20,'shoes_class');
Insert into SHOES_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Alico New Guide 全皮革重裝靴 義大利製造 3 折出清','型號：61036',2800,'中高筒登山鞋',100,20,'shoes_class');
Insert into SHOES_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Alico Belluno 全皮革登山鞋 反毛皮深棕款 義大利製造 3 折出清','型號：61050',2500,'中高筒登山鞋',100,20,'shoes_class');
Insert into SHOES_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Spirale Bernd 雪靴 男 黑/深棕','型號：SPI99308',160,'雪鞋',100,20,'shoes_class');
Insert into SHOES_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Spirale Tina 雪靴 女 黑/深棕','型號：SPI99231',990,'雪鞋',100,20,'shoes_class');
Insert into SHOES_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('SPIRALE TOMMY 雪靴 黑','型號：SPI09907',160,'雪鞋',100,20,'shoes_class');
Insert into SHOES_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('KIMBERFEEL Marconi 保暖雪鞋 兒童 紫','型號：Marconi-VI',780,'雪鞋',100,20,'shoes_class');
Insert into SHOES_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('KIMBERFEEL Marconi 保暖雪鞋 兒童 綠','型號：Marconi-GN',780,'雪鞋',100,20,'shoes_class');
Insert into SHOES_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('On 124007 Cloudventure 輕量野跑雲跑鞋 女 高調灰','型號：124007',630,'越野跑鞋',100,20,'shoes_class');
Insert into SHOES_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('LA SPORTIVA 26RGG ULTRA RAPTOR GTX 防水透氣越野跑鞋 男 灰綠','型號：26RGG',980,'越野跑鞋',100,20,'shoes_class');
Insert into SHOES_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('ON 2299951 CLOUDVENTURE WATERPROOF 防水野跑雲跑鞋 男 寂靜黑','型號：2299951',890,'越野跑鞋',100,20,'shoes_class');
Insert into SHOES_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('LA SPORTIVA 36A999202 HELIOS 2.0 輕量越野跑鞋 男 黑','型號：36A999202',290,'越野跑鞋',100,20,'shoes_class');
Insert into SHOES_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('MERRELL MOAB 2 GORE-TEX 低筒健行鞋 女 藍/黑','型號：ML41108',3420,'低筒健行鞋',100,20,'shoes_class');
Insert into SHOES_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Alico Mocassino 低筒健行休閒鞋 極致品味！義大利製造 3 折出清','型號：61045',1900,'低筒健行鞋',100,20,'shoes_class');
Insert into SHOES_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('On 1240327 Cloudventure 輕量野跑雲跑鞋 男 沈穩藍','型號：124032',630,'越野跑鞋',100,20,'shoes_class');
Insert into SHOES_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('MERRELL ML49084 CHOPROCK 水陸兩用運動鞋 女 淺灰藍','型號：49084',940,'水陸鞋',100,20,'shoes_class');
Insert into SHOES_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('MERRELL ML12627 WATERPRO MAIPO 水陸兩用運動鞋 男 黑 / 橘','型號：12627',380,'水陸鞋',100,20,'shoes_class');
Insert into SHOES_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('MERRELL ML19922 WATERPRO MAIPO 2 水陸兩用運動鞋 女 湖水藍','型號：19922',380,'水陸鞋',100,20,'shoes_class');
Insert into SHOES_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Darn Tough 羊毛健行襪 女 灰 Kelso Micro Crew Light Cushion DT1968','型號：DT1968-GRAY',840,'襪子',100,20,'shoes_class');
Insert into SHOES_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Smartwool PhD 輕量滑雪避震印花高筒襪 女 炭黑','型號：SW001039003',1000,'襪子',100,20,'shoes_class');
Insert into SHOES_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('SMARTWOOL SW942B25 中量休閒徒步 土星環紋中長襪 男 靛藍','型號：SW942B25',800,'襪子',100,20,'shoes_class');
Insert into SHOES_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('SmartWool PhD戶外輕量減震印花中長襪 男 海洋藍 SW001253810','型號：SW001253810',800,'襪子',100,20,'shoes_class');
Insert into SHOES_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('SMARTWOOL SW003945B96 中量休閒徒步 Pressure Free 中長襪 女 沼澤灰','型號：SW003945B96',740,'襪子',100,20,'shoes_class');
Insert into SHOES_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Thorlos EXPERIA 雪豹超短筒運動跑步襪 黑','型號：XCCU-066',440,'襪子',100,20,'shoes_class');
Insert into SHOES_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Smartwool Striped Hike Medium Crew 健行中級避震條紋中長襪 童 山嵐紫','型號：SW001213591',590,'襪子',100,20,'shoes_class');
Insert into SHOES_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('injinji NAA2593 五趾中筒內襪 灰','型號：NAA2593',295,'襪子',100,20,'shoes_class');
Insert into SHOES_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Smartwool PhD 戶外重量級減震中長襪 女 炭黑','型號：SW001076003',970,'襪子',100,20,'shoes_class');
Insert into SHOES_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Darn Tough 羊毛健行襪 女 薰衣草 Treeline Micro Crew Cushion DT1971','型號：DT1971-LAVENDER',920,'襪子',100,20,'shoes_class');
Insert into SHOES_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Darn Tough 羊毛健行襪 女 水藍條紋 HIKER BOOT SOCK CUSHION DT1904','型號：DT1904-AQUA STRIPE',920,'襪子',100,20,'shoes_class');
Insert into SHOES_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Darn Tough 羊毛健行襪 男 炭灰 HIKER BOOT SOCK CUSHION DT1403','型號：DT1403-Charcoal',1000,'襪子',100,20,'shoes_class');
Insert into SHOES_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Darn Tough 羊毛健行襪 男 藍 HIKER MICRO CREW CUSHION DT1466','型號：DT1466-BLU',920,'襪子',100,20,'shoes_class');
Insert into SHOES_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Smartwool PhD 滑雪中量級減震印花高筒襪 女 湖水綠','型號：SW001002A19',1000,'襪子',100,20,'shoes_class');
Insert into SHOES_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('KEEN 經典護趾水陸涼鞋 NEWPORT H2 男 DEAD DYE 日本限定款 墨水藍/印花 1022254','型號：1022254',3500,'運動涼鞋',100,20,'shoes_class');
Insert into SHOES_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Chaco 越野紓壓運動涼鞋 標準款 男 實體黑 J106763','型號：J106763',2970,'運動涼鞋',100,20,'shoes_class');
Insert into SHOES_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('KEEN 1020288 Newport H2 護趾涼鞋 男 深咖啡/綠','型號：1020288',2950,'運動涼鞋',100,20,'shoes_class');
Insert into SHOES_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('KEEN 1002325 Venice H2 護趾涼鞋 男 黑','型號：1002325',2650,'運動涼鞋',100,20,'shoes_class');
Insert into SHOES_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('KEEN 1002034 Yogui 海灘拖鞋 男 綠/黑','型號：1002034',1780,'運動涼鞋',100,20,'shoes_class');
Insert into SHOES_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('BEDROCK Cairn ADVENTURE SANDALS 越野運動涼鞋 中性款 橘','型號：Cairn Adventure-Copper',3600,'運動涼鞋',100,20,'shoes_class');
Insert into SHOES_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('BEDROCK Cairn 3D PRO ADVENTURE SANDALS 越野運動涼鞋 中性款 橘','型號：Cairn 3D PRO-Copper',4140,'運動涼鞋',100,20,'shoes_class');
Insert into SHOES_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Zamberlan Stivale Kenya P. S21 黃金大底雨靴 - Hunting Rubber Boots','型號：0S20CM0P-DG',800,'水陸鞋',100,20,'shoes_class');
Insert into SHOES_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('KEEN 1018940 Newport Hydro 水陸護趾涼鞋 男 深藍/黑','型號：1018940',150,'水陸鞋',100,20,'shoes_class');
Insert into SHOES_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Thorlos HRX 健康減壓襪(中筒) 白','型號：HRX-004',570,'襪子',100,20,'shoes_class');
Insert into SHOES_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Bridgedale BD-644 WoolFusion Trekker 羊毛保暖登山襪-中厚 女 天藍','型號：BD-644-401',730,'襪子',100,20,'shoes_class');
Insert into SHOES_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Smartwool Hike Med Crew 健行厚羊毛襪 灰褐','型號：SW130236',680,'襪子',100,20,'shoes_class');
Insert into SHOES_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Enforma 41022 Bike Light Pro Metal 單車運動短襪 銀','型號：41022-C2',420,'襪子',100,20,'shoes_class');
Insert into SHOES_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Smartwool PhD Run Ultra Light Micro 無筒輕薄羊毛跑步襪 男 橘','型號：SW061-827',590,'襪子',100,20,'shoes_class');
Insert into SHOES_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Enforma 41054 Compression 運動壓縮小腿套 黑 一對','型號：41054-C6',460,'襪子',100,20,'shoes_class');
Insert into SHOES_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Enforma 41075 Ski Compression 長筒滑雪襪 黑','型號：41075-C2',630,'襪子',100,20,'shoes_class');
Insert into SHOES_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Enforma 41075 Ski Compression 長筒滑雪襪 藍','型號：41075-C1',630,'襪子',100,20,'shoes_class');
Insert into SHOES_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Enforma 41078 Trekking Extreme Compression 高筒羊毛登山健行襪 黑','型號：41078-C1',480,'襪子',100,20,'shoes_class');
Insert into SHOES_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Enforma 41078 Trekking Extreme Compression 高筒羊毛登山健行襪 卡其','型號：41078-C2',480,'襪子',100,20,'shoes_class');
Insert into SHOES_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Enforma 41076 Ski Compression 長筒滑雪襪 紅','型號：41076-C1',630,'襪子',100,20,'shoes_class');
Insert into SHOES_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Komperdell 鋁合金T型把二節強力鎖定登山杖 WALKER POWER LOCK3 1862301-10','型號：1862301-10',1620,'登山杖',100,20,'shoes_class');
Insert into SHOES_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Outdoor Research 61631 Verglas Gaiters 綁腿 女款 黑','型號：61631-001',340,'綁腿',100,20,'shoes_class');
Insert into SHOES_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Outdoor Research 61611 Verglas Gaiters 綁腿 暗藍','型號：61611-285',340,'綁腿',100,20,'shoes_class');
Insert into SHOES_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Sea to Summit Quagmire eVent 綁腿','型號：AQEG',320,'綁腿',100,20,'shoes_class');
Insert into SHOES_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Outdoor Research 61631 Verglas Gaiters 綁腿 女款 紫','型號：61631-380',340,'綁腿',100,20,'shoes_class');
Insert into SHOES_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('犀牛 #703 中型超輕綁腿','型號：#703',72,'綁腿',100,20,'shoes_class');
Insert into SHOES_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('SOF SOLE Airr Orthotic 氣墊式足弓支撐鞋墊 女','型號：S1338w',90,'鞋墊',100,20,'shoes_class');
Insert into SHOES_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('SOF SOLE Athlete 運動鞋墊 女','型號：S5310w',90,'鞋墊',100,20,'shoes_class');
Insert into SHOES_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Superfeet Green Premium Insoles 寬版綠色科技鞋墊 High Volume','型號：15006/08/10',420,'鞋墊',100,20,'shoes_class');
Insert into SHOES_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('SOF SOLE Athlete 運動鞋墊 中性款','型號：S5310m',90,'鞋墊',100,20,'shoes_class');
Insert into SHOES_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('SOF SOLE Airr 氣墊式鞋墊 女','型號：S5710w',60,'鞋墊',100,20,'shoes_class');
Insert into SHOES_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Komperdell 全碳纖快折泡棉短握把登山杖 CARBON FXP.4 TRAIL ULTRALIGHT VARIO 1942338-10','型號：1942338-10',3150,'登山杖',100,20,'shoes_class');
Insert into SHOES_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Komperdell 1742464-02 HIKEMASTER POWERLOCK 鋁合金強力鎖定橡膠握把登山杖 120cm','型號：1742464-02',1620,'登山杖',100,20,'shoes_class');
Insert into SHOES_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Komperdell Guide Titanal 鈦金照相登山杖','型號：1792402-10',2430,'登山杖',100,20,'shoes_class');
Insert into SHOES_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Komperdell 鈦金快扣長握把登山杖 EXPLORER CONTOUR POWERLOCK 1742312-10','型號：1742312-10',1890,'登山杖',100,20,'shoes_class');
Insert into SHOES_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Komperdell C3 Carbon PowerLock Compact 碳纖強力鎖定泡棉短握把登山杖 輕巧款 2016年新款，120 cm','型號：1752314-10',2250,'登山杖',100,20,'shoes_class');
Insert into SHOES_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Komperdell Ridgehiker Cork 鋁合金強力鎖定軟木握把登山杖 輕巧款 120cm','型號：1742445-10',1575,'登山杖',100,20,'shoes_class');
Insert into SHOES_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Komperdell 鋁合金橡膠握把登山杖 Wild Rambler 1742317-10','型號：1742317-10',900,'登山杖',100,20,'shoes_class');
Insert into SHOES_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Komperdell Highlander Cork Antishock 7075 鋁合金軟木握把避震登山杖','型號：1742440-10',1200,'登山杖',100,20,'shoes_class');
Insert into SHOES_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Komperdell Highlander Cork 7075 鋁合金軟木握把登山杖','型號：1742441-10',990,'登山杖',100,20,'shoes_class');
REM INSERTING into TENT_CLASS
SET DEFINE OFF;
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('ISUKA 2007 Gore-Tex 三層布露宿袋 標準版','型號：200721',7200,'睡袋、毛毯、露宿袋',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Sea To Summit Dry Sack 30D eVent 輕量防水透氣壓縮式收納袋 M','型號：AUCDSM',1330,'睡袋、毛毯、露宿袋',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Sea To Summit eVENT 防水透氣壓縮式收納袋 L','型號：ADCSL',1240,'睡袋、毛毯、露宿袋',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Selk''Bag 神客睡袋人 4G Original 經典系列 森林綠 4℃','型號：SB4CSFG',4500,'睡袋、毛毯、露宿袋',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Selk''Bag 神客睡袋人 4G Original 經典系列 天空藍 4℃','型號：SB4CSDB',4500,'睡袋、毛毯、露宿袋',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Selk''Bag 神客睡袋人 5G Lite 輕量系列 瀝石灰 7℃','型號：SBLT5AG',2970,'睡袋、毛毯、露宿袋',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Coghlans #1123 睡袋壓縮袋30L Compression Sack','型號：#1123',774,'睡袋、毛毯、露宿袋',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Coghlans #7890 Sleeping Bag Straps 睡袋綑綁帶','型號：#7890',99,'睡袋、毛毯、露宿袋',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Selk''Bag 神客睡袋人 Marvel 英雄聯盟限量款 美國隊長 成人款 7℃','型號：SBMVCA',3948,'睡袋、毛毯、露宿袋',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Coghlans #1116 睡袋壓縮袋10L Compression Sack','型號：#1116',576,'睡袋、毛毯、露宿袋',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Therm-a-Rest 舒適充氣睡墊 寬版 RW/183cm 美國製造 7.6 公分 820g NeoAir Topo 13223','型號：13223',500,'登山睡墊',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Therm-a-Rest Z-Lite 蛋殼型方形特輕睡墊 130cm','型號：06669',510,'登山睡墊',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Therm-a-Rest 極輕充氣睡墊 250g 美國製造 NeoAir? UberLite? 13248','型號：13248',200,'登山睡墊',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Exped SynMat UL Lite M 化纖充氣睡墊','型號：69571',380,'登山睡墊',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('100mountain 舒適型單人輕量充氣睡墊 黑 186 x 65 x 6 cm 適用登山、露營 獨立氣筒設計，僅 683g！','型號：AS7212-264R',160,'登山睡墊',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Lumikenka 露米 漫步雲端空氣床/露營睡墊 精緻版 CA04','型號：CA04',680,'露營睡墊',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('嘉隆 鋁箔睡墊方形4人 200x200cmx3mm 厚','型號：K-6704',20,'露營睡墊',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('嘉隆 鋁箔睡墊方形5人 270x270cmx3mm厚','型號：K-6709',20,'露營睡墊',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('100mountain 193x63.5x厚8.89cm 露營用TPU充氣睡墊 彈性+止滑 一次買4個送裝備收納袋','型號：7619-257',880,'露營睡墊',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('努特NUIT 夢遊仙境充氣床墊XL號 289x197 cm 最適合帳篷300x300','型號：NTB13',680,'露營睡墊',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('CABEAU EVOLUTION? S3 旅行用記憶頸枕 夜黑','型號：LK04UAA00006',1330,'充氣枕、頸枕、旅行枕',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('100mountain Self-Inflating Pillow 自動充氣枕頭 登山款 紅 充氣快速、銷售第一','型號：PI-105_RD',300,'充氣枕、頸枕、旅行枕',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('CABEAU EVOLUTION? S3 旅行用記憶頸枕 紳灰','型號：LK04UAC00004',1330,'充氣枕、頸枕、旅行枕',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('100mountain 700FP 羽絨睡袋 北大武藍 D800','型號：01005004/D800',5600,'睡袋、毛毯、露宿袋',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('100mountain P-133 輕量化纖睡袋 紅 PrimaLoft Sport','型號：P-133R',3500,'睡袋、毛毯、露宿袋',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Pajak Quest 4Two 波蘭白鴨絨雙人睡袋 橄綠 1300g','型號：4TWO-green',11700,'睡袋、毛毯、露宿袋',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('MONT-BELL #1121204 ULTRA LIGHT SUPER SPIRAL DOWN HUGGER #0 螺旋狀彈性斜紋超輕量羽絨睡袋 紅','型號：1121204-SURD',17670,'睡袋、毛毯、露宿袋',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Pajak Radical 8H 波蘭白鵝絨睡袋 黑/銀','型號：radical-8h',24300,'睡袋、毛毯、露宿袋',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('UNIFLAME 681695 鋁棒溫度計','型號：U681695',90,'露營用品',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('N9 LUMENA N9-BK USB紫外光吸入式捕蚊器 深藍','型號：N9-BK',99,'露營用品',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Coghlans #8512 曬衣繩 Laundry Reel','型號：#8512',35,'露營用品',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('MSR Shower Kit 淋浴管','型號：132032',0,'露營用品',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('100mountain 掛物繩帶(附五個4號八字扣) 橘','型號：BG77012O',50,'露營用品',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('KAZMI K9T3C001PK 極簡時尚輕巧折疊椅/露營摺疊椅 珊瑚粉','型號：K9T3C001PK',499,'露營椅',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Renomme 瑞樂美索爾四段式經典低版躺椅/露營摺疊椅 黑 RE91803-BK','型號：RE91803-BK',2500,'露營椅',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Helinox Chair One 超輕量露營椅 紅條紋 Red Stripe','型號：1602000174',3220,'露營椅',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Helinox Chair One 超輕量露營椅 藍條紋 Blue Stripe','型號：1602000175',3220,'露營椅',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('KAVU 時尚輕便保冰袋保鮮袋 人字紋素描 Lunch Box 90171173','型號：90171173',70,'保冷袋',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('MountainSmith Deluxe Cooler Cube 保冰袋 湖水藍','型號：D47506050',710,'保冷袋',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('AO Coolers 保冷托特包 24罐型 叢林冒險 AOMO24','型號：AOMO24',580,'保冷袋',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Snow Peak UG-320BR 保鮮托特包 棕色','型號：UG-320BR',200,'保冷袋',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('MountainSmith Roll Top Cooler Cube 保冰袋 湖水藍','型號：D47508050',350,'保冷袋',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Helinox Tactical Chair Real Tree 輕量戰術露營椅 枯葉迷彩 1603000023','型號：1603000023',3870,'露營椅',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Helinox Chair Zero Grey 超輕量露營椅 灰','型號：1602000078',3310,'露營椅',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Captain Stag 鹿牌 M-6927 抗菌-16℃超凍媒 M','型號：M-6927',90,'冰磚、保冷劑',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Ezetil 890100 軟式保冷劑200g 藍','型號：890100',10,'冰磚、保冷劑',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Captain Stag 鹿牌 M-6929 抗菌-16℃超凍媒 SS','型號：M-6929',90,'冰磚、保冷劑',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Ezetil 890700 軟式保冷劑800g 藍','型號：890700',20,'冰磚、保冷劑',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Ezetil 890200 軟式保冷劑600g 藍','型號：890200',70,'冰磚、保冷劑',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('KAZMI 彩繪民族風迷你舒適折疊椅 藍灰','型號：K8T3C002GR',1200,'露營椅',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('KAZMI 彩繪民族風豪華休閒折疊椅 藍灰 K7T3C003','型號：K7T3C003GR',1680,'露營椅',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('LOGOS #73833342 防砂防水野餐墊 180x125cm 出清特賣','型號：73833342',58,'野餐墊',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Outdoorbase 野舞士高週波壓合防水野營墊/野餐墊 月光藍 300 X 245cm #26800','型號：26800',680,'野餐墊',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Coghlans #1966 Picnic Blanket 輕量野餐墊 紅','型號：#1966',95,'野餐墊',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Outdoorbase 野舞士高週波壓合防水野營墊/野餐墊 野原綠 300 X 300cm #26893','型號：26893',880,'野餐墊',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Outdoorbase 野舞士高週波壓合防水野營墊/野餐墊 月光藍 300 X 300cm #26886','型號：26886',880,'野餐墊',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Coghlans #0809 插電式電動充氣幫浦 110/120V Electric Air Pump','型號：0809',64,'充氣幫浦',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Coghlans #0819 腳踏式充氣幫浦 Bellows Foot Pump','型號：#0819',85,'充氣幫浦',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Coghlans #0824 Double Action Hand Pump 手打充氣幫浦','型號：#0824',90,'充氣幫浦',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Coghlans #0813 充電式電動充氣幫浦 Rechargeable Air Pump','型號：#0813',512,'充氣幫浦',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Coghlans #0815 車充電動充氣幫浦 Electric Air Pump 12V DC','型號：#0815',12,'充氣幫浦',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Snow Peak 折疊椅/露營摺疊椅 寬版灰 LV-077GY','型號：LV-077GY',4800,'露營椅',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('KAZMI 彩繪民族風輕巧折疊椅/露營摺疊椅 酒紅','型號：K8T3C001WI',499,'露營椅',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('LOGOS #73173046 Neos OX防水椅套 藍 出清特賣','型號：73173046',228,'露營椅',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Snow Peak LV-070T 快速竹折桌 -和室桌 S','無型號資料',5670,'露營椅',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('DOPPELGANGER 營舞者 J3-230 魔法冰桶/露營冰桶 13L 紫 六折出清','型號：J3-230',520,'露營冰桶、行動冰箱',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Petromax 冰桶開瓶配件 kx-lock-o','型號：kx-lock-o',10,'露營冰桶、行動冰箱',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('ISUKA 方形保冰袋 L 3415','型號：3415',10,'露營冰桶、行動冰箱',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Dometic WIFI 控溫智慧壓縮機行動冰箱/露營冰箱 CFX40W 40L','型號：CFX-40W',3400,'露營冰桶、行動冰箱',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Reliance Beverage Buddy 旅行水桶 15L BPA Free','型號：9620-13',20,'露營冰桶、行動冰箱',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('N9-FAN PRO USB 充電式手持風扇 雪花白','型號：N9-fan-pro1-white',50,'露營風扇',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('N9-FAN MINI 莎莉 USB 桌上型風扇','型號：N9-FAN MINI LINE',99,'露營風扇',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('N9-FAN STAND3 USB桌上型擺頭隨行風扇-冰雪白','型號：N9-fan-stand3-1308000208',90,'露營風扇',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('N9-FAN MINI 熊大 USB 桌上型風扇','型號：N9-FAN MINI LINE1',99,'露營風扇',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('N9-FAN PRO2 USB 充電式手持風扇 薄荷綠','型號：N9-fan-pro2-Mint',99,'露營風扇',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('BLACK DESIGN 武8 居家風格 鍊沙灰 武椅 Nature Style High Chair','型號：1602000197',5130,'露營椅',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('cAmP33 X 櫸木折疊椅 海軍藍','型號：1602000238',1380,'露營椅',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('cAmP33 手工實木可收納椅 海軍藍 更新版','型號：1602000257',4800,'露營椅',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('KAZMI KZM 印花休閒折疊椅 紅 K20T1C018RD','型號：K20T1C018RD',890,'露營椅',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Sea To Summit 50 D 充氣枕 加大版 萊姆綠 AEROS PREMIUM PILLOW L APILPREMLLI','型號：APILPREMLLI',1240,'充氣枕、頸枕、旅行枕',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('100MOUNTAIN SELF-INFLATING PILLOW 自動充氣枕頭 登山款 藍','型號：PI-105M-BL',300,'充氣枕、頸枕、旅行枕',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Coghlans #8832 吹氣U型枕頭 Head Rest','型號：#8832',135,'充氣枕、頸枕、旅行枕',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Coghlans #9747 枕頭套 Pack Pillow','型號：#9747',387,'充氣枕、頸枕、旅行枕',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Sea To Summit Travelling Light Eye Shades 旅行用眼罩 桃紅/黑','型號：ATLESBE',450,'充氣枕、頸枕、旅行枕',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('KOVEA 威札 吊掛三格櫃-折收','型號：KN8CE0101',780,'露營收納櫃、吊籃',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Snow Peak UG-025G 收納置物箱-25','型號：UG-025G',670,'露營收納櫃、吊籃',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('KOVEA 威札 四格通風網櫃餐廚網','型號：KN8CK0116',240,'露營收納櫃、吊籃',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('KAZMI 四層方形餐廚籃 黑','型號：K3T3K009',90,'露營收納櫃、吊籃',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Coghlans #0233 昆蟲網屋 Mesh Insect House for Kids','型號：#0233',43,'露營收納櫃、吊籃',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('KAZMI 極簡時尚木把手折疊椅/露營折疊椅 灰 K20T1C003GR','型號：K20T1C003GR',2680,'露營椅',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('SOLO STOVE Ranger 不鏽鋼營火爐 (中)','型號：SSRAN',10000,'烤肉架、焚火台',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Snow Peak ST-032MA 焚火台L號細格燒烤網-加強版','型號：ST-032MA',1860,'烤肉架、焚火台',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Petromax Legs For Firebox 不鏽鋼柴爐腳架(大) 一組4入','型號：f-fb2',765,'烤肉架、焚火台',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Snow Peak ST-033BR 焚火台 M套裝攜行袋','型號：ST-033BR',1570,'烤肉架、焚火台',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('LOGOS #81063940 ECO陶瓷超薄節能烤爐 S 出清特賣','型號：81063940',1080,'烤肉架、焚火台',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Ozpig 零件 BBQ 煎盤','型號：00428507',1020,'烤肉架、焚火台',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Ozpig 彎曲煙囪組(三節套裝) Chimney Offset Kit','型號：Chimney Offset Kit',1700,'烤肉架、焚火台',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Ozpig 降溫烤網 Diffusers','型號：Diffusers',510,'烤肉架、焚火台',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Ozpig 料理工具吊架 Tool Rack','型號：Tool Rack',1360,'烤肉架、焚火台',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Snow Peak ST-033GBR 焚火台-M 燒烤框架','型號：ST-033GBR',1620,'烤肉架、焚火台',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Snow Peak SET-112 焚火台L套裝組','型號：SET-112',7900,'烤肉架、焚火台',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Ozpig 延伸腳架(四入) Extension Legs','型號：Extension Legs',1020,'烤肉架、焚火台',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('cAmP33 精靈桌','型號：1602000233',2300,'露營摺疊桌',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('KAZMI KZM IMS 鋼網餐櫥折疊桌含收納袋 K20T3U004','型號：K20T3U004',3980,'露營摺疊桌',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('MORIXON 塊搭多功能系統桌/露營摺疊桌 6片 MT-1A-6','型號：MT-1A-6',3680,'露營摺疊桌',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Helinox 輕量露營桌 狼棕 Table One Coyote Tan 1601000087','型號：1601000087',3510,'露營摺疊桌',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Helinox 輕量戰術桌 灰綠 Tactical Table S Foliage green 1601000080','型號：1601000080',3780,'露營摺疊桌',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Helinox 桌板延伸架 黑色 Table Bridge','型號：1601000038',970,'露營摺疊桌',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('LOGOS #73181504 3FD BBQ圍爐折合桌附燈柱','型號：73181504',5040,'露營摺疊桌',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('GoSport #64361 三層櫥櫃料理桌','型號：64361',1980,'露營摺疊桌',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('探險家 NTW22 摺疊網架 銀','型號：NTW22',600,'露營摺疊桌',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('KAZMI IMS4 頂級輕量桌/露營摺疊桌','型號：K7T3U015',3580,'露營摺疊桌',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Coghlans #527 桌巾夾(6入) Tablecloth Clamps','型號：#527',90,'露營摺疊桌',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('100mountain 休閒椅舒適椅枕 天藍','型號：mt-PI001B',320,'露營椅',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('KOVEA 史迪爾 透氣網花樣折椅/露營摺疊椅 綠','型號：KR8CH0113-G',2160,'露營椅',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Coleman CM-26761 經典木椅 綠松石 65折出清','型號：CM-26761',4030,'露營椅',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Helinox Tactical Cot convertible Tiger Stripe Camo 輕量行軍床 虎紋迷彩','型號：1603000029',3950,'行軍床',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Helinox Tactical Cot convertible 行軍床 黑','型號：1603000011',1520,'行軍床',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('KAZMI 豪華版高承重行軍床 藍灰','型號：K7T3C002',880,'行軍床',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Snow Peak BD-030 折疊式行軍床 Cot High Tension','型號：BD-030',3650,'行軍床',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Helinox Cot One Leg 行軍床配件 高腳架 12隻 黑','型號：1603000015',700,'行軍床',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('GoSport 四腳烤肉架 耐重20 kg 26362','型號：26362',1390,'烤肉架、焚火台',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('SOTO ST-126CS 陶瓷煙燻鍋專用收納袋','型號：ST-126CS',990,'烤肉架、焚火台',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Snow Peak CK-060 IGT不鏽鋼置物盒1/4','型號：CK-060',290,'Snow Peak IGT 廚房系列',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Snow Peak CK-151 IGT 高度調節器','型號：CK-151',610,'Snow Peak IGT 廚房系列',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Snow Peak CK-158T IGT小圓桌','型號：CK-158T',320,'Snow Peak IGT 廚房系列',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Snow Peak CK-175 IGT 框架連接器','型號：CK-175',0,'Snow Peak IGT 廚房系列',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Snow Peak CK-255 IGT吊掛網籃 2單位 淺型','型號：CK-255',450,'Snow Peak IGT 廚房系列',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Work Tuff Stove 直煙囪 350mm WTS-H003','型號：WTS-H003',450,'烤肉架、焚火台',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Snow Peak 單人帳 Minute FAL Pro air.1 SSD-712','型號：SSD-712',23850,'登山用帳篷',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Hilleberg Nallo 4 GT 納洛 紅標 輕量四人帳篷 沙棕 3.6 kg','型號：014513',39800,'登山用帳篷',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Hilleberg 藍標 Rajd 雷德 輕量二人單層帳專用地布','型號：0214661',1400,'登山用帳篷',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('犀牛 U-11 單人全方位超輕帳 1.8kg','型號：U-11',4240,'登山用帳篷',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Hilleberg Kaitum 4 GT 卡頓 紅標 輕量四人帳專用地布','型號：0218761',4900,'登山用帳篷',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('MSR 10365 HUBBA TOUR 3人帳 FL 內帳','型號：10365',5400,'登山用帳篷',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Hilleberg Nallo 3 GT 納洛 紅標 輕量三人帳篷 紅 3.1 kg','型號：013712',35200,'登山用帳篷',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Hilleberg Jannu 亞努 紅標 輕量二人帳篷 沙棕 3.2kg','型號：015013',37800,'登山用帳篷',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Hilleberg Nallo 4 GT 納洛 紅標 輕量四人帳篷 紅 3.6 kg','型號：014512',39800,'登山用帳篷',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Hilleberg Nallo 2 納洛 紅標 輕量二人帳篷 沙棕 2.4 kg','型號：013413',29300,'登山用帳篷',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Hilleberg Nallo 4 納洛 紅標 輕量四人帳篷專用地布','型號：0213461',3800,'登山用帳篷',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Hilleberg Keron 4 GT 科隆 黑標 頂級四人帳篷專用地布','型號：0211961',5100,'登山用帳篷',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Hilleberg Nammatj 3 那瑪特 黑標 頂級三人帳篷 沙棕 3.3 kg','型號：012513',31800,'登山用帳篷',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Zippo 6hr Hand Warmer 暖手爐/懷爐(小) 銀 40451','型號：40451',35,'戶外暖爐',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Kovea Giga Sun KGH-1310 火箭暖爐','型號：KGH-1310',990,'戶外暖爐',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('SNOW PEAK Takudo IGT KH-002BK 連結火爐','型號：KH-002BK',3430,'戶外暖爐',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Coleman 170-9358 不鏽鋼木炭暖爐 L 65折出清','型號：170-9358',70,'戶外暖爐',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Snow Peak KH-001BK Rainbow Stove 彩虹煤油暖爐','型號：KH-001BK',2900,'戶外暖爐',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('MSR 10313 Elixir 4 Backpacking Tent 4人帳 (含地布) 4.26 kg','型號：10313',15120,'登山用帳篷',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('MSR Papa Hubba NX 4人帳','型號：10318',25020,'登山用帳篷',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Hilleberg Niak 尼亞客 黃標 輕量二人帳篷 沙色 1.7kg','型號：18013',28800,'登山用帳篷',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Snow Peak SSD-704 FAL 4 Pro.air 輕量登山四人帳 2.23 Kg','型號：SSD-704',19200,'登山用帳篷',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Snow Peak TM-650-2 雙峰寢室帳-專用2人內帳地墊','型號：TM-650-2',4990,'露營帳篷(露營寢室帳)',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Snow Peak TP-842H HD Tarpector Recta 方形天幕帳L號 基本組 灰色','型號：TP-842H',12690,'露營客廳帳、天幕',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('TiiTENT Tera M 方型天幕 金沙','型號：1004000075',4050,'露營客廳帳、天幕',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Snow Peak TP-925 Mesh shelter 紗網客廳帳','型號：TP-925',23900,'露營客廳帳、天幕',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Snow Peak SSD-730-1 LAGO Pro.air LAGO 單人登山帳專用地布','型號：SSD-730-1',2240,'登山用帳篷',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Hilleberg Keron 4 科隆 黑標 頂級四人帳篷專用地布','型號：0211861',4500,'登山用帳篷',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Kelty 46820719 LATE START 2 輕量二人帳專用地布','型號：46820719',1150,'登山用帳篷',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('TiiTENT 5Tera 棉感四角方型天幕 雪地迷彩(限定) TERSC-500','型號：TERSC-500',21600,'露營客廳帳、天幕',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Snow Peak TP-861H Hexa 蝶形天幕帳M號 基本組 灰色','型號：TP-861H',8900,'露營客廳帳、天幕',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('KAZMI 摩卡獵人隧道帳 TRIBUS K9T3T002','無型號資料',21800,'露營帳篷(露營寢室帳)',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Snow Peak 紗網客廳寢室帳/露營帳篷套裝組 SET-925 Mesh shelter set','型號：SET-925',32000,'露營帳篷(露營寢室帳)',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('[預購] Hilleberg Keron 4 科隆 黑標 頂級四人帳篷 紅 4.7 kg','型號：010112',42000,'露營帳篷(露營寢室帳)',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Snow Peak SDI-101 多功能個人帳 HEXA EASE 1','型號：SDI-101',13090,'露營帳篷(露營寢室帳)',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('KAZMI 摩卡黑森林別墅帳/露營帳篷 K9T3T005 GEOPATH','型號：K9T3T005',29800,'露營帳篷(露營寢室帳)',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('犀牛 A-110 二人掛鉤露營帳篷','型號：A-110',3280,'露營帳篷(露營寢室帳)',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Hilleberg Nammatj 3 GT 那瑪特 黑標 頂級三人帳篷 綠 4.0 kg','型號：012611',37800,'露營帳篷(露營寢室帳)',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Snow Peak TP-450-1 大地帳 Pro.L 內帳地布','型號：TP-450-1',6840,'露營帳篷(露營寢室帳)',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('SNOW PEAK TP-240IR-1 客廳帳 S 地布 LIVING SHELL','型號：TP-240IR-1',1380,'露營帳篷(露營寢室帳)',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('犀牛 A-350 四季用豪華四人露營帳蓬','型號：A-350',3920,'露營帳篷(露營寢室帳)',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Snow Peak SD-506-1 Dock Dome Pro.6 圓弧寢室帳內帳專用地布','型號：SD-506-1',3300,'露營帳篷(露營寢室帳)',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Snow Peak SET-121 Amenity Dome 六人帳篷專用泡棉墊地布組','型號：SET-121',5600,'露營帳篷(露營寢室帳)',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Snow Peak SD-650GS-2 雙峰寢室帳-專用2人內帳地布','型號：SD-650GS-2',2130,'露營帳篷(露營寢室帳)',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Snow Peak TM-650-4 雙峰寢室帳-專用4人內帳地墊','型號：TM-650-4',7360,'露營帳篷(露營寢室帳)',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('TiiTENT 實木燈柱 210cm','型號：TWLS-210',4050,'營柱、營釘、配件',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Snow Peak CM-001LF 雪花個性吊環 LINE聯名款','型號：CM-001LF',570,'營柱、營釘、配件',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('CAMPERSON 33mm 90度 Y叉營柱組合包 紅 CS-10282','型號：CS-10284',2150,'營柱、營釘、配件',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('CAMPERSON NOMADE 螢光三角調節片 N-6780','型號：N-6780',100,'營柱、營釘、配件',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('MSR 3人帳通用地布 寬版 Universal Footprint 13013','型號：13013',1510,'營柱、營釘、配件',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Forest Outdoor 達人營釘營槌收納袋 #1005000252','型號：1005000252',290,'工具箱',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('100mountain 多用途收納盒 棕 mk-box','型號：mk-box-brown',880,'工具箱',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('TOYO Y-12R COBAKO 12cm小箱/工具盒 紅 日本製','型號：Y-12R',765,'工具箱',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('TOYO LY-300 牛皮製工具箱 日本製','型號：LY-300',4680,'工具箱',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('TOYO T-350 提把方型工具箱 粉紅 日本製','型號：T-350P',810,'工具箱',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('TOYO Y-350 提把山型工具箱 36公分 紅','型號：Y-350R',630,'工具箱',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('TOYO ST-350 二段式工具箱 銀','型號：ST-350',2070,'工具箱',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('TOYO PT-360 方型工具箱 藍','型號：PT-360',1080,'工具箱',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('ENO SingleNest Hammock 單人吊床 鴨藍/卡其','型號：SH029',1199,'蚊帳、吊床、ENO',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('ENO SingleNest Hammock 單人吊床 夕陽','型號：SH017',1199,'蚊帳、吊床、ENO',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('ENO Atlas Hammock 吊床繩環 XL','型號：ASX024',1190,'蚊帳、吊床、ENO',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('ENO DoubleNest Hammock 雙人吊床 黃/綠/紅','型號：DH014',1680,'蚊帳、吊床、ENO',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('ENO Sub7 輕量化吊床 橘 超輕185g！','型號：LH093',2380,'蚊帳、吊床、ENO',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('ENO 吊床繩環','型號：AST001',1020,'蚊帳、吊床、ENO',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('ENO Talon Ridgeline 吊床掛物袋','型號：A4301',760,'蚊帳、吊床、ENO',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('ENO SingleNest Hammock 單人吊床 紅底綠黃邊','型號：SH014',1199,'蚊帳、吊床、ENO',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('ENO DoubleNest Hammock 雙人吊床 碳黑/紅','型號：DH004',1680,'蚊帳、吊床、ENO',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('ENO Atlas Hammock 吊床繩環','型號：AST001',1020,'蚊帳、吊床、ENO',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('BNB RACK 熊牌 車頂架專用導流板 850mm、1130mm','型號：AP-3940 / AP-3936',200,'車頂架、置物盤',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('BNB RACK 熊牌 BC-225 車頂單車攜車架(右側)','型號：BC-225-R',600,'車頂架、置物盤',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('BNB RACK 熊牌 BC-219 車頂單車攜車架','型號：BC-219',800,'車頂架、置物盤',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Hilleberg Altai 阿泰 藍標 輕量蒙古包專用地布','型號：023161',8000,'露營客廳帳、天幕',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Snow Peak TP-250R HD 六角蝶形天幕帳','型號：TP-250R',11900,'露營客廳帳、天幕',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Snow Peak TP-350 輕量化蝶形天幕L 基本組 Pro.air','型號：TP-350',15790,'露營客廳帳、天幕',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Snow Peak TM-632 新版LB 2人帳地墊 適用SD-632','型號：TM-632',4870,'露營客廳帳、天幕',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Snow Peak TP-600 Morg 長型客廳帳 Pro.air','型號：TP-600',71250,'露營客廳帳、天幕',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Hilleberg Atlas 亞特拉斯 藍標 輕量基地帳 專用地布','型號：020261',13800,'露營客廳帳、天幕',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Hilleberg Atlas 亞特拉斯 藍標 輕量基地帳 專用延伸前庭 紅','型號：015172A',16200,'露營客廳帳、天幕',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('犀牛 F01 單人輕量外帳/天幕(不選色) 211x297cm','型號：F01',1080,'露營客廳帳、天幕',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('犀牛 F06 六人輕量外帳/天幕(不選色) 360x360cm','型號：F06',1560,'露營客廳帳、天幕',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Hilleberg Atlas 亞特拉斯 藍標 輕量基地帳 專用8人內帳(有底布)','型號：015133A',38000,'露營客廳帳、天幕',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Snow Peak TP-002RD 鋁合金營柱240cm 紅','型號：TP-002RD',2990,'營柱、營釘、配件',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Snow Peak TP-022 鋁合金營柱170cm','型號：TP-022',1030,'營柱、營釘、配件',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('KAZMI 一體成型強化營釘 20cm','型號：K3T3T335',90,'營柱、營釘、配件',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Snow Peak TP-090 Amenity 輕量營柱組','型號：TP-090',2030,'營柱、營釘、配件',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Snow Peak TP-001BK 黑色天幕營柱 280cm','型號：TP-001BK',3290,'營柱、營釘、配件',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('美國UCO STAKELIGHT RGB 露營專用彩色營釘燈-2入','型號：ML-SL2PK-RGB',599,'營柱、營釘、配件',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Hilleberg X-Peg 鋁合金X型營釘10入','型號：0322561',3700,'營柱、營釘、配件',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('嘉隆 TP-138 鋁合金營柱280cm (加強版管徑30mm)','型號：TP-138',800,'營柱、營釘、配件',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('嘉隆 TP-A24 A級伸縮營柱(243CM)','型號：TP-A24',315,'營柱、營釘、配件',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('嘉隆 彈性拉繩 75cm','型號：TP-320',25,'營柱、營釘、配件',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Coghlans #1573 擴張營釘 Expander Pegs 12"','型號：#1573',162,'營柱、營釘、配件',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Coghlans #9050 營繩-6mm 迷彩 Camo Cord','型號：#9050',99,'營柱、營釘、配件',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Coghlans #1365 營繩-5mm Utility Cord','型號：#1365',234,'營柱、營釘、配件',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Coghlans #715 拔釘器 Easy-Pull','型號：#715',81,'營柱、營釘、配件',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Coghlans #1410 發光營釘 LED 10" Nail Peg','型號：#1410',270,'營柱、營釘、配件',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('TOYO Y-12B COBAKO 12cm小箱/工具盒 藍 日本製','型號：Y-12B',765,'工具箱',100,40,'tent_class');
Insert into TENT_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('TOYO Y-17B COBAKO 17cm小箱/工具盒 藍 日本製','型號：Y-17B',945,'工具箱',100,40,'tent_class');
REM INSERTING into WATER_CLASS
SET DEFINE OFF;
Insert into WATER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('speedo 兒童浮力背心 Sea Squad 粉紅-紫','型號：SD8091949214',48,'救生衣、防寒衣、浮標',100,100,'water_class');
Insert into WATER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Green Duck LV-02 救生衣 螢光橘','型號：LV-02R',80,'救生衣、防寒衣、浮標',100,100,'water_class');
Insert into WATER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Atunas #2933 拋繩救生帶','型號：2933',60,'救生衣、防寒衣、浮標',100,100,'water_class');
Insert into WATER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Aropec Continental 長袖長褲連身防寒衣 3/2mm 男 藍','型號：DS-5B119M-BU',400,'救生衣、防寒衣、浮標',100,100,'water_class');
Insert into WATER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Aropec Flog 成人溯溪專用救生衣','型號：VT-808-RD',870,'救生衣、防寒衣、浮標',100,100,'water_class');
Insert into WATER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('100mountain Welding Dry Sacks 高週波視窗型輕量防水壓縮袋 20L 藍 / 綠 / 灰','型號：0181483018-blue',285,'零配件、防水袋',100,100,'water_class');
Insert into WATER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Sea to Summit Ultra-Sil 輕量防水收納袋1入 13L','型號：AUDS13',610,'零配件、防水袋',100,100,'water_class');
Insert into WATER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('100mountain Welding Dry Sacks 高週波視窗型輕量防水壓縮袋 35L 藍 / 綠 / 灰','型號：0181484017-blue',380,'零配件、防水袋',100,100,'water_class');
Insert into WATER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Sea to Summit Ultra-Sil 輕量防水收納袋1入 20L','型號：AUDS20',700,'零配件、防水袋',100,100,'water_class');
Insert into WATER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Coghlans #8416 Water Resistant Pouch 防水袋','型號：#8416',117,'零配件、防水袋',100,100,'water_class');
Insert into WATER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('OverBoard OB1006 Classic 側背防水袋 30L 黃','型號：OB1006Y',720,'零配件、防水袋',100,100,'water_class');
Insert into WATER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('OverBoard OB1007 Classic 側背防水袋 40L 藍','型號：OB1007B',780,'零配件、防水袋',100,100,'water_class');
Insert into WATER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Coghlans #1350 手機防水袋 Load''N Lock 4" x 6"','型號：#1350',450,'零配件、防水袋',100,100,'water_class');
Insert into WATER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('OverBoard OB1005 Classic 側背防水袋 20L 藍','型號：OB1005B',720,'零配件、防水袋',100,100,'water_class');
Insert into WATER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('OverBoard OB1057 Classic 透視型側背防水袋 20L 黃','型號：OB1057Y',900,'零配件、防水袋',100,100,'water_class');
Insert into WATER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('AROPEC 快乾毛巾衣 花色 Poncho-05','型號：Poncho-05',140,'毛巾衣',100,100,'water_class');
Insert into WATER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('AROPEC 快乾毛巾衣 Poncho-04','型號：Poncho-04',140,'毛巾衣',100,100,'water_class');
Insert into WATER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('AROPEC 快乾毛巾衣 Poncho-07-BU','型號：Poncho-07-BU',140,'毛巾衣',100,100,'water_class');
Insert into WATER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Green Duck 防滑溯溪鞋 黑','型號：068001-BLK',50,'面鏡、呼吸管、溯溪鞋',100,100,'water_class');
Insert into WATER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Aropec BT-50BF 防滑溯溪鞋','型號：BT-50BF-BK',0,'面鏡、呼吸管、溯溪鞋',100,100,'water_class');
Insert into WATER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('SABLE GX-100 黑貂 極限運動泳鏡 亮鋁紅','型號：GX-100-C6',100,'面鏡、呼吸管、溯溪鞋',100,100,'water_class');
Insert into WATER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('Speedo 成人進階型泳鏡Futura BioFUSE 透明/透明','型號：8012323518',28,'面鏡、呼吸管、溯溪鞋',100,100,'water_class');
Insert into WATER_CLASS (NAME,TYPE,PRICE,SECOND_CLASS,STOCK,FIRST_CLASS_ID,FIRST_CLASS_NAME) values ('SABLE GX-100 黑貂 極限運動泳鏡 亮鋁灰','型號：GX-100-C2',100,'面鏡、呼吸管、溯溪鞋',100,100,'water_class');
--------------------------------------------------------
--  DDL for Index TENT_CLASS_NAME_STOCK_IDX
--------------------------------------------------------

  CREATE INDEX "TENT_CLASS_NAME_STOCK_IDX" ON "TENT_CLASS" ("NAME", "STOCK") 
  ;
--------------------------------------------------------
--  DDL for Index FIRST_CLASS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "FIRST_CLASS_PK" ON "FIRST_CLASS" ("ID", "NAME") 
  ;
--------------------------------------------------------
--  DDL for Index PERSONAL_CLASS_NAME_STOCK_IDX
--------------------------------------------------------

  CREATE INDEX "PERSONAL_CLASS_NAME_STOCK_IDX" ON "PERSONAL_CLASS" ("NAME", "STOCK") 
  ;
--------------------------------------------------------
--  DDL for Index PROMECH_CLASS_NAME_STOCK_IDX
--------------------------------------------------------

  CREATE INDEX "PROMECH_CLASS_NAME_STOCK_IDX" ON "PROMECH_CLASS" ("NAME", "STOCK") 
  ;
--------------------------------------------------------
--  DDL for Index LIGHT_CLASS_NAME_STOCK_IDX
--------------------------------------------------------

  CREATE INDEX "LIGHT_CLASS_NAME_STOCK_IDX" ON "LIGHT_CLASS" ("NAME", "STOCK") 
  ;
--------------------------------------------------------
--  DDL for Index WATER_CLASS_NAME_STOCK_IDX
--------------------------------------------------------

  CREATE INDEX "WATER_CLASS_NAME_STOCK_IDX" ON "WATER_CLASS" ("NAME", "STOCK") 
  ;
--------------------------------------------------------
--  DDL for Index BACKPACK_CLASS_NAME_STOCK_IDX
--------------------------------------------------------

  CREATE INDEX "BACKPACK_CLASS_NAME_STOCK_IDX" ON "BACKPACK_CLASS" ("NAME", "STOCK") 
  ;
--------------------------------------------------------
--  DDL for Index KITCHEN_CLASS_NAME_STOCK_IDX
--------------------------------------------------------

  CREATE INDEX "KITCHEN_CLASS_NAME_STOCK_IDX" ON "KITCHEN_CLASS" ("NAME", "STOCK") 
  ;
--------------------------------------------------------
--  DDL for Index OTHER_CLASS_NAME_STOCK_IDX
--------------------------------------------------------

  CREATE INDEX "OTHER_CLASS_NAME_STOCK_IDX" ON "OTHER_CLASS" ("NAME", "STOCK") 
  ;
--------------------------------------------------------
--  DDL for Index CLOTH_CLASS__IDX
--------------------------------------------------------

  CREATE INDEX "CLOTH_CLASS__IDX" ON "CLOTH_CLASS" ("NAME", "STOCK") 
  ;
--------------------------------------------------------
--  DDL for Index SHOES_CLASS_NAME_STOCK_IDX
--------------------------------------------------------

  CREATE INDEX "SHOES_CLASS_NAME_STOCK_IDX" ON "SHOES_CLASS" ("NAME", "STOCK") 
  ;
--------------------------------------------------------
--  DDL for Index PROCLIMB_CLASS_NAME_STOCK_IDX
--------------------------------------------------------

  CREATE INDEX "PROCLIMB_CLASS_NAME_STOCK_IDX" ON "PROCLIMB_CLASS" ("NAME", "STOCK") 
  ;
--------------------------------------------------------
--  Constraints for Table WATER_CLASS
--------------------------------------------------------

  ALTER TABLE "WATER_CLASS" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "WATER_CLASS" MODIFY ("FIRST_CLASS_ID" NOT NULL ENABLE);
  ALTER TABLE "WATER_CLASS" MODIFY ("FIRST_CLASS_NAME" NOT NULL ENABLE);
  ALTER TABLE "WATER_CLASS" ADD CONSTRAINT "WATER_CLASS_PK" PRIMARY KEY ("NAME")
  USING INDEX (CREATE INDEX "WATER_CLASS_NAME_STOCK_IDX" ON "WATER_CLASS" ("NAME", "STOCK") 
  )  ENABLE;
--------------------------------------------------------
--  Constraints for Table BACKPACK_CLASS
--------------------------------------------------------

  ALTER TABLE "BACKPACK_CLASS" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "BACKPACK_CLASS" MODIFY ("FIRST_CLASS_ID" NOT NULL ENABLE);
  ALTER TABLE "BACKPACK_CLASS" MODIFY ("FIRST_CLASS_NAME" NOT NULL ENABLE);
  ALTER TABLE "BACKPACK_CLASS" ADD CONSTRAINT "BACKPACK_CLASS_PK" PRIMARY KEY ("NAME")
  USING INDEX (CREATE INDEX "BACKPACK_CLASS_NAME_STOCK_IDX" ON "BACKPACK_CLASS" ("NAME", "STOCK") 
  )  ENABLE;
--------------------------------------------------------
--  Constraints for Table FIRST_CLASS
--------------------------------------------------------

  ALTER TABLE "FIRST_CLASS" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "FIRST_CLASS" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "FIRST_CLASS" ADD CONSTRAINT "FIRST_CLASS_PK" PRIMARY KEY ("ID", "NAME")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table OTHER_CLASS
--------------------------------------------------------

  ALTER TABLE "OTHER_CLASS" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "OTHER_CLASS" MODIFY ("FIRST_CLASS_ID" NOT NULL ENABLE);
  ALTER TABLE "OTHER_CLASS" MODIFY ("FIRST_CLASS_NAME" NOT NULL ENABLE);
  ALTER TABLE "OTHER_CLASS" ADD CONSTRAINT "OTHER_CLASS_PK" PRIMARY KEY ("NAME")
  USING INDEX (CREATE INDEX "OTHER_CLASS_NAME_STOCK_IDX" ON "OTHER_CLASS" ("NAME", "STOCK") 
  )  ENABLE;
--------------------------------------------------------
--  Constraints for Table TENT_CLASS
--------------------------------------------------------

  ALTER TABLE "TENT_CLASS" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "TENT_CLASS" MODIFY ("FIRST_CLASS_ID" NOT NULL ENABLE);
  ALTER TABLE "TENT_CLASS" MODIFY ("FIRST_CLASS_NAME" NOT NULL ENABLE);
  ALTER TABLE "TENT_CLASS" ADD CONSTRAINT "TENT_CLASS_PK" PRIMARY KEY ("NAME")
  USING INDEX (CREATE INDEX "TENT_CLASS_NAME_STOCK_IDX" ON "TENT_CLASS" ("NAME", "STOCK") 
  )  ENABLE;
--------------------------------------------------------
--  Constraints for Table KITCHEN_CLASS
--------------------------------------------------------

  ALTER TABLE "KITCHEN_CLASS" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "KITCHEN_CLASS" MODIFY ("FIRST_CLASS_ID" NOT NULL ENABLE);
  ALTER TABLE "KITCHEN_CLASS" MODIFY ("FIRST_CLASS_NAME" NOT NULL ENABLE);
  ALTER TABLE "KITCHEN_CLASS" ADD CONSTRAINT "KITCHEN_CLASS_PK" PRIMARY KEY ("NAME")
  USING INDEX (CREATE INDEX "KITCHEN_CLASS_NAME_STOCK_IDX" ON "KITCHEN_CLASS" ("NAME", "STOCK") 
  )  ENABLE;
--------------------------------------------------------
--  Constraints for Table SHOES_CLASS
--------------------------------------------------------

  ALTER TABLE "SHOES_CLASS" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "SHOES_CLASS" MODIFY ("FIRST_CLASS_ID" NOT NULL ENABLE);
  ALTER TABLE "SHOES_CLASS" MODIFY ("FIRST_CLASS_NAME" NOT NULL ENABLE);
  ALTER TABLE "SHOES_CLASS" ADD CONSTRAINT "SHOES_CLASS_PK" PRIMARY KEY ("NAME")
  USING INDEX (CREATE INDEX "SHOES_CLASS_NAME_STOCK_IDX" ON "SHOES_CLASS" ("NAME", "STOCK") 
  )  ENABLE;
--------------------------------------------------------
--  Constraints for Table PERSONAL_CLASS
--------------------------------------------------------

  ALTER TABLE "PERSONAL_CLASS" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "PERSONAL_CLASS" MODIFY ("FIRST_CLASS_ID" NOT NULL ENABLE);
  ALTER TABLE "PERSONAL_CLASS" MODIFY ("FIRST_CLASS_NAME" NOT NULL ENABLE);
  ALTER TABLE "PERSONAL_CLASS" ADD CONSTRAINT "PERSONAL_CLASS_PK" PRIMARY KEY ("NAME")
  USING INDEX (CREATE INDEX "PERSONAL_CLASS_NAME_STOCK_IDX" ON "PERSONAL_CLASS" ("NAME", "STOCK") 
  )  ENABLE;
--------------------------------------------------------
--  Constraints for Table PROMECH_CLASS
--------------------------------------------------------

  ALTER TABLE "PROMECH_CLASS" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "PROMECH_CLASS" MODIFY ("FIRST_CLASS_ID" NOT NULL ENABLE);
  ALTER TABLE "PROMECH_CLASS" MODIFY ("FIRST_CLASS_NAME" NOT NULL ENABLE);
  ALTER TABLE "PROMECH_CLASS" ADD CONSTRAINT "PROMECH_CLASS_PK" PRIMARY KEY ("NAME")
  USING INDEX (CREATE INDEX "PROMECH_CLASS_NAME_STOCK_IDX" ON "PROMECH_CLASS" ("NAME", "STOCK") 
  )  ENABLE;
--------------------------------------------------------
--  Constraints for Table LIGHT_CLASS
--------------------------------------------------------

  ALTER TABLE "LIGHT_CLASS" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "LIGHT_CLASS" MODIFY ("FIRST_CLASS_ID" NOT NULL ENABLE);
  ALTER TABLE "LIGHT_CLASS" MODIFY ("FIRST_CLASS_NAME" NOT NULL ENABLE);
  ALTER TABLE "LIGHT_CLASS" ADD CONSTRAINT "LIGHT_CLASS_PK" PRIMARY KEY ("NAME")
  USING INDEX (CREATE INDEX "LIGHT_CLASS_NAME_STOCK_IDX" ON "LIGHT_CLASS" ("NAME", "STOCK") 
  )  ENABLE;
--------------------------------------------------------
--  Constraints for Table CLOTH_CLASS
--------------------------------------------------------

  ALTER TABLE "CLOTH_CLASS" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "CLOTH_CLASS" MODIFY ("FIRST_CLASS_ID" NOT NULL ENABLE);
  ALTER TABLE "CLOTH_CLASS" MODIFY ("FIRST_CLASS_NAME" NOT NULL ENABLE);
  ALTER TABLE "CLOTH_CLASS" ADD CONSTRAINT "CLOTH_CLASS_PK" PRIMARY KEY ("NAME")
  USING INDEX (CREATE INDEX "CLOTH_CLASS__IDX" ON "CLOTH_CLASS" ("NAME", "STOCK") 
  )  ENABLE;
--------------------------------------------------------
--  Constraints for Table PROCLIMB_CLASS
--------------------------------------------------------

  ALTER TABLE "PROCLIMB_CLASS" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "PROCLIMB_CLASS" MODIFY ("FIRST_CLASS_ID" NOT NULL ENABLE);
  ALTER TABLE "PROCLIMB_CLASS" MODIFY ("FIRST_CLASS_NAME" NOT NULL ENABLE);
  ALTER TABLE "PROCLIMB_CLASS" ADD CONSTRAINT "PROCLIMB_CLASS_PK" PRIMARY KEY ("NAME")
  USING INDEX (CREATE INDEX "PROCLIMB_CLASS_NAME_STOCK_IDX" ON "PROCLIMB_CLASS" ("NAME", "STOCK") 
  )  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table BACKPACK_CLASS
--------------------------------------------------------

  ALTER TABLE "BACKPACK_CLASS" ADD CONSTRAINT "BACKPACK_CLASS_FIRST_CLASS_FK" FOREIGN KEY ("FIRST_CLASS_ID", "FIRST_CLASS_NAME")
	  REFERENCES "FIRST_CLASS" ("ID", "NAME") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table CLOTH_CLASS
--------------------------------------------------------

  ALTER TABLE "CLOTH_CLASS" ADD CONSTRAINT "CLOTH_CLASS_FIRST_CLASS_FK" FOREIGN KEY ("FIRST_CLASS_ID", "FIRST_CLASS_NAME")
	  REFERENCES "FIRST_CLASS" ("ID", "NAME") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table KITCHEN_CLASS
--------------------------------------------------------

  ALTER TABLE "KITCHEN_CLASS" ADD CONSTRAINT "KITCHEN_CLASS_FIRST_CLASS_FK" FOREIGN KEY ("FIRST_CLASS_ID", "FIRST_CLASS_NAME")
	  REFERENCES "FIRST_CLASS" ("ID", "NAME") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table LIGHT_CLASS
--------------------------------------------------------

  ALTER TABLE "LIGHT_CLASS" ADD CONSTRAINT "LIGHT_CLASS_FIRST_CLASS_FK" FOREIGN KEY ("FIRST_CLASS_ID", "FIRST_CLASS_NAME")
	  REFERENCES "FIRST_CLASS" ("ID", "NAME") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table OTHER_CLASS
--------------------------------------------------------

  ALTER TABLE "OTHER_CLASS" ADD CONSTRAINT "OTHER_CLASS_FIRST_CLASS_FK" FOREIGN KEY ("FIRST_CLASS_ID", "FIRST_CLASS_NAME")
	  REFERENCES "FIRST_CLASS" ("ID", "NAME") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PERSONAL_CLASS
--------------------------------------------------------

  ALTER TABLE "PERSONAL_CLASS" ADD CONSTRAINT "PERSONAL_CLASS_FIRST_CLASS_FK" FOREIGN KEY ("FIRST_CLASS_ID", "FIRST_CLASS_NAME")
	  REFERENCES "FIRST_CLASS" ("ID", "NAME") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PROCLIMB_CLASS
--------------------------------------------------------

  ALTER TABLE "PROCLIMB_CLASS" ADD CONSTRAINT "PROCLIMB_CLASS_FIRST_CLASS_FK" FOREIGN KEY ("FIRST_CLASS_ID", "FIRST_CLASS_NAME")
	  REFERENCES "FIRST_CLASS" ("ID", "NAME") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PROMECH_CLASS
--------------------------------------------------------

  ALTER TABLE "PROMECH_CLASS" ADD CONSTRAINT "PROMECH_CLASS_FIRST_CLASS_FK" FOREIGN KEY ("FIRST_CLASS_ID", "FIRST_CLASS_NAME")
	  REFERENCES "FIRST_CLASS" ("ID", "NAME") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table SHOES_CLASS
--------------------------------------------------------

  ALTER TABLE "SHOES_CLASS" ADD CONSTRAINT "SHOES_CLASS_FIRST_CLASS_FK" FOREIGN KEY ("FIRST_CLASS_ID", "FIRST_CLASS_NAME")
	  REFERENCES "FIRST_CLASS" ("ID", "NAME") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table TENT_CLASS
--------------------------------------------------------

  ALTER TABLE "TENT_CLASS" ADD CONSTRAINT "TENT_CLASS_FIRST_CLASS_FK" FOREIGN KEY ("FIRST_CLASS_ID", "FIRST_CLASS_NAME")
	  REFERENCES "FIRST_CLASS" ("ID", "NAME") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table WATER_CLASS
--------------------------------------------------------

  ALTER TABLE "WATER_CLASS" ADD CONSTRAINT "WATER_CLASS_FIRST_CLASS_FK" FOREIGN KEY ("FIRST_CLASS_ID", "FIRST_CLASS_NAME")
	  REFERENCES "FIRST_CLASS" ("ID", "NAME") ON DELETE CASCADE ENABLE;
