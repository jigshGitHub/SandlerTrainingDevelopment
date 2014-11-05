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
        IEnumerable<CompanyView> Get(string searchText, string orderBy, int? pageSize, int? pageNo, int? coachId, int? franchiseeId, bool selectForExcel);
        IEnumerable<CompanyView> GetCompanyOpportunities(string searchText, string orderBy, int? pageSize, int? pageNo, int? coachId, int? franchiseeId, bool selectForExcel);
        IEnumerable<CompanyView> GetArchive(string searchText, string orderBy, int? pageSize, int? pageNo, int? coachId, int? franchiseeId, bool selectForExcel);
        IEnumerable<CompanyView> GetCompanyLookup(string searchText, string orderBy, int? pageSize, int? pageNo, int? coachId, int? franchiseeId, bool selectForExcel);
        //For Archive Feature
        bool ArchiveCompany(int companyId, string userId);
        bool UnArchiveCompany(int companyId, string userId);
        int AddCompany(TBL_COMPANIES _company);
        int UpdateCompany(TBL_COMPANIES _company);

    }
}
