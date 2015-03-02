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
        
    }

}
