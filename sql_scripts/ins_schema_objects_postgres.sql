
---------------------------------------------------------------------
--                CREATE INS SCHEME                                --
---------------------------------------------------------------------


CREATE SCHEMA IF NOT EXISTS ins;

---------------------------------------------------------------------
--                DROP OBJECTS                                     --
---------------------------------------------------------------------

drop trigger IF EXISTS insuranceproduct_insert on ins.insuranceproduct;

alter table  IF EXISTS ins.category
   drop constraint IF EXISTS category_pk CASCADE;

drop table IF EXISTS ins.category;

alter table  IF EXISTS ins.expression
   drop constraint IF EXISTS expression_pk CASCADE;

drop view IF EXISTS ins.vexpression;

drop table IF EXISTS ins.expression;

alter table  IF EXISTS ins.insuranceproduct
   drop constraint akinsuranceproduct_insuranceid;

alter table  IF EXISTS ins.insuranceproduct
   drop constraint IF EXISTS insuranceproduct_pk CASCADE;

drop table IF EXISTS ins.insuranceproduct;

alter table  IF EXISTS ins.productexpression
   drop constraint IF EXISTS productexpression_pk CASCADE;

drop table IF EXISTS ins.productexpression;

alter table  IF EXISTS ins.schedule
   drop constraint IF EXISTS schedule_pk CASCADE;

drop table IF EXISTS ins.schedule;

alter table  IF EXISTS ins.template
   drop constraint IF EXISTS template_pk CASCADE ;

drop table IF EXISTS ins.template;

---------------------------------------------------------------------
--                CREATE OBJECTS                                   --
---------------------------------------------------------------------
  
create table ins.category (
   categoryid           serial not null,
   categoryname         varchar(100)         not null,
   categorydescription  varchar(200)         null,
   isactive             bool                 not null,
   createddate          timestamp without time zone not null,
   createdby            int4                 not null,
   lastupdateddate      timestamp without time zone not null,
   lastupdatedby        int4                 not null
);

alter table  IF EXISTS ins.category
   add constraint category_pk primary key (categoryid);

create table ins.expression (
   expressionid         serial not null,
   internalexpressionname varchar(255)       not null,
   expressiondescription varchar(200)        null,
   expressionxml        xml                  not null,
   vendorid             int4                 not null,
   scheduleid           int4                 null,
   isactive             bool                 not null,
   createddate          timestamp without time zone not null,
   createdby            int4                 not null,
   lastupdateddate      timestamp without time zone not null,
   lastupdatedby        int4                 not null
);

alter table  IF EXISTS ins.expression
   add constraint expression_pk primary key (expressionid);
    
create table ins.insuranceproduct (
   insuranceproductid   serial not null,
   insuranceid          int4                 not null,
   insurancevendorid    int4                 not null,
   categoryid           int4                 not null,
   templateid           int4                 not null,
   siteid               int4                 not null,
   lineofbusinessid     int2                 not null,
   productname          varchar(100)         not null,
   productdescription   varchar(200)         null,
   isactive             bool                 not null,
   createddate          timestamp without time zone not null,
   createdby            int4                 not null,
   lastupdateddate      timestamp without time zone not null,
   lastupdateby         int4                 not null
);


alter table  IF EXISTS ins.insuranceproduct
   add constraint insuranceproduct_pk primary key (insuranceproductid);

alter table  IF EXISTS ins.insuranceproduct
   add constraint akinsuranceproduct_insuranceid unique (insuranceid, siteid);
 
create table ins.productexpression (
   productexpressionid  serial not null,
   expressionid         int4                 not null,
   insuranceproductid   int4                 not null,
   productexpressionname varchar(255)         not null,
   expressiontype       int2                 not null,
   effectivedate        timestamp without time zone not null,
   terminationdate      timestamp without time zone null,
   createddate          timestamp without time zone not null,
   createdby            int4                 not null,
   lastupdateddate      timestamp without time zone not null,
   lastupdatedby        int4                 not null
);


alter table  IF EXISTS ins.productexpression
   add constraint productexpression_pk primary key (productexpressionid);

create  index ix_productexpression_expressionidproductid on ins.productexpression (
expressionid,
insuranceproductid
);

create  index ix_productexpression_productidexpressionid on ins.productexpression (
insuranceproductid,
expressionid
);


create table ins.schedule (
   scheduleid           serial not null,
   insurancevendorid    int4                 not null,
   schedulename         varchar(40)          not null,
   axiscount            int2                 not null,
   schedulexml          xml                  not null,
   effectivedate        timestamp without time zone not null,
   terminationdate      timestamp without time zone null,
   createddate          timestamp without time zone not null,
   createdby            int4                 not null,
   lastupdateddate      timestamp without time zone not null,
   lastupdatedby        int4                 not null
);

alter table  IF EXISTS ins.schedule
   add constraint schedule_pk primary key (scheduleid);

create table ins.template (
   templateid           serial not null,
   templatename         varchar(100)         not null,
   insurancevendorid    int4                 not null,
   viewreference        varchar(200)         not null,
   isactive             bool                 not null,
   createddate          timestamp without time zone not null,
   createdby            int4                 not null,
   lastupdateddate      timestamp without time zone not null,
   lastupdatedby        int4                 not null
);

alter table  IF EXISTS ins.template
   add constraint template_pk primary key (templateid);

---------------------------------------------------------------------
--                ALTER OBJECTS                                    --
---------------------------------------------------------------------

alter table  IF EXISTS ins.expression
   add constraint expression_schedule_fk1 foreign key (scheduleid)
      references ins.schedule (scheduleid);

alter table  IF EXISTS ins.insuranceproduct
   add constraint insuranceproduct_category_fk1 foreign key (categoryid)
      references ins.category (categoryid);

alter table  IF EXISTS ins.insuranceproduct
   add constraint insuranceproduct_template_fk1 foreign key (templateid)
      references ins.template (templateid);
	  
alter table  IF EXISTS ins.productexpression
   add constraint productexpression_expression_fk1 foreign key (expressionid)
      references ins.expression (expressionid);
	  
alter table  IF EXISTS ins.productexpression
   add constraint productexpression_insuranceproduct_fk1 foreign key (insuranceproductid)
      references ins.insuranceproduct (insuranceproductid);
	  
alter sequence IF EXISTS ins.category_categoryid_seq INCREMENT by 1 MINVALUE 0 ;

alter sequence IF EXISTS ins.expression_expressionid_seq INCREMENT by 1 MINVALUE 0 ;

alter sequence IF EXISTS ins.insuranceproduct_insuranceproductid_seq INCREMENT by 1 MINVALUE 0 ;

alter sequence IF EXISTS ins.productexpression_productexpressionid_seq INCREMENT by 1 MINVALUE 0 ;

alter sequence IF EXISTS ins.schedule_scheduleid_seq INCREMENT by 1 MINVALUE 0 ;

alter sequence IF EXISTS ins.template_templateid_seq INCREMENT by 1 MINVALUE 0 ; 



---------------------------------------------------------------------
--               CREATE VIEW                                       --
---------------------------------------------------------------------  

CREATE VIEW ins.vexpression AS 
   SELECT expressionid
         ,internalexpressionname
         ,vendorid
         ,scheduleid
    FROM ins.expression
    WHERE isactive = TRUE ;