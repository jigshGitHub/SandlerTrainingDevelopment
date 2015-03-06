using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;


using Sandler.DB.Data.Common;
using Sandler.DB.Data.Common.Implementation;
using Sandler.DB.Data.Common.Interface;
using Sandler.DB.Data.Repositories;
using Sandler.DB.Models;

namespace Sandler.Web.Feedback.Controllers
{
    public class HomeController : BaseController 
    {
        public HomeController(IUnitOfWork uow)
            : base(uow)
        {   
        }
        public HomeController()
            : this(new SandlerUnitOfWork(new SandlerRepositoryProvider(new RepositoryFactories()), new SandlerDBContext()))
        {
        }

        public ActionResult ACEFeedback(string id)
        {
            Tbl_AceEmailTracker receipient = null;
            Tbl_AceMainInfo campaign = null;
            try
            {
                receipient = this.uow.AceEmailTrackerRepository().Get(new Guid(id));
                if (receipient != null)
                {

                    receipient.IsViewed = true;
                    this.uow.AceEmailTrackerRepository().Update(receipient); 
                    
                    campaign = this.uow.AceMainRepository().Get(receipient.AceId);

                    if (campaign != null)
                    {
                        campaign.TotalCountConfirm = campaign.TotalCountConfirm++;
                        this.uow.AceMainRepository().UpdateCampaign(campaign);
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

            

            return View();
        }
    }
}
