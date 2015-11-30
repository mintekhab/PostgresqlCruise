-----------------------------------------------------------------------------------
--                CREATE dbo SCHEME                                              --
-----------------------------------------------------------------------------------

CREATE SCHEMA IF NOT EXISTS dbo;

-----------------------------------------------------------------------------------
-- Drop 
-----------------------------------------------------------------------------------

drop index IF EXISTS dbo.ix_eventlog_errorlogidtimestamp
;
drop index IF EXISTS dbo.ix_eventlog_eventtypeid
;
alter table IF EXISTS dbo.eventlog
   drop constraint IF EXISTS eventlog_pk  CASCADE
;
drop table IF EXISTS dbo.eventlog
;
alter table IF EXISTS dbo.errorlog
   drop constraint IF EXISTS errorlog_pk  CASCADE
;
drop table IF EXISTS dbo.errorlog
;
alter table IF EXISTS dbo.eventtype
   drop constraint eventtype_pk CASCADE
;
drop table IF EXISTS dbo.eventtype
;
-----------------------------------------------------------------------------------
-- CREATE LOG TABLES 
-----------------------------------------------------------------------------------
CREATE TABLE dbo.eventtype
(
  eventtypeid                    integer NOT NULL,
  eventtype                      varchar(50),
  winapplog                      boolean NOT NULL DEFAULT true,
  winapploglevel                 smallint,
  typedescription                varchar(1024),
  firstcreated                   timestamp without time zone,
  createdby                      varchar(40),
  lastupdated                    timestamp without time zone,
  updatedby                      varchar(40)
)
;
ALTER TABLE dbo.eventtype
  OWNER TO reconsandbox
;
alter table IF EXISTS dbo.eventtype
   add constraint eventtype_pk primary key (eventtypeid)
;

create table dbo.errorlog
(
  errorlogid                      serial  NOT NULL,
  _timestamp                      timestamp without time zone NOT NULL,
  message                         varchar(2048) NOT NULL,
  _number                         integer NOT NULL,
  severity                        integer NOT NULL,
  state                           integer,
  dbversion                       varchar(50) NOT NULL,
  errorprocedure                  varchar(128),
  input                           varchar(600),
  step                            varchar(128),
  line                            integer,
  errraised                       bool NOT NULL DEFAULT true,
  resolved                        bool NOT NULL DEFAULT true,
  comment                         varchar(300),
  createdby                       varchar(40),
  lastupdated                     timestamp without time zone,
  updatedby                       varchar(40)
)
;
ALTER TABLE dbo.errorlog
  OWNER TO reconsandbox
;
alter table IF EXISTS dbo.errorlog
   add constraint errorlog_pk primary key (errorlogid, _timestamp)
;

CREATE TABLE dbo.eventlog
(
  eventlogid                     serial NOT NULL,
  eventtimestamp                 timestamp without time zone NOT NULL,
  eventtypeid                    integer,
  errorlogid                     integer,
  _timestamp                     timestamp without time zone,
  dbversion                      varchar(50) NOT NULL,
  eventprocedure                 varchar(128),
  input                          varchar(600),
  message                        text,
  eventxml                       text,
  reviewed                       boolean NOT NULL DEFAULT true,
  winapplogged                   boolean NOT NULL DEFAULT true,
  comment                        varchar(300),
  createdby                      varchar(40),
  lastupdated                    timestamp without time zone,
  updatedby                      varchar(40)
)
;
alter table IF EXISTS dbo.eventlog
   add constraint eventlog_pk primary key (
   eventlogid, 
   eventtimestamp
)
;
create index ix_eventlog_eventtypeid on dbo.eventlog (
    eventtypeid
)
;
create index ix_eventlog_errorlogidtimestamp on dbo.eventlog (
	errorlogid ,
	_timestamp
)
;
ALTER TABLE dbo.eventlog
  OWNER TO reconsandbox;

-----------------------------------------------------------------------------------
--  ALTER 
-----------------------------------------------------------------------------------
alter table IF EXISTS dbo.eventtype
  alter column eventtypeid SET DEFAULT 0
;
alter table IF EXISTS dbo.errorlog
  alter column _timestamp SET DEFAULT now()
;
alter table IF EXISTS dbo.errorlog
  alter column message SET DEFAULT ' '
;
alter table IF EXISTS dbo.errorlog
  alter column dbversion SET DEFAULT ' '
;
alter table IF EXISTS dbo.errorlog
  alter column _number SET DEFAULT 0
;
alter table IF EXISTS dbo.errorlog
  alter column severity SET DEFAULT 0
;
alter table IF EXISTS dbo.eventlog
  alter column EventTimeStamp SET DEFAULT now()
;
alter table IF EXISTS dbo.eventlog
  alter column eventtypeid SET DEFAULT 0
;
alter table  IF EXISTS dbo.eventlog
   add constraint eventlog_errorlog_fk1 foreign key (errorlogid, _timestamp)
      references dbo.errorlog (errorlogid, _timestamp)
;
alter table  IF EXISTS dbo.eventlog
   add constraint eventlog_eventtype_fk1 foreign key (eventtypeid)
      references dbo.eventtype (eventtypeid)
;
