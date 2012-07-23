USE [SandlerDB]
GO

DECLARE @franchiseeId int

EXECUTE sp_CreateFranchisee @user_Name = 'nectfo', @_email = 'necoach@sandler.com', @_name = 'Connecticut Fr', @region_Name = 'North East', @countryCode = 'US', @franchisee_Id = @franchiseeId OUTPUT; 
PRINT CAST(@franchiseeId as VARCHAR(10));
EXECUTE sp_CreateFranchisee @user_Name = 'seflfo', @_email = 'secoach@sandler.com', @_name = 'Florida Fr', @region_Name = 'South East', @countryCode = 'US', @franchisee_Id = @franchiseeId OUTPUT; 
PRINT CAST(@franchiseeId as VARCHAR(10));
EXECUTE sp_CreateFranchisee @user_Name = 'ncchfo', @_email = 'nccoach@sandler.com', @_name = 'Chicago Fr', @region_Name = 'North Central', @countryCode = 'US', @franchisee_Id = @franchiseeId OUTPUT; 
PRINT CAST(@franchiseeId as VARCHAR(10));
GO
