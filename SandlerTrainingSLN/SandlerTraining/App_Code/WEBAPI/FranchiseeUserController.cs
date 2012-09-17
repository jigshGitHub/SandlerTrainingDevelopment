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
    public class FranchiseeUserController : ApiController
    {
        public FranchiseeUser PostFranchisee(FranchiseeUser franchiseeUser)
        {
            FranchiseeUsersRepository userRepository;
            TBL_FRANCHISEE_USERS franchiseeUserToSave = null;
            string userName = "";
            Guid userId;
            try
            {
                userRepository = new FranchiseeUsersRepository();

                userName = franchiseeUser.FirstName.ToLower() + "." + franchiseeUser.LastName.ToLower();

                if (!string.IsNullOrEmpty(franchiseeUser.UserID))
                {
                    franchiseeUserToSave = userRepository.GetAll().Where(record => record.FranchiseeID == franchiseeUser.FranchiseeID && record.UserID.ToString() == franchiseeUser.UserID).SingleOrDefault();
                    FranchiseeUserMappings.ViewModelToModel(franchiseeUserToSave, franchiseeUser);
                    userRepository.Update(franchiseeUserToSave);

                    UserEntitiesFactory.UpdateUser(franchiseeUser.UserID, franchiseeUser.Email);
                }
                else
                {
                    if (UserEntitiesFactory.IsUserExits(userName))
                    {
                        userName = userName + UserEntitiesFactory.UsersCount(userName).ToString();
                    }

                    userId = UserEntitiesFactory.CreateUserWithRoles(userName, franchiseeUser.Email, SandlerRoles.FranchiseeUser.ToString());

                    try
                    {
                        franchiseeUserToSave = new TBL_FRANCHISEE_USERS();
                        franchiseeUserToSave.FranchiseeID = franchiseeUser.FranchiseeID;
                        franchiseeUserToSave.IsEmailSubscription = true;
                        franchiseeUserToSave.UserID = userId;
                        franchiseeUserToSave.IsEmailSubscription = true;
                        FranchiseeUserMappings.ViewModelToModel(franchiseeUserToSave, franchiseeUser);
                        franchiseeUser.UserName = userName;
                        userRepository.Add(franchiseeUserToSave);
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
                        userRepository.Delete(franchiseeUserToSave);
                    }

                    //Send email user has been created
                }

                FranchiseeUserMappings.ModelToViewModel(franchiseeUser, franchiseeUserToSave);
            }
            catch (Exception ex)
            {
            }
            return franchiseeUser;
        }

        public FranchiseeUser Get(int id, string userId)
        {
            TBL_FRANCHISEE_USERS _franchiseeUSer = new FranchiseeUsersRepository().GetAll().Where(record => record.FranchiseeID == id && record.UserID == new Guid(userId)).SingleOrDefault();
            aspnet_Users user = new UsersRepository().GetAll().Where(u => u.UserId == _franchiseeUSer.UserID).SingleOrDefault();
            aspnet_Membership member = new MembershipRepository().GetAll().Where(m => m.UserId == _franchiseeUSer.UserID).SingleOrDefault();
            FranchiseeUser franchiseeUser = new FranchiseeUser();
            franchiseeUser.UserName = user.UserName;
            franchiseeUser.Email = member.Email;
            FranchiseeUserMappings.ModelToViewModel(franchiseeUser, _franchiseeUSer);
            return franchiseeUser;
        }
    }
}