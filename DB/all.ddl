-- 產生者Oracle SQL Developer Data Modeler 20.2.0.167.1538
-- 於:2020-11-04 14:23:17 TST
-- 位置:Oracle Database 12cR2
-- 類型:Oracle Database 12cR2



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE act_img (
    seqno                 NUMBER(7) NOT NULL,
    img                   CLOB,
    activity_basic_seqno  NUMBER(5) NOT NULL
)
LOGGING;

ALTER TABLE act_img ADD CONSTRAINT act_img_pk PRIMARY KEY ( seqno );

CREATE TABLE activity_basic (
    seqno            NUMBER(5)
        GENERATED BY DEFAULT AS IDENTITY ( START WITH 40000 MINVALUE 40000 MAXVALUE 49999 CACHE 10 ORDER )
    NOT NULL,
    member_basic_id  NUMBER(7) NOT NULL
)
LOGGING;

ALTER TABLE activity_basic ADD CONSTRAINT activity_basic_pk PRIMARY KEY ( seqno );

CREATE TABLE activity_history (
    seqno         NUMBER(7)
        GENERATED BY DEFAULT AS IDENTITY ( START WITH 4000000 MINVALUE 4000000 MAXVALUE 4999999 CYCLE CACHE 10 ORDER )
        CONSTRAINT nnc_activity_basicv1_seqno NOT NULL,
    memeber_id    VARCHAR2(150) NOT NULL,
    route_name    NUMBER(4),
    title         NVARCHAR2(250) NOT NULL,
    price         NUMBER(10) NOT NULL,
    totalday      NVARCHAR2(150) NOT NULL,
    act_other     BLOB,
    reg_final     NUMBER(5) NOT NULL,
    start_date    DATE NOT NULL,
    end_date      DATE NOT NULL,
    reg_end_date  DATE NOT NULL,
    post_date     DATE NOT NULL
)
LOGGING;

ALTER TABLE activity_history ADD CONSTRAINT activity_basicv1_pk PRIMARY KEY ( seqno );

CREATE TABLE activity_info (
    activity_basic_seqno  NUMBER(5) NOT NULL,
    route_basic_id        NUMBER(4) NOT NULL,
    title                 NVARCHAR2(250) NOT NULL,
    price                 NUMBER(5) NOT NULL,
    totalday              NVARCHAR2(150) NOT NULL,
    note                  BLOB,
    reg_now               NUMBER(5) NOT NULL,
    reg_top               NUMBER(5) NOT NULL,
    start_date            DATE NOT NULL,
    end_date              DATE NOT NULL,
    reg_end_date          DATE,
    post_date             DATE
)
LOGGING;

ALTER TABLE activity_info ADD CONSTRAINT activity_info_pk PRIMARY KEY ( activity_basic_seqno );

CREATE TABLE activity_registry (
    seqno                 NUMBER(7)
        GENERATED ALWAYS AS IDENTITY ( START WITH 4000000 MINVALUE 4000000 MAXVALUE 4999999 CYCLE CACHE 10 ORDER )
    NOT NULL,
    activity_basic_seqno  NUMBER(5) NOT NULL,
    member_basic_id       NUMBER(7) NOT NULL,
    reg_date              DATE NOT NULL,
    deniedtag             VARCHAR2(1 CHAR),
    confirm               VARCHAR2(1 CHAR),
    deny_reson            BLOB
)
LOGGING;

ALTER TABLE activity_registry ADD CONSTRAINT activity_registry_pk PRIMARY KEY ( seqno );

CREATE TABLE activity_registry_info (
    seqno                    NUMBER(8)
        GENERATED ALWAYS AS IDENTITY ( START WITH 40000000 MINVALUE 40000000 MAXVALUE 49999999 CYCLE CACHE 10 ORDER )
    NOT NULL,
    activity_registry_seqno  NUMBER(7) NOT NULL,
    name                     NVARCHAR2(1) NOT NULL,
    birthday                 DATE NOT NULL,
    personal_id              VARCHAR2(20) NOT NULL,
    contact_cellphone        VARCHAR2(20) NOT NULL,
    contact_phone            VARCHAR2(50) NOT NULL,
    contact_email            VARCHAR2(100),
    emg_contact_name         NVARCHAR2(150) NOT NULL,
    emg_contact_cellphone    VARCHAR2(20) NOT NULL,
    emg_contact_phone        VARCHAR2(50) NOT NULL
)
LOGGING;

ALTER TABLE activity_registry_info ADD CONSTRAINT activity_registry_info_pk PRIMARY KEY ( seqno );

CREATE TABLE activity_response (
    seqno                 NUMBER(8)
        GENERATED ALWAYS AS IDENTITY ( START WITH 40000000 MINVALUE 40000000 MAXVALUE 49999999 CYCLE CACHE 10 ORDER )
    NOT NULL,
    activity_basic_seqno  NUMBER(5) NOT NULL,
    member_basic_id       NUMBER(7) NOT NULL,
    message               BLOB NOT NULL,
    post_date             DATE NOT NULL,
    privatetag            VARCHAR2(1 CHAR)
)
LOGGING;

ALTER TABLE activity_response ADD CONSTRAINT activity_response_pk PRIMARY KEY ( seqno );

CREATE TABLE activity_sideresp (
    seqno                    NUMBER(8)
        GENERATED ALWAYS AS IDENTITY ( START WITH 40000000 MINVALUE 40000000 MAXVALUE 49999999 CYCLE CACHE 10 ORDER )
    NOT NULL,
    activity_response_seqno  NUMBER(8) NOT NULL,
    member_basic_id          NUMBER(7) NOT NULL,
    message                  BLOB NOT NULL,
    post_date                DATE NOT NULL,
    privatetag               VARCHAR2(1 CHAR)
)
LOGGING;

ALTER TABLE activity_sideresp ADD CONSTRAINT activity_sideresp_pk PRIMARY KEY ( seqno );

CREATE TABLE area (
    name VARCHAR2(50) NOT NULL
)
LOGGING;

ALTER TABLE area ADD CONSTRAINT area_table_pk PRIMARY KEY ( name );

CREATE TABLE camp_baisc (
    id             NUMBER(5)
        GENERATED BY DEFAULT AS IDENTITY ( START WITH 20000 MINVALUE 20000 MAXVALUE 25999 CYCLE CACHE 10 ORDER )
        CONSTRAINT nnc_campv1_id NOT NULL,
    counties_name  VARCHAR2(50) NOT NULL
)
LOGGING;

ALTER TABLE camp_baisc ADD CONSTRAINT campv1_pk PRIMARY KEY ( id );

CREATE TABLE camp_info (
    campbasic_id  NUMBER(5) NOT NULL,
    name          NVARCHAR2(150),
    location      VARCHAR2(50),
    url           BLOB
)
LOGGING;

ALTER TABLE camp_info ADD CONSTRAINT camp_pk PRIMARY KEY ( campbasic_id );

CREATE TABLE counties (
    name       VARCHAR2(50) NOT NULL,
    area_name  VARCHAR2(50) NOT NULL
)
LOGGING;

ALTER TABLE counties ADD CONSTRAINT counties_pk PRIMARY KEY ( name );

CREATE TABLE first_class (
    seqno  NUMBER(3)
        GENERATED ALWAYS AS IDENTITY ( START WITH 600 MINVALUE 600 MAXVALUE 699 NOCACHE ORDER )
    NOT NULL,
    name   VARCHAR2(150)
)
LOGGING;

ALTER TABLE first_class ADD CONSTRAINT first_class_pk PRIMARY KEY ( seqno );

CREATE TABLE house_info (
    house_basic_id       NUMBER(5) NOT NULL,
    name                 NVARCHAR2(150) NOT NULL,
    bed                  NUMBER(3),
    camp                 NUMBER(3),
    "height"             VARCHAR2(50),
    national_park_seqno  NUMBER(3) NOT NULL
)
LOGGING;

ALTER TABLE house_info ADD CONSTRAINT house_info_pk PRIMARY KEY ( house_basic_id );

CREATE TABLE item_basic (
    seqno            NUMBER(7)
        GENERATED ALWAYS AS IDENTITY ( START WITH 6000000 MINVALUE 6000000 MAXVALUE 6199999 CACHE 10 ORDER )
    NOT NULL,
    name             NVARCHAR2(150) NOT NULL,
    second_class_id  NUMBER(4) NOT NULL
)
LOGGING;

ALTER TABLE item_basic ADD CONSTRAINT shopitem_pk PRIMARY KEY ( seqno );

CREATE TABLE item_info (
    item_basic_seqno  NUMBER(7) NOT NULL,
    type              VARCHAR2(100),
    price             NUMBER(7),
    img               CLOB,
    description       BLOB,
    stock             NUMBER(5) NOT NULL
)
LOGGING;

ALTER TABLE item_info ADD CONSTRAINT allitem_pk PRIMARY KEY ( item_basic_seqno );

CREATE TABLE member_basic (
    seqno             NUMBER(7)
        GENERATED ALWAYS AS IDENTITY ( START WITH 1000000 MINVALUE 1000000 MAXVALUE 1999999 CYCLE CACHE 10 ORDER )
    NOT NULL,
    account           VARCHAR2(150) NOT NULL,
    password          VARCHAR2(50) NOT NULL,
    name              NVARCHAR2(150) NOT NULL,
    email             VARCHAR2(150) NOT NULL,
    member_status_id  NUMBER NOT NULL,
    reg_date          DATE NOT NULL
)
LOGGING;

ALTER TABLE member_basic ADD CONSTRAINT memberid_pk PRIMARY KEY ( seqno );

ALTER TABLE member_basic ADD CONSTRAINT member_basic__un_account UNIQUE ( account );

CREATE TABLE member_info (
    member_basic_id  NUMBER(7) NOT NULL,
    birthday         DATE,
    neck_name        NVARCHAR2(50),
    phone            VARCHAR2(15),
    gender           VARCHAR2(30 CHAR),
    climb_ex         VARCHAR2(20),
    per_img          CLOB,
    other            BLOB
)
LOGGING;

ALTER TABLE member_info ADD CONSTRAINT membersummary_pk PRIMARY KEY ( member_basic_id );

CREATE TABLE member_status (
    seqno  NUMBER
        GENERATED ALWAYS AS IDENTITY ( START WITH 100 INCREMENT BY 10 MINVALUE 100 MAXVALUE 190 NOCACHE ORDER )
        CONSTRAINT nnc_memberinfo_status_no NOT NULL,
    name   VARCHAR2(50)
        CONSTRAINT nnc_memberinfo_status_name NOT NULL
)
LOGGING;

CREATE INDEX memberinfo_status_no_idx ON
    member_status (
        seqno
    ASC )
        LOGGING;

CREATE INDEX memberinfo_status_name_idx ON
    member_status (
        name
    ASC )
        LOGGING;

ALTER TABLE member_status ADD CONSTRAINT memberinfo_pk PRIMARY KEY ( seqno );

CREATE TABLE national_park (
    seqno  NUMBER(3)
        GENERATED ALWAYS AS IDENTITY ( START WITH 300 MINVALUE 300 MAXVALUE 399 NOCACHE ORDER )
    NOT NULL,
    name   VARCHAR2(100) NOT NULL
)
LOGGING;

ALTER TABLE national_park ADD CONSTRAINT national_park_pk PRIMARY KEY ( seqno );

CREATE TABLE orderitems (
    seqno             NUMBER(8)
        GENERATED ALWAYS AS IDENTITY ( START WITH 60000000 MINVALUE 60000000 MAXVALUE 69999999 CYCLE CACHE 10 ORDER )
    NOT NULL,
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
    seqno             NUMBER(6)
        GENERATED ALWAYS AS IDENTITY ( START WITH 6200000 MINVALUE 6200000 MAXVALUE 6999999 CYCLE CACHE 10 ORDER )
    NOT NULL,
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
        seqno
    ASC )
        LOGGING;

ALTER TABLE orders ADD CONSTRAINT orders_pk PRIMARY KEY ( seqno );

CREATE TABLE route_basic (
    seqno             NUMBER(4)
        GENERATED BY DEFAULT AS IDENTITY ( START WITH 3000 MINVALUE 3000 MAXVALUE 3999 NOCACHE ORDER )
    NOT NULL,
    national_park_id  NUMBER(3) NOT NULL
)
LOGGING;

ALTER TABLE route_basic ADD CONSTRAINT route_basic_pk PRIMARY KEY ( seqno );

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
    seqno           NUMBER(4)
        GENERATED ALWAYS AS IDENTITY ( START WITH 6000 MINVALUE 6000 MAXVALUE 6999 NOCACHE ORDER )
    NOT NULL,
    name            NVARCHAR2(150),
    first_class_id  NUMBER(3) NOT NULL
)
LOGGING;

ALTER TABLE second_class ADD CONSTRAINT second_class_pk PRIMARY KEY ( seqno );

CREATE TABLE shopping_member_dtail (
    member_basic_id  NUMBER(7) NOT NULL,
    email            VARCHAR2(50),
    phone            VARCHAR2(50),
    address          NVARCHAR2(250)
)
LOGGING;

ALTER TABLE shopping_member_dtail ADD CONSTRAINT shopping_member_dtail_pk PRIMARY KEY ( member_basic_id );

ALTER TABLE act_img
    ADD CONSTRAINT act_img_activity_basic_fk FOREIGN KEY ( activity_basic_seqno )
        REFERENCES activity_basic ( seqno )
            ON DELETE CASCADE
    NOT DEFERRABLE;

ALTER TABLE activity_basic
    ADD CONSTRAINT activity_basic_member_basic_fk FOREIGN KEY ( member_basic_id )
        REFERENCES member_basic ( seqno )
            ON DELETE CASCADE
    NOT DEFERRABLE;

ALTER TABLE activity_info
    ADD CONSTRAINT activity_info_activity_basic_fk FOREIGN KEY ( activity_basic_seqno )
        REFERENCES activity_basic ( seqno )
            ON DELETE CASCADE
    NOT DEFERRABLE;

ALTER TABLE activity_info
    ADD CONSTRAINT activity_info_route_basic_fk FOREIGN KEY ( route_basic_id )
        REFERENCES route_basic ( seqno )
            ON DELETE CASCADE
    NOT DEFERRABLE;

ALTER TABLE activity_registry
    ADD CONSTRAINT activity_registry_activity_basic_fk FOREIGN KEY ( activity_basic_seqno )
        REFERENCES activity_basic ( seqno )
            ON DELETE CASCADE
    NOT DEFERRABLE;

ALTER TABLE activity_registry_info
    ADD CONSTRAINT activity_registry_info_activity_registry_fk FOREIGN KEY ( activity_registry_seqno )
        REFERENCES activity_registry ( seqno )
            ON DELETE CASCADE
    NOT DEFERRABLE;

ALTER TABLE activity_registry
    ADD CONSTRAINT activity_registry_member_basic_fk FOREIGN KEY ( member_basic_id )
        REFERENCES member_basic ( seqno )
            ON DELETE CASCADE
    NOT DEFERRABLE;

ALTER TABLE activity_response
    ADD CONSTRAINT activity_response_activity_basic_fk FOREIGN KEY ( activity_basic_seqno )
        REFERENCES activity_basic ( seqno )
            ON DELETE CASCADE
    NOT DEFERRABLE;

ALTER TABLE activity_response
    ADD CONSTRAINT activity_response_member_basic_fk FOREIGN KEY ( member_basic_id )
        REFERENCES member_basic ( seqno )
            ON DELETE CASCADE
    NOT DEFERRABLE;

ALTER TABLE activity_sideresp
    ADD CONSTRAINT activity_sideresp_activity_response_fk FOREIGN KEY ( activity_response_seqno )
        REFERENCES activity_response ( seqno )
            ON DELETE CASCADE
    NOT DEFERRABLE;

ALTER TABLE activity_sideresp
    ADD CONSTRAINT activity_sideresp_member_basic_fk FOREIGN KEY ( member_basic_id )
        REFERENCES member_basic ( seqno )
            ON DELETE CASCADE
    NOT DEFERRABLE;

ALTER TABLE camp_info
    ADD CONSTRAINT camp_campv1_fk FOREIGN KEY ( campbasic_id )
        REFERENCES camp_baisc ( id )
            ON DELETE CASCADE
    NOT DEFERRABLE;

ALTER TABLE camp_baisc
    ADD CONSTRAINT campv1_counties_fk FOREIGN KEY ( counties_name )
        REFERENCES counties ( name )
            ON DELETE CASCADE
    NOT DEFERRABLE;

ALTER TABLE counties
    ADD CONSTRAINT counties_area_fk FOREIGN KEY ( area_name )
        REFERENCES area ( name )
            ON DELETE CASCADE
    NOT DEFERRABLE;

ALTER TABLE house_info
    ADD CONSTRAINT house_info_national_park_fk FOREIGN KEY ( national_park_seqno )
        REFERENCES national_park ( seqno )
    NOT DEFERRABLE;

ALTER TABLE item_info
    ADD CONSTRAINT item_info_item_basic_fk FOREIGN KEY ( item_basic_seqno )
        REFERENCES item_basic ( seqno )
            ON DELETE CASCADE
    NOT DEFERRABLE;

ALTER TABLE item_basic
    ADD CONSTRAINT itembasic_second_class_fk FOREIGN KEY ( second_class_id )
        REFERENCES second_class ( seqno )
            ON DELETE CASCADE
    NOT DEFERRABLE;

ALTER TABLE member_basic
    ADD CONSTRAINT member_basic_member_status_fk FOREIGN KEY ( member_status_id )
        REFERENCES member_status ( seqno )
    NOT DEFERRABLE;

ALTER TABLE member_info
    ADD CONSTRAINT membersummary_memberbasic_fk FOREIGN KEY ( member_basic_id )
        REFERENCES member_basic ( seqno )
            ON DELETE CASCADE
    NOT DEFERRABLE;

ALTER TABLE orderitems
    ADD CONSTRAINT orderitems_item_basic_fk FOREIGN KEY ( item_basic_seqno )
        REFERENCES item_basic ( seqno )
            ON DELETE CASCADE
    NOT DEFERRABLE;

ALTER TABLE orderitems
    ADD CONSTRAINT orderitems_orders_fk FOREIGN KEY ( orders_orderno )
        REFERENCES orders ( seqno )
            ON DELETE CASCADE
    NOT DEFERRABLE;

ALTER TABLE orders
    ADD CONSTRAINT orders_member_basic_fk FOREIGN KEY ( member_basic_id )
        REFERENCES member_basic ( seqno )
            ON DELETE CASCADE
    NOT DEFERRABLE;

ALTER TABLE route_basic
    ADD CONSTRAINT route_basic_national_park_fk FOREIGN KEY ( national_park_id )
        REFERENCES national_park ( seqno )
            ON DELETE CASCADE
    NOT DEFERRABLE;

ALTER TABLE route_info
    ADD CONSTRAINT route_info_route_basic_fk FOREIGN KEY ( route_basic_id )
        REFERENCES route_basic ( seqno )
            ON DELETE CASCADE
    NOT DEFERRABLE;

ALTER TABLE second_class
    ADD CONSTRAINT second_class_first_class_fk FOREIGN KEY ( first_class_id )
        REFERENCES first_class ( seqno )
            ON DELETE CASCADE
    NOT DEFERRABLE;

ALTER TABLE shopping_member_dtail
    ADD CONSTRAINT shopping_member_dtail_member_basic_fk FOREIGN KEY ( member_basic_id )
        REFERENCES member_basic ( seqno )
            ON DELETE CASCADE
    NOT DEFERRABLE;



-- Oracle SQL Developer Data Modeler 摘要報表:
-- 
-- CREATE TABLE                            26
-- CREATE INDEX                             4
-- ALTER TABLE                             53
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
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
-- CREATE SEQUENCE                          0
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
