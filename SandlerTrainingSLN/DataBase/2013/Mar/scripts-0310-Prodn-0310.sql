                                                                     
                                                                     
                                                                     
                                             
/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportdhsa]    Script Date: 03/11/2013 22:55:15 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetHomeOfficeReportdhsa]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetHomeOfficeReportdhsa]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportfrbyawlevel]    Script Date: 03/11/2013 22:55:15 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetHomeOfficeReportfrbyawlevel]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetHomeOfficeReportfrbyawlevel]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportfrbybusarea]    Script Date: 03/11/2013 22:55:15 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetHomeOfficeReportfrbybusarea]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetHomeOfficeReportfrbybusarea]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportfrbycertlevel]    Script Date: 03/11/2013 22:55:15 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetHomeOfficeReportfrbycertlevel]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetHomeOfficeReportfrbycertlevel]
GO


/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportdhsa]    Script Date: 03/11/2013 22:55:15 ******/
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
		Convert(varchar(12),A.DHSAwardDate,101) as 'DHS Award Date',		
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
		Convert(varchar(12),A.DHSAwardDate,101) as 'DHS Award Date',	
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'Contact Number',
			Convert(varchar(12),A.LASTCREATEDDATE,101) as 'Last Updated',			
			i.UserName as 'Last Updated By',
			Convert(varchar(12),A.CreatedDate,101) AS 'Created Date',J.UserName as 'Created By',
			k.SandlerRoleText as 'Sandler Role', a.Title,
			Isnull(a.WebAddress,'') as Website,
			Case when A.IsActive='1' Then 'Active' else 'InActive' end as Active,			
			IsNull(A.Address1,'') as 'Address',IsNull(A.Address2,'') as 'Address Line 2',
			Isnull(A.City,'') City,Isnull(A.State,'') State,Isnull(A.Zip,'') Zip,Isnull(c.Name,'') as Country,
			Isnull(A.PhoneNumber,'') Phone,
			Isnull(a.HomePhone,'') as 'Home Phone', Isnull(a.MobilePhone,'') as 'Mobile Phone',
			Isnull(a.Fax,'') Fax, Isnull(a.FaxNumber,'') as 'Fax Number',
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
			Isnull(a.WorkEmail,'') as 'Primary Office Email',Isnull(a.WorkAddress,'') as 'Primary Office Address',Isnull(a.WorkCity,'') as 'Primary Office City',
			Isnull(d.Name,'') as 'Primary Office State',Isnull(a.WorkZip,'') as 'Primary Office Zip',Isnull(e.Name,'') as 'Primary Office Country',
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
			Isnull(q.BehindAmountText,'') as 'Amount Behind',
			a.Territory as 'Territory',
	a.BusinessFocusArea as 'Business Focus Area',	
	a.ClosestMetroArea as 'Closest Metro Area'
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

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportfrbyawlevel]    Script Date: 03/11/2013 22:55:15 ******/
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
		where A.AwardLevelId is not null			
		ORDER BY B.AwardLevelText				
	Else
		SELECT 	
		l.AwardLevelText as 'Award Level',		
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',	
	Isnull(A.NAME,'') AS 'Franchise Name',
	Convert(varchar(12),A.DHSAwardDate,101) as 'DHS Award Date',			
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'Contact Number',
			Convert(varchar(12),A.LASTCREATEDDATE,101) as 'Last Updated',			
			i.UserName as 'Last Updated By',
			Convert(varchar(12),A.CreatedDate,101) AS 'Created Date',J.UserName as 'Created By',
			k.SandlerRoleText as 'Sandler Role', a.Title,
			Isnull(a.WebAddress,'') as Website,
			Case when A.IsActive='1' Then 'Active' else 'InActive' end as Active,			
			IsNull(A.Address1,'') as 'Address',IsNull(A.Address2,'') as 'Address Line 2',
			Isnull(A.City,'') City,Isnull(A.State,'') State,Isnull(A.Zip,'') Zip,Isnull(c.Name,'') as Country,
			Isnull(A.PhoneNumber,'') Phone,
			Isnull(a.HomePhone,'') as 'Home Phone', Isnull(a.MobilePhone,'') as 'Mobile Phone',
			Isnull(a.Fax,'') Fax, Isnull(a.FaxNumber,'') as 'Fax Number',
			--Convert(varchar(12),A.DHSAwardDate,101) as 'Award Date',
			Isnull(m.PurchaseLevelText,'') as 'Purchase Level',
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
			Convert(varchar(12),A.InitialTrngDate,101) as 'Initial Training Date',
			case when IsReqToSubmitFinancial=1 then 'Yes' else 'No' end as 'Required To Submit Financial',
			case when IsRepAgreement=1 then 'Yes' else 'No' end as 'Representive Agreement',
			Isnull(a.WorkEmail,'') as 'Primary Office Email',Isnull(a.WorkAddress,'') as 'Primary Office Address',Isnull(a.WorkCity,'') as 'Primary Office City',
			Isnull(d.Name,'') as 'Primary Office State',Isnull(a.WorkZip,'') as 'Primary Office Zip',Isnull(e.Name,'') as 'Primary Office Country',
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
			Isnull(q.BehindAmountText,'') as 'Amount Behind',
			a.Territory as 'Territory',
	a.BusinessFocusArea as 'Business Focus Area',	
	a.ClosestMetroArea as 'Closest Metro Area'
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
		where A.AwardLevelId is not null			
		ORDER BY l.AwardLevelText
	
	
	


GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportfrbybusarea]    Script Date: 03/11/2013 22:55:15 ******/
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
		where A.PrimaryBusinessId is not null
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
			Convert(varchar(12),A.CreatedDate,101) AS 'Created Date',J.UserName as 'Created By',
			k.SandlerRoleText as 'Sandler Role', a.Title,
			Isnull(a.WebAddress,'') as Website,
			Case when A.IsActive='1' Then 'Active' else 'InActive' end as Active,			
			IsNull(A.Address1,'') as 'Address',IsNull(A.Address2,'') as 'Address Line 2',
			Isnull(A.City,'') City,Isnull(A.State,'') State,Isnull(A.Zip,'') Zip,Isnull(c.Name,'') as Country,
			Isnull(A.PhoneNumber,'') Phone,
			Isnull(a.HomePhone,'') as 'Home Phone', Isnull(a.MobilePhone,'') as 'Mobile Phone',
			Isnull(a.Fax,'') Fax, Isnull(a.FaxNumber,'') as 'Fax Number',
			Convert(varchar(12),A.DHSAwardDate,101) as 'Award Date',
			Isnull(l.AwardLevelText,'') as 'Award Level',Isnull(m.PurchaseLevelText,'') as 'Purchase Level',
			Isnull(n.CertifiedLevelText,'') as 'Certified Level',
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
			Isnull(a.WorkEmail,'') as 'Primary Office Email',Isnull(a.WorkAddress,'') as 'Primary Office Address',Isnull(a.WorkCity,'') as 'Primary Office City',
			Isnull(d.Name,'') as 'Primary Office State',Isnull(a.WorkZip,'') as 'Primary Office Zip',Isnull(e.Name,'') as 'Primary Office Country',
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
			Isnull(q.BehindAmountText,'') as 'Amount Behind',
			a.Territory as 'Territory',
	a.BusinessFocusArea as 'Business Focus Area',	
	a.ClosestMetroArea as 'Closest Metro Area'
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
		where A.PrimaryBusinessId is not null		
		ORDER BY o.PrimaryBusinessText
	
	
	


GO

/****** Object:  StoredProcedure [dbo].[sp_GetHomeOfficeReportfrbycertlevel]    Script Date: 03/11/2013 22:55:15 ******/
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
		where A.CertifiedLevelId is not null
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
			Convert(varchar(12),A.CreatedDate,101) AS 'Created Date',J.UserName as 'Created By',
			k.SandlerRoleText as 'Sandler Role', a.Title,
			Isnull(a.WebAddress,'') as Website,
			Case when A.IsActive='1' Then 'Active' else 'InActive' end as Active,			
			IsNull(A.Address1,'') as 'Address',IsNull(A.Address2,'') as 'Address Line 2',
			Isnull(A.City,'') City,Isnull(A.State,'') State,Isnull(A.Zip,'') Zip,Isnull(c.Name,'') as Country,
			Isnull(A.PhoneNumber,'') Phone,
			Isnull(a.HomePhone,'') as 'Home Phone', Isnull(a.MobilePhone,'') as 'Mobile Phone',
			Isnull(a.Fax,'') Fax, Isnull(a.FaxNumber,'') as 'Fax Number',
			Convert(varchar(12),A.DHSAwardDate,101) as 'Award Date',
			Isnull(l.AwardLevelText,'') as 'Award Level',Isnull(m.PurchaseLevelText,'') as 'Purchase Level',
			Isnull(o.PrimaryBusinessText,'') as 'Primary Business',
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
			Isnull(a.WorkEmail,'') as 'Primary Office Email',Isnull(a.WorkAddress,'') as 'Primary Office Address',Isnull(a.WorkCity,'') as 'Primary Office City',
			Isnull(d.Name,'') as 'Primary Office State',Isnull(a.WorkZip,'') as 'Primary Office Zip',Isnull(e.Name,'') as 'Primary Office Country',
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
			Isnull(q.BehindAmountText,'') as 'Amount Behind',
			a.Territory as 'Territory',
	a.BusinessFocusArea as 'Business Focus Area',	
	a.ClosestMetroArea as 'Closest Metro Area'
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
		where A.CertifiedLevelId is not null		
		ORDER BY n.CertifiedLevelText
	
	
	


GO

