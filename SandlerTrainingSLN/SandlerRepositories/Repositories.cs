using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Data.Entity;
using System.Linq.Expressions;

using SandlerModels;
//Testing
namespace SandlerRepositories
{
    public interface IGapAnalysis
    {
        DataSet GetAll();
        SqlDataReader GetByRepId(string repId);
        void Update(string repId, string SCTAsIsText, string SEAsIsText, string SQAsIsText, string TCSAsIsText, string QAAsIsText, string EBGAsISText, string SCTAsIsValue, string SEAsIsValue, string SQAsIsValue, string TCSAsIsValue, string QAAsIsValue, string EBGAsISValue, string SCTToBeText, string SEToBeText, string SQToBeText, string TCSToBeText, string QAToBeText, string EBGToBeText, string SCTToBeValue, string SEToBeValue, string SQToBeValue, string TCSToBeValue, string QAToBeValue, string EBGToBeValue);
    }

    public class GapAnalysis : IGapAnalysis
    {
        public GapAnalysis()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        public DataSet GetAll()
        {
            SqlConnection sqlConnection = null;
            SqlDataAdapter sqlDataAdapter;
            string commandText;
            DataSet ds = null;
            try
            {
                sqlConnection = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["SandlerDBConnection"].ToString());
                commandText = "SELECT SalesCycleTime, PercentofIndustryAve FROM [(Gap_Analysis_Sales_Cycle_Time)] ORDER BY SalesCycleTime;" +
                                "SELECT [SalesEfficiency],[PercentofIndustryAve] FROM [(Gap_Analysis_Sales_Efficiency)] ORDER BY SalesEfficiency;" +
                                "SELECT SalesQualification, PercentofIndustryAve FROM  [(Gap_Analysis_Sales_Qualification)] ORDER BY SalesQualification;" +
                                "SELECT [TrngCostSavings],[PercentofIndustryAve] FROM [(Gap_Analysis_Training_Cost_Savings)] ORDER BY TrngCostSavings;" +
                                "SELECT [QuotaAchievement],[PercentofIndustryAve] FROM [(Gap_Analysis_Quota_Achievement)] ORDER BY QuotaAchievement;" +
                                "SELECT [EstBenefitsGained],[PercentofIndustryAve] FROM [(Gap_Analysis_Est_Benefits_Gained)] ORDER BY EstBenefitsGained;";
                sqlDataAdapter = new SqlDataAdapter(commandText, sqlConnection);

                ds = new DataSet();

                sqlDataAdapter.Fill(ds);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                if (sqlConnection.State == ConnectionState.Open)
                    sqlConnection.Close();
            }
            return ds;
        }

        public SqlDataReader GetByRepId(string repId)
        {
            SqlConnection sqlConnection = null;
            SqlCommand sqlCommand;
            SqlDataReader reader;
            try
            {
                sqlConnection = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["SandlerDBConnection"].ToString());
                sqlCommand = new SqlCommand("SELECT [ID] ,[ProductID] ,[FranchiseeID] ,[ClientID] ,[RepID] ,[AsIs_SalesCycleTimeofIndustryAve] ,[AsIs_SalesEfficiencyofIndustryAve] ,[AsIs_SalesQualificationofIndustryAve] ,[AsIs_TrngCostSavingsofIndustryAve] ,[AsIs_QuotaAchievementofIndustryAve] ,[AsIs_EstBenefitsGainedofIndustryAve] ,[ToBe_SalesCycleTimeofIndustryAve] ,[ToBe_SalesEfficiencyofIndustryAve] ,[ToBe_SalesQualificationofIndustryAve] ,[ToBe_TrngCostSavingsofIndustryAve] ,[ToBe_QuotaAchievementofIndustryAve] ,[ToBe_EstBenefitsGainedofIndustryAve]   FROM [Gap_Analysis]   WHERE [RepID] = '" + repId + "';", sqlConnection);

                sqlConnection.Open();
                reader = sqlCommand.ExecuteReader();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {

            }
            return reader;
        }

        public void Update(string repId, string SCTAsIsText, string SEAsIsText, string SQAsIsText, string TCSAsIsText, string QAAsIsText, string EBGAsISText, string SCTAsIsValue, string SEAsIsValue, string SQAsIsValue, string TCSAsIsValue, string QAAsIsValue, string EBGAsISValue, string SCTToBeText, string SEToBeText, string SQToBeText, string TCSToBeText, string QAToBeText, string EBGToBeText, string SCTToBeValue, string SEToBeValue, string SQToBeValue, string TCSToBeValue, string QAToBeValue, string EBGToBeValue)
        {
            SqlConnection sqlConnection = null;
            SqlCommand sqlCommand;
            try
            {
                sqlConnection = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["SandlerDBConnection"].ToString());
                sqlCommand = new SqlCommand("UPDATE [Gap_Analysis] " +
                                            "SET" +
                                              " [AsIs_SalesCycleTime] = '" + SCTAsIsText + "'" +
                                              ", [AsIs_SalesEfficiency] = '" + SEAsIsText + "'" +
                                              ", [AsIs_SalesQualification] = '" + SQAsIsText + "'" +
                                              ", [AsIs_TrngCostSavings] = '" + TCSAsIsText + "'" +
                                              ", [AsIs_QuotaAchievement] = '" + QAAsIsText + "'" +
                                              ", [AsIs_EstBenefitsGained] = '" + EBGAsISText + "'" +
                                              ", [AsIs_SalesCycleTimeofIndustryAve] = " + SCTAsIsValue +
                                              ", [AsIs_SalesEfficiencyofIndustryAve] = " + SEAsIsValue +
                                              ", [AsIs_SalesQualificationofIndustryAve] = " + SQAsIsValue +
                                              ", [AsIs_TrngCostSavingsofIndustryAve] = " + TCSAsIsValue +
                                              ", [AsIs_QuotaAchievementofIndustryAve] = " + QAAsIsValue +
                                              ", [AsIs_EstBenefitsGainedofIndustryAve] = " + EBGAsISValue +
                                              ", [ToBe_SalesCycleTime] = '" + SCTToBeText + "'" +
                                              ", [ToBe_SalesEfficiency] = '" + SEToBeText + "'" +
                                              ", [ToBe_SalesQualification] = '" + SQToBeText + "'" +
                                              ", [ToBe_TrngCostSavings] = '" + TCSToBeText + "'" +
                                              ", [ToBe_QuotaAchievement] = '" + QAToBeText + "'" +
                                              ", [ToBe_EstBenefitsGained] = '" + EBGToBeText + "'" +
                                              ", [ToBe_SalesCycleTimeofIndustryAve] = " + SCTToBeValue +
                                              ", [ToBe_SalesEfficiencyofIndustryAve] = " + SEToBeValue +
                                              ", [ToBe_SalesQualificationofIndustryAve] = " + SQToBeValue +
                                              ", [ToBe_TrngCostSavingsofIndustryAve] = " + TCSToBeValue +
                                              ", [ToBe_QuotaAchievementofIndustryAve] = " + QAToBeValue +
                                              ", [ToBe_EstBenefitsGainedofIndustryAve] = " + EBGToBeValue +
                                              " WHERE [RepID] = '" + repId + "'", sqlConnection);

                sqlConnection.Open();
                sqlCommand.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {

            }
        }

    }

    public interface IROI
    {
        DataSet GetByRepId(int repId);
        void Update(int repId, DataTable tblROI);
    }

    public abstract class RepositoryBase<T> where T : class
    {
        private DbContext dataContext;
        private readonly IDbSet<T> dbset;
        protected RepositoryBase(IDatabaseFactory databaseFactory)
        {
            DatabaseFactory = databaseFactory;
            dbset = DataContext.Set<T>();
        }

        protected IDatabaseFactory DatabaseFactory
        {
            get;
            private set;
        }

        protected DbContext DataContext
        {
            get { return dataContext ?? (dataContext = DatabaseFactory.Get()); }
        }
        public virtual void Add(T entity)
        {
            dbset.Add(entity);
        }
        public virtual void Update(T entity)
        {
            dbset.Attach(entity);
            dataContext.Entry(entity).State = EntityState.Modified;
        }
        public virtual void Delete(T entity)
        {
            dbset.Remove(entity);
        }
        public virtual void Delete(Expression<Func<T, bool>> where)
        {
            IEnumerable<T> objects = dbset.Where<T>(where).AsEnumerable();
            foreach (T obj in objects)
                dbset.Remove(obj);
        }
        public virtual T GetById(long id)
        {
            return dbset.Find(id);
        }
        public virtual T GetById(string id)
        {
            return dbset.Find(id);
        }
        public virtual T GetById(int id)
        {
            return dbset.Find(id);
        }
        public virtual IEnumerable<T> GetAll()
        {
            return dbset.ToList();
        }
        public virtual IEnumerable<T> GetMany(Expression<Func<T, bool>> where)
        {
            return dbset.Where(where).ToList();
        }
        public T Get(Expression<Func<T, bool>> where)
        {
            return dbset.Where(where).FirstOrDefault<T>();
        }
    }

    public class COSTimeRepository : RepositoryBase<TBL_COSTOFSALE_MAIN>
    {
        public COSTimeRepository(IDatabaseFactory dbFactory)
            : base(dbFactory)
        {
        }
        public COSTimeRepository()
            : base(new DBFactory())
        {
        }
    }
    public class COSTimeRepositoryDrill : RepositoryBase<TBL_COSTOFSALE_DRILL>
    {
        public COSTimeRepositoryDrill(IDatabaseFactory dbFactory)
            : base(dbFactory)
        {
        }
        public COSTimeRepositoryDrill()
            : base(new DBFactory())
        {
        }
    }

    public class IndustryAveRepository : RepositoryBase<TBL_IND_AVERAGES>
    {
        public IndustryAveRepository(IDatabaseFactory dbFactory)
            : base(dbFactory)
        {
        }
        public IndustryAveRepository()
            : base(new DBFactory())
        {
        }
    }

    public class PipeLinePostTrainingRepository : RepositoryBase<TBL_PIPELINE_POST>
    {
        public PipeLinePostTrainingRepository(IDatabaseFactory dbFactory)
            : base(dbFactory)
        {
        }
        public PipeLinePostTrainingRepository()
            : base(new DBFactory())
        {
        }
    }

    public class ProductMarginContributionRepository : RepositoryBase<TBL_PRODUCT_MARGIN>
    {
        public ProductMarginContributionRepository(IDatabaseFactory dbFactory)
            : base(dbFactory)
        {
        }
        public ProductMarginContributionRepository()
            : base(new DBFactory())
        {
        }
    }

    public class ProductSalesActivityRepository : RepositoryBase<TBL_PRDSALES_BYACT>
    {
        public ProductSalesActivityRepository(IDatabaseFactory dbFactory)
            : base(dbFactory)
        {
        }
        public ProductSalesActivityRepository()
            : base(new DBFactory())
        {
        }
    }
    public class RevenueBySourceRepository : RepositoryBase<TBL_REVBYSOURCE>
    {
        public RevenueBySourceRepository(IDatabaseFactory dbFactory)
            : base(dbFactory)
        {
        }
        public RevenueBySourceRepository()
            : base(new DBFactory())
        {
        }
    }

    public class ProdSoldByRepRepository : RepositoryBase<TBL_PRODSOLD_BYREP>
    {
        public ProdSoldByRepRepository(IDatabaseFactory dbFactory)
            : base(dbFactory)
        {
        }
        public ProdSoldByRepRepository()
            : base(new DBFactory())
        {
        }
    }

    public class ProdSoldAsSaleRepository : RepositoryBase<TBL_PRODSOLD_AS_SALE>
    {
        public ProdSoldAsSaleRepository(IDatabaseFactory dbFactory)
            : base(dbFactory)
        {
        }
        public ProdSoldAsSaleRepository()
            : base(new DBFactory())
        {
        }
    }

    public class ProdSoldByCompRepository : RepositoryBase<TBL_PRODSOLD_BYCOMP>
    {
        public ProdSoldByCompRepository(IDatabaseFactory dbFactory)
            : base(dbFactory)
        {
        }
        public ProdSoldByCompRepository()
            : base(new DBFactory())
        {
        }
    }



    public class ProspectingRepository : RepositoryBase<TBL_PROSPECTING>
    {
        public ProspectingRepository(IDatabaseFactory dbFactory)
            : base(dbFactory)
        {
        }
        public ProspectingRepository()
            : base(new DBFactory())
        {
        }
    }

    public class RetentionRateRepository : RepositoryBase<TBL_RETENTION_RATE>
    {
        public RetentionRateRepository(IDatabaseFactory dbFactory)
            : base(dbFactory)
        {
        }
        public RetentionRateRepository()
            : base(new DBFactory())
        {
        }
    }


    public class SalesTotalsByMonthRepository : RepositoryBase<TBL_SALESTOTALBYMONTH>
    {
        public SalesTotalsByMonthRepository(IDatabaseFactory dbFactory)
            : base(dbFactory)
        {
        }
        public SalesTotalsByMonthRepository()
            : base(new DBFactory())
        {
        }
    }
    public class ROIRepository : RepositoryBase<Return_on_Trng_Investment>, IROI
    {
        public ROIRepository(IDatabaseFactory dbFactory)
            : base(dbFactory)
        {
        }
        public ROIRepository()
            : base(new DBFactory())
        {
        }

        public DataSet GetByRepId(int repId)
        {
            DataSet ds;
            string strQry;
            try
            {
                strQry = "SELECT * FROM Return_on_Trng_Investment WHERE RepID = " + repId + " Order By PeriodYear, IsOriginalVersion ASC";
                ds = ((DBFactory)base.DatabaseFactory).ExecuteDataset(strQry);

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return ds;
        }

        public void Update(int repId, DataTable tblROI)
        {
            List<SqlParameter> cmdParams;
            try
            {
                foreach (DataRow dr in tblROI.Rows)
                {
                    cmdParams = new List<SqlParameter>();

                    cmdParams.Add(new SqlParameter() { Value = dr["ID"], ParameterName = "@ID", Direction = ParameterDirection.Input });
                    cmdParams.Add(new SqlParameter() { Value = dr["ProductID"], ParameterName = "@ProductID", Direction = ParameterDirection.Input });//.ProductID : null;
                    cmdParams.Add(new SqlParameter() { Value = dr["FranchiseeID"], ParameterName = "@FranchiseeID", Direction = ParameterDirection.Input });//.FranchiseeID : null;
                    cmdParams.Add(new SqlParameter() { Value = dr["ClientID"], ParameterName = "@ClientID", Direction = ParameterDirection.Input });//.ClientID : null;
                    cmdParams.Add(new SqlParameter() { Value = dr["RepID"], ParameterName = "@RepID", Direction = ParameterDirection.Input });//.RepID : null;
                    cmdParams.Add(new SqlParameter() { Value = dr["PeriodYear"], ParameterName = "@PeriodYear", Direction = ParameterDirection.Input });//.PeriodYear : null;
                    cmdParams.Add(new SqlParameter() { Value = dr["YearDesignation"], ParameterName = "@YearDesignation", Direction = ParameterDirection.Input });//.YearDesignation : null;
                    cmdParams.Add(new SqlParameter() { Value = dr["InitialTrngInvestment"], ParameterName = "@InitialTrngInvestment", Direction = ParameterDirection.Input });//.InitialTrngInvestment : null;
                    cmdParams.Add(new SqlParameter() { Value = dr["ImplementationCost"], ParameterName = "@ImplementationCost", Direction = ParameterDirection.Input });//.ImplementationCost : null;
                    cmdParams.Add(new SqlParameter() { Value = dr["TrainingInvestment"], ParameterName = "@TrainingInvestment", Direction = ParameterDirection.Input });//.TrainingInvestment : null;
                    cmdParams.Add(new SqlParameter() { Value = dr["CostReductionSalesCycleTime"], ParameterName = "@CostReductionSalesCycleTime", Direction = ParameterDirection.Input });//.CostReductionSalesCycleTime : null;
                    cmdParams.Add(new SqlParameter() { Value = dr["CostReductionSalesEfficiency"], ParameterName = "@CostReductionSalesEfficiency", Direction = ParameterDirection.Input });//.CostReductionSalesEfficiency : null;
                    cmdParams.Add(new SqlParameter() { Value = dr["IncreasedQualifiedSales"], ParameterName = "@IncreasedQualifiedSales", Direction = ParameterDirection.Input });//.IncreasedQualifiedSales : null;
                    cmdParams.Add(new SqlParameter() { Value = dr["SavingsonRetainedSalesReps"], ParameterName = "@SavingsonRetainedSalesReps", Direction = ParameterDirection.Input });//.SavingsonRetainedSalesReps : null;
                    cmdParams.Add(new SqlParameter() { Value = dr["IncreasedQuotaAchievement"], ParameterName = "@IncreasedQuotaAchievement", Direction = ParameterDirection.Input });//.IncreasedQuotaAchievement : null;
                    cmdParams.Add(new SqlParameter() { Value = dr["TotalAnnualBenefits"], ParameterName = "@TotalAnnualBenefits", Direction = ParameterDirection.Input });//.TotalAnnualBenefits : null;
                    cmdParams.Add(new SqlParameter() { Value = dr["EstimatedBenefitsGained"], ParameterName = "@EstimatedBenefitsGained", Direction = ParameterDirection.Input });//.EstimatedBenefitsGained : null;
                    cmdParams.Add(new SqlParameter() { Value = dr["TotalBenefitsRealized"], ParameterName = "@TotalBenefitsRealized", Direction = ParameterDirection.Input });//.TotalBenefitsRealized : null;
                    cmdParams.Add(new SqlParameter() { Value = dr["TotalCost"], ParameterName = "@TotalCost", Direction = ParameterDirection.Input });//.TotalCost : null;
                    cmdParams.Add(new SqlParameter() { Value = dr["AnnualBenefitFlow"], ParameterName = "@AnnualBenefitFlow", Direction = ParameterDirection.Input });//.AnnualBenefitFlow : null;
                    cmdParams.Add(new SqlParameter() { Value = dr["CumBenefitFlow"], ParameterName = "@CumBenefitFlow", Direction = ParameterDirection.Input });//.CumBenefitFlow : null;
                    cmdParams.Add(new SqlParameter() { Value = dr["DiscountedCosts"], ParameterName = "@DiscountedCosts", Direction = ParameterDirection.Input });//.DiscountedCosts : null;
                    cmdParams.Add(new SqlParameter() { Value = dr["DiscountedBenefits"], ParameterName = "@DiscountedBenefits", Direction = ParameterDirection.Input });//.DiscountedBenefits : null;
                    cmdParams.Add(new SqlParameter() { Value = dr["TotalDiscountBenefitFlow"], ParameterName = "@TotalDiscountBenefitFlow", Direction = ParameterDirection.Input });//.TotalDiscountBenefitFlow : null;
                    cmdParams.Add(new SqlParameter() { Value = dr["TotalCumDiscountedBenefitFlow"], ParameterName = "@TotalCumDiscountedBenefitFlow", Direction = ParameterDirection.Input });//.TotalCumDiscountedBenefitFlow : null;
                    cmdParams.Add(new SqlParameter() { Value = dr["CostofCapital"], ParameterName = "@CostofCapital", Direction = ParameterDirection.Input });//.CostofCapital : null;
                    cmdParams.Add(new SqlParameter() { Value = dr["OngoingSupportCosts"], ParameterName = "@OngoingSupportCosts", Direction = ParameterDirection.Input });//.OngoingSupportCosts : null;
                    cmdParams.Add(new SqlParameter() { Value = dr["NetPresentValue"], ParameterName = "@NetPresentValue", Direction = ParameterDirection.Input });//.NetPresentValue : null;
                    cmdParams.Add(new SqlParameter() { Value = dr["Yr1ROI"], ParameterName = "@Yr1ROI", Direction = ParameterDirection.Input });//.Yr1ROI : null;
                    cmdParams.Add(new SqlParameter() { Value = dr["Yr2ROI"], ParameterName = "@Yr2ROI", Direction = ParameterDirection.Input });//.Yr2ROI : null;
                    cmdParams.Add(new SqlParameter() { Value = dr["Yr3ROI"], ParameterName = "@Yr3ROI", Direction = ParameterDirection.Input });//.Yr3ROI : null;
                    cmdParams.Add(new SqlParameter() { Value = dr["Payback"], ParameterName = "@Payback", Direction = ParameterDirection.Input });

                    ((DBFactory)base.DatabaseFactory).ExecuteNonQuery("sp_Insert_UpdateROI", cmdParams);
                }



            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }

    public class ProdcutsSalesRepository : RepositoryBase<TBL_SALES>
    {
        public ProdcutsSalesRepository(IDatabaseFactory dbFactory)
            : base(dbFactory)
        {
        }
        public ProdcutsSalesRepository()
            : base(new DBFactory())
        {
        }
    }
    public class SalesCycleTimeRepository : RepositoryBase<TBL_SALESCYCLETIME_MAIN>
    {
        public SalesCycleTimeRepository(IDatabaseFactory dbFactory)
            : base(dbFactory)
        {
        }
        public SalesCycleTimeRepository()
            : base(new DBFactory())
        {
        }
    }

    public class SalesCycleTimeDrillRepository : RepositoryBase<TBL_SALESCYCLETIME_DRILL>
    {
        public SalesCycleTimeDrillRepository(IDatabaseFactory dbFactory)
            : base(dbFactory)
        {
        }
        public SalesCycleTimeDrillRepository()
            : base(new DBFactory())
        {
        }
    }

    public class ChartRepository : RepositoryBase<TBL_CHART>
    {
        public ChartRepository(IDatabaseFactory dbFactory)
            : base(dbFactory)
        {
        }
        public ChartRepository()
            : base(new DBFactory())
        {
        }
    }
}
