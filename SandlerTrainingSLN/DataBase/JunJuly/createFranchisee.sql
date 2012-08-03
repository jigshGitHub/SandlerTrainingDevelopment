USE [SandlerDB]
GO

DECLARE @franchiseeId int

EXECUTE sp_CreateFranchisee @user_Name = 'nectfo', @_email = 'necoach@sandler.com', @_name = 'Connecticut Fr', @region_Name = 'North East', @countryCode = 'US', @franchisee_Id = @franchiseeId OUTPUT; 
EXECUTE sp_CreateFranchisee @user_Name = 'seflfo', @_email = 'secoach@sandler.com', @_name = 'Florida Fr', @region_Name = 'South East', @countryCode = 'US', @franchisee_Id = @franchiseeId OUTPUT; 
EXECUTE sp_CreateFranchisee @user_Name = 'ncchfo', @_email = 'nccoach@sandler.com', @_name = 'Chicago Fr', @region_Name = 'North Central', @countryCode = 'US', @franchisee_Id = @franchiseeId OUTPUT; 


EXECUTE sp_CreateFranchisee @user_Name = 'mamd1fo', @_email = 'mamd1fo@sandler.com', @_name = 'Neuberger and Company, Inc.', @region_Name = 'Mid-Atlantic', @countryCode = 'US', @franchisee_Id = @franchiseeId OUTPUT; 
EXECUTE sp_CreateFranchisee @user_Name = 'mamd2fo', @_email = 'mamd2fo@sandler.com', @_name = 'Professional Achievement Group, Inc.', @region_Name = 'Mid-Atlantic', @countryCode = 'US', @franchisee_Id = @franchiseeId OUTPUT; 
EXECUTE sp_CreateFranchisee @user_Name = 'mamd3fo', @_email = 'mamd3fo@sandler.com', @_name = 'McDonell Consulting & Development, Inc.', @region_Name = 'Mid-Atlantic', @countryCode = 'US', @franchisee_Id = @franchiseeId OUTPUT; 

EXECUTE sp_CreateFranchisee @user_Name = 'adarling', @_email = 'adarling@sandler.com', @_name = 'ABC Training Center', @region_Name = 'Mid-Atlantic', @countryCode = 'US', @franchisee_Id = @franchiseeId OUTPUT; 
EXECUTE sp_CreateFranchisee @user_Name = 'pdarling', @_email = 'pdarling@sandler.com', @_name = 'XYZ Training Center', @region_Name = 'Mid-Atlantic', @countryCode = 'US', @franchisee_Id = @franchiseeId OUTPUT; 







GO

