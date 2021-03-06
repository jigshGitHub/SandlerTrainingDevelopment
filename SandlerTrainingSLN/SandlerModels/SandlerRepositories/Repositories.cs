﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Data.Entity;
using System.Linq.Expressions;
using System.Data.Linq;
using SandlerModels;
//Testing
namespace SandlerRepositories
{

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
        public void Add(T entity)
        {
            dbset.Add(entity);
            dataContext.SaveChanges();
        }
        public void Update(T entity)
        {
            dbset.Attach(entity);
            dataContext.Entry(entity).State = EntityState.Modified;
            dataContext.SaveChanges();
        }
        public void Delete(T entity)
        {
            dbset.Remove(entity);
            dataContext.SaveChanges();
        }
        public void Delete(Expression<Func<T, bool>> where)
        {
            IEnumerable<T> objects = dbset.Where<T>(where).AsEnumerable();
            foreach (T obj in objects)
                dbset.Remove(obj);
        }
        public T GetById(long id)
        {
            return dbset.Find(id);
        }
        public T GetById(string id)
        {
            return dbset.Find(id);
        }
        public T GetById(int id)
        {
            return dbset.Find(id);
        }
        public virtual IEnumerable<T> GetAll()
        {
            return dbset.ToList();
        }
        public IEnumerable<T> GetMany(Expression<Func<T, bool>> where)
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

        public override IEnumerable<TBL_OPPORTUNITYSTATUS> GetAll()
        {
            return base.GetAll().OrderBy(status => status.SortOrder);
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

        public IEnumerable<SandlerModels.TBL_COMPANIES> GetByFranchiseeId(int franchiseeId)
        {
            return GetAll().Where(r => r.FranchiseeId == franchiseeId && r.IsActive == true);
        }

        public bool Exists(TBL_COMPANIES company)
        {
            return (GetAll().Where(r => r.FranchiseeId == company.FranchiseeId && r.IsActive == true && r.COMPANYNAME == company.COMPANYNAME && r.CITY == company.CITY && r.STATE == company.STATE && r.Address == company.Address).Count() > 0) ? true : false;
        }
        public IEnumerable<Company> GetCompaniesByUser(Guid userID)
        {
            return (this.DatabaseFactory.Get() as SandlerDBEntities).GetCompaniesByUser(userID);
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

        public IEnumerable<TBL_CONTACTS> GetByCompanyId(int companyId)
        {
            return GetAll().Where(r => r.COMPANYID == companyId);
        }

        public IEnumerable<Contact> GetContactsByUser(Guid userID)
        {
            return (this.DatabaseFactory.Get() as SandlerDBEntities).GetContactsByUser(userID);
        }

        public void DeleteContactsOfUser(int franchiseeId, Guid userId)
        {
            (this.DatabaseFactory.Get() as SandlerDBEntities).DeleteContactsOfUser(franchiseeId, userId);
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

        public IEnumerable<Tbl_ProductType> GetWithFranchiseeId(int franchiseeId)
        {
            return base.GetAll().Where(r => (r.FranchiseeId == 0 || r.FranchiseeId == franchiseeId) && r.IsActive == true);
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

        public IEnumerable<Opportunity> GetOpportunitiesByUser(Guid userID)
        {
            return (this.DatabaseFactory.Get() as SandlerDBEntities).GetOpportunitiesByUser(userID);
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

    public partial class CountryRepository : RepositoryBase<TBL_COUNTRY>
    {
        public CountryRepository(IDatabaseFactory dbFactory)
            : base(dbFactory)
        {
        }
        public CountryRepository()
            : base(new DBFactory())
        {
        }
    }

    public partial class UsersRepository : RepositoryBase<aspnet_Users>
    {
        public UsersRepository(IDatabaseFactory dbFactory)
            : base(dbFactory)
        {
        }
        public UsersRepository()
            : base(new DBFactory())
        {
        }
    }

    public partial class RolesRepository : RepositoryBase<aspnet_Roles>
    {
        public RolesRepository(IDatabaseFactory dbFactory)
            : base(dbFactory)
        {
        }
        public RolesRepository()
            : base(new DBFactory())
        {
        }
    }

    public partial class MembershipRepository : RepositoryBase<aspnet_Membership>
    {
        public MembershipRepository(IDatabaseFactory dbFactory)
            : base(dbFactory)
        {
        }
        public MembershipRepository()
            : base(new DBFactory())
        {
        }
    }

    public partial class DocumentsRepository : RepositoryBase<TBL_DOCS>
    {
        public DocumentsRepository(IDatabaseFactory dbFactory)
            : base(dbFactory)
        {
        }
        public DocumentsRepository()
            : base(new DBFactory())
        {
        }
    }
    public partial class DocumentsStatusRepository : RepositoryBase<Tbl_DocumentStatus>
    {
        public DocumentsStatusRepository(IDatabaseFactory dbFactory)
            : base(dbFactory)
        {
        }
        public DocumentsStatusRepository()
            : base(new DBFactory())
        {
        }
    }

    public partial class OpprtunitySourceRepository : RepositoryBase<TBL_OpportunitySource>
    {
        public OpprtunitySourceRepository(IDatabaseFactory dbFactory)
            : base(dbFactory)
        {
        }
        public OpprtunitySourceRepository()
            : base(new DBFactory())
        {
        }
    }
    public partial class OpprtunityTypesRepository : RepositoryBase<TBL_OpportunityTypes>
    {
        public OpprtunityTypesRepository(IDatabaseFactory dbFactory)
            : base(dbFactory)
        {
        }
        public OpprtunityTypesRepository()
            : base(new DBFactory())
        {
        }
    }
    public partial class OpprtunityWhyLostRepository : RepositoryBase<TBL_OpportunityWhyLost>
    {
        public OpprtunityWhyLostRepository(IDatabaseFactory dbFactory)
            : base(dbFactory)
        {
        }
        public OpprtunityWhyLostRepository()
            : base(new DBFactory())
        {
        }


        public override IEnumerable<TBL_OpportunityWhyLost> GetAll()
        {
            return base.GetAll().OrderBy(status => status.SortOrder);
        }
    }
    public partial class GapAnalysisRepository : RepositoryBase<TBL_GA_Tracker>
    {
        public GapAnalysisRepository(IDatabaseFactory dbFactory)
            : base(dbFactory)
        {
        }
        public GapAnalysisRepository()
            : base(new DBFactory())
        {
        }

        public GATracker GetGATrackerById(int id)
        {
            return (this.DatabaseFactory.Get() as SandlerDBEntities).GetGATrackerById(id).SingleOrDefault();
        }
    }

    public partial class TrngExpenditureRepository : RepositoryBase<TBL_Trng_Expenditure>
    {
        public TrngExpenditureRepository(IDatabaseFactory dbFactory)
            : base(dbFactory)
        {
        }
        public TrngExpenditureRepository()
            : base(new DBFactory())
        {
        }
    }
    public partial class OppSourceeRepository : RepositoryBase<TBL_OpportunitySource>
    {
        public OppSourceeRepository(IDatabaseFactory dbFactory)
            : base(dbFactory)
        {
        }
        public OppSourceeRepository()
            : base(new DBFactory())
        {
        }
    }

    public partial class OppHistoryRepository : RepositoryBase<TBL_OpportunitiesHistory>
    {
        public OppHistoryRepository(IDatabaseFactory dbFactory)
            : base(dbFactory)
        {
        }
        public OppHistoryRepository()
            : base(new DBFactory())
        {
        }
    }
}
