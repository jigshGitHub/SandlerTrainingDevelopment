using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using SandlerModels;
using SandlerRepositories;

namespace SandlerData.Models
{
    public interface IUserDataModel
    {
        void Load(UserModel user);
    }

    public class UserDataModel : IUserDataModel
    {
        private FranchiseeUsersRepository franchiseeUsersRepository;
        private FranchiseeRepository franchiseeRepository;
        private CoachRepository coachRepository;
        private RegionRepository regionRepository;

        public UserDataModel()
        {
            franchiseeUsersRepository = new FranchiseeUsersRepository();
            franchiseeRepository = new FranchiseeRepository();
            coachRepository = new CoachRepository();
            regionRepository = new RegionRepository();
        }
        #region IUserDataModel Members

        public void Load(UserModel user)
        {
            switch (user.Role)
            {
                case SandlerRoles.Coach:
                    user.CoachID = coachRepository.GetAll().Where(r => r.UserID == user.UserId).SingleOrDefault().ID;
                    user.RegionID = coachRepository.GetRegion(user.CoachID).ID;
                    break;
                case SandlerRoles.FranchiseeOwner:
                case SandlerRoles.FranchiseeUser:

                    user.FranchiseeID = franchiseeUsersRepository.GetAll().Where(r => r.UserID == user.UserId).SingleOrDefault().FranchiseeID;
                    user.FranchiseeName = franchiseeRepository.GetAll().Where(r => r.ID == user.FranchiseeID).SingleOrDefault().Name;
                    user.CoachID = franchiseeRepository.GetCoach(user.FranchiseeID).ID;
                    user.RegionID = coachRepository.GetRegion(user.CoachID).ID;
                    break;
                case SandlerRoles.SiteAdmin:
                    break;
                default:
                    break;
            }
        }
        ~UserDataModel()
        {
            franchiseeUsersRepository = null;
            franchiseeRepository = null;
            coachRepository = null;
            regionRepository = null;
        }
        #endregion
    }

}
