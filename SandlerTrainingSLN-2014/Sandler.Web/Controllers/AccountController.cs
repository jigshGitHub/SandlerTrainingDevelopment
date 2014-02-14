using System;
using System.Collections.Generic;
using System.Linq;
using System.Transactions;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using DotNetOpenAuth.AspNet;
using Microsoft.Web.WebPages.OAuth;
using WebMatrix.WebData;
using Sandler.Web.Filters;
using Sandler.Web.Models;
using Sandler.Web.ApplicationIntegration;

namespace Sandler.Web.Controllers
{
    [Authorize]
    public class AccountController : Controller
    {

        //
        // GET: /Account/Login

        [AllowAnonymous]
        public ActionResult Login(string returnUrl)
        {
            ViewBag.ReturnUrl = returnUrl;
            //return View();
            return PartialView("login");
        }

        //
        // POST: /Account/Login

        [AllowAnonymous]
        [HttpPost]
        public ActionResult Login(LoginModel model, string returnUrl)
        {
            if (ModelState.IsValid)
            {
                if (Membership.ValidateUser(model.UserName, model.Password))
                {
                    FormsAuthentication.SetAuthCookie(model.UserName, model.RememberMe);
                    MembershipUser loggedInUser = Membership.GetUser(model.UserName);
                    //if (loggedInUser.CreationDate == loggedInUser.LastPasswordChangedDate)
                    //    return RedirectToAction("ChangePassword", "account", new { isIntialPasswordChange = true });
                    if (Url.IsLocalUrl(returnUrl))
                    {
                        return Redirect(returnUrl);
                    }
                    else
                    {
                        return RedirectToAction("Index", "Home");
                    }
                }
                else
                {
                    ModelState.AddModelError("", "The user name or password provided is incorrect.");
                }
            }

            // If we got this far, something failed, redisplay form
            //return View(model);
            return PartialView("login");
        }

        [AllowAnonymous]
        public ActionResult LogOn(string returnUrl)
        {
            ViewBag.ReturnUrl = returnUrl;
            return View();
        }

        //
        // POST: /Account/Login

        [HttpPost]
        [AllowAnonymous]
        //[ValidateAntiForgeryToken]
        public ActionResult LogOn(LogOnModel model, string returnUrl)
        {
             if (ModelState.IsValid)
            {
                if (Membership.ValidateUser(model.UserName, model.Password))
                {
                    FormsAuthentication.SetAuthCookie(model.UserName, model.RememberMe);
                    MembershipUser loggedInUser = Membership.GetUser(model.UserName);
                    //if (loggedInUser.CreationDate == loggedInUser.LastPasswordChangedDate)
                    //    return RedirectToAction("ChangePassword", "account", new { isIntialPasswordChange = true });
                    if (Url.IsLocalUrl(returnUrl))
                    {
                        return Redirect(returnUrl);
                    }
                    else
                    {
                        return RedirectToAction("Index", "Home");
                    }
                }
                else
                {
                    ModelState.AddModelError("", "The user name or password provided is incorrect.");
                }
            }

            // If we got this far, something failed, redisplay form
            //return View(model);
            return PartialView("logon");
        }
        //
        // GET: /Account/LogOff

        public ActionResult LogOff()
        {
            FormsAuthentication.SignOut();

            return RedirectToAction("Index", "Home");
        }

        //
        // GET: /Account/Register

        [AllowAnonymous]
        public ActionResult Register()
        {
            return View();
        }

        //
        // POST: /Account/Register

        [AllowAnonymous]
        [HttpPost]
        public ActionResult Register(RegisterModel model)
        {
            if (ModelState.IsValid)
            {
                // Attempt to register the user
                MembershipCreateStatus createStatus;
                Membership.CreateUser(model.UserName, model.Password, model.Email, passwordQuestion: null, passwordAnswer: null, isApproved: true, providerUserKey: null, status: out createStatus);

                if (createStatus == MembershipCreateStatus.Success)
                {
                    FormsAuthentication.SetAuthCookie(model.UserName, createPersistentCookie: false);
                    return RedirectToAction("Index", "Home");
                }
                else
                {
                    ModelState.AddModelError("", ErrorCodeToString(createStatus));
                }
            }

            // If we got this far, something failed, redisplay form
            return View(model);
        }

        //
        // GET: /Account/ChangePassword

        [AllowAnonymous]
        public ActionResult ChangePassword(bool? isIntialPasswordChange)
        {
            if (isIntialPasswordChange.HasValue)
                ViewBag.IsIntialPasswordChange = isIntialPasswordChange;
            else
                ViewBag.IsIntialPasswordChange = false;
            return View();
        }

        [HttpGet]
        public ContentResult sessionKeepAlive()
        {
            string s = @"{'ka': '1'}";
            return new ContentResult { Content = s, ContentType = "application/json" };
        }

        //
        // POST: /Account/ChangePassword

        [HttpPost]
        public ActionResult ChangePassword(ChangePasswordModel model)
        {
            ViewBag.IsIntialPasswordChange = false;
            if (ModelState.IsValid)
            {
                if (Membership.ValidateUser(User.Identity.Name, model.OldPassword))
                {

                    // ChangePassword will throw an exception rather
                    // than return false in certain failure scenarios.
                    bool changePasswordSucceeded;
                    try
                    {
                        MembershipUser currentUser = Membership.GetUser(User.Identity.Name, userIsOnline: true);
                        changePasswordSucceeded = currentUser.ChangePassword(model.OldPassword, model.NewPassword);
                    }
                    catch (Exception ex)
                    {
                        if (ex.Message.Contains("Non alpha numeric characters in 'newPassword' needs to be greater than or equal to '1'."))
                            ModelState.AddModelError("", string.Format("The New Password does not meet the security requirements of {0} characters including {1} “special character”. Please correct and try again.", Membership.MinRequiredPasswordLength, Membership.MinRequiredNonAlphanumericCharacters));
                        changePasswordSucceeded = false;
                    }
                    if (changePasswordSucceeded)
                        return RedirectToAction("Index", "Home");

                }
                else
                {
                    ModelState.AddModelError("", "The Old Password entered is incorrect. Please re-enter the old password and try again.");
                }

            }

            // If we got this far, something failed, redisplay form
            return View(model);
        }

        //
        // GET: /Account/ChangePasswordSuccess

        public ActionResult ChangePasswordSuccess()
        {
            return View();
        }

        private IEnumerable<string> GetErrorsFromModelState()
        {
            return ModelState.SelectMany(x => x.Value.Errors.Select(error => error.ErrorMessage));
        }

        #region Status Codes
        private static string ErrorCodeToString(MembershipCreateStatus createStatus)
        {
            // See http://go.microsoft.com/fwlink/?LinkID=177550 for
            // a full list of status codes.
            switch (createStatus)
            {
                case MembershipCreateStatus.DuplicateUserName:
                    return "User name already exists. Please enter a different user name.";

                case MembershipCreateStatus.DuplicateEmail:
                    return "A user name for that e-mail address already exists. Please enter a different e-mail address.";

                case MembershipCreateStatus.InvalidPassword:
                    return "The password provided is invalid. Please enter a valid password value.";

                case MembershipCreateStatus.InvalidEmail:
                    return "The e-mail address provided is invalid. Please check the value and try again.";

                case MembershipCreateStatus.InvalidAnswer:
                    return "The password retrieval answer provided is invalid. Please check the value and try again.";

                case MembershipCreateStatus.InvalidQuestion:
                    return "The password retrieval question provided is invalid. Please check the value and try again.";

                case MembershipCreateStatus.InvalidUserName:
                    return "The user name provided is invalid. Please check the value and try again.";

                case MembershipCreateStatus.ProviderError:
                    return "The authentication provider returned an error. Please verify your entry and try again. If the problem persists, please contact your system administrator.";

                case MembershipCreateStatus.UserRejected:
                    return "The user creation request has been canceled. Please verify your entry and try again. If the problem persists, please contact your system administrator.";

                default:
                    return "An unknown error occurred. Please verify your entry and try again. If the problem persists, please contact your system administrator.";
            }
        }
        #endregion

        public ActionResult ManageUsers()
        {
            return PartialView();
        }
        public JsonResult GetApplicationRoles()
        {
            return Json(Roles.GetAllRoles(), JsonRequestBehavior.AllowGet);
        }
        //public ActionResult GetAllUsers()
        //{
        //    try
        //    {
        //        Sandler.Data.Repositories.IUnitOfWork uo = new Sandler.Data.Repositories.UnitOfWork("CCATDBEntities");
        //        var data = from m in uo.Repository<Sandler.Data.Models.aspnet_Membership>().GetAll()
        //                   from user in uo.Repository<Sandler.Data.Models.aspnet_Users>().GetAll().Where(userRecord => userRecord.UserId == m.UserId)
        //                   select new UserModel(user.UserId);
        //        return Json(data, JsonRequestBehavior.AllowGet); ;
        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }

        //}
        [HttpPost]
        public void UpdateUser(string userId, string firstName, string lastName, string email, string role, string roleEntityValue)
        {
            string userName = firstName.ToLower() + "." + lastName.ToLower();
            AccountProfile profile;
            if (!string.IsNullOrEmpty(userId))
            {
                profile = new AccountProfile(UserEntitiesDataFactory.GetUser(Guid.Parse(userId)).UserName);
                UserEntitiesDataFactory.UpdateUser(userId, email);
                UserEntitiesDataFactory.UpdateRole(userId, role);
            }
            else
            {
                if (UserEntitiesDataFactory.IsUserExits(userName))
                {
                    userName = UserEntitiesDataFactory.GetUsername(userName);
                }

                userId = UserEntitiesDataFactory.CreateUserWithRoles(userName, email, role).ToString();
                profile = new AccountProfile(userName);
            }

            profile.FirstName = firstName;
            profile.LastName = lastName;
            if (!string.IsNullOrEmpty(roleEntityValue))
                profile.RoleEntityValue = roleEntityValue;
        }
        
    }
    #region Original Code Genereted
    //[Authorize]
    //[InitializeSimpleMembership]
    //public class AccountController : Controller
    //{
    //    //
    //    // GET: /Account/Login

    //    [AllowAnonymous]
    //    public ActionResult Login(string returnUrl)
    //    {
    //        ViewBag.ReturnUrl = returnUrl;
    //        return View();
    //    }

    //    //
    //    // POST: /Account/Login

    //    [HttpPost]
    //    [AllowAnonymous]
    //    [ValidateAntiForgeryToken]
    //    public ActionResult Login(LoginModel model, string returnUrl)
    //    {
    //        if (ModelState.IsValid && WebSecurity.Login(model.UserName, model.Password, persistCookie: model.RememberMe))
    //        {
    //            return RedirectToLocal(returnUrl);
    //        }

    //        // If we got this far, something failed, redisplay form
    //        ModelState.AddModelError("", "The user name or password provided is incorrect.");
    //        return View(model);
    //    }

    //    //
    //    // POST: /Account/LogOff

    //    [HttpPost]
    //    [ValidateAntiForgeryToken]
    //    public ActionResult LogOff()
    //    {
    //        WebSecurity.Logout();

    //        return RedirectToAction("Index", "Home");
    //    }

    //    //
    //    // GET: /Account/Register

    //    [AllowAnonymous]
    //    public ActionResult Register()
    //    {
    //        return View();
    //    }

    //    //
    //    // POST: /Account/Register

    //    [HttpPost]
    //    [AllowAnonymous]
    //    [ValidateAntiForgeryToken]
    //    public ActionResult Register(RegisterModel model)
    //    {
    //        if (ModelState.IsValid)
    //        {
    //            // Attempt to register the user
    //            try
    //            {
    //                WebSecurity.CreateUserAndAccount(model.UserName, model.Password);
    //                WebSecurity.Login(model.UserName, model.Password);
    //                return RedirectToAction("Index", "Home");
    //            }
    //            catch (MembershipCreateUserException e)
    //            {
    //                ModelState.AddModelError("", ErrorCodeToString(e.StatusCode));
    //            }
    //        }

    //        // If we got this far, something failed, redisplay form
    //        return View(model);
    //    }

    //    //
    //    // POST: /Account/Disassociate

    //    [HttpPost]
    //    [ValidateAntiForgeryToken]
    //    public ActionResult Disassociate(string provider, string providerUserId)
    //    {
    //        string ownerAccount = OAuthWebSecurity.GetUserName(provider, providerUserId);
    //        ManageMessageId? message = null;

    //        // Only disassociate the account if the currently logged in user is the owner
    //        if (ownerAccount == User.Identity.Name)
    //        {
    //            // Use a transaction to prevent the user from deleting their last login credential
    //            using (var scope = new TransactionScope(TransactionScopeOption.Required, new TransactionOptions { IsolationLevel = IsolationLevel.Serializable }))
    //            {
    //                bool hasLocalAccount = OAuthWebSecurity.HasLocalAccount(WebSecurity.GetUserId(User.Identity.Name));
    //                if (hasLocalAccount || OAuthWebSecurity.GetAccountsFromUserName(User.Identity.Name).Count > 1)
    //                {
    //                    OAuthWebSecurity.DeleteAccount(provider, providerUserId);
    //                    scope.Complete();
    //                    message = ManageMessageId.RemoveLoginSuccess;
    //                }
    //            }
    //        }

    //        return RedirectToAction("Manage", new { Message = message });
    //    }

    //    //
    //    // GET: /Account/Manage

    //    public ActionResult Manage(ManageMessageId? message)
    //    {
    //        ViewBag.StatusMessage =
    //            message == ManageMessageId.ChangePasswordSuccess ? "Your password has been changed."
    //            : message == ManageMessageId.SetPasswordSuccess ? "Your password has been set."
    //            : message == ManageMessageId.RemoveLoginSuccess ? "The external login was removed."
    //            : "";
    //        ViewBag.HasLocalPassword = OAuthWebSecurity.HasLocalAccount(WebSecurity.GetUserId(User.Identity.Name));
    //        ViewBag.ReturnUrl = Url.Action("Manage");
    //        return View();
    //    }

    //    //
    //    // POST: /Account/Manage

    //    [HttpPost]
    //    [ValidateAntiForgeryToken]
    //    public ActionResult Manage(LocalPasswordModel model)
    //    {
    //        bool hasLocalAccount = OAuthWebSecurity.HasLocalAccount(WebSecurity.GetUserId(User.Identity.Name));
    //        ViewBag.HasLocalPassword = hasLocalAccount;
    //        ViewBag.ReturnUrl = Url.Action("Manage");
    //        if (hasLocalAccount)
    //        {
    //            if (ModelState.IsValid)
    //            {
    //                // ChangePassword will throw an exception rather than return false in certain failure scenarios.
    //                bool changePasswordSucceeded;
    //                try
    //                {
    //                    changePasswordSucceeded = WebSecurity.ChangePassword(User.Identity.Name, model.OldPassword, model.NewPassword);
    //                }
    //                catch (Exception)
    //                {
    //                    changePasswordSucceeded = false;
    //                }

    //                if (changePasswordSucceeded)
    //                {
    //                    return RedirectToAction("Manage", new { Message = ManageMessageId.ChangePasswordSuccess });
    //                }
    //                else
    //                {
    //                    ModelState.AddModelError("", "The current password is incorrect or the new password is invalid.");
    //                }
    //            }
    //        }
    //        else
    //        {
    //            // User does not have a local password so remove any validation errors caused by a missing
    //            // OldPassword field
    //            ModelState state = ModelState["OldPassword"];
    //            if (state != null)
    //            {
    //                state.Errors.Clear();
    //            }

    //            if (ModelState.IsValid)
    //            {
    //                try
    //                {
    //                    WebSecurity.CreateAccount(User.Identity.Name, model.NewPassword);
    //                    return RedirectToAction("Manage", new { Message = ManageMessageId.SetPasswordSuccess });
    //                }
    //                catch (Exception)
    //                {
    //                    ModelState.AddModelError("", String.Format("Unable to create local account. An account with the name \"{0}\" may already exist.", User.Identity.Name));
    //                }
    //            }
    //        }

    //        // If we got this far, something failed, redisplay form
    //        return View(model);
    //    }

    //    //
    //    // POST: /Account/ExternalLogin

    //    [HttpPost]
    //    [AllowAnonymous]
    //    [ValidateAntiForgeryToken]
    //    public ActionResult ExternalLogin(string provider, string returnUrl)
    //    {
    //        return new ExternalLoginResult(provider, Url.Action("ExternalLoginCallback", new { ReturnUrl = returnUrl }));
    //    }

    //    //
    //    // GET: /Account/ExternalLoginCallback

    //    [AllowAnonymous]
    //    public ActionResult ExternalLoginCallback(string returnUrl)
    //    {
    //        AuthenticationResult result = OAuthWebSecurity.VerifyAuthentication(Url.Action("ExternalLoginCallback", new { ReturnUrl = returnUrl }));
    //        if (!result.IsSuccessful)
    //        {
    //            return RedirectToAction("ExternalLoginFailure");
    //        }

    //        if (OAuthWebSecurity.Login(result.Provider, result.ProviderUserId, createPersistentCookie: false))
    //        {
    //            return RedirectToLocal(returnUrl);
    //        }

    //        if (User.Identity.IsAuthenticated)
    //        {
    //            // If the current user is logged in add the new account
    //            OAuthWebSecurity.CreateOrUpdateAccount(result.Provider, result.ProviderUserId, User.Identity.Name);
    //            return RedirectToLocal(returnUrl);
    //        }
    //        else
    //        {
    //            // User is new, ask for their desired membership name
    //            string loginData = OAuthWebSecurity.SerializeProviderUserId(result.Provider, result.ProviderUserId);
    //            ViewBag.ProviderDisplayName = OAuthWebSecurity.GetOAuthClientData(result.Provider).DisplayName;
    //            ViewBag.ReturnUrl = returnUrl;
    //            return View("ExternalLoginConfirmation", new RegisterExternalLoginModel { UserName = result.UserName, ExternalLoginData = loginData });
    //        }
    //    }

    //    //
    //    // POST: /Account/ExternalLoginConfirmation

    //    [HttpPost]
    //    [AllowAnonymous]
    //    [ValidateAntiForgeryToken]
    //    public ActionResult ExternalLoginConfirmation(RegisterExternalLoginModel model, string returnUrl)
    //    {
    //        string provider = null;
    //        string providerUserId = null;

    //        if (User.Identity.IsAuthenticated || !OAuthWebSecurity.TryDeserializeProviderUserId(model.ExternalLoginData, out provider, out providerUserId))
    //        {
    //            return RedirectToAction("Manage");
    //        }

    //        if (ModelState.IsValid)
    //        {
    //            // Insert a new user into the database
    //            using (UsersContext db = new UsersContext())
    //            {
    //                UserProfile user = db.UserProfiles.FirstOrDefault(u => u.UserName.ToLower() == model.UserName.ToLower());
    //                // Check if user already exists
    //                if (user == null)
    //                {
    //                    // Insert name into the profile table
    //                    db.UserProfiles.Add(new UserProfile { UserName = model.UserName });
    //                    db.SaveChanges();

    //                    OAuthWebSecurity.CreateOrUpdateAccount(provider, providerUserId, model.UserName);
    //                    OAuthWebSecurity.Login(provider, providerUserId, createPersistentCookie: false);

    //                    return RedirectToLocal(returnUrl);
    //                }
    //                else
    //                {
    //                    ModelState.AddModelError("UserName", "User name already exists. Please enter a different user name.");
    //                }
    //            }
    //        }

    //        ViewBag.ProviderDisplayName = OAuthWebSecurity.GetOAuthClientData(provider).DisplayName;
    //        ViewBag.ReturnUrl = returnUrl;
    //        return View(model);
    //    }

    //    //
    //    // GET: /Account/ExternalLoginFailure

    //    [AllowAnonymous]
    //    public ActionResult ExternalLoginFailure()
    //    {
    //        return View();
    //    }

    //    [AllowAnonymous]
    //    [ChildActionOnly]
    //    public ActionResult ExternalLoginsList(string returnUrl)
    //    {
    //        ViewBag.ReturnUrl = returnUrl;
    //        return PartialView("_ExternalLoginsListPartial", OAuthWebSecurity.RegisteredClientData);
    //    }

    //    [ChildActionOnly]
    //    public ActionResult RemoveExternalLogins()
    //    {
    //        ICollection<OAuthAccount> accounts = OAuthWebSecurity.GetAccountsFromUserName(User.Identity.Name);
    //        List<ExternalLogin> externalLogins = new List<ExternalLogin>();
    //        foreach (OAuthAccount account in accounts)
    //        {
    //            AuthenticationClientData clientData = OAuthWebSecurity.GetOAuthClientData(account.Provider);

    //            externalLogins.Add(new ExternalLogin
    //            {
    //                Provider = account.Provider,
    //                ProviderDisplayName = clientData.DisplayName,
    //                ProviderUserId = account.ProviderUserId,
    //            });
    //        }

    //        ViewBag.ShowRemoveButton = externalLogins.Count > 1 || OAuthWebSecurity.HasLocalAccount(WebSecurity.GetUserId(User.Identity.Name));
    //        return PartialView("_RemoveExternalLoginsPartial", externalLogins);
    //    }

    //    #region Helpers
    //    private ActionResult RedirectToLocal(string returnUrl)
    //    {
    //        if (Url.IsLocalUrl(returnUrl))
    //        {
    //            return Redirect(returnUrl);
    //        }
    //        else
    //        {
    //            return RedirectToAction("Index", "Home");
    //        }
    //    }

    //    public enum ManageMessageId
    //    {
    //        ChangePasswordSuccess,
    //        SetPasswordSuccess,
    //        RemoveLoginSuccess,
    //    }

    //    internal class ExternalLoginResult : ActionResult
    //    {
    //        public ExternalLoginResult(string provider, string returnUrl)
    //        {
    //            Provider = provider;
    //            ReturnUrl = returnUrl;
    //        }

    //        public string Provider { get; private set; }
    //        public string ReturnUrl { get; private set; }

    //        public override void ExecuteResult(ControllerContext context)
    //        {
    //            OAuthWebSecurity.RequestAuthentication(Provider, ReturnUrl);
    //        }
    //    }

    //    private static string ErrorCodeToString(MembershipCreateStatus createStatus)
    //    {
    //        // See http://go.microsoft.com/fwlink/?LinkID=177550 for
    //        // a full list of status codes.
    //        switch (createStatus)
    //        {
    //            case MembershipCreateStatus.DuplicateUserName:
    //                return "User name already exists. Please enter a different user name.";

    //            case MembershipCreateStatus.DuplicateEmail:
    //                return "A user name for that e-mail address already exists. Please enter a different e-mail address.";

    //            case MembershipCreateStatus.InvalidPassword:
    //                return "The password provided is invalid. Please enter a valid password value.";

    //            case MembershipCreateStatus.InvalidEmail:
    //                return "The e-mail address provided is invalid. Please check the value and try again.";

    //            case MembershipCreateStatus.InvalidAnswer:
    //                return "The password retrieval answer provided is invalid. Please check the value and try again.";

    //            case MembershipCreateStatus.InvalidQuestion:
    //                return "The password retrieval question provided is invalid. Please check the value and try again.";

    //            case MembershipCreateStatus.InvalidUserName:
    //                return "The user name provided is invalid. Please check the value and try again.";

    //            case MembershipCreateStatus.ProviderError:
    //                return "The authentication provider returned an error. Please verify your entry and try again. If the problem persists, please contact your system administrator.";

    //            case MembershipCreateStatus.UserRejected:
    //                return "The user creation request has been canceled. Please verify your entry and try again. If the problem persists, please contact your system administrator.";

    //            default:
    //                return "An unknown error occurred. Please verify your entry and try again. If the problem persists, please contact your system administrator.";
    //        }
    //    }
    //    #endregion
    //}
    #endregion
}

