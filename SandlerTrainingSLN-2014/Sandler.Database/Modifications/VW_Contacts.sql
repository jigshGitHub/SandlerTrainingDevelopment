--USE [SandlerDB]
GO

/****** Object:  View [dbo].[vw_Contacts]    Script Date: 01/28/2014 15:29:36 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_Contacts]'))
DROP VIEW [dbo].[vw_Contacts]
GO

--USE [SandlerDB]
GO

/****** Object:  View [dbo].[vw_Contacts]    Script Date: 01/28/2014 15:29:36 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [dbo].[vw_Contacts]

AS

SELECT r.ID AS RegionID, 
r.Name AS Region, 
ch.ID AS CoachID, 
ch.FirstName + ' ' + ch.LastName AS CoachName, 
f.ID AS FranchiseeId, 
f.Name AS FranchiseeName, 
cmp.COMPANYNAME, 
cmp.IsNewCompany, 
cmp.CreationDate, cmp.IndustryId,
cnt.lastname + ',' + cnt.FirstName as FullName,
apts.ApptSourceName, 
cs.CourseName, 
ysn.Description as NewApptDespDesc,
ysr.Description as IsRegisteredForTrainingDesc,
ysre.Description as IsEmailSubscriptionDesc,
ysrc.Description as NeedCallBackDesc,
cnt.* 
FROM dbo.[TBL_CONTACTS] cnt WITH (NOLOCK)
INNER JOIN dbo.[TBL_COMPANIES] cmp WITH (NOLOCK) ON cmp.COMPANIESID = cnt.COMPANYID AND cmp.IsActive = 1
INNER JOIN dbo.[TBL_Franchisee] f WITH (NOLOCK) ON cmp.FranchiseeID = f.ID AND f.IsActive = 1
INNER JOIN dbo.[TBL_COACH] ch WITH (NOLOCK) ON f.CoachID = ch.ID AND ch.IsActive = 1
INNER JOIN dbo.[TBL_Region] r WITH (NOLOCK) ON ch.RegionID = r.ID AND r.IsActive = 1
left join tbl_companies cp on cnt.companyid = cp.COMPANIESID 
left join Tbl_AppointmentsSource apts on apts.ApptSourceId = cnt.ApptSourceId
left join Tbl_Course cs on cs.CourseId = cnt.CourseId
left join Tbl_YesNoOptions ysn on ysn.Value = cnt.IsNewAppointment 
left join Tbl_YesNoOptions ysr on ysr.Value = cnt.IsRegisteredForTraining
left join Tbl_YesNoOptions ysre on ysre.Value = cnt.IsEmailSubscription 
left join Tbl_YesNoOptions ysrc on ysrc.Value = cnt.IsNeedCallBack
WHERE cnt.IsActive = 1




GO


