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
    public class FranchiseeRepository : RepositoryBase<TBL_FRANCHISEE>, IFranchiseeRepository
    {
        public FranchiseeRepository(IDBContext dbContext) : base(dbContext)
        {
        }

        public IEnumerable<FranchiseeView> Get(string searchText, string orderBy, int? pageSize, int? pageNo, bool selectForExcel, Guid userId, bool bringArchive)
        {
            return (DBContext.Get() as SandlerDBEntities).GetFranchiseeView(searchText, orderBy, pageSize, pageNo, selectForExcel, userId, bringArchive);
        }

        //public IEnumerable<FranchiseeView> GetArchive(string searchText, string orderBy, int? pageSize, int? pageNo, bool selectForExcel)
        //{
        //    return (DBContext.Get() as SandlerDBEntities).GetArchiveFranchiseeView(searchText, orderBy, pageSize, pageNo, selectForExcel);
        //}

        public IEnumerable<ReportView> GetReportData(string reportType, string orderBy, int? pageSize, int? pageNo, string recordType)
        {
            return (DBContext.Get() as SandlerDBEntities).GetReportData(reportType, orderBy, pageSize, pageNo, recordType);
        }

        public int AddFranchisee(TBL_FRANCHISEE _franchisee)
        {
            Add(_franchisee);
            DBContext.SaveChanges();
            return _franchisee.ID;
        }

        public int UpdateFranchisee(TBL_FRANCHISEE _franchisee)
        {
            Update(_franchisee);
            DBContext.SaveChanges();
            return _franchisee.ID;
        }
        
        //For Archive Company - Contact and Opps within Company
        public bool ArchiveFranchisee(int id, string userId)
        {
            string _sql = string.Format("UPDATE TBL_FRANCHISEE Set IsActive = 0, LastUpdatedBy = '{0}' where ID = {1} Select 1 as responseId", userId, id);
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
        public bool UnArchiveFranchisee(int id, string userId)
        {
            string _sql = string.Format("UPDATE TBL_FRANCHISEE Set IsActive = 1, LastUpdatedBy = '{0}' where ID = {1} Select 1 as responseId", userId, id);
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
