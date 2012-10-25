select id,CreationDate, CLOSEDATE, DATEDIFF(month,creationdate,CLOSEDATE)as difmonths, DATEDIFF(month,creationdate,CLOSEDATE)/6 as mpsix,
case DATEDIFF(month,creationdate,CLOSEDATE)/6 
when 0 then '0 - 6 Months'
when 1 then '6 - 12 Months'
when 2 then '12 - 18 Months'
when 3 then '18 - 24 Months'
else '24+ Months'
end 
from TBL_OPPORTUNITIES where CLOSEDATE < GETDATE() AND creationdate IS NOT NULL AND CloseDate IS NOT NULL order by difmonths;

select COUNT(id), DATEDIFF(month,creationdate,CLOSEDATE)/6 as mpsix,case DATEDIFF(month,creationdate,CLOSEDATE)/6 
when 0 then '0 - 6 Months'
when 1 then '6 - 12 Months'
when 2 then '12 - 18 Months'
when 3 then '18 - 24 Months'
else '24+ Months'
end 
from TBL_OPPORTUNITIES where CLOSEDATE < GETDATE() AND creationdate IS NOT NULL AND CloseDate IS NOT NULL
group by DATEDIFF(month,creationdate,CLOSEDATE)/6;

exec sp_GetSalesCyclePortfolioData '7f31e699-0ec2-46b7-b1ef-c66e1178f726'