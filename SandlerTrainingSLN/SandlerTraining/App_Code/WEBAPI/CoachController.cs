using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Web.Http;
using SandlerModels;
using SandlerRepositories;
using System.Net.Http.Headers;
using System.Web.Security;
using SandlerViewModels;
using SandlerViewModelsMappings;
namespace SandlerAPI.Controllers
{
    [Authorize()]
    public class CoachController : ApiController
    {
        public Coach PostCoach(Coach coach)
        {
            MembershipUser user;
            CoachRepository repository;
            TBL_COACH coachToSave;
            try
            {
                repository = new CoachRepository();
                if (coach.ID > 0)
                {
                    coachToSave = repository.GetById(coach.ID);
                    coachToSave.LastUpdatedBy = new Guid(coach.CreatedByCorporateID);
                    coachToSave.LastCreatedDate = DateTime.Now;

                    CoachMappings.ViewModelToModel(coachToSave, coach);

                    repository.Update(coachToSave);
                    user = Membership.GetUser(coachToSave.UserID);
                    user.Email = coach.Email;
                    Membership.UpdateUser(user);
                }
                else
                {
                    user = Membership.CreateUser(coach.UserName, "pa$$word", coach.Email);
                    Roles.AddUserToRole(coach.UserName, SandlerRoles.Coach.ToString());

                    coachToSave = new TBL_COACH();
                    coachToSave.CreatedBy = new Guid(coach.CreatedByCorporateID);
                    coachToSave.UserID = (Guid)user.ProviderUserKey;
                    coachToSave.CreatedDate = DateTime.Now;
                    coachToSave.LastCreatedDate = DateTime.Now;
                    coachToSave.IsActive = true;
                    CoachMappings.ViewModelToModel(coachToSave, coach);
                    repository.Add(coachToSave);
                    coach.UserName = user.UserName;
                }                

                //CoachMappings.ModelToViewModel(coach, coachToSave);
            }
            catch (Exception ex)
            {
            }
            return coach;
        }

        public Coach Get(int id)
        {
            TBL_COACH _coach = new CoachRepository().GetById(id);
            aspnet_Users user = new UsersRepository().GetAll().Where(u => u.UserId == _coach.UserID).SingleOrDefault();
            aspnet_Membership member = new MembershipRepository().GetAll().Where(m => m.UserId == _coach.UserID).SingleOrDefault();
            TBL_REGION _region = new RegionRepository().GetById(_coach.RegionID);
            Coach coach = new Coach();
            coach.UserName = user.UserName;
            coach.RegionName = _region.Name;
            coach.Email = member.Email;
            CoachMappings.ModelToViewModel(coach, _coach);
            return coach;
        }
    }
}