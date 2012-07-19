using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Security;

namespace SandlerModels
{
    public class UserModel
    {
        private MembershipUser currentUser;
        private int franchiseeId;

        public string Role
        {
            get{
                foreach (string role in Roles.GetAllRoles())
                {
                    if (Roles.IsUserInRole(role))
                        return role;
                }
                return "";
            }

        }

        public bool RequirePasswordChange
        {
            get
            {
                return (currentUser.CreationDate == currentUser.LastPasswordChangedDate);
            }
        }

        public Guid  UserId
        {
            get
            {
                return (Guid)currentUser.ProviderUserKey ;
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

        public UserModel()
        {
            currentUser = Membership.GetUser(HttpContext.Current.User.Identity.Name); 
        }
    }
}
