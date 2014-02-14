using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Sandler.DB.Models;

namespace Sandler.Web.ViewModels
{
    public class pageInfo
    {
        public string title { get; set; }

        public int currentWorkspaceId { get; set; }
        public int currentModuleId { get; set; }
        public int currentPageMenuId { get; set; }
        public string LayoutPage { get; set; }
    }
    public class naviPage
    {
        public string title { get; set; }
        public string LayoutPage { get; set; }
        public string startUrl { get; set; }
        public string startUrlData { get; set; }
    }
    public class module_and_PageMenuGroup
    {
        public int moduleId { get; set; }

        public pageMenuGroup pageMenuGroup { get; set; }

        public List<pageMenu> pageMenus { get; set; }
    }

    public class genericResponse
    {
        public bool success { get; set; }
        public string message { get; set; }

        public int __count { get; set; }
        public List<iItemType> results { get; set; }
    }

    public interface iItemType
    {
    }

    public class rPageMenuGroup : iItemType
    {
        public int pageMenuGroupId { get; set; }

        public string caption { get; set; }

        public string description { get; set; }

        public string iconClass { get; set; }

        public string defaultPage { get; set; }

        public virtual ICollection<pageMenu> pageMenus { get; set; }
    }

    public class pageMenuGroupId_and_pageMenuId
    {
        public int pageMenuGroupId { get; set; }
        public int pageMenuId { get; set; }
        public int listOrder { get; set; }
    }
}