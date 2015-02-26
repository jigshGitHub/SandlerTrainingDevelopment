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

        IEnumerable<MyTaskView> GetOurTasks(string Role, string UserId, int? FranchiseeId, int? RegionId);

        IEnumerable<MyTaskView> GetByDate(string Role, string UserId, int? FranchiseeId, int? RegionId, DateTime selDate);
        IEnumerable<MyTaskView> GetmytasksList(string orderBy, int? pageSize, int? pageNo, string UserId, int? FranchiseeId, int? CoachId);
        IEnumerable<MyTaskView> GetmyAppointmentsList(string orderBy, int? pageSize, int? pageNo, string UserId, int? FranchiseeId, int? CoachId);
        IEnumerable<MyTaskView> GetmyOpportunityList(string orderBy, int? pageSize, int? pageNo, string UserId, int? FranchiseeId, int? CoachId);
        int AddTask (Tbl_FollowUpItemsList _followupItem);
        int UpdateTask(Tbl_FollowUpItemsList _followupItem);
        bool ArchiveDTask(int Id);
        IEnumerable<FranchiseePersonnel> GetFranchiseePersonnel(int FranchiseeId);

        IEnumerable<MyTaskView> GetMyCallList(string Sql, string OrderBy, int? pageSize, int? pageNo);
        
    }

    
    public interface IMyPGRepository
    {
       int UpdatePG(TBL_PerformanceGoals _pgItem);
       int AddPG(TBL_PerformanceGoals _pgItem);
               
    }
}
