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
        public IEnumerable<CompanyView> Get(string searchText, string orderBy, int? pageSize, int? pageNo, int? coachId, int? franchiseeId, bool selectForExcel)
        {
            return (DBContext.Get() as SandlerDBEntities).GetCompanyView(searchText, orderBy, pageSize, pageNo, coachId, franchiseeId,selectForExcel);
        }

        //Get all company that has opportunities
        public IEnumerable<CompanyView> GetCompanyOpportunities(string searchText, string orderBy, int? pageSize, int? pageNo, int? coachId, int? franchiseeId, bool selectForExcel)
        {            
            return (DBContext.Get() as SandlerDBEntities).GetCompanyOpportunitiesView(searchText, orderBy, pageSize, pageNo, coachId, franchiseeId, selectForExcel);
        }
        public IEnumerable<CompanyView> GetCompanyLookup(string searchText, string orderBy, int? pageSize, int? pageNo, int? coachId, int? franchiseeId, bool selectForExcel)
        {
            return (DBContext.Get() as SandlerDBEntities).GetCompanyLookup(searchText, orderBy, pageSize, pageNo, coachId, franchiseeId, selectForExcel);
        }
        
        public IEnumerable<CompanyView> GetArchive(string searchText, string orderBy, int? pageSize, int? pageNo, int? coachId, int? franchiseeId, bool selectForExcel)
        {
            return (DBContext.Get() as SandlerDBEntities).GetArchiveCompanyView(searchText, orderBy, pageSize, pageNo, coachId, franchiseeId, selectForExcel);
        }

        public int AddCompany(TBL_COMPANIES _company)
        {
            Add(_company);
            DBContext.SaveChanges();
            return _company.COMPANIESID;
        }

        public int UpdateCompany(TBL_COMPANIES _company)
        {
            Update(_company);
            DBContext.SaveChanges();
            return _company.COMPANIESID;
        }

        //For Archive Company - Contact and Opps within Company
        public bool ArchiveCompany(int companyId, string userId)
        {
            string _sql = string.Format("UPDATE Tbl_Companies Set IsActive = 0, UpdatedDate = GetDate(), UpdatedBy = '{0}' where CompaniesId = {1} UPDATE Tbl_Contacts  Set IsActive = 0, UpdatedDate = GetDate(), UpdatedBy = '{0}' where Companyid = {1} Update TBL_OPPORTUNITIES Set IsActive = 0 , UpdatedDate = GetDate(), UpdatedBy = '{0}' where Companyid = {1} Select 1 as responseId", userId, companyId);
            var _message = (DBContext.Get() as SandlerDBEntities).Database.SqlQuery<ReponseMessage>(_sql).FirstOrDefault();
            //Now return the response
            if (_message.responseId > 0)
            {
                //All Ok - Record is marked as Archived
                return true;
            }
            else
            {
                //something went wrong
                return false;
            }
        }

        //To UnArchive Company - Contact and Opps within Comapny
        public bool UnArchiveCompany(int companyId, string userId)
        {
            string _sql = string.Format("UPDATE Tbl_Companies Set IsActive = 1, UpdatedDate = GetDate(), UpdatedBy = '{0}' where CompaniesId = {1} UPDATE Tbl_Contacts  Set IsActive = 1, UpdatedDate = GetDate(), UpdatedBy = '{0}' where Companyid = {1} Update TBL_OPPORTUNITIES Set IsActive = 1 , UpdatedDate = GetDate(), UpdatedBy = '{0}' where Companyid = {1} Select 1 as responseId", userId, companyId);
            var _message = (DBContext.Get() as SandlerDBEntities).Database.SqlQuery<ReponseMessage>(_sql).FirstOrDefault();
            //Now return the response
            if (_message.responseId > 0)
            {
                //All Ok - Record is marked as Archived
                return true;
            }
            else
            {
                //something went wrong
                return false;
            }
        }


    }
}
