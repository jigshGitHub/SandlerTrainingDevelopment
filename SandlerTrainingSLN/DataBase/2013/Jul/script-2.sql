
GO

/****** Object:  View [dbo].[vw_Opportunities]    Script Date: 07/15/2013 15:08:15 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_Opportunities]'))
DROP VIEW [dbo].[vw_Opportunities]
GO


GO

/****** Object:  View [dbo].[vw_Opportunities]    Script Date: 07/15/2013 15:08:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



Create VIEW [dbo].[vw_Opportunities]

AS

SELECT r.ID AS RegionID, 
r.Name AS Region, 
ch.ID AS CoachID, 
ch.FirstName + ' ' + ch.LastName AS CoachName, 
f.ID AS FranchiseeId, 
f.Name AS FranchiseeName, 
cnt.FirstName + ' ' + cnt.LastName AS ContactName,
cnt.IsNewAppointment,
cnt.IsRegisteredForTraining,
cnt.ApptSourceId,
cnt.CourseTrainingDate,
cnt.FirstName AS PrimaryContactFirstName,
cnt.LastName AS PrimaryContactLastName,
cnt.Email AS PrimaryContactEmail,
seconadryCnt1.FirstName AS SeconadryContact1FirstName,
seconadryCnt1.LastName AS SeconadryContact1LastName,
seconadryCnt1.Email AS SeconadryContact1Email,
seconadryCnt2.FirstName AS SeconadryContact2FirstName,
seconadryCnt2.LastName AS SeconadryContact2LastName,
seconadryCnt2.Email AS SeconadryContact2Email,
cmp.COMPANYNAME, 
cmp.IsNewCompany, 
cmp.CreationDate, cmp.IndustryId,  
wl.Name AS WhyLost,
ot.Name AS [Type],
st.Name AS [Status],
p.ProductTypeName,
src.Name AS [Source],
o.ID,
o.COMPANYID,
o.CONTACTID,
o.NAME,
o.ProductID,
o.SALESREPLASTNAME,
o.SALESREPFIRSTNAME,
o.SALESREPPHONE,
o.STATUSID,
o.VALUE,
o.WINPROBABILITY,
o.WEIGHTEDVALUE,
o.CLOSEDATE,
o.IsActive,
o.UpdatedDate,
o.UpdatedBy,
o.CreatedDate,
o.CreatedBy,
o.OpportunityID,
o.SourceID,
o.TypeID,
o.WhyLostID,
o.Description,
o.Notes,
o.ActualValue,
o.SeconadryContactId1,
o.SeconadryContactId2,
o.ProductCost,
o.CreationDate AS OppCreationDate,
o.Pain,
o.LengthofProblem,
o.CostToFix,
o.Alternatives,
o.IsBudgeIdentified,
o.IsMoveForward
FROM dbo.[TBL_OPPORTUNITIES] o WITH (NOLOCK)
INNER JOIN dbo.[TBL_COMPANIES] cmp WITH (NOLOCK) ON cmp.COMPANIESID = o.COMPANYID-- AND cmp.IsActive = 1
INNER JOIN dbo.[TBL_CONTACTS] cnt WITH (NOLOCK) ON cnt.CONTACTSID = o.CONTACTID-- AND cnt.IsActive = 1
INNER JOIN dbo.[TBL_Franchisee] f WITH (NOLOCK) ON cmp.FranchiseeID = f.ID AND f.IsActive = 1
INNER JOIN dbo.[TBL_COACH] ch WITH (NOLOCK) ON f.CoachID = ch.ID AND ch.IsActive = 1
INNER JOIN dbo.[TBL_Region] r WITH (NOLOCK) ON ch.RegionID = r.ID AND r.IsActive = 1
LEFT JOIN dbo.[TBL_Contacts] seconadryCnt1 WITH (NOLOCK) ON seconadryCnt1.CONTACTSID = o.SeconadryContactId1
LEFT JOIN dbo.[TBL_Contacts] seconadryCnt2 WITH (NOLOCK) ON seconadryCnt2.CONTACTSID = o.SeconadryContactId2
LEFT JOIN dbo.[TBL_OpportunityWhyLost] wl WITH (NOLOCK) ON wl.ID = o.WhyLostID
LEFT JOIN dbo.[TBL_OpportunityTypes] ot WITH (NOLOCK) ON ot.ID = o.TypeID
LEFT JOIN dbo.[TBL_OPPORTUNITYSTATUS] st WITH (NOLOCK) ON st.ID = o.StatusID
LEFT JOIN dbo.[TBL_OpportunitySource] src WITH (NOLOCK) ON src.ID = o.SourceID
LEFT JOIN dbo.[Tbl_ProductType] p WITH (NOLOCK) ON.p.ID = o.ProductID




GO


