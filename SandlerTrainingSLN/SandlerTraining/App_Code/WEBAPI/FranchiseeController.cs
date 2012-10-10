using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Web.Http;
using SandlerModels;
using SandlerRepositories;
using System.Net.Http.Headers;
using SandlerViewModels;
using SandlerViewModelsMappings;
using SandlerModels.DataIntegration;
namespace SandlerAPI.Controllers
{
    [Authorize()]
    public class FranchiseeController : ApiController
    {
        public Franchisee PostFranchisee(Franchisee franchisee)
        {
            FranchiseeRepository repository;
            FranchiseeUsersRepository userRepository;
            TBL_FRANCHISEE franchiseeToSave = null;
            TBL_FRANCHISEE_USERS franchiseeUserToSave = null;
            string userName = "";
            Guid userId;
            try
            {
                repository = new FranchiseeRepository();
                userRepository = new FranchiseeUsersRepository();

                userName = franchisee.FranchiseeUser.FirstName.ToLower() + "." + franchisee.FranchiseeUser.LastName.ToLower();

                if (franchisee.ID > 0)
                {
                    franchiseeUserToSave = userRepository.GetAll().Where(record => record.FranchiseeID == franchisee.ID && record.UserID.ToString() == franchisee.FranchiseeUser.UserID).SingleOrDefault();
                    FranchiseeUserMappings.ViewModelToModel(franchiseeUserToSave, franchisee.FranchiseeUser);
                    userRepository.Update(franchiseeUserToSave);

                    franchiseeToSave = repository.GetById(franchisee.ID);
                    franchiseeToSave.LastUpdatedBy = new Guid(franchisee.CreatedByCoachID);
                    franchiseeToSave.LastCreatedDate = DateTime.Now;

                    FranchiseeMappings.ViewModelToModel(franchiseeToSave, franchisee);

                    repository.Update(franchiseeToSave);

                    UserEntitiesFactory.UpdateUser(franchisee.FranchiseeUser.UserID, franchisee.FranchiseeUser.Email);
                }
                else
                {
                    if (UserEntitiesFactory.IsUserExits(userName))
                    {
                        userName = userName + UserEntitiesFactory.UsersCount(userName).ToString();
                    }

                    userId = UserEntitiesFactory.CreateUserWithRoles(userName, franchisee.FranchiseeUser.Email, SandlerRoles.FranchiseeOwner.ToString());

                    try
                    {
                        franchiseeToSave = new TBL_FRANCHISEE();
                        franchiseeToSave.CreatedBy = new Guid(franchisee.CreatedByCoachID);
                        franchiseeToSave.CreatedDate = DateTime.Now;
                        franchiseeToSave.LastCreatedDate = DateTime.Now;
                        franchiseeToSave.IsActive = true;

                        FranchiseeMappings.ViewModelToModel(franchiseeToSave, franchisee);
                        repository.Add(franchiseeToSave);
                    }
                    catch (System.Data.Entity.Validation.DbEntityValidationException ex)
                    {

                        UserEntitiesFactory.DeleteUserWithRoles(userName, SandlerRoles.FranchiseeOwner.ToString());

                        foreach (var errors in ex.EntityValidationErrors)
                        {
                            foreach (var error in errors.ValidationErrors)
                            {
                                throw new Exception(error.PropertyName + " " + error.ErrorMessage);
                            }
                        }

                    }
                    catch (Exception ex)
                    {
                        UserEntitiesFactory.DeleteUserWithRoles(userName, SandlerRoles.FranchiseeOwner.ToString());
                    }

                    try
                    {
                        franchiseeUserToSave = new TBL_FRANCHISEE_USERS();
                        franchiseeUserToSave.FranchiseeID = franchiseeToSave.ID;
                        franchiseeUserToSave.IsEmailSubscription = true;
                        franchiseeUserToSave.UserID = userId;

                        FranchiseeUserMappings.ViewModelToModel(franchiseeUserToSave, franchisee.FranchiseeUser);
                        franchisee.FranchiseeUser.UserName = userName;
                        userRepository.Add(franchiseeUserToSave);
                    }
                    catch (Exception ex)
                    {
                        UserEntitiesFactory.DeleteUserWithRoles(userName, SandlerRoles.FranchiseeOwner.ToString()); 
                        repository.Delete(franchiseeToSave);
                    }

                    //Send email user has been created
                }

                FranchiseeMappings.ModelToViewModel(franchisee, franchiseeToSave, franchiseeUserToSave);
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