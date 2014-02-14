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
    public class CompanyRepository : RepositoryBase<TBL_COMPANIES>, ICompanyRepository
    {
        public CompanyRepository(IDBContext dbContext)
            : base(dbContext)
        {
        }
        public IEnumerable<vw_Companies> Get(Guid userId)
        {
            return (DBContext.Get() as SandlerDBEntities).GetCompaniesByUser(userId);
        }
        public IEnumerable<GetNewClientsWithProducts> GetGetNewClientsWithProducts(Nullable<int> month, Nullable<int> year, Nullable<System.Guid> userId)
        {
            return (DBContext.Get() as SandlerDBEntities).GetNewClientsWithProducts(month, year, userId);
        }
        public int GetClosedSalesAnalysis(Nullable<int> month, Nullable<int> year, Nullable<System.Guid> userId, string analysisType, Nullable<bool> searchNewCompany, string companyIds)
        {
            return (DBContext.Get() as SandlerDBEntities).GetClosedSalesAnalysis(month, year, userId, analysisType, searchNewCompany, companyIds);
        }
        public int GetPipelineOpportunityAnalysis(Nullable<int> month, Nullable<int> year, Nullable<System.Guid> userId, string analysisType, Nullable<bool> searchNewCompany, string companyIds)
        {
            return (DBContext.Get() as SandlerDBEntities).PipelineOpportunityAnalysis(month, year, userId, analysisType, searchNewCompany, companyIds);
        }
        public IEnumerable<ClientsAvgLengthWithIndustries> GetClientsAvgLengthWithIndustries(Nullable<System.Guid> userId)
        {
            return (DBContext.Get() as SandlerDBEntities).ClientsAvgLengthWithIndustries(userId);
        }
        public IEnumerable<CompanyView> Get(string orderBy,int? pageSize,int? pageNo,int? coachId,int? franchiseeId)
        {
            return (DBContext.Get() as SandlerDBEntities).GetCompanyView(orderBy,pageSize,pageNo,coachId,franchiseeId);
        }
    }
}
