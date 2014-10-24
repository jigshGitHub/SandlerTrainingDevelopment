﻿using Sandler.DB.Data.Common.Implementation;
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

        public MyTaskRepository(IDBContext dbContext) : base(dbContext)
        {
        }
        
        public IEnumerable<MyTaskView> Get(string Role, string UserId, int? FranchiseeId, int? RegionId)
        {
            return (DBContext.Get() as SandlerDBEntities).GetMyTaskView(Role, UserId, FranchiseeId, RegionId);

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

    }
}