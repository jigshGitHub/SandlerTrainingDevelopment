using Sandler.DB.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Sandler.DB.Data.Repositories.Interfaces
{
    public interface IASPNetMembershipRepository
    {
        aspnet_Membership  Get(Guid userId);
    }
}
