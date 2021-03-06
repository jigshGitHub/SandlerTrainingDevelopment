--Executed in SandlerDB 0308 5:32AM

IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_NewClientsWithProducts]'))
DROP VIEW [dbo].[vw_NewClientsWithProducts]
GO
/****** Object:  View [dbo].[vw_NewClientsWithProducts]    Script Date: 03/07/2013 11:54:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



  CREATE VIEW [dbo].[vw_NewClientsWithProducts]
  AS 
	Select cmp.COMPANIESID,cmp.CreationDate,o.CreatedBy, p.Id, cmp.FranchiseeId, p.ProductTypeName, WEIGHTEDVALUE
	From TBL_OPPORTUNITIES o WITH (NOLOCK) 
	INNER JOIN TBL_COMPANIES cmp WITH (NOLOCK) ON cmp.COMPANIESID = o.COMPANYID
	INNER JOIN Tbl_ProductType p WITH(NOLOCK) ON o.ProductID  = p.Id
	WHERE cmp.IsNewCompany = 1 
	AND o.IsActive = 1 
	AND cmp.IsActive = 1 
	AND p.IsActive = 1
  

GO

/****** Object:  StoredProcedure [dbo].[sp_GetNewClientsWithProducts]    Script Date: 03/07/2013 11:56:17 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetNewClientsWithProducts]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetNewClientsWithProducts]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetNewClientsWithProducts]    Script Date: 03/07/2013 11:56:17 ******/
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
    
    IF @RoleName = 'Corporate'
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
		
		Select Count(vw.COMPANIESID) AS ContactsCount, vw.ProductTypeName , SUM(WEIGHTEDVALUE) AS TotalContractPrice
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
		
		Select Count(COMPANIESID) AS ContactsCount, ProductTypeName , SUM(WEIGHTEDVALUE) AS TotalContractPrice
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
		
		Select Count(COMPANIESID) AS ContactsCount, ProductTypeName , SUM(WEIGHTEDVALUE) AS TotalContractPrice
		FROM [vw_NewClientsWithProducts]
		WHERE DATEPART(MONTH,CreationDate) = @month
		AND DATEPART(YEAR,CreationDate) = @year
		AND FranchiseeId = @franchiseeId
		AND CreatedBy = @userId
		Group By ProductTypeName;
		
	END 
END


GO

