IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetHomeOfficeReportfrbycoach]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetHomeOfficeReportfrbycoach]

GO
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
		Isnull(A.NAME,'') AS 'Franchise Name',				
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',		
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'CONTACT NUMBER',
			Convert(varchar(12),A.LASTCREATEDDATE,101) as 'Last Updated'
		FROM DBO.TBL_FRANCHISEE A	
		JOIN DBO.TBL_COACH B ON A.COACHID = B.ID	
		ORDER BY B.FIRSTNAME+' '+B.LASTNAME				
	Else
		SELECT 	
		Isnull(B.FIRSTNAME,'')+' '+Isnull(B.LASTNAME,'') AS Coach,
		Isnull(A.NAME,'') AS 'Franchise Name',	
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',		
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'CONTACT NUMBER',
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





IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetHomeOfficeReportfrbyregion]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetHomeOfficeReportfrbyregion]

GO
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
		Isnull(A.NAME,'') AS 'Franchise Name',				
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',		
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'CONTACT NUMBER',
			Convert(varchar(12),A.LASTCREATEDDATE,101) as 'Last Updated'
		FROM DBO.TBL_FRANCHISEE A	
		JOIN DBO.TBL_COACH B ON A.COACHID = B.ID	
		join dbo.TBL_REGION C on b.RegionID=c.ID
		ORDER BY c.id				
	Else
		SELECT 	
		h.name as 'Region',		
		Isnull(A.NAME,'') AS 'Franchise Name',	
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',		
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'CONTACT NUMBER',
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





IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetHomeOfficeReportfrbystate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetHomeOfficeReportfrbystate]

GO
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
		Isnull(A.NAME,'') AS 'Franchise Name',				
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',		
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'CONTACT NUMBER',
			Convert(varchar(12),A.LASTCREATEDDATE,101) as 'Last Updated'
		FROM DBO.TBL_FRANCHISEE A	
		Left Join dbo.TBL_COUNTRY B on A.CountryID=B.ID
		ORDER BY a.State			
	Else
		SELECT 	
		a.State,
		Isnull(A.NAME,'') AS 'Franchise Name',	
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',		
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'CONTACT NUMBER',
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





IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetHomeOfficeReportfrbycountry]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetHomeOfficeReportfrbycountry]

GO
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
		Isnull(A.NAME,'') AS 'Franchise Name',				
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',		
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'CONTACT NUMBER',
			Convert(varchar(12),A.LASTCREATEDDATE,101) as 'Last Updated'
		FROM DBO.TBL_FRANCHISEE A	
		Left Join dbo.TBL_COUNTRY B on A.CountryID=B.ID
		ORDER BY B.Name					
	Else
		SELECT 	
		C.Name as Country,
		Isnull(A.NAME,'') AS 'Franchise Name',	
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',		
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'CONTACT NUMBER',
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





IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetHomeOfficeReportfrbyawlevel]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetHomeOfficeReportfrbyawlevel]

GO
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
		Isnull(A.NAME,'') AS 'Franchise Name',				
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',		
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'CONTACT NUMBER',
			Convert(varchar(12),A.LASTCREATEDDATE,101) as 'Last Updated'
		FROM DBO.TBL_FRANCHISEE A	
		Left Join dbo.Tbl_AwardLevel B on a.AwardLevelId=B.AwardLevelId		
		ORDER BY B.AwardLevelText				
	Else
		SELECT 	
		l.AwardLevelText as 'Award Level',
		Isnull(A.NAME,'') AS 'Franchise Name',	
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',		
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'CONTACT NUMBER',
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





IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetHomeOfficeReportfrbytrngdate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetHomeOfficeReportfrbytrngdate]

GO
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
		Isnull(A.NAME,'') AS 'Franchise Name',				
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',		
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'CONTACT NUMBER',
			Convert(varchar(12),A.LASTCREATEDDATE,101) as 'Last Updated'
		FROM DBO.TBL_FRANCHISEE A			
		ORDER BY A.InitialTrngDate					
	Else
		SELECT 	
		Convert(varchar(12),A.InitialTrngDate,101) as 'Initial Training Date',
		Isnull(A.NAME,'') AS 'Franchise Name',	
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',		
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'CONTACT NUMBER',
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





IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetHomeOfficeReportfrbycontdetails]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetHomeOfficeReportfrbycontdetails]

GO
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
		Convert(varchar(12),A.InitialTrngDate,101) as 'Initial Training Date',
		Convert(varchar(12),A.RenewalDate,101) as 'Renewal Date',
		Convert(varchar(12),A.InitialContractDate,101) as 'Initial Contract Date',
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',		
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'CONTACT NUMBER',
			Convert(varchar(12),A.LASTCREATEDDATE,101) as 'Last Updated'
		FROM DBO.TBL_FRANCHISEE A			
		ORDER BY A.NAME					
	Else
		SELECT 	
		Isnull(A.NAME,'') AS 'Franchise Name',
		Convert(varchar(12),A.InitialTrngDate,101) as 'Initial Training Date',
		Convert(varchar(12),A.RenewalDate,101) as 'Renewal Date',
		Convert(varchar(12),A.InitialContractDate,101) as 'Initial Contract Date',
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',		
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'CONTACT NUMBER',
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





IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetHomeOfficeReportfrbybusarea]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetHomeOfficeReportfrbybusarea]

GO
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
		Isnull(A.NAME,'') AS 'Franchise Name',
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',		
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'CONTACT NUMBER',
			Convert(varchar(12),A.LASTCREATEDDATE,101) as 'Last Updated'
		FROM DBO.TBL_FRANCHISEE A	
		left join dbo.Tbl_PrimaryBusiness B on a.PrimaryBusinessId = B.PrimaryBusinessId
		ORDER BY B.PrimaryBusinessText						
	Else
		SELECT 	
		o.PrimaryBusinessText as 'Primary Business',		
		Isnull(A.NAME,'') AS 'Franchise Name',
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',		
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'CONTACT NUMBER',
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





IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetHomeOfficeReportfrbycertlevel]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetHomeOfficeReportfrbycertlevel]

GO
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
		Isnull(A.NAME,'') AS 'Franchise Name',
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',		
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'CONTACT NUMBER',
			Convert(varchar(12),A.LASTCREATEDDATE,101) as 'Last Updated'
		FROM DBO.TBL_FRANCHISEE A	
		left join dbo.Tbl_CertifiedLevel B on a.CertifiedLevelId = B.CertifiedLevelId
		ORDER BY B.CertifiedLevelText							
	Else
		SELECT 	
		n.CertifiedLevelText as 'Certified Level',				
		Isnull(A.NAME,'') AS 'Franchise Name',
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',		
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'CONTACT NUMBER',
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





IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetHomeOfficeReportfrbyusingcrm]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetHomeOfficeReportfrbyusingcrm]

GO
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
		Isnull(A.NAME,'') AS 'Franchise Name',
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',		
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'CONTACT NUMBER',
			Convert(varchar(12),A.LASTCREATEDDATE,101) as 'Last Updated'
		FROM DBO.TBL_FRANCHISEE A						
		ORDER BY a.IsUsingSandlerCRM
	Else
		SELECT 			
		case when a.IsUsingSandlerCRM=1 then 'Yes' else 'No' end as 'Using CRM',	
		Isnull(A.NAME,'') AS 'Franchise Name',
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',		
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'CONTACT NUMBER',
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





IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetHomeOfficeReportmsfr]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetHomeOfficeReportmsfr]

GO
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
			ISNULL(A.OFFICEPHONE,'') AS 'CONTACT NUMBER',
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
			ISNULL(A.OFFICEPHONE,'') AS 'CONTACT NUMBER',
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

	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetHomeOfficeReportmfrd]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetHomeOfficeReportmfrd]

GO
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
			ISNULL(A.OFFICEPHONE,'') AS 'CONTACT NUMBER',
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




IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetHomeOfficeReportmsrbykeyopnldr]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetHomeOfficeReportmsrbykeyopnldr]

GO
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
		Isnull(A.NAME,'') AS 'Franchise Name',
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',		
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'CONTACT NUMBER',
			Convert(varchar(12),A.LASTCREATEDDATE,101) as 'Last Updated'
		FROM DBO.TBL_FRANCHISEE A						
		where a.IsKOLMember=1
		ORDER BY A.NAME
	Else
		SELECT 				
		Isnull(A.NAME,'') AS 'Franchise Name',
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',		
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'CONTACT NUMBER',
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



IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetHomeOfficeReportmsrbyadvboard]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetHomeOfficeReportmsrbyadvboard]

GO
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
		Isnull(A.NAME,'') AS 'Franchise Name',
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',		
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'CONTACT NUMBER',
			Convert(varchar(12),A.LASTCREATEDDATE,101) as 'Last Updated'
		FROM DBO.TBL_FRANCHISEE A						
		where a.IsAdvBoard =1
		ORDER BY A.NAME
	Else
		SELECT 				
		Isnull(A.NAME,'') AS 'Franchise Name',
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',		
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'CONTACT NUMBER',
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



IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetHomeOfficeReportmsrbymktgcom]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetHomeOfficeReportmsrbymktgcom]

GO
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
		Isnull(A.NAME,'') AS 'Franchise Name',
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',		
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'CONTACT NUMBER',
			Convert(varchar(12),A.LASTCREATEDDATE,101) as 'Last Updated'
		FROM DBO.TBL_FRANCHISEE A						
		where a.IsMktgCommittee =1
		ORDER BY A.NAME
	Else
		SELECT 				
		Isnull(A.NAME,'') AS 'Franchise Name',
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',		
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'CONTACT NUMBER',
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





IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetHomeOfficeReportdhsa]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetHomeOfficeReportdhsa]

GO
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
		Isnull(A.NAME,'') AS 'Franchise Name',
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',		
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'CONTACT NUMBER',
			Convert(varchar(12),A.LASTCREATEDDATE,101) as 'Last Updated'
		FROM DBO.TBL_FRANCHISEE A						
		where a.IsDHSAwardWinner =1
		ORDER BY A.NAME
	Else
		SELECT 				
		Isnull(A.NAME,'') AS 'Franchise Name',
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',		
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'CONTACT NUMBER',
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





IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetHomeOfficeReportctra]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetHomeOfficeReportctra]

GO
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
		Isnull(A.NAME,'') AS 'Franchise Name',
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',		
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'CONTACT NUMBER',
			Convert(varchar(12),A.LASTCREATEDDATE,101) as 'Last Updated'
		FROM DBO.TBL_FRANCHISEE A						
		ORDER BY A.IsContractorPermitted
	Else
		SELECT 		
		case when IsContractorPermitted=1 then 'Yes' else 'No' end as 'Contractor Allowed',
		Isnull(A.NAME,'') AS 'Franchise Name',
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',		
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'CONTACT NUMBER',
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





IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetHomeOfficeReportsere]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetHomeOfficeReportsere]

GO
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
		Isnull(A.NAME,'') AS 'Franchise Name',
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',		
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'CONTACT NUMBER',
			Convert(varchar(12),A.LASTCREATEDDATE,101) as 'Last Updated'
		FROM DBO.TBL_FRANCHISEE A						
		ORDER BY A.IsSandlerMailRequired
	Else
		SELECT 		
		case when IsSandlerMailRequired=1 then 'Yes' else 'No' end as 'EMail Required',
		Isnull(A.NAME,'') AS 'Franchise Name',
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',		
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'CONTACT NUMBER',
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





IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetHomeOfficeReportzcbt]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetHomeOfficeReportzcbt]

GO
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
		Isnull(A.NAME,'') AS 'Franchise Name',
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',		
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'CONTACT NUMBER',
			Convert(varchar(12),A.LASTCREATEDDATE,101) as 'Last Updated'
		FROM DBO.TBL_FRANCHISEE A	
		Join dbo.TBL_COACH B on a.CoachID=b.ID
		Join dbo.TBL_REGION C on b.RegionID=c.ID			
		ORDER BY C.Name
	Else
		SELECT 		
		h.Name as 'Territory',a.Zip as 'Zip Code',	
		Isnull(A.NAME,'') AS 'Franchise Name',
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',		
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'CONTACT NUMBER',
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





IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetHomeOfficeReportmsfc]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetHomeOfficeReportmsfc]

GO
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
		Isnull(A.NAME,'') AS 'Franchise Name',
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',		
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'CONTACT NUMBER',
			Convert(varchar(12),A.LASTCREATEDDATE,101) as 'Last Updated'
		FROM DBO.TBL_FRANCHISEE A	
		ORDER BY a.IsReqToSubmitFinancial
	Else
		SELECT 		
		case when IsReqToSubmitFinancial=1 then 'Yes' else 'No' end as 'Must Submit',	
		Isnull(A.NAME,'') AS 'Franchise Name',
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',		
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'CONTACT NUMBER',
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





IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetHomeOfficeReportprpl]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetHomeOfficeReportprpl]

GO
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
		Isnull(A.NAME,'') AS 'Franchise Name',
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',		
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'CONTACT NUMBER',
			Convert(varchar(12),A.LASTCREATEDDATE,101) as 'Last Updated'
		FROM DBO.TBL_FRANCHISEE A	
		left join dbo.Tbl_PurchaseLevel B on a.PurchaseLevelId = B.PurchaseLevelId
		ORDER BY b.PurchaseLevelText
	Else
		SELECT 		
		M.PurchaseLevelText as 'Product Level',			
		Isnull(A.NAME,'') AS 'Franchise Name',
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',		
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'CONTACT NUMBER',
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





IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetHomeOfficeReportfrmd]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetHomeOfficeReportfrmd]

GO
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
			ISNULL(A.OFFICEPHONE,'') AS 'CONTACT NUMBER',
			Convert(varchar(12),A.LASTCREATEDDATE,101) as 'Last Updated'
		FROM DBO.TBL_FRANCHISEE A	
		where a.SandlerRoleId=4
		ORDER BY A.NAME
	Else
		SELECT 				
		Isnull(A.NAME,'') AS 'Franchise Name',
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',		
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'CONTACT NUMBER',
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





IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetHomeOfficeReportglaa]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetHomeOfficeReportglaa]

GO
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
		case when IsRepAgreement=1 then 'Yes' else 'No' end as 'Agreement',
		Isnull(A.NAME,'') AS 'Franchise Name',
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',				
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'CONTACT NUMBER',
			Convert(varchar(12),A.LASTCREATEDDATE,101) as 'Last Updated'
		FROM DBO.TBL_FRANCHISEE A					
		ORDER BY a.IsRepAgreement
	Else
		SELECT 		
		case when IsRepAgreement=1 then 'Yes' else 'No' end as 'Agreement',
		Isnull(A.NAME,'') AS 'Franchise Name',
		Isnull(A.LASTNAME,'') as 'Last Name',Isnull(A.FIRSTNAME,'') as 'First Name',		
			Isnull(A.EMAILADDRESS,'') as Email,
			ISNULL(A.OFFICEPHONE,'') AS 'CONTACT NUMBER',
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



