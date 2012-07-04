/* To prevent any potential data loss issues, you should review this script in detail before running it outside the context of the database designer.*/
BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.Return_on_Trng_Investment ADD
	IsOriginalVersion bit NOT NULL CONSTRAINT DF_Return_on_Trng_Investment_IsOriginalVersion DEFAULT 1
GO
ALTER TABLE dbo.Return_on_Trng_Investment ADD CONSTRAINT
	PK_Return_on_Trng_Investment PRIMARY KEY CLUSTERED 
	(
	ID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.Return_on_Trng_Investment SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
