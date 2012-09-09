/*
Executed on 139 9/7/2012 10:35PM
*/

USE [SandlerDB]
GO
ALTER TABLE Tbl_IndustryType ADD ColorCode VARCHAR(6);
GO

Update Tbl_IndustryType SET ColorCode = '009999' WHERE IndId = 1;
Update Tbl_IndustryType SET ColorCode = 'CC99FF' WHERE IndId = 2;
Update Tbl_IndustryType SET ColorCode = 'FFFF99' WHERE IndId = 3;
Update Tbl_IndustryType SET ColorCode = '009900' WHERE IndId = 4;
Update Tbl_IndustryType SET ColorCode = '0066FF' WHERE IndId = 5;
Update Tbl_IndustryType SET ColorCode = 'DDFF00' WHERE IndId = 6;
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_AttachDocument]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_AttachDocument]
GO



CREATE PROCEDURE [dbo].[sp_AttachDocument]
	
	(
		@OppsID int,@CompanyId int,@DocName varchar(150), @DocStatus int, 
		@LastModifyDate datetime, @CreatedBy varchar(50)
	)
	
AS
	
	Insert into tbl_docs
	(oppsid, companyid, docname,docstatusid,Updateddate, CreatedBy, IsActive)
	values
	(@OppsID,@CompanyId,@DocName,@DocStatus,@LastModifyDate, @CreatedBy,1)
	
	/* SET NOCOUNT ON */
	RETURN


GO