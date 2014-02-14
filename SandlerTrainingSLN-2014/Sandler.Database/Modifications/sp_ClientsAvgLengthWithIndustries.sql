USE [SandlerDB]
GO

/****** Object:  StoredProcedure [dbo].[sp_ClientsAvgLengthWithIndustries]    Script Date: 02/09/2014 22:38:15 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ClientsAvgLengthWithIndustries]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_ClientsAvgLengthWithIndustries]
GO

USE [SandlerDB]
GO

/****** Object:  StoredProcedure [dbo].[sp_ClientsAvgLengthWithIndustries]    Script Date: 02/09/2014 22:38:15 ******/
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
    
		SELECT IndustryTypeName,AVG(DATEDIFF(MONTH,CreationDate,GETDATE())) AS AvgCreationDate
		FROM [vw_ClientsWithIndustries]
		Group By IndustryTypeName;
		
		Return;
	END
	
	IF @RoleName = 'Coach'
	BEGIN
		
		SELECT vw.IndustryTypeName,AVG(DATEDIFF(MONTH,vw.CreationDate,GETDATE())) AS AvgCreationDate
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
		
		SELECT IndustryTypeName,AVG(DATEDIFF(MONTH,CreationDate,GETDATE())) AS AvgCreationDate
		FROM [vw_ClientsWithIndustries]
		WHERE FranchiseeId = @franchiseeId
		Group By IndustryTypeName;
		
		Return;
	END
	
	IF @RoleName = 'FranchiseeUser'
	BEGIN
		
		Select @franchiseeId = FranchiseeID From TBL_FRANCHISEE_USERS WITH(NOLOCK)
		WHERE UserID = @userId;
		
		SELECT IndustryTypeName,AVG(DATEDIFF(MONTH,CreationDate,GETDATE())) AS AvgCreationDate
		FROM [vw_ClientsWithIndustries]
		WHERE FranchiseeId = @franchiseeId
		Group By IndustryTypeName;
		
	END 
END



GO


