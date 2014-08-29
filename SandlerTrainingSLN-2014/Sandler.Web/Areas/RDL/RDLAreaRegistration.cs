using System.Web.Mvc;

namespace Sandler.Web.Areas.RDL
{
    public class RDLAreaRegistration : AreaRegistration
    {
        public override string AreaName
        {
            get
            {
                return "RDL";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context)
        {
            context.MapRoute(
                "RDL_default",
                "RDL/{controller}/{action}/{id}",
                new { action = "Index", id = UrlParameter.Optional },
                new string[] { "Sandler.Web.Areas.RDL.Controllers" }
            );

            
        }
    }
}
