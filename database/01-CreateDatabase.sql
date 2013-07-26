/*
 * Branch Synchronization ETL
 * Project #72 - Complete Database Implementation
 * SQL Server 2008/2012
 * Technology: SSIS
 * Created: 2013
 */

USE master;
GO

IF EXISTS (SELECT name FROM sys.databases WHERE name = 'BranchSyncETL')
BEGIN
    ALTER DATABASE BranchSyncETL SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE BranchSyncETL;
END
GO

CREATE DATABASE BranchSyncETL
ON PRIMARY
(
    NAME = 'BranchSyncETL_Data',
    FILENAME = 'C:\SQLData\BranchSyncETL_Data.mdf',
    SIZE = 100MB,
    MAXSIZE = 5GB,
    FILEGROWTH = 10MB
)
LOG ON
(
    NAME = 'BranchSyncETL_Log',
    FILENAME = 'C:\SQLData\BranchSyncETL_Log.ldf',
    SIZE = 50MB,
    MAXSIZE = 1GB,
    FILEGROWTH = 5MB
);
GO

ALTER DATABASE BranchSyncETL SET RECOVERY SIMPLE;
ALTER DATABASE BranchSyncETL SET AUTO_UPDATE_STATISTICS ON;
GO

USE BranchSyncETL;
GO

PRINT 'Database BranchSyncETL created successfully';
PRINT 'Project: Branch Synchronization ETL';
PRINT 'Description: Branch and HQ database sync';
GO
