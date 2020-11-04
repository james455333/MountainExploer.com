-- 產生者Oracle SQL Developer Data Modeler 20.2.0.167.1538
-- 於:2020-10-12 21:55:23 TST
-- 位置:Oracle Database 12cR2
-- 類型:Oracle Database 12cR2



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE area_table (
    area_name VARCHAR2(25) NOT NULL
)
LOGGING;

ALTER TABLE area_table ADD CONSTRAINT area_table_pk PRIMARY KEY ( area_name );

CREATE TABLE backpack_class (
    name              VARCHAR2(200) NOT NULL,
    type              VARCHAR2(100),
    price             NUMBER(7),
    img_url           BLOB,
    description       BLOB,
    second_class      VARCHAR2(100),
    stock             NUMBER(6),
    first_class_id    NUMBER(3) NOT NULL,
    first_class_name  VARCHAR2(100) NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
    DEFAULT )
NO INMEMORY
    LOB ( img_url ) STORE AS SECUREFILE (
        TABLESPACE users
        STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 BUFFER_POOL DEFAULT )
        CHUNK 8192
        RETENTION
        ENABLE STORAGE IN ROW
        NOCACHE LOGGING
    )
    LOB ( description ) STORE AS SECUREFILE (
        TABLESPACE users
        STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 BUFFER_POOL DEFAULT )
        CHUNK 8192
        RETENTION
        ENABLE STORAGE IN ROW
        NOCACHE LOGGING
    );

CREATE INDEX backpack_class_name_stock_idx ON
    backpack_class (
        name
    ASC,
        stock
    ASC )
        TABLESPACE users PCTFREE 10
            STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT )
        LOGGING;

ALTER TABLE backpack_class
    ADD CONSTRAINT backpack_class_pk PRIMARY KEY ( name )
        USING INDEX backpack_class_name_stock_idx;

CREATE TABLE camp_list (
    counties_counties  VARCHAR2(50) NOT NULL,
    location           VARCHAR2(50),
    name               VARCHAR2(50) NOT NULL,
    description        BLOB
)
LOGGING;

ALTER TABLE camp_list ADD CONSTRAINT camp_list_pk PRIMARY KEY ( name );

CREATE TABLE cloth_class (
    name              VARCHAR2(200) NOT NULL,
    type              VARCHAR2(100 BYTE),
    price             NUMBER(7),
    img_url           BLOB,
    description       BLOB,
    second_class      VARCHAR2(100 BYTE),
    stock             NUMBER(6),
    first_class_id    NUMBER(3) NOT NULL,
    first_class_name  VARCHAR2(100) NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
    DEFAULT )
NO INMEMORY
    LOB ( img_url ) STORE AS SECUREFILE (
        TABLESPACE users
        STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 BUFFER_POOL DEFAULT )
        CHUNK 8192
        RETENTION
        ENABLE STORAGE IN ROW
        NOCACHE LOGGING
    )
    LOB ( description ) STORE AS SECUREFILE (
        TABLESPACE users
        STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 BUFFER_POOL DEFAULT )
        CHUNK 8192
        RETENTION
        ENABLE STORAGE IN ROW
        NOCACHE LOGGING
    );

CREATE INDEX cloth_class__idx ON
    cloth_class (
        name
    ASC,
        stock
    ASC )
        TABLESPACE users PCTFREE 10
            STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT )
        LOGGING;

ALTER TABLE cloth_class
    ADD CONSTRAINT cloth_class_pk PRIMARY KEY ( name )
        USING INDEX cloth_class__idx;

CREATE TABLE counties (
    counties              VARCHAR2(50) NOT NULL,
    area_table_area_name  VARCHAR2(25) NOT NULL
)
LOGGING;

ALTER TABLE counties ADD CONSTRAINT counties_pk PRIMARY KEY ( counties );

CREATE TABLE first_class (
    id    NUMBER(3) NOT NULL,
    name  VARCHAR2(100) NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
    DEFAULT )
NO INMEMORY;

CREATE UNIQUE INDEX demo.first_class_pk ON
    first_class (
        id
    ASC,
        name
    ASC )
        TABLESPACE users PCTFREE 10
            STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT )
        LOGGING;

ALTER TABLE first_class
    ADD CONSTRAINT first_class_pk PRIMARY KEY ( id,
                                                name )
        USING INDEX demo.first_class_pk;

CREATE TABLE kitchen_class (
    name              VARCHAR2(200) NOT NULL,
    type              VARCHAR2(100),
    price             NUMBER(7),
    img_url           BLOB,
    description       BLOB,
    second_class      VARCHAR2(100),
    stock             NUMBER(6),
    first_class_id    NUMBER(3) NOT NULL,
    first_class_name  VARCHAR2(100) NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
    DEFAULT )
NO INMEMORY
    LOB ( img_url ) STORE AS SECUREFILE (
        TABLESPACE users
        STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 BUFFER_POOL DEFAULT )
        CHUNK 8192
        RETENTION
        ENABLE STORAGE IN ROW
        NOCACHE LOGGING
    )
    LOB ( description ) STORE AS SECUREFILE (
        TABLESPACE users
        STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 BUFFER_POOL DEFAULT )
        CHUNK 8192
        RETENTION
        ENABLE STORAGE IN ROW
        NOCACHE LOGGING
    );

CREATE INDEX kitchen_class_name_stock_idx ON
    kitchen_class (
        name
    ASC,
        stock
    ASC )
        TABLESPACE users PCTFREE 10
            STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT )
        LOGGING;

ALTER TABLE kitchen_class
    ADD CONSTRAINT kitchen_class_pk PRIMARY KEY ( name )
        USING INDEX kitchen_class_name_stock_idx;

CREATE TABLE light_class (
    name              VARCHAR2(200) NOT NULL,
    type              VARCHAR2(100),
    price             NUMBER(7),
    img_url           BLOB,
    description       BLOB,
    second_class      VARCHAR2(100),
    stock             NUMBER(6),
    first_class_id    NUMBER(3) NOT NULL,
    first_class_name  VARCHAR2(100) NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
    DEFAULT )
NO INMEMORY
    LOB ( img_url ) STORE AS SECUREFILE (
        TABLESPACE users
        STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 BUFFER_POOL DEFAULT )
        CHUNK 8192
        RETENTION
        ENABLE STORAGE IN ROW
        NOCACHE LOGGING
    )
    LOB ( description ) STORE AS SECUREFILE (
        TABLESPACE users
        STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 BUFFER_POOL DEFAULT )
        CHUNK 8192
        RETENTION
        ENABLE STORAGE IN ROW
        NOCACHE LOGGING
    );

CREATE INDEX light_class_name_stock_idx ON
    light_class (
        name
    ASC,
        stock
    ASC )
        TABLESPACE users PCTFREE 10
            STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT )
        LOGGING;

ALTER TABLE light_class
    ADD CONSTRAINT light_class_pk PRIMARY KEY ( name )
        USING INDEX light_class_name_stock_idx;

CREATE TABLE memberinfo (
    status_no    NCHAR(3)
        CONSTRAINT nnc_memberinfo_status_no NOT NULL,
    status_name  VARCHAR2(10)
        CONSTRAINT nnc_memberinfo_status_name NOT NULL
)
LOGGING;

CREATE INDEX memberinfo_status_no_idx ON
    memberinfo (
        status_no
    ASC )
        LOGGING;

CREATE INDEX memberinfo_status_name_idx ON
    memberinfo (
        status_name
    ASC )
        LOGGING;

ALTER TABLE memberinfo ADD CONSTRAINT memberinfo_pk PRIMARY KEY ( status_no,
                                                                  status_name );

CREATE TABLE membersummary (
    member_id               VARCHAR2(150) NOT NULL,
    account                 VARCHAR2(10) NOT NULL,
    password                VARCHAR2(20) NOT NULL,
    email                   VARCHAR2(50) NOT NULL,
    first_name              VARCHAR2(10) NOT NULL,
    last_name               VARCHAR2(10) NOT NULL,
    phone                   VARCHAR2(15),
    gender                  VARCHAR2(2),
    climb_ex                VARCHAR2(20),
    per_img                 CLOB,
    memberinfo_status_no    NCHAR(3) NOT NULL,
    memberinfo_status_name  VARCHAR2(20) NOT NULL
)
LOGGING;

ALTER TABLE membersummary ADD CHECK ( member_id IN ( 'varchar' ) );

-- Error while generating DDL for memberSummary. See log file for details.

ALTER TABLE membersummary ADD CONSTRAINT membersummary_pk PRIMARY KEY ( member_id );

ALTER TABLE membersummary ADD CONSTRAINT membersummary__un_account UNIQUE ( account );

ALTER TABLE membersummary ADD CONSTRAINT membersummary__un_email UNIQUE ( email );

CREATE TABLE mountain_house (
    national_park_name  VARCHAR2(100) NOT NULL,
    house_contain       NUMBER(3),
    camp_contain        NUMBER(3),
    " altitude"         VARCHAR2(10) NOT NULL,
    CHECK ( " altitude" IS NOT NULL )
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
NO INMEMORY;

CREATE UNIQUE INDEX demo.mountain_house_pk ON
    mountain_house (
        national_park_name
    ASC )
        TABLESPACE users PCTFREE 10
            STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
        LOGGING;

ALTER TABLE mountain_house
    ADD CONSTRAINT mountain_house_pk PRIMARY KEY ( national_park_name )
        USING INDEX demo.mountain_house_pk;

CREATE TABLE national_park (
    name VARCHAR2(100) NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
    DEFAULT )
NO INMEMORY;

CREATE UNIQUE INDEX demo.national_park_pk ON
    national_park (
        name
    ASC )
        TABLESPACE users PCTFREE 10
            STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT )
        LOGGING;

ALTER TABLE national_park
    ADD CONSTRAINT national_park_pk PRIMARY KEY ( name )
        USING INDEX demo.national_park_pk;

CREATE TABLE other_class (
    name              VARCHAR2(200) NOT NULL,
    type              VARCHAR2(100),
    price             NUMBER(7),
    img_url           BLOB,
    description       BLOB,
    second_class      VARCHAR2(100),
    stock             NUMBER(6),
    first_class_id    NUMBER(3) NOT NULL,
    first_class_name  VARCHAR2(100) NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
    DEFAULT )
NO INMEMORY
    LOB ( img_url ) STORE AS SECUREFILE (
        TABLESPACE users
        STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 BUFFER_POOL DEFAULT )
        CHUNK 8192
        RETENTION
        ENABLE STORAGE IN ROW
        NOCACHE LOGGING
    )
    LOB ( description ) STORE AS SECUREFILE (
        TABLESPACE users
        STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 BUFFER_POOL DEFAULT )
        CHUNK 8192
        RETENTION
        ENABLE STORAGE IN ROW
        NOCACHE LOGGING
    );

CREATE INDEX other_class_name_stock_idx ON
    other_class (
        name
    ASC,
        stock
    ASC )
        TABLESPACE users PCTFREE 10
            STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT )
        LOGGING;

ALTER TABLE other_class
    ADD CONSTRAINT other_class_pk PRIMARY KEY ( name )
        USING INDEX other_class_name_stock_idx;

CREATE TABLE personal_class (
    name              VARCHAR2(200) NOT NULL,
    type              VARCHAR2(100),
    price             NUMBER(7),
    img_url           BLOB,
    description       BLOB,
    second_class      VARCHAR2(100),
    stock             NUMBER(6),
    first_class_id    NUMBER(3) NOT NULL,
    first_class_name  VARCHAR2(100) NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
    DEFAULT )
NO INMEMORY
    LOB ( img_url ) STORE AS SECUREFILE (
        TABLESPACE users
        STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 BUFFER_POOL DEFAULT )
        CHUNK 8192
        RETENTION
        ENABLE STORAGE IN ROW
        NOCACHE LOGGING
    )
    LOB ( description ) STORE AS SECUREFILE (
        TABLESPACE users
        STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 BUFFER_POOL DEFAULT )
        CHUNK 8192
        RETENTION
        ENABLE STORAGE IN ROW
        NOCACHE LOGGING
    );

CREATE INDEX personal_class_name_stock_idx ON
    personal_class (
        name
    ASC,
        stock
    ASC )
        TABLESPACE users PCTFREE 10
            STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT )
        LOGGING;

ALTER TABLE personal_class
    ADD CONSTRAINT personal_class_pk PRIMARY KEY ( name )
        USING INDEX personal_class_name_stock_idx;

CREATE TABLE proclimb_class (
    name              VARCHAR2(200) NOT NULL,
    type              VARCHAR2(100),
    price             NUMBER(7),
    img_url           BLOB,
    description       BLOB,
    second_class      VARCHAR2(100),
    stock             NUMBER(6),
    first_class_id    NUMBER(3) NOT NULL,
    first_class_name  VARCHAR2(100) NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
    DEFAULT )
NO INMEMORY
    LOB ( img_url ) STORE AS SECUREFILE (
        TABLESPACE users
        STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 BUFFER_POOL DEFAULT )
        CHUNK 8192
        RETENTION
        ENABLE STORAGE IN ROW
        NOCACHE LOGGING
    )
    LOB ( description ) STORE AS SECUREFILE (
        TABLESPACE users
        STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 BUFFER_POOL DEFAULT )
        CHUNK 8192
        RETENTION
        ENABLE STORAGE IN ROW
        NOCACHE LOGGING
    );

CREATE INDEX proclimb_class_name_stock_idx ON
    proclimb_class (
        name
    ASC,
        stock
    ASC )
        TABLESPACE users PCTFREE 10
            STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT )
        LOGGING;

ALTER TABLE proclimb_class
    ADD CONSTRAINT proclimb_class_pk PRIMARY KEY ( name )
        USING INDEX proclimb_class_name_stock_idx;

CREATE TABLE promech_class (
    name              VARCHAR2(200) NOT NULL,
    type              VARCHAR2(100),
    price             NUMBER(7),
    img_url           BLOB,
    description       BLOB,
    second_class      VARCHAR2(100),
    stock             NUMBER(6),
    first_class_id    NUMBER(3) NOT NULL,
    first_class_name  VARCHAR2(100) NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
    DEFAULT )
NO INMEMORY
    LOB ( img_url ) STORE AS SECUREFILE (
        TABLESPACE users
        STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 BUFFER_POOL DEFAULT )
        CHUNK 8192
        RETENTION
        ENABLE STORAGE IN ROW
        NOCACHE LOGGING
    )
    LOB ( description ) STORE AS SECUREFILE (
        TABLESPACE users
        STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 BUFFER_POOL DEFAULT )
        CHUNK 8192
        RETENTION
        ENABLE STORAGE IN ROW
        NOCACHE LOGGING
    );

CREATE INDEX promech_class_name_stock_idx ON
    promech_class (
        name
    ASC,
        stock
    ASC )
        TABLESPACE users PCTFREE 10
            STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT )
        LOGGING;

ALTER TABLE promech_class
    ADD CONSTRAINT promech_class_pk PRIMARY KEY ( name )
        USING INDEX promech_class_name_stock_idx;

CREATE TABLE route_summary (
    name                VARCHAR2(150) NOT NULL,
    description         BLOB,
    advice              BLOB,
    traffic             BLOB,
    national_park_name  VARCHAR2(100) NOT NULL,
    img_url             BLOB
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
    DEFAULT )
NO INMEMORY
    LOB ( description ) STORE AS SECUREFILE (
        TABLESPACE users
        STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 BUFFER_POOL DEFAULT )
        CHUNK 8192
        RETENTION
        ENABLE STORAGE IN ROW
        NOCACHE LOGGING
    )
    LOB ( advice ) STORE AS SECUREFILE (
        TABLESPACE users
        STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 BUFFER_POOL DEFAULT )
        CHUNK 8192
        RETENTION
        ENABLE STORAGE IN ROW
        NOCACHE LOGGING
    )
    LOB ( traffic ) STORE AS SECUREFILE (
        TABLESPACE users
        STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 BUFFER_POOL DEFAULT )
        CHUNK 8192
        RETENTION
        ENABLE STORAGE IN ROW
        NOCACHE LOGGING
    )
    LOB ( img_url ) STORE AS SECUREFILE (
        TABLESPACE users
        STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 BUFFER_POOL DEFAULT )
        CHUNK 8192
        RETENTION
        ENABLE STORAGE IN ROW
        NOCACHE LOGGING
    );

CREATE UNIQUE INDEX demo.route_summary_pk ON
    route_summary (
        name
    ASC )
        TABLESPACE users PCTFREE 10
            STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT )
        LOGGING;

ALTER TABLE route_summary
    ADD CONSTRAINT route_summary_pk PRIMARY KEY ( name )
        USING INDEX demo.route_summary_pk;

CREATE TABLE shoes_class (
    name              VARCHAR2(200) NOT NULL,
    type              VARCHAR2(100),
    price             NUMBER(7),
    img_url           BLOB,
    description       BLOB,
    second_class      VARCHAR2(100),
    stock             NUMBER(6),
    first_class_id    NUMBER(3) NOT NULL,
    first_class_name  VARCHAR2(100) NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
    DEFAULT )
NO INMEMORY
    LOB ( img_url ) STORE AS SECUREFILE (
        TABLESPACE users
        STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 BUFFER_POOL DEFAULT )
        CHUNK 8192
        RETENTION
        ENABLE STORAGE IN ROW
        NOCACHE LOGGING
    )
    LOB ( description ) STORE AS SECUREFILE (
        TABLESPACE users
        STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 BUFFER_POOL DEFAULT )
        CHUNK 8192
        RETENTION
        ENABLE STORAGE IN ROW
        NOCACHE LOGGING
    );

CREATE INDEX shoes_class_name_stock_idx ON
    shoes_class (
        name
    ASC,
        stock
    ASC )
        TABLESPACE users PCTFREE 10
            STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT )
        LOGGING;

ALTER TABLE shoes_class
    ADD CONSTRAINT shoes_class_pk PRIMARY KEY ( name )
        USING INDEX shoes_class_name_stock_idx;

CREATE TABLE tent_class (
    name              VARCHAR2(200) NOT NULL,
    type              VARCHAR2(100),
    price             NUMBER(7),
    img_url           BLOB,
    description       BLOB,
    second_class      VARCHAR2(100),
    stock             NUMBER(6),
    first_class_id    NUMBER(3) NOT NULL,
    first_class_name  VARCHAR2(100) NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
    DEFAULT )
NO INMEMORY
    LOB ( img_url ) STORE AS SECUREFILE (
        TABLESPACE users
        STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 BUFFER_POOL DEFAULT )
        CHUNK 8192
        RETENTION
        ENABLE STORAGE IN ROW
        NOCACHE LOGGING
    )
    LOB ( description ) STORE AS SECUREFILE (
        TABLESPACE users
        STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 BUFFER_POOL DEFAULT )
        CHUNK 8192
        RETENTION
        ENABLE STORAGE IN ROW
        NOCACHE LOGGING
    );

CREATE INDEX tent_class_name_stock_idx ON
    tent_class (
        name
    ASC,
        stock
    ASC )
        TABLESPACE users PCTFREE 10
            STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT )
        LOGGING;

ALTER TABLE tent_class
    ADD CONSTRAINT tent_class_pk PRIMARY KEY ( name )
        USING INDEX tent_class_name_stock_idx;

CREATE TABLE water_class (
    name              VARCHAR2(200) NOT NULL,
    type              VARCHAR2(100),
    price             NUMBER(7),
    img_url           BLOB,
    description       BLOB,
    second_class      VARCHAR2(100),
    stock             NUMBER(6),
    first_class_id    NUMBER(3) NOT NULL,
    first_class_name  VARCHAR2(100) NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
    DEFAULT )
NO INMEMORY
    LOB ( img_url ) STORE AS SECUREFILE (
        TABLESPACE users
        STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 BUFFER_POOL DEFAULT )
        CHUNK 8192
        RETENTION
        ENABLE STORAGE IN ROW
        NOCACHE LOGGING
    )
    LOB ( description ) STORE AS SECUREFILE (
        TABLESPACE users
        STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 BUFFER_POOL DEFAULT )
        CHUNK 8192
        RETENTION
        ENABLE STORAGE IN ROW
        NOCACHE LOGGING
    );

CREATE INDEX water_class_name_stock_idx ON
    water_class (
        name
    ASC,
        stock
    ASC )
        TABLESPACE users PCTFREE 10
            STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT )
        LOGGING;

ALTER TABLE water_class
    ADD CONSTRAINT water_class_pk PRIMARY KEY ( name )
        USING INDEX water_class_name_stock_idx;

CREATE TABLE weather_forecast_monthly (
    area_name  VARCHAR2(25) NOT NULL,
    datrep     DATE
)
LOGGING;

CREATE TABLE weather_forecast_week (
    counties  VARCHAR2(50) NOT NULL,
    daterep   DATE NOT NULL
)
LOGGING;

ALTER TABLE weather_forecast_week ADD CONSTRAINT weather_pk PRIMARY KEY ( daterep );

ALTER TABLE backpack_class
    ADD CONSTRAINT backpack_class_first_class_fk FOREIGN KEY ( first_class_id,
                                                               first_class_name )
        REFERENCES first_class ( id,
                                 name )
            ON DELETE CASCADE
    NOT DEFERRABLE;

ALTER TABLE camp_list
    ADD CONSTRAINT camp_list_counties_fk FOREIGN KEY ( counties_counties )
        REFERENCES counties ( counties )
            ON DELETE CASCADE
    NOT DEFERRABLE;

ALTER TABLE cloth_class
    ADD CONSTRAINT cloth_class_first_class_fk FOREIGN KEY ( first_class_id,
                                                            first_class_name )
        REFERENCES first_class ( id,
                                 name )
            ON DELETE CASCADE
    NOT DEFERRABLE;

ALTER TABLE counties
    ADD CONSTRAINT counties_area_table_fk FOREIGN KEY ( area_table_area_name )
        REFERENCES area_table ( area_name )
            ON DELETE CASCADE
    NOT DEFERRABLE;

ALTER TABLE kitchen_class
    ADD CONSTRAINT kitchen_class_first_class_fk FOREIGN KEY ( first_class_id,
                                                              first_class_name )
        REFERENCES first_class ( id,
                                 name )
            ON DELETE CASCADE
    NOT DEFERRABLE;

ALTER TABLE light_class
    ADD CONSTRAINT light_class_first_class_fk FOREIGN KEY ( first_class_id,
                                                            first_class_name )
        REFERENCES first_class ( id,
                                 name )
            ON DELETE CASCADE
    NOT DEFERRABLE;

ALTER TABLE membersummary
    ADD CONSTRAINT membersummary_memberinfo_fk FOREIGN KEY ( memberinfo_status_no,
                                                             memberinfo_status_name )
        REFERENCES memberinfo ( status_no,
                                status_name )
            ON DELETE CASCADE
    NOT DEFERRABLE;

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE mountain_house
    ADD CONSTRAINT mountain_house_national_park_fk FOREIGN KEY ( national_park_name )
        REFERENCES national_park ( name )
            ON DELETE CASCADE
    NOT DEFERRABLE;

ALTER TABLE other_class
    ADD CONSTRAINT other_class_first_class_fk FOREIGN KEY ( first_class_id,
                                                            first_class_name )
        REFERENCES first_class ( id,
                                 name )
            ON DELETE CASCADE
    NOT DEFERRABLE;

ALTER TABLE personal_class
    ADD CONSTRAINT personal_class_first_class_fk FOREIGN KEY ( first_class_id,
                                                               first_class_name )
        REFERENCES first_class ( id,
                                 name )
            ON DELETE CASCADE
    NOT DEFERRABLE;

ALTER TABLE proclimb_class
    ADD CONSTRAINT proclimb_class_first_class_fk FOREIGN KEY ( first_class_id,
                                                               first_class_name )
        REFERENCES first_class ( id,
                                 name )
            ON DELETE CASCADE
    NOT DEFERRABLE;

ALTER TABLE promech_class
    ADD CONSTRAINT promech_class_first_class_fk FOREIGN KEY ( first_class_id,
                                                              first_class_name )
        REFERENCES first_class ( id,
                                 name )
            ON DELETE CASCADE
    NOT DEFERRABLE;

ALTER TABLE route_summary
    ADD CONSTRAINT route_summary_national_park_fk FOREIGN KEY ( national_park_name )
        REFERENCES national_park ( name )
            ON DELETE CASCADE
    NOT DEFERRABLE;

ALTER TABLE shoes_class
    ADD CONSTRAINT shoes_class_first_class_fk FOREIGN KEY ( first_class_id,
                                                            first_class_name )
        REFERENCES first_class ( id,
                                 name )
            ON DELETE CASCADE
    NOT DEFERRABLE;

ALTER TABLE tent_class
    ADD CONSTRAINT tent_class_first_class_fk FOREIGN KEY ( first_class_id,
                                                           first_class_name )
        REFERENCES first_class ( id,
                                 name )
            ON DELETE CASCADE
    NOT DEFERRABLE;

ALTER TABLE water_class
    ADD CONSTRAINT water_class_first_class_fk FOREIGN KEY ( first_class_id,
                                                            first_class_name )
        REFERENCES first_class ( id,
                                 name )
            ON DELETE CASCADE
    NOT DEFERRABLE;

ALTER TABLE weather_forecast_monthly
    ADD CONSTRAINT weather_forecast_fk FOREIGN KEY ( area_name )
        REFERENCES area_table ( area_name )
            ON DELETE CASCADE
    NOT DEFERRABLE;

ALTER TABLE weather_forecast_week
    ADD CONSTRAINT weather_forecast_week_fk FOREIGN KEY ( counties )
        REFERENCES counties ( counties )
            ON DELETE CASCADE
    NOT DEFERRABLE;



-- Oracle SQL Developer Data Modeler 摘要報表:
-- 
-- CREATE TABLE                            22
-- CREATE INDEX                            17
-- ALTER TABLE                             42
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
-- ERRORS                                   2
-- WARNINGS                                 0
