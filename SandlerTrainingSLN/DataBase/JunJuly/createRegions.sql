USE [SandlerDB]
GO

DECLARE @regionID INT 

EXEC sp_CreateRegion @name = 'North East',  @countryCode = 'US',  @region_Id = @regionID OUTPUT;
PRINT CAST(@regionID as VARCHAR(10));
EXEC sp_CreateRegion @name = 'Mid-Atlantic',  @countryCode = 'US',  @region_Id = @regionID OUTPUT;
PRINT CAST(@regionID as VARCHAR(10));
EXEC sp_CreateRegion @name = 'North Central',  @countryCode = 'US',  @region_Id = @regionID OUTPUT;
PRINT CAST(@regionID as VARCHAR(10));
EXEC sp_CreateRegion @name = 'Great Lakes',  @countryCode = 'US',  @region_Id = @regionID OUTPUT;
PRINT CAST(@regionID as VARCHAR(10));
EXEC sp_CreateRegion @name = 'South East',  @countryCode = 'US',  @region_Id = @regionID OUTPUT;
PRINT CAST(@regionID as VARCHAR(10));
EXEC sp_CreateRegion @name = 'South Central',  @countryCode = 'US',  @region_Id = @regionID OUTPUT;
PRINT CAST(@regionID as VARCHAR(10));
EXEC sp_CreateRegion @name = 'West',  @countryCode = 'US',  @region_Id = @regionID OUTPUT;
PRINT CAST(@regionID as VARCHAR(10));

EXEC sp_CreateRegion @name = 'Canada-Eastern',  @countryCode = 'CA',  @region_Id = @regionID OUTPUT;
PRINT CAST(@regionID as VARCHAR(10));
EXEC sp_CreateRegion @name = 'Canada-Western',  @countryCode = 'CA',  @region_Id = @regionID OUTPUT;
PRINT CAST(@regionID as VARCHAR(10));
GO