using Sandler.DB.Data.Common.Implementation;
using Sandler.DB.Data.Common.Interface;
using Sandler.DB.Data.Repositories.Interfaces;
using Sandler.DB.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Sandler.DB.Data.Repositories.Implementations
{
    public class OpportunityRepository : RepositoryBase<TBL_OPPORTUNITIES>, IOpportunityRepository
    {
        public OpportunityRepository(IDBContext dbContext)
            : base(dbContext)
        {
        }
        public IEnumerable<vw_Opportunities> Get(Guid userId)
        {
            return (DBContext.Get() as SandlerDBEntities).GetOpportunitiesByUser(userId);
        }

        public IEnumerable<GetSalesCyclePortfolio> GetSalesCyclePortfolioData(Nullable<System.Guid> userId)
        {
            return (DBContext.Get() as SandlerDBEntities).GetSalesCyclePortfolioData(userId);
        }
        public IEnumerable<GetBenchMarkCountry> GetBenchMarkCountryAll(Nullable<int> month, Nullable<int> year)
        {
            return (DBContext.Get() as SandlerDBEntities).GetBenchMarkCountryAll(month,year);
        }
        public IEnumerable<GetBenchMarkFranchiseeRegion> GetBenchMarkFranchiseeRegions(Nullable<int> month, Nullable<int> year, Nullable<int> franchiseeId)
        {
            return (DBContext.Get() as SandlerDBEntities).GetBenchMarkFranchiseeRegions(month, year,franchiseeId);
        }
        public IEnumerable<GetBenchMarkRegionCountry> GetBenchMarkRegionCountry(Nullable<int> month, Nullable<int> year, Nullable<int> regionId)
        {
            return (DBContext.Get() as SandlerDBEntities).GetBenchMarkRegionCountry(month, year, regionId);
        }
        public IEnumerable<GetBenchMarkSalesFranchisee> GetBenchMarkSalesFranchisee(Nullable<int> month, Nullable<int> year, Nullable<int> franchiseeId)
        {
            return (DBContext.Get() as SandlerDBEntities).GetBenchMarkSalesFranchisee(month, year, franchiseeId);
        }
        public IEnumerable<OpportunityView> Get(string orderBy, int? pageSize, int? pageNo, Guid userId, int? companyId, string searchText, bool bringArchive)
        {
            return (DBContext.Get() as SandlerDBEntities).GetOpportunityView(orderBy, pageSize, pageNo, userId, companyId, searchText, bringArchive);
        }
    }
}
