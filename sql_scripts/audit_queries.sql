1. postgres ( add IF EXISTS )
2. change the namedatalen ( default is fixed at 63 )


SELECT p.proname AS funcname,  d.description
 FROM pg_proc p
   INNER JOIN pg_namespace n ON n.oid = p.pronamespace
   LEFT JOIN pg_description As d ON (d.objoid = p.oid )
     WHERE n.nspname = 'pg_catalog' 
        AND (d.description ILIKE '%extension%' or p.proname ILIKE '%extension%')
   ORDER BY n.nspname, p.proname ;
   
   
   SELECT c.relname As tname,c.relkind As type,  d.description
      FROM pg_class As c
      LEFT JOIN pg_namespace n ON n.oid = c.relnamespace
      LEFT JOIN pg_tablespace t ON t.oid = c.reltablespace
      LEFT JOIN pg_description As d ON (d.objoid = c.oid AND d.objsubid = 0)
       WHERE n.nspname = 'pg_catalog' 
           AND (d.description ILIKE '%extension%' 
                   OR c.relname ILIKE '%extension%')
      ORDER BY n.nspname, c.relname ;
3. SET schema path is not required as objects as objects are accessed qualified by schema name
4. Owner not required 
5. Truncation of names due to length restriction as 63 bytes.
   a. ixinsurancetripregiondefinition_insurancetripregiondefinitionmodelid truncated to ixinsurancetripregiondefinition_insurancetripregiondefinitionmo
   b. akinsurancetripregiondefinitionmodel_insurancetripregiondefinitionmodelname will be truncated to akinsurancetripregiondefinitionmodel_insurancetripregiondefinit
   c. fkinsurancetripregiondefinition_insurancetripregiondefinitionmodel will be truncated to fkinsurancetripregiondefinition_insurancetripregiondefinitionmo
   
6. Add create schema statements.
7. Prefix table names with proper schema names.
8. Indexes are created by default for primary key ( no need to create separate unique index on primary key column)
9. PDM file not update , The table Expression does not columns VendorID , etc.
10. If the table definition has identity columns , the serial seed is defaulted to 1,1 . However in  some tables the seed is 0,1.
    No separate Alter seq command is createdto reset the seed .



Issues with pg loader

1. Generic issue is with datetimestamp.
2. encoding at the database level
3. problem with special characters in fields ( delimiter choose is ^)
4. problem with xml .

Need to remove special character like new line / from fields and xml



