using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SandlerViewModels;
using SandlerRepositories;
using SandlerData;
using System.Configuration;
using System.Web.Security;
public partial class Account_FranchiseeUser_Index : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            addFranchiseeUserLink.Visible = !IsUserReadOnly(SandlerModels.SandlerUserActions.Add, SandlerModels.SandlerEntities.FranchiseeUser);
            if (!string.IsNullOrEmpty(Request.QueryString["currentPage"]))
                CurrentPage = int.Parse(Request.QueryString["currentPage"]);
            BindFranchiseeOwners();
        }

    }

    private void BindFranchiseeOwners()
    {

        
        try
        {
            
            FranchiseeRepository franchiseeSource = new FranchiseeRepository();
            UsersRepository users = new UsersRepository();
            MembershipRepository memberships = new MembershipRepository();
            FranchiseeUsersRepository franchiseeUsersSource = new FranchiseeUsersRepository();
            RolesRepository roles = new RolesRepository();
            var franchiseeUsers = from franchiseeUser in franchiseeUsersSource.GetAll().Where(fu => fu.FranchiseeID == CurrentUser.FranchiseeID).AsQueryable()
                          from user in users.GetAll().Where(u => u.UserId == franchiseeUser.UserID && Roles.IsUserInRole(u.UserName, SandlerModels.SandlerRoles.FranchiseeUser.ToString()) == true).AsQueryable()
                          from membership in memberships.GetAll().Where(m => m.IsApproved == true && m.UserId == user.UserId).AsQueryable()
                          select new 
                          {
                              FirstName = franchiseeUser.FirstName,
                              LastName = franchiseeUser.LastName,
                              ID = franchiseeUser.FranchiseeID,
                              ContactNumber = franchiseeUser.ContactNumber,
                              City = franchiseeUser.City,
                              State = franchiseeUser.State,
                              Zip = franchiseeUser.Zip,
                              UserName = user.UserName,
                              Email = membership.Email,
                              UserId = user.UserId
                          };

            TotalRecords = franchiseeUsers.Count();

            gvFranchiseeOwners.DataSource = IQueryableExtensions.Page(franchiseeUsers, PageSize, CurrentPage).AsQueryable();
            gvFranchiseeOwners.DataBind();


            pager.BindPager(TotalRecords, PageSize, CurrentPage);
        }
        catch (Exception ex)
        {
        }
    }
}