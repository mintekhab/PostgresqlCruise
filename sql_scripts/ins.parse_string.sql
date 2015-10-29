DROP FUNCTION ins.parse_string(character varying,character);
CREATE OR REPLACE FUNCTION ins.parse_string( inpstring varchar , delim char(1))
returns setof text as
$$
DECLARE 
  sql        varchar;
  regex      varchar;
BEGIN
    regex := 'E''\\'||$2||'''';
    sql := 'SELECT val FROM regexp_split_to_table( '|| quote_literal($1) || ',' ||  regex || ') as val' ;
    raise notice 'sql query : %', sql;
    return query execute sql;
END;
$$
language 'plpgsql'
;