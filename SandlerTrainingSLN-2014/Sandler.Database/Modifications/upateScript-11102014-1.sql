IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[PK_TBL_PerformanceActuals]') AND type = 'K')
BEGIN
	ALTER TABLE [dbo].[TBL_PerformanceActuals] DROP CONSTRAINT [PK_TBL_PerformanceActuals];
END

GO

/****** Object:  Index [PK_TBL_PerformanceActuals]    Script Date: 11/10/2014 1:32:03 PM ******/
ALTER TABLE [dbo].[TBL_PerformanceActuals] ADD  CONSTRAINT [PK_TBL_PerformanceActuals] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO


