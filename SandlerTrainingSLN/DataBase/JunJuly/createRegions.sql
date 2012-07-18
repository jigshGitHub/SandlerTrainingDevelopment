USE [SandlerDB]
GO

DECLARE @regionID INT 

EXEC sp_CreateRegion @name = 'North East', @region_Id = @regionID OUTPUT;
PRINT CAST(@regionID as VARCHAR(10));
EXEC sp_CreateRegion @name = 'South East', @region_Id = @regionID OUTPUT;
PRINT CAST(@regionID as VARCHAR(10));
EXEC sp_CreateRegion @name = 'North Central', @region_Id = @regionID OUTPUT;
PRINT CAST(@regionID as VARCHAR(10));
GO