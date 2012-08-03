using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Security;

namespace SandlerModels
{
    [Serializable]
    public class UserModel
    {
        private MembershipUser currentUser;
        private int franchiseeId;
        private int regionId;
        private int coachId;
        public SandlerRoles Role
        {
            get
            {
                foreach (string role in Roles.GetAllRoles())
                {
                    if (Roles.IsUserInRole(role))
                        return (SandlerRoles)Enum.Parse(typeof(SandlerRoles), role, true);
                        //return role;
                }
                return SandlerRoles.Anonymous;
            }

        }

        public bool RequirePasswordChange
        {
            get
            {
                return false;// (currentUser.CreationDate == currentUser.LastPasswordChangedDate);
            }
        }

        public Guid UserId
        {
            get
            {
                return (Guid)currentUser.ProviderUserKey;
            }
        }

        public int FranchiseeID
        {
            get
            {
                return franchiseeId;
            }
            set
            {
                franchiseeId = value;
            }
        }
        public int CoachID
        {
            get
            {
                return coachId;
            }
            set
            {
                coachId = value;
            }
        }
        public int RegionID
        {
            get
            {
                return regionId;
            }
            set
            {
                regionId = value;
            }
        }

        public UserModel()
        {
            currentUser = Membership.GetUser(HttpContext.Current.User.Identity.Name);
        }
    }
}
