IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[vw_FranchiseeUsers]') AND type in (N'V'))
	DROP VIEW [dbo].[vw_FranchiseeUsers]
GO
/****** Object:  View [dbo].vw_FranchiseeUsers    Script Date: 10/16/2014 10:33:04 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].vw_FranchiseeUsers
AS
SELECT     dbo.aspnet_Users.UserId, dbo.aspnet_Users.UserName, dbo.TBL_FRANCHISEE_USERS.FirstName, dbo.TBL_FRANCHISEE_USERS.LastName, 
                      dbo.TBL_FRANCHISEE_USERS.FranchiseeID, dbo.TBL_FRANCHISEE_USERS.ID, dbo.TBL_FRANCHISEE.Name AS FranchiseeName
FROM         dbo.aspnet_Users INNER JOIN
                      dbo.TBL_FRANCHISEE_USERS ON dbo.aspnet_Users.UserId = dbo.TBL_FRANCHISEE_USERS.UserID INNER JOIN
                      dbo.TBL_FRANCHISEE ON dbo.TBL_FRANCHISEE_USERS.FranchiseeID = dbo.TBL_FRANCHISEE.ID

GO
