using Sandler.DB.Data.Common.Interface;
using Sandler.DB.Models;
//using Sandler.DB.Data.Common.Interface;
//using Sandler.DB.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.Security;

namespace Sandler.Web.Models
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
        public SandlerRoles Role
        {
            get
            {
                foreach (string role in Roles.GetAllRoles())
                {
                    if (Roles.IsUserInRole(this.userName,role))
                        return (SandlerRoles)Enum.Parse(typeof(SandlerRoles), role, true);
                    //return role;
                }
                return SandlerRoles.Anonymous;
            }

        }

        public bool Authenticated { get { return true; } }
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
        //public int CountryID
        //{
        //    get
        //    {
        //        return new SandlerRepositories.RegionRepository().GetById(regionId).CountryID;
        //    }
        //}

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
        public string AntiforgeryToken { get; set; }
        public string FormTokenCookieName { get; set; }
        public UserModel()
        {
            currentUser = Membership.GetUser(HttpContext.Current.User.Identity.Name);
            emailAdrs = currentUser.Email;
            userName = currentUser.UserName;
        }

        public UserModel(string _userName)
        {
            currentUser = Membership.GetUser(_userName);
            emailAdrs = currentUser.Email;
            userName = currentUser.UserName;
        }
        public void Load(IUnitOfWork uow)
        {
            TBL_COACH coach;
            switch (this.Role)
            {
                case SandlerRoles.Coach:
                    coach = uow.Repository<TBL_COACH>().GetAll().Where(r => r.UserID == this.UserId).SingleOrDefault();
                    this.CoachID = coach.ID;
                    this.RegionID = uow.Repository<TBL_REGION>().GetById(coach.RegionID).ID;
                    break;
                case SandlerRoles.FranchiseeOwner:
                case SandlerRoles.FranchiseeUser:
                case SandlerRoles.Client:
                    this.FranchiseeID = uow.Repository<TBL_FRANCHISEE_USERS>().GetAll().Where(r => r.UserID == this.UserId).SingleOrDefault().FranchiseeID;
                    TBL_FRANCHISEE franchisee = uow.Repository<TBL_FRANCHISEE>().GetAll().Where(r => r.ID == this.FranchiseeID).SingleOrDefault();
                    this.FranchiseeName = franchisee.Name;
                    coach = uow.Repository<TBL_COACH>().GetById(franchisee.CoachID);
                    this.CoachID = coach.ID;
                    this.RegionID = uow.Repository<TBL_REGION>().GetById(coach.RegionID).ID;
                    break;
                case SandlerRoles.SiteAdmin:
                case SandlerRoles.HomeOfficeAdmin:
                    break;
                default:
                    break;
            }
        }
    }
}
