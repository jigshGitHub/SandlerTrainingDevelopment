SELECT SUM(o.WEIGHTEDVALUE)
FROM TBL_OPPORTUNITIES o WITH(NOLOCK) 
INNER JOIN TBL_COMPANIES cmp WITH(NOLOCK) ON cmp.CompaniesID = o.CompanyID
INNER JOIN TBL_FRANCHISEE f WITH(NOLOCK) ON f.ID = cmp.FranchiseeId
WHERE YEAR(o.CLOSEDATE) = YEAR(GETDATE()) 
AND MONTH(o.CLOSEDATE) = MONTH(DATEADD(MONTH,1,GETDATE()))
AND cmp.FranchiseeId = 6;

SELECT SUM(o.WEIGHTEDVALUE), SUM(o.VALUE)
FROM TBL_OPPORTUNITIES o WITH(NOLOCK) 
INNER JOIN TBL_COMPANIES cmp WITH(NOLOCK) ON cmp.CompaniesID = o.CompanyID
INNER JOIN TBL_FRANCHISEE f WITH(NOLOCK) ON f.ID = cmp.FranchiseeId
WHERE YEAR(o.CLOSEDATE) = YEAR(GETDATE()) 
AND MONTH(o.CLOSEDATE) = MONTH(DATEADD(MONTH,1,GETDATE()))
AND cmp.FranchiseeId = 6	;
