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
    public class MyTaskRepository : RepositoryBase<Tbl_FollowUpItemsList>, IMyTaskRepository
    {

        public MyTaskRepository(IDBContext dbContext)
            : base(dbContext)
        {
        }

        public IEnumerable<MyTaskView> Get(string Role, string UserId, int? FranchiseeId, int? RegionId)
        {
            return (DBContext.Get() as SandlerDBEntities).GetMyTaskView(Role, UserId, FranchiseeId, RegionId);

        }

        public IEnumerable<FranchiseePersonnel> GetFranchiseePersonnel(int FranchiseeId)
        {
            return (DBContext.Get() as SandlerDBEntities).GetFranchiseePersonnel(FranchiseeId);

        }

        public bool ArchiveDTask(int Id)
        {
            string _sql = string.Format("UPDATE Tbl_FollowUpItemsList Set IsActive = 0 where Id = {0} Select 1 as responseId", Id);
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

        public IEnumerable<MyTaskView> GetByDate(string Role, string UserId, int? FranchiseeId, int? RegionId, DateTime selDate)
        {
            return (DBContext.Get() as SandlerDBEntities).GetMyTaskViewByDate(Role, UserId, FranchiseeId, RegionId, selDate);

        }

        public IEnumerable<MyTaskView> GetmytasksList(string orderBy, int? pageSize, int? pageNo, string UserId, int? FranchiseeId, int? CoachId)
        {
            return (DBContext.Get() as SandlerDBEntities).GetmytasksList(orderBy, pageSize, pageNo, UserId, FranchiseeId, CoachId);

        }
        public IEnumerable<MyTaskView> GetmyAppointmentsList(string orderBy, int? pageSize, int? pageNo, string UserId, int? FranchiseeId, int? CoachId)
        {
            return (DBContext.Get() as SandlerDBEntities).GetmyAppointmentsList(orderBy, pageSize, pageNo, UserId, FranchiseeId, CoachId);

        }
        public IEnumerable<MyTaskView> GetmyOpportunityList(string orderBy, int? pageSize, int? pageNo, string UserId, int? FranchiseeId, int? CoachId)
        {
            return (DBContext.Get() as SandlerDBEntities).GetmyOpportunityList(orderBy, pageSize, pageNo, UserId, FranchiseeId, CoachId);

        }


        public int AddTask(Tbl_FollowUpItemsList _followupItem)
        {
            Add(_followupItem);
            DBContext.SaveChanges();
            return _followupItem.Id;
        }

        public int UpdateTask(Tbl_FollowUpItemsList _followupItem)
        {
            Update(_followupItem);
            DBContext.SaveChanges();
            return _followupItem.Id;
        }

    }
}
