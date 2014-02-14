using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using Sandler.Web.Models;
namespace Sandler.Web.Controllers
{
    public class BaseController:Controller
    {
        public Guid UserId { get { return (Guid)Membership.GetUser(System.Web.HttpContext.Current.User.Identity.Name).ProviderUserKey; } }
        public string UserName { get { return System.Web.HttpContext.Current.User.Identity.Name; } }
        public string[] UserRoles { get { return Roles.GetRolesForUser(); } }
        public string RoleEntityValue
        {
            get
            {
                return new AccountProfile(UserName).RoleEntityValue;
            }
        }
        public BaseController()
        {
        }
        protected override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            ViewBag.UserID = UserId.ToString();
            ViewBag.UserRole = UserRoles.First();
            ViewBag.UserName = UserName;
            ViewBag.RoleEntityValue = RoleEntityValue;
            base.OnActionExecuting(filterContext);
        }

    }
}