using Sandler.DB.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Sandler.DB.Data.Repositories.Interfaces
{
    public interface IFranchiseeUsersRepository
    {
        IEnumerable<FranchiseeUsersView> Get(string searchText, string orderBy, int? pageSize, int? pageNo, Guid userId);       
    }
}
