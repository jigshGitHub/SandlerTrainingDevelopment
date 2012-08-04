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
            dataContext.SaveChanges();
        }
        public virtual void Update(T entity)
        {
            dbset.Attach(entity);
            dataContext.Entry(entity).State = EntityState.Modified;
            dataContext.SaveChanges();
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

    public class FranchiseeUsersRepository : RepositoryBase<TBL_FRANCHISEE_USERS>
    {
        public FranchiseeUsersRepository(IDatabaseFactory dbFactory)
            : base(dbFactory)
        {
        }
        public FranchiseeUsersRepository()
            : base(new DBFactory())
        {
        }

        public TBL_FRANCHISEE GetFranchisee(Guid userId)
        {
            TBL_FRANCHISEE_USERS franchiseeUser = this.GetAll().Where(r => r.UserID == userId).SingleOrDefault();

            FranchiseeRepository franchiseeRepository = new FranchiseeRepository();
            return franchiseeRepository.GetById(franchiseeUser.FranchiseeID);
        }
    }
    public class FranchiseeRepository : RepositoryBase<TBL_FRANCHISEE>
    {
        public FranchiseeRepository(IDatabaseFactory dbFactory)
            : base(dbFactory)
        {
        }
        public FranchiseeRepository()
            : base(new DBFactory())
        {
        }

        public TBL_COACH GetCoach(int franchiseeID)
        {
            TBL_FRANCHISEE franchisee = this.GetById(franchiseeID);

            CoachRepository coachRepository = new CoachRepository();
            return coachRepository.GetById(franchisee.CoachID);
        }
    }

    public class RegionRepository : RepositoryBase<TBL_REGION>
    {
        public RegionRepository(IDatabaseFactory dbFactory)
            : base(dbFactory)
        {
        }
        public RegionRepository()
            : base(new DBFactory())
        {
        }
    }

    public class CoachRepository : RepositoryBase<TBL_COACH>
    {
        public CoachRepository(IDatabaseFactory dbFactory)
            : base(dbFactory)
        {
        }
        public CoachRepository()
            : base(new DBFactory())
        {
        }

        public TBL_REGION GetRegion(int coachId)
        {
            TBL_COACH coach = this.GetById(coachId);

            RegionRepository regionRepository = new RegionRepository();
            return regionRepository.GetById(coach.RegionID);
        }
    }
    public class OpprtunityStatusRepository : RepositoryBase<TBL_OPPORTUNITYSTATUS>
    {
        public OpprtunityStatusRepository(IDatabaseFactory dbFactory)
            : base(dbFactory)
        {
        }
        public OpprtunityStatusRepository()
            : base(new DBFactory())
        {
        }        
    }
    public partial class CompaniesRepository : RepositoryBase<TBL_COMPANIES>
    {
        public CompaniesRepository(IDatabaseFactory dbFactory)
            : base(dbFactory)
        {
        }
        public CompaniesRepository()
            : base(new DBFactory())
        {
        }

        public IEnumerable<SandlerModels.TBL_COMPANIES>  GetByFranchiseeId(int franchiseeId)
        {
            return GetAll().Where(r => r.FranchiseeId == franchiseeId);
        }
    }
    public partial class ContactsRepository : RepositoryBase<TBL_CONTACTS>
    {
        public ContactsRepository(IDatabaseFactory dbFactory)
            : base(dbFactory)
        {
        }
        public ContactsRepository()
            : base(new DBFactory())
        {
        }

        public IEnumerable<SandlerModels.TBL_CONTACTS> GetByCompanyId(int companyId)
        {
            return GetAll().Where(r => r.COMPANYID == companyId);
        }
    }
    public class ProductTypesRepository : RepositoryBase<Tbl_ProductType>
    {
        public ProductTypesRepository(IDatabaseFactory dbFactory)
            : base(dbFactory)
        {
        }
        public ProductTypesRepository()
            : base(new DBFactory())
        {
        }
    }

    public partial class OpportunitiesRepository : RepositoryBase<TBL_OPPORTUNITIES>
    {
        public OpportunitiesRepository(IDatabaseFactory dbFactory)
            : base(dbFactory)
        {
        }
        public OpportunitiesRepository()
            : base(new DBFactory())
        {
        }
    }

    public partial class AppointmentSourceRepository : RepositoryBase<Tbl_AppointmentsSource>
    {
        public AppointmentSourceRepository(IDatabaseFactory dbFactory)
            : base(dbFactory)
        {
        }
        public AppointmentSourceRepository()
            : base(new DBFactory())
        {
        }
    }

    public partial class CourseRepository : RepositoryBase<Tbl_Course>
    {
        public CourseRepository(IDatabaseFactory dbFactory)
            : base(dbFactory)
        {
        }
        public CourseRepository()
            : base(new DBFactory())
        {
        }
    }

    public partial class IndustryTypeRepository : RepositoryBase<Tbl_IndustryType>
    {
        public IndustryTypeRepository(IDatabaseFactory dbFactory)
            : base(dbFactory)
        {
        }
        public IndustryTypeRepository()
            : base(new DBFactory())
        {
        }
    }
}
