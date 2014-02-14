using System.Web.Mvc;

namespace Sandler.Web.Areas.CRM
{
    public class CRMAreaRegistration : AreaRegistration
    {
        public override string AreaName
        {
            get
            {
                return "CRM";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context)
        {
            context.MapRoute(
                "CRM_default",
                "CRM/{controller}/{action}/{id}",
                new { action = "Index", id = UrlParameter.Optional },
                new string[] { "Sandler.Web.Areas.CRM.Controllers" }
            );
        }
    }
}
