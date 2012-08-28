-- Based on users (FranchiseeUserLevel)
SELECT _as.ApptSourceName,c.* 
FROM TBL_CONTACTS c WITH(NOLOCK) 
INNER JOIN Tbl_AppointmentsSource _as WITH(NOLOCK) ON _as.ApptSourceId = c.ApptSourceId
WHERE c.IsNewAppointment = 1
AND YEAR(cmp.CreationDate) = YEAR(GETDATE()) 
AND MONTH(cmp.CreationDate) = MONTH(DATEADD(MONTH,0,GETDATE()))
AND c.CreatedBy = 'B7AC656F-6AA2-4963-A476-CFD4B66A6136'
;

SELECT _as.ApptSourceName,COUNT(ContactsID) --_as.ApptSourceName,c.* 
FROM TBL_CONTACTS c WITH(NOLOCK) 
INNER JOIN Tbl_AppointmentsSource _as WITH(NOLOCK) ON _as.ApptSourceId = c.ApptSourceId
WHERE c.IsNewAppointment = 1 AND YEAR(cmp.CreationDate) = YEAR(GETDATE()) 
AND MONTH(cmp.CreationDate) = MONTH(DATEADD(MONTH,0,GETDATE()))
AND c.CreatedBy = 'B7AC656F-6AA2-4963-A476-CFD4B66A6136'
GROUP BY _as.ApptSourceName;

-- Based on Fr Owner (FranchiseeOwnerLevel)
SELECT _as.ApptSourceName,c.* 
FROM TBL_CONTACTS c WITH(NOLOCK) 
INNER JOIN Tbl_AppointmentsSource _as WITH(NOLOCK) ON _as.ApptSourceId = c.ApptSourceId
INNER JOIN TBL_COMPANIES cmp WITH(NOLOCK) ON cmp.CompaniesID = c.CompanyID
WHERE c.IsNewAppointment = 1
AND c.IsActive = 1
AND YEAR(cmp.CreationDate) = YEAR(GETDATE()) 
AND MONTH(cmp.CreationDate) = MONTH(DATEADD(MONTH,-1,GETDATE()))
AND cmp.FranchiseeId = 6;

SELECT _as.ApptSourceName,COUNT(ContactsID) 
FROM TBL_CONTACTS c WITH(NOLOCK) 
INNER JOIN Tbl_AppointmentsSource _as WITH(NOLOCK) ON _as.ApptSourceId = c.ApptSourceId
INNER JOIN TBL_COMPANIES cmp WITH(NOLOCK) ON cmp.CompaniesID = c.CompanyID
WHERE c.IsNewAppointment = 1
AND YEAR(cmp.CreationDate) = YEAR(GETDATE()) 
AND MONTH(cmp.CreationDate) = MONTH(DATEADD(MONTH,0,GETDATE()))
AND cmp.FranchiseeId = 6
GROUP BY _as.ApptSourceName;

-- Based on Coach
SELECT _as.ApptSourceName,c.* 
FROM TBL_CONTACTS c WITH(NOLOCK) 
INNER JOIN Tbl_AppointmentsSource _as WITH(NOLOCK) ON _as.ApptSourceId = c.ApptSourceId
INNER JOIN TBL_COMPANIES cmp WITH(NOLOCK) ON cmp.CompaniesID = c.CompanyID
INNER JOIN TBL_FRANCHISEE f WITH(NOLOCK) ON f.ID = cmp.FranchiseeId
INNER JOIN TBL_COACH ch WITH(NOLOCK) ON f.CoachID = ch.ID
WHERE c.IsNewAppointment = 1
AND YEAR(cmp.CreationDate) = YEAR(GETDATE()) 
AND MONTH(cmp.CreationDate) = MONTH(DATEADD(MONTH,0,GETDATE()))
AND ch.ID = 2

SELECT _as.ApptSourceName,COUNT(ContactsID) 
FROM TBL_CONTACTS c WITH(NOLOCK) 
INNER JOIN Tbl_AppointmentsSource _as WITH(NOLOCK) ON _as.ApptSourceId = c.ApptSourceId
INNER JOIN TBL_COMPANIES cmp WITH(NOLOCK) ON cmp.CompaniesID = c.CompanyID
INNER JOIN TBL_FRANCHISEE f WITH(NOLOCK) ON f.ID = cmp.FranchiseeId
INNER JOIN TBL_COACH ch WITH(NOLOCK) ON f.CoachID = ch.ID
INNER JOIN TBL_REGION r WITH(NOLOCK) ON r.ID = ch.RegionID
WHERE c.IsNewAppointment = 1
AND YEAR(cmp.CreationDate) = YEAR(GETDATE()) 
AND MONTH(cmp.CreationDate) = MONTH(DATEADD(MONTH,0,GETDATE()))
AND ch.ID = 2
GROUP BY _as.ApptSourceName;