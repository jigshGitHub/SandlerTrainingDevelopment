using Sandler.DB.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Sandler.DB.Data.Repositories.Interfaces
{
    public interface IOpportunityRepository
    {
        IEnumerable<vw_Opportunities> Get(Guid userId);
        IEnumerable<GetSalesCyclePortfolio> GetSalesCyclePortfolioData(Nullable<System.Guid> userId);
        IEnumerable<GetBenchMarkCountry> GetBenchMarkCountryAll(Nullable<int> month, Nullable<int> year);
        IEnumerable<GetBenchMarkFranchiseeRegion> GetBenchMarkFranchiseeRegions(Nullable<int> month, Nullable<int> year, Nullable<int> franchiseeId);
        IEnumerable<GetBenchMarkRegionCountry> GetBenchMarkRegionCountry(Nullable<int> month, Nullable<int> year, Nullable<int> regionId);
        IEnumerable<GetBenchMarkSalesFranchisee> GetBenchMarkSalesFranchisee(Nullable<int> month, Nullable<int> year, Nullable<int> franchiseeId);
        IEnumerable<OpportunityView> Get(string orderBy, int? pageSize, int? pageNo, Guid userId, int? companyId,string searchText, bool bringArchive);        
    }
}
