using Sandler.DB.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Sandler.DB.Data.Repositories.Interfaces
{
    public interface IMyTaskRepository
    {
        IEnumerable<MyTaskView> Get(string Role, string UserId, int? FranchiseeId, int? RegionId);
        IEnumerable<MyTaskView> GetByDate(string Role, string UserId, int? FranchiseeId, int? RegionId, DateTime selDate);
        int AddTask (Tbl_FollowUpItemsList _followupItem);


    }
}
