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
    public class FranchiseeUsersRepository : RepositoryBase<TBL_FRANCHISEE_USERS>, IFranchiseeUsersRepository
    {
        public FranchiseeUsersRepository(IDBContext dbContext)
            : base(dbContext)
        {
        }

        public IEnumerable<FranchiseeUsersView> Get(string searchText, string orderBy, int? pageSize, int? pageNo, Guid userId)
        {
            return (DBContext.Get() as SandlerDBEntities).GetFranchiseeUsersView(orderBy, pageSize, pageNo, userId, searchText);
        }

        public int AddFranchisee(TBL_FRANCHISEE_USERS _franchiseeUser)
        {
            Add(_franchiseeUser);
            DBContext.SaveChanges();
            return _franchiseeUser.ID;
        }

        public int UpdateFranchisee(TBL_FRANCHISEE_USERS _franchiseeUser)
        {
            Update(_franchiseeUser);
            DBContext.SaveChanges();
            return _franchiseeUser.ID;
        }

    }
}
