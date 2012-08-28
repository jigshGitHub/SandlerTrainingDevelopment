USE [SandlerDB]
GO
declare @franchiseeUser_Id varchar(50)
declare @coachUser_id varchar(50)
declare @franchisee_id int


SELECT @franchisee_id = f.Id,  @franchiseeUser_Id = u.UserId, @coachUser_id = cu.UserId 
FROM TBL_FRANCHISEE_USERS AS fu 
INNER JOIN aspnet_Users AS u ON fu.UserID = u.UserId 
INNER JOIN TBL_FRANCHISEE AS f ON f.ID = fu.FranchiseeID
INNER JOIN TBL_COACH AS c ON f.CoachID = c.ID
inner join aspnet_Users cu on c.UserID = cu.UserId
INNER JOIN TBL_Region AS r ON r.ID = c.RegionID
where u.UserName='hamish.knox'
order by f.name;

print @franchisee_id
print @franchiseeUser_Id
print @coachUser_id




DECLARE	@return_value int

EXEC	@return_value = [dbo].[sp_LoadCompanyContactsData] @franchiseeid = @franchisee_id, @coachUserID = @coachUser_id, @FranchiseeOwnerUserId = @franchiseeUser_Id

SELECT	'Return Value' = @return_value

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TBL_CONTACTS$]') AND type in (N'U'))
DROP TABLE [dbo].[TBL_CONTACTS$]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TBL_COMPANIES$]') AND type in (N'U'))
DROP TABLE [dbo].[TBL_COMPANIES$]
GO

GO
