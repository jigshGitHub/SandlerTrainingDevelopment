//using Breeze.WebApi2;
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
    //[BreezeController]
    public class PipelineHistoryController : BaseApiController
    {
        public PipelineHistoryController(IUnitOfWork uow)
            : base(uow)
        {

        }

        public PipelineHistoryController()
            : base()
        {
        }

        [Route("api/PipelineHistory/")]
        public HttpResponseMessage GetPipelineForCompanies(int opportunityId)
        {
            try
            {
                var data = from history in uow.Repository<TBL_OpportunitiesHistory>().GetAll().Where(record => record.OpportunityID == opportunityId && record.CreatedBy == CurrentUser.UserId)
                           select new { ID = history.ID, Notes = history.Notes, CreatedBy = CurrentUser.UserName, CreatedDate = history.CreatedDate };


                return Request.CreateResponse(data);
            }
            catch (Exception ex)
            {
                throw new Exception("There is a problem in Saving Company Information. Please try again later.", ex);
            }
        }


        public HttpResponseMessage Get(int id)
        {
            try
            {
                var data = uow.Repository<TBL_OpportunitiesHistory>().GetById(id);

                return Request.CreateResponse(data);
            }
            catch (Exception ex)
            {
                throw new Exception("There is a problem in Saving Company Information. Please try again later.", ex);
            }
        }

        [Route("api/PipelineHistorySave")]
        [HttpPost()]
        public HttpResponseMessage Save(TBL_OpportunitiesHistory opportunityHistory)
        {
            TBL_OpportunitiesHistory tmpHistory;

            try
            {
                tmpHistory = uow.Repository<TBL_OpportunitiesHistory>().GetById(opportunityHistory.ID);
                
                tmpHistory.Notes = opportunityHistory.Notes;

                opportunityHistory = tmpHistory;

                if (!VerifyRequiredFields(opportunityHistory))
                    return new HttpResponseMessage(HttpStatusCode.InternalServerError);
                if (opportunityHistory.ID > 0)
                {
                    opportunityHistory.UpdatedBy = new Guid(CurrentUser.UserId.ToString());
                    opportunityHistory.UpdatedDate = DateTime.Now;
                    uow.Repository<TBL_OpportunitiesHistory>().Update(opportunityHistory);
                }
                else
                {
                    opportunityHistory.CreatedBy = new Guid(CurrentUser.UserId.ToString());
                    opportunityHistory.CreatedDate = DateTime.Now;
                    uow.Repository<TBL_OpportunitiesHistory>().Add(opportunityHistory);
                }

                uow.Save();
                return Request.CreateResponse(opportunityHistory);
            }
            catch (Exception ex)
            {
                throw new Exception("There is a problem in Saving Company Information. Please try again later.", ex);
            }
        }

        private bool VerifyRequiredFields(TBL_OpportunitiesHistory opportunityHistory)
        {
            return (opportunityHistory.ID > 0 && opportunityHistory.OpportunityID > 0);
        }
    }
}
