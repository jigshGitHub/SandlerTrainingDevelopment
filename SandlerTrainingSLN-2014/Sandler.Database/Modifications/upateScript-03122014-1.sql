
/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportglaa]    Script Date: 03/11/2014 22:31:00 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetHomeOfficeReportglaa]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetHomeOfficeReportglaa]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportfrmd]    Script Date: 03/11/2014 22:31:00 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetHomeOfficeReportfrmd]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetHomeOfficeReportfrmd]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportdhsa]    Script Date: 03/11/2014 22:31:00 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetHomeOfficeReportdhsa]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetHomeOfficeReportdhsa]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportmsrbymktgcom]    Script Date: 03/11/2014 22:31:00 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetHomeOfficeReportmsrbymktgcom]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetHomeOfficeReportmsrbymktgcom]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportmsrbyadvboard]    Script Date: 03/11/2014 22:31:00 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetHomeOfficeReportmsrbyadvboard]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetHomeOfficeReportmsrbyadvboard]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportmsrbykeyopnldr]    Script Date: 03/11/2014 22:31:00 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetHomeOfficeReportmsrbykeyopnldr]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetHomeOfficeReportmsrbykeyopnldr]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportmsfr]    Script Date: 03/11/2014 22:31:00 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetHomeOfficeReportmsfr]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetHomeOfficeReportmsfr]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportmfrd]    Script Date: 03/11/2014 22:31:00 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetHomeOfficeReportmfrd]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetHomeOfficeReportmfrd]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportzcbt]    Script Date: 03/11/2014 22:31:00 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetHomeOfficeReportzcbt]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetHomeOfficeReportzcbt]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportfrbyusingcrm]    Script Date: 03/11/2014 22:31:00 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetHomeOfficeReportfrbyusingcrm]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetHomeOfficeReportfrbyusingcrm]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportfrbystate]    Script Date: 03/11/2014 22:31:00 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetHomeOfficeReportfrbystate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetHomeOfficeReportfrbystate]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportsere]    Script Date: 03/11/2014 22:31:00 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetHomeOfficeReportsere]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetHomeOfficeReportsere]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportfrbyregion]    Script Date: 03/11/2014 22:31:00 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetHomeOfficeReportfrbyregion]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetHomeOfficeReportfrbyregion]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportprpl]    Script Date: 03/11/2014 22:31:00 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetHomeOfficeReportprpl]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetHomeOfficeReportprpl]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportmsfc]    Script Date: 03/11/2014 22:31:00 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetHomeOfficeReportmsfc]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetHomeOfficeReportmsfc]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportfrbytrngdate]    Script Date: 03/11/2014 22:31:00 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetHomeOfficeReportfrbytrngdate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetHomeOfficeReportfrbytrngdate]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportfrbycountry]    Script Date: 03/11/2014 22:31:00 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetHomeOfficeReportfrbycountry]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetHomeOfficeReportfrbycountry]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportctra]    Script Date: 03/11/2014 22:31:00 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetHomeOfficeReportctra]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetHomeOfficeReportctra]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportfrbycontdetails]    Script Date: 03/11/2014 22:31:00 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetHomeOfficeReportfrbycontdetails]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetHomeOfficeReportfrbycontdetails]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportfrbycoach]    Script Date: 03/11/2014 22:31:00 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetHomeOfficeReportfrbycoach]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetHomeOfficeReportfrbycoach]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportfrbycertlevel]    Script Date: 03/11/2014 22:31:00 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetHomeOfficeReportfrbycertlevel]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetHomeOfficeReportfrbycertlevel]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportfrbybusarea]    Script Date: 03/11/2014 22:31:00 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetHomeOfficeReportfrbybusarea]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetHomeOfficeReportfrbybusarea]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportfrbyawlevel]    Script Date: 03/11/2014 22:31:00 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetHomeOfficeReportfrbyawlevel]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetHomeOfficeReportfrbyawlevel]
GO


/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportglaa]    Script Date: 03/11/2014 22:31:00 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


Create Procedure [dbo].[sp_GetHomeOfficeReportglaa](
	@orderBy VARCHAR(MAX),  -- Required 
	@pageSize INT,    
	@pageNo INT, 		
	@recordType VARCHAR(MAX)=null
	)
As
BEGIN
	DECLARE @SQL VARCHAR(MAX),
	@pageTop INT,
	@pageBottom INT,
	@Q VARCHAR(MAX)		     
	IF (@orderBy = '')		SET     @orderBy = 'LastName ASC'; 
	

	If(@recordType<>'Excel') 	
	SET @SQL = 'SELECT A.ID,		
		case when IsRepAgreement=1 then ''Yes'' else ''No'' end as Agreement,		
		Isnull(A.LASTNAME,'''') as LastName,Isnull(A.FIRSTNAME,'''') as FirstName,	
		Isnull(A.NAME,'''') AS FranchiseName,				
	--Updated by Andy Darling on 12/19/2013 to change to WORK email address	
			Isnull(A.WorkEmail,'''') as PrimaryOfficeEmail,
			ISNULL(A.OFFICEPHONE,'''') AS ContactNumber,
			CASE WHEN (Convert(varchar(12),A.LASTCREATEDDATE,101)=''01/01/1900'' OR A.LASTCREATEDDATE=NULL) THEN NULL ELSE Convert(varchar(12),A.LASTCREATEDDATE,101) END as LastUpdated
		FROM DBO.TBL_FRANCHISEE A
		where a.IsActive = 1 and (A.WorkEmail is null or Upper(A.WorkEmail) != ''SANDLERSPM@MINEDSYSTEMS.COM'')					
		--Updated by Andy Darling 2013-11-06 to filter for ONLY RepAgreement = 1
		and a.IsRepAgreement = 1';	
	ELSE
	SET @SQL = '
	SELECT 		
		case when IsRepAgreement=1 then ''Yes'' else ''No'' end as Agreement,		
		Isnull(A.LASTNAME,'''') as LastName,Isnull(A.FIRSTNAME,'''') as FirstName,	
		Isnull(A.NAME,'''') AS FranchiseName,				
	--Updated by Andy Darling on 12/19/2013 to change to WORK email address	
			Isnull(A.WorkEmail,'''') as PrimaryOfficeEmail,
			ISNULL(A.OFFICEPHONE,'''') AS ContactNumber,
			CASE WHEN (Convert(varchar(12),A.LASTCREATEDDATE,101)=''01/01/1900'' OR A.LASTCREATEDDATE=NULL) THEN NULL ELSE Convert(varchar(12),A.LASTCREATEDDATE,101) END as LastUpdated,		
			i.UserName as LastUpdatedBy
			FROM DBO.TBL_FRANCHISEE A
		LEFT JOIN DBO.TBL_COACH B ON A.COACHID = B.ID	
		Left Join dbo.TBL_COUNTRY C on A.CountryID=c.ID
		Left Join dbo.TBL_State D on a.WorkStateId = D.Id
		Left Join dbo.TBL_COUNTRY E on A.CountryID=E.ID
		Left Join dbo.TBL_State F on a.WorkStateId = F.Id
		Left Join dbo.TBL_COUNTRY G on A.CountryID=G.ID
		left join dbo.TBL_REGION H on b.RegionID = h.ID
		left join dbo.aspnet_Users I on a.LastUpdatedBy =i.UserId
		left join dbo.aspnet_Users J on a.CreatedBy =J.UserId
		left join dbo.Tbl_SandlerRole K on a.SandlerRoleId=k.SandlerRoleId
		left join dbo.Tbl_AwardLevel L on a.AwardLevelId=l.AwardLevelId
		left join dbo.Tbl_PurchaseLevel M on a.PurchaseLevelId = m.PurchaseLevelId
		left join dbo.Tbl_CertifiedLevel N on a.CertifiedLevelId = n.CertifiedLevelId
		left join dbo.Tbl_CostPlusAmount P on a.CostPlusAmountId=p.CostPlusAmountId
		left join dbo.tbl_BehindAmount Q on a.BehindAmountId=Q.BehindAmountId
		where a.IsActive = 1 and (A.WorkEmail is null or Upper(A.WorkEmail) != ''SANDLERSPM@MINEDSYSTEMS.COM'')
		--Updated by Andy Darling 2013-11-06 to filter for ONLY RepAgreement = 1
		and a.IsRepAgreement = 1';
	
	
	If @pageNo > 0 AND @pageSize > 0
	BEGIN	   
		SET @pageNo = @pageNo - 1    
		SET @pageTop = (@pageNo * @pageSize) + 1  
		SET @pageBottom = (@pageNo * @pageSize) + @pageSize
	END	     
	--Casting to int is required in followinf select clause
	--Look for this article
	--http://mythicalcode.com/2013/10/30/the-specified-cast-from-a-materialized-system-int64-type-to-the-system-int32-type-is-not-valid/
	SET @SQL = 'SELECT ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowIndex, _MYQ.* FROM ('+@SQL+') _MYQ'
	SET @Q = '
		WITH CTE_pageResult AS (' + CHAR(13) + @SQL + CHAR(13) + ')'
		+'
		SELECT
				(SELECT cast(COUNT(*) as int)  FROM CTE_pageResult) AS TotalCount, * ';	
	SET @Q = @Q + '	 FROM CTE_pageResult';
	IF @pageTop > 0 
	BEGIN 
		SET @Q = @Q + ' WHERE RowIndex BETWEEN ' + CAST(@pageTop AS VARCHAR(10)) + ' AND ' + CAST(@pageBottom AS VARCHAR(10))
	END
	
	PRINT @Q
	EXEC (@Q)	    
END


GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportfrmd]    Script Date: 03/11/2014 22:31:01 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


Create Procedure [dbo].[sp_GetHomeOfficeReportfrmd](
	@orderBy VARCHAR(MAX),  -- Required 
	@pageSize INT,    
	@pageNo INT, 		
	@recordType VARCHAR(MAX)=null
	)
As
BEGIN
	DECLARE @SQL VARCHAR(MAX),
	@pageTop INT,
	@pageBottom INT,
	@Q VARCHAR(MAX)		     
	IF (@orderBy = '')		SET     @orderBy = 'FranchiseName ASC'; 	

	If(@recordType<>'Excel') 	
	SET @SQL = 'SELECT A.ID,		
		Isnull(A.NAME,'''') AS FranchiseName,
		Isnull(A.LASTNAME,'''') as LastName,Isnull(A.FIRSTNAME,'''') as FirstName,				
	--Updated by Andy Darling on 12/19/2013 to change to WORK email address	
			Isnull(A.WorkEmail,'''') as PrimaryOfficeEmail,
			ISNULL(A.OFFICEPHONE,'''') AS ContactNumber,
			CASE WHEN (Convert(varchar(12),A.LASTCREATEDDATE,101)=''01/01/1900'' OR A.LASTCREATEDDATE=NULL) THEN NULL ELSE Convert(varchar(12),A.LASTCREATEDDATE,101) END as LastUpdated
		FROM DBO.TBL_FRANCHISEE A	
		where a.SandlerRoleId=4 and  a.IsActive = 1 and
		(A.WorkEmail is null or Upper(A.WorkEmail) != ''SANDLERSPM@MINEDSYSTEMS.COM'')';	
	ELSE
	SET @SQL = '
	SELECT 		
		Isnull(A.NAME,'''') AS FranchiseName,
		Isnull(A.LASTNAME,'''') as LastName,Isnull(A.FIRSTNAME,'''') as FirstName,				
	--Updated by Andy Darling on 12/19/2013 to change to WORK email address	
			Isnull(A.WorkEmail,'''') as PrimaryOfficeEmail,
			ISNULL(A.OFFICEPHONE,'''') AS ContactNumber,
			CASE WHEN (Convert(varchar(12),A.LASTCREATEDDATE,101)=''01/01/1900'' OR A.LASTCREATEDDATE=NULL) THEN NULL ELSE Convert(varchar(12),A.LASTCREATEDDATE,101) END as LastUpdated,		
			i.UserName as LastUpdatedBy,
			CASE WHEN (Convert(varchar(12),A.CreatedDate,101)=''01/01/1900'' OR A.CreatedDate=NULL) THEN NULL ELSE Convert(varchar(12),A.CreatedDate,101) END as CreatedDate,
			J.UserName as CreatedBy,
			k.SandlerRoleText as SandlerRole, a.Title,
			Isnull(a.WebAddress,'''') as Website,
			Case when A.IsActive=''1'' Then ''Active'' else ''InActive'' end as Active,			
			Isnull(A.PhoneNumber,'''') Phone,
			Isnull(a.HomePhone,'''') as HomePhone, Isnull(a.MobilePhone,'''') as MobilePhone,
			Isnull(a.Fax,'''') Fax, Isnull(a.FaxNumber,'''') as FaxNumber,
			Isnull(l.AwardLevelText,'''') as AwardLevelText,Isnull(m.PurchaseLevelText,'''') as PurchaseLevel,
			Isnull(n.CertifiedLevelText,'''') as CertificationLevel,
			CASE WHEN (Convert(varchar(12),A.InitialContractDate,101)=''01/01/1900'' OR A.InitialContractDate=NULL) THEN NULL ELSE Convert(varchar(12),A.InitialContractDate,101) END as InitialContractDate,
			CASE WHEN (Convert(varchar(12),A.RenewalDate,101)=''01/01/1900'' OR A.RenewalDate=NULL) THEN NULL ELSE Convert(varchar(12),A.RenewalDate,101) END as RenewalDate,
			CASE WHEN (Convert(varchar(12),A.ContractFormDate,101)=''01/01/1900'' OR A.ContractFormDate=NULL) THEN NULL ELSE Convert(varchar(12),A.ContractFormDate,101) END as ContractFormDate,
			case when IsContractorPermitted=1 then ''Yes'' else ''No'' end as ContractorPermitted,
			case when IsSandlerMailRequired=1 then ''Yes'' else ''No'' end as SandlerMailRequired,
			case when IsKOLMember=1 then ''Yes'' else ''No'' end as KOLMember,
			case when IsAdvBoard=1 then ''Yes'' else ''No'' end as AdvisoryBoard,
			case when IsMktgCommittee=1 then ''Yes'' else ''No'' end as MarketingCommittee,
			case when IsUsingSandlerCRM=1 then ''Yes'' else ''No'' end as UsingSandlerCRM,
			case when IsDHSAwardWinner=1 then ''Yes'' else ''No'' end as DHSAwardWinner,
			CASE WHEN (Convert(varchar(12),A.DHSAwardDate,101)=''01/01/1900'' OR A.DHSAwardDate=NULL) THEN NULL ELSE Convert(varchar(12),A.DHSAwardDate,101) END as DHSAwardDate,
			CASE WHEN (Convert(varchar(12),A.InitialTrngDate,101)=''01/01/1900'' OR A.InitialTrngDate=NULL) THEN NULL ELSE Convert(varchar(12),A.InitialTrngDate,101) END as InitialTrainingDate,
			case when IsReqToSubmitFinancial=1 then ''Yes'' else ''No'' end as RequiredToSubmitFinancial,
			case when IsRepAgreement=1 then ''Yes'' else ''No'' end as RepresentiveAgreement,
			Isnull(a.WorkAddress,'''') as PrimaryOfficeAddress,Isnull(a.WorkCity,'''') as PrimaryOfficeCity,
			Isnull(d.Name,'''') as PrimaryOfficeState,Isnull(a.WorkZip,'''') as PrimaryOfficeZip,Isnull(e.Name,'''') as PrimaryOfficeCountry,
			Isnull(a.AlternateEmail,'''') as AlternateEmail,case when a.IsSameHomeAddress =''1'' then ''Yes'' else ''No'' end as SameHomeAddress,
			Isnull(a.HomeAddress,'''') as HomeAddress,Isnull(a.HomeCity,'''') as HomeCity,Isnull(f.Name,'''') as HomeState,Isnull(a.HomeZip,'''') as HomeZip,
			Isnull(g.Name,'''') as HomeCountry,Isnull(a.SpouseName,'''') as SpouseName,
			CASE WHEN (Convert(varchar(12),A.Birthday,101)=''01/01/1900'' OR A.Birthday=NULL) THEN NULL ELSE Convert(varchar(12),A.Birthday,101) END as BirthDay,
			CASE WHEN (Convert(varchar(12),A.Anniversary,101)=''01/01/1900'' OR A.Anniversary=NULL) THEN NULL ELSE Convert(varchar(12),A.Anniversary,101) END as Anniversary,
			a.YearsWithCompany as YearsWithCompany,
			case when a.IsMasterFranchiseeExists=1 then ''Yes'' else ''No'' end as IsMasterFranchisee,
			case when a.IsCanPrintLocally=1 then ''Yes'' else ''No'' end as LocalPrint,
			case when a.IsBuyFromCustomer=1 then ''Yes'' else ''No'' end as BuyFromSSI,
			case when a.IsFixedPricePurchase=1 then ''Yes'' else ''No'' end as FixedPricePurchase,
			Isnull(p.CostPlusAmountText,'''') as CostPlusAmount,
			case when a.IsBehindInTerDev=1 then ''Yes'' else ''No'' end as BehindinTerritoryDevelop,
			Isnull(q.BehindAmountText,'''') as AmountBehind,
			a.Territory,
			a.BusinessFocusArea as BusinessFocusArea,	
			a.ClosestMetroArea as ClosestMetroArea
			FROM DBO.TBL_FRANCHISEE A
		LEFT JOIN DBO.TBL_COACH B ON A.COACHID = B.ID	
		Left Join dbo.TBL_COUNTRY C on A.CountryID=c.ID
		Left Join dbo.TBL_State D on a.WorkStateId = D.Id
		Left Join dbo.TBL_COUNTRY E on A.CountryID=E.ID
		Left Join dbo.TBL_State F on a.WorkStateId = F.Id
		Left Join dbo.TBL_COUNTRY G on A.CountryID=G.ID
		left join dbo.TBL_REGION H on b.RegionID = h.ID
		left join dbo.aspnet_Users I on a.LastUpdatedBy =i.UserId
		left join dbo.aspnet_Users J on a.CreatedBy =J.UserId
		left join dbo.Tbl_SandlerRole K on a.SandlerRoleId=k.SandlerRoleId
		left join dbo.Tbl_AwardLevel L on a.AwardLevelId=l.AwardLevelId
		left join dbo.Tbl_PurchaseLevel M on a.PurchaseLevelId = m.PurchaseLevelId
		left join dbo.Tbl_CertifiedLevel N on a.CertifiedLevelId = n.CertifiedLevelId
		left join dbo.Tbl_CostPlusAmount P on a.CostPlusAmountId=p.CostPlusAmountId
		left join dbo.tbl_BehindAmount Q on a.BehindAmountId=Q.BehindAmountId
		where a.SandlerRoleId=4 and  a.IsActive = 1 and
		(A.WorkEmail is null or Upper(A.WorkEmail) != ''SANDLERSPM@MINEDSYSTEMS.COM'')';
	
	
	If @pageNo > 0 AND @pageSize > 0
	BEGIN	   
		SET @pageNo = @pageNo - 1    
		SET @pageTop = (@pageNo * @pageSize) + 1  
		SET @pageBottom = (@pageNo * @pageSize) + @pageSize
	END	     
	--Casting to int is required in followinf select clause
	--Look for this article
	--http://mythicalcode.com/2013/10/30/the-specified-cast-from-a-materialized-system-int64-type-to-the-system-int32-type-is-not-valid/
	SET @SQL = 'SELECT ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowIndex, _MYQ.* FROM ('+@SQL+') _MYQ'
	SET @Q = '
		WITH CTE_pageResult AS (' + CHAR(13) + @SQL + CHAR(13) + ')'
		+'
		SELECT
				(SELECT cast(COUNT(*) as int)  FROM CTE_pageResult) AS TotalCount, * ';	
	SET @Q = @Q + '	 FROM CTE_pageResult';
	IF @pageTop > 0 
	BEGIN 
		SET @Q = @Q + ' WHERE RowIndex BETWEEN ' + CAST(@pageTop AS VARCHAR(10)) + ' AND ' + CAST(@pageBottom AS VARCHAR(10))
	END
	
	PRINT @Q
	EXEC (@Q)	    
END


GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportdhsa]    Script Date: 03/11/2014 22:31:01 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


Create Procedure [dbo].[sp_GetHomeOfficeReportdhsa](
	@orderBy VARCHAR(MAX),  -- Required 
	@pageSize INT,    
	@pageNo INT, 		
	@recordType VARCHAR(MAX)=null
	)
As
BEGIN
	DECLARE @SQL VARCHAR(MAX),
	@pageTop INT,
	@pageBottom INT,
	@Q VARCHAR(MAX)		     
	IF (@orderBy = '')		SET     @orderBy = 'LastName ASC'; 
	

	If(@recordType<>'Excel') 	
	SET @SQL = 'SELECT A.ID,		
		Isnull(A.LASTNAME,'''') as LastName,Isnull(A.FIRSTNAME,'''') as FirstName,
		Isnull(A.NAME,'''') AS FranchiseName,
		CASE WHEN (Convert(varchar(12),A.DHSAwardDate,101)=''01/01/1900'' OR A.DHSAwardDate=NULL) THEN NULL ELSE Convert(varchar(12),A.DHSAwardDate,101) END as DHSAwardDate,		
	--Updated by Andy Darling on 12/19/2013 to change to WORK email address	
			Isnull(A.WorkEmail,'''') as PrimaryOfficeEmail,
			ISNULL(A.OFFICEPHONE,'''') AS ContactNumber,
			CASE WHEN (Convert(varchar(12),A.LASTCREATEDDATE,101)=''01/01/1900'' OR A.LASTCREATEDDATE=NULL) THEN NULL ELSE Convert(varchar(12),A.LASTCREATEDDATE,101) END as LastUpdated
		FROM DBO.TBL_FRANCHISEE A						
		where a.IsDHSAwardWinner =1 and  a.IsActive = 1 and
		(A.WorkEmail is null or Upper(A.WorkEmail) != ''SANDLERSPM@MINEDSYSTEMS.COM'')';	
	ELSE
	SET @SQL = '
	SELECT 		
		Isnull(A.LASTNAME,'''') as LastName,Isnull(A.FIRSTNAME,'''') as FirstName,	
		Isnull(A.NAME,'''') AS FranchiseName,	
		CASE WHEN (Convert(varchar(12),A.DHSAwardDate,101)=''01/01/1900'' OR A.DHSAwardDate=NULL) THEN NULL ELSE Convert(varchar(12),A.DHSAwardDate,101) END as DHSAwardDate,		
	--Updated by Andy Darling on 12/19/2013 to change to WORK email address	
			Isnull(A.WorkEmail,'''') as PrimaryOfficeEmail,
			ISNULL(A.OFFICEPHONE,'''') AS ContactNumber,
			CASE WHEN (Convert(varchar(12),A.LASTCREATEDDATE,101)=''01/01/1900'' OR A.LASTCREATEDDATE=NULL) THEN NULL ELSE Convert(varchar(12),A.LASTCREATEDDATE,101) END as LastUpdated,	
			i.UserName as LastUpdatedBy
			FROM DBO.TBL_FRANCHISEE A
		LEFT JOIN DBO.TBL_COACH B ON A.COACHID = B.ID	
		Left Join dbo.TBL_COUNTRY C on A.CountryID=c.ID
		Left Join dbo.TBL_State D on a.WorkStateId = D.Id
		Left Join dbo.TBL_COUNTRY E on A.CountryID=E.ID
		Left Join dbo.TBL_State F on a.WorkStateId = F.Id
		Left Join dbo.TBL_COUNTRY G on A.CountryID=G.ID
		left join dbo.TBL_REGION H on b.RegionID = h.ID
		left join dbo.aspnet_Users I on a.LastUpdatedBy =i.UserId
		left join dbo.aspnet_Users J on a.CreatedBy =J.UserId
		left join dbo.Tbl_SandlerRole K on a.SandlerRoleId=k.SandlerRoleId
		left join dbo.Tbl_AwardLevel L on a.AwardLevelId=l.AwardLevelId
		left join dbo.Tbl_PurchaseLevel M on a.PurchaseLevelId = m.PurchaseLevelId
		left join dbo.Tbl_CertifiedLevel N on a.CertifiedLevelId = n.CertifiedLevelId
		left join dbo.Tbl_CostPlusAmount P on a.CostPlusAmountId=p.CostPlusAmountId
		left join dbo.tbl_BehindAmount Q on a.BehindAmountId=Q.BehindAmountId
		where a.IsDHSAwardWinner =1 and a.IsActive = 1 and
		(A.WorkEmail is null or Upper(A.WorkEmail) != ''SANDLERSPM@MINEDSYSTEMS.COM'')';
	
	
	If @pageNo > 0 AND @pageSize > 0
	BEGIN	   
		SET @pageNo = @pageNo - 1    
		SET @pageTop = (@pageNo * @pageSize) + 1  
		SET @pageBottom = (@pageNo * @pageSize) + @pageSize
	END	     
	--Casting to int is required in followinf select clause
	--Look for this article
	--http://mythicalcode.com/2013/10/30/the-specified-cast-from-a-materialized-system-int64-type-to-the-system-int32-type-is-not-valid/
	SET @SQL = 'SELECT ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowIndex, _MYQ.* FROM ('+@SQL+') _MYQ'
	SET @Q = '
		WITH CTE_pageResult AS (' + CHAR(13) + @SQL + CHAR(13) + ')'
		+'
		SELECT
				(SELECT cast(COUNT(*) as int)  FROM CTE_pageResult) AS TotalCount, * ';	
	SET @Q = @Q + '	 FROM CTE_pageResult';
	IF @pageTop > 0 
	BEGIN 
		SET @Q = @Q + ' WHERE RowIndex BETWEEN ' + CAST(@pageTop AS VARCHAR(10)) + ' AND ' + CAST(@pageBottom AS VARCHAR(10))
	END
	
	PRINT @Q
	EXEC (@Q)	    
END


GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportmsrbymktgcom]    Script Date: 03/11/2014 22:31:01 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


Create Procedure [dbo].[sp_GetHomeOfficeReportmsrbymktgcom](
	@orderBy VARCHAR(MAX),  -- Required 
	@pageSize INT,    
	@pageNo INT, 		
	@recordType VARCHAR(MAX)=null
	)
As
BEGIN
	DECLARE @SQL VARCHAR(MAX),
	@pageTop INT,
	@pageBottom INT,
	@Q VARCHAR(MAX)		     
	IF (@orderBy = '')		SET     @orderBy = 'FranchiseName ASC'; 
	

	If(@recordType<>'Excel') 	
	SET @SQL = 'SELECT A.ID,		
		Isnull(A.LASTNAME,'''') as LastName,Isnull(A.FIRSTNAME,'''') as FirstName,
		Isnull(A.NAME,'''') AS FranchiseName,				
	--Updated by Andy Darling on 12/19/2013 to change to WORK email address	
			Isnull(A.WorkEmail,'''') as PrimaryOfficeEmail,
			ISNULL(A.OFFICEPHONE,'''') AS ContactNumber,
			CASE WHEN (Convert(varchar(12),A.LASTCREATEDDATE,101)=''01/01/1900'' OR A.LASTCREATEDDATE=NULL) THEN NULL ELSE Convert(varchar(12),A.LASTCREATEDDATE,101) END as LastUpdated
		FROM DBO.TBL_FRANCHISEE A						
		where a.IsMktgCommittee =1 and a.IsActive = 1 and
		(A.WorkEmail is null or Upper(A.WorkEmail) != ''SANDLERSPM@MINEDSYSTEMS.COM'')';	
	ELSE
	SET @SQL = '
	SELECT 		
		Isnull(A.LASTNAME,'''') as LastName,Isnull(A.FIRSTNAME,'''') as FirstName,	
		Isnull(A.NAME,'''') AS FranchiseName,				
	--Updated by Andy Darling on 12/19/2013 to change to WORK email address	
			Isnull(A.WorkEmail,'''') as PrimaryOfficeEmail,
			ISNULL(A.OFFICEPHONE,'''') AS ContactNumber,
			CASE WHEN (Convert(varchar(12),A.LASTCREATEDDATE,101)=''01/01/1900'' OR A.LASTCREATEDDATE=NULL) THEN NULL ELSE Convert(varchar(12),A.LASTCREATEDDATE,101) END as LastUpdated,			
			i.UserName as LastUpdatedBy
			FROM DBO.TBL_FRANCHISEE A
		LEFT JOIN DBO.TBL_COACH B ON A.COACHID = B.ID	
		Left Join dbo.TBL_COUNTRY C on A.CountryID=c.ID
		Left Join dbo.TBL_State D on a.WorkStateId = D.Id
		Left Join dbo.TBL_COUNTRY E on A.CountryID=E.ID
		Left Join dbo.TBL_State F on a.WorkStateId = F.Id
		Left Join dbo.TBL_COUNTRY G on A.CountryID=G.ID
		left join dbo.TBL_REGION H on b.RegionID = h.ID
		left join dbo.aspnet_Users I on a.LastUpdatedBy =i.UserId
		left join dbo.aspnet_Users J on a.CreatedBy =J.UserId
		left join dbo.Tbl_SandlerRole K on a.SandlerRoleId=k.SandlerRoleId
		left join dbo.Tbl_AwardLevel L on a.AwardLevelId=l.AwardLevelId
		left join dbo.Tbl_PurchaseLevel M on a.PurchaseLevelId = m.PurchaseLevelId
		left join dbo.Tbl_CertifiedLevel N on a.CertifiedLevelId = n.CertifiedLevelId
		left join dbo.Tbl_CostPlusAmount P on a.CostPlusAmountId=p.CostPlusAmountId
		left join dbo.tbl_BehindAmount Q on a.BehindAmountId=Q.BehindAmountId
		where a.IsMktgCommittee =1 and a.IsActive = 1 and
		(A.WorkEmail is null or Upper(A.WorkEmail) != ''SANDLERSPM@MINEDSYSTEMS.COM'')';
	
	
	If @pageNo > 0 AND @pageSize > 0
	BEGIN	   
		SET @pageNo = @pageNo - 1    
		SET @pageTop = (@pageNo * @pageSize) + 1  
		SET @pageBottom = (@pageNo * @pageSize) + @pageSize
	END	     
	--Casting to int is required in followinf select clause
	--Look for this article
	--http://mythicalcode.com/2013/10/30/the-specified-cast-from-a-materialized-system-int64-type-to-the-system-int32-type-is-not-valid/
	SET @SQL = 'SELECT ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowIndex, _MYQ.* FROM ('+@SQL+') _MYQ'
	SET @Q = '
		WITH CTE_pageResult AS (' + CHAR(13) + @SQL + CHAR(13) + ')'
		+'
		SELECT
				(SELECT cast(COUNT(*) as int)  FROM CTE_pageResult) AS TotalCount, * ';	
	SET @Q = @Q + '	 FROM CTE_pageResult';
	IF @pageTop > 0 
	BEGIN 
		SET @Q = @Q + ' WHERE RowIndex BETWEEN ' + CAST(@pageTop AS VARCHAR(10)) + ' AND ' + CAST(@pageBottom AS VARCHAR(10))
	END
	
	PRINT @Q
	EXEC (@Q)	    
END


GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportmsrbyadvboard]    Script Date: 03/11/2014 22:31:01 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


Create Procedure [dbo].[sp_GetHomeOfficeReportmsrbyadvboard](
	@orderBy VARCHAR(MAX),  -- Required 
	@pageSize INT,    
	@pageNo INT, 		
	@recordType VARCHAR(MAX)=null
	)
As
BEGIN
	DECLARE @SQL VARCHAR(MAX),
	@pageTop INT,
	@pageBottom INT,
	@Q VARCHAR(MAX)		     
	IF (@orderBy = '')
		SET @orderBy = 'FranchiseName ASC'; 
	

	If(@recordType<>'Excel') 	
	SET @SQL = 'SELECT A.ID,		
		Isnull(A.LASTNAME,'''') as LastName,Isnull(A.FIRSTNAME,'''') as FirstName,	
		Isnull(A.NAME,'''') AS FranchiseName,				
	--Updated by Andy Darling on 12/19/2013 to change to WORK email address	
			Isnull(A.WorkEmail,'''') as PrimaryOfficeEmail,
			ISNULL(A.OFFICEPHONE,'''') AS ContactNumber,
			CASE WHEN (Convert(varchar(12),A.LASTCREATEDDATE,101)=''01/01/1900'' OR A.LASTCREATEDDATE=NULL) THEN NULL ELSE Convert(varchar(12),A.LASTCREATEDDATE,101) END as LastUpdated
		FROM DBO.TBL_FRANCHISEE A						
		where a.IsAdvBoard =1 and a.IsActive = 1 and
		(A.WorkEmail is null or Upper(A.WorkEmail) != ''SANDLERSPM@MINEDSYSTEMS.COM'')';	
	ELSE
	SET @SQL = '
	SELECT 		
		Isnull(A.LASTNAME,'''') as LastName,Isnull(A.FIRSTNAME,'''') as FirstName,	
Isnull(A.NAME,'''') AS FranchiseName,		
	--Updated by Andy Darling on 12/19/2013 to change to WORK email address	
			Isnull(A.WorkEmail,'''') as PrimaryOfficeEmail,
			ISNULL(A.OFFICEPHONE,'''') AS ContactNumber,
			CASE WHEN (Convert(varchar(12),A.LASTCREATEDDATE,101)=''01/01/1900'' OR A.LASTCREATEDDATE=NULL) THEN NULL ELSE Convert(varchar(12),A.LASTCREATEDDATE,101) END as LastUpdated,				
			i.UserName as LastUpdatedBy
			FROM DBO.TBL_FRANCHISEE A
		LEFT JOIN DBO.TBL_COACH B ON A.COACHID = B.ID	
		Left Join dbo.TBL_COUNTRY C on A.CountryID=c.ID
		Left Join dbo.TBL_State D on a.WorkStateId = D.Id
		Left Join dbo.TBL_COUNTRY E on A.CountryID=E.ID
		Left Join dbo.TBL_State F on a.WorkStateId = F.Id
		Left Join dbo.TBL_COUNTRY G on A.CountryID=G.ID
		left join dbo.TBL_REGION H on b.RegionID = h.ID
		left join dbo.aspnet_Users I on a.LastUpdatedBy =i.UserId
		left join dbo.aspnet_Users J on a.CreatedBy =J.UserId
		left join dbo.Tbl_SandlerRole K on a.SandlerRoleId=k.SandlerRoleId
		left join dbo.Tbl_AwardLevel L on a.AwardLevelId=l.AwardLevelId
		left join dbo.Tbl_PurchaseLevel M on a.PurchaseLevelId = m.PurchaseLevelId
		left join dbo.Tbl_CertifiedLevel N on a.CertifiedLevelId = n.CertifiedLevelId
		left join dbo.Tbl_CostPlusAmount P on a.CostPlusAmountId=p.CostPlusAmountId
		left join dbo.tbl_BehindAmount Q on a.BehindAmountId=Q.BehindAmountId
		where a.IsAdvBoard =1 and a.IsActive = 1 and (A.WorkEmail is null or Upper(A.WorkEmail) != ''SANDLERSPM@MINEDSYSTEMS.COM'')';
	
	
	If @pageNo > 0 AND @pageSize > 0
	BEGIN	   
		SET @pageNo = @pageNo - 1    
		SET @pageTop = (@pageNo * @pageSize) + 1  
		SET @pageBottom = (@pageNo * @pageSize) + @pageSize
	END	     
	--Casting to int is required in followinf select clause
	--Look for this article
	--http://mythicalcode.com/2013/10/30/the-specified-cast-from-a-materialized-system-int64-type-to-the-system-int32-type-is-not-valid/
	SET @SQL = 'SELECT ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowIndex, _MYQ.* FROM ('+@SQL+') _MYQ'
	SET @Q = '
		WITH CTE_pageResult AS (' + CHAR(13) + @SQL + CHAR(13) + ')'
		+'
		SELECT
				(SELECT cast(COUNT(*) as int)  FROM CTE_pageResult) AS TotalCount, * ';	
	SET @Q = @Q + '	 FROM CTE_pageResult';
	IF @pageTop > 0 
	BEGIN 
		SET @Q = @Q + ' WHERE RowIndex BETWEEN ' + CAST(@pageTop AS VARCHAR(10)) + ' AND ' + CAST(@pageBottom AS VARCHAR(10))
	END
	
	PRINT @Q
	EXEC (@Q)	    
END


GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportmsrbykeyopnldr]    Script Date: 03/11/2014 22:31:01 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


Create Procedure [dbo].[sp_GetHomeOfficeReportmsrbykeyopnldr](
	@orderBy VARCHAR(MAX),  -- Required 
	@pageSize INT,    
	@pageNo INT, 		
	@recordType VARCHAR(MAX)=null
	)
As
BEGIN
	DECLARE @SQL VARCHAR(MAX),
	@pageTop INT,
	@pageBottom INT,
	@Q VARCHAR(MAX)		     
	IF (@orderBy = '')		SET     @orderBy = 'LastName ASC'; 
	

	If(@recordType<>'Excel') 	
	SET @SQL = 'SELECT A.ID,		
		Isnull(A.LASTNAME,'''') as LastName,Isnull(A.FIRSTNAME,'''') as FirstName,	
Isnull(A.NAME,'''') AS FranchiseName,	
	--Updated by Andy Darling on 12/19/2013 to change to WORK email address	
			Isnull(A.WorkEmail,'''') as PrimaryOfficeEmail,
			ISNULL(A.OFFICEPHONE,'''') AS ContactNumber,
			CASE WHEN (Convert(varchar(12),A.LASTCREATEDDATE,101)=''01/01/1900'' OR A.LASTCREATEDDATE=NULL) THEN NULL ELSE Convert(varchar(12),A.LASTCREATEDDATE,101) END as LastUpdated
		FROM DBO.TBL_FRANCHISEE A						
		where a.IsKOLMember=1 and a.IsActive = 1 and
		(A.WorkEmail is null or Upper(A.WorkEmail) != ''SANDLERSPM@MINEDSYSTEMS.COM'')';	
	ELSE
	SET @SQL = '
	SELECT 		
		Isnull(A.LASTNAME,'''') as LastName,Isnull(A.FIRSTNAME,'''') as FirstName,	
		Isnull(A.NAME,'''') AS FranchiseName,				
	--Updated by Andy Darling on 12/19/2013 to change to WORK email address	
			Isnull(A.WorkEmail,'''') as PrimaryOfficeEmail,
			ISNULL(A.OFFICEPHONE,'''') AS ContactNumber,
			CASE WHEN (Convert(varchar(12),A.LASTCREATEDDATE,101)=''01/01/1900'' OR A.LASTCREATEDDATE=NULL) THEN NULL ELSE Convert(varchar(12),A.LASTCREATEDDATE,101) END as LastUpdated,					
			i.UserName as LastUpdatedBy
			FROM DBO.TBL_FRANCHISEE A
		LEFT JOIN DBO.TBL_COACH B ON A.COACHID = B.ID	
		Left Join dbo.TBL_COUNTRY C on A.CountryID=c.ID
		Left Join dbo.TBL_State D on a.WorkStateId = D.Id
		Left Join dbo.TBL_COUNTRY E on A.CountryID=E.ID
		Left Join dbo.TBL_State F on a.WorkStateId = F.Id
		Left Join dbo.TBL_COUNTRY G on A.CountryID=G.ID
		left join dbo.TBL_REGION H on b.RegionID = h.ID
		left join dbo.aspnet_Users I on a.LastUpdatedBy =i.UserId
		left join dbo.aspnet_Users J on a.CreatedBy =J.UserId
		left join dbo.Tbl_SandlerRole K on a.SandlerRoleId=k.SandlerRoleId
		left join dbo.Tbl_AwardLevel L on a.AwardLevelId=l.AwardLevelId
		left join dbo.Tbl_PurchaseLevel M on a.PurchaseLevelId = m.PurchaseLevelId
		left join dbo.Tbl_CertifiedLevel N on a.CertifiedLevelId = n.CertifiedLevelId
		left join dbo.Tbl_CostPlusAmount P on a.CostPlusAmountId=p.CostPlusAmountId
		left join dbo.tbl_BehindAmount Q on a.BehindAmountId=Q.BehindAmountId
		where a.IsKOLMember=1 and a.IsActive = 1 and
		(A.WorkEmail is null or Upper(A.WorkEmail) != ''SANDLERSPM@MINEDSYSTEMS.COM'')';
	
	
	If @pageNo > 0 AND @pageSize > 0
	BEGIN	   
		SET @pageNo = @pageNo - 1    
		SET @pageTop = (@pageNo * @pageSize) + 1  
		SET @pageBottom = (@pageNo * @pageSize) + @pageSize
	END	     
	--Casting to int is required in followinf select clause
	--Look for this article
	--http://mythicalcode.com/2013/10/30/the-specified-cast-from-a-materialized-system-int64-type-to-the-system-int32-type-is-not-valid/
	SET @SQL = 'SELECT ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowIndex, _MYQ.* FROM ('+@SQL+') _MYQ'
	SET @Q = '
		WITH CTE_pageResult AS (' + CHAR(13) + @SQL + CHAR(13) + ')'
		+'
		SELECT
				(SELECT cast(COUNT(*) as int)  FROM CTE_pageResult) AS TotalCount, * ';	
	SET @Q = @Q + '	 FROM CTE_pageResult';
	IF @pageTop > 0 
	BEGIN 
		SET @Q = @Q + ' WHERE RowIndex BETWEEN ' + CAST(@pageTop AS VARCHAR(10)) + ' AND ' + CAST(@pageBottom AS VARCHAR(10))
	END
	
	PRINT @Q
	EXEC (@Q)	    
END


GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportmsfr]    Script Date: 03/11/2014 22:31:01 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


Create Procedure [dbo].[sp_GetHomeOfficeReportmsfr](
	@orderBy VARCHAR(MAX),  -- Required 
	@pageSize INT,    
	@pageNo INT, 		
	@recordType VARCHAR(MAX)=null
	)
As
BEGIN
	DECLARE @SQL VARCHAR(MAX),
	@pageTop INT,
	@pageBottom INT,
	@Q VARCHAR(MAX)		     
	IF (@orderBy = '')		SET     @orderBy = 'MasterFranchise ASC'; 
	

	If(@recordType<>'Excel') 	
	SET @SQL = 'SELECT A.ID,		
		B.MasterFranchiseeName AS MasterFranchise,			
		Isnull(A.NAME,'''') AS FranchiseName,
		Isnull(A.LASTNAME,'''') as LastName,Isnull(A.FIRSTNAME,'''') as FirstName,				
	--Updated by Andy Darling on 12/19/2013 to change to WORK email address	
			Isnull(A.WorkEmail,'''') as PrimaryOfficeEmail,
			ISNULL(A.OFFICEPHONE,'''') AS ContactNumber,
			CASE WHEN (Convert(varchar(12),A.LASTCREATEDDATE,101)=''01/01/1900'' OR A.LASTCREATEDDATE=NULL) THEN NULL ELSE Convert(varchar(12),A.LASTCREATEDDATE,101) END as LastUpdated
		FROM DBO.TBL_FRANCHISEE A	
		Join DBO.Tbl_MasterFranchisee B on b.MasterFranchiseeId=a.MasterFranchiseeId
		and a.SandlerRoleId in (1,3,6) and a.IsMasterFranchiseeExists =1 and a.IsActive = 1
		where a.IsActive = 1 and (A.WorkEmail is null or Upper(A.WorkEmail) != ''SANDLERSPM@MINEDSYSTEMS.COM'')';	
	ELSE
	SET @SQL = '
	SELECT 		
		AB.MasterFranchiseeName AS MasterFranchise,			
		Isnull(A.NAME,'''') AS FranchiseName,
		Isnull(A.LASTNAME,'''') as LastName,Isnull(A.FIRSTNAME,'''') as FirstName,				
	--Updated by Andy Darling on 12/19/2013 to change to WORK email address	
			Isnull(A.WorkEmail,'''') as PrimaryOfficeEmail,
			ISNULL(A.OFFICEPHONE,'''') AS ContactNumber,
			CASE WHEN (Convert(varchar(12),A.LASTCREATEDDATE,101)=''01/01/1900'' OR A.LASTCREATEDDATE=NULL) THEN NULL ELSE Convert(varchar(12),A.LASTCREATEDDATE,101) END as LastUpdated,			
			i.UserName as LastUpdatedBy
			FROM DBO.TBL_FRANCHISEE A
		Join DBO.Tbl_MasterFranchisee AB on Ab.MasterFranchiseeId=a.MasterFranchiseeId
		and a.SandlerRoleId in (1,3,6) and a.IsMasterFranchiseeExists =1 and a.IsActive = 1
		LEFT JOIN DBO.TBL_COACH B ON A.COACHID = B.ID	
		Left Join dbo.TBL_COUNTRY C on A.CountryID=c.ID
		Left Join dbo.TBL_State D on a.WorkStateId = D.Id
		Left Join dbo.TBL_COUNTRY E on A.CountryID=E.ID
		Left Join dbo.TBL_State F on a.WorkStateId = F.Id
		Left Join dbo.TBL_COUNTRY G on A.CountryID=G.ID
		left join dbo.TBL_REGION H on b.RegionID = h.ID
		left join dbo.aspnet_Users I on a.LastUpdatedBy =i.UserId
		left join dbo.aspnet_Users J on a.CreatedBy =J.UserId
		left join dbo.Tbl_SandlerRole K on a.SandlerRoleId=k.SandlerRoleId
		left join dbo.Tbl_AwardLevel L on a.AwardLevelId=l.AwardLevelId
		left join dbo.Tbl_PurchaseLevel M on a.PurchaseLevelId = m.PurchaseLevelId
		left join dbo.Tbl_CertifiedLevel N on a.CertifiedLevelId = n.CertifiedLevelId
		left join dbo.Tbl_CostPlusAmount P on a.CostPlusAmountId=p.CostPlusAmountId
		left join dbo.tbl_BehindAmount Q on a.BehindAmountId=Q.BehindAmountId
		where a.IsActive = 1 and (A.WorkEmail is null or Upper(A.WorkEmail) != ''SANDLERSPM@MINEDSYSTEMS.COM'')';
	
	
	If @pageNo > 0 AND @pageSize > 0
	BEGIN	   
		SET @pageNo = @pageNo - 1    
		SET @pageTop = (@pageNo * @pageSize) + 1  
		SET @pageBottom = (@pageNo * @pageSize) + @pageSize
	END	     
	--Casting to int is required in followinf select clause
	--Look for this article
	--http://mythicalcode.com/2013/10/30/the-specified-cast-from-a-materialized-system-int64-type-to-the-system-int32-type-is-not-valid/
	SET @SQL = 'SELECT ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowIndex, _MYQ.* FROM ('+@SQL+') _MYQ'
	SET @Q = '
		WITH CTE_pageResult AS (' + CHAR(13) + @SQL + CHAR(13) + ')'
		+'
		SELECT
				(SELECT cast(COUNT(*) as int)  FROM CTE_pageResult) AS TotalCount, * ';	
	SET @Q = @Q + '	 FROM CTE_pageResult';
	IF @pageTop > 0 
	BEGIN 
		SET @Q = @Q + ' WHERE RowIndex BETWEEN ' + CAST(@pageTop AS VARCHAR(10)) + ' AND ' + CAST(@pageBottom AS VARCHAR(10))
	END
	
	PRINT @Q
	EXEC (@Q)	    
END


GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportmfrd]    Script Date: 03/11/2014 22:31:01 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


Create Procedure [dbo].[sp_GetHomeOfficeReportmfrd](
	@orderBy VARCHAR(MAX),  -- Required 
	@pageSize INT,    
	@pageNo INT, 		
	@recordType VARCHAR(MAX)=null
	)
As
BEGIN
	DECLARE @SQL VARCHAR(MAX),
	@pageTop INT,
	@pageBottom INT,
	@Q VARCHAR(MAX)		     
	IF (@orderBy = '')		SET     @orderBy = 'MasterFranchise ASC'; 
	

	If(@recordType<>'Excel') 	
	SET @SQL = 'SELECT A.ID,		
		D.MasterFranchiseeName AS MasterFranchise,			
		Isnull(A.LASTNAME,'''') as LastName,Isnull(A.FIRSTNAME,'''') as FirstName,		
		Case when A.IsCanPrintLocally=''1'' Then ''Yes'' else ''No'' end as LocalPrint,			
	Case when A.IsBuyFromCustomer=''1'' Then ''Yes'' else ''No'' end as BuyFromSSI,			
	Case when A.IsFixedPricePurchase=''1'' Then ''Yes'' else ''No'' end as FixedPricePurchase,
	b.CostPlusAmountText as ProductCost,
	c.BehindAmountText as PercentBehind,	
		CASE WHEN (Convert(varchar(12),A.LASTCREATEDDATE,101)=''01/01/1900'' OR A.LASTCREATEDDATE=NULL) THEN NULL ELSE Convert(varchar(12),A.LASTCREATEDDATE,101) END as LastUpdated
		FROM DBO.TBL_FRANCHISEE A	
		Left Join dbo.Tbl_CostPlusAmount B on a.CostPlusAmountId=b.CostPlusAmountId
		left join dbo.Tbl_BehindAmount C on a.BehindAmountId = C.BehindAmountId
		Join DBO.Tbl_MasterFranchisee D on D.MasterFranchiseeId=a.MasterFranchiseeId
		-- Updated 10/15/2013 by Andy Darling to NOT include Role #4 (Associate)
		-- Updated 11/25/2013 by Andy Darling to NOT include any role except Master Franchisee (#1)
		where a.SandlerRoleId in (1)	and a.IsActive = 1 and
		(A.WorkEmail is null or Upper(A.WorkEmail) != ''SANDLERSPM@MINEDSYSTEMS.COM'')';	
	ELSE
	SET @SQL = '
	SELECT 		
		AB.MasterFranchiseeName AS MasterFranchise,			
		Case when A.IsCanPrintLocally=''1'' Then ''Yes'' else ''No'' end as LocalPrint,			
	Case when A.IsBuyFromCustomer=''1'' Then ''Yes'' else ''No'' end as BuyFromSSI,			
	Case when A.IsFixedPricePurchase=''1'' Then ''Yes'' else ''No'' end as FixedPricePurchase,
	p.CostPlusAmountText as ProductCost,
	q.BehindAmountText as PercentBehind,
		Isnull(A.LASTNAME,'''') as LastName,Isnull(A.FIRSTNAME,'''') as FirstName,				
	--Updated by Andy Darling on 12/19/2013 to change to WORK email address	
			Isnull(A.WorkEmail,'''') as PrimaryOfficeEmail,
			ISNULL(A.OFFICEPHONE,'''') AS ContactNumber,
			CASE WHEN (Convert(varchar(12),A.LASTCREATEDDATE,101)=''01/01/1900'' OR A.LASTCREATEDDATE=NULL) THEN NULL ELSE Convert(varchar(12),A.LASTCREATEDDATE,101) END as LastUpdated,				
			i.UserName as LastUpdatedBy
			FROM DBO.TBL_FRANCHISEE A
		-- Updated 10/15/2013 by Andy Darling to include all roles 1 thru 8 EXCEPT #4
		-- in the Export to Excel
		-- Updated 11/25/2013 by Andy Darling to have ONLY Master Franchisee appear in Excel report
		Join DBO.Tbl_MasterFranchisee AB on Ab.MasterFranchiseeId=a.MasterFranchiseeId
		and a.SandlerRoleId in (1)
		LEFT JOIN DBO.TBL_COACH B ON A.COACHID = B.ID	
		Left Join dbo.TBL_COUNTRY C on A.CountryID=c.ID
		Left Join dbo.TBL_State D on a.WorkStateId = D.Id
		Left Join dbo.TBL_COUNTRY E on A.CountryID=E.ID
		Left Join dbo.TBL_State F on a.WorkStateId = F.Id
		Left Join dbo.TBL_COUNTRY G on A.CountryID=G.ID
		left join dbo.TBL_REGION H on b.RegionID = h.ID
		left join dbo.aspnet_Users I on a.LastUpdatedBy =i.UserId
		left join dbo.aspnet_Users J on a.CreatedBy =J.UserId
		left join dbo.Tbl_SandlerRole K on a.SandlerRoleId=k.SandlerRoleId
		left join dbo.Tbl_AwardLevel L on a.AwardLevelId=l.AwardLevelId
		left join dbo.Tbl_PurchaseLevel M on a.PurchaseLevelId = m.PurchaseLevelId
		left join dbo.Tbl_CertifiedLevel N on a.CertifiedLevelId = n.CertifiedLevelId
		left join dbo.Tbl_CostPlusAmount P on a.CostPlusAmountId=p.CostPlusAmountId
		left join dbo.tbl_BehindAmount Q on a.BehindAmountId=Q.BehindAmountId
		where a.IsActive = 1 and (A.WorkEmail is null or Upper(A.WorkEmail) != ''SANDLERSPM@MINEDSYSTEMS.COM'')';
	
	
	If @pageNo > 0 AND @pageSize > 0
	BEGIN	   
		SET @pageNo = @pageNo - 1    
		SET @pageTop = (@pageNo * @pageSize) + 1  
		SET @pageBottom = (@pageNo * @pageSize) + @pageSize
	END	     
	--Casting to int is required in followinf select clause
	--Look for this article
	--http://mythicalcode.com/2013/10/30/the-specified-cast-from-a-materialized-system-int64-type-to-the-system-int32-type-is-not-valid/
	SET @SQL = 'SELECT ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowIndex, _MYQ.* FROM ('+@SQL+') _MYQ'
	SET @Q = '
		WITH CTE_pageResult AS (' + CHAR(13) + @SQL + CHAR(13) + ')'
		+'
		SELECT
				(SELECT cast(COUNT(*) as int)  FROM CTE_pageResult) AS TotalCount, * ';	
	SET @Q = @Q + '	 FROM CTE_pageResult';
	IF @pageTop > 0 
	BEGIN 
		SET @Q = @Q + ' WHERE RowIndex BETWEEN ' + CAST(@pageTop AS VARCHAR(10)) + ' AND ' + CAST(@pageBottom AS VARCHAR(10))
	END
	
	PRINT @Q
	EXEC (@Q)	    
END


GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportzcbt]    Script Date: 03/11/2014 22:31:01 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


Create Procedure [dbo].[sp_GetHomeOfficeReportzcbt](
	@orderBy VARCHAR(MAX),  -- Required 
	@pageSize INT,    
	@pageNo INT, 		
	@recordType VARCHAR(MAX)=null
	)
As
BEGIN
	DECLARE @SQL VARCHAR(MAX),
	@pageTop INT,
	@pageBottom INT,
	@Q VARCHAR(MAX)		     
	IF (@orderBy = '')		SET     @orderBy = 'Territory ASC'; 
	

	If(@recordType<>'Excel') 	
	SET @SQL = 'SELECT A.ID,		
		a.Territory,a.State,
	a.BusinessFocusArea as BusinessFocusArea,	
	a.ClosestMetroArea as ClosestMetroArea,
		a.Zip as ZipCode,
		Isnull(A.LASTNAME,'''') as LastName,Isnull(A.FIRSTNAME,'''') as FirstName,
		Isnull(A.NAME,'''') AS FranchiseName,			
	--Updated by Andy Darling on 12/19/2013 to change to WORK email address	
			Isnull(A.WorkEmail,'''') as PrimaryOfficeEmail,
			ISNULL(A.OFFICEPHONE,'''') AS ContactNumber,
			CASE WHEN (Convert(varchar(12),A.LASTCREATEDDATE,101)=''01/01/1900'' OR A.LASTCREATEDDATE=NULL) THEN NULL ELSE Convert(varchar(12),A.LASTCREATEDDATE,101) END as LastUpdated			
		FROM DBO.TBL_FRANCHISEE A
		where (A.WorkEmail is null or Upper(A.WorkEmail) != ''SANDLERSPM@MINEDSYSTEMS.COM'')	
		AND A.SandlerRoleId in (1,2,3,4,5,6,7,8) and a.IsActive = 1 
		--Updated by Andy Darling 2013-11-06 to produce ONLY when Territory is not NULL
		and a.Territory !='''' ';	
	ELSE
	SET @SQL = '
	SELECT 		
		a.Territory,a.State,
	a.BusinessFocusArea as BusinessFocusArea,	
	a.ClosestMetroArea as ClosestMetroArea,
		a.Zip as ZipCode,
		Isnull(A.LASTNAME,'''') as LastName,Isnull(A.FIRSTNAME,'''') as FirstName,		
		Isnull(A.NAME,'''') AS FranchiseName,
	--Updated by Andy Darling on 12/19/2013 to change to WORK email address	
			Isnull(A.WorkEmail,'''') as PrimaryOfficeEmail,
			ISNULL(A.OFFICEPHONE,'''') AS ContactNumber,
			CASE WHEN (Convert(varchar(12),A.LASTCREATEDDATE,101)=''01/01/1900'' OR A.LASTCREATEDDATE=NULL) THEN NULL ELSE Convert(varchar(12),A.LASTCREATEDDATE,101) END as LastUpdated,			
			i.UserName as LastUpdatedBy
			FROM DBO.TBL_FRANCHISEE A		
		Left Join dbo.TBL_COUNTRY C on A.CountryID=c.ID
		Left Join dbo.TBL_State D on a.WorkStateId = D.Id
		Left Join dbo.TBL_COUNTRY E on A.CountryID=E.ID
		Left Join dbo.TBL_State F on a.WorkStateId = F.Id
		Left Join dbo.TBL_COUNTRY G on A.CountryID=G.ID
		left join dbo.aspnet_Users I on a.LastUpdatedBy =i.UserId
		left join dbo.aspnet_Users J on a.CreatedBy =J.UserId
		left join dbo.Tbl_SandlerRole K on a.SandlerRoleId=k.SandlerRoleId
		left join dbo.Tbl_AwardLevel L on a.AwardLevelId=l.AwardLevelId
		left join dbo.Tbl_PurchaseLevel M on a.PurchaseLevelId = m.PurchaseLevelId
		left join dbo.Tbl_CertifiedLevel N on a.CertifiedLevelId = n.CertifiedLevelId
		left join dbo.Tbl_CostPlusAmount P on a.CostPlusAmountId=p.CostPlusAmountId
		left join dbo.tbl_BehindAmount Q on a.BehindAmountId=Q.BehindAmountId
		where (A.WorkEmail is null or Upper(A.WorkEmail) != ''SANDLERSPM@MINEDSYSTEMS.COM'')
		AND A.SandlerRoleId in (1,2,3,4,5,6,7,8) and a.IsActive = 1 
		--Updated by Andy Darling 2013-11-06 to produce ONLY when Territory is not NULL
		and a.Territory !=''''';
	
	
	If @pageNo > 0 AND @pageSize > 0
	BEGIN	   
		SET @pageNo = @pageNo - 1    
		SET @pageTop = (@pageNo * @pageSize) + 1  
		SET @pageBottom = (@pageNo * @pageSize) + @pageSize
	END	     
	--Casting to int is required in followinf select clause
	--Look for this article
	--http://mythicalcode.com/2013/10/30/the-specified-cast-from-a-materialized-system-int64-type-to-the-system-int32-type-is-not-valid/
	SET @SQL = 'SELECT ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowIndex, _MYQ.* FROM ('+@SQL+') _MYQ'
	SET @Q = '
		WITH CTE_pageResult AS (' + CHAR(13) + @SQL + CHAR(13) + ')'
		+'
		SELECT
				(SELECT cast(COUNT(*) as int)  FROM CTE_pageResult) AS TotalCount, * ';	
	SET @Q = @Q + '	 FROM CTE_pageResult';
	IF @pageTop > 0 
	BEGIN 
		SET @Q = @Q + ' WHERE RowIndex BETWEEN ' + CAST(@pageTop AS VARCHAR(10)) + ' AND ' + CAST(@pageBottom AS VARCHAR(10))
	END
	
	PRINT @Q
	EXEC (@Q)	    
END


GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportfrbyusingcrm]    Script Date: 03/11/2014 22:31:01 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


Create Procedure [dbo].[sp_GetHomeOfficeReportfrbyusingcrm](
	@orderBy VARCHAR(MAX),  -- Required 
	@pageSize INT,    
	@pageNo INT, 		
	@recordType VARCHAR(MAX)=null
	)
As
BEGIN
	DECLARE @SQL VARCHAR(MAX),
	@pageTop INT,
	@pageBottom INT,
	@Q VARCHAR(MAX)		     
	IF (@orderBy = '')		SET     @orderBy = 'LastName ASC'; 
	

	If(@recordType<>'Excel') 	
	SET @SQL = 'SELECT A.ID,		
		case when a.IsUsingSandlerCRM=1 then ''Yes'' else ''No'' end as UsingCRM,			
		Isnull(A.LASTNAME,'''') as LastName,Isnull(A.FIRSTNAME,'''') as FirstName,
Isnull(A.NAME,'''') AS FranchiseName,		
	--Updated by Andy Darling on 12/19/2013 to change to WORK email address	
			Isnull(A.WorkEmail,'''') as PrimaryOfficeEmail,
			ISNULL(A.OFFICEPHONE,'''') AS ContactNumber,
			CASE WHEN (Convert(varchar(12),A.LASTCREATEDDATE,101)=''01/01/1900'' OR A.LASTCREATEDDATE=NULL) THEN NULL ELSE Convert(varchar(12),A.LASTCREATEDDATE,101) END as LastUpdated
		FROM DBO.TBL_FRANCHISEE A
		where (A.WorkEmail is null or Upper(A.WorkEmail) != ''SANDLERSPM@MINEDSYSTEMS.COM'')						
		AND A.SandlerRoleId in (1,2,3,4,5,6,7,8) and a.IsActive = 1
		--Updated by Andy Darling 2013-11-06 to filter ONLY when Using CRM = 1 (Yes)
		and a.IsUsingSandlerCRM = 1';	
	ELSE
	SET @SQL = '
	SELECT 		
		case when a.IsUsingSandlerCRM=1 then ''Yes'' else ''No'' end as UsingCRM,		
		Isnull(A.LASTNAME,'''') as LastName,Isnull(A.FIRSTNAME,'''') as FirstName,
Isnull(A.NAME,'''') AS FranchiseName,		
	--Updated by Andy Darling on 12/19/2013 to change to WORK email address	
			Isnull(A.WorkEmail,'''') as PrimaryOfficeEmail,
			ISNULL(A.OFFICEPHONE,'''') AS ContactNumber,
			CASE WHEN (Convert(varchar(12),A.LASTCREATEDDATE,101)=''01/01/1900'' OR A.LASTCREATEDDATE=NULL) THEN NULL ELSE Convert(varchar(12),A.LASTCREATEDDATE,101) END as LastUpdated,			
			i.UserName as LastUpdatedBy
			FROM DBO.TBL_FRANCHISEE A
		LEFT JOIN DBO.TBL_COACH B ON A.COACHID = B.ID	
		Left Join dbo.TBL_COUNTRY C on A.CountryID=c.ID
		Left Join dbo.TBL_State D on a.WorkStateId = D.Id
		Left Join dbo.TBL_COUNTRY E on A.CountryID=E.ID
		Left Join dbo.TBL_State F on a.WorkStateId = F.Id
		Left Join dbo.TBL_COUNTRY G on A.CountryID=G.ID
		left join dbo.TBL_REGION H on b.RegionID = h.ID
		left join dbo.aspnet_Users I on a.LastUpdatedBy =i.UserId
		left join dbo.aspnet_Users J on a.CreatedBy =J.UserId
		left join dbo.Tbl_SandlerRole K on a.SandlerRoleId=k.SandlerRoleId
		left join dbo.Tbl_AwardLevel L on a.AwardLevelId=l.AwardLevelId
		left join dbo.Tbl_PurchaseLevel M on a.PurchaseLevelId = m.PurchaseLevelId
		left join dbo.Tbl_CertifiedLevel N on a.CertifiedLevelId = n.CertifiedLevelId
		left join dbo.Tbl_CostPlusAmount P on a.CostPlusAmountId=p.CostPlusAmountId
		left join dbo.tbl_BehindAmount Q on a.BehindAmountId=Q.BehindAmountId
		where (A.WorkEmail is null or Upper(A.WorkEmail) != ''SANDLERSPM@MINEDSYSTEMS.COM'')	
		AND A.SandlerRoleId in (1,2,3,4,5,6,7,8) and a.IsActive = 1
		--Updated by Andy Darling 2013-11-06 to filter ONLY when Using CRM = 1 (Yes)
		and a.IsUsingSandlerCRM = 1';
	
	
	If @pageNo > 0 AND @pageSize > 0
	BEGIN	   
		SET @pageNo = @pageNo - 1    
		SET @pageTop = (@pageNo * @pageSize) + 1  
		SET @pageBottom = (@pageNo * @pageSize) + @pageSize
	END	     
	--Casting to int is required in followinf select clause
	--Look for this article
	--http://mythicalcode.com/2013/10/30/the-specified-cast-from-a-materialized-system-int64-type-to-the-system-int32-type-is-not-valid/
	SET @SQL = 'SELECT ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowIndex, _MYQ.* FROM ('+@SQL+') _MYQ'
	SET @Q = '
		WITH CTE_pageResult AS (' + CHAR(13) + @SQL + CHAR(13) + ')'
		+'
		SELECT
				(SELECT cast(COUNT(*) as int)  FROM CTE_pageResult) AS TotalCount, * ';	
	SET @Q = @Q + '	 FROM CTE_pageResult';
	IF @pageTop > 0 
	BEGIN 
		SET @Q = @Q + ' WHERE RowIndex BETWEEN ' + CAST(@pageTop AS VARCHAR(10)) + ' AND ' + CAST(@pageBottom AS VARCHAR(10))
	END
	
	PRINT @Q
	EXEC (@Q)	    
END


GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportfrbystate]    Script Date: 03/11/2014 22:31:01 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


Create Procedure [dbo].[sp_GetHomeOfficeReportfrbystate](
	@orderBy VARCHAR(MAX),  -- Required 
	@pageSize INT,    
	@pageNo INT, 		
	@recordType VARCHAR(MAX)=null
	)
As
BEGIN
	DECLARE @SQL VARCHAR(MAX),
	@pageTop INT,
	@pageBottom INT,
	@Q VARCHAR(MAX)		     
	IF (@orderBy = '')		SET     @orderBy = 'State ASC'; 
	

	If(@recordType<>'Excel') 	
	SET @SQL = 'SELECT A.ID,		
		a.State,		
		Isnull(A.LASTNAME,'''') as LastName,Isnull(A.FIRSTNAME,'''') as FirstName,
Isnull(A.NAME,'''') AS FranchiseName,						
	--Updated by Andy Darling on 12/19/2013 to change to WORK email address	
			Isnull(A.WorkEmail,'''') as PrimaryOfficeEmail,
			ISNULL(A.OFFICEPHONE,'''') AS ContactNumber,
			CASE WHEN (Convert(varchar(12),A.LASTCREATEDDATE,101)=''01/01/1900'' OR A.LASTCREATEDDATE=NULL) THEN NULL ELSE Convert(varchar(12),A.LASTCREATEDDATE,101) END as LastUpdated
		FROM DBO.TBL_FRANCHISEE A	
		Left Join dbo.TBL_COUNTRY B on A.CountryID=B.ID
		where (A.WorkEmail is null or Upper(A.WorkEmail) != ''SANDLERSPM@MINEDSYSTEMS.COM'')
		-- Updated by Andy Darling 2013-10-30 to filter out where State = "Intl" so that
		-- this report ONLY shows US and Canada Franchisees
		AND A.SandlerRoleId in (1,2,3,4,5,6,7,8) and a.IsActive = 1 and a.State !=''Intl''';	
	ELSE
	SET @SQL = '
	SELECT 		
		a.State,			
		Isnull(A.LASTNAME,'''') as LastName,Isnull(A.FIRSTNAME,'''') as FirstName,
	Isnull(A.NAME,'''') AS FranchiseName,			
	--Updated by Andy Darling on 12/19/2013 to change to WORK email address	
			Isnull(A.WorkEmail,'''') as PrimaryOfficeEmail,
			ISNULL(A.OFFICEPHONE,'''') AS ContactNumber,
			CASE WHEN (Convert(varchar(12),A.LASTCREATEDDATE,101)=''01/01/1900'' OR A.LASTCREATEDDATE=NULL) THEN NULL ELSE Convert(varchar(12),A.LASTCREATEDDATE,101) END as LastUpdated,			
			i.UserName as LastUpdatedBy
			FROM DBO.TBL_FRANCHISEE A
		LEFT JOIN DBO.TBL_COACH B ON A.COACHID = B.ID	
		Left Join dbo.TBL_COUNTRY C on A.CountryID=c.ID
		Left Join dbo.TBL_State D on a.WorkStateId = D.Id
		Left Join dbo.TBL_COUNTRY E on A.CountryID=E.ID
		Left Join dbo.TBL_State F on a.WorkStateId = F.Id
		Left Join dbo.TBL_COUNTRY G on A.CountryID=G.ID
		left join dbo.TBL_REGION H on b.RegionID = h.ID
		left join dbo.aspnet_Users I on a.LastUpdatedBy =i.UserId
		left join dbo.aspnet_Users J on a.CreatedBy =J.UserId
		left join dbo.Tbl_SandlerRole K on a.SandlerRoleId=k.SandlerRoleId
		left join dbo.Tbl_AwardLevel L on a.AwardLevelId=l.AwardLevelId
		left join dbo.Tbl_PurchaseLevel M on a.PurchaseLevelId = m.PurchaseLevelId
		left join dbo.Tbl_CertifiedLevel N on a.CertifiedLevelId = n.CertifiedLevelId
		left join dbo.Tbl_CostPlusAmount P on a.CostPlusAmountId=p.CostPlusAmountId
		left join dbo.tbl_BehindAmount Q on a.BehindAmountId=Q.BehindAmountId
		where (A.WorkEmail is null or Upper(A.WorkEmail) != ''SANDLERSPM@MINEDSYSTEMS.COM'')	
		-- Updated by Andy Darling 2013-11-06 to filter out where State = "Intl" so that
		-- this report ONLY shows US and Canada Franchisees	
		AND A.SandlerRoleId in (1,2,3,4,5,6,7,8) and a.IsActive = 1 and a.State !=''Intl''';
	
	
	If @pageNo > 0 AND @pageSize > 0
	BEGIN	   
		SET @pageNo = @pageNo - 1    
		SET @pageTop = (@pageNo * @pageSize) + 1  
		SET @pageBottom = (@pageNo * @pageSize) + @pageSize
	END	     
	--Casting to int is required in followinf select clause
	--Look for this article
	--http://mythicalcode.com/2013/10/30/the-specified-cast-from-a-materialized-system-int64-type-to-the-system-int32-type-is-not-valid/
	SET @SQL = 'SELECT ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowIndex, _MYQ.* FROM ('+@SQL+') _MYQ'
	SET @Q = '
		WITH CTE_pageResult AS (' + CHAR(13) + @SQL + CHAR(13) + ')'
		+'
		SELECT
				(SELECT cast(COUNT(*) as int)  FROM CTE_pageResult) AS TotalCount, * ';	
	SET @Q = @Q + '	 FROM CTE_pageResult';
	IF @pageTop > 0 
	BEGIN 
		SET @Q = @Q + ' WHERE RowIndex BETWEEN ' + CAST(@pageTop AS VARCHAR(10)) + ' AND ' + CAST(@pageBottom AS VARCHAR(10))
	END
	
	PRINT @Q
	EXEC (@Q)	    
END


GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportsere]    Script Date: 03/11/2014 22:31:01 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


Create Procedure [dbo].[sp_GetHomeOfficeReportsere](
	@orderBy VARCHAR(MAX),  -- Required 
	@pageSize INT,    
	@pageNo INT, 		
	@recordType VARCHAR(MAX)=null
	)
As
BEGIN
	DECLARE @SQL VARCHAR(MAX),
	@pageTop INT,
	@pageBottom INT,
	@Q VARCHAR(MAX)		     
	IF (@orderBy = '')		SET     @orderBy = 'LastName ASC'; 
	

	If(@recordType<>'Excel') 	
	SET @SQL = 'SELECT A.ID,		
		case when IsSandlerMailRequired=1 then ''Yes'' else ''No'' end as EMailRequired,
		Isnull(A.LASTNAME,'''') as LastName,Isnull(A.FIRSTNAME,'''') as FirstName,	
		Isnull(A.NAME,'''') AS FranchiseName,				
	--Updated by Andy Darling on 12/19/2013 to change to WORK email address	
			Isnull(A.WorkEmail,'''') as PrimaryOfficeEmail,
			ISNULL(A.OFFICEPHONE,'''') AS ContactNumber,
			CASE WHEN (Convert(varchar(12),A.LASTCREATEDDATE,101)=''01/01/1900'' OR A.LASTCREATEDDATE=NULL) THEN NULL ELSE Convert(varchar(12),A.LASTCREATEDDATE,101) END as LastUpdated
		FROM DBO.TBL_FRANCHISEE A 
		where (A.WorkEmail is null or Upper(A.WorkEmail) != ''SANDLERSPM@MINEDSYSTEMS.COM'')						
		AND A.SandlerRoleId in (1,2,3,4,5,6,7,8) and a.IsActive = 1 
		--Updated by Andy Darling 2013-11-06 to ONLY produce when SandlerMail is required
		and a.IsSandlerMailRequired=1';	
	ELSE
	SET @SQL = '
	SELECT 		
		case when IsSandlerMailRequired=1 then ''Yes'' else ''No'' end as EMailRequired,
		Isnull(A.LASTNAME,'''') as LastName,Isnull(A.FIRSTNAME,'''') as FirstName,
		Isnull(A.NAME,'''') AS FranchiseName,				
	--Updated by Andy Darling on 12/19/2013 to change to WORK email address	
			Isnull(A.WorkEmail,'''') as PrimaryOfficeEmail,
			ISNULL(A.OFFICEPHONE,'''') AS ContactNumber,
			CASE WHEN (Convert(varchar(12),A.LASTCREATEDDATE,101)=''01/01/1900'' OR A.LASTCREATEDDATE=NULL) THEN NULL ELSE Convert(varchar(12),A.LASTCREATEDDATE,101) END as LastUpdated,			
			i.UserName as LastUpdatedBy
			FROM DBO.TBL_FRANCHISEE A
		LEFT JOIN DBO.TBL_COACH B ON A.COACHID = B.ID	
		Left Join dbo.TBL_COUNTRY C on A.CountryID=c.ID
		Left Join dbo.TBL_State D on a.WorkStateId = D.Id
		Left Join dbo.TBL_COUNTRY E on A.CountryID=E.ID
		Left Join dbo.TBL_State F on a.WorkStateId = F.Id
		Left Join dbo.TBL_COUNTRY G on A.CountryID=G.ID
		left join dbo.TBL_REGION H on b.RegionID = h.ID
		left join dbo.aspnet_Users I on a.LastUpdatedBy =i.UserId
		left join dbo.aspnet_Users J on a.CreatedBy =J.UserId
		left join dbo.Tbl_SandlerRole K on a.SandlerRoleId=k.SandlerRoleId
		left join dbo.Tbl_AwardLevel L on a.AwardLevelId=l.AwardLevelId
		left join dbo.Tbl_PurchaseLevel M on a.PurchaseLevelId = m.PurchaseLevelId
		left join dbo.Tbl_CertifiedLevel N on a.CertifiedLevelId = n.CertifiedLevelId
		left join dbo.Tbl_CostPlusAmount P on a.CostPlusAmountId=p.CostPlusAmountId
		left join dbo.tbl_BehindAmount Q on a.BehindAmountId=Q.BehindAmountId
		where (A.WorkEmail is null or Upper(A.WorkEmail) != ''SANDLERSPM@MINEDSYSTEMS.COM'')
		AND A.SandlerRoleId in (1,2,3,4,5,6,7,8) and a.IsActive = 1 
		--Updated by Andy Darling 2013-11-06 to produce ONLY when SandlerMail is required
		and a.IsSandlerMailRequired=1';
	
	
	If @pageNo > 0 AND @pageSize > 0
	BEGIN	   
		SET @pageNo = @pageNo - 1    
		SET @pageTop = (@pageNo * @pageSize) + 1  
		SET @pageBottom = (@pageNo * @pageSize) + @pageSize
	END	     
	--Casting to int is required in followinf select clause
	--Look for this article
	--http://mythicalcode.com/2013/10/30/the-specified-cast-from-a-materialized-system-int64-type-to-the-system-int32-type-is-not-valid/
	SET @SQL = 'SELECT ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowIndex, _MYQ.* FROM ('+@SQL+') _MYQ'
	SET @Q = '
		WITH CTE_pageResult AS (' + CHAR(13) + @SQL + CHAR(13) + ')'
		+'
		SELECT
				(SELECT cast(COUNT(*) as int)  FROM CTE_pageResult) AS TotalCount, * ';	
	SET @Q = @Q + '	 FROM CTE_pageResult';
	IF @pageTop > 0 
	BEGIN 
		SET @Q = @Q + ' WHERE RowIndex BETWEEN ' + CAST(@pageTop AS VARCHAR(10)) + ' AND ' + CAST(@pageBottom AS VARCHAR(10))
	END
	
	PRINT @Q
	EXEC (@Q)	    
END


GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportfrbyregion]    Script Date: 03/11/2014 22:31:01 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


Create Procedure [dbo].[sp_GetHomeOfficeReportfrbyregion](
	@orderBy VARCHAR(MAX),  -- Required 
	@pageSize INT,    
	@pageNo INT, 		
	@recordType VARCHAR(MAX)=null
	)
As
BEGIN
	DECLARE @SQL VARCHAR(MAX),
	@pageTop INT,
	@pageBottom INT,
	@Q VARCHAR(MAX)		     
	IF (@orderBy = '')		SET     @orderBy = 'RegionID ASC'; 
	

	If(@recordType<>'Excel') 	
	SET @SQL = 'SELECT A.ID,		
		c.Name as Region,c.ID as RegionID,		
		Isnull(A.LASTNAME,'''') as LastName,Isnull(A.FIRSTNAME,'''') as FirstName,
Isnull(A.NAME,'''') AS FranchiseName,						
	--Updated by Andy Darling on 12/19/2013 to change to WORK email address	
			Isnull(A.WorkEmail,'''') as PrimaryOfficeEmail,
			ISNULL(A.OFFICEPHONE,'''') AS ContactNumber,
			CASE WHEN (Convert(varchar(12),A.LASTCREATEDDATE,101)=''01/01/1900'' OR A.LASTCREATEDDATE=NULL) THEN NULL ELSE Convert(varchar(12),A.LASTCREATEDDATE,101) END as LastUpdated
		FROM DBO.TBL_FRANCHISEE A	
		JOIN DBO.TBL_COACH B ON A.COACHID = B.ID	
		join dbo.TBL_REGION C on b.RegionID=c.ID
		where (A.WorkEmail is null or Upper(A.WorkEmail) != ''SANDLERSPM@MINEDSYSTEMS.COM'')
		AND A.SandlerRoleId in (1,2,3,4,5,6,7,8) and a.IsActive = 1';	
	ELSE
	SET @SQL = '
	SELECT 	h.ID as RegionID,
		h.name as Region,					
		Isnull(A.LASTNAME,'''') as LastName,Isnull(A.FIRSTNAME,'''') as FirstName,
Isnull(A.NAME,'''') AS FranchiseName,		
	--Updated by Andy Darling on 12/19/2013 to change to WORK email address	
			Isnull(A.WorkEmail,'''') as PrimaryOfficeEmail,
			ISNULL(A.OFFICEPHONE,'''') AS ContactNumber,
			CASE WHEN (Convert(varchar(12),A.LASTCREATEDDATE,101)=''01/01/1900'' OR A.LASTCREATEDDATE=NULL) THEN NULL ELSE Convert(varchar(12),A.LASTCREATEDDATE,101) END as LastUpdated,	
			i.UserName as LastUpdatedBy
			FROM DBO.TBL_FRANCHISEE A
		LEFT JOIN DBO.TBL_COACH B ON A.COACHID = B.ID	
		Left Join dbo.TBL_COUNTRY C on A.CountryID=c.ID
		Left Join dbo.TBL_State D on a.WorkStateId = D.Id
		Left Join dbo.TBL_COUNTRY E on A.CountryID=E.ID
		Left Join dbo.TBL_State F on a.WorkStateId = F.Id
		Left Join dbo.TBL_COUNTRY G on A.CountryID=G.ID
		left join dbo.TBL_REGION H on b.RegionID = h.ID
		left join dbo.aspnet_Users I on a.LastUpdatedBy =i.UserId
		left join dbo.aspnet_Users J on a.CreatedBy =J.UserId
		left join dbo.Tbl_SandlerRole K on a.SandlerRoleId=k.SandlerRoleId
		left join dbo.Tbl_AwardLevel L on a.AwardLevelId=l.AwardLevelId
		left join dbo.Tbl_PurchaseLevel M on a.PurchaseLevelId = m.PurchaseLevelId
		left join dbo.Tbl_CertifiedLevel N on a.CertifiedLevelId = n.CertifiedLevelId
		left join dbo.Tbl_CostPlusAmount P on a.CostPlusAmountId=p.CostPlusAmountId
		left join dbo.tbl_BehindAmount Q on a.BehindAmountId=Q.BehindAmountId
		where (A.WorkEmail is null or Upper(A.WorkEmail) != ''SANDLERSPM@MINEDSYSTEMS.COM'')		
		AND A.SandlerRoleId in (1,2,3,4,5,6,7,8) and a.IsActive = 1';
	
	
	If @pageNo > 0 AND @pageSize > 0
	BEGIN	   
		SET @pageNo = @pageNo - 1    
		SET @pageTop = (@pageNo * @pageSize) + 1  
		SET @pageBottom = (@pageNo * @pageSize) + @pageSize
	END	     
	--Casting to int is required in followinf select clause
	--Look for this article
	--http://mythicalcode.com/2013/10/30/the-specified-cast-from-a-materialized-system-int64-type-to-the-system-int32-type-is-not-valid/
	SET @SQL = 'SELECT ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowIndex, _MYQ.* FROM ('+@SQL+') _MYQ'
	SET @Q = '
		WITH CTE_pageResult AS (' + CHAR(13) + @SQL + CHAR(13) + ')'
		+'
		SELECT
				(SELECT cast(COUNT(*) as int)  FROM CTE_pageResult) AS TotalCount, * ';	
	SET @Q = @Q + '	 FROM CTE_pageResult';
	IF @pageTop > 0 
	BEGIN 
		SET @Q = @Q + ' WHERE RowIndex BETWEEN ' + CAST(@pageTop AS VARCHAR(10)) + ' AND ' + CAST(@pageBottom AS VARCHAR(10))
	END
	
	PRINT @Q
	EXEC (@Q)	    
END


GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportprpl]    Script Date: 03/11/2014 22:31:01 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


Create Procedure [dbo].[sp_GetHomeOfficeReportprpl](
	@orderBy VARCHAR(MAX),  -- Required 
	@pageSize INT,    
	@pageNo INT, 		
	@recordType VARCHAR(MAX)=null
	)
As
BEGIN
	DECLARE @SQL VARCHAR(MAX),
	@pageTop INT,
	@pageBottom INT,
	@Q VARCHAR(MAX)		     
	IF (@orderBy = '')		SET     @orderBy = 'ProductLevel ASC'; 
	

	If(@recordType<>'Excel') 	
	SET @SQL = 'SELECT A.ID,	
	b.PurchaseLevelText as ProductLevel,			
		Isnull(A.LASTNAME,'''') as LastName,Isnull(A.FIRSTNAME,'''') as FirstName,	
Isnull(A.NAME,'''') AS FranchiseName,		
	--Updated by Andy Darling on 12/19/2013 to change to WORK email address	
			Isnull(A.WorkEmail,'''') as PrimaryOfficeEmail,
			ISNULL(A.OFFICEPHONE,'''') AS ContactNumber,
			CASE WHEN (Convert(varchar(12),A.LASTCREATEDDATE,101)=''01/01/1900'' OR A.LASTCREATEDDATE=NULL) THEN NULL ELSE Convert(varchar(12),A.LASTCREATEDDATE,101) END as LastUpdated
		FROM DBO.TBL_FRANCHISEE A	
		left join dbo.Tbl_PurchaseLevel B on a.PurchaseLevelId = B.PurchaseLevelId
		where (A.WorkEmail is null or Upper(A.WorkEmail) != ''SANDLERSPM@MINEDSYSTEMS.COM'')
		AND A.SandlerRoleId in (1,2,3,4,5,6,7,8) and a.IsActive = 1 
--Updated by Andy Darling on 12/19/2013 to filter out when Product Purchase Level = NULL
		and a.PurchaseLevelId is not null';	
	ELSE
	SET @SQL = '
	SELECT 	
		M.PurchaseLevelText as ProductLevel,		
		Isnull(A.LASTNAME,'''') as LastName,Isnull(A.FIRSTNAME,'''') as FirstName,	
	Isnull(A.NAME,'''') AS FranchiseName,	
	--Updated by Andy Darling on 12/19/2013 to change to WORK email address	
			Isnull(A.WorkEmail,'''') as PrimaryOfficeEmail,
			ISNULL(A.OFFICEPHONE,'''') AS ContactNumber,
			CASE WHEN (Convert(varchar(12),A.LASTCREATEDDATE,101)=''01/01/1900'' OR A.LASTCREATEDDATE=NULL) THEN NULL ELSE Convert(varchar(12),A.LASTCREATEDDATE,101) END as LastUpdated,			
			i.UserName as LastUpdatedBy
			FROM DBO.TBL_FRANCHISEE A
		LEFT JOIN DBO.TBL_COACH B ON A.COACHID = B.ID	
		Left Join dbo.TBL_COUNTRY C on A.CountryID=c.ID
		Left Join dbo.TBL_State D on a.WorkStateId = D.Id
		Left Join dbo.TBL_COUNTRY E on A.CountryID=E.ID
		Left Join dbo.TBL_State F on a.WorkStateId = F.Id
		Left Join dbo.TBL_COUNTRY G on A.CountryID=G.ID
		left join dbo.TBL_REGION H on b.RegionID = h.ID
		left join dbo.aspnet_Users I on a.LastUpdatedBy =i.UserId
		left join dbo.aspnet_Users J on a.CreatedBy =J.UserId
		left join dbo.Tbl_SandlerRole K on a.SandlerRoleId=k.SandlerRoleId
		left join dbo.Tbl_AwardLevel L on a.AwardLevelId=l.AwardLevelId
		left join dbo.Tbl_PurchaseLevel M on a.PurchaseLevelId = m.PurchaseLevelId
		left join dbo.Tbl_CertifiedLevel N on a.CertifiedLevelId = n.CertifiedLevelId
		left join dbo.Tbl_CostPlusAmount P on a.CostPlusAmountId=p.CostPlusAmountId
		left join dbo.tbl_BehindAmount Q on a.BehindAmountId=Q.BehindAmountId
		where (A.WorkEmail is null or Upper(A.WorkEmail) != ''SANDLERSPM@MINEDSYSTEMS.COM'')
		AND A.SandlerRoleId in (1,2,3,4,5,6,7,8) and a.IsActive = 1 
--Updated by Andy Darling on 12/19/2013 to filter out when Product Purchase Level = NULL
		and a.PurchaseLevelId is not null';
	
	
	If @pageNo > 0 AND @pageSize > 0
	BEGIN	   
		SET @pageNo = @pageNo - 1    
		SET @pageTop = (@pageNo * @pageSize) + 1  
		SET @pageBottom = (@pageNo * @pageSize) + @pageSize
	END	     
	--Casting to int is required in followinf select clause
	--Look for this article
	--http://mythicalcode.com/2013/10/30/the-specified-cast-from-a-materialized-system-int64-type-to-the-system-int32-type-is-not-valid/
	SET @SQL = 'SELECT ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowIndex, _MYQ.* FROM ('+@SQL+') _MYQ'
	SET @Q = '
		WITH CTE_pageResult AS (' + CHAR(13) + @SQL + CHAR(13) + ')'
		+'
		SELECT
				(SELECT cast(COUNT(*) as int)  FROM CTE_pageResult) AS TotalCount, * ';	
	SET @Q = @Q + '	 FROM CTE_pageResult';
	IF @pageTop > 0 
	BEGIN 
		SET @Q = @Q + ' WHERE RowIndex BETWEEN ' + CAST(@pageTop AS VARCHAR(10)) + ' AND ' + CAST(@pageBottom AS VARCHAR(10))
	END
	
	PRINT @Q
	EXEC (@Q)	    
END


GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportmsfc]    Script Date: 03/11/2014 22:31:01 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


Create Procedure [dbo].[sp_GetHomeOfficeReportmsfc](
	@orderBy VARCHAR(MAX),  -- Required 
	@pageSize INT,    
	@pageNo INT, 		
	@recordType VARCHAR(MAX)=null
	)
As
BEGIN
	DECLARE @SQL VARCHAR(MAX),
	@pageTop INT,
	@pageBottom INT,
	@Q VARCHAR(MAX)		     
	IF (@orderBy = '')		SET     @orderBy = 'LastName ASC'; 
	

	If(@recordType<>'Excel') 	
	SET @SQL = 'SELECT A.ID,	
	case when IsReqToSubmitFinancial=1 then ''Yes'' else ''No'' end as MustSubmit,	
		Isnull(A.LASTNAME,'''') as LastName,Isnull(A.FIRSTNAME,'''') as FirstName,
		Isnull(A.NAME,'''') AS FranchiseName,		
		--Updated by Andy Darling on 12/19/2013 to pull Work Email instead of emailaddress to ensure the work email is being displayed properly
			Isnull(A.WorkEmail,'''') as PrimaryOfficeEmail,
			ISNULL(A.OFFICEPHONE,'''') AS ContactNumber,
			CASE WHEN (Convert(varchar(12),A.LASTCREATEDDATE,101)=''01/01/1900'' OR A.LASTCREATEDDATE=NULL) THEN NULL ELSE Convert(varchar(12),A.LASTCREATEDDATE,101) END as LastUpdated
		FROM DBO.TBL_FRANCHISEE A	
		where (A.WorkEmail is null or Upper(A.WorkEmail) != ''SANDLERSPM@MINEDSYSTEMS.COM'')
		AND A.SandlerRoleId in (1,2,3,4,5,6,7,8) and a.IsActive = 1
		--Updated by Andy Darling 2013-11-06 to produce ONLY when MustSubmit = Yes
		and IsReqToSubmitFinancial=1';	
	ELSE
	SET @SQL = '
	SELECT 	
		case when IsReqToSubmitFinancial=1 then ''Yes'' else ''No'' end as MustSubmit,			
		Isnull(A.LASTNAME,'''') as LastName,Isnull(A.FIRSTNAME,'''') as FirstName,
		--Updated by Andy Darling on 12/19/2013 to pull Work Email instead of emailaddress to ensure the work email is being displayed properly
			Isnull(A.WorkEmail,'''') as PrimaryOfficeEmail,
			ISNULL(A.OFFICEPHONE,'''') AS ContactNumber,
			CASE WHEN (Convert(varchar(12),A.LASTCREATEDDATE,101)=''01/01/1900'' OR A.LASTCREATEDDATE=NULL) THEN NULL ELSE Convert(varchar(12),A.LASTCREATEDDATE,101) END as LastUpdated,				
			i.UserName as LastUpdatedBy
			FROM DBO.TBL_FRANCHISEE A
		LEFT JOIN DBO.TBL_COACH B ON A.COACHID = B.ID	
		Left Join dbo.TBL_COUNTRY C on A.CountryID=c.ID
		Left Join dbo.TBL_State D on a.WorkStateId = D.Id
		Left Join dbo.TBL_COUNTRY E on A.CountryID=E.ID
		Left Join dbo.TBL_State F on a.WorkStateId = F.Id
		Left Join dbo.TBL_COUNTRY G on A.CountryID=G.ID
		left join dbo.TBL_REGION H on b.RegionID = h.ID
		left join dbo.aspnet_Users I on a.LastUpdatedBy =i.UserId
		left join dbo.aspnet_Users J on a.CreatedBy =J.UserId
		left join dbo.Tbl_SandlerRole K on a.SandlerRoleId=k.SandlerRoleId
		left join dbo.Tbl_AwardLevel L on a.AwardLevelId=l.AwardLevelId
		left join dbo.Tbl_PurchaseLevel M on a.PurchaseLevelId = m.PurchaseLevelId
		left join dbo.Tbl_CertifiedLevel N on a.CertifiedLevelId = n.CertifiedLevelId
		left join dbo.Tbl_CostPlusAmount P on a.CostPlusAmountId=p.CostPlusAmountId
		left join dbo.tbl_BehindAmount Q on a.BehindAmountId=Q.BehindAmountId
		where (A.WorkEmail is null or Upper(A.WorkEmail) != ''SANDLERSPM@MINEDSYSTEMS.COM'')
		AND A.SandlerRoleId in (1,2,3,4,5,6,7,8) and a.IsActive = 1
		--Updated by Andy Darling 2013-11-06 to produce ONLY when MustSubmit = Yes
		and IsReqToSubmitFinancial=1';
	
	
	If @pageNo > 0 AND @pageSize > 0
	BEGIN	   
		SET @pageNo = @pageNo - 1    
		SET @pageTop = (@pageNo * @pageSize) + 1  
		SET @pageBottom = (@pageNo * @pageSize) + @pageSize
	END	     
	--Casting to int is required in followinf select clause
	--Look for this article
	--http://mythicalcode.com/2013/10/30/the-specified-cast-from-a-materialized-system-int64-type-to-the-system-int32-type-is-not-valid/
	SET @SQL = 'SELECT ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowIndex, _MYQ.* FROM ('+@SQL+') _MYQ'
	SET @Q = '
		WITH CTE_pageResult AS (' + CHAR(13) + @SQL + CHAR(13) + ')'
		+'
		SELECT
				(SELECT cast(COUNT(*) as int)  FROM CTE_pageResult) AS TotalCount, * ';	
	SET @Q = @Q + '	 FROM CTE_pageResult';
	IF @pageTop > 0 
	BEGIN 
		SET @Q = @Q + ' WHERE RowIndex BETWEEN ' + CAST(@pageTop AS VARCHAR(10)) + ' AND ' + CAST(@pageBottom AS VARCHAR(10))
	END
	
	PRINT @Q
	EXEC (@Q)	    
END


GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportfrbytrngdate]    Script Date: 03/11/2014 22:31:01 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


Create Procedure [dbo].[sp_GetHomeOfficeReportfrbytrngdate](
	@orderBy VARCHAR(MAX),  -- Required 
	@pageSize INT,    
	@pageNo INT, 		
	@recordType VARCHAR(MAX)=null
	)
As
BEGIN
	DECLARE @SQL VARCHAR(MAX),
	@pageTop INT,
	@pageBottom INT,
	@Q VARCHAR(MAX)		     
	IF (@orderBy = '')		SET     @orderBy = 'InitialTrainingDate ASC'; 
	

	If(@recordType<>'Excel') 	
	SET @SQL = 'SELECT A.ID,	
	CASE WHEN (Convert(varchar(12),A.InitialTrngDate,101)=''01/01/1900'' OR A.InitialTrngDate=NULL) THEN NULL ELSE A.InitialTrngDate END as InitialTrainingDate,				
		Isnull(A.LASTNAME,'''') as LastName,Isnull(A.FIRSTNAME,'''') as FirstName, Isnull(A.NAME,'''') AS FranchiseName,			
	--Updated by Andy Darling on 12/19/2013 to change to WORK email address	
			Isnull(A.WorkEmail,'''') as PrimaryOfficeEmail,
			ISNULL(A.OFFICEPHONE,'''') AS ContactNumber,
		CASE WHEN (Convert(varchar(12),A.LASTCREATEDDATE,101)=''01/01/1900'' OR A.LASTCREATEDDATE=NULL) THEN NULL ELSE convert (varchar(12),A.LASTCREATEDDATE,101) END as LastUpdated
		FROM DBO.TBL_FRANCHISEE A
		where (A.WorkEmail is null or Upper(A.WorkEmail) != ''SANDLERSPM@MINEDSYSTEMS.COM'')			
		AND A.SandlerRoleId in (1,2,3,4,5,6,7,8) and a.IsActive = 1
		-- Updated by Andy Darling on 12/19/2013 to filter out if initial training date is null
		and a.InitialTrngDate is not null';	
	ELSE
	SET @SQL = '
	SELECT 	
		CASE WHEN (Convert(varchar(12),A.InitialTrngDate,101)=''01/01/1900'' OR A.InitialTrngDate=NULL) THEN NULL ELSE convert (varchar(12),A.InitialTrngDate,101) END as InitialTrainingDate,		
		Isnull(A.LASTNAME,'''') as LastName,Isnull(A.FIRSTNAME,'''') as FirstName, Isnull(A.NAME,'''') AS FranchiseName,			
	--Updated by Andy Darling on 12/19/2013 to change to WORK email address	
			Isnull(A.WorkEmail,'''') as PrimaryOfficeEmail,
			ISNULL(A.OFFICEPHONE,'''') AS ContactNumber,
			CASE WHEN (Convert(varchar(12),A.LASTCREATEDDATE,101)=''01/01/1900'' OR A.LASTCREATEDDATE=NULL) THEN NULL ELSE convert (varchar(12),A.LASTCREATEDDATE,101) END as LastUpdated,			
			i.UserName as LastUpdatedBy
			FROM DBO.TBL_FRANCHISEE A
		LEFT JOIN DBO.TBL_COACH B ON A.COACHID = B.ID	
		Left Join dbo.TBL_COUNTRY C on A.CountryID=c.ID
		Left Join dbo.TBL_State D on a.WorkStateId = D.Id
		Left Join dbo.TBL_COUNTRY E on A.CountryID=E.ID
		Left Join dbo.TBL_State F on a.WorkStateId = F.Id
		Left Join dbo.TBL_COUNTRY G on A.CountryID=G.ID
		left join dbo.TBL_REGION H on b.RegionID = h.ID
		left join dbo.aspnet_Users I on a.LastUpdatedBy =i.UserId
		left join dbo.aspnet_Users J on a.CreatedBy =J.UserId
		left join dbo.Tbl_SandlerRole K on a.SandlerRoleId=k.SandlerRoleId
		left join dbo.Tbl_AwardLevel L on a.AwardLevelId=l.AwardLevelId
		left join dbo.Tbl_PurchaseLevel M on a.PurchaseLevelId = m.PurchaseLevelId
		left join dbo.Tbl_CertifiedLevel N on a.CertifiedLevelId = n.CertifiedLevelId
		left join dbo.Tbl_CostPlusAmount P on a.CostPlusAmountId=p.CostPlusAmountId
		left join dbo.tbl_BehindAmount Q on a.BehindAmountId=Q.BehindAmountId
		where (A.WorkEmail is null or Upper(A.WorkEmail) != ''SANDLERSPM@MINEDSYSTEMS.COM'')
		AND A.SandlerRoleId in (1,2,3,4,5,6,7,8) and a.IsActive = 1	
		-- Updated by Andy Darling on 12/19/2013 to filter out if initial training date is null in Excel Export
		and a.InitialTrngDate is not null';
	
	
	If @pageNo > 0 AND @pageSize > 0
	BEGIN	   
		SET @pageNo = @pageNo - 1    
		SET @pageTop = (@pageNo * @pageSize) + 1  
		SET @pageBottom = (@pageNo * @pageSize) + @pageSize
	END	     
	--Casting to int is required in followinf select clause
	--Look for this article
	--http://mythicalcode.com/2013/10/30/the-specified-cast-from-a-materialized-system-int64-type-to-the-system-int32-type-is-not-valid/
	SET @SQL = 'SELECT ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowIndex, _MYQ.* FROM ('+@SQL+') _MYQ'
	SET @Q = '
		WITH CTE_pageResult AS (' + CHAR(13) + @SQL + CHAR(13) + ')'
		+'
		SELECT
				(SELECT cast(COUNT(*) as int)  FROM CTE_pageResult) AS TotalCount, * ';	
	SET @Q = @Q + '	 FROM CTE_pageResult';
	IF @pageTop > 0 
	BEGIN 
		SET @Q = @Q + ' WHERE RowIndex BETWEEN ' + CAST(@pageTop AS VARCHAR(10)) + ' AND ' + CAST(@pageBottom AS VARCHAR(10))
	END
	
	PRINT @Q
	EXEC (@Q)	    
END


GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportfrbycountry]    Script Date: 03/11/2014 22:31:01 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


Create Procedure [dbo].[sp_GetHomeOfficeReportfrbycountry](
	@orderBy VARCHAR(MAX),  -- Required 
	@pageSize INT,    
	@pageNo INT, 		
	@recordType VARCHAR(MAX)=null
	)
As
BEGIN
	DECLARE @SQL VARCHAR(MAX),
	@pageTop INT,
	@pageBottom INT,
	@Q VARCHAR(MAX)		     
	IF (@orderBy = '')		SET     @orderBy = 'FranchiseName ASC'; 
	

	If(@recordType<>'Excel') 	
	SET @SQL = 'SELECT A.ID,	
	Isnull(B.Name,'''') as Country,						
		Isnull(A.LASTNAME,'''') as LastName,Isnull(A.FIRSTNAME,'''') as FirstName,	
		Isnull(A.NAME,'''') AS FranchiseName,
	--Updated by Andy Darling on 12/19/2013 to change to WORK email address	
			Isnull(A.WorkEmail,'''') as PrimaryOfficeEmail,
			ISNULL(A.OFFICEPHONE,'''') AS ContactNumber,
			CASE WHEN (Convert(varchar(12),A.LASTCREATEDDATE,101)=''01/01/1900'' OR A.LASTCREATEDDATE=NULL) THEN NULL ELSE Convert(varchar(12),A.LASTCREATEDDATE,101) END as LastUpdated
		FROM DBO.TBL_FRANCHISEE A	
		--Updated by Andy Darling on 2013-11-06 to pull from workcountryID instead of countryid
		Left Join dbo.TBL_COUNTRY B on A.WorkCountryId=B.ID
		where (A.WorkEmail is null or Upper(A.WorkEmail) != ''SANDLERSPM@MINEDSYSTEMS.COM'')
		AND A.SandlerRoleId in (1,2,3,4,5,6,7,8) and a.IsActive = 1';	
	ELSE
	SET @SQL = '
	SELECT 	
		Isnull(c.Name,'''') as Country,			
		Isnull(A.LASTNAME,'''') as LastName,Isnull(A.FIRSTNAME,'''') as FirstName,
		Isnull(A.NAME,'''') AS FranchiseName,	
	--Updated by Andy Darling on 12/19/2013 to change to WORK email address	
			Isnull(A.WorkEmail,'''') as PrimaryOfficeEmail,
			ISNULL(A.OFFICEPHONE,'''') AS ''ContactNumber,
			CASE WHEN (Convert(varchar(12),A.LASTCREATEDDATE,101)=''01/01/1900'' OR A.LASTCREATEDDATE=NULL) THEN NULL ELSE Convert(varchar(12),A.LASTCREATEDDATE,101) END as LastUpdated,	
			i.UserName as LastUpdatedBy
			FROM DBO.TBL_FRANCHISEE A
		LEFT JOIN DBO.TBL_COACH B ON A.COACHID = B.ID	
		--Updated by Andy Darling on 2013-11-06 to pull from workcountryID instead of countryid
		Left Join dbo.TBL_COUNTRY C on A.WorkCountryId=c.ID
		Left Join dbo.TBL_State D on a.WorkStateId = D.Id
		Left Join dbo.TBL_COUNTRY E on A.WorkCountryId=E.ID
		Left Join dbo.TBL_State F on a.WorkStateId = F.Id
		Left Join dbo.TBL_COUNTRY G on A.WorkCountryId=G.ID
		left join dbo.TBL_REGION H on b.RegionID = h.ID
		left join dbo.aspnet_Users I on a.LastUpdatedBy =i.UserId
		left join dbo.aspnet_Users J on a.CreatedBy =J.UserId
		left join dbo.Tbl_SandlerRole K on a.SandlerRoleId=k.SandlerRoleId
		left join dbo.Tbl_AwardLevel L on a.AwardLevelId=l.AwardLevelId
		left join dbo.Tbl_PurchaseLevel M on a.PurchaseLevelId = m.PurchaseLevelId
		left join dbo.Tbl_CertifiedLevel N on a.CertifiedLevelId = n.CertifiedLevelId
		left join dbo.Tbl_CostPlusAmount P on a.CostPlusAmountId=p.CostPlusAmountId
		left join dbo.tbl_BehindAmount Q on a.BehindAmountId=Q.BehindAmountId
		where (A.WorkEmail is null or Upper(A.WorkEmail) != ''SANDLERSPM@MINEDSYSTEMS.COM'')	
		AND A.SandlerRoleId in (1,2,3,4,5,6,7,8) and a.IsActive = 1';
	
	
	If @pageNo > 0 AND @pageSize > 0
	BEGIN	   
		SET @pageNo = @pageNo - 1    
		SET @pageTop = (@pageNo * @pageSize) + 1  
		SET @pageBottom = (@pageNo * @pageSize) + @pageSize
	END	     
	--Casting to int is required in followinf select clause
	--Look for this article
	--http://mythicalcode.com/2013/10/30/the-specified-cast-from-a-materialized-system-int64-type-to-the-system-int32-type-is-not-valid/
	SET @SQL = 'SELECT ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowIndex, _MYQ.* FROM ('+@SQL+') _MYQ'
	SET @Q = '
		WITH CTE_pageResult AS (' + CHAR(13) + @SQL + CHAR(13) + ')'
		+'
		SELECT
				(SELECT cast(COUNT(*) as int)  FROM CTE_pageResult) AS TotalCount, * ';	
	SET @Q = @Q + '	 FROM CTE_pageResult';
	IF @pageTop > 0 
	BEGIN 
		SET @Q = @Q + ' WHERE RowIndex BETWEEN ' + CAST(@pageTop AS VARCHAR(10)) + ' AND ' + CAST(@pageBottom AS VARCHAR(10))
	END
	
	PRINT @Q
	EXEC (@Q)	    
END


GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportctra]    Script Date: 03/11/2014 22:31:01 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


Create Procedure [dbo].[sp_GetHomeOfficeReportctra](
	@orderBy VARCHAR(MAX),  -- Required 
	@pageSize INT,    
	@pageNo INT, 		
	@recordType VARCHAR(MAX)=null
	)
As
BEGIN
	DECLARE @SQL VARCHAR(MAX),
	@pageTop INT,
	@pageBottom INT,
	@Q VARCHAR(MAX)		     
	IF (@orderBy = '')		SET     @orderBy = 'ContractorAllowed ASC'; 
	

	If(@recordType<>'Excel') 	
	SET @SQL = 'SELECT A.ID,	
	case when IsContractorPermitted=1 then ''Yes'' else ''No'' end as ContractorAllowed,
		Isnull(A.LASTNAME,'''') as LastName,Isnull(A.FIRSTNAME,'''') as FirstName,
		Isnull(A.NAME,'''') AS FranchiseName,				
			Isnull(A.WorkEmail,'''') as PrimaryOfficeEmail,
			ISNULL(A.OFFICEPHONE,'''') AS ContactNumber,
			CASE WHEN (Convert(varchar(12),A.LASTCREATEDDATE,101)=''01/01/1900'' OR A.LASTCREATEDDATE=NULL) THEN NULL ELSE Convert(varchar(12),A.LASTCREATEDDATE,101) END as LastUpdated
		FROM DBO.TBL_FRANCHISEE A
		where (A.WorkEmail is null or Upper(A.WorkEmail) != ''SANDLERSPM@MINEDSYSTEMS.COM'')	
		AND A.SandlerRoleId in (1,2,3,4,5,6,7,8) and a.IsActive = 1				
		and a.IsContractorPermitted !=0';	
	ELSE
	SET @SQL = '
	SELECT 	
		case when IsContractorPermitted=1 then ''Yes'' else ''No'' end as ContractorAllowed,
		Isnull(A.LASTNAME,'''') as LastName,Isnull(A.FIRSTNAME,'''') as FirstName,	
		Isnull(A.NAME,'''') AS FranchiseName,				
			Isnull(A.WorkEmail,'''') as PrimaryOfficeEmail,
			ISNULL(A.OFFICEPHONE,'''') AS ContactNumber,
			CASE WHEN (Convert(varchar(12),A.LASTCREATEDDATE,101)=''01/01/1900'' OR A.LASTCREATEDDATE=NULL) THEN NULL ELSE Convert(varchar(12),A.LASTCREATEDDATE,101) END as LastUpdated,		
			i.UserName as LastUpdatedBy
			FROM DBO.TBL_FRANCHISEE A
		LEFT JOIN DBO.TBL_COACH B ON A.COACHID = B.ID	
		Left Join dbo.TBL_COUNTRY C on A.CountryID=c.ID
		Left Join dbo.TBL_State D on a.WorkStateId = D.Id
		Left Join dbo.TBL_COUNTRY E on A.CountryID=E.ID
		Left Join dbo.TBL_State F on a.WorkStateId = F.Id
		Left Join dbo.TBL_COUNTRY G on A.CountryID=G.ID
		left join dbo.TBL_REGION H on b.RegionID = h.ID
		left join dbo.aspnet_Users I on a.LastUpdatedBy =i.UserId
		left join dbo.aspnet_Users J on a.CreatedBy =J.UserId
		left join dbo.Tbl_SandlerRole K on a.SandlerRoleId=k.SandlerRoleId
		left join dbo.Tbl_AwardLevel L on a.AwardLevelId=l.AwardLevelId
		left join dbo.Tbl_PurchaseLevel M on a.PurchaseLevelId = m.PurchaseLevelId
		left join dbo.Tbl_CertifiedLevel N on a.CertifiedLevelId = n.CertifiedLevelId
		left join dbo.Tbl_CostPlusAmount P on a.CostPlusAmountId=p.CostPlusAmountId
		left join dbo.tbl_BehindAmount Q on a.BehindAmountId=Q.BehindAmountId
		where (A.WorkEmail is null or Upper(A.WorkEmail) != ''SANDLERSPM@MINEDSYSTEMS.COM'')
		AND A.SandlerRoleId in (1,2,3,4,5,6,7,8) and a.IsActive = 1
		--Updated by Andy Darling on 12/19/2013 to filter out if Contractor Allowed = NO
		and a.IsContractorPermitted !=0';
	
	
	If @pageNo > 0 AND @pageSize > 0
	BEGIN	   
		SET @pageNo = @pageNo - 1    
		SET @pageTop = (@pageNo * @pageSize) + 1  
		SET @pageBottom = (@pageNo * @pageSize) + @pageSize
	END	     
	--Casting to int is required in followinf select clause
	--Look for this article
	--http://mythicalcode.com/2013/10/30/the-specified-cast-from-a-materialized-system-int64-type-to-the-system-int32-type-is-not-valid/
	SET @SQL = 'SELECT ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowIndex, _MYQ.* FROM ('+@SQL+') _MYQ'
	SET @Q = '
		WITH CTE_pageResult AS (' + CHAR(13) + @SQL + CHAR(13) + ')'
		+'
		SELECT
				(SELECT cast(COUNT(*) as int)  FROM CTE_pageResult) AS TotalCount, * ';	
	SET @Q = @Q + '	 FROM CTE_pageResult';
	IF @pageTop > 0 
	BEGIN 
		SET @Q = @Q + ' WHERE RowIndex BETWEEN ' + CAST(@pageTop AS VARCHAR(10)) + ' AND ' + CAST(@pageBottom AS VARCHAR(10))
	END
	
	PRINT @Q
	EXEC (@Q)	    
END


GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportfrbycontdetails]    Script Date: 03/11/2014 22:31:01 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


Create Procedure [dbo].[sp_GetHomeOfficeReportfrbycontdetails](
	@orderBy VARCHAR(MAX),  -- Required 
	@pageSize INT,    
	@pageNo INT, 		
	@recordType VARCHAR(MAX)=null
	)
As
BEGIN
	DECLARE @SQL VARCHAR(MAX),
	@pageTop INT,
	@pageBottom INT,
	@Q VARCHAR(MAX)		     
	IF (@orderBy = '')		SET     @orderBy = 'FranchiseName ASC'; 
	

	If(@recordType<>'Excel') 	
	SET @SQL = 'SELECT A.ID,	
	Isnull(A.NAME,'''') AS FranchiseName,		
		CASE WHEN (Convert(varchar(12),A.InitialContractDate,101)=''01/01/1900'' OR A.InitialContractDate=NULL) THEN NULL ELSE Convert(varchar(12),A.InitialContractDate,101) END as InitialContractDate,
		CASE WHEN (Convert(varchar(12),A.RenewalDate,101)=''01/01/1900'' OR A.RenewalDate=NULL) THEN NULL ELSE Convert(varchar(12),A.RenewalDate,101) END as RenewalDate,
		CASE WHEN (Convert(varchar(12),A.ContractFormDate,101)=''01/01/1900'' OR A.ContractFormDate=NULL) THEN NULL ELSE Convert(varchar(12),A.ContractFormDate,101) END as ContractFormDate,
		Isnull(A.LASTNAME,'''') as LastName,Isnull(A.FIRSTNAME,'''') as FirstName,	
			Isnull(A.WorkEmail,'''') as PrimaryOfficeEmail,
			ISNULL(A.OFFICEPHONE,'''') AS ContactNumber,
			CASE WHEN (Convert(varchar(12),A.LASTCREATEDDATE,101)=''01/01/1900'' OR A.LASTCREATEDDATE=NULL) THEN NULL ELSE Convert(varchar(12),A.LASTCREATEDDATE,101) END as LastUpdated
		FROM DBO.TBL_FRANCHISEE A	
		where (A.WorkEmail is null or Upper(A.WorkEmail) != ''SANDLERSPM@MINEDSYSTEMS.COM'')		
		AND A.SandlerRoleId in (1,2,3,4,5,6,7,8) and a.IsActive = 1		
		and a.State !=''Intl'' and a.InitialContractDate is not null and a.RenewalDate is not null and a.ContractFormDate is not null';	
	ELSE
	SET @SQL = '
	SELECT 	
		Isnull(A.NAME,'''') AS FranchiseName,
		convert(varchar(12),A.InitialContractDate,101) as InitialContractDate,
		CASE WHEN (Convert(varchar(12),A.RenewalDate,101)=''01/01/1900'' OR A.RenewalDate=NULL) THEN NULL ELSE Convert(varchar(12),A.RenewalDate,101) END as RenewalDate,
		Convert(varchar(12),A.ContractFormDate,101) as ContractFormDate,
		Isnull(A.LASTNAME,'''') as LastName,Isnull(A.FIRSTNAME,'''') as FirstName,				
			Isnull(A.WorkEmail,'''') as PrimaryOfficeEmail,
			ISNULL(A.OFFICEPHONE,'''') AS ContactNumber,
			CASE WHEN (Convert(varchar(12),A.LASTCREATEDDATE,101)=''01/01/1900'' OR A.LASTCREATEDDATE=NULL) THEN NULL ELSE Convert(varchar(12),A.LASTCREATEDDATE,101) END as LastUpdated,	
			i.UserName as LastUpdatedBy
			FROM DBO.TBL_FRANCHISEE A
		LEFT JOIN DBO.TBL_COACH B ON A.COACHID = B.ID	
		Left Join dbo.TBL_COUNTRY C on A.CountryID=c.ID
		Left Join dbo.TBL_State D on a.WorkStateId = D.Id
		Left Join dbo.TBL_COUNTRY E on A.CountryID=E.ID
		Left Join dbo.TBL_State F on a.WorkStateId = F.Id
		Left Join dbo.TBL_COUNTRY G on A.CountryID=G.ID
		left join dbo.TBL_REGION H on b.RegionID = h.ID
		left join dbo.aspnet_Users I on a.LastUpdatedBy =i.UserId
		left join dbo.aspnet_Users J on a.CreatedBy =J.UserId
		left join dbo.Tbl_SandlerRole K on a.SandlerRoleId=k.SandlerRoleId
		left join dbo.Tbl_AwardLevel L on a.AwardLevelId=l.AwardLevelId
		left join dbo.Tbl_PurchaseLevel M on a.PurchaseLevelId = m.PurchaseLevelId
		left join dbo.Tbl_CertifiedLevel N on a.CertifiedLevelId = n.CertifiedLevelId
		left join dbo.Tbl_CostPlusAmount P on a.CostPlusAmountId=p.CostPlusAmountId
		left join dbo.tbl_BehindAmount Q on a.BehindAmountId=Q.BehindAmountId
		where (A.WorkEmail is null or Upper(A.WorkEmail) != ''SANDLERSPM@MINEDSYSTEMS.COM'')		
		AND A.SandlerRoleId in (1,2,3,4,5,6,7,8) and a.IsActive = 1
		-- Updated by Andy Darling 12/19/2013 to filter out if State = Intl so that International personnel, or if Initial Contract Date, Renewal Date or Contract Form Date = NULL
		and a.State !=''Intl'' and a.InitialContractDate is not null and a.RenewalDate is not null and a.ContractFormDate is not null';
	
	
	If @pageNo > 0 AND @pageSize > 0
	BEGIN	   
		SET @pageNo = @pageNo - 1    
		SET @pageTop = (@pageNo * @pageSize) + 1  
		SET @pageBottom = (@pageNo * @pageSize) + @pageSize
	END	     
	--Casting to int is required in followinf select clause
	--Look for this article
	--http://mythicalcode.com/2013/10/30/the-specified-cast-from-a-materialized-system-int64-type-to-the-system-int32-type-is-not-valid/
	SET @SQL = 'SELECT ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowIndex, _MYQ.* FROM ('+@SQL+') _MYQ'
	SET @Q = '
		WITH CTE_pageResult AS (' + CHAR(13) + @SQL + CHAR(13) + ')'
		+'
		SELECT
				(SELECT cast(COUNT(*) as int)  FROM CTE_pageResult) AS TotalCount, * ';	
	SET @Q = @Q + '	 FROM CTE_pageResult';
	IF @pageTop > 0 
	BEGIN 
		SET @Q = @Q + ' WHERE RowIndex BETWEEN ' + CAST(@pageTop AS VARCHAR(10)) + ' AND ' + CAST(@pageBottom AS VARCHAR(10))
	END
	
	PRINT @Q
	EXEC (@Q)	    
END


GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportfrbycoach]    Script Date: 03/11/2014 22:31:01 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


Create Procedure [dbo].[sp_GetHomeOfficeReportfrbycoach](
	@orderBy VARCHAR(MAX),  -- Required 
	@pageSize INT,    
	@pageNo INT, 		
	@recordType VARCHAR(MAX)=null
	)
As
BEGIN
	DECLARE @SQL VARCHAR(MAX),
	@pageTop INT,
	@pageBottom INT,
	@Q VARCHAR(MAX)		     
	IF (@orderBy = '')		SET     @orderBy = 'Coach ASC'; 
	

	If(@recordType<>'Excel') 	
	SET @SQL = 'SELECT A.ID,	
		Isnull(B.FIRSTNAME,'''')+'' ''+Isnull(B.LASTNAME,'''') AS Coach,		
		Isnull(A.LASTNAME,'''') as LastName,Isnull(A.FIRSTNAME,'''') as FirstName,
		Isnull(A.NAME,'''') AS FranchiseName,	
		Isnull(A.WorkEmail,'''') as PrimaryOfficeEmail,
			ISNULL(A.OFFICEPHONE,'''') AS ContactNumber,
			CASE WHEN (Convert(varchar(12),A.LASTCREATEDDATE,101)=''01/01/1900'' OR A.LASTCREATEDDATE=NULL) THEN NULL ELSE Convert(varchar(12),A.LASTCREATEDDATE,101) END as LastUpdated	
		FROM DBO.TBL_FRANCHISEE A	
		JOIN DBO.TBL_COACH B ON A.COACHID = B.ID
		where (A.WorkEmail is null or Upper(A.WorkEmail) != ''SANDLERSPM@MINEDSYSTEMS.COM'')	
		AND A.SandlerRoleId in (1,2,3,4,5,6,7) and a.IsActive = 1';	
	ELSE
	SET @SQL = '
	SELECT 	Isnull(B.FIRSTNAME,'''')+'' ''+Isnull(B.LASTNAME,'''') AS Coach,		
			Isnull(A.LASTNAME,'''') as LastName,Isnull(A.FIRSTNAME,'''') as FirstName,	
			Isnull(A.NAME,'''') AS FranchiseName,			
			Isnull(A.WorkEmail,'''') as PrimaryOfficeEmail,
			ISNULL(A.OFFICEPHONE,'''') AS ContactNumber,
			CASE WHEN (Convert(varchar(12),A.LASTCREATEDDATE,101)=''01/01/1900'' OR A.LASTCREATEDDATE=NULL) THEN NULL ELSE Convert(varchar(12),A.LASTCREATEDDATE,101) END as LastUpdated,		
			i.UserName as LastUpdatedBy
			FROM DBO.TBL_FRANCHISEE A
		LEFT JOIN DBO.TBL_COACH B ON A.COACHID = B.ID	
		Left Join dbo.TBL_COUNTRY C on A.CountryID=c.ID
		Left Join dbo.TBL_State D on a.WorkStateId = D.Id
		Left Join dbo.TBL_COUNTRY E on A.CountryID=E.ID
		Left Join dbo.TBL_State F on a.WorkStateId = F.Id
		Left Join dbo.TBL_COUNTRY G on A.CountryID=G.ID
		left join dbo.TBL_REGION H on b.RegionID = h.ID
		left join dbo.aspnet_Users I on a.LastUpdatedBy =i.UserId
		left join dbo.aspnet_Users J on a.CreatedBy =J.UserId
		left join dbo.Tbl_SandlerRole K on a.SandlerRoleId=k.SandlerRoleId
		left join dbo.Tbl_AwardLevel L on a.AwardLevelId=l.AwardLevelId
		left join dbo.Tbl_PurchaseLevel M on a.PurchaseLevelId = m.PurchaseLevelId
		left join dbo.Tbl_CertifiedLevel N on a.CertifiedLevelId = n.CertifiedLevelId
		left join dbo.Tbl_CostPlusAmount P on a.CostPlusAmountId=p.CostPlusAmountId
		left join dbo.tbl_BehindAmount Q on a.BehindAmountId=Q.BehindAmountId	
		where (A.WorkEmail is null or Upper(A.WorkEmail) != ''SANDLERSPM@MINEDSYSTEMS.COM'')	
		AND A.SandlerRoleId in (1,2,3,4,5,6,7) and a.IsActive = 1';
	
	
	If @pageNo > 0 AND @pageSize > 0
	BEGIN	   
		SET @pageNo = @pageNo - 1    
		SET @pageTop = (@pageNo * @pageSize) + 1  
		SET @pageBottom = (@pageNo * @pageSize) + @pageSize
	END	     
	--Casting to int is required in followinf select clause
	--Look for this article
	--http://mythicalcode.com/2013/10/30/the-specified-cast-from-a-materialized-system-int64-type-to-the-system-int32-type-is-not-valid/
	SET @SQL = 'SELECT ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowIndex, _MYQ.* FROM ('+@SQL+') _MYQ'
	SET @Q = '
		WITH CTE_pageResult AS (' + CHAR(13) + @SQL + CHAR(13) + ')'
		+'
		SELECT
				(SELECT cast(COUNT(*) as int)  FROM CTE_pageResult) AS TotalCount, * ';	
	SET @Q = @Q + '	 FROM CTE_pageResult';
	IF @pageTop > 0 
	BEGIN 
		SET @Q = @Q + ' WHERE RowIndex BETWEEN ' + CAST(@pageTop AS VARCHAR(10)) + ' AND ' + CAST(@pageBottom AS VARCHAR(10))
	END
	
	PRINT @Q
	EXEC (@Q)	    
END


GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportfrbycertlevel]    Script Date: 03/11/2014 22:31:01 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


Create Procedure [dbo].[sp_GetHomeOfficeReportfrbycertlevel](
	@orderBy VARCHAR(MAX),  -- Required 
	@pageSize INT,    
	@pageNo INT, 		
	@recordType VARCHAR(MAX)=null
	)
As
BEGIN
	DECLARE @SQL VARCHAR(MAX),
	@pageTop INT,
	@pageBottom INT,
	@Q VARCHAR(MAX)		     
	IF (@orderBy = '')		SET     @orderBy = 'CertificationLevel ASC'; 
	

	If(@recordType<>'Excel') 	
	SET @SQL = 'SELECT A.ID,	
	B.CertifiedLevelText as CertificationLevel,		
		Isnull(A.LASTNAME,'''') as LastName,Isnull(A.FIRSTNAME,'''') as FirstName,		
		Isnull(A.NAME,'''') AS FranchiseName,	
			Isnull(A.WorkEmail,'''') as PrimaryOfficeEmail,
			ISNULL(A.OFFICEPHONE,'''') AS ContactNumber,
			CASE WHEN (Convert(varchar(12),A.LASTCREATEDDATE,101)=''01/01/1900'' OR A.LASTCREATEDDATE=NULL) THEN NULL ELSE Convert(varchar(12),A.LASTCREATEDDATE,101) END as LastUpdated
		FROM DBO.TBL_FRANCHISEE A	
		left join dbo.Tbl_CertifiedLevel B on a.CertifiedLevelId = B.CertifiedLevelId
		where A.CertifiedLevelId is not null and
		(A.WorkEmail is null or Upper(A.WorkEmail) != ''SANDLERSPM@MINEDSYSTEMS.COM'')
		AND A.SandlerRoleId in (1,2,3,4,5,6,7,8) and a.IsActive = 1';	
	ELSE
	SET @SQL = '
	SELECT 	n.CertifiedLevelText as CertificationLevel,		
		Isnull(A.LASTNAME,'''') as LastName,Isnull(A.FIRSTNAME,'''') as FirstName,
		Isnull(A.NAME,'''') AS FranchiseName,	
			Isnull(A.WorkEmail,'''') as PrimaryOfficeEmail,
			ISNULL(A.OFFICEPHONE,'''') AS ContactNumber,
			CASE WHEN (Convert(varchar(12),A.LASTCREATEDDATE,101)=''01/01/1900'' OR A.LASTCREATEDDATE=NULL) THEN NULL ELSE Convert(varchar(12),A.LASTCREATEDDATE,101) END as LastUpdated,			
			i.UserName as LastUpdatedBy
			FROM DBO.TBL_FRANCHISEE A
		LEFT JOIN DBO.TBL_COACH B ON A.COACHID = B.ID	
		Left Join dbo.TBL_COUNTRY C on A.CountryID=c.ID
		Left Join dbo.TBL_State D on a.WorkStateId = D.Id
		Left Join dbo.TBL_COUNTRY E on A.CountryID=E.ID
		Left Join dbo.TBL_State F on a.WorkStateId = F.Id
		Left Join dbo.TBL_COUNTRY G on A.CountryID=G.ID
		left join dbo.TBL_REGION H on b.RegionID = h.ID
		left join dbo.aspnet_Users I on a.LastUpdatedBy =i.UserId
		left join dbo.aspnet_Users J on a.CreatedBy =J.UserId
		left join dbo.Tbl_SandlerRole K on a.SandlerRoleId=k.SandlerRoleId
		left join dbo.Tbl_AwardLevel L on a.AwardLevelId=l.AwardLevelId
		left join dbo.Tbl_PurchaseLevel M on a.PurchaseLevelId = m.PurchaseLevelId
		left join dbo.Tbl_CertifiedLevel N on a.CertifiedLevelId = n.CertifiedLevelId
		left join dbo.Tbl_CostPlusAmount P on a.CostPlusAmountId=p.CostPlusAmountId
		left join dbo.tbl_BehindAmount Q on a.BehindAmountId=Q.BehindAmountId
		where A.CertifiedLevelId is not null and
		(A.WorkEmail is null or Upper(A.WorkEmail) != ''SANDLERSPM@MINEDSYSTEMS.COM'')	
		AND A.SandlerRoleId in (1,2,3,4,5,6,7,8) and a.IsActive = 1	';
	
	
	If @pageNo > 0 AND @pageSize > 0
	BEGIN	   
		SET @pageNo = @pageNo - 1    
		SET @pageTop = (@pageNo * @pageSize) + 1  
		SET @pageBottom = (@pageNo * @pageSize) + @pageSize
	END	     
	--Casting to int is required in followinf select clause
	--Look for this article
	--http://mythicalcode.com/2013/10/30/the-specified-cast-from-a-materialized-system-int64-type-to-the-system-int32-type-is-not-valid/
	SET @SQL = 'SELECT ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowIndex, _MYQ.* FROM ('+@SQL+') _MYQ'
	SET @Q = '
		WITH CTE_pageResult AS (' + CHAR(13) + @SQL + CHAR(13) + ')'
		+'
		SELECT
				(SELECT cast(COUNT(*) as int)  FROM CTE_pageResult) AS TotalCount, * ';	
	SET @Q = @Q + '	 FROM CTE_pageResult';
	IF @pageTop > 0 
	BEGIN 
		SET @Q = @Q + ' WHERE RowIndex BETWEEN ' + CAST(@pageTop AS VARCHAR(10)) + ' AND ' + CAST(@pageBottom AS VARCHAR(10))
	END
	
	PRINT @Q
	EXEC (@Q)	    
END


GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportfrbybusarea]    Script Date: 03/11/2014 22:31:01 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


Create Procedure [dbo].[sp_GetHomeOfficeReportfrbybusarea](
	@orderBy VARCHAR(MAX),  -- Required 
	@pageSize INT,    
	@pageNo INT, 		
	@recordType VARCHAR(MAX)=null
	)
As
BEGIN
	DECLARE @SQL VARCHAR(MAX),
	@pageTop INT,
	@pageBottom INT,
	@Q VARCHAR(MAX)		     
	IF (@orderBy = '')		SET     @orderBy = 'BusinessFocusArea ASC'; 
	

	If(@recordType<>'Excel') 	
	SET @SQL = 'SELECT A.ID,	
	A.BusinessFocusArea,		
		Isnull(A.LASTNAME,'''') as LastName,Isnull(A.FIRSTNAME,'''') as FirstName,	
		Isnull(A.NAME,'''') AS FranchiseName,	
			Isnull(A.WorkEmail,'''') as WorkEmail,
			ISNULL(A.OFFICEPHONE,'''') AS OfficePhone,
			Convert(varchar(12),A.LASTCREATEDDATE,101) as LastUpdated
		FROM DBO.TBL_FRANCHISEE A	
		where a.BusinessFocusArea != '''' and a.IsActive = 1';	
	ELSE
	SET @SQL = '
	SELECT 	A.BusinessFocusArea,	
		Isnull(A.LASTNAME,'''') as LastName,Isnull(A.FIRSTNAME,'''') as FirstName,
		Isnull(A.NAME,'''') AS FranchiseName,		
			Isnull(a.WorkEmail,'''') as PrimaryOfficeEmail,Isnull(a.WorkAddress,'''') as PrimaryOfficeAddress,Isnull(a.WorkCity,'''') as PrimaryOfficeCity,
			Isnull(d.Name,'''') as PrimaryOfficeState,Isnull(a.WorkZip,'''') as PrimaryOfficeZip,Isnull(e.Name,'''') as PrimaryOfficeCountry,
			ISNULL(A.OFFICEPHONE,'''') AS OfficePhone,
			Convert(varchar(12),A.LASTCREATEDDATE,101) as LastUpdated,			
			i.UserName as LastUpdatedBy
			FROM DBO.TBL_FRANCHISEE A
		LEFT JOIN DBO.TBL_COACH B ON A.COACHID = B.ID	
		Left Join dbo.TBL_COUNTRY C on A.CountryID=c.ID
		Left Join dbo.TBL_State D on a.WorkStateId = D.Id
		Left Join dbo.TBL_COUNTRY E on A.CountryID=E.ID
		Left Join dbo.TBL_State F on a.WorkStateId = F.Id
		Left Join dbo.TBL_COUNTRY G on A.CountryID=G.ID
		left join dbo.TBL_REGION H on b.RegionID = h.ID
		left join dbo.aspnet_Users I on a.LastUpdatedBy =i.UserId
		left join dbo.aspnet_Users J on a.CreatedBy =J.UserId
		left join dbo.Tbl_SandlerRole K on a.SandlerRoleId=k.SandlerRoleId
		left join dbo.Tbl_AwardLevel L on a.AwardLevelId=l.AwardLevelId
		left join dbo.Tbl_PurchaseLevel M on a.PurchaseLevelId = m.PurchaseLevelId
		left join dbo.Tbl_CertifiedLevel N on a.CertifiedLevelId = n.CertifiedLevelId
		left join dbo.Tbl_CostPlusAmount P on a.CostPlusAmountId=p.CostPlusAmountId
		left join dbo.tbl_BehindAmount Q on a.BehindAmountId=Q.BehindAmountId
		where 
		a.BusinessFocusArea != '''' and a.IsActive = 1';
	
	
	If @pageNo > 0 AND @pageSize > 0
	BEGIN	   
		SET @pageNo = @pageNo - 1    
		SET @pageTop = (@pageNo * @pageSize) + 1  
		SET @pageBottom = (@pageNo * @pageSize) + @pageSize
	END	     
	--Casting to int is required in followinf select clause
	--Look for this article
	--http://mythicalcode.com/2013/10/30/the-specified-cast-from-a-materialized-system-int64-type-to-the-system-int32-type-is-not-valid/
	SET @SQL = 'SELECT ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowIndex, _MYQ.* FROM ('+@SQL+') _MYQ'
	SET @Q = '
		WITH CTE_pageResult AS (' + CHAR(13) + @SQL + CHAR(13) + ')'
		+'
		SELECT
				(SELECT cast(COUNT(*) as int)  FROM CTE_pageResult) AS TotalCount, * ';	
	SET @Q = @Q + '	 FROM CTE_pageResult';
	IF @pageTop > 0 
	BEGIN 
		SET @Q = @Q + ' WHERE RowIndex BETWEEN ' + CAST(@pageTop AS VARCHAR(10)) + ' AND ' + CAST(@pageBottom AS VARCHAR(10))
	END
	
	PRINT @Q
	EXEC (@Q)	    
END


GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportfrbyawlevel]    Script Date: 03/11/2014 22:31:01 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

--select * from tbl_contacts ct where ct.isactive=0
Create Procedure [dbo].[sp_GetHomeOfficeReportfrbyawlevel](
	@orderBy VARCHAR(MAX),  -- Required 
	@pageSize INT,    
	@pageNo INT, 		
	@recordType VARCHAR(MAX)=null
	)
As
BEGIN
	DECLARE @SQL VARCHAR(MAX),
	@pageTop INT,
	@pageBottom INT,
	@Q VARCHAR(MAX)		
	IF (@orderBy = '')		SET     @orderBy = 'AwardLevelText ASC'; 
	 

	If(@recordType<>'Excel') 	
	SET @SQL = 'SELECT A.ID,		
		B.AwardLevelText,		
		Isnull(A.LASTNAME,'''') as LastName,Isnull(A.FIRSTNAME,'''') as FirstName,	
		Isnull(A.NAME,'''') AS FranchiseName,		
		--Updated by Andy Darling 12/19/2013 to use WORK email since that is the field that is accessible on the home office screen						
			Isnull(A.WorkEmail,'''') as PrimaryOfficeEmail,
			ISNULL(A.OFFICEPHONE,'''') AS ContactNumber,
			CASE WHEN (Convert(varchar(12),A.LASTCREATEDDATE,101)=''01/01/1900'' OR A.LASTCREATEDDATE=NULL) THEN NULL ELSE Convert(varchar(12),A.LASTCREATEDDATE,101) END as LastUpdated			
		FROM DBO.TBL_FRANCHISEE A	
		Left Join dbo.Tbl_AwardLevel B on a.AwardLevelId=B.AwardLevelId 
		where A.AwardLevelId is not null and
		(A.WorkEmail is null or Upper(A.WorkEmail) != ''SANDLERSPM@MINEDSYSTEMS.COM'')			
		AND A.SandlerRoleId in (1,2,3,4,5,6,7,8) and a.IsActive = 1';	
	ELSE
	SET @SQL = 'SELECT 	
		l.AwardLevelText,		
		Isnull(A.LASTNAME,'''') as LastName,Isnull(A.FIRSTNAME,'''') as FirstName,	
		Isnull(A.NAME,'''') AS Name,
		Isnull(a.WorkEmail,'''') as PrimaryOfficeEmail,
		ISNULL(A.OFFICEPHONE,'''') AS ContactNumber,
		CASE WHEN (Convert(varchar(12),A.LASTCREATEDDATE,101)=''01/01/1900'' OR A.LASTCREATEDDATE=NULL) THEN NULL ELSE Convert(varchar(12),A.LASTCREATEDDATE,101) END as LastUpdated,		
		i.UserName as LastUpdatedBy
		FROM DBO.TBL_FRANCHISEE A
		LEFT JOIN DBO.TBL_COACH B ON A.COACHID = B.ID	
		Left Join dbo.TBL_COUNTRY C on A.CountryID=c.ID
		Left Join dbo.TBL_State D on a.WorkStateId = D.Id
		Left Join dbo.TBL_COUNTRY E on A.CountryID=E.ID
		Left Join dbo.TBL_State F on a.WorkStateId = F.Id
		Left Join dbo.TBL_COUNTRY G on A.CountryID=G.ID
		left join dbo.TBL_REGION H on b.RegionID = h.ID
		left join dbo.aspnet_Users I on a.LastUpdatedBy =i.UserId
		left join dbo.aspnet_Users J on a.CreatedBy =J.UserId
		left join dbo.Tbl_SandlerRole K on a.SandlerRoleId=k.SandlerRoleId
		left join dbo.Tbl_AwardLevel L on a.AwardLevelId=l.AwardLevelId
		left join dbo.Tbl_PurchaseLevel M on a.PurchaseLevelId = m.PurchaseLevelId
		left join dbo.Tbl_CertifiedLevel N on a.CertifiedLevelId = n.CertifiedLevelId
		left join dbo.Tbl_CostPlusAmount P on a.CostPlusAmountId=p.CostPlusAmountId
		left join dbo.tbl_BehindAmount Q on a.BehindAmountId=Q.BehindAmountId
		where A.AwardLevelId is not null and
		(A.WorkEmail is null or Upper(A.WorkEmail) != ''SANDLERSPM@MINEDSYSTEMS.COM'')			
		AND A.SandlerRoleId in (1,2,3,4,5,6,7,8) and a.IsActive = 1		';
	
	
	If @pageNo > 0 AND @pageSize > 0
	BEGIN	   
		SET @pageNo = @pageNo - 1    
		SET @pageTop = (@pageNo * @pageSize) + 1  
		SET @pageBottom = (@pageNo * @pageSize) + @pageSize
	END	     
	--Casting to int is required in followinf select clause
	--Look for this article
	--http://mythicalcode.com/2013/10/30/the-specified-cast-from-a-materialized-system-int64-type-to-the-system-int32-type-is-not-valid/
	SET @SQL = 'SELECT ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowIndex, _MYQ.* FROM ('+@SQL+') _MYQ'
	SET @Q = '
		WITH CTE_pageResult AS (' + CHAR(13) + @SQL + CHAR(13) + ')'
		+'
		SELECT
				(SELECT cast(COUNT(*) as int)  FROM CTE_pageResult) AS TotalCount, * ';	
	SET @Q = @Q + '	 FROM CTE_pageResult';
	IF @pageTop > 0 
	BEGIN 
		SET @Q = @Q + ' WHERE RowIndex BETWEEN ' + CAST(@pageTop AS VARCHAR(10)) + ' AND ' + CAST(@pageBottom AS VARCHAR(10))
	END
	
	PRINT @Q
	EXEC (@Q)	    
END


GO


Update [dbo].[pageMenu] Set pagePath = '/CRM/HomeOfficeReports/Index' Where pageMenuId = 5;
GO