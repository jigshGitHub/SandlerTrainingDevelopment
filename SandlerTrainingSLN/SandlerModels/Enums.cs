using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SandlerModels
{
    public enum SandlerRoles
    {
        Corporate,
        Coach,
        FranchiseeOwner,
        FranchiseeUser,
        SiteAdmin,
        Anonymous
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
        Franchisee
    }
}
