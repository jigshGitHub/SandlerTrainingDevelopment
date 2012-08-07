IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TBL_DOCS_TBL_COMPANIES]') AND parent_object_id = OBJECT_ID(N'[dbo].[TBL_DOCS]'))
ALTER TABLE [dbo].[TBL_DOCS] DROP CONSTRAINT [FK_TBL_DOCS_TBL_COMPANIES]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TBL_DOCS_Tbl_DocumentStatus]') AND parent_object_id = OBJECT_ID(N'[dbo].[TBL_DOCS]'))
ALTER TABLE [dbo].[TBL_DOCS] DROP CONSTRAINT [FK_TBL_DOCS_Tbl_DocumentStatus]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TBL_DOCS_TBL_OPPORTUNITIES]') AND parent_object_id = OBJECT_ID(N'[dbo].[TBL_DOCS]'))
ALTER TABLE [dbo].[TBL_DOCS] DROP CONSTRAINT [FK_TBL_DOCS_TBL_OPPORTUNITIES]
GO

IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_TBL_DOCS_CreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TBL_DOCS] DROP CONSTRAINT [DF_TBL_DOCS_CreatedDate]
END

GO

IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_TBL_DOCS_UpdatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TBL_DOCS] DROP CONSTRAINT [DF_TBL_DOCS_UpdatedDate]
END

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TBL_DOCS]') AND type in (N'U'))
DROP TABLE [dbo].[TBL_DOCS]
GO

CREATE TABLE [dbo].[TBL_DOCS](
	[DOCSID] [int] IDENTITY(1,1) NOT NULL,
	[DOCNAME] [varchar](150) NULL,
	[OPPSID] [int] NULL,
	[COMPANYID] [int] NULL,
	[DOCUMENTSTATUS] [varchar](50) NULL,
	[DOCSTATUSID] [int] NULL,
	[IsActive] [bit] NULL,
	[UpdatedBy] [varchar](80) NULL,
	[CreatedBy] [varchar](80) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_TBL_DOCS] PRIMARY KEY CLUSTERED 
(
	[DOCSID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[TBL_DOCS]  WITH CHECK ADD  CONSTRAINT [FK_TBL_DOCS_TBL_COMPANIES] FOREIGN KEY([COMPANYID])
REFERENCES [dbo].[TBL_COMPANIES] ([COMPANIESID])
GO

ALTER TABLE [dbo].[TBL_DOCS] CHECK CONSTRAINT [FK_TBL_DOCS_TBL_COMPANIES]
GO

ALTER TABLE [dbo].[TBL_DOCS]  WITH CHECK ADD  CONSTRAINT [FK_TBL_DOCS_Tbl_DocumentStatus] FOREIGN KEY([DOCSTATUSID])
REFERENCES [dbo].[Tbl_DocumentStatus] ([DocStatusId])
GO

ALTER TABLE [dbo].[TBL_DOCS] CHECK CONSTRAINT [FK_TBL_DOCS_Tbl_DocumentStatus]
GO

ALTER TABLE [dbo].[TBL_DOCS]  WITH CHECK ADD  CONSTRAINT [FK_TBL_DOCS_TBL_OPPORTUNITIES] FOREIGN KEY([OPPSID])
REFERENCES [dbo].[TBL_OPPORTUNITIES] ([ID])
GO

ALTER TABLE [dbo].[TBL_DOCS] CHECK CONSTRAINT [FK_TBL_DOCS_TBL_OPPORTUNITIES]
GO

ALTER TABLE [dbo].[TBL_DOCS] ADD  CONSTRAINT [DF_TBL_DOCS_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO

ALTER TABLE [dbo].[TBL_DOCS] ADD  CONSTRAINT [DF_TBL_DOCS_UpdatedDate]  DEFAULT (getdate()) FOR [UpdatedDate]
GO

ALTER PROCEDURE [dbo].[sp_GetDocumentDetails]
	
	(
		@DocsID int
	)
	
AS
	Select 
	dc.DocsID, 
	dc.DocName as docFullName,
	substring(dc.DocName, CHARINDEX('_',dc.DocName)+1, LEN(dc.DocName)) as DocName,
	dc.updateddate as LastModifyDate,
	ds.DocStatusId, op.name as OppName, op.id as OppsID,
	cp.CompanyName, ds.DocStatusText,cp.COMPANIESID
	from tbl_docs dc
	left join tbl_opportunities op on dc.oppsid = op.id
	left join tbl_companies cp on cp.COMPANIESID = op.companyid
	left join tbl_documentstatus ds on ds.docstatusid = dc.docstatusid
	where dc.docsid = @DocsID
	
	

	RETURN

GO

ALTER PROCEDURE [dbo].[sp_GetDocumentsById]
	
	(
		@OppsID int
	)
	
AS
	
	Select 
	dc.docsid, 
	dc.DocName as docFullName,
	substring(dc.DocName, CHARINDEX('_',dc.DocName)+1, LEN(dc.DocName)) as DocName,
	dc.updateddate,
	op.name as oppname, cp.companyname,
	ds.DocStatusText 
	from tbl_docs dc
	left join tbl_opportunities op on dc.oppsid = op.id
	left join tbl_companies cp on cp.COMPANIESID = op.COMPANYID 
	left join tbl_documentStatus ds on ds.DocStatusId = dc.DocStatusId
	where dc.oppsid = @OppsID
	

	RETURN

GO

ALTER PROCEDURE [dbo].[sp_GetDocumentsByOppId]
	
	(
		@OppsID int
	)
	
AS
	
	Select 
	dc.docsid, 
	dc.DocName as docFullName,
	substring(dc.DocName, CHARINDEX('_',dc.DocName)+1, LEN(dc.DocName)) as DocName, 
	dc.updateddate,
	op.name as oppname, cp.companyname,
	ds.DocStatusText 
	from tbl_docs dc
	left join tbl_opportunities op on dc.oppsid = op.id
	left join tbl_companies cp on cp.COMPANIESID = op.COMPANYID 
	left join tbl_documentStatus ds on ds.DocStatusId = dc.DocStatusId
	where dc.oppsid = @OppsID
	

	RETURN
GO

ALTER PROCEDURE [dbo].[sp_AttachDocument]
	
	(
		@OppsID int,@DocName varchar(150), @DocStatus int, 
		@LastModifyDate datetime, @CreatedBy varchar(50)
	)
	
AS
	
	Insert into tbl_docs
	(oppsid, docname,docstatusid,Updateddate, CreatedBy, IsActive)
	values
	(@OppsID,@DocName,@DocStatus,@LastModifyDate, @CreatedBy,1)
	
	/* SET NOCOUNT ON */
	RETURN


GO
