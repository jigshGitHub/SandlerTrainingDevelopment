using Sandler.DB.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Sandler.DB.Data.Repositories.Interfaces
{
    public interface IFranchiseeRepository
    {
        IEnumerable<FranchiseeView> Get(string searchText, string orderBy, int? pageSize, int? pageNo, bool selectForExcel,Guid userId, bool bringArchive);
        //IEnumerable<FranchiseeView> GetArchive(string searchText, string orderBy, int? pageSize, int? pageNo, bool selectForExcel);
        //For Archive Feature
        bool ArchiveFranchisee(int id, string userId);
        bool UnArchiveFranchisee(int id, string userId);
        int AddFranchisee(TBL_FRANCHISEE _franchisee);
        int UpdateFranchisee(TBL_FRANCHISEE _franchisee);
    }
}
