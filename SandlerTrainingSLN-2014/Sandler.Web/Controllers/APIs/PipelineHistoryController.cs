using Sandler.DB.Data.Common.Interface;
using Sandler.DB.Data.Repositories.Interfaces;
using Sandler.DB.Models;
using Sandler.Web.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Http;

namespace Sandler.Web.Controllers.API
{
    [Authorize]
    public class PipelineHistoryController : BaseApiController
    {
        public PipelineHistoryController(IUnitOfWork uow) :base(uow)
        {
            
        }

        public PipelineHistoryController():base()
        {
        }

        [Route("api/PipelineHistoryView/")]
        public HttpResponseMessage GetPipelineHistory(int opportunityId)
        {
            var data = from history in uow.Repository<TBL_OpportunitiesHistory>().GetAll().Where(r => r.OpportunityID == opportunityId && r.CreatedBy == CurrentUser.UserId)
                       select new { ID=history.ID, Notes = history.Notes, CreatedBy = CurrentUser.UserName, CreatedDate = history.CreatedDate };
            return Request.CreateResponse(data);

        }
        
        public HttpResponseMessage Get(int id)
        {
            var data = uow.Repository<TBL_OpportunitiesHistory>().GetById(id);

            return Request.CreateResponse(data);
        }

        [Route("api/PipelineHistorySave")]
        [HttpPost()]
        public HttpResponseMessage Save(TBL_OpportunitiesHistory opportunitiesHistory)
        {
            TBL_OpportunitiesHistory tmpHistory;
            try
            {
                if (opportunitiesHistory.ID > 0)
                {
                    tmpHistory = uow.Repository<TBL_OpportunitiesHistory>().GetById(opportunitiesHistory.ID);
                    tmpHistory.Notes = opportunitiesHistory.Notes;
                    tmpHistory.UpdatedBy = CurrentUser.UserId;
                    tmpHistory.UpdatedDate = DateTime.Now;
                    uow.Repository<TBL_OpportunitiesHistory>().Update(opportunitiesHistory);
                }

                uow.Save();
                return Request.CreateResponse(opportunitiesHistory);
            }
            catch (Exception ex)
            {
                throw new Exception("There is a problem in Saving Notes History. Please try again later.", ex);
            }
        }
       
    }
}
