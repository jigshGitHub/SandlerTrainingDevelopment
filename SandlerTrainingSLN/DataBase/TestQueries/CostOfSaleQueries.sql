Select vw.ProductID, vw.ProductCost as Cost,vw.Value as Revenue 
FROM [vw_Opportunities] vw
INNER JOIN TBL_Franchisee f WITH(NOLOCK) ON f.ID = vw.FranchiseeID
WHERE vw.FranchiseeID = 8 ANd ProductCost IS NOT NULL;

Select vw.ProductID, SUM(ProductCost) As Cost, SUM(Value) as Revenue, SUM(Value)-SUM(ProductCost) as Profit
FROM [vw_Opportunities] vw
INNER JOIN TBL_Franchisee f WITH(NOLOCK) ON f.ID = vw.FranchiseeID
WHERE vw.FranchiseeID = 8
Group By VW.ProductID;