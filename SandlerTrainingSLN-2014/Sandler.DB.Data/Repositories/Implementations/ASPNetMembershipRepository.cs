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
    public class ASPNetMembershipRepository : RepositoryBase<aspnet_Membership>, IASPNetMembershipRepository
    {
        public ASPNetMembershipRepository(IDBContext dbContext)
            : base(dbContext)
        {
        }
        public aspnet_Membership Get(Guid userId)
        {
            return base.GetById(userId);
        }

    }
}
