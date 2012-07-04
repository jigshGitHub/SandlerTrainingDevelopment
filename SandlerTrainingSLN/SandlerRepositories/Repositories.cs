using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.Entity;
using System.Linq.Expressions;
using SandlerData;
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
            : base(new SandlerDBFactory())
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
            : base(new SandlerDBFactory())
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
            : base(new SandlerDBFactory())
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
            : base(new SandlerDBFactory())
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
            : base(new SandlerDBFactory())
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
            : base(new SandlerDBFactory())
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
            : base(new SandlerDBFactory())
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
            : base(new SandlerDBFactory())
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
            : base(new SandlerDBFactory())
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
            : base(new SandlerDBFactory())
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
            : base(new SandlerDBFactory())
        {
        }
    }
    
    public class RetentionRateRepository : RepositoryBase<TBL_RETENTION_RATE>
    {
        public RetentionRateRepository(IDatabaseFactory dbFactory)  : base(dbFactory)
        {
        }
        public RetentionRateRepository()  : base(new SandlerDBFactory())
        {
        }
    }


    public class SalesTotalsByMonthRepository : RepositoryBase<TBL_SALESTOTALBYMONTH>
    {
        public SalesTotalsByMonthRepository(IDatabaseFactory dbFactory)  : base(dbFactory)
        {
        }
        public SalesTotalsByMonthRepository()   : base(new SandlerDBFactory())
        {
        }
    }
    public class ROIRepository : RepositoryBase<Return_on_Trng_Investment>
    {
        public ROIRepository(IDatabaseFactory dbFactory)
            : base(dbFactory)
        {
        }
        public ROIRepository()
            : base(new SandlerDBFactory())
        {
        }
    }

    public class ProdcutsSalesRepository : RepositoryBase<TBL_SALES>
    {
        public ProdcutsSalesRepository(IDatabaseFactory dbFactory)
            : base(dbFactory)
        {
        }
        public ProdcutsSalesRepository()
            : base(new SandlerDBFactory())
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
            : base(new SandlerDBFactory())
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
            : base(new SandlerDBFactory())
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
            : base(new SandlerDBFactory())
        {
        }
    }
}
