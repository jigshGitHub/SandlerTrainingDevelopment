using System.Web.Mvc;

namespace Sandler.Web.Areas.MyDay
{
    public class MyDayAreaRegistration : AreaRegistration
    {
        public override string AreaName
        {
            get
            {
                return "MyDay";
            }
        }


        public override void RegisterArea(AreaRegistrationContext context)
        {
            context.MapRoute(
                "MyDay_default",
                "MyDay/{controller}/{action}/{id}",
                new { action = "Index", id = UrlParameter.Optional },
                new string[] { "Sandler.Web.Areas.MyDay.Controllers" }
            );
        }
    }
}
