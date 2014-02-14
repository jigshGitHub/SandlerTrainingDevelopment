using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Sandler.Web.Models
{
    public enum SandlerRoles
    {
        Corporate,
        Coach,
        FranchiseeOwner,
        FranchiseeUser,
        SiteAdmin,
        Client,
        Anonymous,
        HomeOfficeAdmin,
        HomeOfficeUser
    }

    public enum SandlerUserActions
    {
        View,
        Add,
        Delete,
        Edit
    }

    public enum SandlerEntities
    {
        Company,
        Contact,
        Opportunity,
        Document,
        Coach,
        Region,
        Franchisee,
        FranchiseeUser,
        HomeOffice
    }
}
