
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_NewAppointmentsWithAppointmentSource]'))
DROP VIEW [dbo].[vw_NewAppointmentsWithAppointmentSource]
GO


  CREATE VIEW [dbo].[vw_NewAppointmentsWithAppointmentSource]
  AS 
	Select ctc.CONTACTSID,cmp.CreationDate,ctc.CreatedBy, _as.ApptSourceId, cmp.FranchiseeId, cmp.COMPANIESID, _As.ApptSourceName From TBL_CONTACTS ctc WITH (NOLOCK) 
	INNER JOIN TBL_COMPANIES cmp WITH (NOLOCK) ON cmp.COMPANIESID = ctc.COMPANYID
	INNER JOIN Tbl_AppointmentsSource _as WITH(NOLOCK) ON ctc.ApptSourceId = _as.ApptSourceId
	WHERE ctc.IsNewAppointment = 1 
	AND ctc.IsActive = 1 
	AND cmp.IsActive = 1 
	AND _As.IsActive = 1
  
GO


/****** Object:  StoredProcedure [dbo].[sp_GetNewAppointmentsWithAppointmentSource]    Script Date: 09/11/2012 22:02:13 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetNewAppointmentsWithAppointmentSource]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetNewAppointmentsWithAppointmentSource]
GO


CREATE PROCEDURE [dbo].[sp_GetNewAppointmentsWithAppointmentSource]
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
    
		Select Count(CONTACTSID) AS ContactsCount, ApptSourceName 
		FROM [vw_NewAppointmentsWithAppointmentSource]
		WHERE DATEPART(MONTH,CreationDate) = @month
		AND DATEPART(YEAR,CreationDate) = @year
		Group By ApptSourceName;
		
		Return;
	END
	
	IF @RoleName = 'Coach'
	BEGIN
		
		Select Count(vw.CONTACTSID) AS ContactsCount, vw.ApptSourceName 
		FROM [vw_NewAppointmentsWithAppointmentSource] vw
		INNER JOIN TBL_FRANCHISEE f WITH(NOLOCK) ON f.ID = vw.FranchiseeId
		INNER JOIN TBL_COACH ch WITH(NOLOCK) ON ch.ID = f.CoachId
		WHERE DATEPART(MONTH,vw.CreationDate) = @month
		AND DATEPART(YEAR,vw.CreationDate) = @year
		AND ch.UserID = @userId
		Group By vw.ApptSourceName;
		
	END 
	
	IF @RoleName = 'FranchiseeOwner'
	Begin
		Select @franchiseeId = FranchiseeID From TBL_FRANCHISEE_USERS WITH(NOLOCK)
		WHERE UserID = @userId;
		
		PRINT '@franchiseeId=' + CAST(@franchiseeId as varchar(10));
		
		Select Count(CONTACTSID) AS ContactsCount, ApptSourceName 
		FROM [vw_NewAppointmentsWithAppointmentSource]
		WHERE DATEPART(MONTH,CreationDate) = @month
		AND DATEPART(YEAR,CreationDate) = @year
		AND FranchiseeId = @franchiseeId
		Group By ApptSourceName;
		
		Return;
	END
	
	IF @RoleName = 'FranchiseeUser'
	BEGIN
		Select @franchiseeId = FranchiseeID From TBL_FRANCHISEE_USERS WITH(NOLOCK)
		WHERE UserID = @userId;
		
		Select Count(CONTACTSID) AS ContactsCount, ApptSourceName 
		FROM [vw_NewAppointmentsWithAppointmentSource]
		WHERE DATEPART(MONTH,CreationDate) = @month
		AND DATEPART(YEAR,CreationDate) = @year
		AND FranchiseeId = @franchiseeId
		AND CreatedBy = @userId
		Group By ApptSourceName;
		
	END 
END
GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_NewClientsWithProducts]'))
DROP VIEW [dbo].[vw_NewClientsWithProducts]
GO


  CREATE VIEW [dbo].[vw_NewClientsWithProducts]
  AS 
	Select cmp.COMPANIESID,cmp.CreationDate,o.CreatedBy, p.Id, cmp.FranchiseeId, p.ProductTypeName
	From TBL_OPPORTUNITIES o WITH (NOLOCK) 
	INNER JOIN TBL_COMPANIES cmp WITH (NOLOCK) ON cmp.COMPANIESID = o.COMPANYID
	INNER JOIN Tbl_ProductType p WITH(NOLOCK) ON o.ProductID  = p.Id
	WHERE cmp.IsNewCompany = 1 
	AND o.IsActive = 1 
	AND cmp.IsActive = 1 
	AND p.IsActive = 1
  
GO
/****** Object:  StoredProcedure [dbo].[sp_GetNewClientsWithProducts]    Script Date: 09/11/2012 22:02:13 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetNewClientsWithProducts]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetNewClientsWithProducts]
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
    
		Select Count(COMPANIESID) AS CompaniesCount, ProductTypeName 
		FROM [vw_NewClientsWithProducts]
		WHERE DATEPART(MONTH,CreationDate) = @month
		AND DATEPART(YEAR,CreationDate) = @year
		Group By ProductTypeName;
		
		Return;
	END
	
	IF @RoleName = 'Coach'
	BEGIN
		
		Select Count(vw.COMPANIESID) AS ContactsCount, vw.ProductTypeName 
		FROM [vw_NewClientsWithProducts] vw
		INNER JOIN TBL_FRANCHISEE f WITH(NOLOCK) ON f.ID = vw.FranchiseeId
		INNER JOIN TBL_COACH ch WITH(NOLOCK) ON ch.ID = f.CoachId
		WHERE DATEPART(MONTH,vw.CreationDate) = @month
		AND DATEPART(YEAR,vw.CreationDate) = @year
		AND ch.UserID = @userId
		Group By vw.ProductTypeName;
		
	END 
	
	IF @RoleName = 'FranchiseeOwner'
	Begin
		Select @franchiseeId = FranchiseeID From TBL_FRANCHISEE_USERS WITH(NOLOCK)
		WHERE UserID = @userId;
		
		PRINT '@franchiseeId=' + CAST(@franchiseeId as varchar(10));
		
		Select Count(COMPANIESID) AS ContactsCount, ProductTypeName 
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
		
		Select Count(COMPANIESID) AS ContactsCount, ProductTypeName 
		FROM [vw_NewClientsWithProducts]
		WHERE DATEPART(MONTH,CreationDate) = @month
		AND DATEPART(YEAR,CreationDate) = @year
		AND FranchiseeId = @franchiseeId
		AND CreatedBy = @userId
		Group By ProductTypeName;
		
	END 
END
GO

IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_ClientsWithIndustries]'))
DROP VIEW [dbo].[vw_ClientsWithIndustries]
GO


  CREATE VIEW [dbo].[vw_ClientsWithIndustries]
  AS 
	SELECT i.IndustryTypeName,cmp.COMPANIESID, cmp.FranchiseeId,cmp.CreationDate,DATEDIFF(MONTH,cmp.CreationDate,GETDATE()) as Months
	FROM TBL_COMPANIES cmp INNER JOIN Tbl_IndustryType i ON cmp.IndustryId = i.IndId
	WHERE i.IsActive = 1 
	AND cmp.IsActive = 1
  
GO

/****** Object:  StoredProcedure [dbo].[sp_GetNewClientsWithProducts]    Script Date: 09/11/2012 22:02:13 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ClientsAvgLengthWithIndustries]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_ClientsAvgLengthWithIndustries]
GO


CREATE PROCEDURE [dbo].[sp_ClientsAvgLengthWithIndustries]
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
    
		SELECT IndustryTypeName,AVG(DATEDIFF(MONTH,CreationDate,GETDATE()))
		FROM [vw_ClientsWithIndustries]
		Group By IndustryTypeName;
		
		Return;
	END
	
	IF @RoleName = 'Coach'
	BEGIN
		
		SELECT vw.IndustryTypeName,AVG(DATEDIFF(MONTH,vw.CreationDate,GETDATE()))
		FROM [vw_ClientsWithIndustries] vw
		INNER JOIN TBL_FRANCHISEE f WITH(NOLOCK) ON f.ID = vw.FranchiseeId
		INNER JOIN TBL_COACH ch WITH(NOLOCK) ON ch.ID = f.CoachId
		WHERE ch.UserID = @userId
		Group By vw.IndustryTypeName;
		
	END 
	
	IF @RoleName = 'FranchiseeOwner'
	Begin
		Select @franchiseeId = FranchiseeID From TBL_FRANCHISEE_USERS WITH(NOLOCK)
		WHERE UserID = @userId;
		
		PRINT '@franchiseeId=' + CAST(@franchiseeId as varchar(10));
		
		SELECT IndustryTypeName,AVG(DATEDIFF(MONTH,CreationDate,GETDATE()))
		FROM [vw_ClientsWithIndustries]
		WHERE FranchiseeId = @franchiseeId
		Group By IndustryTypeName;
		
		Return;
	END
	
	IF @RoleName = 'FranchiseeUser'
	BEGIN
		
		Select @franchiseeId = FranchiseeID From TBL_FRANCHISEE_USERS WITH(NOLOCK)
		WHERE UserID = @userId;
		
		SELECT IndustryTypeName,AVG(DATEDIFF(MONTH,CreationDate,GETDATE()))
		FROM [vw_ClientsWithIndustries]
		WHERE FranchiseeId = @franchiseeId
		Group By IndustryTypeName;
		
	END 
END
GO
