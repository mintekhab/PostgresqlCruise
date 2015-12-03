create or replace function dbo.logevent_00(
    pEventTypeID    integer,
    pErrorLogId     integer ,
    pTimeStamp	    timestamp without time zone,
    pEventProcedure varchar(128),
    pInput          text,
    pMessage        text,
    pEventXML       text,
    pReviewed       bool,
    pComment        varchar(300),
    pUsername       varchar(40)
)
returns int as
$$
DECLARE
   RC_FAILURE         int DEFAULT -100;
   RC_SUCCESS         int DEFAULT 0;
   ExitCode           int;
   ProcedureName      varchar(128)  := 'dbo.logevent_00';
   ERRRECORDNOTFOUND  int := 200100;
   ERRDUPLICATEROW    int := 200101;
   ERRRI              int := 200102;
   ERRMAXCOUNT        int := 200103;
   ERRUNEXPECTED      int := 200106;
   ERRPARAMETER       int := 200110;
   MsgParm1           varchar(200);
   MsgParm2           varchar(200);
   MsgParm3           varchar(200);
   MsgParm4           varchar(200);
   ErrorMessagePrefix text DEFAULT ' ';
   ErrorMessage       text DEFAULT 'unknown';
   ErrorNumber        int;
   ErrorSeverity      int := 16;
   ErrorState         int := 1;
   ErrorLine          int := 0;
   MyTimeStamp        timestamp without time zone DEFAULT now();
   EventType_var      varchar(40);
   DBVersion          varchar(50) := ' ';
   WinAppLog_var      bool;
   WinAppLogLevel_var int;
   EventMessage       text;
   dbname             text := current_database();
   varsql             text;
   text_var1          text;
   text_var2          text;
   text_var3          text;

BEGIN
    IF (pEventProcedure is not null) then
       ProcedureName :=  pEventProcedure ;
    END IF;
    
	IF NOT EXISTS ( SELECT 1 FROM dbo.eventtype WHERE eventtypeid = pEventTypeID ) THEN
	   ErrorNumber := ERRPARAMETER ;
	   MsgParm1 := 'EventtypeID' ;
       MsgParm2 := 	coalesce(pEventTypeID::varchar,'NULL') ;
	   RAISE NOTICE 'Warning (%):(%)  NOT FOUND IN (%) ,ERRORCODE: %', MsgParm1,MsgParm2,ProcedureName,ErrorNumber ;
	ELSE
	  SELECT eventtype,winapplog,Winapploglevel INTO EventType_var,WinAppLog_var,WinAppLogLevel_var
	  FROM dbo.eventtype WHERE eventtypeid = pEventTypeID ;
	  
	  EventMessage := EventType_var || '-' || pMessage ;
	  ErrorMessagePrefix = 'on INSERT - ';
	  
      INSERT INTO dbo.eventLog
        (
         eventtimestamp
        ,eventtypeid
        ,errorlogid
        ,_timestamp
        ,dbversion
        ,eventprocedure
        ,input
        ,message
        ,eventxml
        ,reviewed
        ,winapplogged
        ,comment
        ,createdby
        )
      VALUES
       ( 
	  MyTimeStamp
        ,pEventTypeID
        ,pErrorLogId
        ,pTimeStamp
        ,DBVersion
        ,ProcedureName
        ,pInput
        ,REPLACE(EventMessage, chr(12), chr(13)|| chr(10))
        ,pEventXML
        ,pReviewed
        ,WinAppLog_var
        ,pComment
        ,pUsername
       );
	END IF ;
    
	IF WinAppLog_var = '1' THEN
           CASE WinAppLogLevel_var
	      WHEN 1 THEN RAISE LOG 'eventcreate /t INFORMATION /id % /l application /d % /so %',pEventTypeID,EventMessage,dbname;
	      WHEN 2 THEN RAISE LOG 'eventcreate /t INFORMATION /id % /l application /d % /so %',pEventTypeID,EventMessage,dbname;
	      WHEN 3 THEN RAISE LOG 'eventcreate /t INFORMATION /id % /l application /d % /so %',pEventTypeID,EventMessage,dbname;
                 ELSE RAISE LOG 'Warning (%):(%)  NOT FOUND IN (%) ,ERRORCODE: %', MsgParm1,MsgParm2,ProcedureName,ErrorNumber ;		  
	    END CASE ;
	END IF;
    return RC_SUCCESS;
 EXCEPTION
   when others then
        RAISE NOTICE 'Calling sproc failed (%) WITH ERRORCODE: %', ProcedureName , SQLSTATE ;
        GET STACKED DIAGNOSTICS text_var1 = MESSAGE_TEXT
                              , text_var2 = PG_EXCEPTION_DETAIL
                              , text_var3 = PG_EXCEPTION_HINT ;
        RAISE NOTICE 'Failure Message (%) ' , text_var1 ;
        return RC_FAILURE ;

END;
$$
language 'plpgsql'
;


--unit test
--SELECT dbo.logevent_00( 5,NULL,NULL,'test_event_logging stored proc'::varchar,'test_input'::text,'test_message'::text,'test_xml'::text,true,'test_comment'::varchar,'test_user'::varchar);