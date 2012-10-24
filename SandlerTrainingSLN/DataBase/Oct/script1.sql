/*
Executed on 139 Dt:10/22 11:41PM
*/

USE [SandlerDB]
GO

/****** Object:  StoredProcedure [dbo].[sp_DeleteContactsOfUser]    Script Date: 10/10/2012 22:43:51 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_DeleteContactsOfUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_DeleteContactsOfUser]
GO

/****** Object:  StoredProcedure [dbo].[sp_DeleteOpportunitiesOfUser]    Script Date: 10/10/2012 22:43:51 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_DeleteOpportunitiesOfUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_DeleteOpportunitiesOfUser]
GO

/****** Object:  StoredProcedure [dbo].[sp_DeleteDocumentsOfUser]    Script Date: 10/10/2012 22:43:51 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_DeleteDocumentsOfUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_DeleteDocumentsOfUser]
GO

CREATE Procedure [dbo].[sp_DeleteDocumentsOfUser]
@franchiseeId AS Int
,@userId AS uniqueidentifier

AS

BEGIN

	Begin Try
	
		DELETE d FROM TBL_DOCS d INNER JOIN TBL_Opportunities o WITH(NOLOCK) ON o.Id = OppsId
					INNER JOIN TBL_Contacts c WITH(NOLOCK) ON c.CONTACTSID = o.CONTACTID
					INNER JOIN Tbl_Companies cmp WITH(NOLOCK) ON cmp.COMPANIESID = c.COMPANYID
					WHERE cmp.FranchiseeId = @franchiseeId AND c.CreatedBy = @userId;
	
	End Try
	Begin Catch
	
		SELECT
		ERROR_NUMBER() AS ErrorNumber
		,ERROR_SEVERITY() AS ErrorSeverity
		,ERROR_STATE() AS ErrorState
		,ERROR_PROCEDURE() AS ErrorProcedure
		,ERROR_LINE() AS ErrorLine
		,ERROR_MESSAGE() AS ErrorMessage;


	End Catch
	
END
GO
CREATE Procedure [dbo].[sp_DeleteOpportunitiesOfUser]
@franchiseeId AS Int
,@userId AS uniqueidentifier

AS

BEGIN

	Begin Try
	
		--First Delete Documents
		EXEC sp_DeleteDocumentsOfUser @franchiseeId, @userId
		
		DELETE o FROM TBL_Opportunities o WITH(NOLOCK) INNER JOIN TBL_Contacts c WITH(NOLOCK) ON c.CONTACTSID = o.CONTACTID
					INNER JOIN Tbl_Companies cmp WITH(NOLOCK) ON cmp.COMPANIESID = c.COMPANYID
					WHERE cmp.FranchiseeId = @franchiseeId AND c.CreatedBy = @userId;
	
	End Try
	Begin Catch
	
		SELECT
		ERROR_NUMBER() AS ErrorNumber
		,ERROR_SEVERITY() AS ErrorSeverity
		,ERROR_STATE() AS ErrorState
		,ERROR_PROCEDURE() AS ErrorProcedure
		,ERROR_LINE() AS ErrorLine
		,ERROR_MESSAGE() AS ErrorMessage;

	End Catch
	
END
GO


CREATE Procedure [dbo].[sp_DeleteContactsOfUser]
@franchiseeId AS Int
,@userId AS uniqueidentifier

AS

BEGIN

	Begin Try
	
		--First Delete Opportunities
		
		Exec sp_DeleteOpportunitiesOfUser @franchiseeId, @userId;
		
		DELETE t FROM TBL_GA_Tracker t WITH(NOLOCK)
		INNER JOIN TBL_Contacts c WITH(NOLOCK) ON c.CONTACTSID = t.ContactId
		INNER JOIN Tbl_Companies cmp WITH(NOLOCK) ON cmp.COMPANIESID = c.COMPANYID
		WHERE cmp.FranchiseeId = @franchiseeId AND c.CreatedBy = @userId;
		
		DELETE c FROM TBL_Contacts c WITH(NOLOCK)
					INNER JOIN Tbl_Companies cmp WITH(NOLOCK) ON cmp.COMPANIESID = c.COMPANYID
					WHERE cmp.FranchiseeId = @franchiseeId AND c.CreatedBy = @userId;
	
	End Try
	Begin Catch
	
		SELECT
		ERROR_NUMBER() AS ErrorNumber
		,ERROR_SEVERITY() AS ErrorSeverity
		,ERROR_STATE() AS ErrorState
		,ERROR_PROCEDURE() AS ErrorProcedure
		,ERROR_LINE() AS ErrorLine
		,ERROR_MESSAGE() AS ErrorMessage;

	
	End Catch
	
END
GO







