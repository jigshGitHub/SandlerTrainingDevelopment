using Sandler.DB.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Sandler.DB.Data.Repositories.Interfaces
{
    public interface IAceEmailTrackerRepository
    {
        void AddRecipients(IEnumerable<Tbl_AceEmailTracker> receipients);
        List<Tbl_AceEmailTracker> GetForCampaign(int aceId);
        Tbl_AceEmailTracker Get(Guid id);
        void Update(Tbl_AceEmailTracker entity);
    }
}
