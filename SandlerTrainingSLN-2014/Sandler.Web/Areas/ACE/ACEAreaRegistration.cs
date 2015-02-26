using System.Web.Mvc;

namespace Sandler.Web.Areas.ACE
{
    public class ACEAreaRegistration : AreaRegistration
    {
        public override string AreaName
        {
            get
            {
                return "ACE";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context)
        {
            context.MapRoute(
                "ACE_default",
                "ACE/{controller}/{action}/{id}",
                new { action = "Index", id = UrlParameter.Optional }
            );
        }
    }
}
