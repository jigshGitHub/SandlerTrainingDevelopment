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
    public class AceEmailTrackerRepository : RepositoryBase<Tbl_AceEmailTracker>, IAceEmailTrackerRepository
    {
        public AceEmailTrackerRepository(IDBContext dbContext)
            : base(dbContext)
        {
        }

        public void AddRecipients(IEnumerable<Tbl_AceEmailTracker> receipients)
        {
            foreach (Tbl_AceEmailTracker recepient in receipients)
            {
                Add(recepient);
            }

            DBContext.SaveChanges();
        }

        public List<Tbl_AceEmailTracker> GetForCampaign(int aceId)
        {
            var receipients = base.GetAll().Where(r => r.AceId == aceId && r.IsViewed == false).ToList<Tbl_AceEmailTracker>();
            return receipients;
        }

        public Tbl_AceEmailTracker Get(string id)
        {
            return base.GetById(id);
        }


        public void Update(Tbl_AceEmailTracker entity)
        {
            Update(entity);
            DBContext.SaveChanges();
        }
    }

}
