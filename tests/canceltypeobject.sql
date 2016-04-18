--Format the output for nice TAP.

\pset format unaligned
\pset tuples_only true
\pset pager

--Revert all changes on failure

\set ON_ERROR_ROLLBACK 1
\set ON_ERROR_STOP true
\set QUIET 1

BEGIN;

set search_path to tap , dbo , public;
SELECT PLAN(18);

select has_table('dbo'::name,'canceltype'::name);

-- Column level testing 

select has_column('dbo'::name,'canceltype'::name,'canceltypeid'::name,'check column canceltypeid');
select col_type_is( 'dbo'::name,'canceltype'::name,'canceltypeid'::name,'smallint','check datatype for colummn canceltypeid');
select col_not_null('dbo'::name,'canceltype'::name,'canceltypeid'::name,'check not NULL on colummn canceltypeid');
 
select has_column('dbo'::name,'canceltype'::name,'canceltypename'::name,'check column canceltypename');
select col_type_is( 'dbo'::name,'canceltype'::name,'canceltypename'::name,'character varying(60)','check datatype for colummn canceltypename');
select col_not_null('dbo'::name,'canceltype'::name,'canceltypename'::name,'check not NULL on colummn canceltypename');

select has_column('dbo'::name,'canceltype'::name,'canceltypedescription'::name,'check column canceltypedescription');
select col_type_is( 'dbo'::name,'canceltype'::name,'canceltypedescription'::name,'character varying(255)','check datatype for colummn canceltypedescription');
select col_is_null('dbo'::name,'canceltype'::name,'canceltypedescription'::name,'check not NULL on colummn canceltypedescription');

select has_column('dbo'::name,'canceltype'::name,'updatedate'::name,'check column updatedate');
select col_type_is( 'dbo'::name,'canceltype'::name,'updatedate'::name,'timestamp without time zone','check datatype for colummn updatedate');
select col_not_null('dbo'::name,'canceltype'::name,'updatedate'::name,'check not NULL on colummn updatedate');

select has_column('dbo'::name,'canceltype'::name,'updatedby'::name,'check column updatedby');
select col_type_is( 'dbo'::name,'canceltype'::name,'updatedby'::name,'character varying(32)','check datatype for colummn updatedby');
select col_not_null('dbo'::name,'canceltype'::name,'updatedby'::name,'check not NULL on colummn updatedby');

-- test unique / primary key / foreign key constraints

select index_is_unique('dbo'::name,'canceltype'::name,'akcanceltype'::name,'check if unique index present on column canceltypename');
select col_is_pk('dbo'::name,'canceltype'::name,'canceltypeid'::name,'check if primary key present on column canceltypeid');
SELECT * FROM finish();
ROLLBACK;