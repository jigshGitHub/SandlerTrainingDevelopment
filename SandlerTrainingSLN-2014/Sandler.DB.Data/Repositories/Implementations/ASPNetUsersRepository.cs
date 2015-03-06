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
    public class ASPNetUsersRepository : RepositoryBase<aspnet_Users>, IASPNetUsersRepository
    {
        public ASPNetUsersRepository(IDBContext dbContext)
            : base(dbContext)
        {
        }
        public aspnet_Users  Get(Guid userId)
        {
            return base.GetById(userId);
        }

    }
}
