using Sandler.DB.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Sandler.DB.Data.Repositories.Interfaces
{
    public interface ICompanyRepository
    {
        IEnumerable<vw_Companies> Get(Guid userId);
        IEnumerable<GetNewClientsWithProducts> GetGetNewClientsWithProducts(Nullable<int> month, Nullable<int> year, Nullable<System.Guid> userId);
        int GetClosedSalesAnalysis(Nullable<int> month, Nullable<int> year, Nullable<System.Guid> userId, string analysisType, Nullable<bool> searchNewCompany, string companyIds);
        int GetPipelineOpportunityAnalysis(Nullable<int> month, Nullable<int> year, Nullable<System.Guid> userId, string analysisType, Nullable<bool> searchNewCompany, string companyIds);
        IEnumerable<ClientsAvgLengthWithIndustries> GetClientsAvgLengthWithIndustries(Nullable<System.Guid> userId);
        IEnumerable<CompanyView> Get(string orderBy, int? pageSize, int? pageNo, int? coachId, int? franchiseeId);
    }
}
