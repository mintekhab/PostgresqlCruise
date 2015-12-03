create or replace function dbo.logerror_00 (
    pMessage        text ,
    pNumber         integer ,
    pSeverity       integer ,
    pState          integer ,
    pErrorprocedure varchar(128),
    pInput          text,
    pStep           varchar(128),
    pLine           int,
    pErrraised      bool,
    presolved       bool,
    pComment        varchar(300),
    pUsername       varchar(40)
)
returns int as
$$
DECLARE
   RC_FAILURE         int DEFAULT -100;
   RC_SUCCESS         int DEFAULT 0;
   ExitCode           int;
   ProcedureName      varchar(128)  := 'dbo.logerror_00';
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
   DBVersion          varchar(50) := ' ';
   text_var1          text;
   text_var2          text;
   text_var3          text;

BEGIN
    IF (pErrorprocedure is not null) then
       ProcedureName :=  pErrorprocedure ;
    END IF;

    INSERT INTO dbo.ErrorLog
    (
         _timestamp
        ,message
        ,_number
        ,severity
        ,state
        ,dbversion
        ,errorprocedure
        ,input
        ,step
        ,line
        ,errraised
        ,resolved
        ,comment
        ,createdby
    )
    VALUES
    (   MyTimeStamp
       ,pMessage
       ,pNumber
       ,pSeverity
       ,pState
       ,DBVersion
       ,ProcedureName
       ,pInput
       ,pStep
       ,pLine
       ,pErrraised
       ,presolved
       ,pComment
       ,pUsername
    );
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

--UNIT TEST
--SELECT dbo.logerror_00('Test Error Message'::text,1111,16,0,'test_sp'::varchar,'test_imput'::text,'test_step'::varchar,100,true,false,'test_comment'::varchar,'test_user'::varchar);