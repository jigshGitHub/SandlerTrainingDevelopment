--Executed 2/13/2013 5:00AM

INSERT INTO [dbo].[TBL_OpportunityWhyLost] (Name) Values('No Budget');
Update [dbo].[TBL_OpportunityWhyLost] Set SortOrder = 1 Where Name =	'No Budget';
Update [dbo].[TBL_OpportunityWhyLost] Set SortOrder = 2 Where Name =	'Lost Funding';
Update [dbo].[TBL_OpportunityWhyLost] Set SortOrder = 3 Where Name =	'Competition';
Update [dbo].[TBL_OpportunityWhyLost] Set SortOrder = 4 Where Name =	'Customer Cancelled';
Update [dbo].[TBL_OpportunityWhyLost] Set SortOrder = 5 Where Name =	'No Bid';


/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportglaa]    Script Date: 02/11/2013 20:44:08 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetHomeOfficeReportglaa]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetHomeOfficeReportglaa]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportfrmd]    Script Date: 02/11/2013 20:44:08 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetHomeOfficeReportfrmd]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetHomeOfficeReportfrmd]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportprpl]    Script Date: 02/11/2013 20:44:08 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetHomeOfficeReportprpl]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetHomeOfficeReportprpl]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportmsfc]    Script Date: 02/11/2013 20:44:08 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetHomeOfficeReportmsfc]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetHomeOfficeReportmsfc]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportzcbt]    Script Date: 02/11/2013 20:44:08 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetHomeOfficeReportzcbt]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetHomeOfficeReportzcbt]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportsere]    Script Date: 02/11/2013 20:44:08 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetHomeOfficeReportsere]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetHomeOfficeReportsere]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportctra]    Script Date: 02/11/2013 20:44:08 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetHomeOfficeReportctra]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetHomeOfficeReportctra]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportdhsa]    Script Date: 02/11/2013 20:44:08 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetHomeOfficeReportdhsa]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetHomeOfficeReportdhsa]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportmsrbymktgcom]    Script Date: 02/11/2013 20:44:08 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetHomeOfficeReportmsrbymktgcom]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetHomeOfficeReportmsrbymktgcom]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportmsrbyadvboard]    Script Date: 02/11/2013 20:44:08 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetHomeOfficeReportmsrbyadvboard]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetHomeOfficeReportmsrbyadvboard]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportmsrbykeyopnldr]    Script Date: 02/11/2013 20:44:08 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetHomeOfficeReportmsrbykeyopnldr]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetHomeOfficeReportmsrbykeyopnldr]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportmfrd]    Script Date: 02/11/2013 20:44:08 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetHomeOfficeReportmfrd]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetHomeOfficeReportmfrd]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportmsfr]    Script Date: 02/11/2013 20:44:08 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetHomeOfficeReportmsfr]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetHomeOfficeReportmsfr]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportfrbyusingcrm]    Script Date: 02/11/2013 20:44:08 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetHomeOfficeReportfrbyusingcrm]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetHomeOfficeReportfrbyusingcrm]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportfrbycertlevel]    Script Date: 02/11/2013 20:44:08 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetHomeOfficeReportfrbycertlevel]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetHomeOfficeReportfrbycertlevel]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportfrbybusarea]    Script Date: 02/11/2013 20:44:08 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetHomeOfficeReportfrbybusarea]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetHomeOfficeReportfrbybusarea]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportfrbycontdetails]    Script Date: 02/11/2013 20:44:08 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetHomeOfficeReportfrbycontdetails]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetHomeOfficeReportfrbycontdetails]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportfrbytrngdate]    Script Date: 02/11/2013 20:44:08 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetHomeOfficeReportfrbytrngdate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetHomeOfficeReportfrbytrngdate]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportfrbyawlevel]    Script Date: 02/11/2013 20:44:08 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetHomeOfficeReportfrbyawlevel]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetHomeOfficeReportfrbyawlevel]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportfrbycountry]    Script Date: 02/11/2013 20:44:08 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetHomeOfficeReportfrbycountry]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetHomeOfficeReportfrbycountry]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportfrbystate]    Script Date: 02/11/2013 20:44:08 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetHomeOfficeReportfrbystate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetHomeOfficeReportfrbystate]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportfrbyregion]    Script Date: 02/11/2013 20:44:08 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetHomeOfficeReportfrbyregion]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetHomeOfficeReportfrbyregion]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportfrbycoach]    Script Date: 02/11/2013 20:44:08 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetHomeOfficeReportfrbycoach]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetHomeOfficeReportfrbycoach]
GO

USE [SandlerDB]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportglaa]    Script Date: 02/11/2013 20:44:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_GetHomeOfficeReportglaa]
	
	(		
		@reportType Varchar(100)
	)
	
AS
	If(@reportType<>'Excel') 
	SELECT A.ID AS DATAROWID,	
		case when IsRepAgreement=1 then 'Yes' else 'No' end as 'Agreement?',		
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',	
		Isnull(A.NAME,'') AS 'Franchise Name',		
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'Contact Number',
			Convert(varchar(12),A.LASTCREATEDDATE,101) as 'Last Updated'
		FROM DBO.TBL_FRANCHISEE A					
		ORDER BY a.IsRepAgreement
	Else
		SELECT 		
		case when IsRepAgreement=1 then 'Yes' else 'No' end as 'Agreement?',		
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',	
		Isnull(A.NAME,'') AS 'Franchise Name',		
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'Contact Number',
			Convert(varchar(12),A.LASTCREATEDDATE,101) as 'Last Updated',			
			i.UserName as 'Last Updated By',
			Convert(varchar(12),A.CreatedDate,101) AS 'Last Updated',J.UserName as 'Last Created By',
			k.SandlerRoleText as 'Sandler Role', a.Title,
			Isnull(A.EMAILADDRESS,'') as Email,Isnull(a.WebAddress,'') as Website,
			Case when A.IsActive='1' Then 'Active' else 'InActive' end as Active,			
			IsNull(A.Address1,'')+' '+IsNull(A.Address2,'') as Address,
			Isnull(A.City,''),Isnull(A.State,''),Isnull(A.Zip,''),Isnull(c.Name,'') as Country,
			Isnull(A.PhoneNumber,''),Isnull(a.OfficePhone,'') as 'Office Phone',
			Isnull(a.HomePhone,'') as 'Home Phone', Isnull(a.MobilePhone,'') as 'Mobile Phone',
			Isnull(a.Fax,''), Isnull(a.FaxNumber,'') as 'Fax Number',
			Convert(varchar(12),A.DHSAwardDate,101) as 'Award Date',
			Isnull(l.AwardLevelText,'') as 'Award Level',Isnull(m.PurchaseLevelText,'') as 'Purchase Level',
			Isnull(n.CertifiedLevelText,'') as 'Certified Level',Isnull(o.PrimaryBusinessText,'') as 'Primary Business',
			Convert(varchar(12),A.InitialContractDate,101) as 'Initial Contact Date',
			Convert(varchar(12),A.RenewalDate,101) as 'Renewal Date',
			Convert(varchar(12),A.ContractFormDate,101) as 'Contact Form Date',
			case when IsContractorPermitted=1 then 'Yes' else 'No' end as 'Contractor Permitted',
			case when IsSandlerMailRequired=1 then 'Yes' else 'No' end as 'Sandler Mail Required',
			case when IsKOLMember=1 then 'Yes' else 'No' end as 'KOL Member',
			case when IsAdvBoard=1 then 'Yes' else 'No' end as 'Advisory Board',
			case when IsMktgCommittee=1 then 'Yes' else 'No' end as 'Marketing Committee',
			case when IsUsingSandlerCRM=1 then 'Yes' else 'No' end as 'Using Sandler CRM',
			case when IsDHSAwardWinner=1 then 'Yes' else 'No' end as 'DHS Award Winner',
			Convert(varchar(12),A.DHSAwardDate,101) as 'DHS Award Date',
			Convert(varchar(12),A.InitialTrngDate,101) as 'Initial Training Date',
			case when IsReqToSubmitFinancial=1 then 'Yes' else 'No' end as 'Required To Submit Financial',
			case when IsRepAgreement=1 then 'Yes' else 'No' end as 'Representive Agreement',
			Isnull(a.WorkEmail,'') as 'Work Email',Isnull(a.WorkAddress,'') as 'Work Address',Isnull(a.WorkCity,'') as 'Work City',
			Isnull(d.Name,'') as 'Work State',Isnull(a.WorkZip,'') as 'Work Zip',Isnull(e.Name,'') as 'Work Country',
			Isnull(a.AlternateEmail,'') as 'Alternate Email',case when a.IsSameHomeAddress ='1' then 'Yes' else 'No' end as 'Same Home Address',
			Isnull(a.HomeAddress,'') as 'Home Address',Isnull(a.HomeCity,'') as 'Home City',Isnull(f.Name,'') as 'Home State',Isnull(a.HomeZip,'') as 'Home Zip',
			Isnull(g.Name,'') as 'Home Country',Isnull(a.SpouseName,'') as 'Spouse Name',
			Convert(varchar(12),A.Birthday,101) as 'Birth Day',
			Convert(varchar(12),A.Anniversary,101) as 'Anniversary',a.YearsWithCompany as 'Years With Company',
			case when a.IsMasterFranchiseeExists=1 then 'Yes' else 'No' end as 'Is Master Franchisee',
			case when a.IsCanPrintLocally=1 then 'Yes' else 'No' end as 'Local Print',
			case when a.IsBuyFromCustomer=1 then 'Yes' else 'No' end as 'Buy From Customer',
			case when a.IsFixedPricePurchase=1 then 'Yes' else 'No' end as 'Fixed Price Purchase',
			Isnull(p.CostPlusAmountText,'') as 'Cost Plus Amount',
			case when a.IsBehindInTerDev=1 then 'Yes' else 'No' end as 'Behind in Territory Develop',
			Isnull(q.BehindAmountText,'') as 'Amount Behind'
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
		left join dbo.Tbl_PrimaryBusiness O on a.PrimaryBusinessId = o.PrimaryBusinessId
		left join dbo.Tbl_CostPlusAmount P on a.CostPlusAmountId=p.CostPlusAmountId
		left join dbo.tbl_BehindAmount Q on a.BehindAmountId=Q.BehindAmountId
		ORDER BY a.IsRepAgreement
	
	
	

GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportfrmd]    Script Date: 02/11/2013 20:44:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_GetHomeOfficeReportfrmd]
	
	(		
		@reportType Varchar(100)
	)
	
AS
	If(@reportType<>'Excel') 
	SELECT A.ID AS DATAROWID,			
		Isnull(A.NAME,'') AS 'Franchise Name',
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',		
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'Contact Number',
			Convert(varchar(12),A.LASTCREATEDDATE,101) as 'Last Updated'
		FROM DBO.TBL_FRANCHISEE A	
		where a.SandlerRoleId=4
		ORDER BY A.NAME
	Else
		SELECT 				
		Isnull(A.NAME,'') AS 'Franchise Name',
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',		
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'Contact Number',
			Convert(varchar(12),A.LASTCREATEDDATE,101) as 'Last Updated',			
			i.UserName as 'Last Updated By',
			Convert(varchar(12),A.CreatedDate,101) AS 'Last Updated',J.UserName as 'Last Created By',
			k.SandlerRoleText as 'Sandler Role', a.Title,
			Isnull(A.EMAILADDRESS,'') as Email,Isnull(a.WebAddress,'') as Website,
			Case when A.IsActive='1' Then 'Active' else 'InActive' end as Active,			
			IsNull(A.Address1,'')+' '+IsNull(A.Address2,'') as Address,
			Isnull(A.City,''),Isnull(A.State,''),Isnull(A.Zip,''),Isnull(c.Name,'') as Country,
			Isnull(A.PhoneNumber,''),Isnull(a.OfficePhone,'') as 'Office Phone',
			Isnull(a.HomePhone,'') as 'Home Phone', Isnull(a.MobilePhone,'') as 'Mobile Phone',
			Isnull(a.Fax,''), Isnull(a.FaxNumber,'') as 'Fax Number',
			Convert(varchar(12),A.DHSAwardDate,101) as 'Award Date',
			Isnull(l.AwardLevelText,'') as 'Award Level',Isnull(m.PurchaseLevelText,'') as 'Purchase Level',
			Isnull(n.CertifiedLevelText,'') as 'Certified Level',Isnull(o.PrimaryBusinessText,'') as 'Primary Business',
			Convert(varchar(12),A.InitialContractDate,101) as 'Initial Contact Date',
			Convert(varchar(12),A.RenewalDate,101) as 'Renewal Date',
			Convert(varchar(12),A.ContractFormDate,101) as 'Contact Form Date',
			case when IsContractorPermitted=1 then 'Yes' else 'No' end as 'Contractor Permitted',
			case when IsSandlerMailRequired=1 then 'Yes' else 'No' end as 'Sandler Mail Required',
			case when IsKOLMember=1 then 'Yes' else 'No' end as 'KOL Member',
			case when IsAdvBoard=1 then 'Yes' else 'No' end as 'Advisory Board',
			case when IsMktgCommittee=1 then 'Yes' else 'No' end as 'Marketing Committee',
			case when IsUsingSandlerCRM=1 then 'Yes' else 'No' end as 'Using Sandler CRM',
			case when IsDHSAwardWinner=1 then 'Yes' else 'No' end as 'DHS Award Winner',
			Convert(varchar(12),A.DHSAwardDate,101) as 'DHS Award Date',
			Convert(varchar(12),A.InitialTrngDate,101) as 'Initial Training Date',
			case when IsReqToSubmitFinancial=1 then 'Yes' else 'No' end as 'Required To Submit Financial',
			case when IsRepAgreement=1 then 'Yes' else 'No' end as 'Representive Agreement',
			Isnull(a.WorkEmail,'') as 'Work Email',Isnull(a.WorkAddress,'') as 'Work Address',Isnull(a.WorkCity,'') as 'Work City',
			Isnull(d.Name,'') as 'Work State',Isnull(a.WorkZip,'') as 'Work Zip',Isnull(e.Name,'') as 'Work Country',
			Isnull(a.AlternateEmail,'') as 'Alternate Email',case when a.IsSameHomeAddress ='1' then 'Yes' else 'No' end as 'Same Home Address',
			Isnull(a.HomeAddress,'') as 'Home Address',Isnull(a.HomeCity,'') as 'Home City',Isnull(f.Name,'') as 'Home State',Isnull(a.HomeZip,'') as 'Home Zip',
			Isnull(g.Name,'') as 'Home Country',Isnull(a.SpouseName,'') as 'Spouse Name',
			Convert(varchar(12),A.Birthday,101) as 'Birth Day',
			Convert(varchar(12),A.Anniversary,101) as 'Anniversary',a.YearsWithCompany as 'Years With Company',
			case when a.IsMasterFranchiseeExists=1 then 'Yes' else 'No' end as 'Is Master Franchisee',
			case when a.IsCanPrintLocally=1 then 'Yes' else 'No' end as 'Local Print',
			case when a.IsBuyFromCustomer=1 then 'Yes' else 'No' end as 'Buy From Customer',
			case when a.IsFixedPricePurchase=1 then 'Yes' else 'No' end as 'Fixed Price Purchase',
			Isnull(p.CostPlusAmountText,'') as 'Cost Plus Amount',
			case when a.IsBehindInTerDev=1 then 'Yes' else 'No' end as 'Behind in Territory Develop',
			Isnull(q.BehindAmountText,'') as 'Amount Behind'
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
		left join dbo.Tbl_PrimaryBusiness O on a.PrimaryBusinessId = o.PrimaryBusinessId
		left join dbo.Tbl_CostPlusAmount P on a.CostPlusAmountId=p.CostPlusAmountId
		left join dbo.tbl_BehindAmount Q on a.BehindAmountId=Q.BehindAmountId
		where a.SandlerRoleId=4
		ORDER BY A.NAME
	
	
	

GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportprpl]    Script Date: 02/11/2013 20:44:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_GetHomeOfficeReportprpl]
	
	(		
		@reportType Varchar(100)
	)
	
AS
	If(@reportType<>'Excel') 
	SELECT A.ID AS DATAROWID,	
	b.PurchaseLevelText as 'Product Level',			
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',	
Isnull(A.NAME,'') AS 'Franchise Name',		
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'Contact Number',
			Convert(varchar(12),A.LASTCREATEDDATE,101) as 'Last Updated'
		FROM DBO.TBL_FRANCHISEE A	
		left join dbo.Tbl_PurchaseLevel B on a.PurchaseLevelId = B.PurchaseLevelId
		ORDER BY b.PurchaseLevelText
	Else
		SELECT 		
		M.PurchaseLevelText as 'Product Level',		
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',	
	Isnull(A.NAME,'') AS 'Franchise Name',		
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'Contact Number',
			Convert(varchar(12),A.LASTCREATEDDATE,101) as 'Last Updated',			
			i.UserName as 'Last Updated By',
			Convert(varchar(12),A.CreatedDate,101) AS 'Last Updated',J.UserName as 'Last Created By',
			k.SandlerRoleText as 'Sandler Role', a.Title,
			Isnull(A.EMAILADDRESS,'') as Email,Isnull(a.WebAddress,'') as Website,
			Case when A.IsActive='1' Then 'Active' else 'InActive' end as Active,			
			IsNull(A.Address1,'')+' '+IsNull(A.Address2,'') as Address,
			Isnull(A.City,''),Isnull(A.State,''),Isnull(A.Zip,''),Isnull(c.Name,'') as Country,
			Isnull(A.PhoneNumber,''),Isnull(a.OfficePhone,'') as 'Office Phone',
			Isnull(a.HomePhone,'') as 'Home Phone', Isnull(a.MobilePhone,'') as 'Mobile Phone',
			Isnull(a.Fax,''), Isnull(a.FaxNumber,'') as 'Fax Number',
			Convert(varchar(12),A.DHSAwardDate,101) as 'Award Date',
			Isnull(l.AwardLevelText,'') as 'Award Level',Isnull(m.PurchaseLevelText,'') as 'Purchase Level',
			Isnull(n.CertifiedLevelText,'') as 'Certified Level',Isnull(o.PrimaryBusinessText,'') as 'Primary Business',
			Convert(varchar(12),A.InitialContractDate,101) as 'Initial Contact Date',
			Convert(varchar(12),A.RenewalDate,101) as 'Renewal Date',
			Convert(varchar(12),A.ContractFormDate,101) as 'Contact Form Date',
			case when IsContractorPermitted=1 then 'Yes' else 'No' end as 'Contractor Permitted',
			case when IsSandlerMailRequired=1 then 'Yes' else 'No' end as 'Sandler Mail Required',
			case when IsKOLMember=1 then 'Yes' else 'No' end as 'KOL Member',
			case when IsAdvBoard=1 then 'Yes' else 'No' end as 'Advisory Board',
			case when IsMktgCommittee=1 then 'Yes' else 'No' end as 'Marketing Committee',
			case when IsUsingSandlerCRM=1 then 'Yes' else 'No' end as 'Using Sandler CRM',
			case when IsDHSAwardWinner=1 then 'Yes' else 'No' end as 'DHS Award Winner',
			Convert(varchar(12),A.DHSAwardDate,101) as 'DHS Award Date',
			Convert(varchar(12),A.InitialTrngDate,101) as 'Initial Training Date',
			case when IsReqToSubmitFinancial=1 then 'Yes' else 'No' end as 'Required To Submit Financial',
			case when IsRepAgreement=1 then 'Yes' else 'No' end as 'Representive Agreement',
			Isnull(a.WorkEmail,'') as 'Work Email',Isnull(a.WorkAddress,'') as 'Work Address',Isnull(a.WorkCity,'') as 'Work City',
			Isnull(d.Name,'') as 'Work State',Isnull(a.WorkZip,'') as 'Work Zip',Isnull(e.Name,'') as 'Work Country',
			Isnull(a.AlternateEmail,'') as 'Alternate Email',case when a.IsSameHomeAddress ='1' then 'Yes' else 'No' end as 'Same Home Address',
			Isnull(a.HomeAddress,'') as 'Home Address',Isnull(a.HomeCity,'') as 'Home City',Isnull(f.Name,'') as 'Home State',Isnull(a.HomeZip,'') as 'Home Zip',
			Isnull(g.Name,'') as 'Home Country',Isnull(a.SpouseName,'') as 'Spouse Name',
			Convert(varchar(12),A.Birthday,101) as 'Birth Day',
			Convert(varchar(12),A.Anniversary,101) as 'Anniversary',a.YearsWithCompany as 'Years With Company',
			case when a.IsMasterFranchiseeExists=1 then 'Yes' else 'No' end as 'Is Master Franchisee',
			case when a.IsCanPrintLocally=1 then 'Yes' else 'No' end as 'Local Print',
			case when a.IsBuyFromCustomer=1 then 'Yes' else 'No' end as 'Buy From Customer',
			case when a.IsFixedPricePurchase=1 then 'Yes' else 'No' end as 'Fixed Price Purchase',
			Isnull(p.CostPlusAmountText,'') as 'Cost Plus Amount',
			case when a.IsBehindInTerDev=1 then 'Yes' else 'No' end as 'Behind in Territory Develop',
			Isnull(q.BehindAmountText,'') as 'Amount Behind'
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
		left join dbo.Tbl_PrimaryBusiness O on a.PrimaryBusinessId = o.PrimaryBusinessId
		left join dbo.Tbl_CostPlusAmount P on a.CostPlusAmountId=p.CostPlusAmountId
		left join dbo.tbl_BehindAmount Q on a.BehindAmountId=Q.BehindAmountId
		ORDER BY M.PurchaseLevelText
	
	
	

GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportmsfc]    Script Date: 02/11/2013 20:44:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_GetHomeOfficeReportmsfc]
	
	(		
		@reportType Varchar(100)
	)
	
AS
	If(@reportType<>'Excel') 
	SELECT A.ID AS DATAROWID,	
	case when IsReqToSubmitFinancial=1 then 'Yes' else 'No' end as 'Must Submit',	
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',
		Isnull(A.NAME,'') AS 'Franchise Name',		
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'Contact Number',
			Convert(varchar(12),A.LASTCREATEDDATE,101) as 'Last Updated'
		FROM DBO.TBL_FRANCHISEE A	
		ORDER BY a.IsReqToSubmitFinancial
	Else
		SELECT 		
		case when IsReqToSubmitFinancial=1 then 'Yes' else 'No' end as 'Must Submit',			
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',
		Isnull(A.NAME,'') AS 'Franchise Name',		
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'Contact Number',
			Convert(varchar(12),A.LASTCREATEDDATE,101) as 'Last Updated',			
			i.UserName as 'Last Updated By',
			Convert(varchar(12),A.CreatedDate,101) AS 'Last Updated',J.UserName as 'Last Created By',
			k.SandlerRoleText as 'Sandler Role', a.Title,
			Isnull(A.EMAILADDRESS,'') as Email,Isnull(a.WebAddress,'') as Website,
			Case when A.IsActive='1' Then 'Active' else 'InActive' end as Active,			
			IsNull(A.Address1,'')+' '+IsNull(A.Address2,'') as Address,
			Isnull(A.City,''),Isnull(A.State,''),Isnull(A.Zip,''),Isnull(c.Name,'') as Country,
			Isnull(A.PhoneNumber,''),Isnull(a.OfficePhone,'') as 'Office Phone',
			Isnull(a.HomePhone,'') as 'Home Phone', Isnull(a.MobilePhone,'') as 'Mobile Phone',
			Isnull(a.Fax,''), Isnull(a.FaxNumber,'') as 'Fax Number',
			Convert(varchar(12),A.DHSAwardDate,101) as 'Award Date',
			Isnull(l.AwardLevelText,'') as 'Award Level',Isnull(m.PurchaseLevelText,'') as 'Purchase Level',
			Isnull(n.CertifiedLevelText,'') as 'Certified Level',Isnull(o.PrimaryBusinessText,'') as 'Primary Business',
			Convert(varchar(12),A.InitialContractDate,101) as 'Initial Contact Date',
			Convert(varchar(12),A.RenewalDate,101) as 'Renewal Date',
			Convert(varchar(12),A.ContractFormDate,101) as 'Contact Form Date',
			case when IsContractorPermitted=1 then 'Yes' else 'No' end as 'Contractor Permitted',
			case when IsSandlerMailRequired=1 then 'Yes' else 'No' end as 'Sandler Mail Required',
			case when IsKOLMember=1 then 'Yes' else 'No' end as 'KOL Member',
			case when IsAdvBoard=1 then 'Yes' else 'No' end as 'Advisory Board',
			case when IsMktgCommittee=1 then 'Yes' else 'No' end as 'Marketing Committee',
			case when IsUsingSandlerCRM=1 then 'Yes' else 'No' end as 'Using Sandler CRM',
			case when IsDHSAwardWinner=1 then 'Yes' else 'No' end as 'DHS Award Winner',
			Convert(varchar(12),A.DHSAwardDate,101) as 'DHS Award Date',
			Convert(varchar(12),A.InitialTrngDate,101) as 'Initial Training Date',
			case when IsReqToSubmitFinancial=1 then 'Yes' else 'No' end as 'Required To Submit Financial',
			case when IsRepAgreement=1 then 'Yes' else 'No' end as 'Representive Agreement',
			Isnull(a.WorkEmail,'') as 'Work Email',Isnull(a.WorkAddress,'') as 'Work Address',Isnull(a.WorkCity,'') as 'Work City',
			Isnull(d.Name,'') as 'Work State',Isnull(a.WorkZip,'') as 'Work Zip',Isnull(e.Name,'') as 'Work Country',
			Isnull(a.AlternateEmail,'') as 'Alternate Email',case when a.IsSameHomeAddress ='1' then 'Yes' else 'No' end as 'Same Home Address',
			Isnull(a.HomeAddress,'') as 'Home Address',Isnull(a.HomeCity,'') as 'Home City',Isnull(f.Name,'') as 'Home State',Isnull(a.HomeZip,'') as 'Home Zip',
			Isnull(g.Name,'') as 'Home Country',Isnull(a.SpouseName,'') as 'Spouse Name',
			Convert(varchar(12),A.Birthday,101) as 'Birth Day',
			Convert(varchar(12),A.Anniversary,101) as 'Anniversary',a.YearsWithCompany as 'Years With Company',
			case when a.IsMasterFranchiseeExists=1 then 'Yes' else 'No' end as 'Is Master Franchisee',
			case when a.IsCanPrintLocally=1 then 'Yes' else 'No' end as 'Local Print',
			case when a.IsBuyFromCustomer=1 then 'Yes' else 'No' end as 'Buy From Customer',
			case when a.IsFixedPricePurchase=1 then 'Yes' else 'No' end as 'Fixed Price Purchase',
			Isnull(p.CostPlusAmountText,'') as 'Cost Plus Amount',
			case when a.IsBehindInTerDev=1 then 'Yes' else 'No' end as 'Behind in Territory Develop',
			Isnull(q.BehindAmountText,'') as 'Amount Behind'
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
		left join dbo.Tbl_PrimaryBusiness O on a.PrimaryBusinessId = o.PrimaryBusinessId
		left join dbo.Tbl_CostPlusAmount P on a.CostPlusAmountId=p.CostPlusAmountId
		left join dbo.tbl_BehindAmount Q on a.BehindAmountId=Q.BehindAmountId
		ORDER BY a.IsReqToSubmitFinancial
	
	
	

GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportzcbt]    Script Date: 02/11/2013 20:44:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_GetHomeOfficeReportzcbt]
	
	(		
		@reportType Varchar(100)
	)
	
AS
	If(@reportType<>'Excel') 
	SELECT A.ID AS DATAROWID,	
	C.Name as 'Territory',a.Zip as 'Zip Code',	
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',
		Isnull(A.NAME,'') AS 'Franchise Name',		
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'Contact Number',
			Convert(varchar(12),A.LASTCREATEDDATE,101) as 'Last Updated'
		FROM DBO.TBL_FRANCHISEE A	
		Join dbo.TBL_COACH B on a.CoachID=b.ID
		Join dbo.TBL_REGION C on b.RegionID=c.ID			
		ORDER BY C.Name
	Else
		SELECT 		
		h.Name as 'Territory',a.Zip as 'Zip Code',	
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',		
		Isnull(A.NAME,'') AS 'Franchise Name',
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'Contact Number',
			Convert(varchar(12),A.LASTCREATEDDATE,101) as 'Last Updated',			
			i.UserName as 'Last Updated By',
			Convert(varchar(12),A.CreatedDate,101) AS 'Last Updated',J.UserName as 'Last Created By',
			k.SandlerRoleText as 'Sandler Role', a.Title,
			Isnull(A.EMAILADDRESS,'') as Email,Isnull(a.WebAddress,'') as Website,
			Case when A.IsActive='1' Then 'Active' else 'InActive' end as Active,			
			IsNull(A.Address1,'')+' '+IsNull(A.Address2,'') as Address,
			Isnull(A.City,''),Isnull(A.State,''),Isnull(A.Zip,''),Isnull(c.Name,'') as Country,
			Isnull(A.PhoneNumber,''),Isnull(a.OfficePhone,'') as 'Office Phone',
			Isnull(a.HomePhone,'') as 'Home Phone', Isnull(a.MobilePhone,'') as 'Mobile Phone',
			Isnull(a.Fax,''), Isnull(a.FaxNumber,'') as 'Fax Number',
			Convert(varchar(12),A.DHSAwardDate,101) as 'Award Date',
			Isnull(l.AwardLevelText,'') as 'Award Level',Isnull(m.PurchaseLevelText,'') as 'Purchase Level',
			Isnull(n.CertifiedLevelText,'') as 'Certified Level',Isnull(o.PrimaryBusinessText,'') as 'Primary Business',
			Convert(varchar(12),A.InitialContractDate,101) as 'Initial Contact Date',
			Convert(varchar(12),A.RenewalDate,101) as 'Renewal Date',
			Convert(varchar(12),A.ContractFormDate,101) as 'Contact Form Date',
			case when IsContractorPermitted=1 then 'Yes' else 'No' end as 'Contractor Permitted',
			case when IsSandlerMailRequired=1 then 'Yes' else 'No' end as 'Sandler Mail Required',
			case when IsKOLMember=1 then 'Yes' else 'No' end as 'KOL Member',
			case when IsAdvBoard=1 then 'Yes' else 'No' end as 'Advisory Board',
			case when IsMktgCommittee=1 then 'Yes' else 'No' end as 'Marketing Committee',
			case when IsUsingSandlerCRM=1 then 'Yes' else 'No' end as 'Using Sandler CRM',
			case when IsDHSAwardWinner=1 then 'Yes' else 'No' end as 'DHS Award Winner',
			Convert(varchar(12),A.DHSAwardDate,101) as 'DHS Award Date',
			Convert(varchar(12),A.InitialTrngDate,101) as 'Initial Training Date',
			case when IsReqToSubmitFinancial=1 then 'Yes' else 'No' end as 'Required To Submit Financial',
			case when IsRepAgreement=1 then 'Yes' else 'No' end as 'Representive Agreement',
			Isnull(a.WorkEmail,'') as 'Work Email',Isnull(a.WorkAddress,'') as 'Work Address',Isnull(a.WorkCity,'') as 'Work City',
			Isnull(d.Name,'') as 'Work State',Isnull(a.WorkZip,'') as 'Work Zip',Isnull(e.Name,'') as 'Work Country',
			Isnull(a.AlternateEmail,'') as 'Alternate Email',case when a.IsSameHomeAddress ='1' then 'Yes' else 'No' end as 'Same Home Address',
			Isnull(a.HomeAddress,'') as 'Home Address',Isnull(a.HomeCity,'') as 'Home City',Isnull(f.Name,'') as 'Home State',Isnull(a.HomeZip,'') as 'Home Zip',
			Isnull(g.Name,'') as 'Home Country',Isnull(a.SpouseName,'') as 'Spouse Name',
			Convert(varchar(12),A.Birthday,101) as 'Birth Day',
			Convert(varchar(12),A.Anniversary,101) as 'Anniversary',a.YearsWithCompany as 'Years With Company',
			case when a.IsMasterFranchiseeExists=1 then 'Yes' else 'No' end as 'Is Master Franchisee',
			case when a.IsCanPrintLocally=1 then 'Yes' else 'No' end as 'Local Print',
			case when a.IsBuyFromCustomer=1 then 'Yes' else 'No' end as 'Buy From Customer',
			case when a.IsFixedPricePurchase=1 then 'Yes' else 'No' end as 'Fixed Price Purchase',
			Isnull(p.CostPlusAmountText,'') as 'Cost Plus Amount',
			case when a.IsBehindInTerDev=1 then 'Yes' else 'No' end as 'Behind in Territory Develop',
			Isnull(q.BehindAmountText,'') as 'Amount Behind'
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
		left join dbo.Tbl_PrimaryBusiness O on a.PrimaryBusinessId = o.PrimaryBusinessId
		left join dbo.Tbl_CostPlusAmount P on a.CostPlusAmountId=p.CostPlusAmountId
		left join dbo.tbl_BehindAmount Q on a.BehindAmountId=Q.BehindAmountId
		ORDER BY h.Name
	
	
	

GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportsere]    Script Date: 02/11/2013 20:44:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_GetHomeOfficeReportsere]
	
	(		
		@reportType Varchar(100)
	)
	
AS
	If(@reportType<>'Excel') 
	SELECT A.ID AS DATAROWID,	
	case when IsSandlerMailRequired=1 then 'Yes' else 'No' end as 'EMail Required',
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',	
		Isnull(A.NAME,'') AS 'Franchise Name',		
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'Contact Number',
			Convert(varchar(12),A.LASTCREATEDDATE,101) as 'Last Updated'
		FROM DBO.TBL_FRANCHISEE A						
		ORDER BY A.IsSandlerMailRequired
	Else
		SELECT 		
		case when IsSandlerMailRequired=1 then 'Yes' else 'No' end as 'EMail Required',
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',
		Isnull(A.NAME,'') AS 'Franchise Name',		
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'Contact Number',
			Convert(varchar(12),A.LASTCREATEDDATE,101) as 'Last Updated',			
			i.UserName as 'Last Updated By',
			Convert(varchar(12),A.CreatedDate,101) AS 'Last Updated',J.UserName as 'Last Created By',
			k.SandlerRoleText as 'Sandler Role', a.Title,
			Isnull(A.EMAILADDRESS,'') as Email,Isnull(a.WebAddress,'') as Website,
			Case when A.IsActive='1' Then 'Active' else 'InActive' end as Active,			
			IsNull(A.Address1,'')+' '+IsNull(A.Address2,'') as Address,
			Isnull(A.City,''),Isnull(A.State,''),Isnull(A.Zip,''),Isnull(c.Name,'') as Country,
			Isnull(A.PhoneNumber,''),Isnull(a.OfficePhone,'') as 'Office Phone',
			Isnull(a.HomePhone,'') as 'Home Phone', Isnull(a.MobilePhone,'') as 'Mobile Phone',
			Isnull(a.Fax,''), Isnull(a.FaxNumber,'') as 'Fax Number',
			Convert(varchar(12),A.DHSAwardDate,101) as 'Award Date',
			Isnull(l.AwardLevelText,'') as 'Award Level',Isnull(m.PurchaseLevelText,'') as 'Purchase Level',
			Isnull(n.CertifiedLevelText,'') as 'Certified Level',Isnull(o.PrimaryBusinessText,'') as 'Primary Business',
			Convert(varchar(12),A.InitialContractDate,101) as 'Initial Contact Date',
			Convert(varchar(12),A.RenewalDate,101) as 'Renewal Date',
			Convert(varchar(12),A.ContractFormDate,101) as 'Contact Form Date',
			case when IsContractorPermitted=1 then 'Yes' else 'No' end as 'Contractor Permitted',
			case when IsSandlerMailRequired=1 then 'Yes' else 'No' end as 'Sandler Mail Required',
			case when IsKOLMember=1 then 'Yes' else 'No' end as 'KOL Member',
			case when IsAdvBoard=1 then 'Yes' else 'No' end as 'Advisory Board',
			case when IsMktgCommittee=1 then 'Yes' else 'No' end as 'Marketing Committee',
			case when IsUsingSandlerCRM=1 then 'Yes' else 'No' end as 'Using Sandler CRM',
			case when IsDHSAwardWinner=1 then 'Yes' else 'No' end as 'DHS Award Winner',
			Convert(varchar(12),A.DHSAwardDate,101) as 'DHS Award Date',
			Convert(varchar(12),A.InitialTrngDate,101) as 'Initial Training Date',
			case when IsReqToSubmitFinancial=1 then 'Yes' else 'No' end as 'Required To Submit Financial',
			case when IsRepAgreement=1 then 'Yes' else 'No' end as 'Representive Agreement',
			Isnull(a.WorkEmail,'') as 'Work Email',Isnull(a.WorkAddress,'') as 'Work Address',Isnull(a.WorkCity,'') as 'Work City',
			Isnull(d.Name,'') as 'Work State',Isnull(a.WorkZip,'') as 'Work Zip',Isnull(e.Name,'') as 'Work Country',
			Isnull(a.AlternateEmail,'') as 'Alternate Email',case when a.IsSameHomeAddress ='1' then 'Yes' else 'No' end as 'Same Home Address',
			Isnull(a.HomeAddress,'') as 'Home Address',Isnull(a.HomeCity,'') as 'Home City',Isnull(f.Name,'') as 'Home State',Isnull(a.HomeZip,'') as 'Home Zip',
			Isnull(g.Name,'') as 'Home Country',Isnull(a.SpouseName,'') as 'Spouse Name',
			Convert(varchar(12),A.Birthday,101) as 'Birth Day',
			Convert(varchar(12),A.Anniversary,101) as 'Anniversary',a.YearsWithCompany as 'Years With Company',
			case when a.IsMasterFranchiseeExists=1 then 'Yes' else 'No' end as 'Is Master Franchisee',
			case when a.IsCanPrintLocally=1 then 'Yes' else 'No' end as 'Local Print',
			case when a.IsBuyFromCustomer=1 then 'Yes' else 'No' end as 'Buy From Customer',
			case when a.IsFixedPricePurchase=1 then 'Yes' else 'No' end as 'Fixed Price Purchase',
			Isnull(p.CostPlusAmountText,'') as 'Cost Plus Amount',
			case when a.IsBehindInTerDev=1 then 'Yes' else 'No' end as 'Behind in Territory Develop',
			Isnull(q.BehindAmountText,'') as 'Amount Behind'
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
		left join dbo.Tbl_PrimaryBusiness O on a.PrimaryBusinessId = o.PrimaryBusinessId
		left join dbo.Tbl_CostPlusAmount P on a.CostPlusAmountId=p.CostPlusAmountId
		left join dbo.tbl_BehindAmount Q on a.BehindAmountId=Q.BehindAmountId
		ORDER BY A.IsSandlerMailRequired
	
	
	

GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportctra]    Script Date: 02/11/2013 20:44:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_GetHomeOfficeReportctra]
	
	(		
		@reportType Varchar(100)
	)
	
AS
	If(@reportType<>'Excel') 
	SELECT A.ID AS DATAROWID,	
	case when IsContractorPermitted=1 then 'Yes' else 'No' end as 'Contractor Allowed',
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',
		Isnull(A.NAME,'') AS 'Franchise Name',		
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'Contact Number',
			Convert(varchar(12),A.LASTCREATEDDATE,101) as 'Last Updated'
		FROM DBO.TBL_FRANCHISEE A						
		ORDER BY A.IsContractorPermitted
	Else
		SELECT 		
		case when IsContractorPermitted=1 then 'Yes' else 'No' end as 'Contractor Allowed',
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',	
		Isnull(A.NAME,'') AS 'Franchise Name',		
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'Contact Number',
			Convert(varchar(12),A.LASTCREATEDDATE,101) as 'Last Updated',			
			i.UserName as 'Last Updated By',
			Convert(varchar(12),A.CreatedDate,101) AS 'Last Updated',J.UserName as 'Last Created By',
			k.SandlerRoleText as 'Sandler Role', a.Title,
			Isnull(A.EMAILADDRESS,'') as Email,Isnull(a.WebAddress,'') as Website,
			Case when A.IsActive='1' Then 'Active' else 'InActive' end as Active,			
			IsNull(A.Address1,'')+' '+IsNull(A.Address2,'') as Address,
			Isnull(A.City,''),Isnull(A.State,''),Isnull(A.Zip,''),Isnull(c.Name,'') as Country,
			Isnull(A.PhoneNumber,''),Isnull(a.OfficePhone,'') as 'Office Phone',
			Isnull(a.HomePhone,'') as 'Home Phone', Isnull(a.MobilePhone,'') as 'Mobile Phone',
			Isnull(a.Fax,''), Isnull(a.FaxNumber,'') as 'Fax Number',
			Convert(varchar(12),A.DHSAwardDate,101) as 'Award Date',
			Isnull(l.AwardLevelText,'') as 'Award Level',Isnull(m.PurchaseLevelText,'') as 'Purchase Level',
			Isnull(n.CertifiedLevelText,'') as 'Certified Level',Isnull(o.PrimaryBusinessText,'') as 'Primary Business',
			Convert(varchar(12),A.InitialContractDate,101) as 'Initial Contact Date',
			Convert(varchar(12),A.RenewalDate,101) as 'Renewal Date',
			Convert(varchar(12),A.ContractFormDate,101) as 'Contact Form Date',
			case when IsContractorPermitted=1 then 'Yes' else 'No' end as 'Contractor Permitted',
			case when IsSandlerMailRequired=1 then 'Yes' else 'No' end as 'Sandler Mail Required',
			case when IsKOLMember=1 then 'Yes' else 'No' end as 'KOL Member',
			case when IsAdvBoard=1 then 'Yes' else 'No' end as 'Advisory Board',
			case when IsMktgCommittee=1 then 'Yes' else 'No' end as 'Marketing Committee',
			case when IsUsingSandlerCRM=1 then 'Yes' else 'No' end as 'Using Sandler CRM',
			case when IsDHSAwardWinner=1 then 'Yes' else 'No' end as 'DHS Award Winner',
			Convert(varchar(12),A.DHSAwardDate,101) as 'DHS Award Date',
			Convert(varchar(12),A.InitialTrngDate,101) as 'Initial Training Date',
			case when IsReqToSubmitFinancial=1 then 'Yes' else 'No' end as 'Required To Submit Financial',
			case when IsRepAgreement=1 then 'Yes' else 'No' end as 'Representive Agreement',
			Isnull(a.WorkEmail,'') as 'Work Email',Isnull(a.WorkAddress,'') as 'Work Address',Isnull(a.WorkCity,'') as 'Work City',
			Isnull(d.Name,'') as 'Work State',Isnull(a.WorkZip,'') as 'Work Zip',Isnull(e.Name,'') as 'Work Country',
			Isnull(a.AlternateEmail,'') as 'Alternate Email',case when a.IsSameHomeAddress ='1' then 'Yes' else 'No' end as 'Same Home Address',
			Isnull(a.HomeAddress,'') as 'Home Address',Isnull(a.HomeCity,'') as 'Home City',Isnull(f.Name,'') as 'Home State',Isnull(a.HomeZip,'') as 'Home Zip',
			Isnull(g.Name,'') as 'Home Country',Isnull(a.SpouseName,'') as 'Spouse Name',
			Convert(varchar(12),A.Birthday,101) as 'Birth Day',
			Convert(varchar(12),A.Anniversary,101) as 'Anniversary',a.YearsWithCompany as 'Years With Company',
			case when a.IsMasterFranchiseeExists=1 then 'Yes' else 'No' end as 'Is Master Franchisee',
			case when a.IsCanPrintLocally=1 then 'Yes' else 'No' end as 'Local Print',
			case when a.IsBuyFromCustomer=1 then 'Yes' else 'No' end as 'Buy From Customer',
			case when a.IsFixedPricePurchase=1 then 'Yes' else 'No' end as 'Fixed Price Purchase',
			Isnull(p.CostPlusAmountText,'') as 'Cost Plus Amount',
			case when a.IsBehindInTerDev=1 then 'Yes' else 'No' end as 'Behind in Territory Develop',
			Isnull(q.BehindAmountText,'') as 'Amount Behind'
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
		left join dbo.Tbl_PrimaryBusiness O on a.PrimaryBusinessId = o.PrimaryBusinessId
		left join dbo.Tbl_CostPlusAmount P on a.CostPlusAmountId=p.CostPlusAmountId
		left join dbo.tbl_BehindAmount Q on a.BehindAmountId=Q.BehindAmountId
		ORDER BY A.IsContractorPermitted
	
	
	

GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportdhsa]    Script Date: 02/11/2013 20:44:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_GetHomeOfficeReportdhsa]
	
	(		
		@reportType Varchar(100)
	)
	
AS
	If(@reportType<>'Excel') 
	SELECT A.ID AS DATAROWID,				
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',
		Isnull(A.NAME,'') AS 'Franchise Name',		
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'Contact Number',
			Convert(varchar(12),A.LASTCREATEDDATE,101) as 'Last Updated'
		FROM DBO.TBL_FRANCHISEE A						
		where a.IsDHSAwardWinner =1
		ORDER BY A.NAME
	Else
		SELECT 						
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',	
		Isnull(A.NAME,'') AS 'Franchise Name',		
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'Contact Number',
			Convert(varchar(12),A.LASTCREATEDDATE,101) as 'Last Updated',			
			i.UserName as 'Last Updated By',
			Convert(varchar(12),A.CreatedDate,101) AS 'Last Updated',J.UserName as 'Last Created By',
			k.SandlerRoleText as 'Sandler Role', a.Title,
			Isnull(A.EMAILADDRESS,'') as Email,Isnull(a.WebAddress,'') as Website,
			Case when A.IsActive='1' Then 'Active' else 'InActive' end as Active,			
			IsNull(A.Address1,'')+' '+IsNull(A.Address2,'') as Address,
			Isnull(A.City,''),Isnull(A.State,''),Isnull(A.Zip,''),Isnull(c.Name,'') as Country,
			Isnull(A.PhoneNumber,''),Isnull(a.OfficePhone,'') as 'Office Phone',
			Isnull(a.HomePhone,'') as 'Home Phone', Isnull(a.MobilePhone,'') as 'Mobile Phone',
			Isnull(a.Fax,''), Isnull(a.FaxNumber,'') as 'Fax Number',
			Convert(varchar(12),A.DHSAwardDate,101) as 'Award Date',
			Isnull(l.AwardLevelText,'') as 'Award Level',Isnull(m.PurchaseLevelText,'') as 'Purchase Level',
			Isnull(n.CertifiedLevelText,'') as 'Certified Level',Isnull(o.PrimaryBusinessText,'') as 'Primary Business',
			Convert(varchar(12),A.InitialContractDate,101) as 'Initial Contact Date',
			Convert(varchar(12),A.RenewalDate,101) as 'Renewal Date',
			Convert(varchar(12),A.ContractFormDate,101) as 'Contact Form Date',
			case when IsContractorPermitted=1 then 'Yes' else 'No' end as 'Contractor Permitted',
			case when IsSandlerMailRequired=1 then 'Yes' else 'No' end as 'Sandler Mail Required',
			case when IsKOLMember=1 then 'Yes' else 'No' end as 'KOL Member',
			case when IsAdvBoard=1 then 'Yes' else 'No' end as 'Advisory Board',
			case when IsMktgCommittee=1 then 'Yes' else 'No' end as 'Marketing Committee',
			case when IsUsingSandlerCRM=1 then 'Yes' else 'No' end as 'Using Sandler CRM',
			case when IsDHSAwardWinner=1 then 'Yes' else 'No' end as 'DHS Award Winner',
			Convert(varchar(12),A.DHSAwardDate,101) as 'DHS Award Date',
			Convert(varchar(12),A.InitialTrngDate,101) as 'Initial Training Date',
			case when IsReqToSubmitFinancial=1 then 'Yes' else 'No' end as 'Required To Submit Financial',
			case when IsRepAgreement=1 then 'Yes' else 'No' end as 'Representive Agreement',
			Isnull(a.WorkEmail,'') as 'Work Email',Isnull(a.WorkAddress,'') as 'Work Address',Isnull(a.WorkCity,'') as 'Work City',
			Isnull(d.Name,'') as 'Work State',Isnull(a.WorkZip,'') as 'Work Zip',Isnull(e.Name,'') as 'Work Country',
			Isnull(a.AlternateEmail,'') as 'Alternate Email',case when a.IsSameHomeAddress ='1' then 'Yes' else 'No' end as 'Same Home Address',
			Isnull(a.HomeAddress,'') as 'Home Address',Isnull(a.HomeCity,'') as 'Home City',Isnull(f.Name,'') as 'Home State',Isnull(a.HomeZip,'') as 'Home Zip',
			Isnull(g.Name,'') as 'Home Country',Isnull(a.SpouseName,'') as 'Spouse Name',
			Convert(varchar(12),A.Birthday,101) as 'Birth Day',
			Convert(varchar(12),A.Anniversary,101) as 'Anniversary',a.YearsWithCompany as 'Years With Company',
			case when a.IsMasterFranchiseeExists=1 then 'Yes' else 'No' end as 'Is Master Franchisee',
			case when a.IsCanPrintLocally=1 then 'Yes' else 'No' end as 'Local Print',
			case when a.IsBuyFromCustomer=1 then 'Yes' else 'No' end as 'Buy From Customer',
			case when a.IsFixedPricePurchase=1 then 'Yes' else 'No' end as 'Fixed Price Purchase',
			Isnull(p.CostPlusAmountText,'') as 'Cost Plus Amount',
			case when a.IsBehindInTerDev=1 then 'Yes' else 'No' end as 'Behind in Territory Develop',
			Isnull(q.BehindAmountText,'') as 'Amount Behind'
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
		left join dbo.Tbl_PrimaryBusiness O on a.PrimaryBusinessId = o.PrimaryBusinessId
		left join dbo.Tbl_CostPlusAmount P on a.CostPlusAmountId=p.CostPlusAmountId
		left join dbo.tbl_BehindAmount Q on a.BehindAmountId=Q.BehindAmountId
		where a.IsDHSAwardWinner =1
		ORDER BY A.NAME
	
	
	

GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportmsrbymktgcom]    Script Date: 02/11/2013 20:44:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_GetHomeOfficeReportmsrbymktgcom]
	
	(		
		@reportType Varchar(100)
	)
	
AS
	If(@reportType<>'Excel') 
	SELECT A.ID AS DATAROWID,		
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',
		Isnull(A.NAME,'') AS 'Franchise Name',		
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'Contact Number',
			Convert(varchar(12),A.LASTCREATEDDATE,101) as 'Last Updated'
		FROM DBO.TBL_FRANCHISEE A						
		where a.IsMktgCommittee =1
		ORDER BY A.NAME
	Else
		SELECT 						
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',	
		Isnull(A.NAME,'') AS 'Franchise Name',		
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'Contact Number',
			Convert(varchar(12),A.LASTCREATEDDATE,101) as 'Last Updated',			
			i.UserName as 'Last Updated By',
			Convert(varchar(12),A.CreatedDate,101) AS 'Last Updated',J.UserName as 'Last Created By',
			k.SandlerRoleText as 'Sandler Role', a.Title,
			Isnull(A.EMAILADDRESS,'') as Email,Isnull(a.WebAddress,'') as Website,
			Case when A.IsActive='1' Then 'Active' else 'InActive' end as Active,			
			IsNull(A.Address1,'')+' '+IsNull(A.Address2,'') as Address,
			Isnull(A.City,''),Isnull(A.State,''),Isnull(A.Zip,''),Isnull(c.Name,'') as Country,
			Isnull(A.PhoneNumber,''),Isnull(a.OfficePhone,'') as 'Office Phone',
			Isnull(a.HomePhone,'') as 'Home Phone', Isnull(a.MobilePhone,'') as 'Mobile Phone',
			Isnull(a.Fax,''), Isnull(a.FaxNumber,'') as 'Fax Number',
			Convert(varchar(12),A.DHSAwardDate,101) as 'Award Date',
			Isnull(l.AwardLevelText,'') as 'Award Level',Isnull(m.PurchaseLevelText,'') as 'Purchase Level',
			Isnull(n.CertifiedLevelText,'') as 'Certified Level',Isnull(o.PrimaryBusinessText,'') as 'Primary Business',
			Convert(varchar(12),A.InitialContractDate,101) as 'Initial Contact Date',
			Convert(varchar(12),A.RenewalDate,101) as 'Renewal Date',
			Convert(varchar(12),A.ContractFormDate,101) as 'Contact Form Date',
			case when IsContractorPermitted=1 then 'Yes' else 'No' end as 'Contractor Permitted',
			case when IsSandlerMailRequired=1 then 'Yes' else 'No' end as 'Sandler Mail Required',
			case when IsKOLMember=1 then 'Yes' else 'No' end as 'KOL Member',
			case when IsAdvBoard=1 then 'Yes' else 'No' end as 'Advisory Board',
			case when IsMktgCommittee=1 then 'Yes' else 'No' end as 'Marketing Committee',
			case when IsUsingSandlerCRM=1 then 'Yes' else 'No' end as 'Using Sandler CRM',
			case when IsDHSAwardWinner=1 then 'Yes' else 'No' end as 'DHS Award Winner',
			Convert(varchar(12),A.DHSAwardDate,101) as 'DHS Award Date',
			Convert(varchar(12),A.InitialTrngDate,101) as 'Initial Training Date',
			case when IsReqToSubmitFinancial=1 then 'Yes' else 'No' end as 'Required To Submit Financial',
			case when IsRepAgreement=1 then 'Yes' else 'No' end as 'Representive Agreement',
			Isnull(a.WorkEmail,'') as 'Work Email',Isnull(a.WorkAddress,'') as 'Work Address',Isnull(a.WorkCity,'') as 'Work City',
			Isnull(d.Name,'') as 'Work State',Isnull(a.WorkZip,'') as 'Work Zip',Isnull(e.Name,'') as 'Work Country',
			Isnull(a.AlternateEmail,'') as 'Alternate Email',case when a.IsSameHomeAddress ='1' then 'Yes' else 'No' end as 'Same Home Address',
			Isnull(a.HomeAddress,'') as 'Home Address',Isnull(a.HomeCity,'') as 'Home City',Isnull(f.Name,'') as 'Home State',Isnull(a.HomeZip,'') as 'Home Zip',
			Isnull(g.Name,'') as 'Home Country',Isnull(a.SpouseName,'') as 'Spouse Name',
			Convert(varchar(12),A.Birthday,101) as 'Birth Day',
			Convert(varchar(12),A.Anniversary,101) as 'Anniversary',a.YearsWithCompany as 'Years With Company',
			case when a.IsMasterFranchiseeExists=1 then 'Yes' else 'No' end as 'Is Master Franchisee',
			case when a.IsCanPrintLocally=1 then 'Yes' else 'No' end as 'Local Print',
			case when a.IsBuyFromCustomer=1 then 'Yes' else 'No' end as 'Buy From Customer',
			case when a.IsFixedPricePurchase=1 then 'Yes' else 'No' end as 'Fixed Price Purchase',
			Isnull(p.CostPlusAmountText,'') as 'Cost Plus Amount',
			case when a.IsBehindInTerDev=1 then 'Yes' else 'No' end as 'Behind in Territory Develop',
			Isnull(q.BehindAmountText,'') as 'Amount Behind'
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
		left join dbo.Tbl_PrimaryBusiness O on a.PrimaryBusinessId = o.PrimaryBusinessId
		left join dbo.Tbl_CostPlusAmount P on a.CostPlusAmountId=p.CostPlusAmountId
		left join dbo.tbl_BehindAmount Q on a.BehindAmountId=Q.BehindAmountId
		where a.IsMktgCommittee =1
		ORDER BY A.NAME
	
	
	

GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportmsrbyadvboard]    Script Date: 02/11/2013 20:44:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_GetHomeOfficeReportmsrbyadvboard]
	
	(		
		@reportType Varchar(100)
	)
	
AS
	If(@reportType<>'Excel') 
	SELECT A.ID AS DATAROWID,				
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',	
		Isnull(A.NAME,'') AS 'Franchise Name',		
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'Contact Number',
			Convert(varchar(12),A.LASTCREATEDDATE,101) as 'Last Updated'
		FROM DBO.TBL_FRANCHISEE A						
		where a.IsAdvBoard =1
		ORDER BY A.NAME
	Else
		SELECT 						
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',	
Isnull(A.NAME,'') AS 'Franchise Name',		
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'Contact Number',
			Convert(varchar(12),A.LASTCREATEDDATE,101) as 'Last Updated',			
			i.UserName as 'Last Updated By',
			Convert(varchar(12),A.CreatedDate,101) AS 'Last Updated',J.UserName as 'Last Created By',
			k.SandlerRoleText as 'Sandler Role', a.Title,
			Isnull(A.EMAILADDRESS,'') as Email,Isnull(a.WebAddress,'') as Website,
			Case when A.IsActive='1' Then 'Active' else 'InActive' end as Active,			
			IsNull(A.Address1,'')+' '+IsNull(A.Address2,'') as Address,
			Isnull(A.City,''),Isnull(A.State,''),Isnull(A.Zip,''),Isnull(c.Name,'') as Country,
			Isnull(A.PhoneNumber,''),Isnull(a.OfficePhone,'') as 'Office Phone',
			Isnull(a.HomePhone,'') as 'Home Phone', Isnull(a.MobilePhone,'') as 'Mobile Phone',
			Isnull(a.Fax,''), Isnull(a.FaxNumber,'') as 'Fax Number',
			Convert(varchar(12),A.DHSAwardDate,101) as 'Award Date',
			Isnull(l.AwardLevelText,'') as 'Award Level',Isnull(m.PurchaseLevelText,'') as 'Purchase Level',
			Isnull(n.CertifiedLevelText,'') as 'Certified Level',Isnull(o.PrimaryBusinessText,'') as 'Primary Business',
			Convert(varchar(12),A.InitialContractDate,101) as 'Initial Contact Date',
			Convert(varchar(12),A.RenewalDate,101) as 'Renewal Date',
			Convert(varchar(12),A.ContractFormDate,101) as 'Contact Form Date',
			case when IsContractorPermitted=1 then 'Yes' else 'No' end as 'Contractor Permitted',
			case when IsSandlerMailRequired=1 then 'Yes' else 'No' end as 'Sandler Mail Required',
			case when IsKOLMember=1 then 'Yes' else 'No' end as 'KOL Member',
			case when IsAdvBoard=1 then 'Yes' else 'No' end as 'Advisory Board',
			case when IsMktgCommittee=1 then 'Yes' else 'No' end as 'Marketing Committee',
			case when IsUsingSandlerCRM=1 then 'Yes' else 'No' end as 'Using Sandler CRM',
			case when IsDHSAwardWinner=1 then 'Yes' else 'No' end as 'DHS Award Winner',
			Convert(varchar(12),A.DHSAwardDate,101) as 'DHS Award Date',
			Convert(varchar(12),A.InitialTrngDate,101) as 'Initial Training Date',
			case when IsReqToSubmitFinancial=1 then 'Yes' else 'No' end as 'Required To Submit Financial',
			case when IsRepAgreement=1 then 'Yes' else 'No' end as 'Representive Agreement',
			Isnull(a.WorkEmail,'') as 'Work Email',Isnull(a.WorkAddress,'') as 'Work Address',Isnull(a.WorkCity,'') as 'Work City',
			Isnull(d.Name,'') as 'Work State',Isnull(a.WorkZip,'') as 'Work Zip',Isnull(e.Name,'') as 'Work Country',
			Isnull(a.AlternateEmail,'') as 'Alternate Email',case when a.IsSameHomeAddress ='1' then 'Yes' else 'No' end as 'Same Home Address',
			Isnull(a.HomeAddress,'') as 'Home Address',Isnull(a.HomeCity,'') as 'Home City',Isnull(f.Name,'') as 'Home State',Isnull(a.HomeZip,'') as 'Home Zip',
			Isnull(g.Name,'') as 'Home Country',Isnull(a.SpouseName,'') as 'Spouse Name',
			Convert(varchar(12),A.Birthday,101) as 'Birth Day',
			Convert(varchar(12),A.Anniversary,101) as 'Anniversary',a.YearsWithCompany as 'Years With Company',
			case when a.IsMasterFranchiseeExists=1 then 'Yes' else 'No' end as 'Is Master Franchisee',
			case when a.IsCanPrintLocally=1 then 'Yes' else 'No' end as 'Local Print',
			case when a.IsBuyFromCustomer=1 then 'Yes' else 'No' end as 'Buy From Customer',
			case when a.IsFixedPricePurchase=1 then 'Yes' else 'No' end as 'Fixed Price Purchase',
			Isnull(p.CostPlusAmountText,'') as 'Cost Plus Amount',
			case when a.IsBehindInTerDev=1 then 'Yes' else 'No' end as 'Behind in Territory Develop',
			Isnull(q.BehindAmountText,'') as 'Amount Behind'
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
		left join dbo.Tbl_PrimaryBusiness O on a.PrimaryBusinessId = o.PrimaryBusinessId
		left join dbo.Tbl_CostPlusAmount P on a.CostPlusAmountId=p.CostPlusAmountId
		left join dbo.tbl_BehindAmount Q on a.BehindAmountId=Q.BehindAmountId
		where a.IsAdvBoard =1
		ORDER BY A.NAME
	
	
	

GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportmsrbykeyopnldr]    Script Date: 02/11/2013 20:44:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_GetHomeOfficeReportmsrbykeyopnldr]
	
	(		
		@reportType Varchar(100)
	)
	
AS
	If(@reportType<>'Excel') 
	SELECT A.ID AS DATAROWID,				
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',	
Isnull(A.NAME,'') AS 'Franchise Name',		
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'Contact Number',
			Convert(varchar(12),A.LASTCREATEDDATE,101) as 'Last Updated'
		FROM DBO.TBL_FRANCHISEE A						
		where a.IsKOLMember=1
		ORDER BY A.NAME
	Else
		SELECT 						
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',	
		Isnull(A.NAME,'') AS 'Franchise Name',		
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'Contact Number',
			Convert(varchar(12),A.LASTCREATEDDATE,101) as 'Last Updated',			
			i.UserName as 'Last Updated By',
			Convert(varchar(12),A.CreatedDate,101) AS 'Last Updated',J.UserName as 'Last Created By',
			k.SandlerRoleText as 'Sandler Role', a.Title,
			Isnull(A.EMAILADDRESS,'') as Email,Isnull(a.WebAddress,'') as Website,
			Case when A.IsActive='1' Then 'Active' else 'InActive' end as Active,			
			IsNull(A.Address1,'')+' '+IsNull(A.Address2,'') as Address,
			Isnull(A.City,''),Isnull(A.State,''),Isnull(A.Zip,''),Isnull(c.Name,'') as Country,
			Isnull(A.PhoneNumber,''),Isnull(a.OfficePhone,'') as 'Office Phone',
			Isnull(a.HomePhone,'') as 'Home Phone', Isnull(a.MobilePhone,'') as 'Mobile Phone',
			Isnull(a.Fax,''), Isnull(a.FaxNumber,'') as 'Fax Number',
			Convert(varchar(12),A.DHSAwardDate,101) as 'Award Date',
			Isnull(l.AwardLevelText,'') as 'Award Level',Isnull(m.PurchaseLevelText,'') as 'Purchase Level',
			Isnull(n.CertifiedLevelText,'') as 'Certified Level',Isnull(o.PrimaryBusinessText,'') as 'Primary Business',
			Convert(varchar(12),A.InitialContractDate,101) as 'Initial Contact Date',
			Convert(varchar(12),A.RenewalDate,101) as 'Renewal Date',
			Convert(varchar(12),A.ContractFormDate,101) as 'Contact Form Date',
			case when IsContractorPermitted=1 then 'Yes' else 'No' end as 'Contractor Permitted',
			case when IsSandlerMailRequired=1 then 'Yes' else 'No' end as 'Sandler Mail Required',
			case when IsKOLMember=1 then 'Yes' else 'No' end as 'KOL Member',
			case when IsAdvBoard=1 then 'Yes' else 'No' end as 'Advisory Board',
			case when IsMktgCommittee=1 then 'Yes' else 'No' end as 'Marketing Committee',
			case when IsUsingSandlerCRM=1 then 'Yes' else 'No' end as 'Using Sandler CRM',
			case when IsDHSAwardWinner=1 then 'Yes' else 'No' end as 'DHS Award Winner',
			Convert(varchar(12),A.DHSAwardDate,101) as 'DHS Award Date',
			Convert(varchar(12),A.InitialTrngDate,101) as 'Initial Training Date',
			case when IsReqToSubmitFinancial=1 then 'Yes' else 'No' end as 'Required To Submit Financial',
			case when IsRepAgreement=1 then 'Yes' else 'No' end as 'Representive Agreement',
			Isnull(a.WorkEmail,'') as 'Work Email',Isnull(a.WorkAddress,'') as 'Work Address',Isnull(a.WorkCity,'') as 'Work City',
			Isnull(d.Name,'') as 'Work State',Isnull(a.WorkZip,'') as 'Work Zip',Isnull(e.Name,'') as 'Work Country',
			Isnull(a.AlternateEmail,'') as 'Alternate Email',case when a.IsSameHomeAddress ='1' then 'Yes' else 'No' end as 'Same Home Address',
			Isnull(a.HomeAddress,'') as 'Home Address',Isnull(a.HomeCity,'') as 'Home City',Isnull(f.Name,'') as 'Home State',Isnull(a.HomeZip,'') as 'Home Zip',
			Isnull(g.Name,'') as 'Home Country',Isnull(a.SpouseName,'') as 'Spouse Name',
			Convert(varchar(12),A.Birthday,101) as 'Birth Day',
			Convert(varchar(12),A.Anniversary,101) as 'Anniversary',a.YearsWithCompany as 'Years With Company',
			case when a.IsMasterFranchiseeExists=1 then 'Yes' else 'No' end as 'Is Master Franchisee',
			case when a.IsCanPrintLocally=1 then 'Yes' else 'No' end as 'Local Print',
			case when a.IsBuyFromCustomer=1 then 'Yes' else 'No' end as 'Buy From Customer',
			case when a.IsFixedPricePurchase=1 then 'Yes' else 'No' end as 'Fixed Price Purchase',
			Isnull(p.CostPlusAmountText,'') as 'Cost Plus Amount',
			case when a.IsBehindInTerDev=1 then 'Yes' else 'No' end as 'Behind in Territory Develop',
			Isnull(q.BehindAmountText,'') as 'Amount Behind'
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
		left join dbo.Tbl_PrimaryBusiness O on a.PrimaryBusinessId = o.PrimaryBusinessId
		left join dbo.Tbl_CostPlusAmount P on a.CostPlusAmountId=p.CostPlusAmountId
		left join dbo.tbl_BehindAmount Q on a.BehindAmountId=Q.BehindAmountId
		where a.IsKOLMember=1
		ORDER BY A.NAME
	
	
	

GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportmfrd]    Script Date: 02/11/2013 20:44:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_GetHomeOfficeReportmfrd]
	
	(		
		@reportType Varchar(100)
	)
	
AS
	If(@reportType<>'Excel') 
	SELECT A.ID AS DATAROWID,	
	D.MasterFranchiseeName AS 'Master Franchise',			
		Isnull(A.NAME,'') AS 'Franchise Name',
		Case when A.IsCanPrintLocally='1' Then 'Yes' else 'No' end as 'Local Print',			
	Case when A.IsBuyFromCustomer='1' Then 'Yes' else 'No' end as 'Buy From Customer',			
	Case when A.IsFixedPricePurchase='1' Then 'Yes' else 'No' end as 'Fixed Price Purchase',
	b.CostPlusAmountText as 'Product Cost',
	c.BehindAmountText as 'Territory Develop',	
			Convert(varchar(12),A.LASTCREATEDDATE,101) as 'Last Updated'
		FROM DBO.TBL_FRANCHISEE A	
		Left Join dbo.Tbl_CostPlusAmount B on a.CostPlusAmountId=b.CostPlusAmountId
		left join dbo.Tbl_BehindAmount C on a.BehindAmountId = C.BehindAmountId
		Join DBO.Tbl_MasterFranchisee D on D.MasterFranchiseeId=a.MasterFranchiseeId
		where a.SandlerRoleId=1	
		ORDER BY D.MasterFranchiseeName
	Else
		SELECT 		
		AB.MasterFranchiseeName AS 'Master Franchise',			
		Isnull(A.NAME,'') AS 'Franchise Name',
		Case when A.IsCanPrintLocally='1' Then 'Yes' else 'No' end as 'Local Print',			
	Case when A.IsBuyFromCustomer='1' Then 'Yes' else 'No' end as 'Buy From Customer',			
	Case when A.IsFixedPricePurchase='1' Then 'Yes' else 'No' end as 'Fixed Price Purchase',
	p.CostPlusAmountText as 'Product Cost',
	q.BehindAmountText as 'Territory Develop',
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',		
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'Contact Number',
			Convert(varchar(12),A.LASTCREATEDDATE,101) as 'Last Updated',			
			i.UserName as 'Last Updated By',
			Convert(varchar(12),A.CreatedDate,101) AS 'Last Updated',J.UserName as 'Last Created By',
			k.SandlerRoleText as 'Sandler Role', a.Title,
			Isnull(A.EMAILADDRESS,'') as Email,Isnull(a.WebAddress,'') as Website,
			Case when A.IsActive='1' Then 'Active' else 'InActive' end as Active,			
			IsNull(A.Address1,'')+' '+IsNull(A.Address2,'') as Address,
			Isnull(A.City,''),Isnull(A.State,''),Isnull(A.Zip,''),Isnull(c.Name,'') as Country,
			Isnull(A.PhoneNumber,''),Isnull(a.OfficePhone,'') as 'Office Phone',
			Isnull(a.HomePhone,'') as 'Home Phone', Isnull(a.MobilePhone,'') as 'Mobile Phone',
			Isnull(a.Fax,''), Isnull(a.FaxNumber,'') as 'Fax Number',
			Convert(varchar(12),A.DHSAwardDate,101) as 'Award Date',
			Isnull(l.AwardLevelText,'') as 'Award Level',Isnull(m.PurchaseLevelText,'') as 'Purchase Level',
			Isnull(n.CertifiedLevelText,'') as 'Certified Level',Isnull(o.PrimaryBusinessText,'') as 'Primary Business',
			Convert(varchar(12),A.InitialContractDate,101) as 'Initial Contact Date',
			Convert(varchar(12),A.RenewalDate,101) as 'Renewal Date',
			Convert(varchar(12),A.ContractFormDate,101) as 'Contact Form Date',
			case when IsContractorPermitted=1 then 'Yes' else 'No' end as 'Contractor Permitted',
			case when IsSandlerMailRequired=1 then 'Yes' else 'No' end as 'Sandler Mail Required',
			case when IsKOLMember=1 then 'Yes' else 'No' end as 'KOL Member',
			case when IsAdvBoard=1 then 'Yes' else 'No' end as 'Advisory Board',
			case when IsMktgCommittee=1 then 'Yes' else 'No' end as 'Marketing Committee',
			case when IsUsingSandlerCRM=1 then 'Yes' else 'No' end as 'Using Sandler CRM',
			case when IsDHSAwardWinner=1 then 'Yes' else 'No' end as 'DHS Award Winner',
			Convert(varchar(12),A.DHSAwardDate,101) as 'DHS Award Date',
			Convert(varchar(12),A.InitialTrngDate,101) as 'Initial Training Date',
			case when IsReqToSubmitFinancial=1 then 'Yes' else 'No' end as 'Required To Submit Financial',
			case when IsRepAgreement=1 then 'Yes' else 'No' end as 'Representive Agreement',
			Isnull(a.WorkEmail,'') as 'Work Email',Isnull(a.WorkAddress,'') as 'Work Address',Isnull(a.WorkCity,'') as 'Work City',
			Isnull(d.Name,'') as 'Work State',Isnull(a.WorkZip,'') as 'Work Zip',Isnull(e.Name,'') as 'Work Country',
			Isnull(a.AlternateEmail,'') as 'Alternate Email',case when a.IsSameHomeAddress ='1' then 'Yes' else 'No' end as 'Same Home Address',
			Isnull(a.HomeAddress,'') as 'Home Address',Isnull(a.HomeCity,'') as 'Home City',Isnull(f.Name,'') as 'Home State',Isnull(a.HomeZip,'') as 'Home Zip',
			Isnull(g.Name,'') as 'Home Country',Isnull(a.SpouseName,'') as 'Spouse Name',
			Convert(varchar(12),A.Birthday,101) as 'Birth Day',
			Convert(varchar(12),A.Anniversary,101) as 'Anniversary',a.YearsWithCompany as 'Years With Company',
			case when a.IsMasterFranchiseeExists=1 then 'Yes' else 'No' end as 'Is Master Franchisee',
			case when a.IsCanPrintLocally=1 then 'Yes' else 'No' end as 'Local Print',
			case when a.IsBuyFromCustomer=1 then 'Yes' else 'No' end as 'Buy From Customer',
			case when a.IsFixedPricePurchase=1 then 'Yes' else 'No' end as 'Fixed Price Purchase',
			Isnull(p.CostPlusAmountText,'') as 'Cost Plus Amount',
			case when a.IsBehindInTerDev=1 then 'Yes' else 'No' end as 'Behind in Territory Develop',
			Isnull(q.BehindAmountText,'') as 'Amount Behind'
		FROM DBO.TBL_FRANCHISEE A
		Join DBO.Tbl_MasterFranchisee AB on Ab.MasterFranchiseeId=a.MasterFranchiseeId
		and a.SandlerRoleId=1
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
		left join dbo.Tbl_PrimaryBusiness O on a.PrimaryBusinessId = o.PrimaryBusinessId
		left join dbo.Tbl_CostPlusAmount P on a.CostPlusAmountId=p.CostPlusAmountId
		left join dbo.tbl_BehindAmount Q on a.BehindAmountId=Q.BehindAmountId
		ORDER BY AB.MasterFranchiseeName
	
	
	

GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportmsfr]    Script Date: 02/11/2013 20:44:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_GetHomeOfficeReportmsfr]
	
	(		
		@reportType Varchar(100)
	)
	
AS
	If(@reportType<>'Excel') 
	SELECT A.ID AS DATAROWID,	
	B.MasterFranchiseeName AS 'Master Franchise',			
		Isnull(A.NAME,'') AS 'Franchise Name',
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',		
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'Contact Number',
			Convert(varchar(12),A.LASTCREATEDDATE,101) as 'Last Updated'
		FROM DBO.TBL_FRANCHISEE A	
		Join DBO.Tbl_MasterFranchisee B on b.MasterFranchiseeId=a.MasterFranchiseeId
		and a.SandlerRoleId<>1 and a.IsMasterFranchiseeExists =1		
		ORDER BY B.MasterFranchiseeName
	Else
		SELECT 		
		AB.MasterFranchiseeName AS 'Master Franchise',			
		Isnull(A.NAME,'') AS 'Franchise Name',
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',		
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'Contact Number',
			Convert(varchar(12),A.LASTCREATEDDATE,101) as 'Last Updated',			
			i.UserName as 'Last Updated By',
			Convert(varchar(12),A.CreatedDate,101) AS 'Last Updated',J.UserName as 'Last Created By',
			k.SandlerRoleText as 'Sandler Role', a.Title,
			Isnull(A.EMAILADDRESS,'') as Email,Isnull(a.WebAddress,'') as Website,
			Case when A.IsActive='1' Then 'Active' else 'InActive' end as Active,			
			IsNull(A.Address1,'')+' '+IsNull(A.Address2,'') as Address,
			Isnull(A.City,''),Isnull(A.State,''),Isnull(A.Zip,''),Isnull(c.Name,'') as Country,
			Isnull(A.PhoneNumber,''),Isnull(a.OfficePhone,'') as 'Office Phone',
			Isnull(a.HomePhone,'') as 'Home Phone', Isnull(a.MobilePhone,'') as 'Mobile Phone',
			Isnull(a.Fax,''), Isnull(a.FaxNumber,'') as 'Fax Number',
			Convert(varchar(12),A.DHSAwardDate,101) as 'Award Date',
			Isnull(l.AwardLevelText,'') as 'Award Level',Isnull(m.PurchaseLevelText,'') as 'Purchase Level',
			Isnull(n.CertifiedLevelText,'') as 'Certified Level',Isnull(o.PrimaryBusinessText,'') as 'Primary Business',
			Convert(varchar(12),A.InitialContractDate,101) as 'Initial Contact Date',
			Convert(varchar(12),A.RenewalDate,101) as 'Renewal Date',
			Convert(varchar(12),A.ContractFormDate,101) as 'Contact Form Date',
			case when IsContractorPermitted=1 then 'Yes' else 'No' end as 'Contractor Permitted',
			case when IsSandlerMailRequired=1 then 'Yes' else 'No' end as 'Sandler Mail Required',
			case when IsKOLMember=1 then 'Yes' else 'No' end as 'KOL Member',
			case when IsAdvBoard=1 then 'Yes' else 'No' end as 'Advisory Board',
			case when IsMktgCommittee=1 then 'Yes' else 'No' end as 'Marketing Committee',
			case when IsUsingSandlerCRM=1 then 'Yes' else 'No' end as 'Using Sandler CRM',
			case when IsDHSAwardWinner=1 then 'Yes' else 'No' end as 'DHS Award Winner',
			Convert(varchar(12),A.DHSAwardDate,101) as 'DHS Award Date',
			Convert(varchar(12),A.InitialTrngDate,101) as 'Initial Training Date',
			case when IsReqToSubmitFinancial=1 then 'Yes' else 'No' end as 'Required To Submit Financial',
			case when IsRepAgreement=1 then 'Yes' else 'No' end as 'Representive Agreement',
			Isnull(a.WorkEmail,'') as 'Work Email',Isnull(a.WorkAddress,'') as 'Work Address',Isnull(a.WorkCity,'') as 'Work City',
			Isnull(d.Name,'') as 'Work State',Isnull(a.WorkZip,'') as 'Work Zip',Isnull(e.Name,'') as 'Work Country',
			Isnull(a.AlternateEmail,'') as 'Alternate Email',case when a.IsSameHomeAddress ='1' then 'Yes' else 'No' end as 'Same Home Address',
			Isnull(a.HomeAddress,'') as 'Home Address',Isnull(a.HomeCity,'') as 'Home City',Isnull(f.Name,'') as 'Home State',Isnull(a.HomeZip,'') as 'Home Zip',
			Isnull(g.Name,'') as 'Home Country',Isnull(a.SpouseName,'') as 'Spouse Name',
			Convert(varchar(12),A.Birthday,101) as 'Birth Day',
			Convert(varchar(12),A.Anniversary,101) as 'Anniversary',a.YearsWithCompany as 'Years With Company',
			case when a.IsMasterFranchiseeExists=1 then 'Yes' else 'No' end as 'Is Master Franchisee',
			case when a.IsCanPrintLocally=1 then 'Yes' else 'No' end as 'Local Print',
			case when a.IsBuyFromCustomer=1 then 'Yes' else 'No' end as 'Buy From Customer',
			case when a.IsFixedPricePurchase=1 then 'Yes' else 'No' end as 'Fixed Price Purchase',
			Isnull(p.CostPlusAmountText,'') as 'Cost Plus Amount',
			case when a.IsBehindInTerDev=1 then 'Yes' else 'No' end as 'Behind in Territory Develop',
			Isnull(q.BehindAmountText,'') as 'Amount Behind'
		FROM DBO.TBL_FRANCHISEE A
		Join DBO.Tbl_MasterFranchisee AB on Ab.MasterFranchiseeId=a.MasterFranchiseeId
		and a.SandlerRoleId<>1 and a.IsMasterFranchiseeExists =1	
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
		left join dbo.Tbl_PrimaryBusiness O on a.PrimaryBusinessId = o.PrimaryBusinessId
		left join dbo.Tbl_CostPlusAmount P on a.CostPlusAmountId=p.CostPlusAmountId
		left join dbo.tbl_BehindAmount Q on a.BehindAmountId=Q.BehindAmountId
		ORDER BY AB.MasterFranchiseeName
	
	
	

GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportfrbyusingcrm]    Script Date: 02/11/2013 20:44:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_GetHomeOfficeReportfrbyusingcrm]
	
	(		
		@reportType Varchar(100)
	)
	
AS
	If(@reportType<>'Excel') 
	SELECT A.ID AS DATAROWID,	
	case when a.IsUsingSandlerCRM=1 then 'Yes' else 'No' end as 'Using CRM',			
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',
Isnull(A.NAME,'') AS 'Franchise Name',		
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'Contact Number',
			Convert(varchar(12),A.LASTCREATEDDATE,101) as 'Last Updated'
		FROM DBO.TBL_FRANCHISEE A						
		ORDER BY a.IsUsingSandlerCRM
	Else
		SELECT 			
		case when a.IsUsingSandlerCRM=1 then 'Yes' else 'No' end as 'Using CRM',		
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',
Isnull(A.NAME,'') AS 'Franchise Name',		
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'Contact Number',
			Convert(varchar(12),A.LASTCREATEDDATE,101) as 'Last Updated',			
			i.UserName as 'Last Updated By',
			Convert(varchar(12),A.CreatedDate,101) AS 'Last Updated',J.UserName as 'Last Created By',
			k.SandlerRoleText as 'Sandler Role', a.Title,
			Isnull(A.EMAILADDRESS,'') as Email,Isnull(a.WebAddress,'') as Website,
			Case when A.IsActive='1' Then 'Active' else 'InActive' end as Active,			
			IsNull(A.Address1,'')+' '+IsNull(A.Address2,'') as Address,
			Isnull(A.City,''),Isnull(A.State,''),Isnull(A.Zip,''),Isnull(c.Name,'') as Country,
			Isnull(A.PhoneNumber,''),Isnull(a.OfficePhone,'') as 'Office Phone',
			Isnull(a.HomePhone,'') as 'Home Phone', Isnull(a.MobilePhone,'') as 'Mobile Phone',
			Isnull(a.Fax,''), Isnull(a.FaxNumber,'') as 'Fax Number',
			Convert(varchar(12),A.DHSAwardDate,101) as 'Award Date',
			Isnull(l.AwardLevelText,'') as 'Award Level',Isnull(m.PurchaseLevelText,'') as 'Purchase Level',
			Isnull(n.CertifiedLevelText,'') as 'Certified Level',Isnull(o.PrimaryBusinessText,'') as 'Primary Business',
			Convert(varchar(12),A.InitialContractDate,101) as 'Initial Contact Date',
			Convert(varchar(12),A.RenewalDate,101) as 'Renewal Date',
			Convert(varchar(12),A.ContractFormDate,101) as 'Contact Form Date',
			case when IsContractorPermitted=1 then 'Yes' else 'No' end as 'Contractor Permitted',
			case when IsSandlerMailRequired=1 then 'Yes' else 'No' end as 'Sandler Mail Required',
			case when IsKOLMember=1 then 'Yes' else 'No' end as 'KOL Member',
			case when IsAdvBoard=1 then 'Yes' else 'No' end as 'Advisory Board',
			case when IsMktgCommittee=1 then 'Yes' else 'No' end as 'Marketing Committee',
			case when IsUsingSandlerCRM=1 then 'Yes' else 'No' end as 'Using Sandler CRM',
			case when IsDHSAwardWinner=1 then 'Yes' else 'No' end as 'DHS Award Winner',
			Convert(varchar(12),A.DHSAwardDate,101) as 'DHS Award Date',
			Convert(varchar(12),A.InitialTrngDate,101) as 'Initial Training Date',
			case when IsReqToSubmitFinancial=1 then 'Yes' else 'No' end as 'Required To Submit Financial',
			case when IsRepAgreement=1 then 'Yes' else 'No' end as 'Representive Agreement',
			Isnull(a.WorkEmail,'') as 'Work Email',Isnull(a.WorkAddress,'') as 'Work Address',Isnull(a.WorkCity,'') as 'Work City',
			Isnull(d.Name,'') as 'Work State',Isnull(a.WorkZip,'') as 'Work Zip',Isnull(e.Name,'') as 'Work Country',
			Isnull(a.AlternateEmail,'') as 'Alternate Email',case when a.IsSameHomeAddress ='1' then 'Yes' else 'No' end as 'Same Home Address',
			Isnull(a.HomeAddress,'') as 'Home Address',Isnull(a.HomeCity,'') as 'Home City',Isnull(f.Name,'') as 'Home State',Isnull(a.HomeZip,'') as 'Home Zip',
			Isnull(g.Name,'') as 'Home Country',Isnull(a.SpouseName,'') as 'Spouse Name',
			Convert(varchar(12),A.Birthday,101) as 'Birth Day',
			Convert(varchar(12),A.Anniversary,101) as 'Anniversary',a.YearsWithCompany as 'Years With Company',
			case when a.IsMasterFranchiseeExists=1 then 'Yes' else 'No' end as 'Is Master Franchisee',
			case when a.IsCanPrintLocally=1 then 'Yes' else 'No' end as 'Local Print',
			case when a.IsBuyFromCustomer=1 then 'Yes' else 'No' end as 'Buy From Customer',
			case when a.IsFixedPricePurchase=1 then 'Yes' else 'No' end as 'Fixed Price Purchase',
			Isnull(p.CostPlusAmountText,'') as 'Cost Plus Amount',
			case when a.IsBehindInTerDev=1 then 'Yes' else 'No' end as 'Behind in Territory Develop',
			Isnull(q.BehindAmountText,'') as 'Amount Behind'
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
		left join dbo.Tbl_PrimaryBusiness O on a.PrimaryBusinessId = o.PrimaryBusinessId
		left join dbo.Tbl_CostPlusAmount P on a.CostPlusAmountId=p.CostPlusAmountId
		left join dbo.tbl_BehindAmount Q on a.BehindAmountId=Q.BehindAmountId		
		ORDER BY a.IsUsingSandlerCRM
	
	
	

GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportfrbycertlevel]    Script Date: 02/11/2013 20:44:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_GetHomeOfficeReportfrbycertlevel]
	
	(		
		@reportType Varchar(100)
	)
	
AS
	If(@reportType<>'Excel') 
	SELECT A.ID AS DATAROWID,	
	B.CertifiedLevelText as 'Certification Level',		
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',		
		Isnull(A.NAME,'') AS 'Franchise Name',
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'Contact Number',
			Convert(varchar(12),A.LASTCREATEDDATE,101) as 'Last Updated'
		FROM DBO.TBL_FRANCHISEE A	
		left join dbo.Tbl_CertifiedLevel B on a.CertifiedLevelId = B.CertifiedLevelId
		ORDER BY B.CertifiedLevelText							
	Else
		SELECT 	
		n.CertifiedLevelText as 'Certification Level',		
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',
Isnull(A.NAME,'') AS 'Franchise Name',		
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'Contact Number',
			Convert(varchar(12),A.LASTCREATEDDATE,101) as 'Last Updated',			
			i.UserName as 'Last Updated By',
			Convert(varchar(12),A.CreatedDate,101) AS 'Last Updated',J.UserName as 'Last Created By',
			k.SandlerRoleText as 'Sandler Role', a.Title,
			Isnull(A.EMAILADDRESS,'') as Email,Isnull(a.WebAddress,'') as Website,
			Case when A.IsActive='1' Then 'Active' else 'InActive' end as Active,			
			IsNull(A.Address1,'')+' '+IsNull(A.Address2,'') as Address,
			Isnull(A.City,''),Isnull(A.State,''),Isnull(A.Zip,''),Isnull(c.Name,'') as Country,
			Isnull(A.PhoneNumber,''),Isnull(a.OfficePhone,'') as 'Office Phone',
			Isnull(a.HomePhone,'') as 'Home Phone', Isnull(a.MobilePhone,'') as 'Mobile Phone',
			Isnull(a.Fax,''), Isnull(a.FaxNumber,'') as 'Fax Number',
			Convert(varchar(12),A.DHSAwardDate,101) as 'Award Date',
			Isnull(l.AwardLevelText,'') as 'Award Level',Isnull(m.PurchaseLevelText,'') as 'Purchase Level',
			Isnull(n.CertifiedLevelText,'') as 'Certified Level',Isnull(o.PrimaryBusinessText,'') as 'Primary Business',
			Convert(varchar(12),A.InitialContractDate,101) as 'Initial Contact Date',
			Convert(varchar(12),A.RenewalDate,101) as 'Renewal Date',
			Convert(varchar(12),A.ContractFormDate,101) as 'Contact Form Date',
			case when IsContractorPermitted=1 then 'Yes' else 'No' end as 'Contractor Permitted',
			case when IsSandlerMailRequired=1 then 'Yes' else 'No' end as 'Sandler Mail Required',
			case when IsKOLMember=1 then 'Yes' else 'No' end as 'KOL Member',
			case when IsAdvBoard=1 then 'Yes' else 'No' end as 'Advisory Board',
			case when IsMktgCommittee=1 then 'Yes' else 'No' end as 'Marketing Committee',
			case when IsUsingSandlerCRM=1 then 'Yes' else 'No' end as 'Using Sandler CRM',
			case when IsDHSAwardWinner=1 then 'Yes' else 'No' end as 'DHS Award Winner',
			Convert(varchar(12),A.DHSAwardDate,101) as 'DHS Award Date',
			Convert(varchar(12),A.InitialTrngDate,101) as 'Initial Training Date',
			case when IsReqToSubmitFinancial=1 then 'Yes' else 'No' end as 'Required To Submit Financial',
			case when IsRepAgreement=1 then 'Yes' else 'No' end as 'Representive Agreement',
			Isnull(a.WorkEmail,'') as 'Work Email',Isnull(a.WorkAddress,'') as 'Work Address',Isnull(a.WorkCity,'') as 'Work City',
			Isnull(d.Name,'') as 'Work State',Isnull(a.WorkZip,'') as 'Work Zip',Isnull(e.Name,'') as 'Work Country',
			Isnull(a.AlternateEmail,'') as 'Alternate Email',case when a.IsSameHomeAddress ='1' then 'Yes' else 'No' end as 'Same Home Address',
			Isnull(a.HomeAddress,'') as 'Home Address',Isnull(a.HomeCity,'') as 'Home City',Isnull(f.Name,'') as 'Home State',Isnull(a.HomeZip,'') as 'Home Zip',
			Isnull(g.Name,'') as 'Home Country',Isnull(a.SpouseName,'') as 'Spouse Name',
			Convert(varchar(12),A.Birthday,101) as 'Birth Day',
			Convert(varchar(12),A.Anniversary,101) as 'Anniversary',a.YearsWithCompany as 'Years With Company',
			case when a.IsMasterFranchiseeExists=1 then 'Yes' else 'No' end as 'Is Master Franchisee',
			case when a.IsCanPrintLocally=1 then 'Yes' else 'No' end as 'Local Print',
			case when a.IsBuyFromCustomer=1 then 'Yes' else 'No' end as 'Buy From Customer',
			case when a.IsFixedPricePurchase=1 then 'Yes' else 'No' end as 'Fixed Price Purchase',
			Isnull(p.CostPlusAmountText,'') as 'Cost Plus Amount',
			case when a.IsBehindInTerDev=1 then 'Yes' else 'No' end as 'Behind in Territory Develop',
			Isnull(q.BehindAmountText,'') as 'Amount Behind'
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
		left join dbo.Tbl_PrimaryBusiness O on a.PrimaryBusinessId = o.PrimaryBusinessId
		left join dbo.Tbl_CostPlusAmount P on a.CostPlusAmountId=p.CostPlusAmountId
		left join dbo.tbl_BehindAmount Q on a.BehindAmountId=Q.BehindAmountId		
		ORDER BY n.CertifiedLevelText
	
	
	

GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportfrbybusarea]    Script Date: 02/11/2013 20:44:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_GetHomeOfficeReportfrbybusarea]
	
	(		
		@reportType Varchar(100)
	)
	
AS
	If(@reportType<>'Excel') 
	SELECT A.ID AS DATAROWID,	
	B.PrimaryBusinessText as 'Business Area',		
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',	
		Isnull(A.NAME,'') AS 'Franchise Name',		
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'Contact Number',
			Convert(varchar(12),A.LASTCREATEDDATE,101) as 'Last Updated'
		FROM DBO.TBL_FRANCHISEE A	
		left join dbo.Tbl_PrimaryBusiness B on a.PrimaryBusinessId = B.PrimaryBusinessId
		ORDER BY B.PrimaryBusinessText						
	Else
		SELECT 	
		o.PrimaryBusinessText as 'Primary Business',
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',
Isnull(A.NAME,'') AS 'Franchise Name',		
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'Contact Number',
			Convert(varchar(12),A.LASTCREATEDDATE,101) as 'Last Updated',			
			i.UserName as 'Last Updated By',
			Convert(varchar(12),A.CreatedDate,101) AS 'Last Updated',J.UserName as 'Last Created By',
			k.SandlerRoleText as 'Sandler Role', a.Title,
			Isnull(A.EMAILADDRESS,'') as Email,Isnull(a.WebAddress,'') as Website,
			Case when A.IsActive='1' Then 'Active' else 'InActive' end as Active,			
			IsNull(A.Address1,'')+' '+IsNull(A.Address2,'') as Address,
			Isnull(A.City,''),Isnull(A.State,''),Isnull(A.Zip,''),Isnull(c.Name,'') as Country,
			Isnull(A.PhoneNumber,''),Isnull(a.OfficePhone,'') as 'Office Phone',
			Isnull(a.HomePhone,'') as 'Home Phone', Isnull(a.MobilePhone,'') as 'Mobile Phone',
			Isnull(a.Fax,''), Isnull(a.FaxNumber,'') as 'Fax Number',
			Convert(varchar(12),A.DHSAwardDate,101) as 'Award Date',
			Isnull(l.AwardLevelText,'') as 'Award Level',Isnull(m.PurchaseLevelText,'') as 'Purchase Level',
			Isnull(n.CertifiedLevelText,'') as 'Certified Level',Isnull(o.PrimaryBusinessText,'') as 'Primary Business',
			Convert(varchar(12),A.InitialContractDate,101) as 'Initial Contact Date',
			Convert(varchar(12),A.RenewalDate,101) as 'Renewal Date',
			Convert(varchar(12),A.ContractFormDate,101) as 'Contact Form Date',
			case when IsContractorPermitted=1 then 'Yes' else 'No' end as 'Contractor Permitted',
			case when IsSandlerMailRequired=1 then 'Yes' else 'No' end as 'Sandler Mail Required',
			case when IsKOLMember=1 then 'Yes' else 'No' end as 'KOL Member',
			case when IsAdvBoard=1 then 'Yes' else 'No' end as 'Advisory Board',
			case when IsMktgCommittee=1 then 'Yes' else 'No' end as 'Marketing Committee',
			case when IsUsingSandlerCRM=1 then 'Yes' else 'No' end as 'Using Sandler CRM',
			case when IsDHSAwardWinner=1 then 'Yes' else 'No' end as 'DHS Award Winner',
			Convert(varchar(12),A.DHSAwardDate,101) as 'DHS Award Date',
			Convert(varchar(12),A.InitialTrngDate,101) as 'Initial Training Date',
			case when IsReqToSubmitFinancial=1 then 'Yes' else 'No' end as 'Required To Submit Financial',
			case when IsRepAgreement=1 then 'Yes' else 'No' end as 'Representive Agreement',
			Isnull(a.WorkEmail,'') as 'Work Email',Isnull(a.WorkAddress,'') as 'Work Address',Isnull(a.WorkCity,'') as 'Work City',
			Isnull(d.Name,'') as 'Work State',Isnull(a.WorkZip,'') as 'Work Zip',Isnull(e.Name,'') as 'Work Country',
			Isnull(a.AlternateEmail,'') as 'Alternate Email',case when a.IsSameHomeAddress ='1' then 'Yes' else 'No' end as 'Same Home Address',
			Isnull(a.HomeAddress,'') as 'Home Address',Isnull(a.HomeCity,'') as 'Home City',Isnull(f.Name,'') as 'Home State',Isnull(a.HomeZip,'') as 'Home Zip',
			Isnull(g.Name,'') as 'Home Country',Isnull(a.SpouseName,'') as 'Spouse Name',
			Convert(varchar(12),A.Birthday,101) as 'Birth Day',
			Convert(varchar(12),A.Anniversary,101) as 'Anniversary',a.YearsWithCompany as 'Years With Company',
			case when a.IsMasterFranchiseeExists=1 then 'Yes' else 'No' end as 'Is Master Franchisee',
			case when a.IsCanPrintLocally=1 then 'Yes' else 'No' end as 'Local Print',
			case when a.IsBuyFromCustomer=1 then 'Yes' else 'No' end as 'Buy From Customer',
			case when a.IsFixedPricePurchase=1 then 'Yes' else 'No' end as 'Fixed Price Purchase',
			Isnull(p.CostPlusAmountText,'') as 'Cost Plus Amount',
			case when a.IsBehindInTerDev=1 then 'Yes' else 'No' end as 'Behind in Territory Develop',
			Isnull(q.BehindAmountText,'') as 'Amount Behind'
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
		left join dbo.Tbl_PrimaryBusiness O on a.PrimaryBusinessId = o.PrimaryBusinessId
		left join dbo.Tbl_CostPlusAmount P on a.CostPlusAmountId=p.CostPlusAmountId
		left join dbo.tbl_BehindAmount Q on a.BehindAmountId=Q.BehindAmountId		
		ORDER BY o.PrimaryBusinessText
	
	
	

GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportfrbycontdetails]    Script Date: 02/11/2013 20:44:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_GetHomeOfficeReportfrbycontdetails]
	
	(		
		@reportType Varchar(100)
	)
	
AS
	If(@reportType<>'Excel') 
	SELECT A.ID AS DATAROWID,		
		Isnull(A.NAME,'') AS 'Franchise Name',
		Convert(varchar(12),A.InitialContractDate,101) as 'Initial Contract Date',
		Convert(varchar(12),A.RenewalDate,101) as 'Renewal Date',
		Convert(varchar(12),A.ContractFormDate,101) as 'Contract Form Date',
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',		
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'Contact Number',
			Convert(varchar(12),A.LASTCREATEDDATE,101) as 'Last Updated'
		FROM DBO.TBL_FRANCHISEE A			
		ORDER BY A.NAME					
	Else
		SELECT 	
		Isnull(A.NAME,'') AS 'Franchise Name',
		Convert(varchar(12),A.InitialContractDate,101) as 'Initial Contract Date',
		Convert(varchar(12),A.RenewalDate,101) as 'Renewal Date',
		Convert(varchar(12),A.ContractFormDate,101) as 'Contract Form Date',
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',		
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'Contact Number',
			Convert(varchar(12),A.LASTCREATEDDATE,101) as 'Last Updated',			
			i.UserName as 'Last Updated By',
			Convert(varchar(12),A.CreatedDate,101) AS 'Last Updated',J.UserName as 'Last Created By',
			k.SandlerRoleText as 'Sandler Role', a.Title,
			Isnull(A.EMAILADDRESS,'') as Email,Isnull(a.WebAddress,'') as Website,
			Case when A.IsActive='1' Then 'Active' else 'InActive' end as Active,			
			IsNull(A.Address1,'')+' '+IsNull(A.Address2,'') as Address,
			Isnull(A.City,''),Isnull(A.State,''),Isnull(A.Zip,''),Isnull(c.Name,'') as Country,
			Isnull(A.PhoneNumber,''),Isnull(a.OfficePhone,'') as 'Office Phone',
			Isnull(a.HomePhone,'') as 'Home Phone', Isnull(a.MobilePhone,'') as 'Mobile Phone',
			Isnull(a.Fax,''), Isnull(a.FaxNumber,'') as 'Fax Number',
			Convert(varchar(12),A.DHSAwardDate,101) as 'Award Date',
			Isnull(l.AwardLevelText,'') as 'Award Level',Isnull(m.PurchaseLevelText,'') as 'Purchase Level',
			Isnull(n.CertifiedLevelText,'') as 'Certified Level',Isnull(o.PrimaryBusinessText,'') as 'Primary Business',
			Convert(varchar(12),A.InitialContractDate,101) as 'Initial Contact Date',
			Convert(varchar(12),A.RenewalDate,101) as 'Renewal Date',
			Convert(varchar(12),A.ContractFormDate,101) as 'Contact Form Date',
			case when IsContractorPermitted=1 then 'Yes' else 'No' end as 'Contractor Permitted',
			case when IsSandlerMailRequired=1 then 'Yes' else 'No' end as 'Sandler Mail Required',
			case when IsKOLMember=1 then 'Yes' else 'No' end as 'KOL Member',
			case when IsAdvBoard=1 then 'Yes' else 'No' end as 'Advisory Board',
			case when IsMktgCommittee=1 then 'Yes' else 'No' end as 'Marketing Committee',
			case when IsUsingSandlerCRM=1 then 'Yes' else 'No' end as 'Using Sandler CRM',
			case when IsDHSAwardWinner=1 then 'Yes' else 'No' end as 'DHS Award Winner',
			Convert(varchar(12),A.DHSAwardDate,101) as 'DHS Award Date',
			Convert(varchar(12),A.InitialTrngDate,101) as 'Initial Training Date',
			case when IsReqToSubmitFinancial=1 then 'Yes' else 'No' end as 'Required To Submit Financial',
			case when IsRepAgreement=1 then 'Yes' else 'No' end as 'Representive Agreement',
			Isnull(a.WorkEmail,'') as 'Work Email',Isnull(a.WorkAddress,'') as 'Work Address',Isnull(a.WorkCity,'') as 'Work City',
			Isnull(d.Name,'') as 'Work State',Isnull(a.WorkZip,'') as 'Work Zip',Isnull(e.Name,'') as 'Work Country',
			Isnull(a.AlternateEmail,'') as 'Alternate Email',case when a.IsSameHomeAddress ='1' then 'Yes' else 'No' end as 'Same Home Address',
			Isnull(a.HomeAddress,'') as 'Home Address',Isnull(a.HomeCity,'') as 'Home City',Isnull(f.Name,'') as 'Home State',Isnull(a.HomeZip,'') as 'Home Zip',
			Isnull(g.Name,'') as 'Home Country',Isnull(a.SpouseName,'') as 'Spouse Name',
			Convert(varchar(12),A.Birthday,101) as 'Birth Day',
			Convert(varchar(12),A.Anniversary,101) as 'Anniversary',a.YearsWithCompany as 'Years With Company',
			case when a.IsMasterFranchiseeExists=1 then 'Yes' else 'No' end as 'Is Master Franchisee',
			case when a.IsCanPrintLocally=1 then 'Yes' else 'No' end as 'Local Print',
			case when a.IsBuyFromCustomer=1 then 'Yes' else 'No' end as 'Buy From Customer',
			case when a.IsFixedPricePurchase=1 then 'Yes' else 'No' end as 'Fixed Price Purchase',
			Isnull(p.CostPlusAmountText,'') as 'Cost Plus Amount',
			case when a.IsBehindInTerDev=1 then 'Yes' else 'No' end as 'Behind in Territory Develop',
			Isnull(q.BehindAmountText,'') as 'Amount Behind'
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
		left join dbo.Tbl_PrimaryBusiness O on a.PrimaryBusinessId = o.PrimaryBusinessId
		left join dbo.Tbl_CostPlusAmount P on a.CostPlusAmountId=p.CostPlusAmountId
		left join dbo.tbl_BehindAmount Q on a.BehindAmountId=Q.BehindAmountId		
		ORDER BY A.NAME
	
	
	

GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportfrbytrngdate]    Script Date: 02/11/2013 20:44:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_GetHomeOfficeReportfrbytrngdate]
	
	(		
		@reportType Varchar(100)
	)
	
AS
	If(@reportType<>'Excel') 
	SELECT A.ID AS DATAROWID,		
		Convert(varchar(12),A.InitialTrngDate,101) as 'Initial Training Date',				
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',	
Isnull(A.NAME,'') AS 'Franchise Name',				
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'Contact Number',
			Convert(varchar(12),A.LASTCREATEDDATE,101) as 'Last Updated'
		FROM DBO.TBL_FRANCHISEE A			
		ORDER BY A.InitialTrngDate					
	Else
		SELECT 	
		Convert(varchar(12),A.InitialTrngDate,101) as 'Initial Training Date',		
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',
Isnull(A.NAME,'') AS 'Franchise Name',			
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'Contact Number',
			Convert(varchar(12),A.LASTCREATEDDATE,101) as 'Last Updated',			
			i.UserName as 'Last Updated By',
			Convert(varchar(12),A.CreatedDate,101) AS 'Last Updated',J.UserName as 'Last Created By',
			k.SandlerRoleText as 'Sandler Role', a.Title,
			Isnull(A.EMAILADDRESS,'') as Email,Isnull(a.WebAddress,'') as Website,
			Case when A.IsActive='1' Then 'Active' else 'InActive' end as Active,			
			IsNull(A.Address1,'')+' '+IsNull(A.Address2,'') as Address,
			Isnull(A.City,''),Isnull(A.State,''),Isnull(A.Zip,''),Isnull(c.Name,'') as Country,
			Isnull(A.PhoneNumber,''),Isnull(a.OfficePhone,'') as 'Office Phone',
			Isnull(a.HomePhone,'') as 'Home Phone', Isnull(a.MobilePhone,'') as 'Mobile Phone',
			Isnull(a.Fax,''), Isnull(a.FaxNumber,'') as 'Fax Number',
			Convert(varchar(12),A.DHSAwardDate,101) as 'Award Date',
			Isnull(l.AwardLevelText,'') as 'Award Level',Isnull(m.PurchaseLevelText,'') as 'Purchase Level',
			Isnull(n.CertifiedLevelText,'') as 'Certified Level',Isnull(o.PrimaryBusinessText,'') as 'Primary Business',
			Convert(varchar(12),A.InitialContractDate,101) as 'Initial Contact Date',
			Convert(varchar(12),A.RenewalDate,101) as 'Renewal Date',
			Convert(varchar(12),A.ContractFormDate,101) as 'Contact Form Date',
			case when IsContractorPermitted=1 then 'Yes' else 'No' end as 'Contractor Permitted',
			case when IsSandlerMailRequired=1 then 'Yes' else 'No' end as 'Sandler Mail Required',
			case when IsKOLMember=1 then 'Yes' else 'No' end as 'KOL Member',
			case when IsAdvBoard=1 then 'Yes' else 'No' end as 'Advisory Board',
			case when IsMktgCommittee=1 then 'Yes' else 'No' end as 'Marketing Committee',
			case when IsUsingSandlerCRM=1 then 'Yes' else 'No' end as 'Using Sandler CRM',
			case when IsDHSAwardWinner=1 then 'Yes' else 'No' end as 'DHS Award Winner',
			Convert(varchar(12),A.DHSAwardDate,101) as 'DHS Award Date',
			Convert(varchar(12),A.InitialTrngDate,101) as 'Initial Training Date',
			case when IsReqToSubmitFinancial=1 then 'Yes' else 'No' end as 'Required To Submit Financial',
			case when IsRepAgreement=1 then 'Yes' else 'No' end as 'Representive Agreement',
			Isnull(a.WorkEmail,'') as 'Work Email',Isnull(a.WorkAddress,'') as 'Work Address',Isnull(a.WorkCity,'') as 'Work City',
			Isnull(d.Name,'') as 'Work State',Isnull(a.WorkZip,'') as 'Work Zip',Isnull(e.Name,'') as 'Work Country',
			Isnull(a.AlternateEmail,'') as 'Alternate Email',case when a.IsSameHomeAddress ='1' then 'Yes' else 'No' end as 'Same Home Address',
			Isnull(a.HomeAddress,'') as 'Home Address',Isnull(a.HomeCity,'') as 'Home City',Isnull(f.Name,'') as 'Home State',Isnull(a.HomeZip,'') as 'Home Zip',
			Isnull(g.Name,'') as 'Home Country',Isnull(a.SpouseName,'') as 'Spouse Name',
			Convert(varchar(12),A.Birthday,101) as 'Birth Day',
			Convert(varchar(12),A.Anniversary,101) as 'Anniversary',a.YearsWithCompany as 'Years With Company',
			case when a.IsMasterFranchiseeExists=1 then 'Yes' else 'No' end as 'Is Master Franchisee',
			case when a.IsCanPrintLocally=1 then 'Yes' else 'No' end as 'Local Print',
			case when a.IsBuyFromCustomer=1 then 'Yes' else 'No' end as 'Buy From Customer',
			case when a.IsFixedPricePurchase=1 then 'Yes' else 'No' end as 'Fixed Price Purchase',
			Isnull(p.CostPlusAmountText,'') as 'Cost Plus Amount',
			case when a.IsBehindInTerDev=1 then 'Yes' else 'No' end as 'Behind in Territory Develop',
			Isnull(q.BehindAmountText,'') as 'Amount Behind'
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
		left join dbo.Tbl_PrimaryBusiness O on a.PrimaryBusinessId = o.PrimaryBusinessId
		left join dbo.Tbl_CostPlusAmount P on a.CostPlusAmountId=p.CostPlusAmountId
		left join dbo.tbl_BehindAmount Q on a.BehindAmountId=Q.BehindAmountId		
		ORDER BY A.InitialTrngDate
	
	
	

GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportfrbyawlevel]    Script Date: 02/11/2013 20:44:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_GetHomeOfficeReportfrbyawlevel]
	
	(		
		@reportType Varchar(100)
	)
	
AS
	If(@reportType<>'Excel') 
	SELECT A.ID AS DATAROWID,		
		B.AwardLevelText as 'Award Level',		
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',	
Isnull(A.NAME,'') AS 'Franchise Name',								
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'Contact Number',
			Convert(varchar(12),A.LASTCREATEDDATE,101) as 'Last Updated'
		FROM DBO.TBL_FRANCHISEE A	
		Left Join dbo.Tbl_AwardLevel B on a.AwardLevelId=B.AwardLevelId		
		ORDER BY B.AwardLevelText				
	Else
		SELECT 	
		l.AwardLevelText as 'Award Level',		
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',	
	Isnull(A.NAME,'') AS 'Franchise Name',			
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'Contact Number',
			Convert(varchar(12),A.LASTCREATEDDATE,101) as 'Last Updated',			
			i.UserName as 'Last Updated By',
			Convert(varchar(12),A.CreatedDate,101) AS 'Last Updated',J.UserName as 'Last Created By',
			k.SandlerRoleText as 'Sandler Role', a.Title,
			Isnull(A.EMAILADDRESS,'') as Email,Isnull(a.WebAddress,'') as Website,
			Case when A.IsActive='1' Then 'Active' else 'InActive' end as Active,			
			IsNull(A.Address1,'')+' '+IsNull(A.Address2,'') as Address,
			Isnull(A.City,''),Isnull(A.State,''),Isnull(A.Zip,''),Isnull(c.Name,'') as Country,
			Isnull(A.PhoneNumber,''),Isnull(a.OfficePhone,'') as 'Office Phone',
			Isnull(a.HomePhone,'') as 'Home Phone', Isnull(a.MobilePhone,'') as 'Mobile Phone',
			Isnull(a.Fax,''), Isnull(a.FaxNumber,'') as 'Fax Number',
			Convert(varchar(12),A.DHSAwardDate,101) as 'Award Date',
			Isnull(l.AwardLevelText,'') as 'Award Level',Isnull(m.PurchaseLevelText,'') as 'Purchase Level',
			Isnull(n.CertifiedLevelText,'') as 'Certified Level',Isnull(o.PrimaryBusinessText,'') as 'Primary Business',
			Convert(varchar(12),A.InitialContractDate,101) as 'Initial Contact Date',
			Convert(varchar(12),A.RenewalDate,101) as 'Renewal Date',
			Convert(varchar(12),A.ContractFormDate,101) as 'Contact Form Date',
			case when IsContractorPermitted=1 then 'Yes' else 'No' end as 'Contractor Permitted',
			case when IsSandlerMailRequired=1 then 'Yes' else 'No' end as 'Sandler Mail Required',
			case when IsKOLMember=1 then 'Yes' else 'No' end as 'KOL Member',
			case when IsAdvBoard=1 then 'Yes' else 'No' end as 'Advisory Board',
			case when IsMktgCommittee=1 then 'Yes' else 'No' end as 'Marketing Committee',
			case when IsUsingSandlerCRM=1 then 'Yes' else 'No' end as 'Using Sandler CRM',
			case when IsDHSAwardWinner=1 then 'Yes' else 'No' end as 'DHS Award Winner',
			Convert(varchar(12),A.DHSAwardDate,101) as 'DHS Award Date',
			Convert(varchar(12),A.InitialTrngDate,101) as 'Initial Training Date',
			case when IsReqToSubmitFinancial=1 then 'Yes' else 'No' end as 'Required To Submit Financial',
			case when IsRepAgreement=1 then 'Yes' else 'No' end as 'Representive Agreement',
			Isnull(a.WorkEmail,'') as 'Work Email',Isnull(a.WorkAddress,'') as 'Work Address',Isnull(a.WorkCity,'') as 'Work City',
			Isnull(d.Name,'') as 'Work State',Isnull(a.WorkZip,'') as 'Work Zip',Isnull(e.Name,'') as 'Work Country',
			Isnull(a.AlternateEmail,'') as 'Alternate Email',case when a.IsSameHomeAddress ='1' then 'Yes' else 'No' end as 'Same Home Address',
			Isnull(a.HomeAddress,'') as 'Home Address',Isnull(a.HomeCity,'') as 'Home City',Isnull(f.Name,'') as 'Home State',Isnull(a.HomeZip,'') as 'Home Zip',
			Isnull(g.Name,'') as 'Home Country',Isnull(a.SpouseName,'') as 'Spouse Name',
			Convert(varchar(12),A.Birthday,101) as 'Birth Day',
			Convert(varchar(12),A.Anniversary,101) as 'Anniversary',a.YearsWithCompany as 'Years With Company',
			case when a.IsMasterFranchiseeExists=1 then 'Yes' else 'No' end as 'Is Master Franchisee',
			case when a.IsCanPrintLocally=1 then 'Yes' else 'No' end as 'Local Print',
			case when a.IsBuyFromCustomer=1 then 'Yes' else 'No' end as 'Buy From Customer',
			case when a.IsFixedPricePurchase=1 then 'Yes' else 'No' end as 'Fixed Price Purchase',
			Isnull(p.CostPlusAmountText,'') as 'Cost Plus Amount',
			case when a.IsBehindInTerDev=1 then 'Yes' else 'No' end as 'Behind in Territory Develop',
			Isnull(q.BehindAmountText,'') as 'Amount Behind'
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
		left join dbo.Tbl_PrimaryBusiness O on a.PrimaryBusinessId = o.PrimaryBusinessId
		left join dbo.Tbl_CostPlusAmount P on a.CostPlusAmountId=p.CostPlusAmountId
		left join dbo.tbl_BehindAmount Q on a.BehindAmountId=Q.BehindAmountId		
		ORDER BY l.AwardLevelText
	
	
	

GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportfrbycountry]    Script Date: 02/11/2013 20:44:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_GetHomeOfficeReportfrbycountry]
	
	(		
		@reportType Varchar(100)
	)
	
AS
	If(@reportType<>'Excel') 
	SELECT A.ID AS DATAROWID,		
		B.Name as Country,						
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',	
		Isnull(A.NAME,'') AS 'Franchise Name',		
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'Contact Number',
			Convert(varchar(12),A.LASTCREATEDDATE,101) as 'Last Updated'
		FROM DBO.TBL_FRANCHISEE A	
		Left Join dbo.TBL_COUNTRY B on A.CountryID=B.ID
		ORDER BY B.Name					
	Else
		SELECT 	
		C.Name as Country,			
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',
		Isnull(A.NAME,'') AS 'Franchise Name',		
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'Contact Number',
			Convert(varchar(12),A.LASTCREATEDDATE,101) as 'Last Updated',			
			i.UserName as 'Last Updated By',
			Convert(varchar(12),A.CreatedDate,101) AS 'Last Updated',J.UserName as 'Last Created By',
			k.SandlerRoleText as 'Sandler Role', a.Title,
			Isnull(A.EMAILADDRESS,'') as Email,Isnull(a.WebAddress,'') as Website,
			Case when A.IsActive='1' Then 'Active' else 'InActive' end as Active,			
			IsNull(A.Address1,'')+' '+IsNull(A.Address2,'') as Address,
			Isnull(A.City,''),Isnull(A.State,''),Isnull(A.Zip,''),Isnull(c.Name,'') as Country,
			Isnull(A.PhoneNumber,''),Isnull(a.OfficePhone,'') as 'Office Phone',
			Isnull(a.HomePhone,'') as 'Home Phone', Isnull(a.MobilePhone,'') as 'Mobile Phone',
			Isnull(a.Fax,''), Isnull(a.FaxNumber,'') as 'Fax Number',
			Convert(varchar(12),A.DHSAwardDate,101) as 'Award Date',
			Isnull(l.AwardLevelText,'') as 'Award Level',Isnull(m.PurchaseLevelText,'') as 'Purchase Level',
			Isnull(n.CertifiedLevelText,'') as 'Certified Level',Isnull(o.PrimaryBusinessText,'') as 'Primary Business',
			Convert(varchar(12),A.InitialContractDate,101) as 'Initial Contact Date',
			Convert(varchar(12),A.RenewalDate,101) as 'Renewal Date',
			Convert(varchar(12),A.ContractFormDate,101) as 'Contact Form Date',
			case when IsContractorPermitted=1 then 'Yes' else 'No' end as 'Contractor Permitted',
			case when IsSandlerMailRequired=1 then 'Yes' else 'No' end as 'Sandler Mail Required',
			case when IsKOLMember=1 then 'Yes' else 'No' end as 'KOL Member',
			case when IsAdvBoard=1 then 'Yes' else 'No' end as 'Advisory Board',
			case when IsMktgCommittee=1 then 'Yes' else 'No' end as 'Marketing Committee',
			case when IsUsingSandlerCRM=1 then 'Yes' else 'No' end as 'Using Sandler CRM',
			case when IsDHSAwardWinner=1 then 'Yes' else 'No' end as 'DHS Award Winner',
			Convert(varchar(12),A.DHSAwardDate,101) as 'DHS Award Date',
			Convert(varchar(12),A.InitialTrngDate,101) as 'Initial Training Date',
			case when IsReqToSubmitFinancial=1 then 'Yes' else 'No' end as 'Required To Submit Financial',
			case when IsRepAgreement=1 then 'Yes' else 'No' end as 'Representive Agreement',
			Isnull(a.WorkEmail,'') as 'Work Email',Isnull(a.WorkAddress,'') as 'Work Address',Isnull(a.WorkCity,'') as 'Work City',
			Isnull(d.Name,'') as 'Work State',Isnull(a.WorkZip,'') as 'Work Zip',Isnull(e.Name,'') as 'Work Country',
			Isnull(a.AlternateEmail,'') as 'Alternate Email',case when a.IsSameHomeAddress ='1' then 'Yes' else 'No' end as 'Same Home Address',
			Isnull(a.HomeAddress,'') as 'Home Address',Isnull(a.HomeCity,'') as 'Home City',Isnull(f.Name,'') as 'Home State',Isnull(a.HomeZip,'') as 'Home Zip',
			Isnull(g.Name,'') as 'Home Country',Isnull(a.SpouseName,'') as 'Spouse Name',
			Convert(varchar(12),A.Birthday,101) as 'Birth Day',
			Convert(varchar(12),A.Anniversary,101) as 'Anniversary',a.YearsWithCompany as 'Years With Company',
			case when a.IsMasterFranchiseeExists=1 then 'Yes' else 'No' end as 'Is Master Franchisee',
			case when a.IsCanPrintLocally=1 then 'Yes' else 'No' end as 'Local Print',
			case when a.IsBuyFromCustomer=1 then 'Yes' else 'No' end as 'Buy From Customer',
			case when a.IsFixedPricePurchase=1 then 'Yes' else 'No' end as 'Fixed Price Purchase',
			Isnull(p.CostPlusAmountText,'') as 'Cost Plus Amount',
			case when a.IsBehindInTerDev=1 then 'Yes' else 'No' end as 'Behind in Territory Develop',
			Isnull(q.BehindAmountText,'') as 'Amount Behind'
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
		left join dbo.Tbl_PrimaryBusiness O on a.PrimaryBusinessId = o.PrimaryBusinessId
		left join dbo.Tbl_CostPlusAmount P on a.CostPlusAmountId=p.CostPlusAmountId
		left join dbo.tbl_BehindAmount Q on a.BehindAmountId=Q.BehindAmountId		
		ORDER BY C.Name
	
	
	

GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportfrbystate]    Script Date: 02/11/2013 20:44:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_GetHomeOfficeReportfrbystate]
	
	(		
		@reportType Varchar(100)
	)
	
AS
	If(@reportType<>'Excel') 
	SELECT A.ID AS DATAROWID,		
		a.State,		
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',
Isnull(A.NAME,'') AS 'Franchise Name',						
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'Contact Number',
			Convert(varchar(12),A.LASTCREATEDDATE,101) as 'Last Updated'
		FROM DBO.TBL_FRANCHISEE A	
		Left Join dbo.TBL_COUNTRY B on A.CountryID=B.ID
		ORDER BY a.State			
	Else
		SELECT 	
		a.State,			
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',
	Isnull(A.NAME,'') AS 'Franchise Name',		
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'Contact Number',
			Convert(varchar(12),A.LASTCREATEDDATE,101) as 'Last Updated',			
			i.UserName as 'Last Updated By',
			Convert(varchar(12),A.CreatedDate,101) AS 'Last Updated',J.UserName as 'Last Created By',
			k.SandlerRoleText as 'Sandler Role', a.Title,
			Isnull(A.EMAILADDRESS,'') as Email,Isnull(a.WebAddress,'') as Website,
			Case when A.IsActive='1' Then 'Active' else 'InActive' end as Active,			
			IsNull(A.Address1,'')+' '+IsNull(A.Address2,'') as Address,
			Isnull(A.City,''),Isnull(A.State,''),Isnull(A.Zip,''),Isnull(c.Name,'') as Country,
			Isnull(A.PhoneNumber,''),Isnull(a.OfficePhone,'') as 'Office Phone',
			Isnull(a.HomePhone,'') as 'Home Phone', Isnull(a.MobilePhone,'') as 'Mobile Phone',
			Isnull(a.Fax,''), Isnull(a.FaxNumber,'') as 'Fax Number',
			Convert(varchar(12),A.DHSAwardDate,101) as 'Award Date',
			Isnull(l.AwardLevelText,'') as 'Award Level',Isnull(m.PurchaseLevelText,'') as 'Purchase Level',
			Isnull(n.CertifiedLevelText,'') as 'Certified Level',Isnull(o.PrimaryBusinessText,'') as 'Primary Business',
			Convert(varchar(12),A.InitialContractDate,101) as 'Initial Contact Date',
			Convert(varchar(12),A.RenewalDate,101) as 'Renewal Date',
			Convert(varchar(12),A.ContractFormDate,101) as 'Contact Form Date',
			case when IsContractorPermitted=1 then 'Yes' else 'No' end as 'Contractor Permitted',
			case when IsSandlerMailRequired=1 then 'Yes' else 'No' end as 'Sandler Mail Required',
			case when IsKOLMember=1 then 'Yes' else 'No' end as 'KOL Member',
			case when IsAdvBoard=1 then 'Yes' else 'No' end as 'Advisory Board',
			case when IsMktgCommittee=1 then 'Yes' else 'No' end as 'Marketing Committee',
			case when IsUsingSandlerCRM=1 then 'Yes' else 'No' end as 'Using Sandler CRM',
			case when IsDHSAwardWinner=1 then 'Yes' else 'No' end as 'DHS Award Winner',
			Convert(varchar(12),A.DHSAwardDate,101) as 'DHS Award Date',
			Convert(varchar(12),A.InitialTrngDate,101) as 'Initial Training Date',
			case when IsReqToSubmitFinancial=1 then 'Yes' else 'No' end as 'Required To Submit Financial',
			case when IsRepAgreement=1 then 'Yes' else 'No' end as 'Representive Agreement',
			Isnull(a.WorkEmail,'') as 'Work Email',Isnull(a.WorkAddress,'') as 'Work Address',Isnull(a.WorkCity,'') as 'Work City',
			Isnull(d.Name,'') as 'Work State',Isnull(a.WorkZip,'') as 'Work Zip',Isnull(e.Name,'') as 'Work Country',
			Isnull(a.AlternateEmail,'') as 'Alternate Email',case when a.IsSameHomeAddress ='1' then 'Yes' else 'No' end as 'Same Home Address',
			Isnull(a.HomeAddress,'') as 'Home Address',Isnull(a.HomeCity,'') as 'Home City',Isnull(f.Name,'') as 'Home State',Isnull(a.HomeZip,'') as 'Home Zip',
			Isnull(g.Name,'') as 'Home Country',Isnull(a.SpouseName,'') as 'Spouse Name',
			Convert(varchar(12),A.Birthday,101) as 'Birth Day',
			Convert(varchar(12),A.Anniversary,101) as 'Anniversary',a.YearsWithCompany as 'Years With Company',
			case when a.IsMasterFranchiseeExists=1 then 'Yes' else 'No' end as 'Is Master Franchisee',
			case when a.IsCanPrintLocally=1 then 'Yes' else 'No' end as 'Local Print',
			case when a.IsBuyFromCustomer=1 then 'Yes' else 'No' end as 'Buy From Customer',
			case when a.IsFixedPricePurchase=1 then 'Yes' else 'No' end as 'Fixed Price Purchase',
			Isnull(p.CostPlusAmountText,'') as 'Cost Plus Amount',
			case when a.IsBehindInTerDev=1 then 'Yes' else 'No' end as 'Behind in Territory Develop',
			Isnull(q.BehindAmountText,'') as 'Amount Behind'
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
		left join dbo.Tbl_PrimaryBusiness O on a.PrimaryBusinessId = o.PrimaryBusinessId
		left join dbo.Tbl_CostPlusAmount P on a.CostPlusAmountId=p.CostPlusAmountId
		left join dbo.tbl_BehindAmount Q on a.BehindAmountId=Q.BehindAmountId		
		ORDER BY a.State
	
	
	

GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportfrbyregion]    Script Date: 02/11/2013 20:44:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_GetHomeOfficeReportfrbyregion]
	
	(		
		@reportType Varchar(100)
	)
	
AS
	If(@reportType<>'Excel') 
	SELECT A.ID AS DATAROWID,		
		c.Name as Region,		
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',
Isnull(A.NAME,'') AS 'Franchise Name',						
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'Contact Number',
			Convert(varchar(12),A.LASTCREATEDDATE,101) as 'Last Updated'
		FROM DBO.TBL_FRANCHISEE A	
		JOIN DBO.TBL_COACH B ON A.COACHID = B.ID	
		join dbo.TBL_REGION C on b.RegionID=c.ID
		ORDER BY c.id				
	Else
		SELECT 	
		h.name as 'Region',					
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',
Isnull(A.NAME,'') AS 'Franchise Name',		
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'Contact Number',
			Convert(varchar(12),A.LASTCREATEDDATE,101) as 'Last Updated',			
			i.UserName as 'Last Updated By',
			Convert(varchar(12),A.CreatedDate,101) AS 'Last Updated',J.UserName as 'Last Created By',
			k.SandlerRoleText as 'Sandler Role', a.Title,
			Isnull(A.EMAILADDRESS,'') as Email,Isnull(a.WebAddress,'') as Website,
			Case when A.IsActive='1' Then 'Active' else 'InActive' end as Active,			
			IsNull(A.Address1,'')+' '+IsNull(A.Address2,'') as Address,
			Isnull(A.City,''),Isnull(A.State,''),Isnull(A.Zip,''),Isnull(c.Name,'') as Country,
			Isnull(A.PhoneNumber,''),Isnull(a.OfficePhone,'') as 'Office Phone',
			Isnull(a.HomePhone,'') as 'Home Phone', Isnull(a.MobilePhone,'') as 'Mobile Phone',
			Isnull(a.Fax,''), Isnull(a.FaxNumber,'') as 'Fax Number',
			Convert(varchar(12),A.DHSAwardDate,101) as 'Award Date',
			Isnull(l.AwardLevelText,'') as 'Award Level',Isnull(m.PurchaseLevelText,'') as 'Purchase Level',
			Isnull(n.CertifiedLevelText,'') as 'Certified Level',Isnull(o.PrimaryBusinessText,'') as 'Primary Business',
			Convert(varchar(12),A.InitialContractDate,101) as 'Initial Contact Date',
			Convert(varchar(12),A.RenewalDate,101) as 'Renewal Date',
			Convert(varchar(12),A.ContractFormDate,101) as 'Contact Form Date',
			case when IsContractorPermitted=1 then 'Yes' else 'No' end as 'Contractor Permitted',
			case when IsSandlerMailRequired=1 then 'Yes' else 'No' end as 'Sandler Mail Required',
			case when IsKOLMember=1 then 'Yes' else 'No' end as 'KOL Member',
			case when IsAdvBoard=1 then 'Yes' else 'No' end as 'Advisory Board',
			case when IsMktgCommittee=1 then 'Yes' else 'No' end as 'Marketing Committee',
			case when IsUsingSandlerCRM=1 then 'Yes' else 'No' end as 'Using Sandler CRM',
			case when IsDHSAwardWinner=1 then 'Yes' else 'No' end as 'DHS Award Winner',
			Convert(varchar(12),A.DHSAwardDate,101) as 'DHS Award Date',
			Convert(varchar(12),A.InitialTrngDate,101) as 'Initial Training Date',
			case when IsReqToSubmitFinancial=1 then 'Yes' else 'No' end as 'Required To Submit Financial',
			case when IsRepAgreement=1 then 'Yes' else 'No' end as 'Representive Agreement',
			Isnull(a.WorkEmail,'') as 'Work Email',Isnull(a.WorkAddress,'') as 'Work Address',Isnull(a.WorkCity,'') as 'Work City',
			Isnull(d.Name,'') as 'Work State',Isnull(a.WorkZip,'') as 'Work Zip',Isnull(e.Name,'') as 'Work Country',
			Isnull(a.AlternateEmail,'') as 'Alternate Email',case when a.IsSameHomeAddress ='1' then 'Yes' else 'No' end as 'Same Home Address',
			Isnull(a.HomeAddress,'') as 'Home Address',Isnull(a.HomeCity,'') as 'Home City',Isnull(f.Name,'') as 'Home State',Isnull(a.HomeZip,'') as 'Home Zip',
			Isnull(g.Name,'') as 'Home Country',Isnull(a.SpouseName,'') as 'Spouse Name',
			Convert(varchar(12),A.Birthday,101) as 'Birth Day',
			Convert(varchar(12),A.Anniversary,101) as 'Anniversary',a.YearsWithCompany as 'Years With Company',
			case when a.IsMasterFranchiseeExists=1 then 'Yes' else 'No' end as 'Is Master Franchisee',
			case when a.IsCanPrintLocally=1 then 'Yes' else 'No' end as 'Local Print',
			case when a.IsBuyFromCustomer=1 then 'Yes' else 'No' end as 'Buy From Customer',
			case when a.IsFixedPricePurchase=1 then 'Yes' else 'No' end as 'Fixed Price Purchase',
			Isnull(p.CostPlusAmountText,'') as 'Cost Plus Amount',
			case when a.IsBehindInTerDev=1 then 'Yes' else 'No' end as 'Behind in Territory Develop',
			Isnull(q.BehindAmountText,'') as 'Amount Behind'
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
		left join dbo.Tbl_PrimaryBusiness O on a.PrimaryBusinessId = o.PrimaryBusinessId
		left join dbo.Tbl_CostPlusAmount P on a.CostPlusAmountId=p.CostPlusAmountId
		left join dbo.tbl_BehindAmount Q on a.BehindAmountId=Q.BehindAmountId		
		ORDER BY H.ID
	
	
	

GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportfrbycoach]    Script Date: 02/11/2013 20:44:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_GetHomeOfficeReportfrbycoach]
	
	(		
		@reportType Varchar(100)
	)
	
AS
	If(@reportType<>'Excel') 
	SELECT A.ID AS DATAROWID,		
		Isnull(B.FIRSTNAME,'')+' '+Isnull(B.LASTNAME,'') AS Coach,		
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',
Isnull(A.NAME,'') AS 'Franchise Name',						
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'Contact Number',
			Convert(varchar(12),A.LASTCREATEDDATE,101) as 'Last Updated'
		FROM DBO.TBL_FRANCHISEE A	
		JOIN DBO.TBL_COACH B ON A.COACHID = B.ID	
		ORDER BY B.FIRSTNAME+' '+B.LASTNAME				
	Else
		SELECT 	
		Isnull(B.FIRSTNAME,'')+' '+Isnull(B.LASTNAME,'') AS Coach,		
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',	
Isnull(A.NAME,'') AS 'Franchise Name',			
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'Contact Number',
			Convert(varchar(12),A.LASTCREATEDDATE,101) as 'Last Updated',			
			i.UserName as 'Last Updated By',
			Convert(varchar(12),A.CreatedDate,101) AS 'Last Updated',J.UserName as 'Last Created By',
			k.SandlerRoleText as 'Sandler Role', a.Title,
			Isnull(A.EMAILADDRESS,'') as Email,Isnull(a.WebAddress,'') as Website,
			Case when A.IsActive='1' Then 'Active' else 'InActive' end as Active,			
			IsNull(A.Address1,'')+' '+IsNull(A.Address2,'') as Address,
			Isnull(A.City,''),Isnull(A.State,''),Isnull(A.Zip,''),Isnull(c.Name,'') as Country,
			Isnull(A.PhoneNumber,''),Isnull(a.OfficePhone,'') as 'Office Phone',
			Isnull(a.HomePhone,'') as 'Home Phone', Isnull(a.MobilePhone,'') as 'Mobile Phone',
			Isnull(a.Fax,''), Isnull(a.FaxNumber,'') as 'Fax Number',
			Convert(varchar(12),A.DHSAwardDate,101) as 'Award Date',
			Isnull(l.AwardLevelText,'') as 'Award Level',Isnull(m.PurchaseLevelText,'') as 'Purchase Level',
			Isnull(n.CertifiedLevelText,'') as 'Certified Level',Isnull(o.PrimaryBusinessText,'') as 'Primary Business',
			Convert(varchar(12),A.InitialContractDate,101) as 'Initial Contact Date',
			Convert(varchar(12),A.RenewalDate,101) as 'Renewal Date',
			Convert(varchar(12),A.ContractFormDate,101) as 'Contact Form Date',
			case when IsContractorPermitted=1 then 'Yes' else 'No' end as 'Contractor Permitted',
			case when IsSandlerMailRequired=1 then 'Yes' else 'No' end as 'Sandler Mail Required',
			case when IsKOLMember=1 then 'Yes' else 'No' end as 'KOL Member',
			case when IsAdvBoard=1 then 'Yes' else 'No' end as 'Advisory Board',
			case when IsMktgCommittee=1 then 'Yes' else 'No' end as 'Marketing Committee',
			case when IsUsingSandlerCRM=1 then 'Yes' else 'No' end as 'Using Sandler CRM',
			case when IsDHSAwardWinner=1 then 'Yes' else 'No' end as 'DHS Award Winner',
			Convert(varchar(12),A.DHSAwardDate,101) as 'DHS Award Date',
			Convert(varchar(12),A.InitialTrngDate,101) as 'Initial Training Date',
			case when IsReqToSubmitFinancial=1 then 'Yes' else 'No' end as 'Required To Submit Financial',
			case when IsRepAgreement=1 then 'Yes' else 'No' end as 'Representive Agreement',
			Isnull(a.WorkEmail,'') as 'Work Email',Isnull(a.WorkAddress,'') as 'Work Address',Isnull(a.WorkCity,'') as 'Work City',
			Isnull(d.Name,'') as 'Work State',Isnull(a.WorkZip,'') as 'Work Zip',Isnull(e.Name,'') as 'Work Country',
			Isnull(a.AlternateEmail,'') as 'Alternate Email',case when a.IsSameHomeAddress ='1' then 'Yes' else 'No' end as 'Same Home Address',
			Isnull(a.HomeAddress,'') as 'Home Address',Isnull(a.HomeCity,'') as 'Home City',Isnull(f.Name,'') as 'Home State',Isnull(a.HomeZip,'') as 'Home Zip',
			Isnull(g.Name,'') as 'Home Country',Isnull(a.SpouseName,'') as 'Spouse Name',
			Convert(varchar(12),A.Birthday,101) as 'Birth Day',
			Convert(varchar(12),A.Anniversary,101) as 'Anniversary',a.YearsWithCompany as 'Years With Company',
			case when a.IsMasterFranchiseeExists=1 then 'Yes' else 'No' end as 'Is Master Franchisee',
			case when a.IsCanPrintLocally=1 then 'Yes' else 'No' end as 'Local Print',
			case when a.IsBuyFromCustomer=1 then 'Yes' else 'No' end as 'Buy From Customer',
			case when a.IsFixedPricePurchase=1 then 'Yes' else 'No' end as 'Fixed Price Purchase',
			Isnull(p.CostPlusAmountText,'') as 'Cost Plus Amount',
			case when a.IsBehindInTerDev=1 then 'Yes' else 'No' end as 'Behind in Territory Develop',
			Isnull(q.BehindAmountText,'') as 'Amount Behind'
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
		left join dbo.Tbl_PrimaryBusiness O on a.PrimaryBusinessId = o.PrimaryBusinessId
		left join dbo.Tbl_CostPlusAmount P on a.CostPlusAmountId=p.CostPlusAmountId
		left join dbo.tbl_BehindAmount Q on a.BehindAmountId=Q.BehindAmountId		
		ORDER BY B.FIRSTNAME+' '+B.LASTNAME
	
	
	

GO

/****** Object:  StoredProcedure [dbo].[sp_InsertQuickStartRecord]    Script Date: 02/12/2013 09:49:16 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_InsertQuickStartRecord]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_InsertQuickStartRecord]
GO

USE [SandlerDB]
GO

/****** Object:  StoredProcedure [dbo].[sp_InsertQuickStartRecord]    Script Date: 02/12/2013 09:49:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[sp_InsertQuickStartRecord]
	(	
		@COMPANYNAME varchar(150), 
		@FirstName varchar(50),@LastName varchar(50),
		@Phone varchar(50),@Email varchar(50),
		@OPPNAME varchar(100),@Pain varchar(100),
		@LengthProblem varchar(30), @Alternatives varchar(100),
		@CostToFix varchar(30),@BudgeIdentifiedValue int,@MoveForwardValue int,
		@ProductID int, @OppStatusID int,@OppSourceID int,@OppTypeID int,
		@OPPVALUE varchar(100),@ACTIONSTEP varchar(150),
		@NextContactDate datetime,@OppCloseDate datetime,
		@CreatedBy varchar(100),
		@LoggedInUserName varchar(100),
		@FranchiseeId int
		
	 )
AS

	declare @CreationDate datetime
	declare @companyID int
	declare @contactID int
	
		
	Set @CreationDate = GETDATE()
	
	if @NextContactDate < '2/1/1755'
	Begin
	  Set @NextContactDate = null
	End	
	
	if @OppCloseDate < '2/1/1755'
	Begin
	  Set @OppCloseDate = null
	End
	
	if(@ProductID = 0) 
 
	Begin

	 Set @ProductID = null

	 End
	
	if(@OppStatusID = 0) 
 
	Begin

	 Set @OppStatusID = null

	 End
	
	if(@OppSourceID = 0) 
 
	Begin

	 Set @OppSourceID = null

	 End
	
	if(@OppTypeID = 0) 
 
	Begin

	 Set @OppTypeID = null

	 End
		
	
	BEGIN
		--First Let us create record in the Tbl_Companies
		Insert into TBL_COMPANIES(POCEmail,POCPhone,POCFirstName,POCLastName,COMPANYNAME,IsActive,CreationDate,CreatedDate,UpdatedDate,CreatedBy,NEXTCONTACT_DATE,FranchiseeId,IsSameBillingAddress,IsNewCompany) values
		(@Email,@Phone,@FirstName,@LastName,@CompanyName,1,@CreationDate,@CreationDate,@CreationDate,@CreatedBy,@NextContactDate,@FranchiseeId,0,0)
		set @companyID = @@IDENTITY
		
		-- Now user this Company Id and create record in the Contact Table
		Insert into TBL_CONTACTS(COMPANYID,LASTNAME,FIRSTNAME,PHONE,EMAIL,NEXT_CONTACT_DATE,IsActive,CreatedBy,CreatedDate,UpdatedDate,IsEmailSubscription,IsNeedCallBack,IsRegisteredForTraining,IsNewAppointment) values
		(@companyID,@LastName,@FirstName,@Phone,@Email,@NextContactDate,1,@CreatedBy,@CreationDate,@CreationDate,1,0,0,0)
		set @contactID = @@IDENTITY
		
				
		-- Now Create the Opportunity based on Comapany and Contact Id
		Insert into TBL_OPPORTUNITIES(COMPANYID,CONTACTID,Name,ProductID,
		STATUSID,VALUE,CLOSEDATE,IsActive,CreatedBy,CreatedDate,SourceID,TypeID,CreationDate,SALESREPLASTNAME,SALESREPFIRSTNAME,UpdatedDate) values
		(@companyID,@contactID,@OppName,@ProductID,@OppStatusID,@OPPVALUE,@OppCloseDate,1,@CreatedBy,@CreationDate,@OppSourceID,@OppTypeID,@CreationDate,@LoggedInUserName,@LoggedInUserName,@CreationDate)
		
		
		
	END
	
	/* SET NOCOUNT ON */
	RETURN





GO


ALTER PROCEDURE [dbo].[sp_InsertQuickStartRecord]
	(	
		@COMPANYNAME varchar(150), 
		@FirstName varchar(50),@LastName varchar(50),
		@Phone varchar(50),@Email varchar(50),
		@OPPNAME varchar(100),@Pain varchar(100),
		@LengthProblem varchar(30), @Alternatives varchar(100),
		@CostToFix varchar(30),@BudgeIdentifiedValue int,@MoveForwardValue int,
		@ProductID int, @OppStatusID int,@OppSourceID int,@OppTypeID int,
		@OPPVALUE varchar(100),@ACTIONSTEP varchar(150),
		@NextContactDate datetime,@OppCloseDate datetime,
		@CreatedBy varchar(100),
		@LoggedInUserName varchar(100),
		@FranchiseeId int
		
	 )
AS

	declare @CreationDate datetime
	declare @companyID int
	declare @contactID int
	declare @userFirstName varchar(100)
	declare @userLastName varchar(100)
	
	Set @userFirstName = ( select FirstName from tbl_coach where  UserID=@CreatedBy
							union
							Select  FirstName from TBL_FRANCHISEE_USERS where  UserID=@CreatedBy
						)
						
	Set @userLastName = ( select LastName from tbl_coach where  UserID=@CreatedBy
		union
		Select  LastName from TBL_FRANCHISEE_USERS where  UserID=@CreatedBy
	)


		
	Set @CreationDate = GETDATE()
	
	if @NextContactDate < '2/1/1755'
	Begin
	  Set @NextContactDate = null
	End	
	
	if @OppCloseDate < '2/1/1755'
	Begin
	  Set @OppCloseDate = null
	End
	
	if(@ProductID = 0) 
 
	Begin

	 Set @ProductID = null

	 End
	
	if(@OppStatusID = 0) 
 
	Begin

	 Set @OppStatusID = null

	 End
	
	if(@OppSourceID = 0) 
 
	Begin

	 Set @OppSourceID = null

	 End
	
	if(@OppTypeID = 0) 
 
	Begin

	 Set @OppTypeID = null

	 End
		
	
	BEGIN
		--First Let us create record in the Tbl_Companies
		Insert into TBL_COMPANIES(POCEmail,POCPhone,POCFirstName,POCLastName,COMPANYNAME,IsActive,CreationDate,CreatedDate,UpdatedDate,CreatedBy,NEXTCONTACT_DATE,FranchiseeId,IsSameBillingAddress,IsNewCompany) values
		(@Email,@Phone,@FirstName,@LastName,@CompanyName,1,@CreationDate,@CreationDate,@CreationDate,@CreatedBy,@NextContactDate,@FranchiseeId,0,0)
		set @companyID = @@IDENTITY
		
		-- Now user this Company Id and create record in the Contact Table
		Insert into TBL_CONTACTS(COMPANYID,LASTNAME,FIRSTNAME,PHONE,EMAIL,NEXT_CONTACT_DATE,IsActive,CreatedBy,CreatedDate,UpdatedDate,IsEmailSubscription,IsNeedCallBack,IsRegisteredForTraining,IsNewAppointment) values
		(@companyID,@LastName,@FirstName,@Phone,@Email,@NextContactDate,1,@CreatedBy,@CreationDate,@CreationDate,1,0,0,0)
		set @contactID = @@IDENTITY
		
				
		-- Now Create the Opportunity based on Comapany and Contact Id
		Insert into TBL_OPPORTUNITIES(COMPANYID,CONTACTID,Name,ProductID,
		STATUSID,VALUE,CLOSEDATE,IsActive,CreatedBy,CreatedDate,SourceID,TypeID,CreationDate,SALESREPLASTNAME,SALESREPFIRSTNAME,UpdatedDate) values
		(@companyID,@contactID,@OppName,@ProductID,@OppStatusID,@OPPVALUE,@OppCloseDate,1,@CreatedBy,@CreationDate,@OppSourceID,@OppTypeID,@CreationDate,@userLastName,@userFirstName,@CreationDate)
		
		
		
	END
	
	/* SET NOCOUNT ON */
	RETURN




GO




ALTER  PROCEDURE [dbo].[sp_GetCallList]

	 (

	 @Role varchar(50),

	 @UserId varchar(50),

	 @FranchiseeId int,

	 @RegionId int
 
	)

AS

		

	 if (@Role = 'Corporate' or @Role = 'SiteAdmin')

	 Begin

		 Select ct.lastname + ',' + ct.FirstName as FullName, ct.phone, ct.Email, ct.contactsid ,
		 ISNULL(ct.discussionTopic,'') as DiscussionTopic ,cp.COMPANYNAME , ct.LAST_CONTACT_DATE  

		 from tbl_contacts ct 

		 join tbl_companies cp on ct.companyid = cp.COMPANIESID
 
		where ct.LAST_CONTACT_DATE is not null and

		 -- Last contact date is within 30 days period
 
		ct.IsNeedCallBack = 1 and ct.LAST_CONTACT_DATE <= (GETDATE()-30)

		 Order by cp.COMPANYNAME
 
	End

    

    if (@Role = 'Coach')

	 Begin

	    Select ct.lastname + ',' + ct.FirstName as FullName, ct.phone, ct.Email, ct.contactsid 	,cp.COMPANYNAME , ct.LAST_CONTACT_DATE,
	    ISNULL(ct.discussionTopic,'') as DiscussionTopic  

		 from tbl_contacts ct join tbl_companies cp on ct.companyid = cp.COMPANIESID

		 join TBL_FRANCHISEE f on cp.FranchiseeId = f.ID  join TBL_COACH ch on f.CoachID = ch.ID

		 where ct.LAST_CONTACT_DATE is not null and ch.RegionID = @RegionId and

		 -- Last contact date is within 30 days period

		 ct.IsNeedCallBack = 1 and ct.LAST_CONTACT_DATE <= (GETDATE()-30)

		 Order by cp.COMPANYNAME
 
	End

    

    if (@Role = 'FranchiseeOwner' or @Role = 'Client')

    Begin

        Select ct.lastname + ',' + ct.FirstName as FullName, ct.phone, ct.Email, ct.contactsid 	,cp.COMPANYNAME , ct.LAST_CONTACT_DATE ,
        ISNULL(ct.discussionTopic,'') as DiscussionTopic 

		 from tbl_contacts ct join tbl_companies cp on ct.companyid = cp.COMPANIESID

		 join TBL_FRANCHISEE f on cp.FranchiseeId = f.ID

		 where ct.LAST_CONTACT_DATE is not null and f.ID = @FranchiseeId and

		 -- Last contact date is within 30 days period

		 ct.IsNeedCallBack = 1 and ct.LAST_CONTACT_DATE <= (GETDATE()-30)

		 Order by cp.COMPANYNAME
 
    End

    

    if (@Role = 'FranchiseeUser')

    Begin

        Select ct.lastname + ',' + ct.FirstName as FullName, ct.phone, ct.Email, ct.contactsid 	,cp.COMPANYNAME , ct.LAST_CONTACT_DATE  ,
        ISNULL(ct.discussionTopic,'') as DiscussionTopic

		 from tbl_contacts ct join tbl_companies cp on ct.companyid = cp.COMPANIESID

		 where ct.LAST_CONTACT_DATE is not null and ct.CreatedBy = @UserId and

		 -- Last contact date is within 30 days period

		 ct.IsNeedCallBack = 1 and ct.LAST_CONTACT_DATE <= (GETDATE()-30)

		 Order by cp.COMPANYNAME

    

    End

    

	 RETURN
 



