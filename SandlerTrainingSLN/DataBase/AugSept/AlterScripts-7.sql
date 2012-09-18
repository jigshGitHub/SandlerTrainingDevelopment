ALTER TABLE TBL_FRANCHISEE DROP COLUMN PhoneNumber;
GO
ALTER TABLE TBL_FRANCHISEE ADD PhoneNumber NVARCHAR(25)
GO
ALTER TABLE TBL_FRANCHISEE DROP COLUMN FaxNumber;
GO
ALTER TABLE TBL_FRANCHISEE ADD FaxNumber NVARCHAR(25)
GO
ALTER TABLE TBL_FRANCHISEE_USERS ADD [ID] [int] IDENTITY(1,1) NOT NULL
GO

ALTER TABLE TBL_FRANCHISEE_USERS ADD  CONSTRAINT [PK_TBL_FRANCHISEE_IsActive]  PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)
GO


/****** Object:  StoredProcedure [dbo].[sp_ResetFields]    Script Date: 09/17/2012 15:00:52 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ResetFields]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_ResetFields]
GO

Create PROCEDURE [dbo].[sp_ResetFields]


AS

	 -- For Tbl_Company
	 Update TBL_COMPANIES 
	 Set IsNewCompany = 0, UpdatedBy ='NightProcess', UpdatedDate = GETDATE() where LASTCONTACT_DATE < GETDATE() - 90
	 
	 -- for Tbl_Contacts
	 Update TBL_CONTACTS 
	 Set IsNewAppointment = 0 , UpdatedBy = 'NightProcess', UpdatedDate = GETDATE() where LAST_CONTACT_DATE < GETDATE() - 90
 
	RETURN
GO
/****** Object:  View [dbo].[vw_Companies]    Script Date: 09/17/2012 22:35:02 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_Companies]'))
DROP VIEW [dbo].[vw_Companies]
GO

Create VIEW [dbo].[vw_Companies]

AS

SELECT r.ID AS RegionID, 
r.Name AS Region, 
ch.ID AS CoachID, 
ch.FirstName + ' ' + ch.LastName AS CoachName,
f.Name AS FranchiseeName, 
cmp.* 
FROM dbo.[TBL_COMPANIES] cmp WITH (NOLOCK)
INNER JOIN dbo.[TBL_Franchisee] f WITH (NOLOCK) ON cmp.FranchiseeID = f.ID AND f.IsActive = 1
INNER JOIN dbo.[TBL_COACH] ch WITH (NOLOCK) ON f.CoachID = ch.ID AND ch.IsActive = 1
INNER JOIN dbo.[TBL_Region] r WITH (NOLOCK) ON ch.RegionID = r.ID AND r.IsActive = 1
WHERE cmp.IsActive = 1

GO


/****** Object:  StoredProcedure [dbo].[sp_GetCompaniesByUser]    Script Date: 09/17/2012 22:36:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetCompaniesByUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetCompaniesByUser]
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
    
    IF @RoleName = 'Corporate'
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
	
	IF @RoleName = 'FranchiseeOwner'
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
	
	IF @RoleName = 'FranchiseeUser'
	BEGIN
		Select @franchiseeId = FranchiseeID From TBL_FRANCHISEE_USERS WITH(NOLOCK)
		WHERE UserID = @userId;
		
		Select vw.*  
		FROM [vw_Companies] vw
		WHERE vw.CreatedBy = @userId;
		
	END 
	
	
	
End

GO

