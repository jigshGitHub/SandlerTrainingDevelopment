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
    public class MenuRepository:RepositoryBase<module>, IMenuRepository
    {
        public MenuRepository(IDBContext dbContext)
            : base(dbContext)
        {
        }
        public IEnumerable<MenuDetail> GetMenuDetails(int? appId)
        {
            return (DBContext.Get() as SandlerDBEntities).GetMenuDetail(appId);
        }
        public IEnumerable<module> GetMenuForARole(string role)
        {
            return (DBContext.Get() as SandlerDBEntities).GetMenuForARole(role);
        }
    }
}
