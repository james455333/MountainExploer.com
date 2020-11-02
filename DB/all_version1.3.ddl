-- 產生者Oracle SQL Developer Data Modeler 20.2.0.167.1538
-- 於:2020-10-19 18:11:32 TST
-- 位置:Oracle Database 12cR2
-- 類型:Oracle Database 12cR2



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE SEQUENCE seq_act_history START WITH 4000000 MAXVALUE 4999999 MINVALUE 4000000 NOCACHE ORDER;

CREATE SEQUENCE seq_act_reg START WITH 4000000 MAXVALUE 4999999 MINVALUE 4000000 CYCLE NOCACHE ORDER;

CREATE SEQUENCE seq_act_resp START WITH 40000000 MAXVALUE 49999999 MINVALUE 40000000 NOCACHE ORDER;

CREATE SEQUENCE seq_activity START WITH 40000 MAXVALUE 49999 MINVALUE 40000 NOCACHE ORDER;

CREATE SEQUENCE seq_area START WITH 100 MAXVALUE 199 MINVALUE 1 NOCACHE ORDER;

CREATE SEQUENCE seq_camp START WITH 21000 MAXVALUE 25999 MINVALUE 21000 NOCACHE ORDER;

CREATE SEQUENCE seq_county START WITH 2000 MAXVALUE 2999 MINVALUE 2000 NOCACHE ORDER;

CREATE SEQUENCE seq_firstclass START WITH 600 MAXVALUE 699 MINVALUE 600 NOCACHE ORDER;

CREATE SEQUENCE seq_house START WITH 26000 MAXVALUE 29999 MINVALUE 26000 NOCACHE ORDER;

CREATE SEQUENCE seq_memberid START WITH 1000000 MAXVALUE 9999999 MINVALUE 1 NOCACHE ORDER;

CREATE SEQUENCE seq_memberstatus START WITH 100 INCREMENT BY 10 MAXVALUE 190 MINVALUE 10 NOCACHE ORDER;

CREATE SEQUENCE seq_np START WITH 300 MAXVALUE 399 MINVALUE 300 NOCACHE ORDER;

CREATE SEQUENCE seq_order START WITH 6200000 MAXVALUE 6999999 MINVALUE 6200000 CYCLE NOCACHE ORDER;

CREATE SEQUENCE seq_orderitems START WITH 6000000 MAXVALUE 6999999 MINVALUE 6000000 CYCLE NOCACHE ORDER;

CREATE SEQUENCE seq_route START WITH 3000 MAXVALUE 3999 MINVALUE 3000 NOCACHE ORDER;

CREATE SEQUENCE seq_second START WITH 6000 MAXVALUE 6999 MINVALUE 6000 NOCACHE ORDER;

CREATE SEQUENCE seq_shopitem START WITH 600000 MAXVALUE 619999 MINVALUE 600000 NOCACHE ORDER;

CREATE SEQUENCE seq_side_resp START WITH 40000000 MAXVALUE 49999999 MINVALUE 40000000 NOCACHE ORDER;

CREATE TABLE activity_basic (
    seqno            NUMBER(5) NOT NULL,
    member_basic_id  NUMBER(7) NOT NULL,
    route_basic_id   NUMBER NOT NULL,
    title            NVARCHAR2(250) NOT NULL,
    price            NUMBER(10) NOT NULL,
    totalday         NVARCHAR2(150) NOT NULL,
    act_other        BLOB,
    reg_now          NUMBER(5),
    reg_top          NUMBER(5),
    start_date       DATE NOT NULL,
    end_date         DATE NOT NULL,
    reg_end_date     DATE NOT NULL,
    post_date        DATE NOT NULL
)
LOGGING;

ALTER TABLE activity_basic ADD CONSTRAINT activity_basic_pk PRIMARY KEY ( seqno );

CREATE TABLE activity_history (
    seqno         NUMBER(7)
        CONSTRAINT nnc_activity_basicv1_seqno NOT NULL,
    route_name    NUMBER(4),
    title         NVARCHAR2(250) NOT NULL,
    price         NUMBER(10) NOT NULL,
    totalday      NVARCHAR2(150),
    act_other     BLOB,
    reg_now       NUMBER(5),
    reg_top       NUMBER(5),
    start_date    DATE NOT NULL,
    end_date      DATE NOT NULL,
    reg_end_date  DATE NOT NULL,
    post_date     DATE NOT NULL
)
LOGGING;

ALTER TABLE activity_history ADD CONSTRAINT activity_basicv1_pk PRIMARY KEY ( seqno );

CREATE TABLE activity_registry (
    seqno                 NUMBER(7) NOT NULL,
    activity_basic_seqno  NUMBER(5) NOT NULL,
    member_basic_id       NUMBER(7) NOT NULL,
    reg_date              DATE NOT NULL,
    deniedtag             VARCHAR2(1 CHAR)
)
LOGGING;

ALTER TABLE activity_registry ADD CONSTRAINT activity_registry_pk PRIMARY KEY ( seqno );

CREATE TABLE activity_response (
    seqno                 NUMBER(8) NOT NULL,
    activity_basic_seqno  NUMBER(5) NOT NULL,
    member_basic_id       NUMBER(7) NOT NULL,
    message               BLOB NOT NULL,
    post_date             DATE NOT NULL,
    privatetag            VARCHAR2(1 CHAR)
)
LOGGING;

ALTER TABLE activity_response ADD CONSTRAINT activity_response_pk PRIMARY KEY ( seqno );

CREATE TABLE activity_sideresp (
    seqno                    NUMBER(8) NOT NULL,
    activity_response_seqno  NUMBER(8) NOT NULL,
    member_basic_id          NUMBER(7) NOT NULL,
    post_date                DATE NOT NULL,
    message                  BLOB NOT NULL,
    privatetag               VARCHAR2(1 CHAR)
)
LOGGING;

ALTER TABLE activity_sideresp ADD CONSTRAINT activity_sideresp_pk PRIMARY KEY ( seqno );

CREATE TABLE area (
    id    NUMBER(3) NOT NULL,
    name  VARCHAR2(50) NOT NULL
)
LOGGING;

ALTER TABLE area ADD CONSTRAINT area_table_pk PRIMARY KEY ( id );

CREATE TABLE camp_baisc (
    id           NUMBER(5)
        CONSTRAINT nnc_campv1_id NOT NULL,
    counties_id  NUMBER(4) NOT NULL
)
LOGGING;

ALTER TABLE camp_baisc ADD CONSTRAINT campv1_pk PRIMARY KEY ( id );

CREATE TABLE camp_info (
    campbasic_id  NUMBER(5) NOT NULL,
    name          NVARCHAR2(150),
    location      VARCHAR2(50),
    description   BLOB
)
LOGGING;

ALTER TABLE camp_info ADD CONSTRAINT camp_pk PRIMARY KEY ( campbasic_id );

CREATE TABLE counties (
    id       NUMBER(4) NOT NULL,
    area_id  NUMBER(3) NOT NULL,
    name     VARCHAR2(50) NOT NULL
)
LOGGING;

ALTER TABLE counties ADD CONSTRAINT counties_pk PRIMARY KEY ( id );

CREATE TABLE first_class (
    id    NUMBER(3) NOT NULL,
    name  VARCHAR2(150)
)
LOGGING;

ALTER TABLE first_class ADD CONSTRAINT first_class_pk PRIMARY KEY ( id );

CREATE TABLE house_basic (
    id                NUMBER(5) NOT NULL,
    national_park_id  NUMBER(3) NOT NULL
)
LOGGING;

ALTER TABLE house_basic ADD CONSTRAINT house_basic_pk PRIMARY KEY ( id );

CREATE TABLE house_info (
    house_basic_id  NUMBER(5) NOT NULL,
    name            NVARCHAR2(150) NOT NULL,
    bed             NUMBER(3),
    camp            NUMBER(3),
    "height"        VARCHAR2(50)
)
LOGGING;

ALTER TABLE house_info ADD CONSTRAINT house_info_pk PRIMARY KEY ( house_basic_id );

CREATE TABLE item_basic (
    seqno            NUMBER(6) NOT NULL,
    name             NVARCHAR2(150) NOT NULL,
    sotck            NUMBER(5) NOT NULL,
    second_class_id  NUMBER(4) NOT NULL,
    first_class_id   NUMBER(3) NOT NULL
)
LOGGING;

CREATE INDEX itembasic__idxv1 ON
    item_basic (
        seqno
    ASC,
        sotck
    ASC )
        LOGGING;

ALTER TABLE item_basic ADD CONSTRAINT shopitem_pk PRIMARY KEY ( seqno );

CREATE TABLE item_info (
    item_basic_seqno  NUMBER(6) NOT NULL,
    type              VARCHAR2(100),
    price             NUMBER(7),
    img_url           BLOB,
    description       BLOB
)
LOGGING;

ALTER TABLE item_info ADD CONSTRAINT allitem_pk PRIMARY KEY ( item_basic_seqno );

CREATE TABLE member_basic (
    id               NUMBER(7) NOT NULL,
    account          VARCHAR2(150),
    name             NVARCHAR2(150),
    email            VARCHAR2(150),
    memberstatus_id  NCHAR(3) NOT NULL
)
LOGGING;

ALTER TABLE member_basic ADD CONSTRAINT memberid_pk PRIMARY KEY ( id );

CREATE TABLE member_info (
    memberbasic_id  NUMBER(7) NOT NULL,
    birthday        DATE,
    neck_name       NVARCHAR2(50),
    first_name      VARCHAR2(10) NOT NULL,
    last_name       VARCHAR2(10) NOT NULL,
    phone           VARCHAR2(15),
    gender          VARCHAR2(2),
    climb_ex        VARCHAR2(20),
    per_img         CLOB,
    other           BLOB
)
LOGGING;

ALTER TABLE member_info ADD CONSTRAINT membersummary_pk PRIMARY KEY ( memberbasic_id );

CREATE TABLE member_privacy (
    memberbasic_id  NUMBER(7) NOT NULL,
    password        VARCHAR2(100) NOT NULL
)
LOGGING;

ALTER TABLE member_privacy ADD CONSTRAINT memberpwd_pk PRIMARY KEY ( memberbasic_id );

CREATE TABLE member_status (
    id    NCHAR(3)
        CONSTRAINT nnc_memberinfo_status_no NOT NULL,
    name  VARCHAR2(50)
        CONSTRAINT nnc_memberinfo_status_name NOT NULL
)
LOGGING;

CREATE INDEX memberinfo_status_no_idx ON
    member_status (
        id
    ASC )
        LOGGING;

CREATE INDEX memberinfo_status_name_idx ON
    member_status (
        name
    ASC )
        LOGGING;

ALTER TABLE member_status ADD CONSTRAINT memberinfo_pk PRIMARY KEY ( id );

CREATE TABLE national_park (
    id    NUMBER(3) NOT NULL,
    name  VARCHAR2(100) NOT NULL
)
LOGGING;

ALTER TABLE national_park ADD CONSTRAINT national_park_pk PRIMARY KEY ( id );

CREATE TABLE orderitems (
    seqno             NUMBER(7) NOT NULL,
    orders_orderno    NUMBER(6) NOT NULL,
    item_basic_seqno  NUMBER(6) NOT NULL,
    amount            NUMBER(*, 0),
    unitprice         NUMBER(18, 1),
    discount          NUMBER
)
LOGGING;

CREATE UNIQUE INDEX orderitems_pk ON
    orderitems (
        seqno
    ASC )
        LOGGING;

ALTER TABLE orderitems ADD CONSTRAINT orderitems_pk PRIMARY KEY ( seqno );

CREATE TABLE orders (
    orderno           NUMBER(6) NOT NULL,
    member_basic_id   NUMBER(7) NOT NULL,
    item_basic_seqno  NUMBER(6) NOT NULL,
    totalamount       NUMBER(11, 1),
    shippingaddress   NVARCHAR2(250),
    invoicetitle      VARCHAR2(72),
    orderdate         DATE,
    shippingdate      DATE,
    canceltag         VARCHAR2(1 CHAR)
)
LOGGING;

CREATE UNIQUE INDEX orders_pk ON
    orders (
        orderno
    ASC )
        LOGGING;

ALTER TABLE orders ADD CONSTRAINT orders_pk PRIMARY KEY ( orderno );

CREATE TABLE route_basic (
    id                NUMBER(4) NOT NULL,
    national_park_id  NUMBER(3) NOT NULL
)
LOGGING;

ALTER TABLE route_basic ADD CONSTRAINT route_basic_pk PRIMARY KEY ( id );

CREATE TABLE route_info (
    route_basic_id  NUMBER(4) NOT NULL,
    name            NVARCHAR2(150) NOT NULL,
    description     BLOB,
    advice          BLOB,
    traffic         BLOB,
    img_url         BLOB
)
LOGGING;

ALTER TABLE route_info ADD CONSTRAINT routeinfo_pk PRIMARY KEY ( route_basic_id );

CREATE TABLE second_class (
    id              NUMBER(4) NOT NULL,
    name            NVARCHAR2(150),
    first_class_id  NUMBER(3) NOT NULL
)
LOGGING;

ALTER TABLE second_class ADD CONSTRAINT second_class_pk PRIMARY KEY ( id );

ALTER TABLE activity_basic
    ADD CONSTRAINT activity_basic_member_basic_fk FOREIGN KEY ( member_basic_id )
        REFERENCES member_basic ( id )
            ON DELETE CASCADE
    NOT DEFERRABLE;

ALTER TABLE activity_registry
    ADD CONSTRAINT activity_registry_activity_basic_fk FOREIGN KEY ( activity_basic_seqno )
        REFERENCES activity_basic ( seqno )
            ON DELETE CASCADE
    NOT DEFERRABLE;

ALTER TABLE activity_registry
    ADD CONSTRAINT activity_registry_member_basic_fk FOREIGN KEY ( member_basic_id )
        REFERENCES member_basic ( id )
            ON DELETE CASCADE
    NOT DEFERRABLE;

ALTER TABLE activity_response
    ADD CONSTRAINT activity_response_activity_basic_fk FOREIGN KEY ( activity_basic_seqno )
        REFERENCES activity_basic ( seqno )
            ON DELETE CASCADE
    NOT DEFERRABLE;

ALTER TABLE activity_response
    ADD CONSTRAINT activity_response_member_basic_fk FOREIGN KEY ( member_basic_id )
        REFERENCES member_basic ( id )
            ON DELETE CASCADE
    NOT DEFERRABLE;

ALTER TABLE activity_sideresp
    ADD CONSTRAINT activity_sideresp_activity_response_fk FOREIGN KEY ( activity_response_seqno )
        REFERENCES activity_response ( seqno )
            ON DELETE CASCADE
    NOT DEFERRABLE;

ALTER TABLE activity_sideresp
    ADD CONSTRAINT activity_sideresp_member_basic_fk FOREIGN KEY ( member_basic_id )
        REFERENCES member_basic ( id )
            ON DELETE CASCADE
    NOT DEFERRABLE;

ALTER TABLE camp_info
    ADD CONSTRAINT camp_campv1_fk FOREIGN KEY ( campbasic_id )
        REFERENCES camp_baisc ( id )
            ON DELETE CASCADE
    NOT DEFERRABLE;

ALTER TABLE camp_baisc
    ADD CONSTRAINT campv1_counties_fk FOREIGN KEY ( counties_id )
        REFERENCES counties ( id )
            ON DELETE CASCADE
    NOT DEFERRABLE;

ALTER TABLE counties
    ADD CONSTRAINT counties_area_fk FOREIGN KEY ( area_id )
        REFERENCES area ( id )
            ON DELETE CASCADE
    NOT DEFERRABLE;

ALTER TABLE house_basic
    ADD CONSTRAINT house_basic_national_park_fk FOREIGN KEY ( national_park_id )
        REFERENCES national_park ( id )
    NOT DEFERRABLE;

ALTER TABLE house_info
    ADD CONSTRAINT house_info_house_basic_fk FOREIGN KEY ( house_basic_id )
        REFERENCES house_basic ( id )
            ON DELETE CASCADE
    NOT DEFERRABLE;

ALTER TABLE item_info
    ADD CONSTRAINT item_info_item_basic_fk FOREIGN KEY ( item_basic_seqno )
        REFERENCES item_basic ( seqno )
            ON DELETE CASCADE
    NOT DEFERRABLE;

ALTER TABLE item_basic
    ADD CONSTRAINT itembasic_first_class_fk FOREIGN KEY ( first_class_id )
        REFERENCES first_class ( id )
    NOT DEFERRABLE;

ALTER TABLE item_basic
    ADD CONSTRAINT itembasic_second_class_fk FOREIGN KEY ( second_class_id )
        REFERENCES second_class ( id )
            ON DELETE CASCADE
    NOT DEFERRABLE;

ALTER TABLE member_basic
    ADD CONSTRAINT memberbasic_memberstatus_fk FOREIGN KEY ( memberstatus_id )
        REFERENCES member_status ( id )
            ON DELETE CASCADE
    NOT DEFERRABLE;

ALTER TABLE member_privacy
    ADD CONSTRAINT memberpwd_memberbasic_fk FOREIGN KEY ( memberbasic_id )
        REFERENCES member_basic ( id )
    NOT DEFERRABLE;

ALTER TABLE member_info
    ADD CONSTRAINT membersummary_memberbasic_fk FOREIGN KEY ( memberbasic_id )
        REFERENCES member_basic ( id )
            ON DELETE CASCADE
    NOT DEFERRABLE;

ALTER TABLE orderitems
    ADD CONSTRAINT orderitems_item_basic_fk FOREIGN KEY ( item_basic_seqno )
        REFERENCES item_basic ( seqno )
            ON DELETE CASCADE
    NOT DEFERRABLE;

ALTER TABLE orderitems
    ADD CONSTRAINT orderitems_orders_fk FOREIGN KEY ( orders_orderno )
        REFERENCES orders ( orderno )
            ON DELETE CASCADE
    NOT DEFERRABLE;

ALTER TABLE orders
    ADD CONSTRAINT orders_item_basic_fk FOREIGN KEY ( item_basic_seqno )
        REFERENCES item_basic ( seqno )
            ON DELETE CASCADE
    NOT DEFERRABLE;

ALTER TABLE orders
    ADD CONSTRAINT orders_member_basic_fk FOREIGN KEY ( member_basic_id )
        REFERENCES member_basic ( id )
            ON DELETE CASCADE
    NOT DEFERRABLE;

ALTER TABLE route_basic
    ADD CONSTRAINT route_basic_national_park_fk FOREIGN KEY ( national_park_id )
        REFERENCES national_park ( id )
    NOT DEFERRABLE;

ALTER TABLE route_info
    ADD CONSTRAINT route_info_route_basic_fk FOREIGN KEY ( route_basic_id )
        REFERENCES route_basic ( id )
    NOT DEFERRABLE;

ALTER TABLE second_class
    ADD CONSTRAINT second_class_first_class_fk FOREIGN KEY ( first_class_id )
        REFERENCES first_class ( id )
            ON DELETE CASCADE
    NOT DEFERRABLE;

CREATE OR REPLACE TRIGGER tri_act_history 
    BEFORE INSERT ON activity_history 
    FOR EACH ROW 
BEGIN
    :new.seqno := seq_act_history.nextval;
END; 
/

CREATE OR REPLACE TRIGGER tri_act_reg 
    BEFORE INSERT ON activity_registry 
    FOR EACH ROW 
BEGIN
    :new.seqno := seq_act_reg.nextval;
END; 
/

CREATE OR REPLACE TRIGGER tri_act_resp 
    BEFORE INSERT ON activity_response 
    FOR EACH ROW 
BEGIN
    :new.seqno := seq_act_resp.nextval;
END; 
/

CREATE OR REPLACE TRIGGER tri_activity 
    BEFORE INSERT ON activity_basic 
    FOR EACH ROW 
BEGIN
    :new.seqno := seq_activity.nextval;
END; 
/

CREATE OR REPLACE TRIGGER tri_area 
    BEFORE INSERT ON area 
    FOR EACH ROW 
BEGIN
    :new.id := seq_area.nextval;
END; 
/

CREATE OR REPLACE TRIGGER tri_camp 
    BEFORE INSERT ON camp_baisc 
    FOR EACH ROW 
BEGIN
    :new.id := seq_camp.nextval;
END; 
/

CREATE OR REPLACE TRIGGER tri_county 
    BEFORE INSERT ON counties 
    FOR EACH ROW 
BEGIN
    :new.id := seq_county.nextval;
END; 
/

CREATE OR REPLACE TRIGGER tri_firstclass 
    BEFORE INSERT ON first_class 
    FOR EACH ROW 
BEGIN
    :new.id := seq_firstclass.nextval;
END; 
/

CREATE OR REPLACE TRIGGER tri_memberid 
    BEFORE INSERT ON member_basic 
    FOR EACH ROW 
BEGIN
    :new.id := seq_memberid.nextval;
END; 
/

CREATE OR REPLACE TRIGGER tri_memberstatus 
    BEFORE INSERT ON member_status 
    FOR EACH ROW 
BEGIN
    :new.id := seq_memberstatus.nextval;
END; 
/

CREATE OR REPLACE TRIGGER tri_np 
    BEFORE INSERT ON national_park 
    FOR EACH ROW 
BEGIN
    :new.id := seq_np.nextval;
END; 
/

CREATE OR REPLACE TRIGGER tri_order 
    BEFORE INSERT ON orders 
    FOR EACH ROW 
BEGIN
    :new.orderno := seq_order.nextval;
END; 
/

CREATE OR REPLACE TRIGGER tri_orderitems 
    BEFORE INSERT ON orderitems 
    FOR EACH ROW 
BEGIN
    :new.seqno := seq_orderitems.nextval;
END; 
/

CREATE OR REPLACE TRIGGER tri_route 
    BEFORE INSERT ON route_basic 
    FOR EACH ROW 
BEGIN
    :new.id := seq_route.nextval;
END; 
/

CREATE OR REPLACE TRIGGER tri_second 
    BEFORE INSERT ON second_class 
    FOR EACH ROW 
BEGIN
    :new.id := seq_second.nextval;
END; 
/

CREATE OR REPLACE TRIGGER tri_shopitem 
    BEFORE INSERT ON item_basic 
    FOR EACH ROW 
BEGIN
    :new.seqno := seq_shopitem.nextval;
END; 
/

CREATE OR REPLACE TRIGGER tri_side_resp 
    BEFORE INSERT ON activity_sideresp 
    FOR EACH ROW 
BEGIN
    :new.seqno := seq_side_resp.nextval;
END; 
/

CREATE OR REPLACE TRIGGER tri_house BEFORE
    INSERT ON house_basic
    FOR EACH ROW
    WHEN ( new.id IS NULL )
BEGIN
    :new.id := seq_house.nextval;
END;
/



-- Oracle SQL Developer Data Modeler 摘要報表:
-- 
-- CREATE TABLE                            24
-- CREATE INDEX                             5
-- ALTER TABLE                             49
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                          18
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                         18
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
