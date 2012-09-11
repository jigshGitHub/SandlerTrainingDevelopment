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
    public class FranchiseeController : ApiController
    {
        public Coach PostCoach(Coach franchisee)
        {
            MembershipUser user;
            CoachRepository repository;
            TBL_COACH coachToSave;
            try
            {
                repository = new CoachRepository();
                if (franchisee.ID > 0)
                {
                    coachToSave = repository.GetById(franchisee.ID);
                    coachToSave.LastUpdatedBy = new Guid(franchisee.CreatedByCorporateID);
                    coachToSave.LastCreatedDate = DateTime.Now;

                    CoachMappings.ViewModelToModel(coachToSave, franchisee);

                    repository.Update(coachToSave);
                    user = Membership.GetUser(coachToSave.UserID);
                    user.Email = franchisee.Email;
                    Membership.UpdateUser(user);
                }
                else
                {
                    user = Membership.CreateUser(franchisee.UserName, "pa$$word", franchisee.Email);
                    Roles.AddUserToRole(franchisee.UserName, SandlerRoles.Coach.ToString());

                    coachToSave = new TBL_COACH();
                    coachToSave.CreatedBy = new Guid(franchisee.CreatedByCorporateID);
                    coachToSave.UserID = (Guid)user.ProviderUserKey;
                    coachToSave.CreatedDate = DateTime.Now;
                    coachToSave.LastCreatedDate = DateTime.Now;
                    coachToSave.IsActive = true;
                    CoachMappings.ViewModelToModel(coachToSave, franchisee);
                    repository.Add(coachToSave);
                    franchisee.UserName = user.UserName;
                }                

                //CoachMappings.ModelToViewModel(franchisee, coachToSave);
            }
            catch (Exception ex)
            {
            }
            return franchisee;
        }

        public Franchisee Get(int id, string userId)
        {
            TBL_FRANCHISEE _franchisee = new FranchiseeRepository().GetById(id);
            TBL_FRANCHISEE_USERS _franchiseeUSer = new FranchiseeUsersRepository().GetAll().Where(record => record.FranchiseeID == _franchisee.ID && record.UserID == new Guid(userId)).SingleOrDefault();
            aspnet_Users user = new UsersRepository().GetAll().Where(u => u.UserId == _franchiseeUSer.UserID).SingleOrDefault();
            aspnet_Membership member = new MembershipRepository().GetAll().Where(m => m.UserId == _franchiseeUSer.UserID).SingleOrDefault();
            Franchisee franchisee = new Franchisee();
            franchisee.FranchiseeUser = new FranchiseeUser();
            franchisee.FranchiseeUser.UserName = user.UserName;
            franchisee.FranchiseeUser.Email = member.Email;
            FranchiseeMappings.ModelToViewModel(franchisee, _franchisee, _franchiseeUSer);
            return franchisee;
        }
    }
}