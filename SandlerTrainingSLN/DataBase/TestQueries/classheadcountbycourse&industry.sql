SELECT cs.CourseName,c.* 
FROM TBL_CONTACTS c
INNER JOIN Tbl_Course cs ON cs.CourseId = c.CourseId
INNER JOIN TBL_COMPANIES cmp ON c.COMPANYID = cmp.COMPANIESID
WHERE c.IsRegisteredForTraining = 1 AND c.IsActive = 1 AND cs.IsActive = 1
AND YEAR(c.CourseTrainingDate) = YEAR(GETDATE()) 
AND MONTH(c.CourseTrainingDate) = MONTH(DATEADD(MONTH,-2,GETDATE()))
AND cmp.FranchiseeId = 6;--To check at coach level comment out this line

SELECT COUNT(c.CONTACTSID)
FROM TBL_CONTACTS c
INNER JOIN Tbl_Course cs ON cs.CourseId = c.CourseId
INNER JOIN TBL_COMPANIES cmp ON c.COMPANYID = cmp.COMPANIESID
WHERE c.IsRegisteredForTraining = 1 AND c.IsActive = 1 AND cs.IsActive = 1
AND YEAR(c.CourseTrainingDate) = YEAR(GETDATE()) 
AND MONTH(c.CourseTrainingDate) = MONTH(DATEADD(MONTH,-2,GETDATE()))
AND cmp.FranchiseeId = 6;--To check at coach level comment out this line

SELECT i.IndustryTypeName,c.* 
FROM TBL_CONTACTS c
INNER JOIN TBL_COMPANIES cmp ON c.COMPANYID = cmp.COMPANIESID
INNER JOIN Tbl_IndustryType i ON cmp.IndustryId = i.IndId
WHERE c.IsRegisteredForTraining = 1 AND c.IsActive = 1 AND cmp.IsActive = 1 AND i.IsActive = 1
AND YEAR(c.CourseTrainingDate) = YEAR(GETDATE()) 
AND MONTH(c.CourseTrainingDate) = MONTH(DATEADD(MONTH,-2,GETDATE()))
AND cmp.FranchiseeId = 6; --To check at coach level comment out this line

SELECT COUNT(c.CONTACTSID)
FROM TBL_CONTACTS c
INNER JOIN TBL_COMPANIES cmp ON c.COMPANYID = cmp.COMPANIESID
INNER JOIN Tbl_IndustryType i ON cmp.IndustryId = i.IndId
WHERE c.IsRegisteredForTraining = 1 AND c.IsActive = 1 AND cmp.IsActive = 1 AND i.IsActive = 1
AND YEAR(c.CourseTrainingDate) = YEAR(GETDATE()) 
AND MONTH(c.CourseTrainingDate) = MONTH(DATEADD(MONTH,-2,GETDATE()))
AND cmp.FranchiseeId = 6;--To check at coach level comment out this line


--DRILL Records
SELECT cs.CourseName,c.* 
FROM TBL_CONTACTS c
INNER JOIN Tbl_Course cs ON cs.CourseId = c.CourseId
INNER JOIN TBL_COMPANIES cmp ON c.COMPANYID = cmp.COMPANIESID
WHERE c.IsRegisteredForTraining = 1 AND c.IsActive = 1 AND cs.IsActive = 1
AND YEAR(c.CourseTrainingDate) = YEAR(GETDATE()) 
AND MONTH(c.CourseTrainingDate) = MONTH(DATEADD(MONTH,-1,GETDATE()))
AND cmp.FranchiseeId = 6;--To check at coach level comment out this line

SELECT cs.CourseName,Count(c.COMPANYID)
FROM TBL_CONTACTS c
INNER JOIN Tbl_Course cs ON cs.CourseId = c.CourseId
INNER JOIN TBL_COMPANIES cmp ON c.COMPANYID = cmp.COMPANIESID
WHERE c.IsRegisteredForTraining = 1 AND c.IsActive = 1 AND cs.IsActive = 1
AND YEAR(c.CourseTrainingDate) = YEAR(GETDATE()) 
AND MONTH(c.CourseTrainingDate) = MONTH(DATEADD(MONTH,-1,GETDATE()))
AND cmp.FranchiseeId = 6--To check at coach level comment out this line
Group By cs.CourseName,cs.CourseId;

SELECT i.IndustryTypeName,c.* 
FROM TBL_CONTACTS c
INNER JOIN TBL_COMPANIES cmp ON c.COMPANYID = cmp.COMPANIESID
INNER JOIN Tbl_IndustryType i ON cmp.IndustryId = i.IndId
WHERE c.IsRegisteredForTraining = 1 AND c.IsActive = 1 AND cmp.IsActive = 1 AND i.IsActive = 1
AND YEAR(c.CourseTrainingDate) = YEAR(GETDATE()) 
AND MONTH(c.CourseTrainingDate) = MONTH(DATEADD(MONTH,-1,GETDATE()))
AND cmp.FranchiseeId = 6; --To check at coach level comment out this line

SELECT i.IndustryTypeName,COUNT(c.CONTACTSID)
FROM TBL_CONTACTS c
INNER JOIN TBL_COMPANIES cmp ON c.COMPANYID = cmp.COMPANIESID
INNER JOIN Tbl_IndustryType i ON cmp.IndustryId = i.IndId
WHERE c.IsRegisteredForTraining = 1 AND c.IsActive = 1 AND cmp.IsActive = 1 AND i.IsActive = 1
AND YEAR(c.CourseTrainingDate) = YEAR(GETDATE()) 
AND MONTH(c.CourseTrainingDate) = MONTH(DATEADD(MONTH,-1,GETDATE()))
AND cmp.FranchiseeId = 6 --To check at coach level comment out this line
Group By i.IndustryTypeName,cmp.IndustryId;