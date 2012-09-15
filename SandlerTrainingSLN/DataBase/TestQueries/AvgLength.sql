SELECT i.IndustryTypeName,cmp.CreationDate,DATEDIFF(MONTH,cmp.CreationDate,GETDATE()) as Months
FROM TBL_COMPANIES cmp INNER JOIN Tbl_IndustryType i ON cmp.IndustryId = i.IndId
WHERE cmp.FranchiseeId = 18 --To check at coach level comment out this line
Order by i.IndustryTypeName


SELECT i.IndustryTypeName,AVG(DATEDIFF(MONTH,cmp.CreationDate,GETDATE()))
FROM TBL_COMPANIES cmp INNER JOIN Tbl_IndustryType i ON cmp.IndustryId = i.IndId
WHERE cmp.FranchiseeId = 18
Group By i.IndustryTypeName; --To check at coach level comment out this line

