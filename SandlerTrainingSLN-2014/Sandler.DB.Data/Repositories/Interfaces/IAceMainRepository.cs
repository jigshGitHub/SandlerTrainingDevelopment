using Sandler.DB.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Sandler.DB.Data.Repositories.Interfaces
{
    public interface IAceMainRepository
    {
        IEnumerable<AceMainView> Get(string searchText, string orderBy, int? pageSize, int? pageNo, int? coachId, int? franchiseeId, bool selectForExcel);
        IEnumerable<AceMainView> GetByCampaignType(int campaignTypeId);
        IEnumerable<AceMainView> GetArchive(string searchText, string orderBy, int? pageSize, int? pageNo, int? coachId, int? franchiseeId, bool selectForExcel);

        IEnumerable<Tbl_AceCampaignType> GetCampaignTypeOptions();

        IEnumerable<Tbl_AceCallToActionType> GetCallToActionTypeOptions();

        bool ArchiveCampaign(int aceId, string userId);
        bool UnArchiveCampaign(int aceId, string userId);
        int AddCampaign(Tbl_AceMainInfo _campaign);
        int UpdateCampaign(Tbl_AceMainInfo _campaign);
        Tbl_AceMainInfo Get(int aceId);
    }
}
