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
        public FranchiseeUsersRepository franchiseeUsersRepository;
        public FranchiseeRepository franchiseeRepository;
        public CoachRepository coachRepository;
        public RegionRepository regionRepository;
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
                    user.CoachID = franchiseeRepository.GetCoach(user.FranchiseeID).ID;
                    user.RegionID = coachRepository.GetRegion(user.CoachID).ID;
                    break;
                case SandlerRoles.SiteAdmin:
                    break;
                default:
                    break;
            }
        }

        ~ UserDataModel()
        {
            franchiseeUsersRepository = null;
            franchiseeRepository = null;
            coachRepository = null;
            regionRepository = null;
        }
        #endregion
    }

    public interface IChartDataModel
    {
        IEnumerable<TBL_CONTACTS> GetNewAppointments(UserModel user);
        IEnumerable<TBL_OPPORTUNITIES> Getopportunities(UserModel user);  
    }

    public class ChartDataModel : IChartDataModel
    {
        #region IChartDataModel Members

        public IEnumerable<TBL_CONTACTS> GetNewAppointments(UserModel user)
        {
            ContactsRepository contactsSource = new ContactsRepository();
            IEnumerable<TBL_CONTACTS> contacts = null;

            if (user.Role == SandlerRoles.FranchiseeUser)
                contacts = contactsSource.GetAll().Where(r => r.IsNewAppointment == true && r.IsActive == true && r.CreatedBy.ToLower() == user.UserId.ToString().ToLower()).AsEnumerable();
            else if (user.Role == SandlerRoles.FranchiseeOwner)
                contacts = contactsSource.GetAll().Where(r => r.IsNewAppointment == true && r.IsActive == true && r.TBL_COMPANIES.FranchiseeId == user.FranchiseeID).AsEnumerable();
            else if (user.Role == SandlerRoles.Coach)
            {
                FranchiseeRepository franchiseeSource = new FranchiseeRepository();
                CoachRepository coachSource = new CoachRepository();
                contacts = from c in contactsSource.GetAll().Where(r => r.IsNewAppointment == true && r.IsActive == true)
                           from f in franchiseeSource.GetAll().Where(r => r.IsActive == true)
                           from ch in coachSource.GetAll().Where(r => r.IsActive == true)
                           where c.TBL_COMPANIES.FranchiseeId == f.ID && f.CoachID == ch.ID && ch.ID == user.CoachID
                           select c;

            }
            return contacts;
        }

        

        public IEnumerable<TBL_OPPORTUNITIES> Getopportunities(UserModel user)
        {
            OpportunitiesRepository opportunitiesSource = new OpportunitiesRepository();
            IEnumerable<TBL_OPPORTUNITIES> opportunties = null;

            if (user.Role == SandlerRoles.FranchiseeUser)
                opportunties = opportunitiesSource.GetAll().Where(r => r.IsActive == true && r.CreatedBy.ToLower() == user.UserId.ToString().ToLower()).AsEnumerable();
            else if (user.Role == SandlerRoles.FranchiseeOwner)
                opportunties = opportunitiesSource.GetAll().Where(r => r.IsActive == true && r.TBL_COMPANIES.FranchiseeId == user.FranchiseeID).AsEnumerable();
            else if (user.Role == SandlerRoles.Coach)
            {
                FranchiseeRepository franchiseeSource = new FranchiseeRepository();
                CoachRepository coachSource = new CoachRepository();
                opportunties = from c in opportunitiesSource.GetAll().Where(r => r.IsActive == true)
                               from f in franchiseeSource.GetAll().Where(r => r.IsActive == true)
                               from ch in coachSource.GetAll().Where(r => r.IsActive == true)
                               where c.TBL_COMPANIES.FranchiseeId == f.ID && f.CoachID == ch.ID && ch.ID == user.CoachID
                               select c;

            }
            return opportunties;
        }

        #endregion
    }
}
