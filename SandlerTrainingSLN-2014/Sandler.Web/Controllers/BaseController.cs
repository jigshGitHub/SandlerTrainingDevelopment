using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using Sandler.Web.Models;
using Sandler.DB.Data.Common.Interface;
using Sandler.DB.Data.Common.Implementation;
using Sandler.DB.Data.Common;
using Sandler.DB.Data.Repositories;
using Sandler.Web.ViewModels;
namespace Sandler.Web.Controllers
{
    public class BaseController : Controller
    {
        protected BaseViewModel BaseVM;
        protected IUnitOfWork uow;
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

        public BaseController(IUnitOfWork _uow)
        {
            uow = _uow;
            BaseVM = new BaseViewModel();
            UserModel currentUser = new UserModel(System.Web.HttpContext.Current.User.Identity.Name);
            currentUser.Load(uow);
            BaseVM.CurrentUser = currentUser;
            BaseVM.RoleEntityValue = new AccountProfile(currentUser.UserName).RoleEntityValue;
            BaseVM.CRMMenu = GetCRMMenu(System.Web.HttpContext.Current.Request.ApplicationPath);
        }
        protected override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            ViewBag.UserID = UserId.ToString();
            ViewBag.UserRole = UserRoles.First();
            ViewBag.UserName = UserName;
            ViewBag.RoleEntityValue = RoleEntityValue;
            base.OnActionExecuting(filterContext);
        }

        private List<Menu> GetCRMMenu(string applicationPath)
        {
            applicationPath = (applicationPath.Length > 1) ? applicationPath : "";

            List<Menu> CRMMenu = new List<Menu>();

            List<MenuItem> items = new List<MenuItem>();

            //items.Add(new MenuItem { Id = "Search", Text = "Search", Link = "~/CRM/Companies/Search.aspx", IsVisible = true });
            items.Add(new MenuItem { Id = "Upload", Text = "Upload Company Data", Link = "~/CRM/Companies/Upload.aspx", IsVisible = !IsUserReadOnly(SandlerUserActions.Add, SandlerEntities.Company) });
            items.Add(new MenuItem { Id = "AddProduct", Text = "Add New Product", Link = "~/CRM/Products/Add.aspx", IsVisible = !IsUserReadOnly(SandlerUserActions.Add, SandlerEntities.Company) });
            items.Add(new MenuItem { Id = "AddCompany", Text = "Add New Company", Link = "navi?url=" + applicationPath + "/CRM/Companies/Edit?id=0", IsVisible = !IsUserReadOnly(SandlerUserActions.Add, SandlerEntities.Company) });
            items.Add(new MenuItem { Id = "ViewArchived", Text = "View Archived Records", Link = "navi?url=" + applicationPath + "/CRM/Companies/ViewArchived", IsVisible = true });

            CRMMenu.Add(new Menu { Title = "Companies", IsVisible = true, Items = items.Where(item => item.IsVisible == true).ToList() });

            items = new List<MenuItem>();

            //items.Add(new MenuItem { Id = "Search", Text = "Search", Link = "~/CRM/Contacts/Search.aspx", IsVisible = true });
            items.Add(new MenuItem { Id = "Upload", Text = "Upload Contact Data", Link = "~/CRM/Contacts/Upload.aspx", IsVisible = !IsUserReadOnly(SandlerUserActions.Add, SandlerEntities.Contact) });
            items.Add(new MenuItem { Id = "AddContact", Text = "Add New Contact", Link = "navi?url=" + applicationPath + "/CRM/Contacts/Manage", IsVisible = !IsUserReadOnly(SandlerUserActions.Add, SandlerEntities.Contact) });
            items.Add(new MenuItem { Id = "CallList", Text = "View Call List", Link = "~/CRM/Contacts/CallList.aspx", IsVisible = true });
            items.Add(new MenuItem { Id = "ViewArchivedContacts", Text = "View Archived Records", Link = "navi?url=" + applicationPath + "/CRM/Contacts/ViewArchivedContacts", IsVisible = true });

            CRMMenu.Add(new Menu { Title = "Contacts", IsVisible = true, Items = items.Where(item => item.IsVisible == true).ToList() });

            items = new List<MenuItem>();

            //items.Add(new MenuItem { Id = "Search", Text = "Search", Link = "~/CRM/Opportunities/Search.aspx", IsVisible = true });
            items.Add(new MenuItem { Id = "AddOpportunity", Text = "Add New Opportunity", Link = "navi?url=" + applicationPath + "/CRM/Pipeline/Manage", IsVisible = !IsUserReadOnly(SandlerUserActions.Add, SandlerEntities.Opportunity) });
            items.Add(new MenuItem { Id = "ViewArchived", Text = "View Archived Records", Link = "navi?url=" + applicationPath + "/CRM/Pipeline/Archived", IsVisible = true });

            CRMMenu.Add(new Menu { Title = "Opportunities", IsVisible = true, Items = items.Where(item => item.IsVisible == true).ToList() });

            items = new List<MenuItem>();

            items.Add(new MenuItem { Id = "Search", Text = "Search", Link = "~/CRM/Documents/Search.aspx", IsVisible = true });
            items.Add(new MenuItem { Id = "AddDocument", Text = "Attach New Document", Link = "~/CRM/Documents/Add.aspx", IsVisible = !IsUserReadOnly(SandlerUserActions.Add, SandlerEntities.Document) });

            CRMMenu.Add(new Menu { Title = "Documents", IsVisible = true, Items = items.Where(item => item.IsVisible == true).ToList() });

            items = new List<MenuItem>();

            items.Add(new MenuItem { Id = "Search", Text = "Detailed Search", Link = "~/CRM/HomeOffice/Search.aspx", IsVisible = !IsUserReadOnly(SandlerUserActions.Add, SandlerEntities.HomeOffice) });
            items.Add(new MenuItem { Id = "AddFranchisee", Text = "Add New..", Link = "navi?url=" + applicationPath + "/CRM/HomeOffice/Edit?id=0", IsVisible = !IsUserReadOnly(SandlerUserActions.View, SandlerEntities.HomeOffice) });
            items.Add(new MenuItem { Id = "ViewArchived", Text = "View Archived Records", Link = "navi?url=" + applicationPath + "/CRM/HomeOffice/ViewArchived", IsVisible = !IsUserReadOnly(SandlerUserActions.View, SandlerEntities.HomeOffice) });


            CRMMenu.Add(new Menu { Title = "HomeOffice", IsVisible = true, Items = items.Where(item => item.IsVisible == true).ToList() });

            return CRMMenu;
        }

        protected virtual bool IsUserReadOnly(SandlerUserActions action, SandlerEntities entity)
        {
            switch (BaseVM.CurrentUser.Role)
            {
                case SandlerRoles.FranchiseeUser:
                    if (action == SandlerUserActions.View)
                        return true;
                    else
                    {
                        return (
                            //entity == SandlerEntities.Company || //Removed on 2/10/2013 by BRT
                            entity == SandlerEntities.Coach
                            || entity == SandlerEntities.Region
                            || entity == SandlerEntities.HomeOffice);
                    }
                case SandlerRoles.FranchiseeOwner:
                    if (action == SandlerUserActions.View)
                        return true;
                    else
                    {
                        return (entity == SandlerEntities.Coach
                            || entity == SandlerEntities.Region
                            || entity == SandlerEntities.HomeOffice);
                    }
                case SandlerRoles.Client:
                    if (action == SandlerUserActions.View)
                        return true;
                    else
                    {
                        return (entity == SandlerEntities.Coach
                            || entity == SandlerEntities.Region
                            || entity == SandlerEntities.HomeOffice);
                    }
                case SandlerRoles.Coach:
                    if (action == SandlerUserActions.View)
                        return true;
                    else
                    {
                        return (entity != SandlerEntities.Franchisee || entity == SandlerEntities.HomeOffice);
                    }
                case SandlerRoles.HomeOfficeAdmin:
                    if (action == SandlerUserActions.View)
                        return false;
                    else
                    {
                        return (entity != SandlerEntities.HomeOffice
                            || entity == SandlerEntities.Company
                            || entity == SandlerEntities.Coach
                            || entity == SandlerEntities.Region);
                    }
                case SandlerRoles.HomeOfficeUser:
                    if (action == SandlerUserActions.View)
                        return true;
                    else
                    {
                        return (entity != SandlerEntities.HomeOffice
                            || entity == SandlerEntities.Company
                            || entity == SandlerEntities.Coach
                            || entity == SandlerEntities.Region);
                    }
                default:
                    //This will be used by Corporate/SiteAdmin Role
                    if (action == SandlerUserActions.View)
                        return true;
                    else
                    {
                        return (entity != SandlerEntities.Coach
                            || entity == SandlerEntities.HomeOffice);
                    }
            }
        }
    }
}