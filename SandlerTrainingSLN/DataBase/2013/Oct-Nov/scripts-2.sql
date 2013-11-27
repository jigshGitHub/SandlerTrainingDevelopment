
/****** Object:  StoredProcedure [dbo].[GetContactDataByCompId]    Script Date: 11/26/2013 10:21:06 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetContactDataByCompId]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetContactDataByCompId]
GO

/****** Object:  StoredProcedure [dbo].[GetContactDataForCompByUserId]    Script Date: 11/26/2013 10:21:06 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetContactDataForCompByUserId]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetContactDataForCompByUserId]
GO

/****** Object:  StoredProcedure [dbo].[GetContactDataByUserId]    Script Date: 11/26/2013 10:21:06 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetContactDataByUserId]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetContactDataByUserId]
GO

/****** Object:  StoredProcedure [dbo].[GetContactDataByFrId]    Script Date: 11/26/2013 10:21:06 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetContactDataByFrId]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetContactDataByFrId]
GO

/****** Object:  StoredProcedure [dbo].[GetContactDataByCoachId]    Script Date: 11/26/2013 10:21:06 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetContactDataByCoachId]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetContactDataByCoachId]
GO

/****** Object:  StoredProcedure [dbo].[GetContactData]    Script Date: 11/26/2013 10:21:06 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetContactData]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetContactData]
GO

/****** Object:  StoredProcedure [dbo].[GetTableTotalCountContact]    Script Date: 11/26/2013 10:21:06 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetTableTotalCountContact]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetTableTotalCountContact]
GO

/****** Object:  StoredProcedure [dbo].[GetCompanyDataByFrId]    Script Date: 11/26/2013 10:21:06 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetCompanyDataByFrId]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetCompanyDataByFrId]
GO

/****** Object:  StoredProcedure [dbo].[GetCompanyDataByCoachId]    Script Date: 11/26/2013 10:21:06 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetCompanyDataByCoachId]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetCompanyDataByCoachId]
GO

/****** Object:  StoredProcedure [dbo].[GetTableTotalCountCompany]    Script Date: 11/26/2013 10:21:06 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetTableTotalCountCompany]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetTableTotalCountCompany]
GO

/****** Object:  StoredProcedure [dbo].[GetCompanyData]    Script Date: 11/26/2013 10:21:06 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetCompanyData]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetCompanyData]
GO

/****** Object:  StoredProcedure [dbo].[GetFranchiseesData]    Script Date: 11/26/2013 10:21:06 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetFranchiseesData]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetFranchiseesData]
GO

/****** Object:  StoredProcedure [dbo].[GetTableTotalCount]    Script Date: 11/26/2013 10:21:06 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetTableTotalCount]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetTableTotalCount]
GO


/****** Object:  StoredProcedure [dbo].[GetContactDataByCompId]    Script Date: 11/26/2013 10:21:06 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE  PROCEDURE [dbo].[GetContactDataByCompId]
    @PageSize int = null,
    @CurrentPage int = null,
    @SortExpression    nvarchar(max) = null,
    @CompId varchar(20)
        
AS

BEGIN
    SET NOCOUNT ON

    DECLARE @SqlString nvarchar(max)
    Declare @UpperBand int
    Declare @LowerBand int        
    
    SET @LowerBand  = (@CurrentPage - 1) * @PageSize
    SET @UpperBand  = (@CurrentPage * @PageSize) + 1    
       
	SET @SqlString='WITH sandlerTempTable AS
			(                    
				select 
				ct.lastname + '','' + ct.FirstName as FullName, 
				ct.phone,
				ct.ReferredBy , ct.Notes , ct.Country, ct.CreatedBy,ct.lastname,
				ct.Email, ct.contactsid ,cp.COMPANYNAME,
				ROW_NUMBER() OVER (ORDER BY '+ @SortExpression +' ) AS RowNumber
				from tbl_contacts ct 
	            left join tbl_companies cp on ct.companyid = cp.COMPANIESID
	            where ct.IsActive = 1  
	            and ct.companyid = '+ @CompId + '
			)     
			SELECT * FROM sandlerTempTable 
			WHERE 
				RowNumber > ' + CONVERT(VARCHAR,@LowerBand) + '  AND RowNumber < ' + CONVERT(VARCHAR, @UpperBand)
				+ ' ORDER BY ' + @SortExpression     
				
	Print @SQLString
	EXEC sp_executesql @SqlString         
   END


            
GO

/****** Object:  StoredProcedure [dbo].[GetContactDataForCompByUserId]    Script Date: 11/26/2013 10:21:06 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[GetContactDataForCompByUserId]
    @PageSize int = null,
    @CurrentPage int = null,
    @SortExpression    nvarchar(max) = null,
    @CompanyId varchar(20) = null,
    @UserId varchar(50)
        
AS

BEGIN
    SET NOCOUNT ON

    DECLARE @SqlString nvarchar(max)
    Declare @UpperBand int
    Declare @LowerBand int        
    
    SET @LowerBand  = (@CurrentPage - 1) * @PageSize
    SET @UpperBand  = (@CurrentPage * @PageSize) + 1    
       
	SET @SqlString='WITH sandlerTempTable AS
			(                    
				select 
				ct.lastname + '','' + ct.FirstName as FullName, 
				ct.phone,
				ct.ReferredBy , ct.Notes , ct.Country, ct.CreatedBy,ct.lastname,
				ct.Email, ct.contactsid ,cp.COMPANYNAME,
				ROW_NUMBER() OVER (ORDER BY '+ @SortExpression +' ) AS RowNumber
				from tbl_contacts ct 
	            left join tbl_companies cp on ct.companyid = cp.COMPANIESID
	            where ct.IsActive = 1  
	            and Upper(ct.CreatedBy) = '+ Upper(@UserID) + '
	            and ct.COMPANYID = '+ @CompanyId + '
			)     
			SELECT * FROM sandlerTempTable 
			WHERE 
				RowNumber > ' + CONVERT(VARCHAR,@LowerBand) + '  AND RowNumber < ' + CONVERT(VARCHAR, @UpperBand)
				+ ' ORDER BY ' + @SortExpression     
				
	Print @SQLString
	EXEC sp_executesql @SqlString         
   END


            
GO

/****** Object:  StoredProcedure [dbo].[GetContactDataByUserId]    Script Date: 11/26/2013 10:21:06 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[GetContactDataByUserId]
    @PageSize int = null,
    @CurrentPage int = null,
    @SortExpression    nvarchar(max) = null,
    @UserId varchar(50)
        
AS

BEGIN
    SET NOCOUNT ON

    DECLARE @SqlString nvarchar(max)
    Declare @UpperBand int
    Declare @LowerBand int        
    
    SET @LowerBand  = (@CurrentPage - 1) * @PageSize
    SET @UpperBand  = (@CurrentPage * @PageSize) + 1    
       
	SET @SqlString='WITH sandlerTempTable AS
			(                    
				select 
				ct.lastname + '','' + ct.FirstName as FullName, 
				ct.phone,
				ct.ReferredBy , ct.Notes , ct.Country, ct.CreatedBy,ct.lastname,
				ct.Email, ct.contactsid ,cp.COMPANYNAME,
				ROW_NUMBER() OVER (ORDER BY '+ @SortExpression +' ) AS RowNumber
				from tbl_contacts ct 
	            left join tbl_companies cp on ct.companyid = cp.COMPANIESID
	            where ct.IsActive = 1  
	            and Upper(ct.CreatedBy) = '+ Upper(@UserID) + '
			)     
			SELECT * FROM sandlerTempTable 
			WHERE 
				RowNumber > ' + CONVERT(VARCHAR,@LowerBand) + '  AND RowNumber < ' + CONVERT(VARCHAR, @UpperBand)
				+ ' ORDER BY ' + @SortExpression     
				
	Print @SQLString
	EXEC sp_executesql @SqlString         
   END


            
GO

/****** Object:  StoredProcedure [dbo].[GetContactDataByFrId]    Script Date: 11/26/2013 10:21:06 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[GetContactDataByFrId]
    @PageSize int = null,
    @CurrentPage int = null,
    @SortExpression    nvarchar(max) = null,
    @FrId varchar(20)
        
AS

BEGIN
    SET NOCOUNT ON

    DECLARE @SqlString nvarchar(max)
    Declare @UpperBand int
    Declare @LowerBand int        
    
    SET @LowerBand  = (@CurrentPage - 1) * @PageSize
    SET @UpperBand  = (@CurrentPage * @PageSize) + 1    
       
	SET @SqlString='WITH sandlerTempTable AS
			(                    
				select 
				ct.lastname + '','' + ct.FirstName as FullName, 
				ct.phone,
				ct.ReferredBy , ct.Notes , ct.Country, ct.CreatedBy,ct.lastname,
				ct.Email, ct.contactsid ,cp.COMPANYNAME,
				ROW_NUMBER() OVER (ORDER BY '+ @SortExpression +' ) AS RowNumber
				from tbl_contacts ct 
	            left join tbl_companies cp on ct.companyid = cp.COMPANIESID
	            where ct.IsActive = 1  
	            and ct.companyid in (Select CompaniesId from tbl_Companies where FranchiseeId = '+ @FrId + ')
			)     
			SELECT * FROM sandlerTempTable 
			WHERE 
				RowNumber > ' + CONVERT(VARCHAR,@LowerBand) + '  AND RowNumber < ' + CONVERT(VARCHAR, @UpperBand)
				+ ' ORDER BY ' + @SortExpression     
				
	Print @SQLString
	EXEC sp_executesql @SqlString         
   END


            
GO

/****** Object:  StoredProcedure [dbo].[GetContactDataByCoachId]    Script Date: 11/26/2013 10:21:06 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[GetContactDataByCoachId]
    @PageSize int = null,
    @CurrentPage int = null,
    @SortExpression    nvarchar(max) = null,
    @CoachId varchar(20)
        
AS

BEGIN
    SET NOCOUNT ON

    DECLARE @SqlString nvarchar(max)
    Declare @UpperBand int
    Declare @LowerBand int        
    
    SET @LowerBand  = (@CurrentPage - 1) * @PageSize
    SET @UpperBand  = (@CurrentPage * @PageSize) + 1    
       
	SET @SqlString='WITH sandlerTempTable AS
			(                    
				select 
				ct.lastname + '','' + ct.FirstName as FullName, 
				ct.phone,
				ct.ReferredBy , ct.Notes , ct.Country, ct.CreatedBy,ct.lastname,
				ct.Email, ct.contactsid ,cp.COMPANYNAME,
				ROW_NUMBER() OVER (ORDER BY '+ @SortExpression +' ) AS RowNumber
				from tbl_contacts ct 
	            left join tbl_companies cp on ct.companyid = cp.COMPANIESID
	            where ct.IsActive = 1  
	            and ct.companyid in (Select CompaniesId from tbl_Companies where FranchiseeId in (Select id from Tbl_Franchisee  where CoachID = '+ @CoachId + '))  
				 
			)     
			SELECT * FROM sandlerTempTable 
			WHERE 
				RowNumber > ' + CONVERT(VARCHAR,@LowerBand) + '  AND RowNumber < ' + CONVERT(VARCHAR, @UpperBand)
				+ ' ORDER BY ' + @SortExpression     
				
	Print @SQLString
	EXEC sp_executesql @SqlString         
   END


            
GO

/****** Object:  StoredProcedure [dbo].[GetContactData]    Script Date: 11/26/2013 10:21:06 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[GetContactData]
    @PageSize int = null,
    @CurrentPage int = null,
    @SortExpression    nvarchar(max) = null
        
AS

BEGIN
    SET NOCOUNT ON

    DECLARE @SqlString nvarchar(max)
    Declare @UpperBand int
    Declare @LowerBand int        
    
    SET @LowerBand  = (@CurrentPage - 1) * @PageSize
    SET @UpperBand  = (@CurrentPage * @PageSize) + 1    
       
	SET @SqlString='WITH sandlerTempTable AS
			(                    
				select 
				ct.lastname + '','' + ct.FirstName as FullName, 
				ct.phone,
				ct.ReferredBy , ct.Notes , ct.Country, ct.CreatedBy,ct.lastname,
				ct.Email, ct.contactsid ,cp.COMPANYNAME,
				ROW_NUMBER() OVER (ORDER BY '+ @SortExpression +' ) AS RowNumber
				from tbl_contacts ct 
	            left join tbl_companies cp on ct.companyid = cp.COMPANIESID
	            where ct.IsActive = 1  
				
			)     
			SELECT * FROM sandlerTempTable 
			WHERE 
				RowNumber > ' + CONVERT(VARCHAR,@LowerBand) + '  AND RowNumber < ' + CONVERT(VARCHAR, @UpperBand)
				+ ' ORDER BY ' + @SortExpression     
				
	Print @SQLString
	EXEC sp_executesql @SqlString         
   END


            
GO

/****** Object:  StoredProcedure [dbo].[GetTableTotalCountContact]    Script Date: 11/26/2013 10:21:06 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[GetTableTotalCountContact]
(
	 @TableName varchar(100),
	 @CompId varchar(20)  = null,
	 @FrId varchar(20) = null,
	 @UserId varchar(20) = null,
	 @CoachId varchar(20) = null
)
AS
BEGIN

    DECLARE @SQLString VARCHAR(8000);
    	    
    SET NOCOUNT ON
    -- For Contact Table - Corpoprate with nothing selected
    if @TableName = 'CNT' and @CompId is null and @FrId is  null and @UserId is null and @CoachId is null
    Begin
		Set @SQLString = 'SELECT COUNT(*) FROM Tbl_Contacts where IsActive = 1'
    End
    -- For Contact Table - Corpoprate with nothing selected or user selects company
    if @TableName = 'CNT' and @CompId is not null and @FrId is  null and @UserId is null and @CoachId is null
    Begin
		Set @SQLString = 'SELECT COUNT(*) FROM Tbl_Contacts where IsActive = 1 and companyid = ' + @CompId
    End 
    --Print @SQLString
    -- For Contact Table - Based on FrId
    if @TableName = 'CNT' and @CompId is null and @FrId is not null and @UserId is null and @CoachId is null
    Begin
		Set @SQLString = 'SELECT COUNT(*) FROM Tbl_Contacts where IsActive = 1 and companyid in (Select CompaniesId from tbl_Companies where FranchiseeId = ' + @FrId + ')'
    End 
    -- For Contact Table - Based on CoachId
    if @TableName = 'CNT' and @CompId is null and @FrId is null and @UserId is null and @CoachId is not null
    Begin
		Set @SQLString = 'SELECT COUNT(*) FROM Tbl_Contacts where IsActive = 1 and companyid in (Select CompaniesId from tbl_Companies where FranchiseeId in (Select id from Tbl_Franchisee  where CoachID = ' + @CoachId + '))'
    End 
    -- For Contact Table - Based on UserId
    if @TableName = 'CNT' and @CompId is null and @FrId is null and @UserId is not null and @CoachId is null
    Begin
		Set @SQLString = 'SELECT COUNT(*) FROM Tbl_Contacts where IsActive = 1 and Upper(CreatedBy)  = ' + Upper(@UserId) 
    End 
    -- For Contact Table - Based on UserId and CompanyId
    if @TableName = 'CNT' and @CompId is not null and @FrId is null and @UserId is not null and @CoachId is null
    Begin
		Set @SQLString = 'SELECT COUNT(*) FROM Tbl_Contacts where IsActive = 1 and Upper(CreatedBy)  = ' + Upper(@UserId) + ' and companyid = ' + @CompId
    End 
        
    -- Now Print/Execute the Statement
    Print @SQLString
    EXEC(@SQLString);
	
    
        
END
GO

/****** Object:  StoredProcedure [dbo].[GetCompanyDataByFrId]    Script Date: 11/26/2013 10:21:06 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetCompanyDataByFrId]
    @PageSize int = null,
    @CurrentPage int = null,
    @SortExpression    nvarchar(max) = null,
    @FrId varchar(20)
        
AS

BEGIN
    SET NOCOUNT ON

    DECLARE @SqlString nvarchar(max)
    Declare @UpperBand int
    Declare @LowerBand int        
    
    SET @LowerBand  = (@CurrentPage - 1) * @PageSize
    SET @UpperBand  = (@CurrentPage * @PageSize) + 1    
       
	SET @SqlString='WITH sandlerTempTable AS
			(                    
				SELECT 
				cp.COMPANIESID,
				cp.COMPANYNAME,
				cp.RepLastName+'', ''+ cp.RepFirstName as Representative,
				p.ProductTypeName as Product,
				i.IndustryTypeName as Industry,
				cp.Address,	cp.Zip, cp.CreatedBy, 
	            cp.CITY,cp.STATE,
				dbo.GetTotalCompanyValue(COMPANIESID) as TotalCompanyValue,
				ROW_NUMBER() OVER (ORDER BY '+ @SortExpression +' ) AS RowNumber
				FROM TBL_COMPANIES cp
				left join TBL_FRANCHISEE f on f.ID = cp.FranchiseeId
				left join Tbl_YesNoOptions yno on yno.Value = cp.IsNewCompany 
				left join Tbl_YesNoOptions ynb on ynb.Value = cp.IsSameBillingAddress 
				left join TBL_OPPORTUNITIES os on cp.COMPANIESID = os.COMPANYID
				left join Tbl_ProductType p on os.PRODUCTID = p.Id 
				left join Tbl_IndustryType i on cp.IndustryId = i.IndId
				left join TBL_COACH ch on ch.ID = f.CoachID
				left join TBL_REGION rg on ch.RegionID = rg.ID  
				where cp.IsActive = 1
				and cp.FranchiseeId = '+ @FrId +'
				
			)     
			SELECT * FROM sandlerTempTable 
			WHERE 
				RowNumber > ' + CONVERT(VARCHAR,@LowerBand) + '  AND RowNumber < ' + CONVERT(VARCHAR, @UpperBand)
				+ ' ORDER BY ' + @SortExpression     
				
	Print @SQLString
	EXEC sp_executesql @SqlString         
   END


            
GO

/****** Object:  StoredProcedure [dbo].[GetCompanyDataByCoachId]    Script Date: 11/26/2013 10:21:07 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetCompanyDataByCoachId]
    @PageSize int = null,
    @CurrentPage int = null,
    @SortExpression    nvarchar(max) = null,
    @CoachId varchar(20)
        
AS

BEGIN
    SET NOCOUNT ON

    DECLARE @SqlString nvarchar(max)
    Declare @UpperBand int
    Declare @LowerBand int        
    
    SET @LowerBand  = (@CurrentPage - 1) * @PageSize
    SET @UpperBand  = (@CurrentPage * @PageSize) + 1    
       
	SET @SqlString='WITH sandlerTempTable AS
			(                    
				SELECT 
				cp.COMPANIESID,
				cp.COMPANYNAME,
				cp.RepLastName+'', ''+ cp.RepFirstName as Representative,
				p.ProductTypeName as Product,
				i.IndustryTypeName as Industry,
				cp.Address,	cp.Zip, cp.CreatedBy, 
	            cp.CITY,cp.STATE,
				dbo.GetTotalCompanyValue(COMPANIESID) as TotalCompanyValue,
				ROW_NUMBER() OVER (ORDER BY '+ @SortExpression +' ) AS RowNumber
				FROM TBL_COMPANIES cp
				left join TBL_FRANCHISEE f on f.ID = cp.FranchiseeId
				left join Tbl_YesNoOptions yno on yno.Value = cp.IsNewCompany 
				left join Tbl_YesNoOptions ynb on ynb.Value = cp.IsSameBillingAddress 
				left join TBL_OPPORTUNITIES os on cp.COMPANIESID = os.COMPANYID
				left join Tbl_ProductType p on os.PRODUCTID = p.Id 
				left join Tbl_IndustryType i on cp.IndustryId = i.IndId
				left join TBL_COACH ch on ch.ID = f.CoachID
				left join TBL_REGION rg on ch.RegionID = rg.ID  
				where cp.IsActive = 1
				and cp.FranchiseeId in (Select id from Tbl_Franchisee  where CoachID = '+ @CoachId + ')  
				
			)     
			SELECT * FROM sandlerTempTable 
			WHERE 
				RowNumber > ' + CONVERT(VARCHAR,@LowerBand) + '  AND RowNumber < ' + CONVERT(VARCHAR, @UpperBand)
				+ ' ORDER BY ' + @SortExpression     
				
	Print @SQLString
	EXEC sp_executesql @SqlString         
   END


            
GO

/****** Object:  StoredProcedure [dbo].[GetTableTotalCountCompany]    Script Date: 11/26/2013 10:21:07 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetTableTotalCountCompany]
(
	 @TableName varchar(100),
	 @CoachId varchar(20)  = null,
	 @FrId varchar(20) = null
)
AS
BEGIN

    DECLARE @SQLString VARCHAR(8000);
    	    
    SET NOCOUNT ON
    -- For Company Table
    if @TableName = 'CMP' and @CoachId is null and @FrId is  null
    Begin
		Set @SQLString = 'SELECT COUNT(*) FROM Tbl_Companies where IsActive = 1'
    End
       
    --Print @SQLString
       
    -- For Company Table For Coach User
    if @TableName = 'CMP' and @CoachId is not null and @FrId is null
    Begin
		Set @SQLString = 'SELECT COUNT(*) FROM Tbl_Companies where IsActive = 1 and FranchiseeId in (Select id from Tbl_Franchisee  where CoachID = ' + @CoachId + ')'
	End
       
    --Print @SQLString
              
    -- For Company Table For FrOwner or FrUser who has FrId with them
    if @TableName = 'CMP' and @CoachId is null and @FrId is not null
    Begin
		Set @SQLString = 'SELECT COUNT(*) FROM Tbl_Companies where IsActive = 1 and FranchiseeId = ' + @FrId  
    End
        
    -- Now Print/Execute the Statement
    Print @SQLString
    EXEC(@SQLString);
	
    
        
END
GO

/****** Object:  StoredProcedure [dbo].[GetCompanyData]    Script Date: 11/26/2013 10:21:07 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[GetCompanyData]
    @PageSize int = null,
    @CurrentPage int = null,
    @SortExpression    nvarchar(max) = null
        
AS

BEGIN
    SET NOCOUNT ON

    DECLARE @SqlString nvarchar(max)
    Declare @UpperBand int
    Declare @LowerBand int        
    
    SET @LowerBand  = (@CurrentPage - 1) * @PageSize
    SET @UpperBand  = (@CurrentPage * @PageSize) + 1    
       
	SET @SqlString='WITH sandlerTempTable AS
			(                    
				SELECT 
				cp.COMPANIESID,
				cp.COMPANYNAME,
				cp.RepLastName+'', ''+ cp.RepFirstName as Representative,
				p.ProductTypeName as Product,
				i.IndustryTypeName as Industry,
				cp.Address,	cp.Zip, cp.CreatedBy, 
	            cp.CITY,cp.STATE,
				dbo.GetTotalCompanyValue(COMPANIESID) as TotalCompanyValue,
				ROW_NUMBER() OVER (ORDER BY '+ @SortExpression +' ) AS RowNumber
				FROM TBL_COMPANIES cp
				left join TBL_FRANCHISEE f on f.ID = cp.FranchiseeId
				left join Tbl_YesNoOptions yno on yno.Value = cp.IsNewCompany 
				left join Tbl_YesNoOptions ynb on ynb.Value = cp.IsSameBillingAddress 
				left join TBL_OPPORTUNITIES os on cp.COMPANIESID = os.COMPANYID
				left join Tbl_ProductType p on os.PRODUCTID = p.Id 
				left join Tbl_IndustryType i on cp.IndustryId = i.IndId
				left join TBL_COACH ch on ch.ID = f.CoachID
				left join TBL_REGION rg on ch.RegionID = rg.ID  
				where cp.IsActive = 1
				
			)     
			SELECT * FROM sandlerTempTable 
			WHERE 
				RowNumber > ' + CONVERT(VARCHAR,@LowerBand) + '  AND RowNumber < ' + CONVERT(VARCHAR, @UpperBand)
				+ ' ORDER BY ' + @SortExpression     
				
	Print @SQLString
	EXEC sp_executesql @SqlString         
   END


            
GO

/****** Object:  StoredProcedure [dbo].[GetFranchiseesData]    Script Date: 11/26/2013 10:21:07 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[GetFranchiseesData]
    @PageSize int = null,
    @CurrentPage int = null,
    @SortExpression    nvarchar(max) = null,
    @TableName varchar(100) = null,
    @FilterText varchar(100) = null
AS

BEGIN
    SET NOCOUNT ON

    DECLARE @SqlString nvarchar(max)
    Declare @UpperBand int
    Declare @LowerBand int        
    
    SET @LowerBand  = (@CurrentPage - 1) * @PageSize
    SET @UpperBand  = (@CurrentPage * @PageSize) + 1    

   if @TableName = 'FRS'
   BEGIN
	   BEGIN
	    	if @FilterText is null 
				BEGIN
			   SET @SqlString='WITH sandlerTempTable AS
			(                    
				SELECT ID, 			
				LastName, 
				FirstName,
				Name,
				WorkEmail, 
				OfficePhone,
				LastCreatedDate as LastUpdatedDate,
				ROW_NUMBER() OVER (ORDER BY '+ @SortExpression +' ) AS RowNumber
				FROM TBL_Franchisee 
				where (WorkEmail is null or Upper(WorkEmail) != ''SANDLERSPM@MINEDSYSTEMS.COM'')
				and IsActive = 1
			)     
			SELECT * FROM sandlerTempTable 
			WHERE 
				RowNumber > ' + CONVERT(VARCHAR,@LowerBand) + '  AND RowNumber < ' + CONVERT(VARCHAR, @UpperBand)
				+ ' ORDER BY ' + @SortExpression     
				
				 
			END
	        
	        if @FilterText is not null and @FilterText != ''
				BEGIN
				SET @SqlString='WITH sandlerTempTable AS
			(                    
				SELECT ID, 			
				LastName, 
				FirstName,
				Name,
				WorkEmail, 
				OfficePhone,
				LastCreatedDate as LastUpdatedDate,
				ROW_NUMBER() OVER (ORDER BY '+ @SortExpression +' ) AS RowNumber
				FROM TBL_Franchisee 
				where (WorkEmail is null or Upper(WorkEmail) != ''SANDLERSPM@MINEDSYSTEMS.COM'')
				and IsActive = 1 
				and (Upper(LastName) like ''' + '%' + @FilterText  + '%' + ''''
				+ ' OR Upper(FirstName) like ''' + '%' + @FilterText  + '%' + ''''
				+ ' OR Upper(Name) like ''' + '%' + @FilterText  + '%' + ''''
				+ ' OR Upper(WorkEmail) like ''' + '%' + @FilterText  + '%' + ''''
				+ ')
								
			)     
			SELECT * FROM sandlerTempTable 
			WHERE 
				RowNumber > ' + CONVERT(VARCHAR,@LowerBand) + '  AND RowNumber < ' + CONVERT(VARCHAR, @UpperBand)
				+ ' ORDER BY ' + @SortExpression   
								 
			END
	    
	    Print @SQLString
	    EXEC sp_executesql @SqlString         
       END
   END
END


            
GO

/****** Object:  StoredProcedure [dbo].[GetTableTotalCount]    Script Date: 11/26/2013 10:21:07 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetTableTotalCount]
(
	 @TableName varchar(100),
	 @CompanyId int = null,
	 @FilterText varchar(100) = null
)
AS
BEGIN

    DECLARE @SQLString VARCHAR(8000);
    	    
    SET NOCOUNT ON
    -- For Franchisees
    if @TableName = 'FRS'
    Begin
		Set @SQLString = 'SELECT COUNT(*) FROM Tbl_Franchisee where IsActive = 1'
    End
           
	-- For Filter Section
	if @FilterText is not null and @FilterText != '' and @TableName = 'FRS'
	Begin
		SET @SQLString = @SQLString + ' and (Upper(LastName) like ''' + '%' + @FilterText  + '%' + '''' 
		SET @SQLString = @SQLString + ' OR Upper(FirstName) like ''' + '%' + @FilterText  + '%' + ''''
		SET @SQLString = @SQLString + ' OR Upper(Name) like ''' + '%' + @FilterText  + '%' + ''''
		SET @SQLString = @SQLString + ' OR Upper(WorkEmail) like ''' + '%' + @FilterText  + '%' + ''''
		SET @SQLString = @SQLString + ')' 
	End
    -- Now Print/Execute the Statement
    Print @SQLString
    EXEC(@SQLString);
	
    
        
END
GO


