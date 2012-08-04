SELECT i.IndustryTypeName,cmp.CreationDate,DATEDIFF(MONTH,cmp.CreationDate,GETDATE()) as Months
FROM TBL_COMPANIES cmp INNER JOIN Tbl_IndustryType i ON cmp.IndustryId = i.IndId
WHERE cmp.FranchiseeId = 12; --To check at coach level comment out this line



SELECT i.IndustryTypeName,AVG(DATEDIFF(MONTH,cmp.CreationDate,GETDATE())) as Months
FROM TBL_COMPANIES cmp INNER JOIN Tbl_IndustryType i ON cmp.IndustryId = i.IndId
WHERE cmp.FranchiseeId = 12
Group By i.IndustryTypeName; --To check at coach level comment out this line

