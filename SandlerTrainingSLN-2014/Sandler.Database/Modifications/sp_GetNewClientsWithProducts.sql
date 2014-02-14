USE [SandlerDB]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetNewClientsWithProducts]    Script Date: 02/09/2014 09:52:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetNewClientsWithProducts]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetNewClientsWithProducts]
GO

USE [SandlerDB]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetNewClientsWithProducts]    Script Date: 02/09/2014 09:52:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[sp_GetNewClientsWithProducts]
    @month int,
	@year int,
	@userId UniqueIdentifier
AS
BEGIN
    
    DECLARE @RoleName VARCHAR(256)
    DECLARE @franchiseeId int
    
    Select @RoleName = RoleName From vw_aspnet_Roles r
    INNER JOIN vw_aspnet_UsersInRoles ur ON ur.RoleId = r.RoleId
    WHERE ur.UserId = @userId;
    
    PRINT @RoleName;
    
    IF @RoleName = 'Corporate' or @RoleName = 'HomeOfficeAdmin' or @RoleName = 'HomeOfficeUser'
	Begin
    
		Select Count(COMPANIESID) AS CompaniesCount, ProductTypeName, SUM(WEIGHTEDVALUE) AS TotalContractPrice
		FROM [vw_NewClientsWithProducts]
		WHERE DATEPART(MONTH,CreationDate) = @month
		AND DATEPART(YEAR,CreationDate) = @year
		Group By ProductTypeName;
		
		Return;
	END
	
	IF @RoleName = 'Coach'
	BEGIN
		
		Select Count(vw.COMPANIESID) AS CompaniesCount, vw.ProductTypeName , SUM(WEIGHTEDVALUE) AS TotalContractPrice
		FROM [vw_NewClientsWithProducts] vw
		INNER JOIN TBL_FRANCHISEE f WITH(NOLOCK) ON f.ID = vw.FranchiseeId
		INNER JOIN TBL_COACH ch WITH(NOLOCK) ON ch.ID = f.CoachId
		WHERE DATEPART(MONTH,vw.CreationDate) = @month
		AND DATEPART(YEAR,vw.CreationDate) = @year
		AND ch.UserID = @userId
		Group By vw.ProductTypeName;
		
	END 
	
	IF(@RoleName = 'FranchiseeOwner' OR @RoleName = 'Client')
	Begin
		Select @franchiseeId = FranchiseeID From TBL_FRANCHISEE_USERS WITH(NOLOCK)
		WHERE UserID = @userId;
		
		PRINT '@franchiseeId=' + CAST(@franchiseeId as varchar(10));
		
		Select Count(COMPANIESID) AS CompaniesCount, ProductTypeName , SUM(WEIGHTEDVALUE) AS TotalContractPrice
		FROM [vw_NewClientsWithProducts]
		WHERE DATEPART(MONTH,CreationDate) = @month
		AND DATEPART(YEAR,CreationDate) = @year
		AND FranchiseeId = @franchiseeId
		Group By ProductTypeName;
		
		Return;
	END
	
	IF @RoleName = 'FranchiseeUser'
	BEGIN
		
		Select @franchiseeId = FranchiseeID From TBL_FRANCHISEE_USERS WITH(NOLOCK)
		WHERE UserID = @userId;
		
		Select Count(COMPANIESID) AS CompaniesCount, ProductTypeName , SUM(WEIGHTEDVALUE) AS TotalContractPrice
		FROM [vw_NewClientsWithProducts]
		WHERE DATEPART(MONTH,CreationDate) = @month
		AND DATEPART(YEAR,CreationDate) = @year
		AND FranchiseeId = @franchiseeId
		AND CreatedBy = @userId
		Group By ProductTypeName;
		
	END 
END




GO


