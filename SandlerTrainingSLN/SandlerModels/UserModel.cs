﻿using System;
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
        private string emailAdrs;
        private string userName;
        private string franchiseeName;
        private int countryId;
        private bool isLDAPUser;
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
                return (currentUser.CreationDate == currentUser.LastPasswordChangedDate);
            }
        }

        public Guid UserId
        {
            get
            {
                return (Guid)currentUser.ProviderUserKey;
            }
        }

        public string UserName
        {
            get
            {
                return userName;
            }
            set
            {
                userName = value;
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
        public string FranchiseeName
        {
            get
            {
                return franchiseeName;
            }
            set
            {
                franchiseeName = value;
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
        public int CountryID
        {
            get
            {
                return new SandlerRepositories.RegionRepository().GetById(regionId).CountryID;
            }
        }

        public string EmailAdress
        {
            get
            {
                return emailAdrs;
            }
            set
            {
                emailAdrs = value;
            }
        }

        public bool IsLDAPUser
        {
            get
            {
                return isLDAPUser;
            }
            set
            {
                isLDAPUser = value;
            }
        }

        public UserModel()
        {
            currentUser = Membership.GetUser(HttpContext.Current.User.Identity.Name);
            emailAdrs = currentUser.Email;
            userName = currentUser.UserName;
        }

        public UserModel(string userName)
        {
            currentUser = Membership.GetUser(userName);
            emailAdrs = currentUser.Email;
            userName = currentUser.UserName;
        }
    }
}
