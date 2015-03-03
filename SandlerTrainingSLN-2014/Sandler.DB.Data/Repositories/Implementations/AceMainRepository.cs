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
    public class AceMainRepository : RepositoryBase<Tbl_AceMainInfo>, IAceMainRepository
    {
        public AceMainRepository(IDBContext dbContext) : base(dbContext)
        {
        }

        public IEnumerable<AceMainView> Get(string searchText, string orderBy, int? pageSize, int? pageNo, int? coachId, int? franchiseeId, bool selectForExcel)
        {
            return (DBContext.Get() as SandlerDBEntities).GetAceMainView(searchText, orderBy, pageSize, pageNo, coachId, franchiseeId, selectForExcel);
        }

        public IEnumerable<AceMainView> GetByCampaignType(int campaignTypeId)
        {
            return (DBContext.Get() as SandlerDBEntities).GetACECampaignsForCampaignType(campaignTypeId);
        }

        public IEnumerable<AceMainView> GetArchive(string searchText, string orderBy, int? pageSize, int? pageNo, int? coachId, int? franchiseeId, bool selectForExcel)
        {
            return (DBContext.Get() as SandlerDBEntities).GetArchiveAceMainView(searchText, orderBy, pageSize, pageNo, coachId, franchiseeId, selectForExcel);
        }


        public int AddCampaign(Tbl_AceMainInfo _campaign)
        {
            Add(_campaign);
            DBContext.SaveChanges();
            return _campaign.AceId;
        }

        public int UpdateCampaign(Tbl_AceMainInfo _campaign)
        {
            Update(_campaign);
            DBContext.SaveChanges();
            return _campaign.AceId;
        }

        //For Archive Company - Contact and Opps within Company
        public bool ArchiveCampaign(int aceId, string userId)
        {
            string _sql = string.Format("UPDATE Tbl_AceMainInfo Set IsActive = 0, UpdatedDate = GetDate(), UpdatedBy = '{0}' where aceId = {1} Select 1 as responseId", userId, aceId);
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

        //To UnArchive Company - Contact and Opps within Comapny
        public bool UnArchiveCampaign(int aceId, string userId)
        {
            string _sql = string.Format("UPDATE Tbl_AceMainInfo Set IsActive = 1, UpdatedDate = GetDate(), UpdatedBy = '{0}' where aceId = {1} Select 1 as responseId", userId, aceId);
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


        public IEnumerable<Tbl_AceCampaignType> GetCampaignTypeOptions()
        {
            return (DBContext.Get() as SandlerDBEntities).GetCampaignTypeOptions();
        }

        public IEnumerable<Tbl_AceCallToActionType> GetCallToActionTypeOptions()
        {
            return (DBContext.Get() as SandlerDBEntities).GetCallToActionTypeOptions();
        }
        
    }

}
