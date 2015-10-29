DROP FUNCTION ins.parse_string(character varying,character);
CREATE OR REPLACE FUNCTION ins.parse_string( inpstring varchar , delim char(1))
returns setof text as
$$
DECLARE 
  sql        varchar;
  regex      varchar;
BEGIN
      IF  ($1 is not null )
      AND ($2 is not null ) THEN 
        regex := 'E''\\'||$2||'''';
        sql := 'SELECT val FROM regexp_split_to_table( '|| quote_literal($1) || ',' ||  regex || ') as val' ;
        raise notice 'sql query : %', sql;
        return query execute sql;
      ELSIF ($1 is null ) THEN
        raise notice 'instring is null  : %', $1;
        raise Exception 'Function aborted due to null input string' ;
      ELSIF ($2 is null ) THEN
        raise notice 'delimiter is null  : %', $2 ;
        raise Exception 'Function aborted due null delimiter' ;
      END IF ; 
    
END;
$$
language 'plpgsql'
;
    
--SELECT * FROM ins.parse_string('1,2,3'::varchar,NULL);
--SELECT * FROM ins.parse_string(NULL,NULL);
--SELECT * FROM ins.parse_string('A,B,C,D,E,1,2,3,'::varchar,','::char);
