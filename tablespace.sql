-- Data tablespace creation.
CREATE TABLESPACE ADMDATA
DATAFILE 'C:\app\Yerling\oradata\examplebd\ADMDATA.DBF'
SIZE 15M;

-- Ind tablespace creation.
CREATE TABLESPACE ADMIND
DATAFILE 'C:\app\Yerling\oradata\examplebd\AMDIND.DBF'
SIZE 15M;

-- Main user creation
CREATE USER adm
    IDENTIFIED BY "administrador"
    DEFAULT TABLESPACE ADMDATA
    QUOTA 10M ON ADMDATA
    TEMPORARY TABLESPACE temp
    QUOTA 5M ON system;
    
GRANT connect TO adm;
GRANT create session TO adm;
GRANT all privileges to adm;
