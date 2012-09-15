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
public partial class Account_FranchiseeOwner_Index : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            addFranchiseeLink.Visible = !IsUserReadOnly(SandlerModels.SandlerUserActions.Add, SandlerModels.SandlerEntities.Franchisee);
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
            RegionRepository regions = new RegionRepository();
            RolesRepository roles = new RolesRepository();
            var franchisees = from franchisee in franchiseeSource.GetAll().Where(f => f.IsActive == true && f.CoachID == CurrentUser.CoachID).AsQueryable()
                          from franchiseeUser in franchiseeUsersSource.GetAll().Where(fu => fu.FranchiseeID == franchisee.ID)
                          from user in users.GetAll().Where(u => u.UserId == franchiseeUser.UserID && Roles.IsUserInRole(u.UserName, SandlerModels.SandlerRoles.FranchiseeOwner.ToString()) == true).AsQueryable()
                          from membership in memberships.GetAll().Where(m => m.IsApproved == true && m.UserId == user.UserId).AsQueryable()
                          select new 
                          {
                              Address1 = franchisee.Address1,
                              Address2 = franchisee.Address2,
                              City = franchisee.City,
                              CoachID = franchisee.CoachID,
                              FaxNumber = franchisee.FaxNumber,
                              FrOwnerFirstName = franchiseeUser.FirstName,
                              FrOwnerLastName = franchiseeUser.LastName,
                              ID = franchisee.ID,
                              Name = franchisee.Name,
                              PhoneNumber = franchisee.PhoneNumber,
                              State = franchisee.State,
                              WebAddress = franchisee.WebAddress,
                              Zip = franchisee.Zip,
                              CreatedBy = franchisee.CreatedBy.ToString(),
                              UserName = user.UserName,
                              Email = membership.Email,
                              UserId = user.UserId
                          };

            TotalRecords = franchisees.Count();

            gvFranchiseeOwners.DataSource = IQueryableExtensions.Page(franchisees, PageSize, CurrentPage).AsQueryable();
            gvFranchiseeOwners.DataBind();


            pager.BindPager(TotalRecords, PageSize, CurrentPage);
        }
        catch (Exception ex)
        {
        }
    }
}