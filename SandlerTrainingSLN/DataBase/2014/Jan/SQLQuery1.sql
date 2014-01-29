USE [SandlerDB]
GO

/****** Object:  StoredProcedure [dbo].[sp_ClientsAvgLengthWithIndustries]    Script Date: 01/29/2014 05:40:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ClientsAvgLengthWithIndustries]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_ClientsAvgLengthWithIndustries]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetCompaniesByUser]    Script Date: 01/29/2014 05:40:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetCompaniesByUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetCompaniesByUser]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetContactsByUser]    Script Date: 01/29/2014 05:40:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetContactsByUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetContactsByUser]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetNewAppointmentsWithAppointmentSource]    Script Date: 01/29/2014 05:40:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetNewAppointmentsWithAppointmentSource]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetNewAppointmentsWithAppointmentSource]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetNewClientsWithProducts]    Script Date: 01/29/2014 05:40:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetNewClientsWithProducts]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetNewClientsWithProducts]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetOpportunitiesByUser]    Script Date: 01/29/2014 05:40:31 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetOpportunitiesByUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetOpportunitiesByUser]
GO

USE [SandlerDB]
GO

/****** Object:  StoredProcedure [dbo].[sp_ClientsAvgLengthWithIndustries]    Script Date: 01/29/2014 05:40:31 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
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
    
    IF @RoleName = 'Corporate' or @RoleName = 'HomeOfficeAdmin' or @RoleName = 'HomeOfficeUser'
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
	
	IF( @RoleName = 'FranchiseeOwner' OR  @RoleName = 'Client')
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

/****** Object:  StoredProcedure [dbo].[sp_GetCompaniesByUser]    Script Date: 01/29/2014 05:40:31 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




CREATE Procedure [dbo].[sp_GetCompaniesByUser]
@userId UniqueIdentifier	

AS 
Begin

	DECLARE @RoleName VARCHAR(256)
    DECLARE @franchiseeId int
    
    Select @RoleName = RoleName From vw_aspnet_Roles r
    INNER JOIN vw_aspnet_UsersInRoles ur ON ur.RoleId = r.RoleId
    WHERE ur.UserId = @userId;
    
    PRINT @RoleName;
    
    IF @RoleName = 'Corporate' or @RoleName = 'HomeOfficeAdmin' or @RoleName = 'HomeOfficeUser'
	Begin
    
		Select *  
		FROM [vw_Companies];
		
		Return;
	END
	
	IF @RoleName = 'Coach'
	BEGIN
		
		Select vw.*  
		FROM [vw_Companies] vw
		INNER JOIN TBL_COACH ch WITH(NOLOCK) ON ch.ID = vw.CoachId
		WHERE ch.UserID = @userId;
		
	END 
	
	IF (@RoleName = 'FranchiseeOwner' OR @RoleName = 'FranchiseeUser' OR @RoleName = 'Client')
	Begin
		Select @franchiseeId = FranchiseeID From TBL_FRANCHISEE_USERS WITH(NOLOCK)
		WHERE UserID = @userId;
		
		PRINT '@franchiseeId=' + CAST(@franchiseeId as varchar(10));
		
		Select vw.*  
		FROM [vw_Companies] vw
		INNER JOIN TBL_Franchisee f WITH(NOLOCK) ON f.ID = vw.FranchiseeID
		WHERE vw.FranchiseeID = @franchiseeId;
		Return;
	END	
		
End



GO

/****** Object:  StoredProcedure [dbo].[sp_GetContactsByUser]    Script Date: 01/29/2014 05:40:31 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




CREATE Procedure [dbo].[sp_GetContactsByUser]
@userId UniqueIdentifier	

AS 
Begin

	DECLARE @RoleName VARCHAR(256)
    DECLARE @franchiseeId int
    
    Select @RoleName = RoleName From vw_aspnet_Roles r
    INNER JOIN vw_aspnet_UsersInRoles ur ON ur.RoleId = r.RoleId
    WHERE ur.UserId = @userId;
    
    PRINT @RoleName;
    
    IF @RoleName = 'Corporate' or @RoleName = 'HomeOfficeAdmin' or @RoleName = 'HomeOfficeUser'
	Begin
    
		Select *  
		FROM [vw_Contacts];
		
		Return;
	END
	
	IF @RoleName = 'Coach'
	BEGIN
		
		Select vw.*  
		FROM [vw_Contacts] vw
		INNER JOIN TBL_COACH ch WITH(NOLOCK) ON ch.ID = vw.CoachId
		WHERE ch.UserID = @userId;
		
	END 
	
	IF (@RoleName = 'FranchiseeOwner' OR @RoleName = 'Client')
	Begin
		Select @franchiseeId = FranchiseeID From TBL_FRANCHISEE_USERS WITH(NOLOCK)
		WHERE UserID = @userId;
		
		PRINT '@franchiseeId=' + CAST(@franchiseeId as varchar(10));
		
		Select vw.*  
		FROM [vw_Contacts] vw
		INNER JOIN TBL_Franchisee f WITH(NOLOCK) ON f.ID = vw.FranchiseeID
		WHERE vw.FranchiseeID = @franchiseeId;
		Return;
	END
	
	IF @RoleName = 'FranchiseeUser'
	BEGIN
		
		Select vw.*  
		FROM [vw_Contacts] vw
		WHERE vw.CreatedBy = CAST(@userId AS VARCHAR(100));
		
	END 
	
	
	
End




GO

/****** Object:  StoredProcedure [dbo].[sp_GetNewAppointmentsWithAppointmentSource]    Script Date: 01/29/2014 05:40:31 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
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
    
    IF @RoleName = 'Corporate' or @RoleName = 'HomeOfficeAdmin' or @RoleName = 'HomeOfficeUser'
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
	
	IF(@RoleName = 'FranchiseeOwner' OR @RoleName = 'Client')
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
		AND CreatedBy = CAST(@userId AS VARCHAR(100))
		Group By ApptSourceName;
		
	END 
END



GO

/****** Object:  StoredProcedure [dbo].[sp_GetNewClientsWithProducts]    Script Date: 01/29/2014 05:40:31 ******/
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

/****** Object:  StoredProcedure [dbo].[sp_GetOpportunitiesByUser]    Script Date: 01/29/2014 05:40:31 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE Procedure [dbo].[sp_GetOpportunitiesByUser]
@userId UniqueIdentifier	

AS 
Begin

	DECLARE @RoleName VARCHAR(256)
    DECLARE @franchiseeId int
    
    Select @RoleName = RoleName From vw_aspnet_Roles r
    INNER JOIN vw_aspnet_UsersInRoles ur ON ur.RoleId = r.RoleId
    WHERE ur.UserId = @userId;
    
    PRINT @RoleName;
    
    IF @RoleName = 'Corporate' or @RoleName = 'HomeOfficeAdmin' or @RoleName = 'HomeOfficeUser'
	Begin
    
		Select *  
		FROM [vw_Opportunities];
		
		Return;
	END
	
	IF @RoleName = 'Coach'
	BEGIN
		
		Select vw.*  
		FROM [vw_Opportunities] vw
		INNER JOIN TBL_COACH ch WITH(NOLOCK) ON ch.ID = vw.CoachId
		WHERE ch.UserID = @userId;
		
	END 
	
	IF (@RoleName = 'FranchiseeOwner' OR @RoleName = 'Client')
	Begin
		Select @franchiseeId = FranchiseeID From TBL_FRANCHISEE_USERS WITH(NOLOCK)
		WHERE UserID = @userId;
		
		PRINT '@franchiseeId=' + CAST(@franchiseeId as varchar(10));
		
		Select vw.*  
		FROM [vw_Opportunities] vw
		INNER JOIN TBL_Franchisee f WITH(NOLOCK) ON f.ID = vw.FranchiseeID
		WHERE vw.FranchiseeID = @franchiseeId;
		Return;
	END
	
	IF @RoleName = 'FranchiseeUser'
	BEGIN
		Select @franchiseeId = FranchiseeID From TBL_FRANCHISEE_USERS WITH(NOLOCK)
		WHERE UserID = @userId;
		
		Select vw.*  
		FROM [vw_Opportunities] vw
		WHERE vw.CreatedBy = @userId;
		
	END 
	
End



GO


