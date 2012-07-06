using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;



/// <summary>
/// Summary description for OpportunityDAL
/// </summary>
namespace SandlerRepositories
{
    public class ForcastingRepository
    {
        DBFactory db = new DBFactory();
        public ForcastingRepository()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        
        public DataSet GetById(int ID)
        {
            return db.ExecuteDataset("sp_GetForecastDetails", "ForeCastDetails", new SqlParameter("@CompID", ID)); 
        }

        public void Insert(int companyID, int Q2Total, int Q3Total, int Q4Total, int year, int QuotaTotal, int BestCaseTotal, int SalesPLTotal, int q2quota, int q2Bestcase, int q2Sales, int q3quota, int q3Bestcase, int q3Sales, int q4quota, int q4Bestcase, int q4Sales, string SeasonalityIndex, string GrowthIndex, string TrainedSalesRep, string SalesCycleTime)            
        {
            db.ExecuteNonQuery("sp_CreateForeCast", new SqlParameter("@CompanyID", companyID),
            new SqlParameter("@Q2Total", Q2Total), new SqlParameter("@Q3Total", Q3Total), new SqlParameter("@Q4Total", Q4Total),
            new SqlParameter("@Year", year), new SqlParameter("@QuotaTotal", QuotaTotal), new SqlParameter("@BestCaseTotal", BestCaseTotal), new SqlParameter("@SalesPLTotal", SalesPLTotal),
            new SqlParameter("@Q2Quota", q2quota), new SqlParameter("@Q2BestCase", q2Bestcase), new SqlParameter("@Q2SalesPL", q2Sales),
            new SqlParameter("@Q3Quota", q3quota), new SqlParameter("@Q3BestCase", q3Bestcase), new SqlParameter("@Q3SalesPL", q3Sales),
            new SqlParameter("@Q4Quota", q4quota), new SqlParameter("@Q4BestCase", q4Bestcase), new SqlParameter("@Q4SalesPL", q4Sales),
            new SqlParameter("@SeasonIndex", SeasonalityIndex), new SqlParameter("@GrowthIndex", GrowthIndex),
            new SqlParameter("@Trained_Reps", TrainedSalesRep), new SqlParameter("@SalesCycle", SalesCycleTime));
        }
        
    }
}